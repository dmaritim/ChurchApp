package daniel.maritim.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import daniel.maritim.entity.Household;



public interface HouseholdRepository extends JpaRepository<Household, Long> {

}
