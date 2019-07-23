class Pokemon
    attr_accessor :name, :type, :id, :db, :hp

    def initialize(props=[])
        @name = props[1]
        @type = props[2]
        @id = props[0]
        @hp = props[3]
    end

    def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (\"#{name}\", \"#{type}\")"
    db.execute(sql)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = #{id} LIMIT 1"
        x = db.execute(sql)[0]
        pokemon = Pokemon.new(x)
        pokemon
    end

    def alter_hp(hp, db)
        sql = "UPDATE pokemon SET hp = #{hp} WHERE id = #{self.id}"
        db.execute(sql)
    end



end

