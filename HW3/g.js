printjson(db.people.aggregate([
    { $replaceRoot: {
        newRoot: {
            name: "$name",
            gender: "$gender",
            state: {
                $arrayElemAt: [ "$roles.state", -1 ]
            },
        }
    } },
    { $group : {
        _id: "$state",
        M: { $sum: {
            $cond: [ { $eq: ["$gender", "M"] }, 1, 0]
        } },
        F: { $sum: {
            $cond: [ { $eq: ["$gender", "F"] }, 1, 0]
        } },
    } },
    { $sort: {
        _id: 1
    } },
    { $project: {
        _id: 0,
        state: "$_id",
        M: "$M",
        F: "$F"
    } }
]).toArray())