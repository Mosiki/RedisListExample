package io.github.mosiki.service;

import io.github.mosiki.vo.DynamicVO;
import io.github.mosiki.vo.PhoneVO;

import java.util.List;

public interface PhoneService {

    /**
     * 购买
     * @param phoneId 手机ID
     */
    void buyPhone(int phoneId);

    /**
     * 获取销量排行榜
     * @return
     */
    List<PhoneVO> getPhbList();

    /**
     * 获得销售动态
     * @return
     */
    List<DynamicVO> getBuyDynamic();

    /**
     * 获得销售排行榜上该手机的排名
     * @param phoneId
     * @return
     */
    int phoneRank(int phoneId);

    /**
     * 清空缓存
     */
    void clear();

    /**
     * 排行榜丢失时，根据数据库数据来初始化排行榜
     */
    void initCache();
}
