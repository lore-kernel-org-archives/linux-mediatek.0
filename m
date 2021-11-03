Return-Path: <SRS0=yT6o=PW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DF1C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 08:18:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DAB26113B
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 08:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DAB26113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHvS7hm6hMHc/w/nMW8KUyK9D04iYcl7We2I/wE98zQ=; b=XNSiGRpmnqQMs7
	JTmIbSVPuTBBl/OizeijiZf9VL/ofgqwGXn85ujFD5cjW1LY6jsGjgz6KvgEWzTlCc2jseaHeIxJR
	ussA08iKcgAa/JfOLUJcq/avnY4ojLvc6/2dl98k2oeDEcha6cdoUVCBjTXWiyy24lfiB5vz7pdPX
	ePJqrxAH7fqxTaxGcaZ9XjMfxPO7IdVHRQOZFBdNZ4/+cr0Gv12OUDDWR89SveXPHDYk2TpBbTy9D
	xevnBfl1jROAachwql07+ugZDghPtgJJsDKIAJohyaWcho3seI+945Q/dBSP1El/954ebh41VvAh3
	GiQDd3bbQNHuxpzOVP1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miBTr-004Upo-6K; Wed, 03 Nov 2021 08:18:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miBT1-004UTt-6Q; Wed, 03 Nov 2021 08:17:56 +0000
X-UUID: a5eaceb975c646d597104ce5356559c9-20211103
X-UUID: a5eaceb975c646d597104ce5356559c9-20211103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <james.lo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 460704375; Wed, 03 Nov 2021 01:17:46 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Nov 2021 01:10:27 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 3 Nov 2021 16:10:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 3 Nov 2021 16:10:23 +0800
From: James Lo <james.lo@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, James Lo
 <james.lo@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Henry Chen
 <henryc.chen@mediatek.com>
Subject: [RESEND, v13 4/4] spmi: mediatek: Add support for MT8195
Date: Wed, 3 Nov 2021 16:10:21 +0800
Message-ID: <20211103081021.9917-5-james.lo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211103081021.9917-1-james.lo@mediatek.com>
References: <20211103081021.9917-1-james.lo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_011755_277625_5DD231B2 
X-CRM114-Status: GOOD (  13.06  )
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

