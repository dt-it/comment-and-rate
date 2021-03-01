package pl.dtit.commentandrate.domain.api;

import pl.dtit.commentandrate.domain.comment.Comment;
import pl.dtit.commentandrate.domain.comment.CommentDao;
import pl.dtit.commentandrate.domain.discovery.DiscoveryDao;
import pl.dtit.commentandrate.domain.user.User;
import pl.dtit.commentandrate.domain.user.UserDao;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class DiscoveryCommentService {
    CommentDao commentDao = new CommentDao();
    CommentMapper commentMapper = new CommentMapper();

    public void addComment(DiscoveryComment comment){
        Comment commentToAdd = commentMapper.map(comment);
        commentDao.save(commentToAdd);
    }

    public List<DiscoveryComment> findAll() {
        return commentDao.findAll()
                .stream().map(commentMapper::map)
                .collect(Collectors.toList());
    }

    public List<DiscoveryComment> findCommentByDiscoveryId(int discoveryId) {
        return commentDao.findCommentByDiscoveryId(discoveryId)
                .stream().map(commentMapper::map)
                .collect(Collectors.toList());
    }

    private static class CommentMapper {
        private final UserDao userDao = new UserDao();
        private final DiscoveryDao discoveryDao = new DiscoveryDao();

        Comment map (DiscoveryComment comment){
            Optional<User> user = userDao.findByUsername(comment.getUsername());
            Integer userId = user.orElseThrow().getId();
            Integer discoveryId = comment.getDiscoveryId();
            String message = comment.getMessage();
            LocalDateTime dateAdded = LocalDateTime.now();
            return new Comment(userId, discoveryId, message, dateAdded);
        }

        DiscoveryComment map(Comment c) {
            return new DiscoveryComment(
                    userDao.findById(c.getUserId()).orElseThrow().getUsername(),
                    c.getDiscoveryId(),
                    c.getMessage(), c.getDateAdded()
            );

        }
    }
}
