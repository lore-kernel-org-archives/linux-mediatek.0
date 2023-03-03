Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77386C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 08:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXNvkSE666U3KVDnuZr8zG2wpLjRqGaDYzDsWg0/Ibs=; b=EUntCwuoS7BI2+e6WeOBhJ4wcT
	GHFuQ3hsvdHW05xFN//iFsAtDZIlh5nLfqPKe6J5DmnPQZL2MqIQXiXTOpeeJYwtASGKmSgsfSCLn
	uTjRucS/jp0ZGqNyfxUPxmIGmrnspmVte2kKvXQY51E48plmmO9LYKwpL51tyU8QXJj0Ls6w8S2mE
	BQd4tUbxQwEhGsKCNweh3xMe+exF04QLupb3WYCMEcjp01M0ycabRf8cLD927lH5QuMeXpUcY/j0g
	BkiMsoa2O63cxGKiswlCUs5Ib3Z11fOyJLU0J5S9ZyPmW52I2dLLVmi/5FFmSJh6KPqvOJVNrXTcl
	Omh8hGPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0si-005Qa4-4a; Fri, 03 Mar 2023 08:35:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0sG-005QIy-C7; Fri, 03 Mar 2023 08:34:46 +0000
X-UUID: 3d2fda80b99e11edbbe3f76fe852e059-20230303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VXNvkSE666U3KVDnuZr8zG2wpLjRqGaDYzDsWg0/Ibs=;
	b=LNNnxQhxpjibn91CTFApjPW+YN1h9retfu53TmDbk/rjJQNfa14UHL3Hip58g9zTKuXpsoHVMXn8yGn/YmONxt9BBe406vRJaajeWWXshrXWXJfGHCIwdhjnknj6JScAEYqKrS49lhzgPWnQiIFtzbMtbSEBuQCjz+SeKqlgxe8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:839400da-e16d-44c6-8e79-c587081ad6c2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:35ce1bb2-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 3d2fda80b99e11edbbe3f76fe852e059-20230303
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1801039884; Fri, 03 Mar 2023 01:34:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 3 Mar 2023 16:34:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 3 Mar 2023 16:34:00 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8 09/11] remoteproc: mediatek: Handle MT8195 SCP core 1 watchdog timeout
Date: Fri, 3 Mar 2023 16:33:53 +0800
Message-ID: <20230303083355.3378-10-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230303083355.3378-1-tinghan.shen@mediatek.com>
References: <20230303083355.3378-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_003444_459315_6AF59EA6 
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

The MT8195 SCP core 1 watchdog timeout needs to be handled in the
SCP core 0 IRQ handler because the MT8195 SCP core 1 watchdog timeout
IRQ is wired on the same IRQ entry for core 0 watchdog timeout.
MT8195 SCP has a watchdog status register to identify the watchdog
timeout source when IRQ triggered.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_common.h |  5 +++++
 drivers/remoteproc/mtk_scp.c    | 25 ++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 80be712a3583..80b072c17cc7 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -55,6 +55,10 @@
 #define MT8192_CORE0_WDT_IRQ		0x10030
 #define MT8192_CORE0_WDT_CFG		0x10034
 
+#define MT8195_SYS_STATUS		0x4004
+#define MT8195_CORE0_WDT		BIT(16)
+#define MT8195_CORE1_WDT		BIT(17)
+
 #define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		GENMASK(7, 4)
 
 #define MT8195_CPU1_SRAM_PD			0x1084
@@ -63,6 +67,7 @@
 #define MT8195_CORE1_SW_RSTN_CLR		0x20000
 #define MT8195_CORE1_SW_RSTN_SET		0x20004
 #define MT8195_CORE1_MEM_ATT_PREDEF		0x20008
+#define MT8195_CORE1_WDT_IRQ			0x20030
 #define MT8195_CORE1_WDT_CFG			0x20034
 
 #define MT8195_SEC_CTRL				0x85000
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 049688c731f7..056a814486a3 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -229,6 +229,29 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
 	}
 }
 
+static void mt8195_scp_irq_handler(struct mtk_scp *scp)
+{
+	u32 scp_to_host;
+
+	scp_to_host = readl(scp->reg_base + MT8192_SCP2APMCU_IPC_SET);
+
+	if (scp_to_host & MT8192_SCP_IPC_INT_BIT) {
+		scp_ipi_handler(scp);
+	} else {
+		u32 reason = readl(scp->reg_base + MT8195_SYS_STATUS);
+
+		if (reason & MT8195_CORE0_WDT)
+			writel(1, scp->reg_base + MT8192_CORE0_WDT_IRQ);
+
+		if (reason & MT8195_CORE1_WDT)
+			writel(1, scp->reg_base + MT8195_CORE1_WDT_IRQ);
+
+		scp_wdt_handler(scp, reason);
+	}
+
+	writel(scp_to_host, scp->reg_base + MT8192_SCP2APMCU_IPC_CLR);
+}
+
 static void mt8195_scp_c1_irq_handler(struct mtk_scp *scp)
 {
 	u32 scp_to_host;
@@ -1281,7 +1304,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 static const struct mtk_scp_of_data mt8195_of_data = {
 	.scp_clk_get = mt8195_scp_clk_get,
 	.scp_before_load = mt8195_scp_before_load,
-	.scp_irq_handler = mt8192_scp_irq_handler,
+	.scp_irq_handler = mt8195_scp_irq_handler,
 	.scp_reset_assert = mt8192_scp_reset_assert,
 	.scp_reset_deassert = mt8192_scp_reset_deassert,
 	.scp_stop = mt8195_scp_stop,
-- 
2.18.0


