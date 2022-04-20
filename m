Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A688CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 09:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xJgkX0CFauzDp/hfaYtsCCB6iaFA1Kp1kBm++utI/Pk=; b=WNCioOX8ptPp9K
	0RSVJMbCJ1++hkjCwRNy5Ezk5znzDeb4kvhSuj3Ut5vuIH6EArRiv6YkQdTx7h8QMYB7jByYGeU/K
	MBTO6+Z7v4fzOcXokWGugyxnDtei1vYmC+m85t87xeGQ+x+Ik3jgtfH+wpyRDPEkejV7mJ0mrJ8XT
	WwN1iHUI8miUxJIiGRYQvfeues+7mV32IfSjt1ZvrzfaTxVL6vI2Y7rpSsqpkld1rV5wik8H8lh/0
	FNW2SWEHFiXoTvr1prZxMTYxayzddHhTgXFv5jNEQMoYZ9e8cY8Xe/XO703S2ogAshIzgQRdefCUR
	kjXH+kz5b365gdI2ohhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh6GW-008DMn-Ei; Wed, 20 Apr 2022 09:04:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh6GS-008DL8-6a
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 09:04:47 +0000
X-UUID: 32d05255c9374f64b1360b2369d40bb3-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:abbcdac3-87e2-4056-afea-f0bf55d45878, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:7ce380ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 32d05255c9374f64b1360b2369d40bb3-20220420
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1974315768; Wed, 20 Apr 2022 02:04:39 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 02:04:37 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Apr 2022 17:04:35 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 20 Apr 2022 17:04:34 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>, "lian .
 chen" <lian.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: dump SER stats through debugfs
Date: Wed, 20 Apr 2022 17:04:33 +0800
Message-ID: <20220420090433.20003-1-bo.jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_020444_344107_D7308597 
X-CRM114-Status: GOOD (  12.99  )
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
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 48 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  5 +-
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  |  3 ++
 .../net/wireless/mediatek/mt76/mt7915/regs.h  | 18 ++++++-
 4 files changed, 64 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index dece0a6..76a6570 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -45,7 +45,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_implicit_txbf, mt7915_implicit_txbf_get,
 			 mt7915_implicit_txbf_set, "%lld\n");
 
 /* test knob of system layer 1/2 error recovery */
-static int mt7915_ser_trigger_set(void *data, u64 val)
+static int mt7915_fw_ser_set(void *data, u64 val)
 {
 	enum {
 		SER_SET_RECOVER_L1 = 1,
@@ -71,8 +71,47 @@ static int mt7915_ser_trigger_set(void *data, u64 val)
 	return ret;
 }
 
-DEFINE_DEBUGFS_ATTRIBUTE(fops_ser_trigger, NULL,
-			 mt7915_ser_trigger_set, "%lld\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_fw_ser, NULL,
+			 mt7915_fw_ser_set, "%lld\n");
+
+static int
+mt7915_fw_ser_stats_show(struct seq_file *s, void *data)
+{
+	struct mt7915_dev *dev = s->private;
+	int ret;
+
+	/* grab firmware SER stats */
+	ret = mt7915_mcu_set_ser(dev, 0, 0, 0);
+	if (ret)
+		return ret;
+
+	msleep(100);
+
+	seq_printf(s, "::E  R , SER_STATUS        = 0x%08x\n",
+		   MT_SWDEF_SER_STATS);
+	seq_printf(s, "::E  R , SER_PLE_ERR       = 0x%08x\n",
+		   MT_SWDEF_PLE_STATS);
+	seq_printf(s, "::E  R , SER_PLE_ERR_1     = 0x%08x\n",
+		   MT_SWDEF_PLE1_STATS);
+	seq_printf(s, "::E  R , SER_PLE_ERR_AMSDU = 0x%08x\n",
+		   MT_SWDEF_PLE_AMSDU_STATS);
+	seq_printf(s, "::E  R , SER_PSE_ERR       = 0x%08x\n",
+		   MT_SWDEF_PSE_STATS);
+	seq_printf(s, "::E  R , SER_PSE_ERR_1     = 0x%08x\n",
+		   MT_SWDEF_PSE1_STATS);
+	seq_printf(s, "::E  R , SER_LMAC_WISR6_B0 = 0x%08x\n",
+		   MT_SWDEF_LAMC_WISR6_BN0_STATS);
+	seq_printf(s, "::E  R , SER_LMAC_WISR6_B1 = 0x%08x\n",
+		   MT_SWDEF_LAMC_WISR6_BN1_STATS);
+	seq_printf(s, "::E  R , SER_LMAC_WISR7_B0 = 0x%08x\n",
+		   MT_SWDEF_LAMC_WISR7_BN0_STATS);
+	seq_printf(s, "::E  R , SER_LMAC_WISR7_B1 = 0x%08x\n",
+		   MT_SWDEF_LAMC_WISR7_BN1_STATS);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(mt7915_fw_ser_stats);
 
 static int
 mt7915_radar_trigger(void *data, u64 val)
@@ -884,6 +923,8 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
 	debugfs_create_file("xmit-queues", 0400, dir, phy,
 			    &mt7915_xmit_queues_fops);
 	debugfs_create_file("tx_stats", 0400, dir, phy, &mt7915_tx_stats_fops);
+	debugfs_create_file("fw_ser", 0200, dir, dev, &fops_fw_ser);
+	debugfs_create_file("fw_ser_stats", 0400, dir, dev, &mt7915_fw_ser_stats_fops);
 	debugfs_create_file("fw_debug_wm", 0600, dir, dev, &fops_fw_debug_wm);
 	debugfs_create_file("fw_debug_wa", 0600, dir, dev, &fops_fw_debug_wa);
 	debugfs_create_file("fw_debug_bin", 0600, dir, dev, &fops_fw_debug_bin);
@@ -897,7 +938,6 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
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
