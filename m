Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AA6C636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 09:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1GRvMdgWHjes1U/8i84hO5LS0vKzH78vNx/oJKWdA0=; b=b2b8fISTly8xSlXeGdSWGZOvlh
	kxuiogJOR6RTPgLJjG+zsvN6cKg4jeXZWu5NMwSev2lCm1SjrveN8t44V2k2tbWcL0rwxJL7eY18L
	+HfegC10z9mrFOfUnO4ULoCuLOkiUFs48TebDty6TgxqOZWrPrTNX68IwAW+UHmrUFZXhx2CuEC2c
	dasP6HGAa0dOFvpzTL6MXudoMkrwtdI0Spdco/aCh9Mz+2uqRpNOBPReTBw/sHqCpeutq5elOXezH
	Zd0y+nQlYcNJj9oRXaFffrkH37t2pVVFEEgsLKe09d/xf0YZCJeEKDz6cLbeRh091FNCZV978UU56
	LF+AWr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPIS-004u7t-DM; Fri, 10 Feb 2023 09:02:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQPHr-004tk9-1E; Fri, 10 Feb 2023 09:01:44 +0000
X-UUID: 877eb5d0a92111eda08d4d6090ec5a5c-20230210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=N1GRvMdgWHjes1U/8i84hO5LS0vKzH78vNx/oJKWdA0=;
	b=Ue7dDebGzRId6kNmyd9a93by/R3eGFiP4dcXIAb+gWMOszHvI4T66GTqw74/mJROuBC/Mq7SyKP49Cl/5G2ZqUBc0UJXp4e1xBZ5i8tFN+a5dPj9evjpYQ6Rm1zmPn5Aeyc4nCGDs7kBh28eH0qTlOFhorpp3Df3/SvgbKORI/k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:ff0b1113-9868-4c17-9736-bc1e0297089a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.19,REQID:ff0b1113-9868-4c17-9736-bc1e0297089a,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:885ddb2,CLOUDID:cac1808e-8530-4eff-9f77-222cf6e2895b,B
	ulkID:2302101659363JI45V3W,BulkQuantity:3,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 877eb5d0a92111eda08d4d6090ec5a5c-20230210
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 230305503; Fri, 10 Feb 2023 02:01:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 10 Feb 2023 16:59:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 10 Feb 2023 16:59:34 +0800
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
Subject: [PATCH v5 10/12] remoteproc: mediatek: Handle MT8195 SCP core 1 watchdog timeout
Date: Fri, 10 Feb 2023 16:59:29 +0800
Message-ID: <20230210085931.8941-11-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230210085931.8941-1-tinghan.shen@mediatek.com>
References: <20230210085931.8941-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_010143_103091_37651D91 
X-CRM114-Status: GOOD (  15.33  )
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
---
 drivers/remoteproc/mtk_common.h |  4 ++++
 drivers/remoteproc/mtk_scp.c    | 25 ++++++++++++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index e4ef97f2d3a1..ca2395b98d27 100644
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
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 569e915dfa0f..2b43e23f6de7 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -222,6 +222,29 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
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
@@ -1273,7 +1296,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
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


