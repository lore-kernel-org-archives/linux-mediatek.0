Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B556C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 06:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Kcok3AxIkQTPkSf39ImjGrjwAjUO2Gbs8XtYJnYGrI=; b=mXS8oWkMSE7xvN
	SuP7oRD7jwJ6tkBa7/zh0OxGWaeOfJOkj/6N1rGMgeWfQ9H/Uo4qi+IqhPFHK95wWixcsefVLs+/X
	YceqIKZ0Wl77a1YCq63UAJkz41YSz/fxp/vc1oB78KVRw9n1cKrcbk5WqhDWrjbdQQfEUqic2B2Dk
	ZEAqJLF5/EAmArQokGDkKpQhr2cQEuHZO+8MWeWXp0gxweihpfUFtJDsEHskjE+8c/8WuyYA5G9Zp
	iX0RhniTmrXT+g0HEhTZDXHrARvs/zv5HeBQBuQYqgFDKroENPyCZtBnUf/7Qp8oLpNevOL2ExNnL
	e/qq+Lb5DZYXw/LqW7og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9L8h-00DZUX-ST; Mon, 17 Jan 2022 06:05:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9L6r-00DYVR-EI; Mon, 17 Jan 2022 06:03:20 +0000
X-UUID: e131976a562b49ab9974f77b945a2bfa-20220116
X-UUID: e131976a562b49ab9974f77b945a2bfa-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2103342737; Sun, 16 Jan 2022 23:03:11 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:53:10 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 13:53:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 17 Jan 2022 13:53:09 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Fabien Parent
 <fparent@baylibre.com>, "Roy-CW . Yeh" <roy-cw.yeh@mediatek.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 10/14] media: platform: mtk-mdp3: Add dual pipe feature
 support