Add spmi support for MT8195.
Refine indent in spmi-mtk-pmif.c.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Acked-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spmi/spmi-mtk-pmif.c | 202 +++++++++++++++++++++++++----------
 1 file changed, 145 insertions(+), 57 deletions(-)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 3283d0a5903c..ad511f2c3324 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -105,51 +105,99 @@ enum pmif_regs {
 };
 
 static const u32 mt6873_regs[] = {
-	[PMIF_INIT_DONE] =	0x0000,
-	[PMIF_INF_EN] =		0x0024,
-	[PMIF_ARB_EN] =		0x0150,
-	[PMIF_CMDISSUE_EN] =	0x03B4,
-	[PMIF_TIMER_CTRL] =	0x03E0,
-	[PMIF_SPI_MODE_CTRL] =	0x0400,
-	[PMIF_IRQ_EVENT_EN_0] =	0x0418,
-	[PMIF_IRQ_FLAG_0] =	0x0420,
-	[PMIF_IRQ_CLR_0] =	0x0424,
-	[PMIF_IRQ_EVENT_EN_1] =	0x0428,
-	[PMIF_IRQ_FLAG_1] =	0x0430,
-	[PMIF_IRQ_CLR_1] =	0x0434,
-	[PMIF_IRQ_EVENT_EN_2] =	0x0438,
-	[PMIF_IRQ_FLAG_2] =	0x0440,
-	[PMIF_IRQ_CLR_2] =	0x0444,
-	[PMIF_IRQ_EVENT_EN_3] =	0x0448,
-	[PMIF_IRQ_FLAG_3] =	0x0450,
-	[PMIF_IRQ_CLR_3] =	0x0454,
-	[PMIF_IRQ_EVENT_EN_4] =	0x0458,
-	[PMIF_IRQ_FLAG_4] =	0x0460,
-	[PMIF_IRQ_CLR_4] =	0x0464,
-	[PMIF_WDT_EVENT_EN_0] =	0x046C,
-	[PMIF_WDT_FLAG_0] =	0x0470,
-	[PMIF_WDT_EVENT_EN_1] =	0x0474,
-	[PMIF_WDT_FLAG_1] =	0x0478,
-	[PMIF_SWINF_0_ACC] =	0x0C00,
-	[PMIF_SWINF_0_WDATA_31_0] =	0x0C04,
-	[PMIF_SWINF_0_RDATA_31_0] =	0x0C14,
-	[PMIF_SWINF_0_VLD_CLR] =	0x0C24,
-	[PMIF_SWINF_0_STA] =	0x0C28,
-	[PMIF_SWINF_1_ACC] =	0x0C40,
-	[PMIF_SWINF_1_WDATA_31_0] =	0x0C44,
-	[PMIF_SWINF_1_RDATA_31_0] =	0x0C54,
-	[PMIF_SWINF_1_VLD_CLR] =	0x0C64,
-	[PMIF_SWINF_1_STA] =	0x0C68,
-	[PMIF_SWINF_2_ACC] =	0x0C80,
-	[PMIF_SWINF_2_WDATA_31_0] =	0x0C84,
-	[PMIF_SWINF_2_RDATA_31_0] =	0x0C94,
-	[PMIF_SWINF_2_VLD_CLR] =	0x0CA4,
-	[PMIF_SWINF_2_STA] =	0x0CA8,
-	[PMIF_SWINF_3_ACC] =	0x0CC0,
-	[PMIF_SWINF_3_WDATA_31_0] =	0x0CC4,
-	[PMIF_SWINF_3_RDATA_31_0] =	0x0CD4,
-	[PMIF_SWINF_3_VLD_CLR] =	0x0CE4,
-	[PMIF_SWINF_3_STA] =	0x0CE8,
+	[PMIF_INIT_DONE] = 0x0000,
+	[PMIF_INF_EN] = 0x0024,
+	[PMIF_ARB_EN] = 0x0150,
+	[PMIF_CMDISSUE_EN] = 0x03B4,
+	[PMIF_TIMER_CTRL] = 0x03E0,
+	[PMIF_SPI_MODE_CTRL] = 0x0400,
+	[PMIF_IRQ_EVENT_EN_0] = 0x0418,
+	[PMIF_IRQ_FLAG_0] = 0x0420,
+	[PMIF_IRQ_CLR_0] = 0x0424,
+	[PMIF_IRQ_EVENT_EN_1] = 0x0428,
+	[PMIF_IRQ_FLAG_1] = 0x0430,
+	[PMIF_IRQ_CLR_1] = 0x0434,
+	[PMIF_IRQ_EVENT_EN_2] = 0x0438,
+	[PMIF_IRQ_FLAG_2] = 0x0440,
+	[PMIF_IRQ_CLR_2] = 0x0444,
+	[PMIF_IRQ_EVENT_EN_3] = 0x0448,
+	[PMIF_IRQ_FLAG_3] = 0x0450,
+	[PMIF_IRQ_CLR_3] = 0x0454,
+	[PMIF_IRQ_EVENT_EN_4] = 0x0458,
+	[PMIF_IRQ_FLAG_4] = 0x0460,
+	[PMIF_IRQ_CLR_4] = 0x0464,
+	[PMIF_WDT_EVENT_EN_0] = 0x046C,
+	[PMIF_WDT_FLAG_0] = 0x0470,
+	[PMIF_WDT_EVENT_EN_1] = 0x0474,
+	[PMIF_WDT_FLAG_1] = 0x0478,
+	[PMIF_SWINF_0_ACC] = 0x0C00,
+	[PMIF_SWINF_0_WDATA_31_0] = 0x0C04,
+	[PMIF_SWINF_0_RDATA_31_0] = 0x0C14,
+	[PMIF_SWINF_0_VLD_CLR] = 0x0C24,
+	[PMIF_SWINF_0_STA] = 0x0C28,
+	[PMIF_SWINF_1_ACC] = 0x0C40,
+	[PMIF_SWINF_1_WDATA_31_0] = 0x0C44,
+	[PMIF_SWINF_1_RDATA_31_0] = 0x0C54,
+	[PMIF_SWINF_1_VLD_CLR] = 0x0C64,
+	[PMIF_SWINF_1_STA] = 0x0C68,
+	[PMIF_SWINF_2_ACC] = 0x0C80,
+	[PMIF_SWINF_2_WDATA_31_0] = 0x0C84,
+	[PMIF_SWINF_2_RDATA_31_0] = 0x0C94,
+	[PMIF_SWINF_2_VLD_CLR] = 0x0CA4,
+	[PMIF_SWINF_2_STA] = 0x0CA8,
+	[PMIF_SWINF_3_ACC] = 0x0CC0,
+	[PMIF_SWINF_3_WDATA_31_0] = 0x0CC4,
+	[PMIF_SWINF_3_RDATA_31_0] = 0x0CD4,
+	[PMIF_SWINF_3_VLD_CLR] = 0x0CE4,
+	[PMIF_SWINF_3_STA] = 0x0CE8,
+};
+
+static const u32 mt8195_regs[] = {
+	[PMIF_INIT_DONE] = 0x0000,
+	[PMIF_INF_EN] = 0x0024,
+	[PMIF_ARB_EN] = 0x0150,
+	[PMIF_CMDISSUE_EN] = 0x03B8,
+	[PMIF_TIMER_CTRL] = 0x03E4,
+	[PMIF_SPI_MODE_CTRL] = 0x0408,
+	[PMIF_IRQ_EVENT_EN_0] = 0x0420,
+	[PMIF_IRQ_FLAG_0] = 0x0428,
+	[PMIF_IRQ_CLR_0] = 0x042C,
+	[PMIF_IRQ_EVENT_EN_1] = 0x0430,
+	[PMIF_IRQ_FLAG_1] = 0x0438,
+	[PMIF_IRQ_CLR_1] = 0x043C,
+	[PMIF_IRQ_EVENT_EN_2] = 0x0440,
+	[PMIF_IRQ_FLAG_2] = 0x0448,
+	[PMIF_IRQ_CLR_2] = 0x044C,
+	[PMIF_IRQ_EVENT_EN_3] = 0x0450,
+	[PMIF_IRQ_FLAG_3] = 0x0458,
+	[PMIF_IRQ_CLR_3] = 0x045C,
+	[PMIF_IRQ_EVENT_EN_4] = 0x0460,
+	[PMIF_IRQ_FLAG_4] = 0x0468,
+	[PMIF_IRQ_CLR_4] = 0x046C,
+	[PMIF_WDT_EVENT_EN_0] = 0x0474,
+	[PMIF_WDT_FLAG_0] = 0x0478,
+	[PMIF_WDT_EVENT_EN_1] = 0x047C,
+	[PMIF_WDT_FLAG_1] = 0x0480,
+	[PMIF_SWINF_0_ACC] = 0x0800,
+	[PMIF_SWINF_0_WDATA_31_0] = 0x0804,
+	[PMIF_SWINF_0_RDATA_31_0] = 0x0814,
+	[PMIF_SWINF_0_VLD_CLR] = 0x0824,
+	[PMIF_SWINF_0_STA] = 0x0828,
+	[PMIF_SWINF_1_ACC] = 0x0840,
+	[PMIF_SWINF_1_WDATA_31_0] = 0x0844,
+	[PMIF_SWINF_1_RDATA_31_0] = 0x0854,
+	[PMIF_SWINF_1_VLD_CLR] = 0x0864,
+	[PMIF_SWINF_1_STA] = 0x0868,
+	[PMIF_SWINF_2_ACC] = 0x0880,
+	[PMIF_SWINF_2_WDATA_31_0] = 0x0884,
+	[PMIF_SWINF_2_RDATA_31_0] = 0x0894,
+	[PMIF_SWINF_2_VLD_CLR] = 0x08A4,
+	[PMIF_SWINF_2_STA] = 0x08A8,
+	[PMIF_SWINF_3_ACC] = 0x08C0,
+	[PMIF_SWINF_3_WDATA_31_0] = 0x08C4,
+	[PMIF_SWINF_3_RDATA_31_0] = 0x08D4,
+	[PMIF_SWINF_3_VLD_CLR] = 0x08E4,
+	[PMIF_SWINF_3_STA] = 0x08E8,
 };
 
 enum spmi_regs {
@@ -165,21 +213,52 @@ enum spmi_regs {
 	SPMI_REC3,
 	SPMI_REC4,
 	SPMI_MST_DBG,
+
+	/* MT8195 spmi regs */
+	SPMI_MST_RCS_CTRL,
+	SPMI_SLV_3_0_EINT,
+	SPMI_SLV_7_4_EINT,
+	SPMI_SLV_B_8_EINT,
+	SPMI_SLV_F_C_EINT,
+	SPMI_REC_CMD_DEC,
+	SPMI_DEC_DBG,
 };
 
 static const u32 mt6873_spmi_regs[] = {
-	[SPMI_OP_ST_CTRL] =	0x0000,
-	[SPMI_GRP_ID_EN] =	0x0004,
-	[SPMI_OP_ST_STA] =	0x0008,
-	[SPMI_MST_SAMPL] =	0x000c,
-	[SPMI_MST_REQ_EN] =	0x0010,
-	[SPMI_REC_CTRL] =	0x0040,
-	[SPMI_REC0] =		0x0044,
-	[SPMI_REC1] =		0x0048,
-	[SPMI_REC2] =		0x004c,
-	[SPMI_REC3] =		0x0050,
-	[SPMI_REC4] =		0x0054,
-	[SPMI_MST_DBG] =	0x00fc,
+	[SPMI_OP_ST_CTRL] = 0x0000,
+	[SPMI_GRP_ID_EN] = 0x0004,
+	[SPMI_OP_ST_STA] = 0x0008,
+	[SPMI_MST_SAMPL] = 0x000c,
+	[SPMI_MST_REQ_EN] = 0x0010,
+	[SPMI_REC_CTRL] = 0x0040,
+	[SPMI_REC0] = 0x0044,
+	[SPMI_REC1] = 0x0048,
+	[SPMI_REC2] = 0x004c,
+	[SPMI_REC3] = 0x0050,
+	[SPMI_REC4] = 0x0054,
+	[SPMI_MST_DBG] = 0x00fc,
+};
+
+static const u32 mt8195_spmi_regs[] = {
+	[SPMI_OP_ST_CTRL] = 0x0000,
+	[SPMI_GRP_ID_EN] = 0x0004,
+	[SPMI_OP_ST_STA] = 0x0008,
+	[SPMI_MST_SAMPL] = 0x000C,
+	[SPMI_MST_REQ_EN] = 0x0010,
+	[SPMI_MST_RCS_CTRL] = 0x0014,
+	[SPMI_SLV_3_0_EINT] = 0x0020,
+	[SPMI_SLV_7_4_EINT] = 0x0024,
+	[SPMI_SLV_B_8_EINT] = 0x0028,
+	[SPMI_SLV_F_C_EINT] = 0x002C,
+	[SPMI_REC_CTRL] = 0x0040,
+	[SPMI_REC0] = 0x0044,
+	[SPMI_REC1] = 0x0048,
+	[SPMI_REC2] = 0x004C,
+	[SPMI_REC3] = 0x0050,
+	[SPMI_REC4] = 0x0054,
+	[SPMI_REC_CMD_DEC] = 0x005C,
+	[SPMI_DEC_DBG] = 0x00F8,
+	[SPMI_MST_DBG] = 0x00FC,
 };
 
 static u32 pmif_readl(struct pmif *arb, enum pmif_regs reg)
@@ -345,6 +424,12 @@ static const struct pmif_data mt6873_pmif_arb = {
 	.soc_chan = 2,
 };
 
+static const struct pmif_data mt8195_pmif_arb = {
+	.regs = mt8195_regs,
+	.spmimst_regs = mt8195_spmi_regs,
+	.soc_chan = 2,
+};
+
 static int mtk_spmi_probe(struct platform_device *pdev)
 {
 	struct pmif *arb;
@@ -433,6 +518,9 @@ static const struct of_device_id mtk_spmi_match_table[] = {
 	{
 		.compatible = "mediatek,mt6873-spmi",
 		.data = &mt6873_pmif_arb,
+	}, {
+		.compatible = "mediatek,mt8195-spmi",
+		.data = &mt8195_pmif_arb,
 	}, {
 		/* sentinel */
 	},
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
