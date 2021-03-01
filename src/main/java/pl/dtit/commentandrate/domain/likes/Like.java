package pl.dtit.commentandrate.domain.likes;

public class Like {
    private Integer userId;
    private Integer discoveryId;
    private Type type;

    public Like(Integer userId, Integer discoveryId, Type type) {
        this.userId = userId;
        this.discoveryId = discoveryId;
        this.type = type;
    }

    public Integer getUserId() {
        return userId;
    }

    public Integer getDiscoveryId() {
        return discoveryId;
    }

    public Type getType() {
        return type;
    }

    public enum Type{
        LIKE;
    }

}
