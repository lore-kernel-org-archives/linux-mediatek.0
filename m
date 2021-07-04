Return-Path: <SRS0=KhaQ=L4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1183C07E95
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jul 2021 03:17:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F02361951
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jul 2021 03:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F02361951
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMxSXnWOMiXUhi46WojBJFhVGR+2guWGeAP+gnNojdk=; b=X2JWQKhpKLsYil
	2MJX94dKiGSb4Av7u9J/qdJluFFbeJUKGhi+8wjGm5IC/6m3WcSdU1ulGpmMtes92111gfNiv7I2h
	bHpcSHPN8gux73urAO0tfqjFS4+Nz//Zo8gRGARhVIW15O0xlmTRF9aG0QdAjNQEUS1b/14Fe1QnU
	fvevohRiVloEvsMaZ2hoR8zbhNI3sEPkBjs1h/fxqSFNJm6UhuylYpyjwKn46gwo94XacT85TT+lP
	vRgZBJiP1MIILYVf0hV1d5NnS5bHhiBAbcF7fDcmmXM1UWdIz8OfccplE0YnGbrz7OXtdRJ51jHdb
	LQvH/xSchiKGPERU6qKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzsdS-005f32-2C; Sun, 04 Jul 2021 03:17:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzsdE-005ey0-F7; Sun, 04 Jul 2021 03:17:22 +0000
X-UUID: dfacbc0c86db4fc196526afb9fa7c108-20210703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=MktezwREuP+/kguH9KlO1f/kdA6Yp10KFc09D3jM4JA=; 
 b=Jd1UK7HCNofL2/L023Ee4Edvy77OSqLfXZTZud52p8Jjq97dKcdLUmTvMdkZZpwESsYmqh3Gwzc4hEsgpK7+x5ksYwyQAV3anv6uVtgeVny7gXBi8LvFRGFobK7/Qjn4W+Dqeq/ctPuqT06eNj+7WNekVlptZssAmyZrEmQPbYU=;
X-UUID: dfacbc0c86db4fc196526afb9fa7c108-20210703
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 739742264; Sat, 03 Jul 2021 20:17:18 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 3 Jul 2021 20:07:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Jul 2021 11:07:02 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 4 Jul 2021 11:07:02 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Henry Chen
 <henryc.chen@mediatek.com>
Subject: [PATCH v9 4/5] spmi: mediatek: Add support for MT8195
Date: Sun, 4 Jul 2021 11:06:57 +0800
Message-ID: <1625368018-17505-5-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1625368018-17505-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1625368018-17505-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210703_201720_560554_1115A161 
X-CRM114-Status: GOOD (  12.92  )
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

From: Henry Chen <henryc.chen@mediatek.com>

Add spmi support for MT8195.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
changes since v8:
- New patch.
---
 drivers/spmi/spmi-mtk-pmif.c | 90 ++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 94c45d46ab0c..0c320801c9d5 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -150,6 +150,54 @@ static const u32 mt6873_regs[] = {
 	[PMIF_SWINF_3_STA] =	0x0CE8,
 };
 
