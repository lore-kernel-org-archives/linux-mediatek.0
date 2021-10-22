Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C8FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 02:26:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 696D2613A7
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 02:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 696D2613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=353KQVD1D2h4CBiS+mheNKqE74OgN6tA5dBdDqs+xT0=; b=bALTCz+WpV3Zq3
	dCdE2X0ZKySPWRMYK7j4NU8ZOYwg0iSa2WZyjCvo5v4cngTVtNFID7ub/zfrtIVRAEVny/+i4m1gr
	/G6J4iZrUnNzmt6T/xz60qBGRk6hXTt/XqUNSzj55hvDUhGwuQiMVQIOPgkoNOh1KAgtZDn7HhRGo
	kqn6pLj3sCuzXXMJC0r2sQLfKH1i/MtLtr1zEE6XbEkpGJWZdOoXnMtbM2zTEL4Vxm/kV7pM87Lmj
	b8yEAGxgsq5xCZpqjF+dW9XSp3eriwP03AZzs9wEPRbIyQYwg1aPabYsR8wKt/yZJv0Di5DUqd4ox
	wyRUG2IRUO01SR/qsdwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdkGM-009XUi-Jh; Fri, 22 Oct 2021 02:26:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdkCC-009Vv6-P4; Fri, 22 Oct 2021 02:22:23 +0000
X-UUID: c46e1d1e79fe42c88e05cebed7c80c07-20211021
X-UUID: c46e1d1e79fe42c88e05cebed7c80c07-20211021
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 946242940; Thu, 21 Oct 2021 19:22:10 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Oct 2021 19:22:08 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Oct 2021 10:21:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Oct 2021 10:21:54 +0800
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
Subject: [PATCH v3 9/9] media: platform: mtk-mdp3: Add dual pipe feature
 support
Date: Fri, 22 Oct 2021 10:21:46 +0800
Message-ID: <20211022022146.3577-10-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211022022146.3577-1-roy-cw.yeh@mediatek.com>
References: <20211022022146.3577-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_192212_890191_C60379F8 
X-CRM114-Status: GOOD (  23.67  )
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
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   | 189 ++++++++++++++----
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   1 +
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  11 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   3 +
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |   4 +
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  15 ++
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |   4 +
 7 files changed, 185 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
index e46c63d7acb4..b53182719ba1 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
@@ -13,6 +13,9 @@
 #define MDP_PATH_MAX_COMPS	IMG_MAX_COMPONENTS
 #define BYTE_PER_MB_Y		4
 #define BYTE_PER_MB_C		2
+#define PATH_0                  0
+#define PATH_1                  1
+#define MDP_DUAL_PIPE           2
 
 #define has_op(ctx, op) \
 	((ctx)->comp->ops && (ctx)->comp->ops->op)
@@ -25,6 +28,9 @@
 #define is_rdma(id) \
 	(mdp->mdp_data->comp_data[id].match.type == MDP_COMP_TYPE_RDMA)
 
