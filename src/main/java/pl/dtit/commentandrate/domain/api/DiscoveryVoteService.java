package pl.dtit.commentandrate.domain.api;

import pl.dtit.commentandrate.domain.user.User;
import pl.dtit.commentandrate.domain.user.UserDao;
import pl.dtit.commentandrate.domain.vote.Vote;
import pl.dtit.commentandrate.domain.vote.VoteDao;

import java.time.LocalDateTime;
import java.util.Optional;

public class DiscoveryVoteService {
    VoteDao voteDao = new VoteDao();
    VoteMapper voteMapper = new VoteMapper();

    public void addVote(DiscoveryVote vote){
        Vote voteToSave = voteMapper.map(vote);
        voteDao.save(voteToSave);
    }

    private static class VoteMapper {
        private final UserDao userDao = new UserDao();

        private Vote map (DiscoveryVote vote){
            Optional<User> user = userDao.findByUsername(vote.getUsername());
            Integer userId = user.orElseThrow().getId();
            Integer discoveryId = vote.getDiscoveryId();
            Vote.Type type = Vote.Type.valueOf(vote.getType());
            LocalDateTime dateAdded = LocalDateTime.now();
            return new Vote(userId, discoveryId, type, dateAdded);
        }
    }
}
