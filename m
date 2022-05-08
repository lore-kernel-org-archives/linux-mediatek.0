Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9A4C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 May 2022 05:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YkDRWz8XYHM+HoQGsnHMHQqHYJwhyE6aMq4OT6xD2D8=; b=GAYlOH4RLmsSOh
	sgzKSYcCB2CnoXBYCZ1g0N9jvdRvhePIvKD9VAw9XxdhxjKTW2OQeOumTve/C0sqaviJnrD+9cePk
	EeVj8SOCE+e9acWKP8sxi/CuBWQKsJVCMNPDC9y+AF35o0KSWdu7d2lWCkeb1PDWJIhKrUmTajDKx
	39TAsLOKGknclko6nrkh/RvIPkSOwFNbUV/O3Q+PPPnHdXX1Kk+fOegpIOdggCPdFPLFBMpSGyXuQ
	6V22HElTJNRUo756ecBR5lUpiWxD4ZiBAK5dywFmIWNMarHlh+hxlkdsZ58ifvSLxAGCGGxgM698J
	GjYRiJ0PRQhESEp6WQog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnZPo-009AU7-Pp; Sun, 08 May 2022 05:25:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnZPk-009ASs-UT
 for linux-mediatek@lists.infradead.org; Sun, 08 May 2022 05:25:08 +0000
X-UUID: fa7f23e117a742d4be1212319a894005-20220507
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:0c86a526-a59a-4f7d-b61b-a39879185086, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:33909916-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: fa7f23e117a742d4be1212319a894005-20220507
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1199872557; Sat, 07 May 2022 22:24:59 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 7 May 2022 22:24:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sun, 8 May 2022 13:24:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 8 May 2022 13:24:56 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Ryder
 Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 2/2] mt76: mt7915: add more statistics from fw_util debugfs
 knobs
Date: Sun, 8 May 2022 13:24:54 +0800
Message-ID: <b3957480ad74444b7170f3f9f124bd043e1a0ce8.1651983999.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <210119c0737d72aa049c113dac48e22a4d84d689.1651983999.git.ryder.lee@mediatek.com>
References: <210119c0737d72aa049c113dac48e22a4d84d689.1651983999.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_222505_051759_89536AE7 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

Print out exception state and program counters of WA/WM MCUs.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/debugfs.c    |  8 ++++++++
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c   |  3 +++
 drivers/net/wireless/mediatek/mt76/mt7915/regs.h   | 14 ++++++++++----
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 656f3ffccf4b..6edbbce92926 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -597,6 +597,12 @@ mt7915_fw_util_wm_show(struct seq_file *file, void *data)
 {
 	struct mt7915_dev *dev = file->private;
 
+	seq_printf(file, "Program counter: 0x%x\n", mt76_rr(dev, MT_WM_MCU_PC));
+	seq_printf(file, "Exception state: 0x%x\n",
+		   is_mt7915(&dev->mt76) ?
+		   mt76_get_field(dev, MT_FW_EXCEPTION, GENMASK(15, 8)) :
+		   mt76_get_field(dev, MT_FW_EXCEPTION, GENMASK(7, 0)));
+
 	if (dev->fw.debug_wm) {
 		seq_printf(file, "Busy: %u%%  Peak busy: %u%%\n",
 			   mt76_rr(dev, MT_CPU_UTIL_BUSY_PCT),
@@ -616,6 +622,8 @@ mt7915_fw_util_wa_show(struct seq_file *file, void *data)
 {
 	struct mt7915_dev *dev = file->private;
 
+	seq_printf(file, "Program counter: 0x%x\n", mt76_rr(dev, MT_WA_MCU_PC));
+
 	if (dev->fw.debug_wa)
 		return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(QUERY),
 					 MCU_WA_PARAM_CPU_UTIL, 0, 0);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 3c55d4cebbf2..d95c32c7bd53 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -22,6 +22,7 @@ static const u32 mt7915_reg[] = {
 	[WFDMA_EXT_CSR_ADDR]	= 0xd7000,
 	[CBTOP1_PHY_END]	= 0x77ffffff,
 	[INFRA_MCU_ADDR_END]	= 0x7c3fffff,
+	[FW_EXCEPTION_ADDR]	= 0x219848,
 	[SWDEF_BASE_ADDR]	= 0x41f200,
 };
 
@@ -37,6 +38,7 @@ static const u32 mt7916_reg[] = {
 	[WFDMA_EXT_CSR_ADDR]	= 0xd7000,
 	[CBTOP1_PHY_END]	= 0x7fffffff,
 	[INFRA_MCU_ADDR_END]	= 0x7c085fff,
+	[FW_EXCEPTION_ADDR]	= 0x022050bc,
 	[SWDEF_BASE_ADDR]	= 0x411400,
 };
 
@@ -52,6 +54,7 @@ static const u32 mt7986_reg[] = {
 	[WFDMA_EXT_CSR_ADDR]	= 0x27000,
 	[CBTOP1_PHY_END]	= 0x7fffffff,
 	[INFRA_MCU_ADDR_END]	= 0x7c085fff,
+	[FW_EXCEPTION_ADDR]	= 0x02204ffc,
 	[SWDEF_BASE_ADDR]	= 0x411400,
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 7415118f6399..eb8891c53e9c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -30,6 +30,7 @@ enum reg_rev {
 	WFDMA_EXT_CSR_ADDR,
 	CBTOP1_PHY_END,
 	INFRA_MCU_ADDR_END,
+	FW_EXCEPTION_ADDR,
 	SWDEF_BASE_ADDR,
 	__MT_REG_MAX,
 };
@@ -922,6 +923,8 @@ enum offs_rev {
 #define MT_ADIE_TYPE_MASK		BIT(1)
 
 /* FW MODE SYNC */
+#define MT_FW_EXCEPTION		__REG(FW_EXCEPTION_ADDR)
+
 #define MT_SWDEF_BASE			__REG(SWDEF_BASE_ADDR)
 
 #define MT_SWDEF(ofs)			(MT_SWDEF_BASE + (ofs))
@@ -987,10 +990,6 @@ enum offs_rev {
 #define MT_TOP_MISC			MT_TOP(0xf0)
 #define MT_TOP_MISC_FW_STATE		GENMASK(2, 0)
 
-#define MT_HW_BOUND			0x70010020
-#define MT_HW_REV			0x70010204
-#define MT_WF_SUBSYS_RST		0x70002600
-
 #define MT_TOP_WFSYS_WAKEUP		MT_TOP(0x1a4)
 #define MT_TOP_WFSYS_WAKEUP_MASK	BIT(0)
 
@@ -1052,6 +1051,10 @@ enum offs_rev {
 #define MT_MCU_BUS_DBG_TIMEOUT_CK_EN_MASK BIT(3)
 #define MT_MCU_BUS_DBG_TIMEOUT_EN_MASK	BIT(2)
 
+#define MT_HW_BOUND			0x70010020
+#define MT_HW_REV			0x70010204
+#define MT_WF_SUBSYS_RST		0x70002600
+
 /* PCIE MAC */
 #define MT_PCIE_MAC_BASE		0x74030000
 #define MT_PCIE_MAC(ofs)		(MT_PCIE_MAC_BASE + (ofs))
@@ -1060,6 +1063,9 @@ enum offs_rev {
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
