Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B120AEB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 02:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqe4y7akWk4vh9DHQ2bMXFCj7hfb7W/6pohIRXHZLEY=; b=3FTZ9AsAVPw8WhW0+fzJ+0YD+S
	fcSttZn9wZ7tGZ9ft+TznKsmZu0PCcr7ynQQye+Za/AezFGRkiPpJBvSmpu+DhwsxkUt1Q9P03lDb
	EZ828fDMeis5QyGSTkspm0/5MREdZjgKCk5LmSJ0Q4gp6swo87NZ9BIaGZ/uxlwVyrdpDkhSYtEqb
	3PJlLf7DSIplXLXe/8ZdIIuEVFl8wNZq91hFO1W7eEYgCYHDg1POX569cObpwpUM3wpFQQqOSGxrI
	EV3JJ9X9DymHsuXBKgVs0E9cKwtFugLppiCY8JQgDo8m8MWqyCBB9zONPXRY79g5fuljqyhLjt7aZ
	zGzwovnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMg6P-00CeKo-1q;
	Fri, 21 Jul 2023 02:42:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMg6A-00Ce9U-0x;
	Fri, 21 Jul 2023 02:42:34 +0000
X-UUID: 3a18e932277011ee912e1518a6540028-20230720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xqe4y7akWk4vh9DHQ2bMXFCj7hfb7W/6pohIRXHZLEY=;
	b=aqUZUKqMSNcOgEzqzObWBsxKi7B9a+563dp3rI2UVRE02eQTo4rCwjQr9+cHKtka4SUjc/67Dm47W7mnWTu1SkaBlYur8d/7dGTSEZl0OATYIdWsHrOonzt7R/ACSygvVtbvpUXeJQMqi2/hqyE/spTkxTZNtwr1LDsxMNgEo+M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:7b2bf571-13b1-4e61-a3bf-92050bbb5c95,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.28,REQID:7b2bf571-13b1-4e61-a3bf-92050bbb5c95,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:176cd25,CLOUDID:5d16d8dc-dc79-4898-9235-1134b97257a8,B
	ulkID:230721104152KQQFPAH6,BulkQuantity:2,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 3a18e932277011ee912e1518a6540028-20230720
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1725718704; Thu, 20 Jul 2023 19:42:25 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 21 Jul 2023 10:41:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 21 Jul 2023 10:41:50 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Tinghan Shen" <tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v15 05/13] remoteproc: mediatek: Extract SCP common registers
Date: Fri, 21 Jul 2023 10:41:24 +0800
Message-ID: <20230721024132.6548-6-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230721024132.6548-1-tinghan.shen@mediatek.com>
References: <20230721024132.6548-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_194230_341510_1FDFAAF7 
X-CRM114-Status: GOOD (  17.71  )
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

This is the 1st preliminary steps for probing multi-core SCP.
The registers of config and l1tcm are common on single-core SCP
and multi-core SCP. Extract these registers out to reduce duplicated
fields in mtk_scp when probing multi-core SCP.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_common.h  |  13 +-
 drivers/remoteproc/mtk_scp.c     | 201 +++++++++++++++++--------------
 drivers/remoteproc/mtk_scp_ipi.c |   4 +-
 3 files changed, 122 insertions(+), 96 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index c0905aec3b4b..b04d71277c1f 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -100,17 +100,20 @@ struct mtk_scp_of_data {
 	size_t ipi_buf_offset;
 };
 
