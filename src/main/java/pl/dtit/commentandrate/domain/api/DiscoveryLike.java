package pl.dtit.commentandrate.domain.api;

import pl.dtit.commentandrate.domain.likes.Like;

public class DiscoveryLike {
    private String username;
    private Integer discoveryId;
    private String type;

    public DiscoveryLike(String username, Integer discoveryId, String type) {
        this.username = username;
        this.discoveryId = discoveryId;
        this.type = type;
    }

    public String getUserName() {
        return username;
    }

    public Integer getDiscoveryId() {
        return discoveryId;
    }

    public String getType() {
        return type;
    }
}
