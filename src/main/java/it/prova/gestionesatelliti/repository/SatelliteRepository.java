package it.prova.gestionesatelliti.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import it.prova.gestionesatelliti.model.Satellite;
import it.prova.gestionesatelliti.model.StatoSatellite;


public interface SatelliteRepository extends CrudRepository<Satellite, Long>{

	
	List <Satellite> findAllByStatoNotAndDataLancioLessThan(StatoSatellite stato, Date date);
	
	List<Satellite> findAllByStatoIsAndDataRientroIsNull(StatoSatellite stato);
	
	List<Satellite>findAllByDataLancioIsLessThanAndStatoIs(Date date, StatoSatellite stato);
}
