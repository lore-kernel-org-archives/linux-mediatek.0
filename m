Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1487C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 May 2022 05:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iaKXfFN6W3sFq6ndrHrqiWjGwwasSZbwO+FfPfqQbDc=; b=HHKMGgmb5OHmGF
	j5yHxtL86/XnYNQ1ZE+FiStGh5/uT/6cN3h7TuxyEzvjUaatSVUGe3mGKAPQePkFTj8idybBY9jEz
	ej0uFsXSf7K/GKxcrHIRSBaHBQ9zPISxEuI3kJuppWeLRYQdz6TAKrLaN4h593HN4F/4EDAoTbEFe
	f3W1hJlhVW1wKS1sHEOsOyrMK62NAKucfeOAotnpqyw6Jh4+3GAr7x5UdEJfadlMadL1IRyJ6rl84
	6Fa78F29LHzW9KyEp+nJNthlaImVhew2swp9hR316sSOIjmW6au7WVQXjOPWDwARSGD3FgdG0JMMm
	5f2YrNPjndbQDYs7Bk7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnZPp-009AUD-Eu; Sun, 08 May 2022 05:25:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnZPk-009ASp-UT
 for linux-mediatek@lists.infradead.org; Sun, 08 May 2022 05:25:08 +0000
X-UUID: 3075e507777448a5ace1e880f7e4e509-20220507
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:01c932d0-b3b6-4e6e-871b-b627220e6f50, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:1640f9b2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 3075e507777448a5ace1e880f7e4e509-20220507
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 467999931; Sat, 07 May 2022 22:24:59 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 7 May 2022 22:24:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sun, 8 May 2022 13:24:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 8 May 2022 13:24:55 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Ryder
 Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 1/2] mt76: mt7915: improve error handling for fw_debug knobs
Date: Sun, 8 May 2022 13:24:53 +0800
Message-ID: <210119c0737d72aa049c113dac48e22a4d84d689.1651983999.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_222505_051944_DE3E11FE 
X-CRM114-Status: GOOD (  13.10  )
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

In case fw.debug_wm/wa might be unavailable.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
changes since v2:
- add exception state and split original patch into two pieces.
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 53 +++++++++++--------
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  9 ++--
 2 files changed, 37 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 875f17ff33a9..656f3ffccf4b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -447,20 +447,20 @@ mt7915_fw_debug_wm_set(void *data, u64 val)
 	bool tx, rx, en;
 	int ret;
 
-	dev->fw_debug_wm = val ? MCU_FW_LOG_TO_HOST : 0;
+	dev->fw.debug_wm = val ? MCU_FW_LOG_TO_HOST : 0;
 
-	if (dev->fw_debug_bin)
+	if (dev->fw.debug_bin)
 		val = 16;
 	else
-		val = dev->fw_debug_wm;
+		val = dev->fw.debug_wm;
 
-	tx = dev->fw_debug_wm || (dev->fw_debug_bin & BIT(1));
-	rx = dev->fw_debug_wm || (dev->fw_debug_bin & BIT(2));
-	en = dev->fw_debug_wm || (dev->fw_debug_bin & BIT(0));
+	tx = dev->fw.debug_wm || (dev->fw.debug_bin & BIT(1));
+	rx = dev->fw.debug_wm || (dev->fw.debug_bin & BIT(2));
+	en = dev->fw.debug_wm || (dev->fw.debug_bin & BIT(0));
 
 	ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WM, val);
 	if (ret)
-		return ret;
+		goto out;
 
 	for (debug = DEBUG_TXCMD; debug <= DEBUG_RPT_RX; debug++) {
 		if (debug == DEBUG_RPT_RX)
@@ -470,16 +470,20 @@ mt7915_fw_debug_wm_set(void *data, u64 val)
 
 		ret = mt7915_mcu_fw_dbg_ctrl(dev, debug, val);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	/* WM CPU info record control */
 	mt76_clear(dev, MT_CPU_UTIL_CTRL, BIT(0));
-	mt76_wr(dev, MT_DIC_CMD_REG_CMD, BIT(2) | BIT(13) | !dev->fw_debug_wm);
+	mt76_wr(dev, MT_DIC_CMD_REG_CMD, BIT(2) | BIT(13) | !dev->fw.debug_wm);
 	mt76_wr(dev, MT_MCU_WM_CIRQ_IRQ_MASK_CLR_ADDR, BIT(5));
 	mt76_wr(dev, MT_MCU_WM_CIRQ_IRQ_SOFT_ADDR, BIT(5));
 
-	return 0;
+out:
+	if (ret)
+		dev->fw.debug_wm = 0;
+
+	return ret;
 }
 
 static int
