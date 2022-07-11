Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83637C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 12:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0jrQsT5P70+ntB6kCTd/oE/WInaoVaDdBZVYyip8Vw=; b=jpGBAiiihutz/L9r7UJmXzdNm3
	c+LgLzwOkch0nJHfOzQIKBxFaG1wAJrMfe1nqHcoOI7nejUBr2ZW4zq0GKU2e/fgajSppcw3O1E8h
	VY6ODa05GuNhA9EVcEMLF7gVt1iqlzKJWX1saTSlV39DW78rUVxS2Z+RhcRAL0bJdBoljkf+5biFj
	S+OvMH6R6vNBPzj3DcJy8SzXeMcebvAuO61w9rspEEowm6gfyK0vg/uG0fBCPsgIGrrdVVHAnCxjx
	dCw9289u1qyQzLZNGtHw6lNh3xYW+GnnzyGsnvEX7LjFcHeSPDL6iCG6i75hoWEqT7zwyxTRuelUt
	B2KZ+Mug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsbx-001TDB-AO; Mon, 11 Jul 2022 12:34:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsbV-001Sz4-WC; Mon, 11 Jul 2022 12:33:35 +0000
X-UUID: b90dcc8bcd7d46e293e5606bbae78228-20220711
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:1aeed7c4-51e0-48c7-80fa-3a333cd1c556,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:24cd2ad7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b90dcc8bcd7d46e293e5606bbae78228-20220711
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 294980593; Mon, 11 Jul 2022 05:33:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 11 Jul 2022 20:32:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 11 Jul 2022 20:32:50 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@canonical.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Xiandong Wang
	<xiandong.wang@mediatek.com>
Subject: [PATCH v2 2/2] soc: mediatek: mutex: add mt8186 mutex mod settings for mdp3
Date: Mon, 11 Jul 2022 20:32:47 +0800
Message-ID: <20220711123247.15807-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220711123247.15807-1-allen-kh.cheng@mediatek.com>
References: <20220711123247.15807-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_053334_084479_3CC78EDE 
X-CRM114-Status: GOOD (  11.95  )
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

This patch adds mt8186 mutex mod settings for mdp3.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c       | 28 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mutex.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 5ea43de4e410..f95100d4de73 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -91,6 +91,15 @@
 #define MT8183_MUTEX_MOD_MDP_AAL0		23
 #define MT8183_MUTEX_MOD_MDP_CCORR0		24
 
+#define MT8186_MUTEX_MOD_MDP_RDMA0		0
+#define MT8186_MUTEX_MOD_MDP_AAL0		2
+#define MT8186_MUTEX_MOD_MDP_HDR0		4
+#define MT8186_MUTEX_MOD_MDP_RSZ0		5
+#define MT8186_MUTEX_MOD_MDP_RSZ1		6
+#define MT8186_MUTEX_MOD_MDP_WROT0		7
+#define MT8186_MUTEX_MOD_MDP_TDSHP0		9
+#define MT8186_MUTEX_MOD_MDP_COLOR0		14
+
 #define MT8173_MUTEX_MOD_DISP_OVL0		11
 #define MT8173_MUTEX_MOD_DISP_OVL1		12
 #define MT8173_MUTEX_MOD_DISP_RDMA0		13
@@ -324,6 +333,17 @@ static const unsigned int mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_RDMA1] = MT8186_MUTEX_MOD_DISP_RDMA1,
 };
 
+static const unsigned int mt8186_mdp_mutex_table_mod[MUTEX_MOD_IDX_MAX] = {
+	[MUTEX_MOD_IDX_MDP_RDMA0] = MT8186_MUTEX_MOD_MDP_RDMA0,
+	[MUTEX_MOD_IDX_MDP_RSZ0] = MT8186_MUTEX_MOD_MDP_RSZ0,
+	[MUTEX_MOD_IDX_MDP_RSZ1] = MT8186_MUTEX_MOD_MDP_RSZ1,
+	[MUTEX_MOD_IDX_MDP_TDSHP0] = MT8186_MUTEX_MOD_MDP_TDSHP0,
+	[MUTEX_MOD_IDX_MDP_WROT0] = MT8186_MUTEX_MOD_MDP_WROT0,
+	[MUTEX_MOD_IDX_MDP_HDR0] = MT8186_MUTEX_MOD_MDP_HDR0,
+	[MUTEX_MOD_IDX_MDP_AAL0] = MT8186_MUTEX_MOD_MDP_AAL0,
+	[MUTEX_MOD_IDX_MDP_COLOR0] = MT8186_MUTEX_MOD_MDP_COLOR0,
+};
+
 static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
@@ -458,6 +478,12 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
 	.no_clk = true,
 };
 
+static const struct mtk_mutex_data mt8186_mdp_mutex_driver_data = {
+	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
+	.mutex_table_mod = mt8186_mdp_mutex_table_mod,
+};
+
 static const struct mtk_mutex_data mt8186_mutex_driver_data = {
 	.mutex_mod = mt8186_mutex_mod,
 	.mutex_sof = mt8186_mutex_sof,
@@ -810,6 +836,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8183_mutex_driver_data},
 	{ .compatible = "mediatek,mt8186-disp-mutex",
 	  .data = &mt8186_mutex_driver_data},
+	{ .compatible = "mediatek,mt8186-mdp3-mutex",
+	  .data = &mt8186_mdp_mutex_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = &mt8192_mutex_driver_data},
 	{ .compatible = "mediatek,mt8195-disp-mutex",
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index a0f4f51a3b45..b335c2837cd8 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -20,6 +20,8 @@ enum mtk_mutex_mod_index {
 	MUTEX_MOD_IDX_MDP_WDMA,
 	MUTEX_MOD_IDX_MDP_AAL0,
 	MUTEX_MOD_IDX_MDP_CCORR0,
+	MUTEX_MOD_IDX_MDP_HDR0,
+	MUTEX_MOD_IDX_MDP_COLOR0,
 
 	MUTEX_MOD_IDX_MAX		/* ALWAYS keep at the end */
 };
-- 
2.18.0


