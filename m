Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0192C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1MthmATFQNfNnvP0lOFpmusCFZR/WLYgS8eeinmcLUA=; b=TUyWe8RWxTpkU+rB26axO1dmkC
	YliFhx50Diev/cUVTAv0VSwkDCR1v0P04REAo5ECLkOWQGhBIdDfeQU7wwb3i+GEnOiRESiYvxfg5
	VJGZ/JdcJcF5HuewTmfmhxU2KAY/HPEYVmTMgVvBu+RTkvwScAgUNTZDvjNyHNMT3yFEkYMx2aq8K
	hWyk69MFlr86v2ATOHAENHEl28aUbT0WE/f1nUJmR66NkjRuQysgqnpaKgT3YBHxKPGtk87poqxvY
	53EA4+94UciXLEDRxyQRLBLCZeyVnzE19vnC3UbostIeAe00iTrjAgBO9fsdld42Ayy4O8z07dpQy
	s2OURvLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2q36-00FR5U-Bl; Wed, 07 Dec 2022 08:45:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2q31-00FR0V-GE; Wed, 07 Dec 2022 08:45:01 +0000
X-UUID: 1b48317acc39407387d0553caea4c500-20221207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1MthmATFQNfNnvP0lOFpmusCFZR/WLYgS8eeinmcLUA=;
	b=pS8fzPGLB1vjxhVapGAwt3E5ve0sLjFYyuqh8RVbFDMdTZZFbXohpJXM4bZ/5q43HOUWwaiMTEqjPJ+GlKkVgA8zF23Inxy+koGAscYGHdYP3my5tF5sNNiDw31qp4/43XPcMn2q2vSFCpXPtuqFCRnDYadHfRFzZ73ACWHeMRc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:73633455-4dce-45e2-ba60-bf2eb5097321,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:10cbe5d1-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1b48317acc39407387d0553caea4c500-20221207
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 973672732; Wed, 07 Dec 2022 01:44:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
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
Subject: [PATCH v2 05/12] media: platform: mtk-mdp3: introduce more pipelines from 8195
Date: Wed, 7 Dec 2022 16:44:05 +0800
Message-ID: <20221207084412.14075-6-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221207084412.14075-1-moudy.ho@mediatek.com>
References: <20221207084412.14075-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_004459_563722_3637A2BA 
X-CRM114-Status: GOOD (  16.68  )
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

By expanding the MMSYS and MUTEX of each two sets in MT8195,
more pipelines can be arranged.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 80 ++++++++++++-------
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  7 ++
 2 files changed, 60 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 5472d7183a5e..365efe6a6c92 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -56,6 +56,43 @@ static struct mtk_mutex *__get_mutex(const struct mdp_dev *mdp_dev,
 	return m;
 }
 
+static enum mdp_pipe_id __get_pipe(const struct mdp_dev *mdp_dev,
+				   enum mtk_mdp_comp_id id)
+{
+	enum mdp_pipe_id pipe_id;
+
+	switch (id) {
+	case MDP_COMP_RDMA0:
+		pipe_id = MDP_PIPE_RDMA0;
+		break;
+	case MDP_COMP_ISP_IMGI:
+		pipe_id = MDP_PIPE_IMGI;
+		break;
+	case MDP_COMP_WPEI:
+		pipe_id = MDP_PIPE_WPEI;
+		break;
+	case MDP_COMP_WPEI2:
+		pipe_id = MDP_PIPE_WPEI2;
+		break;
+	case MDP_COMP_RDMA1:
+		pipe_id = MDP_PIPE_RDMA1;
+		break;
+	case MDP_COMP_RDMA2:
+		pipe_id = MDP_PIPE_RDMA2;
+		break;
+	case MDP_COMP_RDMA3:
+		pipe_id = MDP_PIPE_RDMA3;
+		break;
+	default:
+		/* Avoid exceptions when operating MUTEX */
+		pipe_id = MDP_PIPE_RDMA0;
+		dev_err(&mdp_dev->pdev->dev, "Unknown pipeline id %d", id);
+		break;
+	}
+
+	return pipe_id;
+}
+
 static int mdp_path_subfrm_require(const struct mdp_path *path,
 				   struct mdp_cmdq_cmd *cmd,
 				   struct mdp_pipe_info *p, u32 count)
@@ -63,7 +100,6 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
 	const int plat_id = path->mdp_dev->mdp_data->mdp_plat_id;
 	const struct mdp_comp_ctx *ctx;
 	const struct mtk_mdp_driver_data *data = path->mdp_dev->mdp_data;
