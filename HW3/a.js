printjson(db.people.aggregate([
    {
        $match: {
            "name":/ Smith$/
        }
    }
]).toArray())