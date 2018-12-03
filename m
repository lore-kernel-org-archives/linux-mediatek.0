From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH] mt76: convert to DEFINE_SHOW_ATTRIBUTE
Date: Mon,  3 Dec 2018 08:40:28 -0500
Message-ID: <20181203134028.12645-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, kubakici@wp.pl, matthias.bgg@gmail.com, nbd@nbd.name, lorenzo.bianconi@redhat.com, joe@perches.com, sgruszka@redhat.com, kvalo@codeaurora.org
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 .../wireless/mediatek/mt76/mt76x0/debugfs.c   | 20 ++--------
 .../wireless/mediatek/mt76/mt76x2/debugfs.c   | 38 +++---------------
 .../net/wireless/mediatek/mt7601u/debugfs.c   | 40 ++++---------------
 3 files changed, 18 insertions(+), 80 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt76x0/debugfs.c
index 3224e5b1a1e5..21fde45b1b20 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/debugfs.c
@@ -18,8 +18,7 @@
 #include "mt76x0.h"
 #include "eeprom.h"
 
-static int
-mt76x0_ampdu_stat_read(struct seq_file *file, void *data)
+static int ampdu_stat_show(struct seq_file *file, void *data)
 {
 	struct mt76x02_dev *dev = file->private;
 	int i, j;
@@ -61,19 +60,7 @@ mt76x0_ampdu_stat_read(struct seq_file *file, void *data)
 
 	return 0;
 }
