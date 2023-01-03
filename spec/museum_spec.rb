require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do
    let(:dmns) { Museum.new("Denver Museum of Nature and Science") }
    let(:gems_and_minerals) { Exhibit.new({name: "Gems and Minerals", cost: 0}) }
    let(:dead_sea_scrolls) { Exhibit.new({name: "Dead Sea Scrolls", cost: 10}) }
    let(:imax) { Exhibit.new({name: "IMAX",cost: 15}) }
    let(:patron_1) { Patron.new("Bob", 20) }
    let(:patron_2) { Patron.new("Sally", 20) }

    describe "#initialize" do
        it "exists" do
            expect(dmns).to be_instance_of(Museum)
        end

        it "has attributes" do
            expect(dmns.name).to eq("Denver Museum of Nature and Science")
        end
    end

    describe "#exhibits" do
        it "starts with no exhibits" do
            expect(dmns.exhibits).to eq([])
        end

        it "can have exhibits" do
            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)

            expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
        end
    end

    describe "#recommends" do
        it "can recommend exhibits" do 
            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)

            patron_1.add_interest("Dead Sea Scrolls")
            patron_1.add_interest("Gems and Minerals")
            patron_2.add_interest("IMAX")

            expect(dmns.recommend_exhibits(patron_1)).to eq([dead_sea_scrolls, gems_and_minerals])
            expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
        end
    end
end