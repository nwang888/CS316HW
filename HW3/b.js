printjson(db.committees.aggregate([
    { $unwind: "$subcommittees" },
    { $replaceRoot: {
        newRoot: {
            name: "$subcommittees.displayname",
            members: "$subcommittees.members",
            parent_committee: {
                id: "$_id",
                name: "$displayname"
            }
        }
    } },
    { $match: {
        "name": "Energy and Mineral Resources",
    }},
    { $unwind: "$members" },
    { $replaceRoot: {
        newRoot: "$members"
    } },
    { $match: {
        "role": "Ranking Member",
    }},
    { $lookup: {
        from: "people",
        localField: "id",
        foreignField: "_id",
        as: "id"
    } },
    { $replaceRoot: {
        newRoot: {
            $arrayElemAt: [ "$id", 0 ]
        }
    } },
]).toArray())