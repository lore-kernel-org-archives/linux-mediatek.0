Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7790C677F1
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 06:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgMKWf8cswrcZe1AKhWsFWsHR/fVUbTFef1NB0mRUw8=; b=YybjS3suSyQy+P0EvX1pZuNfkY
	uMY3Mmr+GmUF93OwZ9OugJMn+rbxKNBXMEb7+M9VsIykwU75lM4D4VwMynVjPHfznDieFg37qnNh1
	FMMxPtRMp4D2Wti3cU2h/tOz0a1O4xgaP4VfgmKnH84Hx57Dxkcb5mfPgAmeW3/x/Z/A+gygecyw8
	kphp+cigWm9yPE6dYIkTN5L/Bi66I+5lpVt4MbxjvRWs1NZsQ4tiP2jooXxla9SyoC/EDZ1AH+GNy
	A8gYh8gmry3I98FADt59mIvenbh2HMJW8OKZbxSr6astWkLzSk3y+T+himb2uiv+87+JeGypOmMv5
	dBJBqdyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDlM-000r6h-MJ; Fri, 13 Jan 2023 06:42:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDlI-000r54-F5
	for linux-mediatek@bombadil.infradead.org; Fri, 13 Jan 2023 06:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pgMKWf8cswrcZe1AKhWsFWsHR/fVUbTFef1NB0mRUw8=; b=Z/Rn3lanukkOBGGii6fZAOkIvX
	OxQFVfWxS3HnKaVbPcJPStiSROL0kIWz07k3HNG6UqwOwpaGe3De1SSOvp3MKzQMmbU5eijmwBQZI
	D6Vz777APVbC6D1rQF01s535Yjz4TEVB3DvU2Jq0X79FHJosYF/I5n9Q16URM6evcQR0nU0lWsqB/
	Y+hKJuD/hsHUjyOTdOOOiwyZPUKVQ77cnPeftUI6TvSGPstflOhPPwhwNBkMBc8LoQ0m/49k6z31+
	B/FNUFqD+TeqrfI0CAUeHPB8ep27gKFiFTPS9/ZVKqMxNnHKHUl8Q2KfK2Pa7Jpumt8ijFowDWWRL
	JjQEWrTw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pGDl0-004G1t-2s
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Jan 2023 06:41:50 +0000
X-UUID: 58ab8a14930d11eda08d4d6090ec5a5c-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pgMKWf8cswrcZe1AKhWsFWsHR/fVUbTFef1NB0mRUw8=;
	b=hiLi3lUacpMceljQ6Lulvx1tGtUKnzahqxgcb2kXriMlg7az0RDhatdlA9N7jiDJCytWk3nQ2oaYEksYGGflNoJG9osuMlXgdSYpEZmiUSKymLdJcAImUlvm9KN7oe+CNcKqWQOCUumakldOZ4OIQQef7lmSeyjS09lLfBvnpyg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:752a538e-b52b-4543-8bb7-2506cdd4e94e,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:543e81c,CLOUDID:3922278c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 58ab8a14930d11eda08d4d6090ec5a5c-20230112
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2094106421; Thu, 12 Jan 2023 23:41:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 13 Jan 2023 14:41:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 14:41:07 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v5 09/12] media: platform: mtk-mdp3: dynamically allocate component clocks
Date: Fri, 13 Jan 2023 14:41:01 +0800
Message-ID: <20230113064104.22402-10-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113064104.22402-1-moudy.ho@mediatek.com>
References: <20230113064104.22402-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_064143_586327_21967BAA 
X-CRM114-Status: GOOD (  19.14  )
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

