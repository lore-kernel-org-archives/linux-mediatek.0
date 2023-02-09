Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38441C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 07:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5+DrK5/DG5W3BlDj7d5kYpJc3FLAcebyhcFosJRTc4=; b=OAEc9Pw3OlBJ5uec52JKC0+/ev
	1oOuAWg2JNJhLkSIGbxkvrP6Lfc6s1hcn+B/9k9QIx6Mdk8jfmy3mRQ7cm8ORd5QZbmNeeIy0Tyce
	PrhO+lO7B66Oy44VQD6twEb7B+9OD6l3ebRIBs2FQCTAxErJk/h+S2kK8BrPcHcHGyjWLJybGi2yw
	DdaD+nse1VOL/R/fatFdw0GYo3soOWQDGPz45+rKfJWdvjGDjJuBuPi+pxvdhE++RGvBexBhK636D
	p59bia5G/RtIzdZhwy70I9Fvh3Q+Qh1b9m987fNdtHFGjaSMkjhsw7fQelWYmzA9mEx6N1D6YFQDr
	b4fbWAEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ1at-000QIw-4d; Thu, 09 Feb 2023 07:43:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ1Yg-000Os1-Q9; Thu, 09 Feb 2023 07:41:33 +0000
X-UUID: 2778c376a84d11eda08d4d6090ec5a5c-20230209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=s5+DrK5/DG5W3BlDj7d5kYpJc3FLAcebyhcFosJRTc4=;
	b=AvPb9jYr7weU93UBvMPpHGo17SEW0KiJyAhGolL6HzCTC++JkH+I7nGMoALinx7Vc+i1nJEXrAhaNyn7VcD7ddGiG+Z8OI900LLQk9c6IzHOuYbSXekl+9imm8xVZ4OAJsguBTl2KR+abTqHaje77aRYmXfholE45EEM/trjEp0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:21c069b5-3496-49cf-a017-9a7f46e42845,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:f20a608e-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 2778c376a84d11eda08d4d6090ec5a5c-20230209
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1858293606; Thu, 09 Feb 2023 00:41:24 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 9 Feb 2023 15:40:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 9 Feb 2023 15:40:49 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 05/12] remoteproc: mediatek: Add MT8195 SCP core 1 operations
Date: Thu, 9 Feb 2023 15:40:14 +0800
Message-ID: <20230209074021.13936-6-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230209074021.13936-1-tinghan.shen@mediatek.com>
References: <20230209074021.13936-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_234130_932786_1AC82C82 
X-CRM114-Status: GOOD (  15.30  )
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

The SCP rproc driver has a set of chip dependent callbacks for
boot sequence and IRQ handling. Implement these callbacks for MT8195
SCP core 1.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index d421a2ccaa1e..b92274067522 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -176,6 +176,16 @@ static void mt8192_scp_reset_deassert(struct mtk_scp *scp)
 	writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_CLR);
 }
 
+static void mt8195_scp_c1_reset_assert(struct mtk_scp *scp)
+{
+	writel(1, scp->reg_base + MT8195_CORE1_SW_RSTN_SET);
+}
+
+static void mt8195_scp_c1_reset_deassert(struct mtk_scp *scp)
+{
+	writel(1, scp->reg_base + MT8195_CORE1_SW_RSTN_CLR);
+}
+
 static void mt8183_scp_irq_handler(struct mtk_scp *scp)
 {
 	u32 scp_to_host;
@@ -212,6 +222,18 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
 	}
 }
 
+static void mt8195_scp_c1_irq_handler(struct mtk_scp *scp)
+{
+	u32 scp_to_host;
+
+	scp_to_host = readl(scp->reg_base + MT8195_SSHUB2APMCU_IPC_SET);
+
+	if (scp_to_host & MT8192_SCP_IPC_INT_BIT)
+		scp_ipi_handler(scp);
+
+	writel(scp_to_host, scp->reg_base + MT8195_SSHUB2APMCU_IPC_CLR);
+}
+
 static irqreturn_t scp_irq_handler(int irq, void *priv)
 {
 	struct mtk_scp *scp = priv;
@@ -453,6 +475,19 @@ static int mt8195_scp_before_load(struct mtk_scp *scp)
 	return 0;
 }
 
+static int mt8195_scp_c1_before_load(struct mtk_scp *scp)
+{
+	scp_sram_power_on(scp->reg_base + MT8195_CPU1_SRAM_PD, 0);
+
+	/* hold SCP in reset while loading FW. */
+	scp->data->scp_reset_assert(scp);
+
+	/* enable MPU for all memory regions */
+	writel(0xff, scp->reg_base + MT8195_CORE1_MEM_ATT_PREDEF);
+
+	return 0;
+}
+
 static int scp_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct mtk_scp *scp = rproc->priv;
@@ -625,6 +660,15 @@ static void mt8195_scp_stop(struct mtk_scp *scp)
 	writel(0, scp->reg_base + MT8192_CORE0_WDT_CFG);
 }
 
+static void mt8195_scp_c1_stop(struct mtk_scp *scp)
+{
+	/* Power off CPU SRAM */
+	scp_sram_power_off(scp->reg_base + MT8195_CPU1_SRAM_PD, 0);
+
+	/* Disable SCP watchdog */
+	writel(0, scp->reg_base + MT8195_CORE1_WDT_CFG);
+}
+
 static int scp_stop(struct rproc *rproc)
 {
 	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
@@ -990,6 +1034,18 @@ static const struct mtk_scp_of_data mt8195_of_data = {
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
 };
 
+static const struct mtk_scp_of_data mt8195_of_data_c1 = {
+	.scp_clk_get = mt8195_scp_clk_get,
+	.scp_before_load = mt8195_scp_c1_before_load,
+	.scp_irq_handler = mt8195_scp_c1_irq_handler,
+	.scp_reset_assert = mt8195_scp_c1_reset_assert,
+	.scp_reset_deassert = mt8195_scp_c1_reset_deassert,
+	.scp_stop = mt8195_scp_c1_stop,
+	.scp_da_to_va = mt8192_scp_da_to_va,
+	.host_to_scp_reg = MT8192_GIPC_IN_SET,
+	.host_to_scp_int_bit = MT8195_CORE1_HOST_IPC_INT_BIT,
+};
+
 static const struct of_device_id mtk_scp_of_match[] = {
 	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
 	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data },
-- 
2.18.0


