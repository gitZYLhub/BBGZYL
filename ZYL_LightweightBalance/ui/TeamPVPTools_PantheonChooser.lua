include("PantheonChooser_TPT");

-- Team PVP Tools stores chooser instances by transient row objects. Rebuild the
-- visible list when a pantheon is founded instead of indexing a stale object.
function OnPantheonFounded()
	if not ContextPtr:IsHidden() then
		ClearBeliefSelection();
		Realize();
	end
end
