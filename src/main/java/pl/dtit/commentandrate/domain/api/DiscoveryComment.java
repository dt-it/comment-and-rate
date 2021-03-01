package pl.dtit.commentandrate.domain.api;

import java.time.LocalDateTime;

public class DiscoveryComment {
    private String username;
    private Integer discoveryId;
    private String message;
    private LocalDateTime dateAdded;

    public DiscoveryComment(String username, Integer discoveryId, String message, LocalDateTime dateAdded) {
        this.username = username;
        this.discoveryId = discoveryId;
        this.message = message;
        this.dateAdded = dateAdded;
    }

    public String getUsername() {
        return username;
    }

    public Integer getDiscoveryId() {
        return discoveryId;
    }

    public String getMessage() {
        return message;
    }

    public LocalDateTime getDateAdded() {
        return dateAdded;
    }

}
