Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D1EC54EBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 03:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/Tod11GOdMgVJPh3vYnJeTVRaZrrcOUSJCH1lQ0dpY=; b=zvElVHATSm82yWejIpnXy1PHB4
	HDlbeCzxc3tuhhoyPyLmCf/6R3PEsycEa0csZKe8aZpG7RuW57pnjGW1dC2inRpmJXHd/O7eX/wdP
	8s7Ziz/AsvTZ3ZJxeTWlQFmJ1tI9Pswj9LP7p/i+nMBZyCYQ5r/g9KzgkCUDn/3/hGPTbRTB2fuF5
	kBLuHqdBgNNVjyeBUBQ458kMgl0iNje3ikD3PxSsrhO34tYGiI7vmSW8zpPGzbCA5HwRb0M0dsved
	mCUN/PQhf2QBDV03g6FxV2acJJdmxkhqI02ThuxhZI/mLSruX7sfRUoT53m0AE3KtzwvvTry1Oc9C
	HA4VFXvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHGSo-008YK2-5Q; Mon, 16 Jan 2023 03:47:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHGO4-008W1m-Fv; Mon, 16 Jan 2023 03:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y/Tod11GOdMgVJPh3vYnJeTVRaZrrcOUSJCH1lQ0dpY=; b=CslJahlEjjqI6B6DzfdB+aGQW+
	8kkobyWn8Osg2s1wv0f93+pq77u6qtBfs7MiBETVvvX4kMkdkkhCyedMY8MnwIjIJrZax/HK9XG7q
	b6cc4gXTEXPLHkGdEPyFBrVMsF/9kn9LXE4+WqmsiJZs4B0wkEe0PhBy2kS+xt5dHBLgu2aKghufC
	hQjajdfuNC7KbGXAhxkf8oXFnCy7FmIvFM7rgVRd4QhN3AK+iRedumD7GzztC+0toHi+4tLDvWYqb
	zs9MPXGQUVtjsMKJEzotyJ1hnmf57L7OcnP+TdOp+hmYNDANimZec2mdq+2oqYYqMCTdBviHw6ODz
	Uwh1d8nw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHGNq-005Syu-0J;
	Mon, 16 Jan 2023 03:42:09 +0000
X-UUID: b7103516954f11edbbe3f76fe852e059-20230115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=y/Tod11GOdMgVJPh3vYnJeTVRaZrrcOUSJCH1lQ0dpY=;
	b=jHQwl6JBb9T0x2B56BdJH9ypfCMYzlySQNj1y4mDO/o+sDj96D928qRmESSozW4YfhOcRYFE7smZhB7GrDJyNZhGUWkSbTnyZ2Qucl0Pwn86VwrxGOMt9YsL5ZLCY1oIjgGmzXq2DgpcRbumorUFaxgw34AXUHnY8KKRq/wwpno=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:511e657b-cbfc-4ec7-a404-3ec884a68f05,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:9cf0568c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: b7103516954f11edbbe3f76fe852e059-20230115
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 491176360; Sun, 15 Jan 2023 20:41:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 16 Jan 2023 11:21:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 16 Jan 2023 11:21:48 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [RESEND v3 03/13] media: platform: mtk-mdp3: add support second sets of MMSYS
Date: Mon, 16 Jan 2023 11:21:37 +0800
Message-ID: <20230116032147.23607-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230116032147.23607-1-moudy.ho@mediatek.com>
References: <20230116032147.23607-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_034207_005253_7230B453 
X-CRM114-Status: GOOD (  20.28  )
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

In MT8195, there are two sets of MMSYS named VPPSYS0 and VPPSYS1,
which are used to coordinate and control the clock, power and
register settings required by the components of MDP3.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../mediatek/mdp3/mt8183/mdp3-plat-mt8183.h   | 36 ++++++++---------
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  1 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 40 +++++++++++++------
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  3 ++
 4 files changed, 49 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h b/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
