Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 11:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6oFUZ9w7bNqRaD1M7O0NHMah6XW8wl1QpdzXddwUgoA=; b=JTTL7hykrFKDND
	rZWiRwyTa+S18Zt1A/qbcOW1gdY1Jv15ocWDKVQ5Y/CtiEz63Ume8AQKfXBfC6cz/mCPw9JbBV5Yr
	WKLaK7H5lySeUY6iWWRVV7tBPBBM1NpSikHY8Hc71Bi97ugcdrJAsB2Lr/uEf1yKbWMgs97mK29W9
	w6/ln5H+z6xH9F+N1Wk1eQD+x/POkedAvXdf4VGwGXEH9jYG+l1uUSL/8xouxx9id6Z+zr9e8/Zjt
	VfWPMT81on423SGBx13WT6eMWLiXZE76oK7LZGfKLAe+kf6Cp+AKjH7XxIpEnPLGlrR7AsONSooPS
	7Vlp0aOfaVY+HT/raTJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRung-008O1r-99; Wed, 09 Mar 2022 11:48:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRums-008NgC-F5; Wed, 09 Mar 2022 11:47:30 +0000
X-UUID: 9c76d289df034666a1857d8283325c22-20220309
X-UUID: 9c76d289df034666a1857d8283325c22-20220309
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1779927580; Wed, 09 Mar 2022 04:47:18 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Mar 2022 03:47:16 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 9 Mar 2022 19:47:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Mar 2022 19:47:15 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-remoteproc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>
Subject: [PATCH] remoteproc: mediatek: fix side effect of mt8195 sram power on
Date: Wed, 9 Mar 2022 19:47:13 +0800
Message-ID: <20220309114713.8156-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_034726_587946_821EB5A5 
X-CRM114-Status: GOOD (  18.51  )
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

The definition of L1TCM_SRAM_PDN bits on mt8195 is different to mt8192.

L1TCM_SRAM_PDN bits[3:0] control the power of mt8195 L1TCM SRAM.

L1TCM_SRAM_PDN bits[7:4] control the access path to EMI for SCP.
These bits have to be powered on to allow EMI access for SCP.

Bits[7:4] also affect audio DSP because audio DSP and SCP are
placed on the same hardware bus. If SCP cannot access EMI, audio DSP is
blocked too.

L1TCM_SRAM_PDN bits[31:8] are not used.

This fix removes modification of bits[7:4] when power on/off mt8195 SCP
L1TCM. It's because the modification introduces a short period of time
blocking audio DSP to access EMI. This was not a problem until we have
to load both SCP module and audio DSP module. audio DSP needs to access
EMI because it has source/data on DRAM. Audio DSP will have unexpected
behavior when it accesses EMI and the SCP driver blocks the EMI path at
the same time.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_common.h |  4 +++
 drivers/remoteproc/mtk_scp.c    | 57 +++++++++++++++++++++++++++++----
 2 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 5ff3867c72f3..27e7172c926d 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -51,6 +51,10 @@
 #define MT8192_CORE0_WDT_IRQ		0x10030
 #define MT8192_CORE0_WDT_CFG		0x10034
 
+#define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		0xF0
+#define MT8195_L1TCM_SRAM_PDN_RESERVED_BITS \
+	MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS
+
 #define SCP_FW_VER_LEN			32
 #define SCP_SHARE_BUFFER_SIZE		288
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index dcddb33e9997..4d75af856fd1 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -365,22 +365,32 @@ static int mt8183_scp_before_load(struct mtk_scp *scp)
 	return 0;
 }
 
-static void mt8192_power_on_sram(void __iomem *addr)
+static void scp_sram_power_on(void __iomem *addr, u32 reserved_mask)
 {
 	int i;
 
 	for (i = 31; i >= 0; i--)
-		writel(GENMASK(i, 0), addr);
+		writel(GENMASK(i, 0) & ~reserved_mask, addr);
 	writel(0, addr);
 }
 
-static void mt8192_power_off_sram(void __iomem *addr)
+static void scp_sram_power_off(void __iomem *addr, u32 reserved_mask)
 {
 	int i;
 
 	writel(0, addr);
 	for (i = 0; i < 32; i++)
-		writel(GENMASK(i, 0), addr);
+		writel(GENMASK(i, 0) & ~reserved_mask, addr);
+}
+
+static void mt8192_power_on_sram(void __iomem *addr)
+{
+	scp_sram_power_on(addr, 0);
+}
+
+static void mt8192_power_off_sram(void __iomem *addr)
+{
+	scp_sram_power_off(addr, 0);
 }
 
 static int mt8192_scp_before_load(struct mtk_scp *scp)
@@ -403,6 +413,27 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	return 0;
 }
 
+static int mt8195_scp_before_load(struct mtk_scp *scp)
+{
+	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
+	writel(0xff, scp->reg_base + MT8192_SCP2SPM_IPC_CLR);
+
+	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
+
+	/* enable SRAM clock */
+	mt8192_power_on_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_0);
+	mt8192_power_on_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_1);
+	mt8192_power_on_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_2);
+	scp_sram_power_on(scp->reg_base + MT8192_L1TCM_SRAM_PDN,
+			  MT8195_L1TCM_SRAM_PDN_RESERVED_BITS);
+	mt8192_power_on_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
+
+	/* enable MPU for all memory regions */
+	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
+
+	return 0;
+}
+
 static int scp_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct mtk_scp *scp = rproc->priv;
@@ -561,6 +592,20 @@ static void mt8192_scp_stop(struct mtk_scp *scp)
 	writel(0, scp->reg_base + MT8192_CORE0_WDT_CFG);
 }
 
+static void mt8195_scp_stop(struct mtk_scp *scp)
+{
+	/* Disable SRAM clock */
+	mt8192_power_off_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_0);
+	mt8192_power_off_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_1);
+	mt8192_power_off_sram(scp->reg_base + MT8192_L2TCM_SRAM_PD_2);
+	scp_sram_power_off(scp->reg_base + MT8192_L1TCM_SRAM_PDN,
+			   MT8195_L1TCM_SRAM_PDN_RESERVED_BITS);
+	mt8192_power_off_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
+
+	/* Disable SCP watchdog */
+	writel(0, scp->reg_base + MT8192_CORE0_WDT_CFG);
+}
+
 static int scp_stop(struct rproc *rproc)
 {
 	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
@@ -888,11 +933,11 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 
 static const struct mtk_scp_of_data mt8195_of_data = {
 	.scp_clk_get = mt8195_scp_clk_get,
-	.scp_before_load = mt8192_scp_before_load,
+	.scp_before_load = mt8195_scp_before_load,
 	.scp_irq_handler = mt8192_scp_irq_handler,
 	.scp_reset_assert = mt8192_scp_reset_assert,
 	.scp_reset_deassert = mt8192_scp_reset_deassert,
-	.scp_stop = mt8192_scp_stop,
+	.scp_stop = mt8195_scp_stop,
 	.scp_da_to_va = mt8192_scp_da_to_va,
 	.host_to_scp_reg = MT8192_GIPC_IN_SET,
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
