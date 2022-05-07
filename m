Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA56BC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 22:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ZmvTMPS+J6Kk64zM1OLJzefW8PLxs4N87N3oYlwknc=; b=rgOqq+AjHGnflr
	i9taAFcKIFWNKaezgzvEVN486aIKgV7sBhugkVz3Y+qwYQ4bhbfY/VtuHzT+JvGeDK+t2MLP6Q9Um
	t30NyypUT3X7egiZFKainixDqmdMbCnHL3k6PMQCJLBTGdQkwjvGZjQ7VoSc8IhLbq5SOPZ6lNGJE
	b550/5DRM4ko/jS3dKDHnUBiyt+che8ryCdIiMJmfEKktZseTsi+/IJxs60KcKVux3+C+lBnephA6
	XwYKjXGlrQ2Mq85PHcmrjiokG7LdllwgAedL89qsUrLyXSSaKuECOm6rCRpTlejEUTPLMiRpQNuJ+
	yXxeqvID10hmSEw8LlsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnTCO-008VBF-9F; Sat, 07 May 2022 22:46:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnTCI-008VAO-Mt
 for linux-mediatek@lists.infradead.org; Sat, 07 May 2022 22:46:51 +0000
X-UUID: e368a1bf8c31456c88cc6e871383979b-20220507
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:07bb7228-c147-40fd-a392-e9baf8813f71, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:a464f4b2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: e368a1bf8c31456c88cc6e871383979b-20220507
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 763787951; Sat, 07 May 2022 15:46:40 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 7 May 2022 15:46:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 May 2022 06:46:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Sun, 8 May 2022 06:46:37 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7915: rework fw_util debugfs knob
Date: Sun, 8 May 2022 06:45:37 +0800
Message-ID: <7a47e6fb793030daf592a4e2fcd9cee71d8daf77.1651963443.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_154646_795998_41483C89 
X-CRM114-Status: GOOD (  10.06  )
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

Improve error handlings and add MCU program counters for debug.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 25 ++++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7915/regs.h  | 11 +++++---
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 875f17ff33a9..2725b1b80634 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -460,7 +460,7 @@ mt7915_fw_debug_wm_set(void *data, u64 val)
 
 	ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WM, val);
 	if (ret)
-		return ret;
+		goto out;
 
 	for (debug = DEBUG_TXCMD; debug <= DEBUG_RPT_RX; debug++) {
 		if (debug == DEBUG_RPT_RX)
@@ -470,7 +470,7 @@ mt7915_fw_debug_wm_set(void *data, u64 val)
 
 		ret = mt7915_mcu_fw_dbg_ctrl(dev, debug, val);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	/* WM CPU info record control */
@@ -479,7 +479,11 @@ mt7915_fw_debug_wm_set(void *data, u64 val)
 	mt76_wr(dev, MT_MCU_WM_CIRQ_IRQ_MASK_CLR_ADDR, BIT(5));
 	mt76_wr(dev, MT_MCU_WM_CIRQ_IRQ_SOFT_ADDR, BIT(5));
 
-	return 0;
+out:
+	if (ret)
+		dev->fw_debug_wm = 0;
+
+	return ret;
 }
 
 static int
@@ -505,10 +509,15 @@ mt7915_fw_debug_wa_set(void *data, u64 val)
 
 	ret = mt7915_mcu_fw_log_2_host(dev, MCU_FW_LOG_WA, dev->fw_debug_wa);
 	if (ret)
-		return ret;
+		goto out;
+
+	ret = mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
+				MCU_WA_PARAM_PDMA_RX, !!dev->fw_debug_wa, 0);
+out:
+	if (ret)
+		dev->fw_debug_wa = 0;
 
-	return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET), MCU_WA_PARAM_PDMA_RX,
-				 !!dev->fw_debug_wa, 0);
+	return ret;
 }
 
 static int
@@ -588,6 +597,8 @@ mt7915_fw_util_wm_show(struct seq_file *file, void *data)
 {
 	struct mt7915_dev *dev = file->private;
 
+	seq_printf(file, "Program counter: 0x%x\n", mt76_rr(dev, MT_WM_MCU_PC));
+
 	if (dev->fw_debug_wm) {
 		seq_printf(file, "Busy: %u%%  Peak busy: %u%%\n",
 			   mt76_rr(dev, MT_CPU_UTIL_BUSY_PCT),
@@ -607,6 +618,8 @@ mt7915_fw_util_wa_show(struct seq_file *file, void *data)
 {
 	struct mt7915_dev *dev = file->private;
 
+	seq_printf(file, "Program counter: 0x%x\n", mt76_rr(dev, MT_WA_MCU_PC));
+
 	if (dev->fw_debug_wa)
 		return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(QUERY),
 					 MCU_WA_PARAM_CPU_UTIL, 0, 0);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 7415118f6399..f9479319fb62 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -987,10 +987,6 @@ enum offs_rev {
 #define MT_TOP_MISC			MT_TOP(0xf0)
 #define MT_TOP_MISC_FW_STATE		GENMASK(2, 0)
 
-#define MT_HW_BOUND			0x70010020
-#define MT_HW_REV			0x70010204
-#define MT_WF_SUBSYS_RST		0x70002600
-
 #define MT_TOP_WFSYS_WAKEUP		MT_TOP(0x1a4)
 #define MT_TOP_WFSYS_WAKEUP_MASK	BIT(0)
 
@@ -1052,6 +1048,10 @@ enum offs_rev {
 #define MT_MCU_BUS_DBG_TIMEOUT_CK_EN_MASK BIT(3)
 #define MT_MCU_BUS_DBG_TIMEOUT_EN_MASK	BIT(2)
 
+#define MT_HW_BOUND			0x70010020
+#define MT_HW_REV			0x70010204
+#define MT_WF_SUBSYS_RST		0x70002600
+
 /* PCIE MAC */
 #define MT_PCIE_MAC_BASE		0x74030000
 #define MT_PCIE_MAC(ofs)		(MT_PCIE_MAC_BASE + (ofs))
@@ -1060,6 +1060,9 @@ enum offs_rev {
 #define MT_PCIE1_MAC_INT_ENABLE		0x74020188
 #define MT_PCIE1_MAC_INT_ENABLE_MT7916	0x74090188
 
+#define MT_WM_MCU_PC			0x7c060204
+#define MT_WA_MCU_PC			0x7c06020c
+
 /* PP TOP */
 #define MT_WF_PP_TOP_BASE		0x820cc000
 #define MT_WF_PP_TOP(ofs)		(MT_WF_PP_TOP_BASE + (ofs))
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