-	struct device *dev = &path->mdp_dev->pdev->dev;
 	struct mtk_mutex *mutex;
 	int id, index;
 	u32 num_comp = 0;
@@ -72,23 +108,7 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
 		num_comp = CFG_GET(MT8183, path->config, num_components);
 
 	/* Decide which mutex to use based on the current pipeline */
-	switch (path->comps[0].comp->public_id) {
-	case MDP_COMP_RDMA0:
-		index = MDP_PIPE_RDMA0;
-		break;
-	case MDP_COMP_ISP_IMGI:
-		index = MDP_PIPE_IMGI;
-		break;
-	case MDP_COMP_WPEI:
-		index = MDP_PIPE_WPEI;
-		break;
-	case MDP_COMP_WPEI2:
-		index = MDP_PIPE_WPEI2;
-		break;
-	default:
-		dev_err(dev, "Unknown pipeline and no mutex is assigned");
-		return -EINVAL;
-	}
+	index = __get_pipe(path->mdp_dev, path->comps[0].comp->public_id);
 	memcpy(p, &data->pipe_info[index], sizeof(struct mdp_pipe_info));
 	mutex = __get_mutex(path->mdp_dev, p);
 
@@ -342,11 +362,13 @@ static void mdp_auto_release_work(struct work_struct *work)
 	struct mdp_cmdq_cmd *cmd;
 	struct mdp_dev *mdp;
 	struct mtk_mutex *mutex;
+	enum mdp_pipe_id pipe_id;
 
 	cmd = container_of(work, struct mdp_cmdq_cmd, auto_release_work);
 	mdp = cmd->mdp;
 
-	mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0]);
+	pipe_id = __get_pipe(mdp, cmd->comps[0].public_id);
+	mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[pipe_id]);
 	mtk_mutex_unprepare(mutex);
 	mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 			    cmd->num_comps);
@@ -367,6 +389,7 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 	struct cmdq_cb_data *data;
 	struct mdp_dev *mdp;
 	struct device *dev;
+	enum mdp_pipe_id pipe_id;
 
 	if (!mssg) {
 		pr_info("%s:no callback data\n", __func__);
@@ -394,7 +417,8 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 		struct mtk_mutex *mutex;
 
 		dev_err(dev, "%s:queue_work fail!\n", __func__);
-		mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0]);
+		pipe_id = __get_pipe(mdp, cmd->comps[0].public_id);
+		mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[pipe_id]);
 		mtk_mutex_unprepare(mutex);
 		mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 				    cmd->num_comps);
@@ -417,6 +441,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	struct mdp_comp *comps = NULL;
 	struct device *dev = &mdp->pdev->dev;
 	struct mtk_mutex *mutex = NULL;
+	enum mdp_pipe_id pipe_id;
 	const int id = mdp->mdp_data->mdp_plat_id;
 	int i, ret;
 	u32 num_comp = 0;
@@ -453,13 +478,6 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		goto err_free_comps;
 	}
 
-	mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0]);
-	ret = mtk_mutex_prepare(mutex);
-	if (ret) {
-		dev_err(dev, "Fail to enable mutex clk\n");
-		goto err_free_path;
-	}
-
 	path->mdp_dev = mdp;
 	path->config = param->config;
 	path->param = param->param;
@@ -479,6 +497,14 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		goto err_free_path;
 	}
 
+	pipe_id = __get_pipe(mdp, path->comps[0].comp->public_id);
+	mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[pipe_id]);
+	ret = mtk_mutex_prepare(mutex);
+	if (ret) {
+		dev_err(dev, "Fail to enable mutex clk\n");
+		goto err_free_path;
+	}
+
 	ret = mdp_path_config(mdp, cmd, path);
 	if (ret) {
 		dev_err(dev, "mdp_path_config error\n");
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 3ffad6be95ad..49b6e9c8e089 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -49,6 +49,13 @@ enum mdp_pipe_id {
 	MDP_PIPE_IMGI,
 	MDP_PIPE_WPEI,
 	MDP_PIPE_WPEI2,
+	MDP_PIPE_RDMA1,
+	MDP_PIPE_RDMA2,
+	MDP_PIPE_RDMA3,
+	MDP_PIPE_SPLIT,
+	MDP_PIPE_SPLIT2,
+	MDP_PIPE_VPP0_SOUT,
+	MDP_PIPE_VPP1_SOUT,
 	MDP_PIPE_MAX
 };
 
-- 
2.18.0