index b1d4cbeda932..6dd06131e256 100644
--- a/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
+++ b/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
@@ -89,75 +89,75 @@ enum mt8183_mdp_comp_id {
 
 static const struct mdp_comp_data mt8183_mdp_comp_data[MDP_MAX_COMP_COUNT] = {
 	[MDP_COMP_WPEI] = {
-		{MDP_COMP_TYPE_WPEI, 0, MT8183_MDP_COMP_WPEI},
+		{MDP_COMP_TYPE_WPEI, 0, MT8183_MDP_COMP_WPEI, 0},
 		{0, 0, 0}
 	},
 	[MDP_COMP_WPEO] = {
-		{MDP_COMP_TYPE_EXTO, 2, MT8183_MDP_COMP_WPEO},
+		{MDP_COMP_TYPE_EXTO, 2, MT8183_MDP_COMP_WPEO, 0},
 		{0, 0, 0}
 	},
 	[MDP_COMP_WPEI2] = {
-		{MDP_COMP_TYPE_WPEI, 1, MT8183_MDP_COMP_WPEI2},
+		{MDP_COMP_TYPE_WPEI, 1, MT8183_MDP_COMP_WPEI2, 0},
 		{0, 0, 0}
 	},
 	[MDP_COMP_WPEO2] = {
-		{MDP_COMP_TYPE_EXTO, 3, MT8183_MDP_COMP_WPEO2},
+		{MDP_COMP_TYPE_EXTO, 3, MT8183_MDP_COMP_WPEO2, 0},
 		{0, 0, 0}
 	},
 	[MDP_COMP_ISP_IMGI] = {
-		{MDP_COMP_TYPE_IMGI, 0, MT8183_MDP_COMP_ISP_IMGI},
+		{MDP_COMP_TYPE_IMGI, 0, MT8183_MDP_COMP_ISP_IMGI, 0},
 		{0, 0, 4}
 	},
 	[MDP_COMP_ISP_IMGO] = {
-		{MDP_COMP_TYPE_EXTO, 0, MT8183_MDP_COMP_ISP_IMGO},
+		{MDP_COMP_TYPE_EXTO, 0, MT8183_MDP_COMP_ISP_IMGO, 0},
 		{0, 0, 4}
 	},
 	[MDP_COMP_ISP_IMG2O] = {
-		{MDP_COMP_TYPE_EXTO, 1, MT8183_MDP_COMP_ISP_IMG2O},
+		{MDP_COMP_TYPE_EXTO, 1, MT8183_MDP_COMP_ISP_IMG2O, 0},
 		{0, 0, 0}
 	},
 	[MDP_COMP_CAMIN] = {
-		{MDP_COMP_TYPE_DL_PATH, 0, MT8183_MDP_COMP_CAMIN},
+		{MDP_COMP_TYPE_DL_PATH, 0, MT8183_MDP_COMP_CAMIN, 0},
 		{2, 2, 1}
 	},
 	[MDP_COMP_CAMIN2] = {
-		{MDP_COMP_TYPE_DL_PATH, 1, MT8183_MDP_COMP_CAMIN2},
+		{MDP_COMP_TYPE_DL_PATH, 1, MT8183_MDP_COMP_CAMIN2, 0},
 		{2, 4, 1}
 	},
 	[MDP_COMP_RDMA0] = {
-		{MDP_COMP_TYPE_RDMA, 0, MT8183_MDP_COMP_RDMA0},
+		{MDP_COMP_TYPE_RDMA, 0, MT8183_MDP_COMP_RDMA0, 0},
 		{2, 0, 0}
 	},
 	[MDP_COMP_CCORR0] = {
-		{MDP_COMP_TYPE_CCORR, 0, MT8183_MDP_COMP_CCORR0},
+		{MDP_COMP_TYPE_CCORR, 0, MT8183_MDP_COMP_CCORR0, 0},
 		{1, 0, 0}
 	},
 	[MDP_COMP_RSZ0] = {
-		{MDP_COMP_TYPE_RSZ, 0, MT8183_MDP_COMP_RSZ0},
+		{MDP_COMP_TYPE_RSZ, 0, MT8183_MDP_COMP_RSZ0, 0},
 		{1, 0, 0}
 	},
 	[MDP_COMP_RSZ1] = {
-		{MDP_COMP_TYPE_RSZ, 1, MT8183_MDP_COMP_RSZ1},
+		{MDP_COMP_TYPE_RSZ, 1, MT8183_MDP_COMP_RSZ1, 0},
 		{1, 0, 0}
 	},
 	[MDP_COMP_TDSHP0] = {
-		{MDP_COMP_TYPE_TDSHP, 0, MT8183_MDP_COMP_TDSHP0},
+		{MDP_COMP_TYPE_TDSHP, 0, MT8183_MDP_COMP_TDSHP0, 0},
 		{0, 0, 0}
 	},
 	[MDP_COMP_PATH0_SOUT] = {
-		{MDP_COMP_TYPE_PATH, 0, MT8183_MDP_COMP_PATH0_SOUT},
+		{MDP_COMP_TYPE_PATH, 0, MT8183_MDP_COMP_PATH0_SOUT, 0},
 		{0, 0, 0}
 	},
 	[MDP_COMP_PATH1_SOUT] = {
-		{MDP_COMP_TYPE_PATH, 1, MT8183_MDP_COMP_PATH1_SOUT},
+		{MDP_COMP_TYPE_PATH, 1, MT8183_MDP_COMP_PATH1_SOUT, 0},
 		{0, 0, 0}
 	},
 	[MDP_COMP_WROT0] = {
-		{MDP_COMP_TYPE_WROT, 0, MT8183_MDP_COMP_WROT0},
+		{MDP_COMP_TYPE_WROT, 0, MT8183_MDP_COMP_WROT0, 0},
 		{1, 0, 0}
 	},
 	[MDP_COMP_WDMA] = {
-		{MDP_COMP_TYPE_WDMA, 0, MT8183_MDP_COMP_WDMA},
+		{MDP_COMP_TYPE_WDMA, 0, MT8183_MDP_COMP_WDMA, 0},
 		{1, 0, 0}
 	},
 };
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 8d2ab9184f58..acb7ce69dbf3 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -138,6 +138,7 @@ struct mdp_comp_match {
 	enum mdp_comp_type type;
 	u32 alias_id;
 	s32 inner_id;
+	u32 mmsys_id;
 };
 
 /* Used to describe the item order in MDP property */
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 8daa7245c90b..927d3d65751a 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -41,39 +41,45 @@ static const struct of_device_id mdp_of_ids[] = {
 MODULE_DEVICE_TABLE(of, mdp_of_ids);
 
 static struct platform_device *__get_pdev_by_id(struct platform_device *pdev,
+						struct platform_device *from,
 						enum mdp_infra_id id)
 {
-	struct device_node *node;
+	struct device_node *node, *f = NULL;
 	struct platform_device *mdp_pdev = NULL;
 	const struct mtk_mdp_driver_data *mdp_data;
 	const char *compat;
 
 	if (!pdev)
-		return NULL;
+		return ERR_PTR(-ENODEV);
 
 	if (id < MDP_INFRA_MMSYS || id >= MDP_INFRA_MAX) {
 		dev_err(&pdev->dev, "Illegal infra id %d\n", id);
-		return NULL;
+		return ERR_PTR(-ENODEV);
 	}
 
 	mdp_data = of_device_get_match_data(&pdev->dev);
 	if (!mdp_data) {
 		dev_err(&pdev->dev, "have no driver data to find node\n");
-		return NULL;
+		return ERR_PTR(-ENODEV);
 	}
+
 	compat = mdp_data->mdp_probe_infra[id].compatible;
+	if (strlen(compat) == 0)
+		return NULL;
 
-	node = of_find_compatible_node(NULL, NULL, compat);
+	if (from)
+		f = from->dev.of_node;
+	node = of_find_compatible_node(f, NULL, compat);
 	if (WARN_ON(!node)) {
 		dev_err(&pdev->dev, "find node from id %d failed\n", id);
-		return NULL;
+		return ERR_PTR(-ENODEV);
 	}
 
 	mdp_pdev = of_find_device_by_node(node);
 	of_node_put(node);
 	if (WARN_ON(!mdp_pdev)) {
 		dev_err(&pdev->dev, "find pdev from id %d failed\n", id);
-		return NULL;
+		return ERR_PTR(-ENODEV);
 	}
 
 	return mdp_pdev;
@@ -167,7 +173,7 @@ static int mdp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mdp_dev *mdp;
-	struct platform_device *mm_pdev;
+	struct platform_device *mm_pdev, *mm2_pdev;
 	int ret, i, mutex_id;
 
 	mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
@@ -179,15 +185,23 @@ static int mdp_probe(struct platform_device *pdev)
 	mdp->pdev = pdev;
 	mdp->mdp_data = of_device_get_match_data(&pdev->dev);
 
-	mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_MMSYS);
-	if (!mm_pdev) {
+	mm_pdev = __get_pdev_by_id(pdev, NULL, MDP_INFRA_MMSYS);
+	if (IS_ERR_OR_NULL(mm_pdev)) {
 		ret = -ENODEV;
 		goto err_destroy_device;
 	}
 	mdp->mdp_mmsys = &mm_pdev->dev;
 
-	mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_MUTEX);
-	if (WARN_ON(!mm_pdev)) {
+	/* Not all chips have MMSYS2, config may be null */
+	mm2_pdev = __get_pdev_by_id(pdev, mm_pdev, MDP_INFRA_MMSYS2);
+	if (IS_ERR(mm2_pdev)) {
+		ret = PTR_ERR(mm2_pdev);
+		goto err_destroy_device;
+	}
+	mdp->mdp_mmsys2 = &mm2_pdev->dev;
+
+	mm_pdev = __get_pdev_by_id(pdev, NULL, MDP_INFRA_MUTEX);
+	if (IS_ERR_OR_NULL(mm_pdev)) {
 		ret = -ENODEV;
 		goto err_destroy_device;
 	}
@@ -223,7 +237,7 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_destroy_job_wq;
 	}
 
-	mm_pdev = __get_pdev_by_id(pdev, MDP_INFRA_SCP);
+	mm_pdev = __get_pdev_by_id(pdev, NULL, MDP_INFRA_SCP);
 	if (WARN_ON(!mm_pdev)) {
 		dev_err(&pdev->dev, "Could not get scp device\n");
 		ret = -ENODEV;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index b7288fe15134..0b40ccfd376c 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -20,6 +20,7 @@
 
 enum mdp_infra_id {
 	MDP_INFRA_MMSYS,
+	MDP_INFRA_MMSYS2,
 	MDP_INFRA_MUTEX,
 	MDP_INFRA_SCP,
 	MDP_INFRA_MAX
@@ -68,6 +69,7 @@ struct mtk_mdp_driver_data {
 struct mdp_dev {
 	struct platform_device			*pdev;
 	struct device				*mdp_mmsys;
+	struct device				*mdp_mmsys2;
 	struct mtk_mutex			*mdp_mutex[MDP_PIPE_MAX];
 	struct mdp_comp				*comp[MDP_MAX_COMP_COUNT];
 	const struct mtk_mdp_driver_data	*mdp_data;
@@ -96,6 +98,7 @@ struct mdp_dev {
 
 struct mdp_pipe_info {
 	enum mdp_pipe_id pipe_id;
+	u32 mmsys_id;
 	u32 mutex_id;
 };
 
-- 
2.18.0


