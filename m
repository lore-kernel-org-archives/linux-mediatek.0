Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC18C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 06:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFnXvX2HrsXS0aE25Yz6DC5xTLw2PSfDgexSATmDGSQ=; b=JmFv6L2JyblVvrBsU3NRpu4UVD
	JpqWcOS+tLLslhCVTuRHFgh8KknFoHAxNUa+NRObFuokswa0wP8I654V0h6emXVuT5gwNLJmWsxPw
	6l25iUQckHDYBXhDCMAP5NDidPwScmVltuAwWi9eVf2KPVIv6kjk6qahOz/VvF+MjCtOj7nMzNEzl
	RNJWxNwhRC3SvvAlC4Xub+JVjD0vhSreyQNyXHqM06xR70wqUE5BD1TZVeEVV30VuVVa+PpXLH/Zj
	X7ZOuMMmiiuXzsAyhiEc9iJ2jiEjudFiUPDBI0I7HTBVQpx8S9RqtJ1G/LNXLIl9VwH8PSpj0/5UM
	Bg4F/DEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDle-000rIL-Se; Fri, 13 Jan 2023 06:42:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDld-000rGv-Gp
	for linux-mediatek@bombadil.infradead.org; Fri, 13 Jan 2023 06:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dFnXvX2HrsXS0aE25Yz6DC5xTLw2PSfDgexSATmDGSQ=; b=ktQW9QLJHFguXfYjAI3TGE9j6x
	9qwuF8v3EHMq9zi5mVlTAGwDTWLqfsrR6+tyWPa5IdCCmmrynNxN1ds/nygYfsUZ5EgprWF6yaIbU
	sK7RFnUC/SFD9S9QLRHrGNgLMNXEAVIViRcvTJxoQoD0JBFR+peMPHPdgYvTBb9WwvEFkz4/s2mFU
	Z/bgIzmPFweynjEyechR+ZYsvhgfzfi4oDPZQ3Hpcx/8FQ8diaS6JNJub6Cki7IPZ41M0sxqaScCn
	6qOcuwDCtHRHtH4tvuS4RwiAXu+MqOcIzvT2HYu88WpsGyZxfgThl/VyUxwLoDOGDT2wG11Fed6gQ
	i04azgfw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pGDlR-004G46-0l
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Jan 2023 06:42:11 +0000
X-UUID: 68b956ca930d11eda08d4d6090ec5a5c-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dFnXvX2HrsXS0aE25Yz6DC5xTLw2PSfDgexSATmDGSQ=;
	b=BotvBesVHko5+mSyWGsgp7zbeYj6Lo3p8bPRvh1XEV6Wt3zIgY3tdyWttClOKxHlVtYDaJM2ICBL8xe1oXTHXnbM6OIZb4TaTCCuE99x7SWasUHhcNVUn4I/OQ9/zBQyxYUKImjc+aX1SdP7JC+QGc/OrPA0yPnJBP9gpghPhNI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:48a03c72-8d4e-4966-8c43-5e64366de6cf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:3a238c54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 68b956ca930d11eda08d4d6090ec5a5c-20230112
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 568718273; Thu, 12 Jan 2023 23:42:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 14:41:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 14:41:06 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v5 07/12] media: platform: mtk-mdp3: chip config split about pipe info
Date: Fri, 13 Jan 2023 14:40:59 +0800
Message-ID: <20230113064104.22402-8-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113064104.22402-1-moudy.ho@mediatek.com>
References: <20230113064104.22402-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_064209_820507_ECF0FFC5 
X-CRM114-Status: GOOD (  19.28  )
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

In MDP3, a pipe is used to represent a data path which
consisting of different components and MUTEX, as shown in
the following diagram:

                     +----------------------------+
                     |           MUTEX [*1]       |
                     +----------------------------+
                        S ^ S ^  S ^  S ^  S ^
                        | | | |  | |  | |  | |
                        | | | |  | |  | |  | |
         +--------------+ | | |  | |  | |  | +-------------+
         | +--------------+ | |  | |  | |  +-------------+ |
         | |         +------+ |  | |  | +------+         | |
         | |         | +------+  | |  +------+ |         | |
         | |         | |         | |         | |         | |
         | |         | |         | |         | |         | |
         v E         v E         v E         v E         v E
      +-------+    +-----+    +-------+    +-----+    +-------+
