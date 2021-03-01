package pl.dtit.commentandrate.domain.comment;

import java.time.LocalDateTime;

public class Comment {
    private Integer id;
    private Integer userId;
    private Integer discoveryId;
    private String message;
    private LocalDateTime dateAdded;

    public Comment(Integer userId, Integer discoveryId, String message, LocalDateTime dateAdded) {
        this.userId = userId;
        this.discoveryId = discoveryId;
        this.message = message;
        this.dateAdded = dateAdded;
    }

    public Comment(Integer id, Integer userId, Integer discoveryId, String message, LocalDateTime dateAdded) {
        this(userId, discoveryId, message, dateAdded);
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getDiscoveryId() {
        return discoveryId;
    }

    public void setDiscoveryId(Integer discoveryId) {
        this.discoveryId = discoveryId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LocalDateTime getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(LocalDateTime dateAdded) {
        this.dateAdded = dateAdded;
    }
}
