package daniel.maritim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import daniel.maritim.entity.Household;
import daniel.maritim.repository.HouseholdRepository;



@Service
public class HouseholdService {
	@Autowired
	private HouseholdRepository repo;
	
	public List<Household> listAll() {		
		return repo.findAll();
	}
	
	public void save(Household Household) {
		repo.save(Household);
	}
	
	public Household get(Long id) {
		return repo.findById(id).get();
	}
	
	public void delete(Long id) {
		repo.deleteById(id);
	}
}