B>--->| RDMA0 |>-->| PQ  |>-->| RSZ0  |>-->| PQ  |>-->| WROT0 |>-->B
      +-------+    +-----+    +-------+    +-----+    +-------+

[*1] MUTEX is SOF/EOF signal controller
[*2] S = Start of frame (SOF)
[*3] E = End of frame (EOF)
[*4] B = frame buffer

More pipes will be introduced in future chip for applications such as
higher frame rate frequency, which should move and reorder the
relevant information into the chip configuration header file.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../mediatek/mdp3/mt8183/mdp3-plat-mt8183.h   |  7 ++++++
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 23 ++++++++++++-------
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 15 ++++++++----
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    | 11 +++++++--
 4 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h b/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
index c541176780aa..b1d4cbeda932 100644
--- a/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
+++ b/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
@@ -21,6 +21,13 @@ static const struct of_device_id mt8183_mdp_probe_infra[MDP_INFRA_MAX] = {
 	[MDP_INFRA_SCP] = { .compatible = "mediatek,mt8183-scp" }
 };
 
+static const struct mdp_pipe_info mt8183_pipe_info[] = {
+	[MDP_PIPE_WPEI] = {MDP_PIPE_WPEI, 0},
+	[MDP_PIPE_WPEI2] = {MDP_PIPE_WPEI2, 1},
+	[MDP_PIPE_IMGI] = {MDP_PIPE_IMGI, 2},
+	[MDP_PIPE_RDMA0] = {MDP_PIPE_RDMA0, 3}
+};
+
 static const u32 mt8183_mutex_idx[MDP_MAX_COMP_COUNT] = {
 	[MDP_COMP_RDMA0] = MUTEX_MOD_IDX_MDP_RDMA0,
 	[MDP_COMP_RSZ0] = MUTEX_MOD_IDX_MDP_RSZ0,
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index dcd77f65b0e3..bff14e4944c5 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -50,21 +50,22 @@ static int mdp_path_subfrm_require(const struct mdp_path *path,
 	/* Decide which mutex to use based on the current pipeline */
 	switch (path->comps[0].comp->public_id) {
 	case MDP_COMP_RDMA0:
-		*mutex_id = MDP_PIPE_RDMA0;
+		index = MDP_PIPE_RDMA0;
 		break;
 	case MDP_COMP_ISP_IMGI:
-		*mutex_id = MDP_PIPE_IMGI;
+		index = MDP_PIPE_IMGI;
 		break;
 	case MDP_COMP_WPEI:
-		*mutex_id = MDP_PIPE_WPEI;
+		index = MDP_PIPE_WPEI;
 		break;
 	case MDP_COMP_WPEI2:
-		*mutex_id = MDP_PIPE_WPEI2;
+		index = MDP_PIPE_WPEI2;
 		break;
 	default:
 		dev_err(dev, "Unknown pipeline and no mutex is assigned");
 		return -EINVAL;
 	}
+	*mutex_id = data->pipe_info[index].mutex_id;
 
 	/* Set mutex mod */
 	for (index = 0; index < config->num_components; index++) {
@@ -286,11 +287,13 @@ static void mdp_auto_release_work(struct work_struct *work)
 {
 	struct mdp_cmdq_cmd *cmd;
 	struct mdp_dev *mdp;
+	int id;
 
 	cmd = container_of(work, struct mdp_cmdq_cmd, auto_release_work);
 	mdp = cmd->mdp;
 
-	mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
+	id = mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0].mutex_id;
+	mtk_mutex_unprepare(mdp->mdp_mutex[id]);
 	mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 			    cmd->num_comps);
 
@@ -310,6 +313,7 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 	struct cmdq_cb_data *data;
 	struct mdp_dev *mdp;
 	struct device *dev;
+	int id;
 
 	if (!mssg) {
 		pr_info("%s:no callback data\n", __func__);
@@ -335,7 +339,8 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 	INIT_WORK(&cmd->auto_release_work, mdp_auto_release_work);
 	if (!queue_work(mdp->clock_wq, &cmd->auto_release_work)) {
 		dev_err(dev, "%s:queue_work fail!\n", __func__);
-		mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
+		id = mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0].mutex_id;
+		mtk_mutex_unprepare(mdp->mdp_mutex[id]);
 		mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 				    cmd->num_comps);
 
@@ -387,7 +392,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		goto err_free_comps;
 	}
 
-	ret = mtk_mutex_prepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
+	i = mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0].mutex_id;
+	ret = mtk_mutex_prepare(mdp->mdp_mutex[i]);
 	if (ret) {
 		dev_err(dev, "Fail to enable mutex clk\n");
 		goto err_free_path;
@@ -453,7 +459,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 			    cmd->num_comps);
 err_free_path:
