package daniel.maritim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import daniel.maritim.entity.Household;
import daniel.maritim.service.HouseholdService;

@Controller
public class AppController {
	@Autowired
	private HouseholdService service;
	
	@RequestMapping("/")
	public String viewHomePage(Model model) {
		List<Household> listHouseholds = service.listAll();
		model.addAttribute("listHouseholds", listHouseholds);
		
		return "index";
	}
	
	@RequestMapping("/new")
	public String showNewHouseholdForm(Model model) {
		Household Household = new Household();
		model.addAttribute("Household", Household);
		
		return "new_Household";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveHousehold(@ModelAttribute("Household") Household Household) {
		service.save(Household);
		
		return "redirect:/";
	}
	
	@RequestMapping("/edit/{id}")
	public ModelAndView showEditHouseholdForm(@PathVariable(name = "id") Long id) {
		ModelAndView mav = new ModelAndView("edit_Household");
		
		Household Household = service.get(id);
		mav.addObject("Household", Household);
		
		return mav;
	}	
	
	@RequestMapping("/delete/{id}")
	public String deleteHousehold(@PathVariable(name = "id") Long id) {
		service.delete(id);
		
		return "redirect:/";
	}
}
