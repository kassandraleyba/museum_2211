class Museum
    attr_reader :name,
                :exhibits

    def initialize(name)
        @name = name
        @exhibits = []
    end

    def add_exhibit(exhibit)
        @exhibits << exhibit
    end

    def recommend_exhibits(patron)
        recommend_exhibits = []
        @exhibits.each do |exhibit|
            if patron.interests == exhibit.name
                recommend_exhibits << exhibit
            end
        end
        recommend_exhibits
    end
end