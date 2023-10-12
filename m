Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2929CDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTZDEYT/olqT3JPFX3OgmsV9xlmvvcpIeFNrfUj/e4g=; b=zr5LA3m6vOBiseFUQ4y4L3KtvB
	ac32jrhq6nLbMVmTIcE2yE3cOOTnStcA1LO1ZSrdrJQ1T3rOJcA6LtvyALsI2PXFHF6t6NRwgBFIq
	h+CVurpMA4sY5iL6XhJJvsnY8Nvwg83MozuFzsgyjKfRu4fcCexRGxUD2gqLQBULxLxfjkD3XfIlQ
	OjPpPVq8YvZVwNL0iaP6ByVrA7dHpFKr9DH7rpSD2+x2BNf9H6QiYuY0/sBV5iv1v423uQkX6yRZd
	ScPWtv0JOfWlsc5hq8Sf4yv2MVprGF2mbNA4NRKsGmi1GKGJ3QH7/85/b/Dyqe9oj9GlminUaLKW+
	k/iBfAdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrke-000KwR-27;
	Thu, 12 Oct 2023 09:13:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrkP-000Kob-33;
	Thu, 12 Oct 2023 09:12:54 +0000
X-UUID: 809834c068df11ee9b7791016c24628a-20231012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hTZDEYT/olqT3JPFX3OgmsV9xlmvvcpIeFNrfUj/e4g=;
	b=XTZOnnhw2K5zCgFWQLLMLFfTufFWWpgfqWux3R7YFLSAJOU4LQXay+Z2UU+5Z5++rnRs5NmiZ++GSHqxCED01Gd/sCQN1KwV+xCsx9JSS50Fl08noULaeS38nQq8Poujbta+AswXIkD/6zrJCyDMwM7u6QBprw7RRWB1NDyQcx4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:1bd1875a-06c7-4ee6-8e2e-2767915b61c2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:ea86f314-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 809834c068df11ee9b7791016c24628a-20231012
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1096258879; Thu, 12 Oct 2023 02:12:43 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Oct 2023 17:12:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Oct 2023 17:12:07 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ping-Hsun Wu
	<ping-hsun.wu@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>,
	"Hans Verkuil" <hverkuil-cisco@xs4all.nl>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v7 03/12] media: platform: mtk-mdp3: introduce more pipelines from MT8195
Date: Thu, 12 Oct 2023 17:11:57 +0800
Message-ID: <20231012091206.20165-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231012091206.20165-1-moudy.ho@mediatek.com>
References: <20231012091206.20165-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.967800-8.000000
X-TMASE-MatchedRID: 9tznvLHRcTzPl7LciQedTgPZZctd3P4BK2i9pofGVSsKogmGusPLb8FQ
	0J8JC8zgOfAiJ/eonC1mJS6k736MTIT3OBUyTeledXz3l78F3YlYN1akkye0qPt592eq2xoTVSd
	AA6mVeIZQRjVnEuqiiK8okvFnr1sb/02XRYC/8eue7UdJp0QINZYcYQ11P5U/nugLWtXP+42jxY
	yRBa/qJcFwgTvxipFajoczmuoPCq1VWUUpiy58T3zenOIFbqsQoYJPSrvKBCgZGAqx++0As6+/n
	mgZrMvCQwymtxuJ6y0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.967800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0435DB05A4D59D0D464556F9F1010023AD4DC239E93406743723087802F5DA822000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_021250_001944_058A376C 
X-CRM114-Status: GOOD (  15.52  )
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

Increasing the number of sets built by MMSYS and MUTEX in MT8195
will enable the creation of more pipelines in MDP3.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 80 ++++++++++++-------
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  7 ++
 2 files changed, 60 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 67c8fcc3eda9..31930ddbc828 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -50,6 +50,43 @@ static struct mtk_mutex *__get_mutex(const struct mdp_dev *mdp_dev,
 	return mdp_dev->mm_subsys[p->sub_id].mdp_mutex[p->mutex_id];
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
@@ -57,7 +94,6 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
 	const int p_id = path->mdp_dev->mdp_data->mdp_plat_id;
 	const struct mdp_comp_ctx *ctx;
 	const struct mtk_mdp_driver_data *data = path->mdp_dev->mdp_data;
-	struct device *dev = &path->mdp_dev->pdev->dev;
 	struct mtk_mutex *mutex;
 	int id, index;
 	u32 num_comp = 0;
@@ -66,23 +102,7 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
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
 
@@ -336,11 +356,13 @@ static void mdp_auto_release_work(struct work_struct *work)
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
@@ -361,6 +383,7 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 	struct cmdq_cb_data *data;
 	struct mdp_dev *mdp;
 	struct device *dev;
+	enum mdp_pipe_id pipe_id;
 
 	if (!mssg) {
 		pr_info("%s:no callback data\n", __func__);
@@ -388,7 +411,8 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 		struct mtk_mutex *mutex;
 
 		dev_err(dev, "%s:queue_work fail!\n", __func__);
-		mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0]);
+		pipe_id = __get_pipe(mdp, cmd->comps[0].public_id);
+		mutex = __get_mutex(mdp, &mdp->mdp_data->pipe_info[pipe_id]);
 		mtk_mutex_unprepare(mutex);
 		mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 				    cmd->num_comps);
@@ -412,6 +436,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	struct device *dev = &mdp->pdev->dev;
 	const int p_id = mdp->mdp_data->mdp_plat_id;
 	struct mtk_mutex *mutex = NULL;
+	enum mdp_pipe_id pipe_id;
 	int i, ret;
 	u32 num_comp = 0;
 
@@ -449,13 +474,6 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
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
@@ -475,6 +493,14 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
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
index fde2c0b95def..ece6509666fd 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -59,6 +59,13 @@ enum mdp_pipe_id {
 	MDP_PIPE_WPEI2,
 	MDP_PIPE_IMGI,
 	MDP_PIPE_RDMA0,
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