+struct mtk_scp_of_cluster {
+	void __iomem *reg_base;
+	void __iomem *l1tcm_base;
+	size_t l1tcm_size;
+	phys_addr_t l1tcm_phys;
+};
+
 struct mtk_scp {
 	struct device *dev;
 	struct rproc *rproc;
 	struct clk *clk;
-	void __iomem *reg_base;
 	void __iomem *sram_base;
 	size_t sram_size;
 	phys_addr_t sram_phys;
-	void __iomem *l1tcm_base;
-	size_t l1tcm_size;
-	phys_addr_t l1tcm_phys;
 
 	const struct mtk_scp_of_data *data;
 
@@ -128,6 +131,8 @@ struct mtk_scp {
 	size_t dram_size;
 
 	struct rproc_subdev *rpmsg_subdev;
+
+	struct mtk_scp_of_cluster *cluster;
 };
 
 /**
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 48e759c2d486..9486f5020946 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -152,45 +152,45 @@ static void mt8183_scp_reset_assert(struct mtk_scp *scp)
 {
 	u32 val;
 
-	val = readl(scp->reg_base + MT8183_SW_RSTN);
+	val = readl(scp->cluster->reg_base + MT8183_SW_RSTN);
 	val &= ~MT8183_SW_RSTN_BIT;
-	writel(val, scp->reg_base + MT8183_SW_RSTN);
+	writel(val, scp->cluster->reg_base + MT8183_SW_RSTN);
 }
 
 static void mt8183_scp_reset_deassert(struct mtk_scp *scp)
 {
 	u32 val;
 
-	val = readl(scp->reg_base + MT8183_SW_RSTN);
+	val = readl(scp->cluster->reg_base + MT8183_SW_RSTN);
 	val |= MT8183_SW_RSTN_BIT;
-	writel(val, scp->reg_base + MT8183_SW_RSTN);
+	writel(val, scp->cluster->reg_base + MT8183_SW_RSTN);
 }
 
 static void mt8192_scp_reset_assert(struct mtk_scp *scp)
 {
-	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
+	writel(1, scp->cluster->reg_base + MT8192_CORE0_SW_RSTN_SET);
 }
 
 static void mt8192_scp_reset_deassert(struct mtk_scp *scp)
 {
-	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_CLR);
+	writel(1, scp->cluster->reg_base + MT8192_CORE0_SW_RSTN_CLR);
 }
 
 static void mt8195_scp_c1_reset_assert(struct mtk_scp *scp)
 {
-	writel(1, scp->reg_base + MT8195_CORE1_SW_RSTN_SET);
+	writel(1, scp->cluster->reg_base + MT8195_CORE1_SW_RSTN_SET);
 }
 
 static void mt8195_scp_c1_reset_deassert(struct mtk_scp *scp)
 {
-	writel(1, scp->reg_base + MT8195_CORE1_SW_RSTN_CLR);
+	writel(1, scp->cluster->reg_base + MT8195_CORE1_SW_RSTN_CLR);
 }
 
 static void mt8183_scp_irq_handler(struct mtk_scp *scp)
 {
 	u32 scp_to_host;
 
-	scp_to_host = readl(scp->reg_base + MT8183_SCP_TO_HOST);
+	scp_to_host = readl(scp->cluster->reg_base + MT8183_SCP_TO_HOST);
 	if (scp_to_host & MT8183_SCP_IPC_INT_BIT)
 		scp_ipi_handler(scp);
 	else
@@ -198,14 +198,14 @@ static void mt8183_scp_irq_handler(struct mtk_scp *scp)
 
 	/* SCP won't send another interrupt until we set SCP_TO_HOST to 0. */
 	writel(MT8183_SCP_IPC_INT_BIT | MT8183_SCP_WDT_INT_BIT,
-	       scp->reg_base + MT8183_SCP_TO_HOST);
+	       scp->cluster->reg_base + MT8183_SCP_TO_HOST);
 }
 
 static void mt8192_scp_irq_handler(struct mtk_scp *scp)
 {
 	u32 scp_to_host;
 
-	scp_to_host = readl(scp->reg_base + MT8192_SCP2APMCU_IPC_SET);
+	scp_to_host = readl(scp->cluster->reg_base + MT8192_SCP2APMCU_IPC_SET);
 
 	if (scp_to_host & MT8192_SCP_IPC_INT_BIT) {
 		scp_ipi_handler(scp);
@@ -215,10 +215,10 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
 		 * MT8192_SCP2APMCU_IPC.
 		 */
 		writel(MT8192_SCP_IPC_INT_BIT,
-		       scp->reg_base + MT8192_SCP2APMCU_IPC_CLR);
+		       scp->cluster->reg_base + MT8192_SCP2APMCU_IPC_CLR);
 	} else {
 		scp_wdt_handler(scp, scp_to_host);
-		writel(1, scp->reg_base + MT8192_CORE0_WDT_IRQ);
+		writel(1, scp->cluster->reg_base + MT8192_CORE0_WDT_IRQ);
 	}
 }
 
