Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE9FC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 08:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLCTK3+bAPoK3vfhKOjAEb17AvOeLaSrhuhfsvzJ0ew=; b=dJtBt8ecVmhuRJ5ZZOekyEcVjZ
	LscQb3/bf5vBhhP+b6NpuGreuyobeH+qpvejQl6HTmV8ATCkUByQgrkWJskXix6Tu/Gf3MOJb3AzS
	0nPYBlLSNbSTpNYZixETsumZBpFvBZZxCvRUWuyAIl1FUn8vIGWv5u4DMnR3nVAzP7O+Tk6hUl5TC
	ssWKo31PMKJov2vvqerEesXHMpCjlZpRGGTWxxaqWaKMVbUEraGKuOhjif0IsFwuqNEYx5gQpOlsv
	aTPJnvkqxxC3Fn/j1DHKre3Ku/Vlc6Rpguj/RFNR5uwHgpVP8CpyOtrshw5HpisJieSxGg6ayt/kY
	2QXxCUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2q4u-00FT4G-Fl; Wed, 07 Dec 2022 08:46:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2q4L-00FSYH-UM; Wed, 07 Dec 2022 08:46:24 +0000
X-UUID: eb38390d83bf431bb15ef302ee08a5fb-20221207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rLCTK3+bAPoK3vfhKOjAEb17AvOeLaSrhuhfsvzJ0ew=;
	b=Fz+4n7cihYepPhIjYjf5J6DtwthHozDenqAgGU+3ftybIQIdJDWH0FhwkRK/OpG48QTJz4liAiixOEMzEvn72LL6GCOTSxxVtlXllt/EbkxjRIw07WLp60ZQUiAQzWse2qXTG6boZwPWyiYnJawXz7icOgF//sP+zFoWHDf6l88=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:278b9a6a-e6da-4e91-8edf-f5492fbf7262,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:4fd7e5d1-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: eb38390d83bf431bb15ef302ee08a5fb-20221207
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1818651129; Wed, 07 Dec 2022 01:46:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Dec 2022 16:44:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 7 Dec 2022 16:44:14 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v2 09/12] media: platform: mtk-mdp3: extend GCE event waiting in RDMA and WROT
Date: Wed, 7 Dec 2022 16:44:09 +0800
Message-ID: <20221207084412.14075-10-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221207084412.14075-1-moudy.ho@mediatek.com>
References: <20221207084412.14075-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_004622_046309_095BE009 
X-CRM114-Status: GOOD (  14.98  )
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

Support for multiple RDMA/WROT waits for GCE events.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../mediatek/mdp3/mt8183/mdp3-plat-mt8183.h     |  2 ++
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c      | 17 +++++++++++------
 .../platform/mediatek/mdp3/mtk-mdp3-core.h      |  2 ++
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h b/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
index fb9b34fa901a..f6a8aad33521 100644
--- a/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
+++ b/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
@@ -11,8 +11,10 @@ static const struct mdp_platform_config mt8183_plat_cfg = {
 	.rdma_support_10bit		= true,
 	.rdma_rsz1_sram_sharing		= true,
 	.rdma_upsample_repeat_only	= true,
+	.rdma_event_num			= 1,
 	.rsz_disable_dcm_small_sample	= false,
 	.wrot_filter_constraint		= false,
+	.wrot_event_num			= 1,
 };
 
 static const struct of_device_id mt8183_mdp_probe_infra[MDP_INFRA_MAX] = {
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index e6d2da173d6f..265b712d762f 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -280,14 +280,17 @@ static int config_rdma_subfrm(struct mdp_comp_ctx *ctx,
 
 static int wait_rdma_event(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 {
+	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
 	struct device *dev = &ctx->comp->mdp_dev->pdev->dev;
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
 
-	if (ctx->comp->alias_id == 0)
+	if (ctx->comp->alias_id < mdp_cfg->rdma_event_num) {
 		MM_REG_WAIT(cmd, ctx->comp->gce_event[MDP_GCE_EVENT_EOF]);
-	else
-		dev_err(dev, "Do not support RDMA1_DONE event\n");
+	} else {
+		dev_err(dev, "Invalid RDMA event %d\n", ctx->comp->alias_id);
+		return -EINVAL;
+	}
 
 	/* Disable RDMA */
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_EN, 0x0, BIT(0));
@@ -582,10 +585,12 @@ static int wait_wrot_event(struct mdp_comp_ctx *ctx, struct mdp_cmdq_cmd *cmd)
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
 
-	if (ctx->comp->alias_id == 0)
+	if (ctx->comp->alias_id < mdp_cfg->wrot_event_num) {
 		MM_REG_WAIT(cmd, ctx->comp->gce_event[MDP_GCE_EVENT_EOF]);
-	else
-		dev_err(dev, "Do not support WROT1_DONE event\n");
+	} else {
+		dev_err(dev, "Invalid WROT event %d!\n", ctx->comp->alias_id);
+		return -EINVAL;
+	}
 
 	if (mdp_cfg && mdp_cfg->wrot_filter_constraint)
 		MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE, 0x0,
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index e5bd75ff90ee..d0a2ec11e67f 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -40,8 +40,10 @@ struct mdp_platform_config {
 	bool	rdma_support_10bit;
 	bool	rdma_rsz1_sram_sharing;
 	bool	rdma_upsample_repeat_only;
+	u32	rdma_event_num;
 	bool	rsz_disable_dcm_small_sample;
 	bool	wrot_filter_constraint;
+	u32	wrot_event_num;
 };
 
 /* indicate which mutex is used by each pipepline */
-- 
2.18.0


