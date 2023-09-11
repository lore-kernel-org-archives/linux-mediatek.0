Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EE6EEB58C
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 07:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfmKWqVRCEg51fVBa36M3QTIap9rdh46pvZ/mooJ0KE=; b=OburLTjlOtoP5A/SyQZVRdAZC9
	+DrKkQWctLc9gCTx5ptRIOhCWrORG3j5GaNrMTGWRunADLv339IIVUwJcHcjx/DrJL2ra3bwDL4Fh
	FuskUTG4Kx4RAoM0hWQWmnBdk8XkSMe9I7QkJu1FELymZ4Vq3/mYS80ISTpmBRkLz+dzYha+ukHEW
	2HyWuXQXOScTovHsBXpXtFbCCcGdit946XwPwRrtZcneUdEfdV4G65kIW9cTD3TiL6sKGHG8d1w3T
	xBmusITKEh3wxq0NTSkLHYj3P/asSS9N8yc5UUoyzSw7xSVXPbC7tjgFFoNTF5F2gU2RXZCwim/oy
	WNviumkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfba7-00HRW7-1x;
	Mon, 11 Sep 2023 07:43:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbZw-00HRJg-1y;
	Mon, 11 Sep 2023 07:43:31 +0000
X-UUID: e181a1d0507611ee86758d4a7c00f3a0-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WfmKWqVRCEg51fVBa36M3QTIap9rdh46pvZ/mooJ0KE=;
	b=TOM3lbmVkA9bsuTfs1WO4m8XeaUIAJF5wT1HJJ1Wf5dhfEf05h0WGRIBPM33Wajwn/xnYNBvUk9GbhsdkvbB2G85j1bLMNyr6GkHrpJyjs3CeU5ti7zy7fzA4Hn0LoJ0rjys35D+OPXYilKEelvDWPa4Y0i9kPRnRnfjxGfWElw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:0a8a176f-1d17-4712-a13b-273c19409803,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:eea8e1c2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e181a1d0507611ee86758d4a7c00f3a0-20230911
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 861144114; Mon, 11 Sep 2023 00:43:21 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 15:42:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 15:42:46 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, "Jason-JH
 . Lin" <jason-jh.lin@mediatek.com>, Hsiao Chien Sung
	<shawn.sung@mediatek.com>
Subject: [RESEND PATCH v6 18/20] drm/mediatek: Add Padding to OVL adaptor
Date: Mon, 11 Sep 2023 15:42:31 +0800
Message-ID: <20230911074233.31556-19-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230911074233.31556-1-shawn.sung@mediatek.com>
References: <20230911074233.31556-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_004328_721559_12739D82 
X-CRM114-Status: GOOD (  13.43  )
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

Add MT8188 Padding to OVL adaptor to probe the driver.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 84133303a6ec..217c39af27bd 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -30,6 +30,7 @@ enum mtk_ovl_adaptor_comp_type {
 	OVL_ADAPTOR_TYPE_ETHDR,
 	OVL_ADAPTOR_TYPE_MDP_RDMA,
 	OVL_ADAPTOR_TYPE_MERGE,
+	OVL_ADAPTOR_TYPE_PADDING,
 	OVL_ADAPTOR_TYPE_NUM,
 };

@@ -47,6 +48,14 @@ enum mtk_ovl_adaptor_comp_id {
 	OVL_ADAPTOR_MERGE1,
 	OVL_ADAPTOR_MERGE2,
 	OVL_ADAPTOR_MERGE3,
+	OVL_ADAPTOR_PADDING0,
+	OVL_ADAPTOR_PADDING1,
+	OVL_ADAPTOR_PADDING2,
+	OVL_ADAPTOR_PADDING3,
+	OVL_ADAPTOR_PADDING4,
+	OVL_ADAPTOR_PADDING5,
+	OVL_ADAPTOR_PADDING6,
+	OVL_ADAPTOR_PADDING7,
 	OVL_ADAPTOR_ID_MAX
 };

