package io.github.mosiki.entity;

import java.io.Serializable;

public class Phone implements Serializable{
    private static final long serialVersionUID = 7740284161641516541L;

    private Integer id;

    private String name;

    private String ranking;

    public Phone() {
    }

    public Phone(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRanking() {
        return ranking;
    }

    public void setRanking(String ranking) {
        this.ranking = ranking;
    }
}
