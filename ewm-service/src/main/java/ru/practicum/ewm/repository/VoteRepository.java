package ru.practicum.ewm.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import ru.practicum.ewm.model.Event;
import ru.practicum.ewm.model.Vote;

import java.util.List;

@Repository
public interface VoteRepository extends JpaRepository<Vote, Long> {

    @Query("select v.event from Vote v where v.isPositive = ?1 order by v.event.id asc")
    List<Event> findWithBooleanTopAsc(boolean isPositive, Pageable pageable);

    @Query("select v.event from Vote v where v.isPositive = ?1 order by v.event.id desc")
    List<Event> findWithBooleanTopDesc(boolean isPositive, Pageable pageable);

    @Query("select v.event from Vote v order by v.event.id asc")
    List<Event> findTopAsc(Pageable pageable);

    @Query("select v.event from Vote v order by v.event.id desc")
    List<Event> findTopDesc(Pageable pageable);

    @Query("select v from Vote v where v.user.id = ?1 and v.event.id = ?2")
    Vote findVoteByUserIdAndEventId(Long userId, Long eventId);
}