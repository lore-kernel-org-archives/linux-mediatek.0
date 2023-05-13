Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AB9C77B7D
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 May 2023 09:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNMjiKD83iPf9Nnz9lJKJbqnbXghvYF9YahPO30iS2A=; b=HZJNuWmY/uYMGzFZp9mKoGYbWn
	fZ9c4AHZfUJx3HAqRyF31NL46T5fGqgp/aVntkaODKVX1R6ZisMJnHUPHYVhtjdPE9OQucBtj56sQ
	Csfk8TSwxI/pCt+xGjBroLkRKIdEb8nlpLgvlEAL/SMRs89mnPuMQ2NkaGVU8ZgXalSl206o3E9LY
	fV9x3WKovDRZg1QdeaRd/pm/nzVT4/jvOMNLminFWSTm0MFjJZC0StdpeMXcOwy7KTvCslLQwAsv4
	7UFYwBoYbVpXEACSiEDmiJQ3rrd6vQZJamqeaZUDKcVLmMeQQeiUqfNS/5nZADz3lEtdpXNhZU52g
	CtCzJLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxlc9-00EAew-1L;
	Sat, 13 May 2023 09:32:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxlc5-00EAdW-2f;
	Sat, 13 May 2023 09:32:31 +0000
X-UUID: 10e0607af17111ed912e1518a6540028-20230513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tNMjiKD83iPf9Nnz9lJKJbqnbXghvYF9YahPO30iS2A=;
	b=YaSwLb91UJHKKmqanFNsqUbKsbnFC9UGDl6F0Rj+oNcisK1I4uwVK7XY7RHM0+nTo41kp5PXxXIjYLAmNi1vepa5ClijgkxBBuMHLIz94jwiGPe+XzT9Os2iwe6yMTRzQw40m5dssHQ1lse0UVDaDbcWvEOvMdzskGE3ucrgymM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:369459f7-ca7b-4ad3-a0b2-ddfa53e4a2dc,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:178d4d4,CLOUDID:e62ab7c0-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 10e0607af17111ed912e1518a6540028-20230513
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 76983008; Sat, 13 May 2023 02:32:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 13 May 2023 17:22:20 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 13 May 2023 17:22:20 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v9 2/2] phy: mediatek: tphy: add debugfs files
Date: Sat, 13 May 2023 17:22:18 +0800
Message-ID: <20230513092218.21139-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230513092218.21139-1-chunfeng.yun@mediatek.com>
References: <20230513092218.21139-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_023229_875475_AA3CA8E5 
X-CRM114-Status: GOOD (  17.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These debugfs files are mainly used to make eye diagram test easier,
especially helpful to do HQA test for a new IC without efuse enabled.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v9: 1. use the debugfs entry of struct phy instead of private one suggested by Vinod;
    2. modify changelog of v8 due to misunderstanding the means of Vinod

v8: abandon patch to create phy debug root file /sys/kernel/debug/phy/

v6~v7: no changes

v5: using common debugfs config CONFIG_DEBUG_FS

v4: fix build warning of sometimes uninitialized variable

v3: fix typo of "debugfs" suggested by AngeloGioacchino

v2: add CONFIG_PHY_MTK_TPHY_DEBUGFS suggested by AngeloGioacchino
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 356 ++++++++++++++++++++++++++++
 1 file changed, 356 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index e906a82791bd..0d110e50bbfd 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/phy/phy.h>
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
 #include <linux/mfd/syscon.h>
@@ -264,6 +265,8 @@
 
 #define TPHY_CLKS_CNT	2
 
+#define USER_BUF_LEN(count) min_t(size_t, 8, (count))
+
 enum mtk_phy_version {
 	MTK_PHY_V1 = 1,
 	MTK_PHY_V2,
@@ -336,6 +339,358 @@ struct mtk_tphy {
 	int src_coef; /* coefficient for slew rate calibrate */
 };
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+
+enum u2_phy_params {
+	U2P_EYE_VRT = 0,
+	U2P_EYE_TERM,
+	U2P_EFUSE_EN,
+	U2P_EFUSE_INTR,
+	U2P_DISCTH,
+	U2P_PRE_EMPHASIS,
+};
+
+enum u3_phy_params {
+	U3P_EFUSE_EN = 0,
+	U3P_EFUSE_INTR,
+	U3P_EFUSE_TX_IMP,
+	U3P_EFUSE_RX_IMP,
+};
+
+static const char *const u2_phy_files[] = {
+	[U2P_EYE_VRT] = "vrt",
+	[U2P_EYE_TERM] = "term",
+	[U2P_EFUSE_EN] = "efuse",
+	[U2P_EFUSE_INTR] = "intr",
+	[U2P_DISCTH] = "discth",
+	[U2P_PRE_EMPHASIS] = "preemph",
+};
+
+static const char *const u3_phy_files[] = {
+	[U3P_EFUSE_EN] = "efuse",
+	[U3P_EFUSE_INTR] = "intr",
+	[U3P_EFUSE_TX_IMP] = "tx-imp",
+	[U3P_EFUSE_RX_IMP] = "rx-imp",
+};
+
+static int u2_phy_params_show(struct seq_file *sf, void *unused)
+{
+	struct mtk_phy_instance *inst = sf->private;
+	const char *fname = file_dentry(sf->file)->d_iname;
+	struct u2phy_banks *u2_banks = &inst->u2_banks;
+	void __iomem *com = u2_banks->com;
+	u32 max = 0;
+	u32 tmp = 0;
+	u32 val = 0;
+	int ret;
+
+	ret = match_string(u2_phy_files, ARRAY_SIZE(u2_phy_files), fname);
+	if (ret < 0)
+		return ret;
+
+	switch (ret) {
+	case U2P_EYE_VRT:
+		tmp = readl(com + U3P_USBPHYACR1);
+		val = FIELD_GET(PA1_RG_VRT_SEL, tmp);
+		max = FIELD_MAX(PA1_RG_VRT_SEL);
+		break;
+
+	case U2P_EYE_TERM:
+		tmp = readl(com + U3P_USBPHYACR1);
+		val = FIELD_GET(PA1_RG_TERM_SEL, tmp);
+		max = FIELD_MAX(PA1_RG_TERM_SEL);
+		break;
+
+	case U2P_EFUSE_EN:
+		if (u2_banks->misc) {
+			tmp = readl(u2_banks->misc + U3P_MISC_REG1);
+			max = 1;
+		}
+
+		val = !!(tmp & MR1_EFUSE_AUTO_LOAD_DIS);
+		break;
+
+	case U2P_EFUSE_INTR:
+		tmp = readl(com + U3P_USBPHYACR1);
+		val = FIELD_GET(PA1_RG_INTR_CAL, tmp);
+		max = FIELD_MAX(PA1_RG_INTR_CAL);
+		break;
+
+	case U2P_DISCTH:
+		tmp = readl(com + U3P_USBPHYACR6);
+		val = FIELD_GET(PA6_RG_U2_DISCTH, tmp);
+		max = FIELD_MAX(PA6_RG_U2_DISCTH);
+		break;
+
+	case U2P_PRE_EMPHASIS:
+		tmp = readl(com + U3P_USBPHYACR6);
+		val = FIELD_GET(PA6_RG_U2_PRE_EMP, tmp);
+		max = FIELD_MAX(PA6_RG_U2_PRE_EMP);
+		break;
+
+	default:
+		seq_printf(sf, "invalid, %d\n", ret);
+		break;
+	}
+
+	seq_printf(sf, "%s : %d [0, %d]\n", fname, val, max);
+
+	return 0;
+}
+
+static int u2_phy_params_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, u2_phy_params_show, inode->i_private);
+}
+
+static ssize_t u2_phy_params_write(struct file *file, const char __user *ubuf,
+				   size_t count, loff_t *ppos)
+{
+	const char *fname = file_dentry(file)->d_iname;
+	struct seq_file *sf = file->private_data;
+	struct mtk_phy_instance *inst = sf->private;
+	struct u2phy_banks *u2_banks = &inst->u2_banks;
+	void __iomem *com = u2_banks->com;
+	ssize_t rc;
+	u32 val;
+	int ret;
+
+	rc = kstrtouint_from_user(ubuf, USER_BUF_LEN(count), 0, &val);
+	if (rc)
+		return rc;
+
+	ret = match_string(u2_phy_files, ARRAY_SIZE(u2_phy_files), fname);
+	if (ret < 0)
+		return (ssize_t)ret;
+
+	switch (ret) {
+	case U2P_EYE_VRT:
+		mtk_phy_update_field(com + U3P_USBPHYACR1, PA1_RG_VRT_SEL, val);
+		break;
+
+	case U2P_EYE_TERM:
+		mtk_phy_update_field(com + U3P_USBPHYACR1, PA1_RG_TERM_SEL, val);
+		break;
+
+	case U2P_EFUSE_EN:
+		if (u2_banks->misc)
+			mtk_phy_update_field(u2_banks->misc + U3P_MISC_REG1,
+					     MR1_EFUSE_AUTO_LOAD_DIS, !!val);
+		break;
+
+	case U2P_EFUSE_INTR:
+		mtk_phy_update_field(com + U3P_USBPHYACR1, PA1_RG_INTR_CAL, val);
+		break;
+
+	case U2P_DISCTH:
+		mtk_phy_update_field(com + U3P_USBPHYACR6, PA6_RG_U2_DISCTH, val);
+		break;
+
+	case U2P_PRE_EMPHASIS:
+		mtk_phy_update_field(com + U3P_USBPHYACR6, PA6_RG_U2_PRE_EMP, val);
+		break;
+
+	default:
+		break;
+	}
+
+	return count;
+}
+
+static const struct file_operations u2_phy_fops = {
+	.open = u2_phy_params_open,
+	.write = u2_phy_params_write,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static void u2_phy_dbgfs_files_create(struct mtk_phy_instance *inst)
+{
+	u32 count = ARRAY_SIZE(u2_phy_files);
+	int i;
+
+	for (i = 0; i < count; i++)
+		debugfs_create_file(u2_phy_files[i], 0644, inst->phy->debugfs,
+				    inst, &u2_phy_fops);
+}
+
+static int u3_phy_params_show(struct seq_file *sf, void *unused)
+{
+	struct mtk_phy_instance *inst = sf->private;
+	const char *fname = file_dentry(sf->file)->d_iname;
+	struct u3phy_banks *u3_banks = &inst->u3_banks;
+	u32 val = 0;
+	u32 max = 0;
+	u32 tmp;
+	int ret;
+
+	ret = match_string(u3_phy_files, ARRAY_SIZE(u3_phy_files), fname);
+	if (ret < 0)
+		return ret;
+
+	switch (ret) {
+	case U3P_EFUSE_EN:
+		tmp = readl(u3_banks->phyd + U3P_U3_PHYD_RSV);
+		val = !!(tmp & P3D_RG_EFUSE_AUTO_LOAD_DIS);
+		max = 1;
+		break;
+
+	case U3P_EFUSE_INTR:
+		tmp = readl(u3_banks->phya + U3P_U3_PHYA_REG0);
+		val = FIELD_GET(P3A_RG_IEXT_INTR, tmp);
+		max = FIELD_MAX(P3A_RG_IEXT_INTR);
+		break;
+
+	case U3P_EFUSE_TX_IMP:
+		tmp = readl(u3_banks->phyd + U3P_U3_PHYD_IMPCAL0);
+		val = FIELD_GET(P3D_RG_TX_IMPEL, tmp);
+		max = FIELD_MAX(P3D_RG_TX_IMPEL);
+		break;
+
+	case U3P_EFUSE_RX_IMP:
+		tmp = readl(u3_banks->phyd + U3P_U3_PHYD_IMPCAL1);
+		val = FIELD_GET(P3D_RG_RX_IMPEL, tmp);
+		max = FIELD_MAX(P3D_RG_RX_IMPEL);
+		break;
+
+	default:
+		seq_printf(sf, "invalid, %d\n", ret);
+		break;
+	}
+
+	seq_printf(sf, "%s : %d [0, %d]\n", fname, val, max);
+
+	return 0;
+}
+
+static int u3_phy_params_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, u3_phy_params_show, inode->i_private);
+}
+
+static ssize_t u3_phy_params_write(struct file *file, const char __user *ubuf,
+				   size_t count, loff_t *ppos)
+{
+	const char *fname = file_dentry(file)->d_iname;
+	struct seq_file *sf = file->private_data;
+	struct mtk_phy_instance *inst = sf->private;
+	struct u3phy_banks *u3_banks = &inst->u3_banks;
+	void __iomem *phyd = u3_banks->phyd;
+	ssize_t rc;
+	u32 val;
+	int ret;
+
+	rc = kstrtouint_from_user(ubuf, USER_BUF_LEN(count), 0, &val);
+	if (rc)
+		return rc;
+
+	ret = match_string(u3_phy_files, ARRAY_SIZE(u3_phy_files), fname);
+	if (ret < 0)
+		return (ssize_t)ret;
+
+	switch (ret) {
+	case U3P_EFUSE_EN:
+		mtk_phy_update_field(phyd + U3P_U3_PHYD_RSV,
+				     P3D_RG_EFUSE_AUTO_LOAD_DIS, !!val);
+		break;
+
+	case U3P_EFUSE_INTR:
+		mtk_phy_update_field(u3_banks->phya + U3P_U3_PHYA_REG0,
+				     P3A_RG_IEXT_INTR, val);
+		break;
+
+	case U3P_EFUSE_TX_IMP:
+		mtk_phy_update_field(phyd + U3P_U3_PHYD_IMPCAL0, P3D_RG_TX_IMPEL, val);
+		mtk_phy_set_bits(phyd + U3P_U3_PHYD_IMPCAL0, P3D_RG_FORCE_TX_IMPEL);
+		break;
+
+	case U3P_EFUSE_RX_IMP:
+		mtk_phy_update_field(phyd + U3P_U3_PHYD_IMPCAL1, P3D_RG_RX_IMPEL, val);
+		mtk_phy_set_bits(phyd + U3P_U3_PHYD_IMPCAL1, P3D_RG_FORCE_RX_IMPEL);
+		break;
+
+	default:
+		break;
+	}
+
+	return count;
+}
+
+static const struct file_operations u3_phy_fops = {
+	.open = u3_phy_params_open,
+	.write = u3_phy_params_write,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static void u3_phy_dbgfs_files_create(struct mtk_phy_instance *inst)
+{
+	u32 count = ARRAY_SIZE(u3_phy_files);
+	int i;
+
+	for (i = 0; i < count; i++)
+		debugfs_create_file(u3_phy_files[i], 0644, inst->phy->debugfs,
+				    inst, &u3_phy_fops);
+}
+
+static int phy_type_show(struct seq_file *sf, void *unused)
+{
+	struct mtk_phy_instance *inst = sf->private;
+	const char *type;
+
+	switch (inst->type) {
+	case PHY_TYPE_USB2:
+		type = "USB2";
+		break;
+	case PHY_TYPE_USB3:
+		type = "USB3";
+		break;
+	case PHY_TYPE_PCIE:
+		type = "PCIe";
+		break;
+	case PHY_TYPE_SGMII:
+		type = "SGMII";
+		break;
+	case PHY_TYPE_SATA:
+		type = "SATA";
+		break;
+	default:
+		type = "";
+	}
+
+	seq_printf(sf, "%s\n", type);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(phy_type);
+
+/* these files will be removed when phy is released by phy core */
+static void phy_debugfs_init(struct mtk_phy_instance *inst)
+{
+	debugfs_create_file("type", 0444, inst->phy->debugfs, inst, &phy_type_fops);
+
+	switch (inst->type) {
+	case PHY_TYPE_USB2:
+		u2_phy_dbgfs_files_create(inst);
+		break;
+	case PHY_TYPE_USB3:
+	case PHY_TYPE_PCIE:
+		u3_phy_dbgfs_files_create(inst);
+		break;
+	default:
+		break;
+	}
+}
+
+#else
+
+static void phy_debugfs_init(struct mtk_phy_instance *inst)
+{}
+
+#endif
+
 static void hs_slew_rate_calibrate(struct mtk_tphy *tphy,
 	struct mtk_phy_instance *instance)
 {
@@ -1140,6 +1495,7 @@ static struct phy *mtk_phy_xlate(struct device *dev,
 
 	phy_parse_property(tphy, instance);
 	phy_type_set(instance);
+	phy_debugfs_init(instance);
 
 	return instance->phy;
 }
-- 
2.18.0


