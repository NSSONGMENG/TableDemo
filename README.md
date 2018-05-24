# TableDemo

本demo是利用约束对cell高度自适应的演示，通过本demo您可以学习如果去除繁琐的cell高度计算

注意事项：
1、如果cell的子控件是添加在cell（非cell.contentView）上的，则约束应该相对于cell本身（非cell.contentView）
2、如果cell的子控件是添加在cell.contentView，则约束应该像应于cell.contentView

建议子控件添加在cell.contentView上，约束也相对于cell.contentView添加。否则查看视图层级时可能看不到cell的子视图
