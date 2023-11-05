printjson(db.people.aggregate([
    { $replaceRoot: {
        newRoot: {
            name: "$name",
            district: {
                $arrayElemAt: [ "$roles.district", -1 ]
            },
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
            "type": "rep",
            "state": "NC",
        }
    },
    { $sort: {
        district: 1
    } },
    { $project: {
        "name": "$name",
        "district": "$district",
        "party": "$party",
    } }
]).toArray())