-
-static int
-mt76x0_ampdu_stat_open(struct inode *inode, struct file *f)
-{
-	return single_open(f, mt76x0_ampdu_stat_read, inode->i_private);
-}
-
-static const struct file_operations fops_ampdu_stat = {
-	.open = mt76x0_ampdu_stat_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(ampdu_stat);
 
 void mt76x0_init_debugfs(struct mt76x02_dev *dev)
 {
@@ -83,5 +70,6 @@ void mt76x0_init_debugfs(struct mt76x02_dev *dev)
 	if (!dir)
 		return;
 
-	debugfs_create_file("ampdu_stat", S_IRUSR, dir, dev, &fops_ampdu_stat);
+	debugfs_create_file("ampdu_stat", S_IRUSR, dir, dev,
+				&ampdu_stat_fops);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt76x2/debugfs.c
index e8f8ccc0a5ed..04711cd09d21 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/debugfs.c
@@ -17,8 +17,7 @@
 #include <linux/debugfs.h>
 #include "mt76x2.h"
 
-static int
-mt76x2_ampdu_stat_read(struct seq_file *file, void *data)
+static int ampdu_stat_show(struct seq_file *file, void *data)
 {
 	struct mt76x02_dev *dev = file->private;
 	int i, j;
@@ -40,12 +39,7 @@ mt76x2_ampdu_stat_read(struct seq_file *file, void *data)
 
 	return 0;
 }
-
-static int
-mt76x2_ampdu_stat_open(struct inode *inode, struct file *f)
-{
-	return single_open(f, mt76x2_ampdu_stat_read, inode->i_private);
-}
+DEFINE_SHOW_ATTRIBUTE(ampdu_stat);
 
 static int read_txpower(struct seq_file *file, void *data)
 {
@@ -58,15 +52,7 @@ static int read_txpower(struct seq_file *file, void *data)
 	return 0;
 }
 
-static const struct file_operations fops_ampdu_stat = {
-	.open = mt76x2_ampdu_stat_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
-
-static int
-mt76x2_dfs_stat_read(struct seq_file *file, void *data)
+static int dfs_stat_show(struct seq_file *file, void *data)
 {
 	struct mt76x02_dev *dev = file->private;
 	struct mt76x02_dfs_pattern_detector *dfs_pd = &dev->dfs_pd;
@@ -90,19 +76,7 @@ mt76x2_dfs_stat_read(struct seq_file *file, void *data)
 
 	return 0;
 }
-
-static int
-mt76x2_dfs_stat_open(struct inode *inode, struct file *f)
-{
-	return single_open(f, mt76x2_dfs_stat_read, inode->i_private);
-}
-
-static const struct file_operations fops_dfs_stat = {
-	.open = mt76x2_dfs_stat_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(dfs_stat);
 
 static int read_agc(struct seq_file *file, void *data)
 {
@@ -127,8 +101,8 @@ void mt76x2_init_debugfs(struct mt76x02_dev *dev)
 	debugfs_create_u8("temperature", 0400, dir, &dev->cal.temp);
 	debugfs_create_bool("tpc", 0600, dir, &dev->enable_tpc);
 
-	debugfs_create_file("ampdu_stat", 0400, dir, dev, &fops_ampdu_stat);
-	debugfs_create_file("dfs_stats", 0400, dir, dev, &fops_dfs_stat);
+	debugfs_create_file("ampdu_stat", 0400, dir, dev, &ampdu_stat_fops);
+	debugfs_create_file("dfs_stats", 0400, dir, dev, &dfs_stat_fops);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "txpower", dir,
 				    read_txpower);
 
diff --git a/drivers/net/wireless/mediatek/mt7601u/debugfs.c b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
index 991a6a729b1e..0be3084fee01 100644
--- a/drivers/net/wireless/mediatek/mt7601u/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
@@ -37,8 +37,7 @@ mt76_reg_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_regval, mt76_reg_get, mt76_reg_set, "0x%08llx\n");
 
-static int
-mt7601u_ampdu_stat_read(struct seq_file *file, void *data)
+static int ampdu_stat_show(struct seq_file *file, void *data)
 {
 	struct mt7601u_dev *dev = file->private;
 	int i, j;
@@ -80,22 +79,9 @@ mt7601u_ampdu_stat_read(struct seq_file *file, void *data)
 
 	return 0;
 }
+DEFINE_SHOW_ATTRIBUTE(ampdu_stat);
 
-static int
-mt7601u_ampdu_stat_open(struct inode *inode, struct file *f)
-{
-	return single_open(f, mt7601u_ampdu_stat_read, inode->i_private);
-}
-
-static const struct file_operations fops_ampdu_stat = {
-	.open = mt7601u_ampdu_stat_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
-
-static int
-mt7601u_eeprom_param_read(struct seq_file *file, void *data)
+static int eeprom_param_show(struct seq_file *file, void *data)
 {
 	struct mt7601u_dev *dev = file->private;
 	struct mt7601u_rate_power *rp = &dev->ee->power_rate_table;
@@ -138,19 +124,7 @@ mt7601u_eeprom_param_read(struct seq_file *file, void *data)
 
 	return 0;
 }
-
-static int
-mt7601u_eeprom_param_open(struct inode *inode, struct file *f)
-{
-	return single_open(f, mt7601u_eeprom_param_read, inode->i_private);
-}
-
-static const struct file_operations fops_eeprom_param = {
-	.open = mt7601u_eeprom_param_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(eeprom_param);
 
 void mt7601u_init_debugfs(struct mt7601u_dev *dev)
 {
@@ -165,6 +139,8 @@ void mt7601u_init_debugfs(struct mt7601u_dev *dev)
 
 	debugfs_create_u32("regidx", 0600, dir, &dev->debugfs_reg);
 	debugfs_create_file("regval", 0600, dir, dev, &fops_regval);
-	debugfs_create_file("ampdu_stat", 0400, dir, dev, &fops_ampdu_stat);
-	debugfs_create_file("eeprom_param", 0400, dir, dev, &fops_eeprom_param);
+	debugfs_create_file("ampdu_stat", 0400, dir, dev, 
+				&ampdu_stat_fops);
+	debugfs_create_file("eeprom_param", 0400, dir, dev,
+				&eeprom_param_fops);
 }
-- 
2.17.0
