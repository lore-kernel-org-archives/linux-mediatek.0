Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAAFCDB484
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 05:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ut2oA7TQ1B4SNdM/m4ifFZiKpmem0D4bpU3APBhehdY=; b=ECSsqHGs9sFjcHpcB2+jHfhQFV
	urJ1qb0rBAJNdNND4GX1WxpaMGg3q1dnDbg4nYrWRnZNslsr47y/aXvIGrOsVo8IBk4tGhYOCQlgM
	pmLQMGYJXsL48+vNrEWCZ+QspoKCKB5nwFToEIlBVn+qER29VcistpHYnlsHNZF6ELTYoTbci9DY3
	MJGJHHuLK5GXUMNKrJNNLd26ogH3/RtxaWHIFv3eINKtmtht2QmWfg72X5jcP/zVXDYq+sf9xKjxC
	AS3N+As2yvVgxmGjipEstvjJ2BtbG1W2p86q5YSLOpySH+BYujapAUfnl71qI/vL5MWR8FHMkHYgB
	CbAClCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtM2Y-00GQfP-2Q;
	Thu, 19 Oct 2023 05:57:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtM2I-00GQRM-29;
	Thu, 19 Oct 2023 05:57:36 +0000
X-UUID: 6395b3926e4411ee9b7791016c24628a-20231018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Ut2oA7TQ1B4SNdM/m4ifFZiKpmem0D4bpU3APBhehdY=;
	b=JZVCLWzghcTYYko/Uv8HRIud/X2n7LSJrCr43q1Xmv8I/QJPFDL7DqDIRgnt/+4176m++8jwom5biHIe8wJgtcl3+lMiYhAZdp4TysBpcMfPcgahdpQNuZ76x0zV7f6elk7Qe2zyZbtYleZnEygHBVy7OfSmmvuVtubwtRfqbNI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:0e44ef26-44e4-475e-90b5-41ad2abb3718,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:5b6b1cc0-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6395b3926e4411ee9b7791016c24628a-20231018
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 554539670; Wed, 18 Oct 2023 22:57:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Oct 2023 13:56:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 19 Oct 2023 13:56:23 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v10 20/24] drm/mediatek: Add Padding to OVL adaptor
Date: Thu, 19 Oct 2023 13:56:15 +0800
Message-ID: <20231019055619.19358-21-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231019055619.19358-1-shawn.sung@mediatek.com>
References: <20231019055619.19358-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.782700-8.000000
X-TMASE-MatchedRID: k8Cd32tj8sE9S3IiQd+eNWNW0DAjL5p+qm/9CTn1HV3ny/syo1tPD7xX
	z8rVhwNpwcmnhf2oPOu2TBlFMriBeYHcC7KYYAdEHPYwOJi6PLm4pLI6MoPBuBZIRcYzTqqlo8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqt5sv26TbrgUvXRFo+urPsC7SIbZKXAe4T0eqWHZMNO8Dgpp
	bRWBJSJB6NIHAhccyNQzg6+vQuGKZVl5MIsgd3kgGdwFmUSinjwZBgUyJVEbl6Fw8/PpTMRaVvm
	iAyeA2kc5MSfkiJFI5QBJtcKcOYfpRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.782700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 691F5CD4DF1E15E3595716D283C275BDD962418AECCD10DCB8ABDD9B04729ADD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_225734_831354_7A4EE28C 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8188 Padding to OVL adaptor to probe the driver.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index f46ca1c68610..f693b47745ba 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -29,6 +29,7 @@ enum mtk_ovl_adaptor_comp_type {
 	OVL_ADAPTOR_TYPE_ETHDR,
 	OVL_ADAPTOR_TYPE_MDP_RDMA,
 	OVL_ADAPTOR_TYPE_MERGE,
+	OVL_ADAPTOR_TYPE_PADDING,
 	OVL_ADAPTOR_TYPE_NUM,
 };
 
@@ -46,6 +47,14 @@ enum mtk_ovl_adaptor_comp_id {
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
 
@@ -66,6 +75,7 @@ static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
 	[OVL_ADAPTOR_TYPE_ETHDR]	= "ethdr",
 	[OVL_ADAPTOR_TYPE_MDP_RDMA]	= "vdo1-rdma",
 	[OVL_ADAPTOR_TYPE_MERGE]	= "merge",
+	[OVL_ADAPTOR_TYPE_PADDING]	= "padding",
 };
 
 static const struct mtk_ddp_comp_funcs ethdr = {
@@ -80,6 +90,13 @@ static const struct mtk_ddp_comp_funcs merge = {
 	.clk_disable = mtk_merge_clk_disable,
 };
 
+static const struct mtk_ddp_comp_funcs padding = {
+	.clk_enable = mtk_padding_clk_enable,
+	.clk_disable = mtk_padding_clk_disable,
+	.start = mtk_padding_start,
+	.stop = mtk_padding_stop,
+};
+
 static const struct mtk_ddp_comp_funcs rdma = {
 	.power_on = mtk_mdp_rdma_power_on,
 	.power_off = mtk_mdp_rdma_power_off,
@@ -101,6 +118,14 @@ static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
 	[OVL_ADAPTOR_MERGE1] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE2, 2, &merge },
 	[OVL_ADAPTOR_MERGE2] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE3, 3, &merge },
 	[OVL_ADAPTOR_MERGE3] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE4, 4, &merge },
+	[OVL_ADAPTOR_PADDING0] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING0, 0, &padding },
+	[OVL_ADAPTOR_PADDING1] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING1, 1, &padding },
+	[OVL_ADAPTOR_PADDING2] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING2, 2, &padding },
+	[OVL_ADAPTOR_PADDING3] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING3, 3, &padding },
+	[OVL_ADAPTOR_PADDING4] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING4, 4, &padding },
+	[OVL_ADAPTOR_PADDING5] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING5, 5, &padding },
+	[OVL_ADAPTOR_PADDING6] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING6, 6, &padding },
+	[OVL_ADAPTOR_PADDING7] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING7, 7, &padding },
 };
 
 void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
@@ -436,6 +461,7 @@ static int ovl_adaptor_comp_get_id(struct device *dev, struct device_node *node,
 }
 
 static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
+	{ .compatible = "mediatek,mt8188-padding", .data = (void *)OVL_ADAPTOR_TYPE_PADDING },
 	{ .compatible = "mediatek,mt8195-disp-ethdr", .data = (void *)OVL_ADAPTOR_TYPE_ETHDR },
 	{ .compatible = "mediatek,mt8195-disp-merge", .data = (void *)OVL_ADAPTOR_TYPE_MERGE },
 	{ .compatible = "mediatek,mt8195-vdo1-rdma", .data = (void *)OVL_ADAPTOR_TYPE_MDP_RDMA },
-- 
2.18.0