@@ -487,7 +491,7 @@ mt7915_fw_debug_wm_get(void *data, u64 *val)
 {
 	struct mt7915_dev *dev = data;
 
-	*val = dev->fw_debug_wm;
+	*val = dev->fw.debug_wm;
 
 	return 0;
 }
@@ -501,14 +505,19 @@ mt7915_fw_debug_wa_set(void *data, u64 val)
 	struct mt7915_dev *dev = data;
 	int ret;
 
-	dev->fw_debug_wa = val ? MCU_FW_LOG_TO_HOST : 0;
+	dev->fw.debug_wa = val ? MCU_FW_LOG_TO_HOST : 0;
+
+	ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, dev->fw.debug_wa);
+	if (ret)
+		goto out;
 
-	ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, dev->fw_debug_wa);
+	ret = mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
+				MCU_WA_PARAM_PDMA_RX, !!dev->fw.debug_wa, 0);
+out:
 	if (ret)
-		return ret;
+		dev->fw.debug_wa = 0;
 
-	return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET), MCU_WA_PARAM_PDMA_RX,
-				 !!dev->fw_debug_wa, 0);
+	return ret;
 }
 
 static int
@@ -516,7 +525,7 @@ mt7915_fw_debug_wa_get(void *data, u64 *val)
 {
 	struct mt7915_dev *dev = data;
 
-	*val = dev->fw_debug_wa;
+	*val = dev->fw.debug_wa;
 
 	return 0;
 }
@@ -563,11 +572,11 @@ mt7915_fw_debug_bin_set(void *data, u64 val)
 	if (!dev->relay_fwlog)
 		return -ENOMEM;
 
-	dev->fw_debug_bin = val;
+	dev->fw.debug_bin = val;
 
 	relay_reset(dev->relay_fwlog);
 
-	return mt7915_fw_debug_wm_set(dev, dev->fw_debug_wm);
+	return mt7915_fw_debug_wm_set(dev, dev->fw.debug_wm);
 }
 
 static int
@@ -575,7 +584,7 @@ mt7915_fw_debug_bin_get(void *data, u64 *val)
 {
 	struct mt7915_dev *dev = data;
 
-	*val = dev->fw_debug_bin;
+	*val = dev->fw.debug_bin;
 
 	return 0;
 }
@@ -588,7 +597,7 @@ mt7915_fw_util_wm_show(struct seq_file *file, void *data)
 {
 	struct mt7915_dev *dev = file->private;
 
-	if (dev->fw_debug_wm) {
+	if (dev->fw.debug_wm) {
 		seq_printf(file, "Busy: %u%%  Peak busy: %u%%\n",
 			   mt76_rr(dev, MT_CPU_UTIL_BUSY_PCT),
 			   mt76_rr(dev, MT_CPU_UTIL_PEAK_BUSY_PCT));
@@ -607,7 +616,7 @@ mt7915_fw_util_wa_show(struct seq_file *file, void *data)
 {
 	struct mt7915_dev *dev = file->private;
 
-	if (dev->fw_debug_wa)
+	if (dev->fw.debug_wa)
 		return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(QUERY),
 					 MCU_WA_PARAM_CPU_UTIL, 0, 0);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 42e195dded01..72be5bceeb50 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -311,15 +311,18 @@ struct mt7915_dev {
 	bool flash_mode;
 	bool muru_debug;
 	bool ibf;
-	u8 fw_debug_wm;
-	u8 fw_debug_wa;
-	u8 fw_debug_bin;
 
 	struct dentry *debugfs_dir;
 	struct rchan *relay_fwlog;
 
 	void *cal;
 
+	struct {
+		u8 debug_wm;
+		u8 debug_wa;
+		u8 debug_bin;
+	} fw;
+
 	struct {
 		u8 table_mask;
 		u8 n_agrt;
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
