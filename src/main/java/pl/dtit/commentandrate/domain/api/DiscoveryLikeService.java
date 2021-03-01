package pl.dtit.commentandrate.domain.api;

import pl.dtit.commentandrate.domain.likes.Like;
import pl.dtit.commentandrate.domain.likes.LikeDao;
import pl.dtit.commentandrate.domain.user.User;
import pl.dtit.commentandrate.domain.user.UserDao;

import java.util.Optional;

public class DiscoveryLikeService {
    LikeDao likeDao = new LikeDao();
    DiscoveryLikeMapper likeMapper = new DiscoveryLikeMapper();

    public void addLike(DiscoveryLike discoveryLike){
        Like like = likeMapper.map(discoveryLike);
        likeDao.saveLike(like);
    }

    private static class DiscoveryLikeMapper{
        private final UserDao userDao = new UserDao();

        Like map(DiscoveryLike like){
            Optional<User> userId = userDao.findByUsername(like.getUserName());
            Integer discoveryId = like.getDiscoveryId();
            Like.Type type = Like.Type.valueOf(like.getType());
            return new Like(userId.orElseThrow().getId(), discoveryId, type);
        }
    }
}