+static const u32 mt8195_regs[] = {
+	[PMIF_INIT_DONE] =			0x0000,
+	[PMIF_INF_EN] =				0x0024,
+	[PMIF_ARB_EN] =				0x0150,
+	[PMIF_CMDISSUE_EN] =			0x03B8,
+	[PMIF_TIMER_CTRL] =			0x03E4,
+	[PMIF_SPI_MODE_CTRL] =			0x0408,
+	[PMIF_IRQ_EVENT_EN_0] =			0x0420,
+	[PMIF_IRQ_FLAG_0] =			0x0428,
+	[PMIF_IRQ_CLR_0] =			0x042C,
+	[PMIF_IRQ_EVENT_EN_1] =			0x0430,
+	[PMIF_IRQ_FLAG_1] =			0x0438,
+	[PMIF_IRQ_CLR_1] =			0x043C,
+	[PMIF_IRQ_EVENT_EN_2] =			0x0440,
+	[PMIF_IRQ_FLAG_2] =			0x0448,
+	[PMIF_IRQ_CLR_2] =			0x044C,
+	[PMIF_IRQ_EVENT_EN_3] =			0x0450,
+	[PMIF_IRQ_FLAG_3] =			0x0458,
+	[PMIF_IRQ_CLR_3] =			0x045C,
+	[PMIF_IRQ_EVENT_EN_4] =			0x0460,
+	[PMIF_IRQ_FLAG_4] =			0x0468,
+	[PMIF_IRQ_CLR_4] =			0x046C,
+	[PMIF_WDT_EVENT_EN_0] =			0x0474,
+	[PMIF_WDT_FLAG_0] =			0x0478,
+	[PMIF_WDT_EVENT_EN_1] =			0x047C,
+	[PMIF_WDT_FLAG_1] =			0x0480,
+	[PMIF_SWINF_0_ACC] =			0x0800,
+	[PMIF_SWINF_0_WDATA_31_0] =		0x0804,
+	[PMIF_SWINF_0_RDATA_31_0] =		0x0814,
+	[PMIF_SWINF_0_VLD_CLR] =		0x0824,
+	[PMIF_SWINF_0_STA] =			0x0828,
+	[PMIF_SWINF_1_ACC] =			0x0840,
+	[PMIF_SWINF_1_WDATA_31_0] =		0x0844,
+	[PMIF_SWINF_1_RDATA_31_0] =		0x0854,
+	[PMIF_SWINF_1_VLD_CLR] =		0x0864,
+	[PMIF_SWINF_1_STA] =			0x0868,
+	[PMIF_SWINF_2_ACC] =			0x0880,
+	[PMIF_SWINF_2_WDATA_31_0] =		0x0884,
+	[PMIF_SWINF_2_RDATA_31_0] =		0x0894,
+	[PMIF_SWINF_2_VLD_CLR] =		0x08A4,
+	[PMIF_SWINF_2_STA] =			0x08A8,
+	[PMIF_SWINF_3_ACC] =			0x08C0,
+	[PMIF_SWINF_3_WDATA_31_0] =		0x08C4,
+	[PMIF_SWINF_3_RDATA_31_0] =		0x08D4,
+	[PMIF_SWINF_3_VLD_CLR] =		0x08E4,
+	[PMIF_SWINF_3_STA] =			0x08E8,
+};
+
 enum spmi_regs {
 	SPMI_OP_ST_CTRL,
 	SPMI_GRP_ID_EN,
@@ -163,6 +211,15 @@ enum spmi_regs {
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
@@ -180,6 +237,28 @@ static const u32 mt6873_spmi_regs[] = {
 	[SPMI_MST_DBG] =	0x00fc,
 };
 
+static const u32 mt8195_spmi_regs[] = {
+	[SPMI_OP_ST_CTRL] =	0x0000,
+	[SPMI_GRP_ID_EN] =	0x0004,
+	[SPMI_OP_ST_STA] =	0x0008,
+	[SPMI_MST_SAMPL] =	0x000C,
+	[SPMI_MST_REQ_EN] =	0x0010,
+	[SPMI_MST_RCS_CTRL] =	0x0014,
+	[SPMI_SLV_3_0_EINT] =	0x0020,
+	[SPMI_SLV_7_4_EINT] =	0x0024,
+	[SPMI_SLV_B_8_EINT] =	0x0028,
+	[SPMI_SLV_F_C_EINT] =	0x002C,
+	[SPMI_REC_CTRL] =	0x0040,
+	[SPMI_REC0] =		0x0044,
+	[SPMI_REC1] =		0x0048,
+	[SPMI_REC2] =		0x004C,
+	[SPMI_REC3] =		0x0050,
+	[SPMI_REC4] =		0x0054,
+	[SPMI_REC_CMD_DEC] =	0x005C,
+	[SPMI_DEC_DBG] =	0x00F8,
+	[SPMI_MST_DBG] =	0x00FC,
+};
+
 static u32 pmif_readl(struct pmif *arb, enum pmif_regs reg)
 {
 	return readl(arb->base + arb->data->regs[reg]);
@@ -348,6 +427,14 @@ static const struct pmif_data mt6873_pmif_arb = {
 	.soc_chan = 2,
 };
 
+static const struct pmif_data mt8195_pmif_arb[] = {
+	{
+		.regs = mt8195_regs,
+		.spmimst_regs = mt8195_spmi_regs,
+		.soc_chan = 2,
+	},
+};
+
 static int mtk_spmi_probe(struct platform_device *pdev)
 {
 	struct pmif *arb;
@@ -444,6 +531,9 @@ static const struct of_device_id mtk_spmi_match_table[] = {
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
