Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E2BC43219
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 03:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pOrj4TmfP3x/aDaL/fWO+C6eVtqjYMwMYDG5C6WBY2Y=; b=go0mH2vKvAuapO
	MZWIFEnWavf18UtZEiuV5UvU5bzYXwk2ybJp/8TPCijk0NrBdwFIJXqiXqetZRBrBFlvf21efU6xA
	/iT8OH/0pJK1aoPaPS9s1OIkmohazgrv2XZHGSm56duJ9WqfBKYVVUwwP9Wm1uyjwQlxwesKVLDc2
	07Cv66HPm5+5nTo2mBXBZQuZsqELESD77aitD4Xqs/6427YthddufW8pkGqc9+85cUmur1QNf5ne+
	m20tncT36DjB5yCct6XVFbEQt6pR7F1KomyIvqV4OAbKTCeolz3g3ouEfsxATmc+D+n+WVQ4umaco
	RseAlxifrLfLuBIO3auw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nipV5-007z2G-0I; Mon, 25 Apr 2022 03:34:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nipUp-007yyk-SY
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 03:34:46 +0000
X-UUID: a60401e221a64443b59e6f9d9c7947a9-20220424
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:7fc2df5a-740e-4ed6-848c-555b3192071b, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:2c5acdf0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a60401e221a64443b59e6f9d9c7947a9-20220424
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1304813262; Sun, 24 Apr 2022 20:34:38 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Apr 2022 20:34:36 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 Apr 2022 11:34:33 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 25 Apr 2022 11:34:32 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>, "lian .
 chen" <lian.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH v2] mt76: mt7915: dump SER stats through debugfs
Date: Mon, 25 Apr 2022 11:34:29 +0800
Message-ID: <fe715dbd6cd43651b50172acf58bb1eab66584da.1650857049.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_203443_971454_B0D082D8 
X-CRM114-Status: GOOD (  14.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Ryder Lee <ryder.lee@mediatek.com>

Grab status of system recovery from firmware.

Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v2:
 - merge fw_ser_stats into fw_ser
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 95 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  5 +-
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  |  3 +
 .../net/wireless/mediatek/mt76/mt7915/regs.h  | 18 +++-
 4 files changed, 105 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index dece0a6..cbfed7e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -45,34 +45,109 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_implicit_txbf, mt7915_implicit_txbf_get,
 			 mt7915_implicit_txbf_set, "%lld\n");
 
 /* test knob of system layer 1/2 error recovery */
