package it.prova.gestionesatelliti.web.controller;

import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import it.prova.gestionesatelliti.model.Satellite;
import it.prova.gestionesatelliti.model.StatoSatellite;
import it.prova.gestionesatelliti.service.SatelliteService;

@Controller
@RequestMapping(value = "/satellite")
public class SatelliteController {

	@Autowired
	private SatelliteService satelliteService;
	
	@GetMapping
	public ModelAndView listAll() {
		ModelAndView mv = new ModelAndView();
		List<Satellite> results = satelliteService.listAllElements();
		mv.addObject("satellite_list_attribute", results);
		mv.setViewName("satellite/list");
		return mv;
	}
	
	@GetMapping("/search")
	public String search() {
		return "satellite/search";
	}

	@PostMapping("/list")
	public String listByExample(Satellite example, ModelMap model) {
		List<Satellite> results = satelliteService.findByExample(example);
		model.addAttribute("satellite_list_attribute", results);
		return "satellite/list";
	}
	
	@GetMapping("/listByNonDisattivatiDaDueAnni")
	public String listByNonDisattivatiDaDueAnni(ModelMap model) {
		List<Satellite> results = satelliteService.findSatellitiDisattivatiELanciatiDueAnniFa();
		model.addAttribute("satellite_list_attribute", results);
		return "satellite/list";
	}
	
	@GetMapping("/listByDisattivatiNonRientrati")
	public String listByDisattivatiNonRientrati(ModelMap model) {
		List<Satellite> results = satelliteService.findSatellitiDisattivatiNonAncoraRientrati();
		model.addAttribute("satellite_list_attribute", results);
		return "satellite/list";
	}
	
	@GetMapping("/listByFissiInOrbitaDaDieciAnni")
	public String listByFissiInOrbitaDaDieciAnni(ModelMap model) {
		List<Satellite> results = satelliteService.findSatellitiFissiInOrbitaDaDieciAnni();
		model.addAttribute("satellite_list_attribute", results);
		return "satellite/list";
	}

	@GetMapping("/insert")
	public String create(Model model) {
		model.addAttribute("insert_satellite_attr", new Satellite());
		return "satellite/insert";
	}

	@PostMapping("/save")
	public String save(@Valid @ModelAttribute("insert_satellite_attr") Satellite satellite, BindingResult result,
			RedirectAttributes redirectAttrs) {

		if (result.hasErrors())
			return "satellite/insert";

		satelliteService.inserisciNuovo(satellite);

		redirectAttrs.addFlashAttribute("successMessage", "Operazione eseguita correttamente");
		return "redirect:/satellite";
	}
	
	@GetMapping("/preparedelete/{idSatellite}")
	public String remove(Model model, @PathVariable(required = true) Long idSatellite) {
		model.addAttribute("delete_satellite_attr", satelliteService.caricaSingoloElemento(idSatellite));
		return "satellite/delete";
	}

	@PostMapping("/delete/{idSatellite}")
	public String delete(@PathVariable(required = true) Long idSatellite, Model model,
			RedirectAttributes redirectAttrs) {

		satelliteService.rimuovi(satelliteService.caricaSingoloElemento(idSatellite));
		redirectAttrs.addFlashAttribute("successMessage", "Operazione eseguita correttamente");
		return "redirect:/satellite";
	}

	@GetMapping("prepareupdate/{idSatellite}")
	public String infoupdate(Model model, @PathVariable(required = true) Long idSatellite) {
		model.addAttribute("update_satellite_attr", satelliteService.caricaSingoloElemento(idSatellite));
		return "satellite/update";
	}

	@PostMapping("/update/{idSatellite}")
	public String update(@Valid @ModelAttribute("update_satellite_attr") Satellite daModificare, BindingResult result,
			@PathVariable(required = true) Long idSatellite, Model model, RedirectAttributes redirectAttrs) {

		daModificare.setId(idSatellite);

		if (result.hasErrors())
			return "satellite/insert";
		
		satelliteService.aggiorna(daModificare);
		redirectAttrs.addFlashAttribute("successMessage", "Operazione eseguita correttamente");
		return "redirect:/satellite";
	}

	@GetMapping("/show/{idSatellite}")
	public String show(@PathVariable(required = true) Long idSatellite, Model model) {
		model.addAttribute("show_satellite_attr", satelliteService.caricaSingoloElemento(idSatellite));
		return "satellite/show";
	}
	
}
