printjson(db.people.aggregate([
    { $replaceRoot: {
        newRoot: {
            name: "$name",
            age: {$subtract: [2023, {$year: "$birthday"}]},
            gender: "$gender",
            state: {
                $arrayElemAt: [ "$roles.state", -1 ]
            },
            type: {
                $arrayElemAt: [ "$roles.type", -1 ]
            },
            party: {
                $arrayElemAt: [ "$roles.party", -1 ]
            },
        }
    } },
    {
        $match: {
            "party": "Democrat",
            "gender": "F",
        }
    },
    { $sort: {
        age: -1,
        name: 1
    } },
    { $project: {
        "age": "$age",
        "name": "$name",
        "state": "$state",
        "type": "$type",
    } }
]).toArray())