-static int mt7915_ser_trigger_set(void *data, u64 val)
+static ssize_t mt7915_fw_ser_set(struct file *file,
+				 const char __user *user_buf,
+				 size_t count, loff_t *ppos)
 {
 	enum {
+		SER_QUERY = 0,
 		SER_SET_RECOVER_L1 = 1,
 		SER_SET_RECOVER_L2,
 		SER_ENABLE = 2,
 		SER_RECOVER
 	};
-	struct mt7915_dev *dev = data;
-	int ret = 0;
+	struct mt7915_dev *dev = file->private_data;
+	char buf[16];
+	u16 val;
+
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
+	if (copy_from_user(buf, user_buf, count))
+		return -EFAULT;
+
+	if (count && buf[count - 1] == '\n')
+		buf[count - 1] = '\0';
+	else
+		buf[count] = '\0';
+
+	if (kstrtou16(buf, 0, &val))
+		return -EINVAL;
 
 	switch (val) {
+	case SER_QUERY:
+		/* grab firmware SER stats */
+		mt7915_mcu_set_ser(dev, 0, 0, 0);
+		break;
 	case SER_SET_RECOVER_L1:
 	case SER_SET_RECOVER_L2:
-		ret = mt7915_mcu_set_ser(dev, SER_ENABLE, BIT(val), 0);
-		if (ret)
-			return ret;
+		mt7915_mcu_set_ser(dev, SER_ENABLE, BIT(val), 0);
 
-		return mt7915_mcu_set_ser(dev, SER_RECOVER, val, 0);
+		mt7915_mcu_set_ser(dev, SER_RECOVER, val, 0);
 	default:
 		break;
 	}
 
+	return count;
+}
+
+static ssize_t
+mt7915_fw_ser_get(struct file *file,
+		  char __user *user_buf,
+		  size_t count, loff_t *ppos)
+{
+	struct mt7915_dev *dev = file->private_data;
+	char *buff;
+	int desc = 0;
+	ssize_t ret;
+	static const size_t bufsz = 400;
+
+	buff = kmalloc(bufsz, GFP_KERNEL);
+	if (!buff)
+		return -ENOMEM;
+
+	desc += scnprintf(buff + desc, bufsz - desc,
+			  "::E  R , SER_STATUS        = 0x%08x\n",
+			  mt76_rr(dev, MT_SWDEF_SER_STATS));
+	desc += scnprintf(buff + desc, bufsz - desc,
+			  "::E  R , SER_PLE_ERR       = 0x%08x\n",
+			  mt76_rr(dev, MT_SWDEF_PLE_STATS));
+	desc += scnprintf(buff + desc, bufsz - desc,
+			  "::E  R , SER_PLE_ERR_1     = 0x%08x\n",
+			  mt76_rr(dev, MT_SWDEF_PLE1_STATS));
+	desc += scnprintf(buff + desc, bufsz - desc,
+			  "::E  R , SER_PLE_ERR_AMSDU = 0x%08x\n",
+			  mt76_rr(dev, MT_SWDEF_PLE_AMSDU_STATS));
+	desc += scnprintf(buff + desc, bufsz - desc,
+			  "::E  R , SER_PSE_ERR       = 0x%08x\n",
+			  mt76_rr(dev, MT_SWDEF_PSE_STATS));
+	desc += scnprintf(buff + desc, bufsz - desc,
+			  "::E  R , SER_PSE_ERR_1     = 0x%08x\n",
+			  mt76_rr(dev, MT_SWDEF_PSE1_STATS));
+	desc += scnprintf(buff + desc, bufsz - desc,
+			  "::E  R , SER_LMAC_WISR6_B0 = 0x%08x\n",
+			  mt76_rr(dev, MT_SWDEF_LAMC_WISR6_BN0_STATS));
+	desc += scnprintf(buff + desc, bufsz - desc,
+			  "::E  R , SER_LMAC_WISR6_B1 = 0x%08x\n",
+			  mt76_rr(dev, MT_SWDEF_LAMC_WISR6_BN1_STATS));
+	desc += scnprintf(buff + desc, bufsz - desc,
+			  "::E  R , SER_LMAC_WISR7_B0 = 0x%08x\n",
+			  mt76_rr(dev, MT_SWDEF_LAMC_WISR7_BN0_STATS));
+	desc += scnprintf(buff + desc, bufsz - desc,
+			  "::E  R , SER_LMAC_WISR7_B1 = 0x%08x\n",
+			  mt76_rr(dev, MT_SWDEF_LAMC_WISR7_BN1_STATS));
+
+	ret = simple_read_from_buffer(user_buf, count, ppos, buff, desc);
+	kfree(buff);
 	return ret;
 }
 
-DEFINE_DEBUGFS_ATTRIBUTE(fops_ser_trigger, NULL,
-			 mt7915_ser_trigger_set, "%lld\n");
+static const struct file_operations mt7915_fw_ser_ops = {
+	.write = mt7915_fw_ser_set,
+	.read = mt7915_fw_ser_get,
+	.open = simple_open,
+	.llseek = default_llseek,
+};
 
 static int
 mt7915_radar_trigger(void *data, u64 val)
@@ -884,6 +959,7 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
 	debugfs_create_file("xmit-queues", 0400, dir, phy,
 			    &mt7915_xmit_queues_fops);
 	debugfs_create_file("tx_stats", 0400, dir, phy, &mt7915_tx_stats_fops);
+	debugfs_create_file("fw_ser", 0600, dir, dev, &mt7915_fw_ser_ops);
 	debugfs_create_file("fw_debug_wm", 0600, dir, dev, &fops_fw_debug_wm);
 	debugfs_create_file("fw_debug_wa", 0600, dir, dev, &fops_fw_debug_wa);
 	debugfs_create_file("fw_debug_bin", 0600, dir, dev, &fops_fw_debug_bin);
@@ -897,7 +973,6 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
 			    &mt7915_rate_txpower_fops);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "twt_stats", dir,
 				    mt7915_twt_stats);
