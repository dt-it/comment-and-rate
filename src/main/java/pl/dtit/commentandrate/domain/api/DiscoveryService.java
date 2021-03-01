package pl.dtit.commentandrate.domain.api;

import pl.dtit.commentandrate.domain.discovery.Discovery;
import pl.dtit.commentandrate.domain.discovery.DiscoveryDao;
import pl.dtit.commentandrate.domain.user.UserDao;
import pl.dtit.commentandrate.domain.vote.VoteDao;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class DiscoveryService {
    private final DiscoveryDao discoveryDao = new DiscoveryDao();
    private final DiscoveryMapper discoveryMapper = new DiscoveryMapper();

    public void add(DiscoverySaveRequest saveRequest){
        Discovery discoveryToSave = discoveryMapper.map(saveRequest);
        discoveryDao.save(discoveryToSave);
    }

    public List<DiscoveryBasicInfo> findAll() {
        return discoveryDao.findAll()
                .stream().map(discoveryMapper::map)
                .collect(Collectors.toList());
    }

    public List<DiscoveryBasicInfo> findByCategory(int categoryId) {
        return discoveryDao.findByCategory(categoryId)
                .stream().map(discoveryMapper::map)
                .collect(Collectors.toList());
    }

    public List<DiscoveryBasicInfo> findById(int discoveryId) {
        return discoveryDao.findById(discoveryId)
                .stream().map(discoveryMapper::map)
                .collect(Collectors.toList());
    }

    public Optional<DiscoveryBasicInfo> findDiscoveryById(int discoveryId) {
        return discoveryDao.findById(discoveryId)
                .map(discoveryMapper::map);
    }

    private static class DiscoveryMapper {
        private final UserDao userDao = new UserDao();
        private final VoteDao voteDao = new VoteDao();

        Discovery map(DiscoverySaveRequest sr){
            return new Discovery(sr.getTitle(), sr.getUrl(), sr.getDescription(), LocalDateTime.now(),
                    sr.getCategoryId(),
                    userDao.findByUsername(sr.getAuthor()).orElseThrow().getId());
        }

        DiscoveryBasicInfo map(Discovery d) {
            return new DiscoveryBasicInfo(
                    d.getId(),
                    d.getTitle(),
                    d.getUrl(),
                    d.getDescription(),
                    d.getDateAdded(),
                    voteDao.countByDiscoveryId(d.getId()),
                    userDao.findById(d.getUserId()).orElseThrow().getUsername()
            );
        }
    }
}
