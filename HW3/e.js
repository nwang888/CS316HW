printjson(db.people.aggregate([
    { $addFields: {
        repRoles: {
            $filter: {
                input: "$roles",
                as: "role",
                cond: { $eq: [ "$$role.type", "rep" ] }
            }
        }
    } },
    { $replaceRoot: {
        newRoot: {
            name: "$name",
            cur_type: {
                $arrayElemAt: [ "$roles.type", -1 ]
            },
            had_rep_role: { $gt: [ { $size: "$repRoles" }, 0 ] }
        }
    } },
    {
        $match: {
            "cur_type": "sen",
            "had_rep_role": true,
        }
    },
    { $sort: {
        name: 1
    } },
    { $project: {
        "name": "$name",
    } }
]).toArray())