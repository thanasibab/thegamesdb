package model;

import java.util.Date;

public class Game {

    private int gameId;
    private String gameName;
    private String gameDescription;
    private String console;
    private String numPlayers;
    private String coop;
    private String genre;
    private Date releaseDate;
    private String developer;
    private String publisher;
    private String frontBoxArt;
    private String backBoxArt;
    private String logo;
    private String developerLogo;
    private double price;
    private double discount;

    public Game() {
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public String getGameDescription() {
        return gameDescription;
    }

    public void setGameDescription(String gameDescription) {
        this.gameDescription = gameDescription;
    }

    public String getConsole() {
        return console;
    }

    public void setConsole(String console) {
        this.console = console;
    }

    public String getNumPlayers() {
        return numPlayers;
    }

    public void setNumPlayers(String numPlayers) {
        this.numPlayers = numPlayers;
    }

    public String getCoop() {
        return coop;
    }

    public void setCoop(String coop) {
        this.coop = coop;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getDeveloper() {
        return developer;
    }

    public void setDeveloper(String developer) {
        this.developer = developer;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getFrontBoxArt() {
        return frontBoxArt;
    }

    public void setFrontBoxArt(String frontBoxArt) {
        this.frontBoxArt = frontBoxArt;
    }

    public String getBackBoxArt() {
        return backBoxArt;
    }

    public void setBackBoxArt(String backBoxArt) {
        this.backBoxArt = backBoxArt;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getDeveloperLogo() {
        return developerLogo;
    }

    public void setDeveloperLogo(String developerLogo) {
        this.developerLogo = developerLogo;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

}