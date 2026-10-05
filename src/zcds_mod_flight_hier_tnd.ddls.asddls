@AccessControl.authorizationCheck: #NOT_REQUIRED
define hierarchy ZCDS_MOD_FLIGHT_HIER_TND
  as parent child hierarchy(
    source ZCDS_FLIGHT_HIERA_TND
    child to parent association _Agency
    start where
      AgencyID is initial
    siblings order by
      AgencyID
    multiple parents allowed
    orphans ignore
    cycles breakup
  )
{
  key AgencyID,
      CustomerID,
      $node.node_id               as NodeID,
      $node.hierarchy_is_cycle    as HisCycle,
      $node.hierarchy_is_orphan   as HisOrphan,
      $node.hierarchy_level       as HLevel,
      $node.hierarchy_parent_rank as HParentRank,
      $node.hierarchy_rank        as HRank,
      $node.hierarchy_tree_size   as HTreeSize
}
