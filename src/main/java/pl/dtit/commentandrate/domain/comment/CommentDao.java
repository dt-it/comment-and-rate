package pl.dtit.commentandrate.domain.comment;

import pl.dtit.commentandrate.domain.common.BaseDao;
import pl.dtit.commentandrate.domain.discovery.Discovery;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CommentDao extends BaseDao {

    public List<Comment> findAll() {
        final String query = """
                SELECT
                    id, user_id, discovery_id, message, date_added
                FROM
                    comment c
                """;
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(query);
            List<Comment> allComments = new ArrayList<>();
            while (resultSet.next()) {
                Comment comment = mapRow(resultSet);
                allComments.add(comment);
            }
            return allComments;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Comment> findCommentByDiscoveryId(int discoveryId) {
        final String query = """
                SELECT
                    id, user_id, discovery_id, message, date_added
                FROM
                    comment
                WHERE
                    discovery_id=?
                """;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, discoveryId);
            ResultSet resultSet = statement.executeQuery();
            List<Comment> comments = new ArrayList<>();
            while (resultSet.next()) {
                Comment comment = mapRow(resultSet);
                if (comment.getDiscoveryId() == discoveryId){
                    comments.add(comment);
                }
            }
            return comments;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void save(Comment comment) {
        final String query = """
                INSERT INTO
                comment(user_id, discovery_id, message, date_added)
                VALUES
                (?,?,?,?)
                """;
        try (
                Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)
        ) {
            statement.setInt(1, comment.getUserId());
            statement.setInt(2, comment.getDiscoveryId());
            statement.setString(3, comment.getMessage());
            statement.setObject(4, comment.getDateAdded());
            statement.executeUpdate();

            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                comment.setId(generatedKeys.getInt(1));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    private static Comment mapRow(ResultSet set) throws SQLException {
        int commentId = set.getInt("id");
        int userId = set.getInt("user_id");
        int discoveryId = set.getInt("discovery_id");
        String message = set.getString("message");
        LocalDateTime dateAdded = set.getTimestamp("date_added").toLocalDateTime();
        return new Comment(commentId, userId, discoveryId, message, dateAdded);
    }
}