Date: Mon, 17 Jan 2022 13:52:50 +0800
Message-ID: <20220117055254.9777-11-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_220317_566079_F3C78C28 
X-CRM114-Status: GOOD (  23.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Add dual pipe feature which uses two svpp to execute dma

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 drivers/media/platform/mtk-mdp3/mt8195_mdp.h  |   1 +
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   | 245 +++++++++++-------
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   4 +
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  21 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |  11 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |   5 +
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  18 ++
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |   4 +
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |   2 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   1 +
 10 files changed, 214 insertions(+), 98 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mt8195_mdp.h b/drivers/media/platform/mtk-mdp3/mt8195_mdp.h
index f69bc86bcd1e..dc9454cfd33a 100644
--- a/drivers/media/platform/mtk-mdp3/mt8195_mdp.h
+++ b/drivers/media/platform/mtk-mdp3/mt8195_mdp.h
@@ -24,6 +24,7 @@ static const struct mdp_platform_config mt8195_plat_cfg = {
 	.mdp_version_6885               = true,
 	.gce_event_offset               = 0,
 	.support_multi_larb		= true,
+	.support_dual_pipe              = true,
 };
 
 enum mt8195_mdp_comp_id {
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
index ce9326cc790f..86b7d83be22c 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
@@ -29,6 +29,9 @@ struct mdp_path {
 	((ctx)->comp->ops && (ctx)->comp->ops->op)
 #define call_op(ctx, op, ...) \
 	(has_op(ctx, op) ? (ctx)->comp->ops->op(ctx, ##__VA_ARGS__) : 0)
+#define get_pipe_num(scenario) \
+	((scenario) == MDP_STREAM_TYPE_DUAL_BITBLT ? 2 : 1)
+
 struct mdp_path_subfrm {
 	s32	mutex_id;
 	u32	mutex_mod;
@@ -707,25 +710,31 @@ static void mdp_auto_release_work(struct work_struct *work)
 	struct mdp_cmdq_cb_param *cb_param;
 	struct mdp_dev *mdp;
 	int i;
+	bool finalize;
 
 	cb_param = container_of(work, struct mdp_cmdq_cb_param,
 				auto_release_work);
 	mdp = cb_param->mdp;
+	finalize = cb_param->finalize;
 
-	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
-	mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
+	if (finalize) {
+		i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
+		mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
 
-	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA1);
-	if (i >= 0)
-		mtk_mutex_unprepare(mdp->mdp_mutex2[mdp->mdp_data->pipe_info[i].mutex_id]);
+		i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA1);
+		if (i >= 0)
+			mtk_mutex_unprepare(mdp->mdp_mutex2[mdp->mdp_data->pipe_info[i].mutex_id]);
+	}
 	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
 			    cb_param->num_comps);
 
 	kfree(cb_param->comps);
 	kfree(cb_param);
 
-	atomic_dec(&mdp->job_count);
-	wake_up(&mdp->callback_wq);
+	if (finalize) {
+		atomic_dec(&mdp->job_count);
+		wake_up(&mdp->callback_wq);
+	}
 }
 
 static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
@@ -744,7 +753,13 @@ static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
 	mdp = cb_param->mdp;
 	dev = &mdp->pdev->dev;
 
-	if (cb_param->mdp_ctx)
+	if (cb_param->dualpipe)
+		cb_param->finalize =
+			(atomic_dec_and_test(&mdp->cmdq_count[cb_param->cmdq_user]));
+	else
+		cb_param->finalize = true;
+
+	if (cb_param->finalize && cb_param->mdp_ctx)
 		mdp_m2m_job_finish(cb_param->mdp_ctx);
 
 	if (cb_param->user_cmdq_cb) {
@@ -779,52 +794,62 @@ static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
 
 int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 {
-	struct mmsys_cmdq_cmd cmd;
-	struct mdp_path *path = NULL;
-	struct mdp_cmdq_cb_param *cb_param = NULL;
-	struct mdp_comp *comps = NULL;
+	struct mmsys_cmdq_cmd cmd[MDP_DUAL_PIPE];
+	struct mdp_path *paths[MDP_DUAL_PIPE] = {NULL};
+	struct mdp_cmdq_cb_param *cb_param[MDP_DUAL_PIPE] = {NULL};
+	struct mdp_comp *comps[MDP_DUAL_PIPE] = {NULL};
 	struct device *dev = &mdp->pdev->dev;
-	int i, ret;
+
+	enum mdp_stream_type scenario = param->param->type;
+	int i, j, ret;
 
 	if (atomic_read(&mdp->suspended))
 		return -ECANCELED;
 
 	atomic_inc(&mdp->job_count);
 
-	cmd.pkt = cmdq_pkt_create(mdp->cmdq_clt, SZ_16K);
-	if (IS_ERR(cmd.pkt)) {
-		atomic_dec(&mdp->job_count);
-		wake_up(&mdp->callback_wq);
-		return PTR_ERR(cmd.pkt);
+	/* Prepare cmdq pkt */
+	for (i = 0; i < get_pipe_num(scenario); i++) {
+		cmd[i].pkt = cmdq_pkt_create(mdp->cmdq_clt[i], SZ_16K);
+		if (IS_ERR(cmd[i].pkt)) {
+			ret = PTR_ERR(cmd[i].pkt);
+			dev_err(dev, "%s path %d cmdq_pkt_create error\n", __func__, i);
+			goto err_destroy_pkt;
+		}
+		cmd[i].event = &mdp->event[0];
 	}
-	cmd.event = &mdp->event[0];
 
-	path = kzalloc(sizeof(*path), GFP_KERNEL);
-	if (!path) {
-		ret = -ENOMEM;
-		goto err_destroy_pkt;
-	}
+	/* Prepare path info */
+	for (i = 0; i < get_pipe_num(scenario); i++) {
+		paths[i] = kzalloc(sizeof(*paths[i]), GFP_KERNEL);
+		if (!paths[i]) {
+			ret = -ENOMEM;
+			dev_err(dev, "%s alloc paths error\n", __func__);
+			goto err_destroy_paths;
+		}
 
-	path->mdp_dev = mdp;
-	path->config = param->config;
-	path->param = param->param;
-	for (i = 0; i < param->param->num_outputs; i++) {
-		path->bounds[i].left = 0;
-		path->bounds[i].top = 0;
-		path->bounds[i].width =
-			param->param->outputs[i].buffer.format.width;
-		path->bounds[i].height =
-			param->param->outputs[i].buffer.format.height;
-		path->composes[i] = param->composes[i] ?
-			param->composes[i] : &path->bounds[i];
-	}
+		paths[i]->mdp_dev = mdp;
+		paths[i]->config = &param->config[i];
+		paths[i]->param = param->param;
+		for (j = 0; j < param->param->num_outputs; j++) {
+			paths[i]->bounds[j].left = 0;
+			paths[i]->bounds[j].top = 0;
+			paths[i]->bounds[j].width =
+				param->param->outputs[j].buffer.format.width;
+			paths[i]->bounds[j].height =
+				param->param->outputs[j].buffer.format.height;
+			paths[i]->composes[j] = param->composes[j] ?
+				param->composes[j] : &paths[i]->bounds[j];
+		}
 
-	ret = mdp_path_ctx_init(mdp, path);
-	if (ret) {
-		dev_err(dev, "mdp_path_ctx_init error\n");
-		goto err_destroy_pkt;
+		ret = mdp_path_ctx_init(mdp, paths[i]);
+		if (ret) {
+			dev_err(dev, "%s mdp_path_ctx_init error at path %d\n", __func__, i);
+			goto err_destroy_paths;
+		}
 	}
 
+	/* Setup clock and cmdq buffer */
 	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
 	mtk_mutex_prepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
 
@@ -832,64 +857,94 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	if (i >= 0)
 		mtk_mutex_prepare(mdp->mdp_mutex2[mdp->mdp_data->pipe_info[i].mutex_id]);
 
-	for (i = 0; i < param->config->num_components; i++) {
-		if (is_dummy_engine(mdp, path->config->components[i].type))
-			continue;
+	for (i = 0; i < get_pipe_num(scenario); i++) {
+		for (j = 0; j < param->config[i].num_components; j++) {
+			if (is_dummy_engine(mdp, paths[i]->config->components[j].type))
+				continue;
 
-		mdp_comp_clock_on(&mdp->pdev->dev, path->comps[i].comp);
+			mdp_comp_clock_on(&mdp->pdev->dev, paths[i]->comps[j].comp);
+		}
 	}
 
 	if (mdp->mdp_data->mdp_cfg->mdp_version_8195) {
-		ret = mdp_hyfbc_config(mdp, &cmd, path, param);
-		if (ret)
-			goto err_destroy_pkt;
+		ret = mdp_hyfbc_config(mdp, &cmd[0], paths[0], param);
+		if (ret) {
+			dev_err(dev, "%s mdp_hyfbc_config error\n", __func__);
+			goto err_clock_off;
+		}
 	}
 
-	ret = mdp_path_config(mdp, &cmd, path);
-	if (ret) {
-		dev_err(dev, "mdp_path_config error\n");
-		goto err_destroy_pkt;
+	for (i = 0; i < get_pipe_num(scenario); i++) {
+		ret = mdp_path_config(mdp, &cmd[i], paths[i]);
+		if (ret) {
+			dev_err(dev, "path %d mdp_path_config error\n", i);
+			goto err_clock_off;
+		}
 	}
 
-	cb_param = kzalloc(sizeof(*cb_param), GFP_KERNEL);
-	if (!cb_param) {
-		ret = -ENOMEM;
-		goto err_destroy_pkt;
-	}
+	/* Prepare cmdq callback info */
+	for (i = 0; i < get_pipe_num(scenario); i++) {
+		cb_param[i] = kzalloc(sizeof(*cb_param[i]), GFP_KERNEL);
+		if (!cb_param[i]) {
+			ret = -ENOMEM;
+			dev_err(dev, "%s path %d alloc cb_param error\n", __func__, i);
+			goto err_destroy_cb_param;
+		}
 
-	comps = kcalloc(param->config->num_components, sizeof(*comps),
-			GFP_KERNEL);
-	if (!comps) {
-		ret = -ENOMEM;
-		goto err_destroy_pkt;
-	}
+		comps[i] = kcalloc(param->config[i].num_components,
+				   sizeof(struct mdp_comp), GFP_KERNEL);
+		if (!comps[i]) {
+			ret = -ENOMEM;
+			dev_err(dev, "%s path %d alloc comps error\n", __func__, i);
+			goto err_destroy_cb_param;
+		}
 
-	for (i = 0; i < param->config->num_components; i++) {
-		if (is_dummy_engine(mdp, path->config->components[i].type))
-			continue;
+		for (j = 0; j < param->config[i].num_components; j++) {
+			if (is_dummy_engine(mdp, paths[i]->config->components[j].type))
+				continue;
 
-		memcpy(&comps[i], path->comps[i].comp,
-		       sizeof(struct mdp_comp));
-	}
-	cb_param->mdp = mdp;
-	cb_param->user_cmdq_cb = param->cmdq_cb;
-	cb_param->user_cb_data = param->cb_data;
-	cb_param->pkt = cmd.pkt;
-	cb_param->comps = comps;
-	cb_param->num_comps = param->config->num_components;
-	cb_param->mdp_ctx = param->mdp_ctx;
-
-	cmdq_pkt_finalize(cmd.pkt);
-	ret = cmdq_pkt_flush_async(cmd.pkt,
-				   mdp_handle_cmdq_callback,
-				   (void *)cb_param);
-	if (ret) {
-		dev_err(dev, "cmdq_pkt_flush_async fail!\n");
-		goto err_clock_off;
+			memcpy(&comps[i][j], paths[i]->comps[j].comp,
+			       sizeof(struct mdp_comp));
+		}
+		cb_param[i]->mdp = mdp;
+		cb_param[i]->user_cmdq_cb = param->cmdq_cb;
+		cb_param[i]->user_cb_data = param->cb_data;
+		cb_param[i]->pkt = cmd[i].pkt;
+		cb_param[i]->comps = comps[i];
+		cb_param[i]->num_comps = param->config[i].num_components;
+		cb_param[i]->mdp_ctx = param->mdp_ctx;
+		cb_param[i]->cmdq_user = param->cmdq_user;
+		cb_param[i]->dualpipe = (get_pipe_num(scenario) > 1 ? true : false);
+	}
+
+	/* Flush cmdq */
+	if (atomic_read(&mdp->cmdq_count[param->cmdq_user]))
+		dev_dbg(dev, "%s: Warning: cmdq_count:%d !\n", __func__,
+			atomic_read(&mdp->cmdq_count[param->cmdq_user]));
+
+	atomic_set(&mdp->cmdq_count[param->cmdq_user], get_pipe_num(scenario));
+	for (i = 0; i < get_pipe_num(scenario); i++) {
+		cmdq_pkt_finalize(cmd[i].pkt);
+
+		ret = cmdq_pkt_flush_async(cmd[i].pkt,
+					   mdp_handle_cmdq_callback,
+					   (void *)cb_param[i]);
+		if (ret) {
+			dev_err(dev, "pkt %d cmdq_pkt_flush_async fail!\n", i);
+			goto err_destroy_cmdq_request;
+		}
+		kfree(paths[i]);
 	}
-	kfree(path);
+
 	return 0;
 
+err_destroy_cmdq_request:
+	atomic_set(&mdp->cmdq_count[param->cmdq_user], 0);
+err_destroy_cb_param:
+	for (i = 0; i < get_pipe_num(scenario); i++) {
+		kfree(comps[i]);
+		kfree(cb_param[i]);
+	}
 err_clock_off:
 	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
 	mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
@@ -898,15 +953,22 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	if (i >= 0)
 		mtk_mutex_unprepare(mdp->mdp_mutex2[mdp->mdp_data->pipe_info[i].mutex_id]);
 
-	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
-			    cb_param->num_comps);
+	for (i = 0; i < get_pipe_num(scenario); i++) {
+		for (j = 0; j < param->config[i].num_components; j++) {
+			if (is_dummy_engine(mdp, paths[i]->config->components[j].type) == false)
+				mdp_comp_clock_off(&mdp->pdev->dev, paths[i]->comps[j].comp);
+		}
+	}
+err_destroy_paths:
+	for (i = 0; i < get_pipe_num(scenario); i++)
+		kfree(paths[i]);
 err_destroy_pkt:
-	cmdq_pkt_destroy(cmd.pkt);
+	for (i = 0; i < get_pipe_num(scenario); i++)
+		if (!IS_ERR(cmd[i].pkt))
+			cmdq_pkt_destroy(cmd[i].pkt);
+
 	atomic_dec(&mdp->job_count);
 	wake_up(&mdp->callback_wq);
-	kfree(comps);
-	kfree(cb_param);
-	kfree(path);
 
 	return ret;
 }
@@ -923,6 +985,7 @@ int mdp_cmdq_sendtask(struct platform_device *pdev, struct img_config *config,
 		.composes[0] = compose,
 		.cmdq_cb = cmdq_cb,
 		.cb_data = cb_data,
+		.cmdq_user = MDP_CMDQ_DL,
 	};
 
 	return mdp_cmdq_send(mdp, &task);
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
index 16933507333b..7e6ad3760677 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
@@ -26,6 +26,7 @@ struct mdp_cmdq_param {
 	void (*cmdq_cb)(struct cmdq_cb_data data);
 	void *cb_data;
 	void *mdp_ctx;
+	u32 cmdq_user;
 };
 
 struct mdp_cmdq_cb_param {
@@ -37,6 +38,9 @@ struct mdp_cmdq_cb_param {
 	struct mdp_comp *comps;
 	u8 num_comps;
 	void *mdp_ctx;
+	u32 cmdq_user;
+	bool finalize;
+	bool dualpipe;
 };
 
 struct mdp_dev;
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
index d8161be8c556..495a6aa3a759 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
@@ -292,12 +292,20 @@ static int mdp_probe(struct platform_device *pdev)
 	mutex_init(&mdp->vpu_lock);
 	mutex_init(&mdp->m2m_lock);
 
-	mdp->cmdq_clt = cmdq_mbox_create(dev, 0);
-	if (IS_ERR(mdp->cmdq_clt)) {
-		ret = PTR_ERR(mdp->cmdq_clt);
+	mdp->cmdq_clt[0] = cmdq_mbox_create(dev, 0);
+	if (IS_ERR(mdp->cmdq_clt[0])) {
+		ret = PTR_ERR(mdp->cmdq_clt[0]);
 		goto err_put_scp;
 	}
 
+	if (mdp->mdp_data->mdp_cfg->support_dual_pipe) {
+		mdp->cmdq_clt[1] = cmdq_mbox_create(dev, 1);
+		if (IS_ERR(mdp->cmdq_clt[1])) {
+			ret = PTR_ERR(mdp->cmdq_clt[1]);
+			goto err_mbox_destroy;
+		}
+	}
+
 	init_waitqueue_head(&mdp->callback_wq);
 	ida_init(&mdp->mdp_ida);
 	platform_set_drvdata(pdev, mdp);
@@ -308,7 +316,7 @@ static int mdp_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "Failed to register v4l2 device\n");
 		ret = -EINVAL;
-		goto err_mbox_destroy;
+		goto err_dual_mbox_destroy;
 	}
 
 	ret = mdp_m2m_device_register(mdp);
@@ -323,8 +331,11 @@ static int mdp_probe(struct platform_device *pdev)
 
 err_unregister_device:
 	v4l2_device_unregister(&mdp->v4l2_dev);
+err_dual_mbox_destroy:
+	if (mdp->mdp_data->mdp_cfg->support_dual_pipe)
+		cmdq_mbox_destroy(mdp->cmdq_clt[1]);
 err_mbox_destroy:
-	cmdq_mbox_destroy(mdp->cmdq_clt);
+	cmdq_mbox_destroy(mdp->cmdq_clt[0]);
 err_put_scp:
 	scp_put(mdp->scp);
 err_destroy_clock_wq:
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
index 8ee70763a18f..0fb932ad3560 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
@@ -15,6 +15,7 @@
 #include "mtk-mdp3-vpu.h"
 
 #define MDP_MODULE_NAME	"mtk-mdp3"
+#define MDP_DUAL_PIPE       2
 
 enum mdp_buffer_usage {
 	MDP_BUFFER_USAGE_HW_READ,
@@ -24,6 +25,12 @@ enum mdp_buffer_usage {
 	MDP_BUFFER_USAGE_WPE,
 };
 
+enum mdp_cmdq_usage {
+	MDP_CMDQ_V4L2,
+	MDP_CMDQ_DL,
+	MDP_CMDQ_NUM
+};
+
 struct mdp_platform_config {
 	bool	rdma_support_10bit;
 	bool	rdma_rsz1_sram_sharing;
@@ -43,6 +50,7 @@ struct mdp_platform_config {
 	u8	tdshp_dyn_contrast_version;
 	u32	gce_event_offset;
 	bool	support_multi_larb;
+	bool	support_dual_pipe;
 };
 
 struct mtk_mdp_driver_data {
@@ -77,7 +85,7 @@ struct mdp_dev {
 	s32					vpu_count;
 	u32					id_count;
 	struct ida				mdp_ida;
-	struct cmdq_client			*cmdq_clt;
+	struct cmdq_client			*cmdq_clt[MDP_DUAL_PIPE];
 	wait_queue_head_t			callback_wq;
 
 	struct v4l2_device			v4l2_dev;
@@ -87,6 +95,7 @@ struct mdp_dev {
 	struct mutex				m2m_lock;
 	atomic_t				suspended;
 	atomic_t				job_count;
+	atomic_t				cmdq_count[MDP_CMDQ_NUM];
 };
 
 struct mdp_pipe_info {
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
index 1e749bb2b338..72a1864d880c 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
@@ -95,6 +95,10 @@ static void mdp_m2m_worker(struct work_struct *work)
 	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	src_vb = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
 	mdp_set_src_config(&param.inputs[0], frame, &src_vb->vb2_buf);
+	mdp_set_scenario(ctx->mdp_dev, &param, frame);
+	if (param.frame_change)
+		dev_info(&ctx->mdp_dev->pdev->dev,
+			 "MDP Scenario: %d\n", param.type);
 
 	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	dst_vb = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
@@ -115,6 +119,7 @@ static void mdp_m2m_worker(struct work_struct *work)
 	task.cmdq_cb = NULL;
 	task.cb_data = NULL;
 	task.mdp_ctx = ctx;
+	task.cmdq_user = MDP_CMDQ_V4L2;
 
 	ret = mdp_cmdq_send(ctx->mdp_dev, &task);
 	if (ret) {
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
index 8c2b74c67273..c0a7e3569853 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
@@ -11,6 +11,8 @@
 #include "mtk-mdp3-regs.h"
 #include "mtk-mdp3-m2m.h"
 
+#define FHD (1920 * 1080)
+
 static const struct mdp_format *mdp_formats;
 static u32 format_len;
 
@@ -427,6 +429,22 @@ static u32 mdp_fmt_get_plane_size(const struct mdp_format *fmt,
 	return 0;
 }
 
+void mdp_set_scenario(struct mdp_dev *mdp,
+		      struct img_ipi_frameparam *param,
+		      struct mdp_frame *frame)
+{
+	u32 width = frame->format.fmt.pix_mp.width;
+	u32 height = frame->format.fmt.pix_mp.height;
+
+	if (!mdp)
+		return;
+
+	if (mdp->mdp_data->mdp_cfg->support_dual_pipe) {
+		if ((width * height) >= FHD)
+			param->type = MDP_STREAM_TYPE_DUAL_BITBLT;
+	}
+}
+
 static void mdp_prepare_buffer(struct img_image_buffer *b,
 			       struct mdp_frame *frame, struct vb2_buffer *vb)
 {
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
index 1ef32b747233..3547ce10948f 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
@@ -10,6 +10,7 @@
 #include <linux/videodev2.h>
 #include <media/videobuf2-core.h>
 #include "mtk-img-ipi.h"
+#include "mtk-mdp3-cmdq.h"
 
 /*
  * MDP native color code
@@ -407,6 +408,9 @@ int mdp_try_crop(struct mdp_m2m_ctx *ctx, struct v4l2_rect *r,
 int mdp_check_scaling_ratio(const struct v4l2_rect *crop,
 			    const struct v4l2_rect *compose, s32 rotation,
 	const struct mdp_limit *limit);
+void mdp_set_scenario(struct mdp_dev *mdp,
+		      struct img_ipi_frameparam *param,
+		      struct mdp_frame *frame);
 void mdp_set_src_config(struct img_input *in,
 			struct mdp_frame *frame, struct vb2_buffer *vb);
 void mdp_set_dst_config(struct img_output *out,
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
index fc008d96c7c0..035fa3e55335 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
@@ -10,7 +10,7 @@
 #include "mtk-mdp3-core.h"
 
 #define MDP_VPU_MESSAGE_TIMEOUT 500U
-#define vpu_alloc_size		0x600000
+#define vpu_alloc_size         0x7F8000
 
 static inline struct mdp_dev *vpu_to_mdp(struct mdp_vpu_dev *vpu)
 {
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
index e831070b44d0..3140d2925a1a 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
@@ -39,6 +39,7 @@ struct mdp_ipi_deinit_msg {
 
 enum mdp_config_id {
 	MDP_DEV_M2M = 0,
+	MDP_DEV_M2M_2ND = 1,
 	MDP_CONFIG_POOL_SIZE	/* ALWAYS keep at the end */
 };
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