-	mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
+	i = mdp->mdp_data->pipe_info[MDP_PIPE_RDMA0].mutex_id;
+	mtk_mutex_unprepare(mdp->mdp_mutex[i]);
 	kfree(path);
 err_free_comps:
 	kfree(comps);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 4b02c135b631..79acdccd0b60 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -24,6 +24,8 @@ static const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.mdp_mutex_table_idx = mt8183_mutex_idx,
 	.comp_data = mt8183_mdp_comp_data,
 	.comp_data_len = ARRAY_SIZE(mt8183_mdp_comp_data),
+	.pipe_info = mt8183_pipe_info,
+	.pipe_info_len = ARRAY_SIZE(mt8183_pipe_info),
 	.format = mt8183_formats,
 	.format_len = ARRAY_SIZE(mt8183_formats),
 	.def_limit = &mt8183_mdp_def_limit,
@@ -165,7 +167,7 @@ static int mdp_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mdp_dev *mdp;
 	struct platform_device *mm_pdev;
-	int ret, i;
+	int ret, i, mutex_id;
 
 	mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
 	if (!mdp) {
@@ -188,9 +190,12 @@ static int mdp_probe(struct platform_device *pdev)
 		ret = -ENODEV;
 		goto err_destroy_device;
 	}
-	for (i = 0; i < MDP_PIPE_MAX; i++) {
-		mdp->mdp_mutex[i] = mtk_mutex_get(&mm_pdev->dev);
-		if (!mdp->mdp_mutex[i]) {
+	for (i = 0; i < mdp->mdp_data->pipe_info_len; i++) {
+		mutex_id = mdp->mdp_data->pipe_info[i].mutex_id;
+		if (mdp->mdp_mutex[mutex_id])
+			continue;
+		mdp->mdp_mutex[mutex_id] = mtk_mutex_get(&mm_pdev->dev);
+		if (!mdp->mdp_mutex[mutex_id]) {
 			ret = -ENODEV;
 			goto err_free_mutex;
 		}
@@ -271,7 +276,7 @@ static int mdp_probe(struct platform_device *pdev)
 err_deinit_comp:
 	mdp_comp_destroy(mdp);
 err_free_mutex:
-	for (i = 0; i < MDP_PIPE_MAX; i++)
+	for (i = 0; i < mdp->mdp_data->pipe_info_len; i++)
 		mtk_mutex_put(mdp->mdp_mutex[i]);
 err_destroy_device:
 	kfree(mdp);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 52f87e59ba9e..dd5e23800854 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -43,10 +43,10 @@ struct mdp_platform_config {
 
 /* indicate which mutex is used by each pipepline */
 enum mdp_pipe_id {
-	MDP_PIPE_RDMA0,
-	MDP_PIPE_IMGI,
 	MDP_PIPE_WPEI,
 	MDP_PIPE_WPEI2,
+	MDP_PIPE_IMGI,
+	MDP_PIPE_RDMA0,
 	MDP_PIPE_MAX
 };
 
@@ -57,6 +57,8 @@ struct mtk_mdp_driver_data {
 	const u32 *mdp_mutex_table_idx;
 	const struct mdp_comp_data *comp_data;
 	unsigned int comp_data_len;
+	const struct mdp_pipe_info *pipe_info;
+	unsigned int pipe_info_len;
 	const struct mdp_format *format;
 	unsigned int format_len;
 	const struct mdp_limit *def_limit;
@@ -91,6 +93,11 @@ struct mdp_dev {
 	atomic_t				job_count;
 };
 
+struct mdp_pipe_info {
+	enum mdp_pipe_id pipe_id;
+	u32 mutex_id;
+};
+
 int mdp_vpu_get_locked(struct mdp_dev *mdp);
 void mdp_vpu_put_locked(struct mdp_dev *mdp);
 int mdp_vpu_register(struct mdp_dev *mdp);
-- 
2.18.0