@@ -226,12 +226,12 @@ static void mt8195_scp_c1_irq_handler(struct mtk_scp *scp)
 {
 	u32 scp_to_host;
 
-	scp_to_host = readl(scp->reg_base + MT8195_SSHUB2APMCU_IPC_SET);
+	scp_to_host = readl(scp->cluster->reg_base + MT8195_SSHUB2APMCU_IPC_SET);
 
 	if (scp_to_host & MT8192_SCP_IPC_INT_BIT)
 		scp_ipi_handler(scp);
 
-	writel(scp_to_host, scp->reg_base + MT8195_SSHUB2APMCU_IPC_CLR);
+	writel(scp_to_host, scp->cluster->reg_base + MT8195_SSHUB2APMCU_IPC_CLR);
 }
 
 static irqreturn_t scp_irq_handler(int irq, void *priv)
@@ -363,26 +363,26 @@ static int mt8195_scp_clk_get(struct mtk_scp *scp)
 static int mt8183_scp_before_load(struct mtk_scp *scp)
 {
 	/* Clear SCP to host interrupt */
-	writel(MT8183_SCP_IPC_INT_BIT, scp->reg_base + MT8183_SCP_TO_HOST);
+	writel(MT8183_SCP_IPC_INT_BIT, scp->cluster->reg_base + MT8183_SCP_TO_HOST);
 
 	/* Reset clocks before loading FW */
-	writel(0x0, scp->reg_base + MT8183_SCP_CLK_SW_SEL);
-	writel(0x0, scp->reg_base + MT8183_SCP_CLK_DIV_SEL);
+	writel(0x0, scp->cluster->reg_base + MT8183_SCP_CLK_SW_SEL);
+	writel(0x0, scp->cluster->reg_base + MT8183_SCP_CLK_DIV_SEL);
 
 	/* Initialize TCM before loading FW. */
-	writel(0x0, scp->reg_base + MT8183_SCP_L1_SRAM_PD);
-	writel(0x0, scp->reg_base + MT8183_SCP_TCM_TAIL_SRAM_PD);
+	writel(0x0, scp->cluster->reg_base + MT8183_SCP_L1_SRAM_PD);
+	writel(0x0, scp->cluster->reg_base + MT8183_SCP_TCM_TAIL_SRAM_PD);
 
 	/* Turn on the power of SCP's SRAM before using it. */
-	writel(0x0, scp->reg_base + MT8183_SCP_SRAM_PDN);
+	writel(0x0, scp->cluster->reg_base + MT8183_SCP_SRAM_PDN);
 
 	/*
 	 * Set I-cache and D-cache size before loading SCP FW.
 	 * SCP SRAM logical address may change when cache size setting differs.
 	 */
 	writel(MT8183_SCP_CACHE_CON_WAYEN | MT8183_SCP_CACHESIZE_8KB,
-	       scp->reg_base + MT8183_SCP_CACHE_CON);
-	writel(MT8183_SCP_CACHESIZE_8KB, scp->reg_base + MT8183_SCP_DCACHE_CON);
+	       scp->cluster->reg_base + MT8183_SCP_CACHE_CON);
+	writel(MT8183_SCP_CACHESIZE_8KB, scp->cluster->reg_base + MT8183_SCP_DCACHE_CON);
 
 	return 0;
 }
