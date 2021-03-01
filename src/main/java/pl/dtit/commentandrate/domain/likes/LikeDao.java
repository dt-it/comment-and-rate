package pl.dtit.commentandrate.domain.likes;

import pl.dtit.commentandrate.domain.common.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeDao extends BaseDao {
    public void saveLike(Like like){
        final String query = """
                INSERT INTO
                likes (user_id, discovery_id, type)
                VALUES
                (?,?,?)
                ON DUPLICATE KEY UPDATE
                type=?
                """;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
                ){
            statement.setInt(1, like.getUserId());
            statement.setInt(2, like.getDiscoveryId());
            statement.setString(3, like.getType().toString());
            statement.setString(4, like.getType().toString());
            statement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
