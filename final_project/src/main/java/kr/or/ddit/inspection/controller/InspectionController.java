package kr.or.ddit.inspection.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kr.or.ddit.inspection.service.InspectionService;
import kr.or.ddit.inspection.vo.InspectionVO;
import kr.or.ddit.security.CustomUser;

@Controller
public class InspectionController {
	private static final Logger logger = 
			LoggerFactory.getLogger(InspectionController.class);
	@Autowired
	InspectionService inspectionService;
	
	@GetMapping("/inspection")
	public String main(Model model,Authentication auth) {
		CustomUser user = (CustomUser) auth.getPrincipal();
		Gson gson = new GsonBuilder().create();
		
		model.addAttribute("inspWaitList", gson.toJson(inspectionService.inspWaitList(user.getUsername())));
		
		return "inspection/inspection";
	}
	
	@PostMapping("/inspection")
	@ResponseBody
	public List<InspectionVO> inspList(String treatCd) {
		
		List<InspectionVO> inspList = this.inspectionService.inspList(treatCd);
		return inspList;
	}
	
	@ResponseBody
	@PostMapping("/SaveInspFile")
	public int saveInspFile(@RequestParam(required = false) String saveList) throws JsonMappingException, JsonProcessingException {
//		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>> paramMap = new ObjectMapper().readValue(saveList, new TypeReference<List<Map<String, Object>>>(){});
		logger.info(paramMap.toString());
		int result = 0;
		
		for(int i = 0; i < paramMap.size(); i++) {
			logger.info(paramMap.get(i).toString());
			if(paramMap.get(i).isEmpty()) {
				continue;
			}
			List<String> imgs = (List<String>) paramMap.get(i).get("base64img");
			for(int j = 0; j < imgs.size(); j++) {
				InspectionVO vo = new InspectionVO();
				vo.setEmpCd((String) paramMap.get(i).get("empCd"));
				vo.setInspNm((String)paramMap.get(i).get("inspNm"));
				vo.setInspTypeCd((String)paramMap.get(i).get("inspTypeCd"));
				vo.setInspAmt(Integer.parseInt((String)paramMap.get(i).get("inspAmt")));
				vo.setInspCd((String)paramMap.get(i).get("inspCd"));
				vo.setInspDt((String)paramMap.get(i).get("inspDt"));
				vo.setTreatCd((String)paramMap.get(i).get("treatCd"));
				vo.setRcptNo((String)paramMap.get(i).get("rcptNo"));
				vo.setBase64img(imgs.get(j));
				result += this.inspectionService.insertInspFile(vo);
				result += this.inspectionService.updateInsp(vo);
				if(j==0) {
					result += this.inspectionService.insertInspItems(vo);
				}
			}
		}
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/osDaegi")
	public boolean osDaegi(String pntCd) {
		int result = this.inspectionService.osDaegi(pntCd);
		if(result > 0) {
			return true;
		}
		return false;
	}
}