+#define is_dual_pipe(scenario) \
+	((scenario) == MDP_STREAM_TYPE_DUAL_BITBLT)
+
 #define CEIL(a, b) (((a) % (b) == 0) ? ((a) / (b)) : ((a) / (b) + 1))
 #define ALIGN_UP(val, a)						\
 ({												\
@@ -733,26 +739,31 @@ static void mdp_auto_release_work(struct work_struct *work)
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
-
-	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA1);
-	if (i >= 0)
-		mtk_mutex_unprepare(mdp->mdp_mutex2[mdp->mdp_data->pipe_info[i].mutex_id]);
+	if (finalize) {
+		i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
+		mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
 
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
@@ -770,7 +781,9 @@ static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
 	mdp = cb_param->mdp;
 	dev = &mdp->pdev->dev;
 
-	if (cb_param->mdp_ctx)
+	cb_param->finalize = (atomic_dec_and_test(&mdp->cmdq_count));
+
+	if (cb_param->finalize && cb_param->mdp_ctx)
 		mdp_m2m_job_finish(cb_param->mdp_ctx);
 
 	if (cb_param->user_cmdq_cb) {
@@ -805,12 +818,15 @@ static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
 
 int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 {
-	struct mmsys_cmdq_cmd cmd;
-	struct mdp_path path;
+	struct mmsys_cmdq_cmd cmd, cmd_d;
+	static struct mdp_path path[MDP_DUAL_PIPE];
 	struct mdp_cmdq_cb_param *cb_param = NULL;
+	struct mdp_cmdq_cb_param *cb_param_d = NULL;
 	struct mdp_comp *comps = NULL;
+	struct mdp_comp *comps_d = NULL;
 	struct device *dev = &mdp->pdev->dev;
-	int i, ret;
+	enum mdp_stream_type scenario = param->param->type;
+	int i, ret, path_id;
 
 	if (atomic_read(&mdp->suspended))
 		return -ECANCELED;
@@ -825,24 +841,39 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	}
 	cmd.event = &mdp->event[0];
 
-	path.mdp_dev = mdp;
-	path.config = param->config;
-	path.param = param->param;
-	for (i = 0; i < param->param->num_outputs; i++) {
-		path.bounds[i].left = 0;
-		path.bounds[i].top = 0;
-		path.bounds[i].width =
-			param->param->outputs[i].buffer.format.width;
-		path.bounds[i].height =
-			param->param->outputs[i].buffer.format.height;
-		path.composes[i] = param->composes[i] ?
-			param->composes[i] : &path.bounds[i];
-	}
-
-	ret = mdp_path_ctx_init(mdp, &path);
-	if (ret) {
-		dev_err(dev, "%s mdp_path_ctx_init error\n", __func__);
-		goto err_destroy_pkt;
+	if (is_dual_pipe(scenario)) {
+		cmd_d.pkt = cmdq_pkt_create(mdp->cmdq_d_clt, SZ_16K);
+		if (IS_ERR(cmd_d.pkt)) {
+			atomic_dec(&mdp->job_count);
+			wake_up(&mdp->callback_wq);
+			return PTR_ERR(cmd_d.pkt);
+		}
+		cmd_d.event = &mdp->event[0];
+	}
+
+	for (path_id = 0; path_id < MDP_DUAL_PIPE; path_id++) {
+		if (path_id != 0 && (!is_dual_pipe(scenario)))
+			break;
+
+		path[path_id].mdp_dev = mdp;
+		path[path_id].config = &param->config[path_id];
+		path[path_id].param = param->param;
+		for (i = 0; i < param->param->num_outputs; i++) {
+			path[path_id].bounds[i].left = 0;
+			path[path_id].bounds[i].top = 0;
+			path[path_id].bounds[i].width =
+				param->param->outputs[i].buffer.format.width;
+			path[path_id].bounds[i].height =
+				param->param->outputs[i].buffer.format.height;
+			path[path_id].composes[i] = param->composes[i] ?
+				param->composes[i] : &path[path_id].bounds[i];
+		}
+
+		ret = mdp_path_ctx_init(mdp, &path[path_id]);
+		if (ret) {
+			dev_err(dev, "%s mdp_path_ctx_init error at path %d\n", __func__, path_id);
+			goto err_destroy_pkt;
+		}
 	}
 
 	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
@@ -852,44 +883,61 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	if (i >= 0)
 		mtk_mutex_prepare(mdp->mdp_mutex2[mdp->mdp_data->pipe_info[i].mutex_id]);
 
-	for (i = 0; i < param->config->num_components; i++) {
-		if (is_dummy_engine(mdp, path.config->components[i].type))
+	for (i = 0; i < param->config[PATH_0].num_components; i++) {
+		if (is_dummy_engine(mdp, path[PATH_0].config->components[i].type))
 			continue;
 
-		mdp_comp_clock_on(&mdp->pdev->dev, path.comps[i].comp);
+		mdp_comp_clock_on(&mdp->pdev->dev, path[PATH_0].comps[i].comp);
+	}
+
+	if (is_dual_pipe(scenario)) {
+		for (i = 0; i < param->config[PATH_1].num_components; i++) {
+			if (is_dummy_engine(mdp, path[PATH_1].config->components[i].type))
+				continue;
+
+			mdp_comp_clock_on(&mdp->pdev->dev, path[PATH_1].comps[i].comp);
+		}
 	}
 
 	if (mdp->mdp_data->mdp_cfg->version == MTK_MDP_VERSION_8195) {
 		/* HYFBC Patch */
-		ret = mdp_hyfbc_config(mdp, &cmd, &path, param);
+		ret = mdp_hyfbc_config(mdp, &cmd, &path[PATH_0], param);
 		if (ret)
 			goto err_destroy_pkt;
 	}
 
-	ret = mdp_path_config(mdp, &cmd, &path);
+	ret = mdp_path_config(mdp, &cmd, &path[PATH_0]);
 	if (ret) {
-		dev_err(dev, "%s mdp_path_config error\n", __func__);
+		dev_err(dev, "%s path 0 mdp_path_config error\n", __func__);
 		goto err_destroy_pkt;
 	}
 
+	if (is_dual_pipe(scenario)) {
+		ret = mdp_path_config(mdp, &cmd_d, &path[PATH_1]);
+		if (ret) {
+			dev_err(dev, "%s path 1 mdp_path_config error\n", __func__);
+			goto err_destroy_pkt;
+		}
+	}
+
 	cb_param = kzalloc(sizeof(*cb_param), GFP_KERNEL);
 	if (!cb_param) {
 		ret = -ENOMEM;
 		goto err_destroy_pkt;
 	}
 
-	comps = kcalloc(param->config->num_components, sizeof(*comps),
+	comps = kcalloc(param->config[PATH_0].num_components, sizeof(*comps),
 			GFP_KERNEL);
 	if (!comps) {
 		ret = -ENOMEM;
 		goto err_destroy_pkt;
 	}
 
-	for (i = 0; i < param->config->num_components; i++) {
-		if (is_dummy_engine(mdp, path.config->components[i].type))
+	for (i = 0; i < param->config[PATH_0].num_components; i++) {
+		if (is_dummy_engine(mdp, path[PATH_0].config->components[i].type))
 			continue;
 
-		memcpy(&comps[i], path.comps[i].comp,
+		memcpy(&comps[i], path[PATH_0].comps[i].comp,
 		       sizeof(struct mdp_comp));
 	}
 	cb_param->mdp = mdp;
@@ -897,10 +945,49 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	cb_param->user_cb_data = param->cb_data;
 	cb_param->pkt = cmd.pkt;
 	cb_param->comps = comps;
-	cb_param->num_comps = param->config->num_components;
+	cb_param->num_comps = param->config[PATH_0].num_components;
 	cb_param->mdp_ctx = param->mdp_ctx;
 
+	if (is_dual_pipe(scenario)) {
+		cb_param_d = kzalloc(sizeof(*cb_param_d), GFP_KERNEL);
+		if (!cb_param_d) {
+			ret = -ENOMEM;
+			goto err_destroy_pkt;
+		}
+		comps_d = kcalloc(param->config[PATH_1].num_components, sizeof(*comps_d),
+				  GFP_KERNEL);
+		if (!comps_d) {
+			ret = -ENOMEM;
+			goto err_destroy_pkt;
+		}
+
+		for (i = 0; i < param->config[PATH_1].num_components; i++) {
+			if (is_dummy_engine(mdp, path[PATH_1].config->components[i].type))
+				continue;
+
+			memcpy(&comps_d[i], path[PATH_1].comps[i].comp,
+			       sizeof(struct mdp_comp));
+		}
+		cb_param_d->mdp = mdp;
+		cb_param_d->user_cmdq_cb = param->cmdq_cb;
+		cb_param_d->user_cb_data = param->cb_data;
+		cb_param_d->pkt = cmd_d.pkt;
+		cb_param_d->comps = comps_d;
+		cb_param_d->num_comps = param->config[PATH_1].num_components;
+		cb_param_d->mdp_ctx = param->mdp_ctx;
+	}
+
+	if (atomic_read(&mdp->cmdq_count))
+		dev_warn(dev, "%s: cmdq_count:%d !\n", __func__, atomic_read(&mdp->cmdq_count));
+
 	cmdq_pkt_finalize(cmd.pkt);
+	atomic_inc(&mdp->cmdq_count);
+
+	if (is_dual_pipe(scenario)) {
+		cmdq_pkt_finalize(cmd_d.pkt);
+		atomic_inc(&mdp->cmdq_count);
+	}
+
 	ret = cmdq_pkt_flush_async(cmd.pkt,
 				   mdp_handle_cmdq_callback,
 				   (void *)cb_param);
@@ -908,6 +995,16 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		dev_err(dev, "cmdq_pkt_flush_async fail!\n");
 		goto err_clock_off;
 	}
+
+	if (is_dual_pipe(scenario)) {
+		ret = cmdq_pkt_flush_async(cmd_d.pkt,
+					   mdp_handle_cmdq_callback,
+					   (void *)cb_param_d);
+		if (ret) {
+			dev_err(dev, "cmdq_dual_pkt_flush_async fail!\n");
+			goto err_clock_off;
+		}
+	}
 	return 0;
 
 err_clock_off:
@@ -920,12 +1017,22 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 
 	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
 			    cb_param->num_comps);
+	if (cb_param_d)
+		mdp_comp_clocks_off(&mdp->pdev->dev, cb_param_d->comps,
+				    cb_param_d->num_comps);
 err_destroy_pkt:
 	cmdq_pkt_destroy(cmd.pkt);
+	if (is_dual_pipe(scenario)) {
+		cmdq_pkt_destroy(cmd_d.pkt);
+		atomic_inc(&mdp->cmdq_count);
+	}
 	atomic_dec(&mdp->job_count);
+	atomic_dec(&mdp->cmdq_count);
 	wake_up(&mdp->callback_wq);
 	kfree(comps);
+	kfree(comps_d);
 	kfree(cb_param);
+	kfree(cb_param_d);
 
 	return ret;
 }
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
index 16933507333b..0a0e88cef6b5 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
@@ -37,6 +37,7 @@ struct mdp_cmdq_cb_param {
 	struct mdp_comp *comps;
 	u8 num_comps;
 	void *mdp_ctx;
+	bool finalize;
 };
 
 struct mdp_dev;
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
index ac216b9350e7..7f654ba63d6b 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
@@ -40,6 +40,7 @@ static const struct mdp_platform_config mt8195_plat_cfg = {
 	.wrot_filter_constraint         = false,
 	.tdshp_1_1                      = true,
 	.tdshp_dyn_contrast_version     = 2,
+	.support_dual_pipe              = true,
 	.gce_event_offset               = 0,
 	.version                        = MTK_MDP_VERSION_8195,
 };
@@ -1259,6 +1260,12 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_put_scp;
 	}
 
+	mdp->cmdq_d_clt = cmdq_mbox_create(dev, 1);
+	if (IS_ERR(mdp->cmdq_d_clt)) {
+		ret = PTR_ERR(mdp->cmdq_d_clt);
+		goto err_mbox_destroy;
+	}
+
 	init_waitqueue_head(&mdp->callback_wq);
 	ida_init(&mdp->mdp_ida);
 	platform_set_drvdata(pdev, mdp);
@@ -1269,7 +1276,7 @@ static int mdp_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "Failed to register v4l2 device\n");
 		ret = -EINVAL;
-		goto err_mbox_destroy;
+		goto err_dual_mbox_destroy;
 	}
 
 	ret = mdp_m2m_device_register(mdp);
@@ -1283,6 +1290,8 @@ static int mdp_probe(struct platform_device *pdev)
 
 err_unregister_device:
 	v4l2_device_unregister(&mdp->v4l2_dev);
+err_dual_mbox_destroy:
+	cmdq_mbox_destroy(mdp->cmdq_d_clt);
 err_mbox_destroy:
 	cmdq_mbox_destroy(mdp->cmdq_clt);
 err_put_scp:
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
index 055812140366..5091fdacc5c6 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
@@ -45,6 +45,7 @@ struct mdp_platform_config {
 	bool wrot_filter_constraint;
 	bool wrot_support_afbc;
 	bool wrot_support_10bit;
+	bool support_dual_pipe;
 	u8 tdshp_dyn_contrast_version;
 	u32 gce_event_offset;
 	u32 version;
@@ -87,6 +88,7 @@ struct mdp_dev {
 	u32					id_count;
 	struct ida				mdp_ida;
 	struct cmdq_client			*cmdq_clt;
+	struct cmdq_client			*cmdq_d_clt;
 	wait_queue_head_t			callback_wq;
 
 	struct v4l2_device			v4l2_dev;
@@ -96,6 +98,7 @@ struct mdp_dev {
 	struct mutex				m2m_lock;
 	atomic_t				suspended;
 	atomic_t				job_count;
+	atomic_t				cmdq_count;
 };
 
 struct mdp_pipe_info {
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
index 1eaeaf58906a..b0e29491b52b 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
@@ -116,6 +116,10 @@ static void mdp_m2m_worker(struct work_struct *work)
 	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	src_vb = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
 	mdp_set_src_config(&param.inputs[0], frame, &src_vb->vb2_buf);
+	mdp_set_scenario(ctx->mdp_dev, &param, frame);
+	if (param.frame_change)
+		dev_dbg(&ctx->mdp_dev->pdev->dev,
+			"MDP Scenario: %d\n", param.type);
 
 	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	dst_vb = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
index 8d191917ac71..4dd0aac20bb4 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
@@ -10,6 +10,8 @@
 #include "mtk-mdp3-core.h"
 #include "mtk-mdp3-regs.h"
 
+#define QHD (2560 * 1440)
+
 static const struct mdp_limit mdp_def_limit = {
 	.out_limit = {
 		.wmin	= 16,
@@ -432,6 +434,19 @@ static u32 mdp_fmt_get_plane_size(const struct mdp_format *fmt,
 	return 0;
 }
 
+void mdp_set_scenario(struct mdp_dev *mdp,
+		      struct img_ipi_frameparam *param,
+		      struct mdp_frame *frame)
+{
+	u32 width = frame->format.fmt.pix_mp.width;
+	u32 height = frame->format.fmt.pix_mp.height;
+
+	if (mdp->mdp_data->mdp_cfg->support_dual_pipe) {
+		if ((width * height) >= QHD)
+			param->type = MDP_STREAM_TYPE_DUAL_BITBLT;
+	}
+}
+
 static void mdp_prepare_buffer(struct img_image_buffer *b,
 			       struct mdp_frame *frame, struct vb2_buffer *vb)
 {
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
index 8a3d430dca36..7979ad60ab87 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
@@ -10,6 +10,7 @@
 #include <linux/videodev2.h>
 #include <media/videobuf2-core.h>
 #include "mtk-img-ipi.h"
+#include "mtk-mdp3-cmdq.h"
 
 /*
  * MDP native color code
@@ -340,6 +341,9 @@ int mdp_try_crop(struct v4l2_rect *r, const struct v4l2_selection *s,
 int mdp_check_scaling_ratio(const struct v4l2_rect *crop,
 			    const struct v4l2_rect *compose, s32 rotation,
 	const struct mdp_limit *limit);
+void mdp_set_scenario(struct mdp_dev *mdp,
+		      struct img_ipi_frameparam *param,
+		      struct mdp_frame *frame);
 void mdp_set_src_config(struct img_input *in,
 			struct mdp_frame *frame, struct vb2_buffer *vb);
 void mdp_set_dst_config(struct img_output *out,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