For extensibility of adding more MDP3 components in the further, the
magic number is removed by dynamically allocating component clocks.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 49 +++++++++++--------
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  3 +-
 2 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index 8f4786cc4416..6288c11e979a 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -670,7 +670,8 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 {
 	int i, ret;
 
-	if (comp->comp_dev) {
+	/* Only DMA capable components need the pm control */
+	if (comp->comp_dev && is_dma_capable(comp->type)) {
 		ret = pm_runtime_resume_and_get(comp->comp_dev);
 		if (ret < 0) {
 			dev_err(dev,
@@ -680,7 +681,7 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 		}
 	}
 
-	for (i = 0; i < ARRAY_SIZE(comp->clks); i++) {
+	for (i = 0; i < comp->clk_num; i++) {
 		if (IS_ERR_OR_NULL(comp->clks[i]))
 			continue;
 		ret = clk_prepare_enable(comp->clks[i]);
@@ -700,7 +701,7 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 			continue;
 		clk_disable_unprepare(comp->clks[i]);
 	}
-	if (comp->comp_dev)
+	if (comp->comp_dev && is_dma_capable(comp->type))
 		pm_runtime_put_sync(comp->comp_dev);
 
 	return ret;
@@ -710,13 +711,13 @@ void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(comp->clks); i++) {
+	for (i = 0; i < comp->clk_num; i++) {
 		if (IS_ERR_OR_NULL(comp->clks[i]))
 			continue;
 		clk_disable_unprepare(comp->clks[i]);
 	}
 
-	if (comp->comp_dev)
+	if (comp->comp_dev && is_dma_capable(comp->type))
 		pm_runtime_put(comp->comp_dev);
 }
 
@@ -795,7 +796,7 @@ static int mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
 			 struct mdp_comp *comp, enum mtk_mdp_comp_id id)
 {
 	struct device *dev = &mdp->pdev->dev;
-	int clk_num;
+	struct platform_device *pdev_c;
 	int clk_ofst;
 	int i;
 	s32 event;
@@ -805,6 +806,14 @@ static int mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
 		return -EINVAL;
 	}
 
+	pdev_c = of_find_device_by_node(node);
+	if (!pdev_c) {
+		dev_warn(dev, "can't find platform device of node:%s\n",
+			 node->name);
+		return -ENODEV;
+	}
+
+	comp->comp_dev = &pdev_c->dev;
 	comp->public_id = id;
 	comp->type = mdp->mdp_data->comp_data[id].match.type;
 	comp->inner_id = mdp->mdp_data->comp_data[id].match.inner_id;
@@ -812,10 +821,15 @@ static int mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
 	comp->ops = mdp_comp_ops[comp->type];
 	__mdp_comp_init(mdp, node, comp);
 
-	clk_num = mdp->mdp_data->comp_data[id].info.clk_num;
+	comp->clk_num = mdp->mdp_data->comp_data[id].info.clk_num;
+	comp->clks = devm_kzalloc(dev, sizeof(struct clk *) * comp->clk_num,
+				  GFP_KERNEL);
+	if (!comp->clks)
+		return -ENOMEM;
+
 	clk_ofst = mdp->mdp_data->comp_data[id].info.clk_ofst;
 
-	for (i = 0; i < clk_num; i++) {
+	for (i = 0; i < comp->clk_num; i++) {
 		comp->clks[i] = of_clk_get(node, i + clk_ofst);
 		if (IS_ERR(comp->clks[i]))
 			break;
@@ -852,6 +866,11 @@ static void mdp_comp_deinit(struct mdp_comp *comp)
 	if (!comp)
 		return;
 
+	if (comp->comp_dev && comp->clks) {
+		devm_kfree(&comp->mdp_dev->pdev->dev, comp->clks);
+		comp->clks = NULL;
+	}
+
 	if (comp->regs)
 		iounmap(comp->regs);
 }
@@ -933,7 +952,8 @@ void mdp_comp_destroy(struct mdp_dev *mdp)
 
 	for (i = 0; i < ARRAY_SIZE(mdp->comp); i++) {
 		if (mdp->comp[i]) {
-			pm_runtime_disable(mdp->comp[i]->comp_dev);
+			if (is_dma_capable(mdp->comp[i]->type))
+				pm_runtime_disable(mdp->comp[i]->comp_dev);
 			mdp_comp_deinit(mdp->comp[i]);
 			devm_kfree(mdp->comp[i]->comp_dev, mdp->comp[i]);
 			mdp->comp[i] = NULL;
@@ -945,7 +965,6 @@ int mdp_comp_config(struct mdp_dev *mdp)
 {
 	struct device *dev = &mdp->pdev->dev;
 	struct device_node *node, *parent;
-	struct platform_device *pdev;
 	int ret;
 
 	memset(mdp_comp_alias_id, 0, sizeof(mdp_comp_alias_id));
@@ -986,18 +1005,8 @@ int mdp_comp_config(struct mdp_dev *mdp)
 		}
 
 		/* Only DMA capable components need the pm control */
-		comp->comp_dev = NULL;
 		if (!is_dma_capable(comp->type))
 			continue;
-
-		pdev = of_find_device_by_node(node);
-		if (!pdev) {
-			dev_warn(dev, "can't find platform device of node:%s\n",
-				 node->name);
-			return -ENODEV;
-		}
-
-		comp->comp_dev = &pdev->dev;
 		pm_runtime_enable(comp->comp_dev);
 	}
 
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 5188aa0821c4..8d2ab9184f58 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -159,7 +159,8 @@ struct mdp_comp {
 	void __iomem			*regs;
 	phys_addr_t			reg_base;
 	u8				subsys_id;
-	struct clk			*clks[6];
+	u8				clk_num;
+	struct clk			**clks;
 	struct device			*comp_dev;
 	enum mdp_comp_type		type;
 	enum mtk_mdp_comp_id		public_id;
-- 
2.18.0