@@ -408,28 +408,28 @@ static void scp_sram_power_off(void __iomem *addr, u32 reserved_mask)
 static int mt8186_scp_before_load(struct mtk_scp *scp)
 {
 	/* Clear SCP to host interrupt */
-	writel(MT8183_SCP_IPC_INT_BIT, scp->reg_base + MT8183_SCP_TO_HOST);
+	writel(MT8183_SCP_IPC_INT_BIT, scp->cluster->reg_base + MT8183_SCP_TO_HOST);
 
 	/* Reset clocks before loading FW */
-	writel(0x0, scp->reg_base + MT8183_SCP_CLK_SW_SEL);
-	writel(0x0, scp->reg_base + MT8183_SCP_CLK_DIV_SEL);
+	writel(0x0, scp->cluster->reg_base + MT8183_SCP_CLK_SW_SEL);
+	writel(0x0, scp->cluster->reg_base + MT8183_SCP_CLK_DIV_SEL);
 
 	/* Turn on the power of SCP's SRAM before using it. Enable 1 block per time*/
-	scp_sram_power_on(scp->reg_base + MT8183_SCP_SRAM_PDN, 0);
+	scp_sram_power_on(scp->cluster->reg_base + MT8183_SCP_SRAM_PDN, 0);
 
 	/* Initialize TCM before loading FW. */
-	writel(0x0, scp->reg_base + MT8183_SCP_L1_SRAM_PD);
-	writel(0x0, scp->reg_base + MT8183_SCP_TCM_TAIL_SRAM_PD);
-	writel(0x0, scp->reg_base + MT8186_SCP_L1_SRAM_PD_P1);
-	writel(0x0, scp->reg_base + MT8186_SCP_L1_SRAM_PD_p2);
+	writel(0x0, scp->cluster->reg_base + MT8183_SCP_L1_SRAM_PD);
+	writel(0x0, scp->cluster->reg_base + MT8183_SCP_TCM_TAIL_SRAM_PD);
+	writel(0x0, scp->cluster->reg_base + MT8186_SCP_L1_SRAM_PD_P1);
+	writel(0x0, scp->cluster->reg_base + MT8186_SCP_L1_SRAM_PD_p2);
 
 	/*
 	 * Set I-cache and D-cache size before loading SCP FW.
 	 * SCP SRAM logical address may change when cache size setting differs.
 	 */
 	writel(MT8183_SCP_CACHE_CON_WAYEN | MT8183_SCP_CACHESIZE_8KB,
-	       scp->reg_base + MT8183_SCP_CACHE_CON);
-	writel(MT8183_SCP_CACHESIZE_8KB, scp->reg_base + MT8183_SCP_DCACHE_CON);
+	       scp->cluster->reg_base + MT8183_SCP_CACHE_CON);
+	writel(MT8183_SCP_CACHESIZE_8KB, scp->cluster->reg_base + MT8183_SCP_DCACHE_CON);
 
 	return 0;
 }