-	debugfs_create_file("ser_trigger", 0200, dir, dev, &fops_ser_trigger);
 	if (!dev->dbdc_support || phy->band_idx) {
 		debugfs_create_u32("dfs_hw_pattern", 0400, dir,
 				   &dev->hw_pattern);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index ee2956c..d4af707 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2471,10 +2471,7 @@ int mt7915_mcu_init(struct mt7915_dev *dev)
 	/* force firmware operation mode into normal state,
 	 * which should be set before firmware download stage.
 	 */
-	if (is_mt7915(&dev->mt76))
-		mt76_wr(dev, MT_SWDEF_MODE, MT_SWDEF_NORMAL_MODE);
-	else
-		mt76_wr(dev, MT_SWDEF_MODE_MT7916, MT_SWDEF_NORMAL_MODE);
+	mt76_wr(dev, MT_SWDEF_MODE, MT_SWDEF_NORMAL_MODE);
 
 	ret = mt7915_driver_own(dev, 0);
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 89ea285..cd4dfd2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -22,6 +22,7 @@ static const u32 mt7915_reg[] = {
 	[WFDMA_EXT_CSR_ADDR]	= 0xd7000,
 	[CBTOP1_PHY_END]	= 0x77ffffff,
 	[INFRA_MCU_ADDR_END]	= 0x7c3fffff,
+	[SWDEF_BASE_ADDR]	= 0x41f200,
 };
 
 static const u32 mt7916_reg[] = {
@@ -36,6 +37,7 @@ static const u32 mt7916_reg[] = {
 	[WFDMA_EXT_CSR_ADDR]	= 0xd7000,
 	[CBTOP1_PHY_END]	= 0x7fffffff,
 	[INFRA_MCU_ADDR_END]	= 0x7c085fff,
+	[SWDEF_BASE_ADDR]	= 0x411400,
 };
 
 static const u32 mt7986_reg[] = {
@@ -50,6 +52,7 @@ static const u32 mt7986_reg[] = {
 	[WFDMA_EXT_CSR_ADDR]	= 0x27000,
 	[CBTOP1_PHY_END]	= 0x7fffffff,
 	[INFRA_MCU_ADDR_END]	= 0x7c085fff,
+	[SWDEF_BASE_ADDR]	= 0x411400,
 };
 
 static const u32 mt7915_offs[] = {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index bb0dec8..8e77c28 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -30,6 +30,7 @@ enum reg_rev {
 	WFDMA_EXT_CSR_ADDR,
 	CBTOP1_PHY_END,
 	INFRA_MCU_ADDR_END,
+	SWDEF_BASE_ADDR,
 	__MT_REG_MAX,
 };
 
@@ -929,12 +930,25 @@ enum offs_rev {
 #define MT_ADIE_TYPE_MASK		BIT(1)
 
 /* FW MODE SYNC */
-#define MT_SWDEF_MODE			0x41f23c
-#define MT_SWDEF_MODE_MT7916		0x41143c
+#define MT_SWDEF_BASE			__REG(SWDEF_BASE_ADDR)
+
+#define MT_SWDEF(ofs)			(MT_SWDEF_BASE + (ofs))
+#define MT_SWDEF_MODE			MT_SWDEF(0x3c)
 #define MT_SWDEF_NORMAL_MODE		0
 #define MT_SWDEF_ICAP_MODE		1
 #define MT_SWDEF_SPECTRUM_MODE		2
 
+#define MT_SWDEF_SER_STATS		MT_SWDEF(0x040)
+#define MT_SWDEF_PLE_STATS		MT_SWDEF(0x044)
+#define MT_SWDEF_PLE1_STATS		MT_SWDEF(0x048)
+#define MT_SWDEF_PLE_AMSDU_STATS	MT_SWDEF(0x04C)
+#define MT_SWDEF_PSE_STATS		MT_SWDEF(0x050)
+#define MT_SWDEF_PSE1_STATS		MT_SWDEF(0x054)
+#define MT_SWDEF_LAMC_WISR6_BN0_STATS	MT_SWDEF(0x058)
+#define MT_SWDEF_LAMC_WISR6_BN1_STATS	MT_SWDEF(0x05C)
+#define MT_SWDEF_LAMC_WISR7_BN0_STATS	MT_SWDEF(0x060)
+#define MT_SWDEF_LAMC_WISR7_BN1_STATS	MT_SWDEF(0x064)
+
 #define MT_DIC_CMD_REG_BASE		0x41f000
 #define MT_DIC_CMD_REG(ofs)		(MT_DIC_CMD_REG_BASE + (ofs))
 #define MT_DIC_CMD_REG_CMD		MT_DIC_CMD_REG(0x10)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
