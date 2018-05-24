# TableDemo

如果cell的子控件是添加在cell（非cell.contentView）上的，则约束应该相对于cell本身（非cell.contentView）
如果cell的子控件是添加在cell.contentView，则约束应该像应于cell.contentView

建议子控件添加在cell.contentView上，约束也相对于cell.contentView添加。否则查看视图层级时可能看不到cell的子视图