@@ -437,19 +437,19 @@ static int mt8186_scp_before_load(struct mtk_scp *scp)
 static int mt8192_scp_before_load(struct mtk_scp *scp)
 {
 	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
-	writel(0xff, scp->reg_base + MT8192_SCP2SPM_IPC_CLR);
+	writel(0xff, scp->cluster->reg_base + MT8192_SCP2SPM_IPC_CLR);
 
-	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
+	writel(1, scp->cluster->reg_base + MT8192_CORE0_SW_RSTN_SET);
 
 	/* enable SRAM clock */
-	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
-	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
-	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
-	scp_sram_power_on(scp->reg_base + MT8192_L1TCM_SRAM_PDN, 0);
-	scp_sram_power_on(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
+	scp_sram_power_on(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
+	scp_sram_power_on(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
+	scp_sram_power_on(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
+	scp_sram_power_on(scp->cluster->reg_base + MT8192_L1TCM_SRAM_PDN, 0);
+	scp_sram_power_on(scp->cluster->reg_base + MT8192_CPU0_SRAM_PD, 0);
 
 	/* enable MPU for all memory regions */
-	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
+	writel(0xff, scp->cluster->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
 
 	return 0;
 }
@@ -457,20 +457,20 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 static int mt8195_scp_before_load(struct mtk_scp *scp)
 {
 	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
-	writel(0xff, scp->reg_base + MT8192_SCP2SPM_IPC_CLR);
+	writel(0xff, scp->cluster->reg_base + MT8192_SCP2SPM_IPC_CLR);
 
-	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
+	writel(1, scp->cluster->reg_base + MT8192_CORE0_SW_RSTN_SET);
 
 	/* enable SRAM clock */
-	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
-	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
-	scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
-	scp_sram_power_on(scp->reg_base + MT8192_L1TCM_SRAM_PDN,
+	scp_sram_power_on(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
+	scp_sram_power_on(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
+	scp_sram_power_on(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
+	scp_sram_power_on(scp->cluster->reg_base + MT8192_L1TCM_SRAM_PDN,
 			  MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS);
-	scp_sram_power_on(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
+	scp_sram_power_on(scp->cluster->reg_base + MT8192_CPU0_SRAM_PD, 0);
 
 	/* enable MPU for all memory regions */
-	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
+	writel(0xff, scp->cluster->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
 
 	return 0;
 }
@@ -479,10 +479,10 @@ static int mt8195_scp_c1_before_load(struct mtk_scp *scp)
 {
 	scp->data->scp_reset_assert(scp);
 
-	scp_sram_power_on(scp->reg_base + MT8195_CPU1_SRAM_PD, 0);
+	scp_sram_power_on(scp->cluster->reg_base + MT8195_CPU1_SRAM_PD, 0);
 
 	/* enable MPU for all memory regions */
-	writel(0xff, scp->reg_base + MT8195_CORE1_MEM_ATT_PREDEF);
+	writel(0xff, scp->cluster->reg_base + MT8195_CORE1_MEM_ATT_PREDEF);
 
 	return 0;
 }
@@ -601,11 +601,11 @@ static void *mt8192_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
 	}
 
 	/* optional memory region */
-	if (scp->l1tcm_size &&
-	    da >= scp->l1tcm_phys &&
-	    (da + len) <= scp->l1tcm_phys + scp->l1tcm_size) {
-		offset = da - scp->l1tcm_phys;
-		return (void __force *)scp->l1tcm_base + offset;
+	if (scp->cluster->l1tcm_size &&
+	    da >= scp->cluster->l1tcm_phys &&
+	    (da + len) <= scp->cluster->l1tcm_phys + scp->cluster->l1tcm_size) {
+		offset = da - scp->cluster->l1tcm_phys;
+		return (void __force *)scp->cluster->l1tcm_base + offset;
 	}
 
 	/* optional memory region */
@@ -629,43 +629,43 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iome
 static void mt8183_scp_stop(struct mtk_scp *scp)
 {
 	/* Disable SCP watchdog */
-	writel(0, scp->reg_base + MT8183_WDT_CFG);
+	writel(0, scp->cluster->reg_base + MT8183_WDT_CFG);
 }
 
 static void mt8192_scp_stop(struct mtk_scp *scp)
 {
 	/* Disable SRAM clock */
-	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
-	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
-	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
-	scp_sram_power_off(scp->reg_base + MT8192_L1TCM_SRAM_PDN, 0);
-	scp_sram_power_off(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
+	scp_sram_power_off(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
+	scp_sram_power_off(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
+	scp_sram_power_off(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
+	scp_sram_power_off(scp->cluster->reg_base + MT8192_L1TCM_SRAM_PDN, 0);
+	scp_sram_power_off(scp->cluster->reg_base + MT8192_CPU0_SRAM_PD, 0);
 
 	/* Disable SCP watchdog */
-	writel(0, scp->reg_base + MT8192_CORE0_WDT_CFG);
+	writel(0, scp->cluster->reg_base + MT8192_CORE0_WDT_CFG);
 }
 
 static void mt8195_scp_stop(struct mtk_scp *scp)
 {
 	/* Disable SRAM clock */
-	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
-	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
-	scp_sram_power_off(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
-	scp_sram_power_off(scp->reg_base + MT8192_L1TCM_SRAM_PDN,
+	scp_sram_power_off(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
+	scp_sram_power_off(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
+	scp_sram_power_off(scp->cluster->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
+	scp_sram_power_off(scp->cluster->reg_base + MT8192_L1TCM_SRAM_PDN,
 			   MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS);
-	scp_sram_power_off(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
+	scp_sram_power_off(scp->cluster->reg_base + MT8192_CPU0_SRAM_PD, 0);
 
 	/* Disable SCP watchdog */
-	writel(0, scp->reg_base + MT8192_CORE0_WDT_CFG);
+	writel(0, scp->cluster->reg_base + MT8192_CORE0_WDT_CFG);
 }
 
 static void mt8195_scp_c1_stop(struct mtk_scp *scp)
 {
 	/* Power off CPU SRAM */
-	scp_sram_power_off(scp->reg_base + MT8195_CPU1_SRAM_PD, 0);
+	scp_sram_power_off(scp->cluster->reg_base + MT8195_CPU1_SRAM_PD, 0);
 
 	/* Disable SCP watchdog */
-	writel(0, scp->reg_base + MT8195_CORE1_WDT_CFG);
+	writel(0, scp->cluster->reg_base + MT8195_CORE1_WDT_CFG);
 }
 
 static int scp_stop(struct rproc *rproc)
@@ -854,7 +854,8 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
 	}
 }
 
-static int scp_probe(struct platform_device *pdev)
+static int scp_cluster_init(struct platform_device *pdev,
+			    struct mtk_scp_of_cluster *scp_cluster)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
@@ -876,6 +877,7 @@ static int scp_probe(struct platform_device *pdev)
 	scp->rproc = rproc;
 	scp->dev = dev;
 	scp->data = of_device_get_match_data(dev);
+	scp->cluster = scp_cluster;
 	platform_set_drvdata(pdev, scp);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
@@ -887,24 +889,6 @@ static int scp_probe(struct platform_device *pdev)
 	scp->sram_size = resource_size(res);
 	scp->sram_phys = res->start;
 
-	/* l1tcm is an optional memory region */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
-	scp->l1tcm_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(scp->l1tcm_base)) {
-		ret = PTR_ERR(scp->l1tcm_base);
-		if (ret != -EINVAL) {
-			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
-		}
-	} else {
-		scp->l1tcm_size = resource_size(res);
-		scp->l1tcm_phys = res->start;
-	}
-
-	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
-	if (IS_ERR(scp->reg_base))
-		return dev_err_probe(dev, PTR_ERR(scp->reg_base),
-				     "Failed to parse and map cfg memory\n");
-
 	ret = scp->data->scp_clk_get(scp);
 	if (ret)
 		return ret;
@@ -956,6 +940,43 @@ static int scp_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int scp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_scp_of_cluster *scp_cluster;
+	struct resource *res;
+	int ret;
+
+	scp_cluster = devm_kzalloc(dev, sizeof(*scp_cluster), GFP_KERNEL);
+	if (!scp_cluster)
+		return -ENOMEM;
+
+	scp_cluster->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(scp_cluster->reg_base))
+		return dev_err_probe(dev, PTR_ERR(scp_cluster->reg_base),
+				     "Failed to parse and map cfg memory\n");
+
+	/* l1tcm is an optional memory region */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
+	scp_cluster->l1tcm_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(scp_cluster->l1tcm_base)) {
+		ret = PTR_ERR(scp_cluster->l1tcm_base);
+		if (ret != -EINVAL)
+			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
+
+		scp_cluster->l1tcm_base = NULL;
+	} else {
+		scp_cluster->l1tcm_size = resource_size(res);
+		scp_cluster->l1tcm_phys = res->start;
+	}
+
+	ret = scp_cluster_init(pdev, scp_cluster);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static void scp_remove(struct platform_device *pdev)
 {
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 9c7c17b9d181..cd0b60106ec2 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -177,7 +177,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 	mutex_lock(&scp->send_lock);
 
 	 /* Wait until SCP receives the last command */
-	ret = readl_poll_timeout_atomic(scp->reg_base + scp->data->host_to_scp_reg,
+	ret = readl_poll_timeout_atomic(scp->cluster->reg_base + scp->data->host_to_scp_reg,
 					val, !val, 0, SCP_TIMEOUT_US);
 	if (ret) {
 		dev_err(scp->dev, "%s: IPI timeout!\n", __func__);
@@ -192,7 +192,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 	scp->ipi_id_ack[id] = false;
 	/* send the command to SCP */
 	writel(scp->data->host_to_scp_int_bit,
-	       scp->reg_base + scp->data->host_to_scp_reg);
+	       scp->cluster->reg_base + scp->data->host_to_scp_reg);
 
 	if (wait) {
 		/* wait for SCP's ACK */
-- 
2.18.0


