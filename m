Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAACC32771
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 02:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIDRoFehAj0CvgGt9nUIzx7Elay9M3yCmpkbTwT5lhM=; b=cnelnbc6OGhP5NLP0EZxn3pcH7
	0GsAXWVHo+crBLX8LDNPgHyvvpzcq3IZSQTotH62b/qOujcEXvcb+Xyc0Z72O1x3olhF0pZqvG9dx
	FhEAGhj2SKVFRepxCa52aEUh28xagObj5Ua7SS1ZucEOBZSssRDEnO9W6+9JAs8mlJ5xkwiDkOpPG
	Ys3NzWU+au8AzQCetkGamRDJtqbDGvmi41aTzCHp4nLgl6kRT8BeF3ZAIoa3w9cj8BYoapXU7Fucj
	puCbb6mFkVrKklH8rHiZNyuzKS8Fv/57sg97qksLsb3aOdOMWTjO0OrurStmH92R0PG/YuBAWdgIS
	CkS8UBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od0oM-007zrm-Iz; Tue, 27 Sep 2022 02:59:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od0oK-007zqB-Fi; Tue, 27 Sep 2022 02:59:06 +0000
X-UUID: d8d48d4b71b041039dd9b2ea9f3ee716-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GIDRoFehAj0CvgGt9nUIzx7Elay9M3yCmpkbTwT5lhM=;
	b=cQtnBb0pU9pLmmyFZ+wP0SFgX3v/6z26RLDKR5EvcUBHr9B2CRlCNhOrEvHWjxD4h41FA7sZGMX0mo82/iZy6kXXG/IjSMX84Xk04r7gjAjpKyzzYU4vM84YbmSR/JEjRxua0lwowGwTwMGyFnEI12joDo1nFozxAGIUeBxF7ZU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:a4656add-a5ac-4ce7-a530-dc73c5ee5a00,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.11,REQID:a4656add-a5ac-4ce7-a530-dc73c5ee5a00,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:39a5ff1,CLOUDID:bf4051e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:220927105630AZZ5CK2K,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: d8d48d4b71b041039dd9b2ea9f3ee716-20220926
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1359711981; Mon, 26 Sep 2022 19:59:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 27 Sep 2022 10:56:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Sep 2022 10:56:26 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, "Andrew-CT
 Chen" <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v3 06/11] remoteproc: mediatek: Add MT8195 SCP core 1 operations
Date: Tue, 27 Sep 2022 10:56:01 +0800
Message-ID: <20220927025606.26673-7-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220927025606.26673-1-tinghan.shen@mediatek.com>
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_195904_606962_303F1960 
X-CRM114-Status: GOOD (  14.64  )
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
 drivers/remoteproc/mtk_scp.c | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index bf68bccab78b..1d17d77b8a14 100644
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
@@ -1007,12 +1051,25 @@ static const struct mtk_scp_of_data mt8195_of_data = {
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
 };
 
+static const struct mtk_scp_of_data mt8195_core_of_data = {
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
 	{ .compatible = "mediatek,mt8188-scp", .data = &mt8188_of_data },
 	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
 	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
+	{ .compatible = "mediatek,mt8195-scp-core", .data = &mt8195_core_of_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
-- 
2.18.0


