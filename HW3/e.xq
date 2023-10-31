<result> {
    for $x in /congress/people/person
    where $x/role/@current='1' and $x/role[@current='1']/@type='sen' and $x/role[not(@current='1')]/@type='rep'
    order by $x/@name ascending
    return
        <member>
            {$x/@name}
        </member>
}
</result>