// idk this is so hard

printjson(db.people.aggregate([
    { $replaceRoot: {
        newRoot: {
            id: "$_id",
            name: "$name",
            gender: "$gender",
            state: {
                $arrayElemAt: [ "$roles.state", -1 ]
            },
        }
    } },
    { $match: {
        "state": "NY"
    } },
    { $lookup: {
        from: "committees",
        localField: "id",
        foreignField: "id",
        as: "id"
    } },
]).toArray())