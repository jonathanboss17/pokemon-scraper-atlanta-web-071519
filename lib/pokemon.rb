class Pokemon
    attr_accessor :name, :type, :id, :db

    def initialize(props=[])
        @name = props[1]
        @type = props[2]
        @id = props[0]
    end

    def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (\"#{name}\", \"#{type}\")"
    db.execute(sql)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = #{id} LIMIT 1"
        x = db.execute(sql)[0]
        pokemon = Pokemon.new(x)
        # binding.pry
        pokemon
    end

end