@@ -67,6 +76,7 @@ static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
 	[OVL_ADAPTOR_TYPE_ETHDR]	= "ethdr",
 	[OVL_ADAPTOR_TYPE_MDP_RDMA]	= "vdo1-rdma",
 	[OVL_ADAPTOR_TYPE_MERGE]	= "merge",
+	[OVL_ADAPTOR_TYPE_PADDING]	= "padding",
 };

 static const struct mtk_ddp_comp_funcs _ethdr = {
@@ -79,6 +89,11 @@ static const struct mtk_ddp_comp_funcs _merge = {
 	.clk_disable = mtk_merge_clk_disable,
 };

+static const struct mtk_ddp_comp_funcs _padding = {
+	.clk_enable = mtk_padding_clk_enable,
+	.clk_disable = mtk_padding_clk_disable,
+};
+
 static const struct mtk_ddp_comp_funcs _rdma = {
 	.clk_enable = mtk_mdp_rdma_clk_enable,
 	.clk_disable = mtk_mdp_rdma_clk_disable,
@@ -98,6 +113,14 @@ static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
 	[OVL_ADAPTOR_MERGE1] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE2, 2, &_merge },
 	[OVL_ADAPTOR_MERGE2] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE3, 3, &_merge },
 	[OVL_ADAPTOR_MERGE3] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE4, 4, &_merge },
+	[OVL_ADAPTOR_PADDING0] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING0, 0, &_padding },
+	[OVL_ADAPTOR_PADDING1] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING1, 1, &_padding },
+	[OVL_ADAPTOR_PADDING2] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING2, 2, &_padding },
+	[OVL_ADAPTOR_PADDING3] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING3, 3, &_padding },
+	[OVL_ADAPTOR_PADDING4] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING4, 4, &_padding },
+	[OVL_ADAPTOR_PADDING5] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING5, 5, &_padding },
+	[OVL_ADAPTOR_PADDING6] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING6, 6, &_padding },
+	[OVL_ADAPTOR_PADDING7] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING7, 7, &_padding },
 };

 void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
@@ -109,6 +132,8 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 	struct mtk_mdp_rdma_cfg rdma_config = {0};
 	struct device *rdma_l;
 	struct device *rdma_r;
+	struct device *padding_l;
+	struct device *padding_r;
 	struct device *merge;
 	struct device *ethdr;
 	const struct drm_format_info *fmt_info = drm_format_info(pending->format);
@@ -125,6 +150,8 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,

 	rdma_l = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * idx];
 	rdma_r = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0 + 2 * idx + 1];
+	padding_l = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_PADDING0 + 2 * idx];
+	padding_r = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_PADDING0 + 2 * idx + 1];
 	merge = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + idx];
 	ethdr = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0];

@@ -160,10 +187,15 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
 	rdma_config.color_encoding = pending->color_encoding;
 	mtk_mdp_rdma_config(rdma_l, &rdma_config, cmdq_pkt);

+	if (padding_l)
+		mtk_padding_config(padding_l, cmdq_pkt);
+
 	if (use_dual_pipe) {
 		rdma_config.x_left = l_w;
 		rdma_config.width = r_w;
 		mtk_mdp_rdma_config(rdma_r, &rdma_config, cmdq_pkt);
+		if (padding_r)
+			mtk_padding_config(padding_r, cmdq_pkt);
 	}

 	mtk_merge_start_cmdq(merge, cmdq_pkt);
@@ -354,6 +386,7 @@ static int ovl_adaptor_comp_get_id(struct device *dev, struct device_node *node,
 }

 static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
+	{ .compatible = "mediatek,mt8188-padding", .data = (void *)OVL_ADAPTOR_TYPE_PADDING },
 	{ .compatible = "mediatek,mt8195-disp-ethdr", .data = (void *)OVL_ADAPTOR_TYPE_ETHDR },
 	{ .compatible = "mediatek,mt8195-disp-merge", .data = (void *)OVL_ADAPTOR_TYPE_MERGE },
 	{ .compatible = "mediatek,mt8195-vdo1-rdma", .data = (void *)OVL_ADAPTOR_TYPE_MDP_RDMA },
--
2.18.0


