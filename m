Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B950C7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 03:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8crC6JDN1PDEzgJDHyrRI9+0OjAu60qsAfWD7/5X4k=; b=zaIYcfLCC37yqTV8DJCqvLwNIs
	ceHEWsgei+XXmwxwqOpq2y3C5Auy/FQsr2MIo4MDtVFEFxW4CtOIxmnpkNMp+IVIeOfHd9nWzoaO4
	rbEb0WhRyiW3Qdf2lFqdve3VtvMZVrOHH8dNPxcH4g4zFKOgPMGAqFQ2URgTBNwfVTU4y3pE5A46t
	3GRojAJuUysTPEaD5WQAKDe5saER8pjqHczpojvo9e89BbikBsKmSrPjFFpBl46wC2KccyLZoh+lS
	FuRTk/l22ru/QqQwI89rueB9Crs0QabmKaBAX4L7xrk3rLbtYHCVOayxl9mDVwfKaiiF2bThomcES
	gqFAFM+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgdJW-009cCA-1w;
	Mon, 27 Mar 2023 03:14:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgdJM-009c5s-1a;
	Mon, 27 Mar 2023 03:14:23 +0000
X-UUID: 7351c7e2cc4d11ed8687db9d93187ff1-20230326
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=O8crC6JDN1PDEzgJDHyrRI9+0OjAu60qsAfWD7/5X4k=;
	b=AcWWF9n3+0l0/h3Q6BfVnQHz8Gk7XOnazVDM82CGFzJkGWdBnUdiZNxzaZ9+2PJ4ku8dpOxXsy6Mbz0WuqxEseNGehanNv0L8+X5d4vBjpfGsKJBzr/VeSPPw+4o50GamCgu/JVpoDpvpBP4qM9dicC7rakGIZLuQfkeq/GLoCg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:39564494-88f4-4fbf-a554-79e783e4ee14,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:6a9efef6-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 7351c7e2cc4d11ed8687db9d93187ff1-20230326
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 875699088; Sun, 26 Mar 2023 20:14:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 27 Mar 2023 11:13:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 27 Mar 2023 11:13:36 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ping-Hsun
 Wu <ping-hsun.wu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v7 04/12] media: platform: mtk-mdp3: chip config split about subcomponents
Date: Mon, 27 Mar 2023 11:13:27 +0800
Message-ID: <20230327031335.9663-5-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230327031335.9663-1-moudy.ho@mediatek.com>
References: <20230327031335.9663-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_201420_530632_B9F080EF 
X-CRM114-Status: GOOD (  14.02  )
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

Integrate subcomponent related information into specific config file for
further multi-chip compatibility.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../media/platform/mediatek/mdp3/mdp_cfg_data.c    | 12 ++++++++++++
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c   | 14 ++------------
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.h   |  1 +
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
index 4bf721957937..82e2e690a767 100644
--- a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
+++ b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
@@ -144,12 +144,24 @@ static const struct mdp_comp_data mt8183_mdp_comp_data[MDP_MAX_COMP_COUNT] = {
 	},
 };
 
+static const struct of_device_id mt8183_sub_comp_dt_ids[] = {
+	{
+		.compatible = "mediatek,mt8183-mdp3-wdma",
+		.data = (void *)MDP_COMP_TYPE_PATH,
+	}, {
+		.compatible = "mediatek,mt8183-mdp3-wrot",
+		.data = (void *)MDP_COMP_TYPE_PATH,
+	},
+	{}
+};
+
 const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.mdp_probe_infra = mt8183_mdp_probe_infra,
 	.mdp_cfg = &mt8183_plat_cfg,
 	.mdp_mutex_table_idx = mt8183_mutex_idx,
 	.comp_data = mt8183_mdp_comp_data,
 	.comp_data_len = ARRAY_SIZE(mt8183_mdp_comp_data),
+	.mdp_sub_comp_dt_ids = mt8183_sub_comp_dt_ids,
 };
 
 s32 mdp_cfg_get_id_inner(struct mdp_dev *mdp_dev, enum mtk_mdp_comp_id id)
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index 86aa031789d6..49bfe0094b19 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -610,17 +610,6 @@ static const struct of_device_id mdp_comp_dt_ids[] = {
 	{}
 };
 
-static const struct of_device_id mdp_sub_comp_dt_ids[] = {
-	{
-		.compatible = "mediatek,mt8183-mdp3-wdma",
-		.data = (void *)MDP_COMP_TYPE_PATH,
-	}, {
-		.compatible = "mediatek,mt8183-mdp3-wrot",
-		.data = (void *)MDP_COMP_TYPE_PATH,
-	},
-	{}
-};
-
 static inline bool is_dma_capable(const enum mdp_comp_type type)
 {
 	return (type == MDP_COMP_TYPE_RDMA ||
@@ -871,6 +860,7 @@ static int mdp_comp_sub_create(struct mdp_dev *mdp)
 {
 	struct device *dev = &mdp->pdev->dev;
 	struct device_node *node, *parent;
+	const struct mtk_mdp_driver_data *data = mdp->mdp_data;
 
 	parent = dev->of_node->parent;
 
@@ -880,7 +870,7 @@ static int mdp_comp_sub_create(struct mdp_dev *mdp)
 		int id, alias_id;
 		struct mdp_comp *comp;
 
-		of_id = of_match_node(mdp_sub_comp_dt_ids, node);
+		of_id = of_match_node(data->mdp_sub_comp_dt_ids, node);
 		if (!of_id)
 			continue;
 		if (!of_device_is_available(node)) {
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 0c398ef75616..41eeba49fb42 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -56,6 +56,7 @@ struct mtk_mdp_driver_data {
 	const u32 *mdp_mutex_table_idx;
 	const struct mdp_comp_data *comp_data;
 	unsigned int comp_data_len;
+	const struct of_device_id *mdp_sub_comp_dt_ids;
 };
 
 struct mdp_dev {
-- 
2.18.0


