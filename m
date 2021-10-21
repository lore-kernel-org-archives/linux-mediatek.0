Return-Path: <SRS0=9f7n=PJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D61FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 06:35:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C80261359
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 06:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C80261359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qngwnIQQ3EkY0+im8g0A7vKdE0xTPRd/8UkUdr7wjm0=; b=hk0BiEY8YVneUj
	fW1JdVrcE818NN5vQYMf53P4tRo0WIDOZS4sNf7l5NaLPcoseSLEClNfcGD8xbxYf2Zjn19zTH7gt
	u/QIyXSQKOaIO72bmUGZbEWceZCgyIpEAZbq2d0lQe0T7GVCIFQeJdT00DQ9q2Gp9xSRdMXEgRd/B
	RHFr9u1wjP6cWHiUBHpYyyzQyTW/lBA/rD1uwzv549lHX1flook8yHzlA9WqM3xzzMxdVzGhZdsy8
	GhiZmszuXoGVUtMx4wOC12GTZy4O4fZwp+LqFeQ0/hhngQ9g1M++rYDLcWVzG0u4GVZM7+gdzqgfq
	0FRz/Vl9rEhAxoGzhStw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdRfa-006WtP-Rv; Thu, 21 Oct 2021 06:35:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdRep-006WZw-CV; Thu, 21 Oct 2021 06:34:34 +0000
X-UUID: 082035c1429c49b9abf4fda93920c989-20211020
X-UUID: 082035c1429c49b9abf4fda93920c989-20211020
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2110757481; Wed, 20 Oct 2021 23:34:29 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 23:34:28 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 21 Oct 2021 14:34:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 21 Oct 2021 14:34:26 +0800
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
Subject: [PATCH v1 2/4] media: platform: mtk-mdp3: Reconfigure SHM to improve
 performance
Date: Thu, 21 Oct 2021 14:34:12 +0800
Message-ID: <20211021063414.23663-3-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211021063414.23663-1-roy-cw.yeh@mediatek.com>
References: <20211021063414.23663-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_233431_489040_9A7011DA 
X-CRM114-Status: GOOD (  25.38  )
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

1. Reconfig SHM
2. Alloc Path Buffer in SHM
3. Modify frame_change criteria
4. Modify dual pipe criteria

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
This patch is based on [1][2][3]
[1] add chip independence architecture
	- https://patchwork.kernel.org/project/linux-mediatek/patch/20211020071448.14187-4-roy-cw.yeh@mediatek.com/
[2] support mt8195
	- https://patchwork.kernel.org/project/linux-mediatek/patch/20211020071448.14187-9-roy-cw.yeh@mediatek.com/
[3] Add dual pipe feature support
	- https://patchwork.kernel.org/project/linux-mediatek/patch/20211020071448.14187-10-roy-cw.yeh@mediatek.com/
---
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   | 106 +++++++++++++++++-
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |  10 ++
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  24 +++-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   1 +
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  10 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |   4 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  80 +++++++------
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   8 ++
 8 files changed, 193 insertions(+), 50 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
index 37bd7c4b9ded..345ab81c5d1f 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
@@ -14,6 +14,7 @@
 #define PATH_1              1
 #define MDP_DUAL_PIPE       2
 #define MDP_PATH_MAX_COMPS  IMG_MAX_COMPONENTS
+#define MDP_CMDQ_TIMEOUT    2000
 
 struct mdp_path {
 	struct mdp_dev		*mdp_dev;
@@ -50,6 +51,9 @@ struct mdp_path_subfrm {
 	u32	num_sof2s;
 };
 
+static struct mdp_cmdq_pkt_pool cmdq_pool = {0};
+static struct mdp_cmdq_pkt_pool cmdq_d_pool = {0};
+
 static bool is_output_disable(const struct img_compparam *param, u32 count)
 {
 	return (count < param->num_subfrms) ?
@@ -82,6 +86,99 @@ int mdp_get_event_idx(struct mdp_dev *mdp, enum mdp_comp_event event)
 	return -ENODEV;
 }
 
+int mdp_cmdq_pkt_create(struct mdp_dev *mdp)
+{
+	int i;
+
+	if (mdp->cmdq_clt) {
+		cmdq_pool.clt = mdp->cmdq_clt;
+
+		for (i = 0; i < MDP_CMDQ_PKT_SIZE; i++)
+			if (!cmdq_pool.pkt[i])
+				cmdq_pool.pkt[i] = cmdq_pkt_create(mdp->cmdq_clt, SZ_16K);
+	}
+
+	if (mdp->cmdq_d_clt) {
+		cmdq_d_pool.clt = mdp->cmdq_d_clt;
+
+		for (i = 0; i < MDP_CMDQ_PKT_SIZE; i++)
+			if (!cmdq_d_pool.pkt[i])
+				cmdq_d_pool.pkt[i] = cmdq_pkt_create(mdp->cmdq_d_clt, SZ_16K);
+	}
+
+	return 0;
+}
+
+void mdp_cmdq_pkt_destroy(void)
+{
+	int i;
+
+	if (cmdq_pool.clt) {
+		for (i = 0; i < MDP_CMDQ_PKT_SIZE; i++) {
+			if (cmdq_pool.pkt[i]) {
+				cmdq_pkt_destroy(cmdq_pool.pkt[i]);
+				cmdq_pool.pkt[i] = NULL;
+			}
+		}
+	}
+
+	if (cmdq_d_pool.clt) {
+		for (i = 0; i < MDP_CMDQ_PKT_SIZE; i++) {
+			if (cmdq_d_pool.pkt[i]) {
+				cmdq_pkt_destroy(cmdq_d_pool.pkt[i]);
+				cmdq_d_pool.pkt[i] = NULL;
+			}
+		}
+	}
+}
+
+static struct cmdq_pkt *mdp_cmdq_pkt_get(struct cmdq_client *client)
+{
+	int i;
+
+	if (cmdq_pool.clt == client) {
+		for (i = 0; i < MDP_CMDQ_PKT_SIZE; i++) {
+			if (!cmdq_pool.occupied[i]) {
+				cmdq_pool.pkt[i]->cmd_buf_size = 0;
+				cmdq_pool.occupied[i] = true;
+				return cmdq_pool.pkt[i];
+			}
+		}
+	} else if (cmdq_d_pool.clt == client) {
+		for (i = 0; i < MDP_CMDQ_PKT_SIZE; i++) {
+			if (!cmdq_d_pool.occupied[i]) {
+				cmdq_d_pool.pkt[i]->cmd_buf_size = 0;
+				cmdq_d_pool.occupied[i] = true;
+				return cmdq_d_pool.pkt[i];
+			}
+		}
+	}
+
+	return ERR_PTR(-ENOMEM);
+}
+
+static void mdp_cmdq_pkt_free(struct cmdq_pkt *pkt)
+{
+	int i;
+
+	for (i = 0; i < MDP_CMDQ_PKT_SIZE; i++) {
+		if (cmdq_pool.pkt[i] == pkt) {
+			cmdq_pool.occupied[i] = false;
+			goto free_done;
+		}
+	}
+
+	for (i = 0; i < MDP_CMDQ_PKT_SIZE; i++) {
+		if (cmdq_d_pool.pkt[i] == pkt) {
+			cmdq_d_pool.occupied[i] = false;
+			goto free_done;
+		}
+	}
+
+free_done:
+	return;
+}
+
 static int mdp_path_subfrm_require(struct mdp_path_subfrm *subfrm,
 				   const struct mdp_path *path,
 				   struct mmsys_cmdq_cmd *cmd, u32 count)
@@ -794,7 +891,7 @@ static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
 		cb_param->user_cmdq_cb(user_cb_data);
 	}
 
-	cmdq_pkt_destroy(cb_param->pkt);
+	mdp_cmdq_pkt_free(cb_param->pkt);
 	INIT_WORK(&cb_param->auto_release_work, mdp_auto_release_work);
 	if (!queue_work(mdp->clock_wq, &cb_param->auto_release_work)) {
 		dev_err(dev, "%s:queue_work fail!\n", __func__);
@@ -832,8 +929,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		return -ECANCELED;
 
 	atomic_inc(&mdp->job_count);
-
-	cmd.pkt = cmdq_pkt_create(mdp->cmdq_clt, SZ_16K);
+	mbox_flush(mdp->cmdq_clt->chan, MDP_CMDQ_TIMEOUT);
+	cmd.pkt = mdp_cmdq_pkt_get(mdp->cmdq_clt);
 	if (IS_ERR(cmd.pkt)) {
 		atomic_dec(&mdp->job_count);
 		wake_up(&mdp->callback_wq);
@@ -842,7 +939,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	cmd.event = &mdp->event[0];
 
 	if (is_dual_pipe(scenario)) {
-		cmd_d.pkt = cmdq_pkt_create(mdp->cmdq_d_clt, SZ_16K);
+		mbox_flush(mdp->cmdq_d_clt->chan, MDP_CMDQ_TIMEOUT);
+		cmd_d.pkt = mdp_cmdq_pkt_get(mdp->cmdq_d_clt);
 		if (IS_ERR(cmd_d.pkt)) {
 			atomic_dec(&mdp->job_count);
 			wake_up(&mdp->callback_wq);
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
index 0a0e88cef6b5..b8844ebde4a1 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
@@ -12,6 +12,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include "mtk-img-ipi.h"
 
+#define MDP_CMDQ_PKT_SIZE	(2)
+
 struct platform_device *mdp_get_plat_device(struct platform_device *pdev);
 
 int mdp_cmdq_sendtask(struct platform_device *pdev, struct img_config *config,
@@ -40,8 +42,16 @@ struct mdp_cmdq_cb_param {
 	bool finalize;
 };
 
+struct mdp_cmdq_pkt_pool {
+	struct cmdq_client *clt;
+	bool occupied[MDP_CMDQ_PKT_SIZE];
+	struct cmdq_pkt *pkt[MDP_CMDQ_PKT_SIZE];
+};
+
 struct mdp_dev;
 
+int mdp_cmdq_pkt_create(struct mdp_dev *mdp);
+void mdp_cmdq_pkt_destroy(void);
 int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param);
 
 #endif  /* __MTK_MDP3_CMDQ_H__ */
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
index 1c8baa33ecc6..1e61ac7ca790 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
@@ -1130,7 +1130,7 @@ static int mdp_probe(struct platform_device *pdev)
 	struct device_node *mdp_node;
 	struct platform_device *mm_pdev, *mm_pdev2;
 	u32 event_ofst;
-	int ret, i, mutex_id;
+	int ret, i, mutex_id, id = 0;
 
 	mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
 	if (!mdp) {
@@ -1140,6 +1140,18 @@ static int mdp_probe(struct platform_device *pdev)
 
 	mdp->pdev = pdev;
 	mdp->mdp_data = of_device_get_match_data(&pdev->dev);
+
+	ret = of_property_read_u32(dev->of_node, "mediatek,mdp3-id", &id);
+	if (ret) {
+		dev_err(dev, "Failed to get mdp-id\n");
+		goto err_return;
+	}
+
+	if (id != MDP_RDMA0_NODE) {
+		platform_set_drvdata(pdev, mdp);
+		goto err_return;
+	}
+
 	mm_pdev = __get_pdev_by_name(pdev, "mediatek,mmsys");
 	if (!mm_pdev) {
 		ret = -ENODEV;
@@ -1270,6 +1282,12 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_mbox_destroy;
 	}
 
+	ret = mdp_cmdq_pkt_create(mdp);
+	if (ret) {
+		dev_err(dev, "Failed to create cmdq pkt\n");
+		goto err_dual_mbox_destroy;
+	}
+
 	init_waitqueue_head(&mdp->callback_wq);
 	ida_init(&mdp->mdp_ida);
 	platform_set_drvdata(pdev, mdp);
@@ -1280,7 +1298,7 @@ static int mdp_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "Failed to register v4l2 device\n");
 		ret = -EINVAL;
-		goto err_dual_mbox_destroy;
+		goto err_destroy_cmdq_pkt;
 	}
 
 	ret = mdp_m2m_device_register(mdp);
@@ -1294,6 +1312,8 @@ static int mdp_probe(struct platform_device *pdev)
 
 err_unregister_device:
 	v4l2_device_unregister(&mdp->v4l2_dev);
+err_destroy_cmdq_pkt:
+	mdp_cmdq_pkt_destroy();
 err_dual_mbox_destroy:
 	cmdq_mbox_destroy(mdp->cmdq_d_clt);
 err_mbox_destroy:
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
index 5091fdacc5c6..44035bcbb9c4 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
@@ -15,6 +15,7 @@
 #include "mtk-mdp3-vpu.h"
 
 #define MDP_MODULE_NAME	"mtk-mdp3"
+#define MDP_RDMA0_NODE		(0)
 
 enum mdp_buffer_usage {
 	MDP_BUFFER_USAGE_HW_READ,
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
index 55384bb812cf..4684bb3718d3 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
@@ -99,6 +99,7 @@ static void mdp_m2m_worker(struct work_struct *work)
 	struct img_ipi_frameparam param = {0};
 	struct mdp_cmdq_param task = {0};
 	enum vb2_buffer_state vb_state = VB2_BUF_STATE_ERROR;
+	static u8 prev_scenario;
 	int ret;
 
 	if (mdp_m2m_ctx_is_state_set(ctx, MDP_M2M_CTX_ERROR)) {
@@ -111,12 +112,19 @@ static void mdp_m2m_worker(struct work_struct *work)
 	param.type = ctx->curr_param.type;
 	param.num_inputs = 1;
 	param.num_outputs = 1;
-	param.frame_change = (ctx->frame_count == 0) ? true : false;
 
 	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	src_vb = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
 	mdp_set_src_config(&param.inputs[0], frame, &src_vb->vb2_buf);
 	mdp_set_scenario(ctx->mdp_dev, &param, frame);
+
+	if (prev_scenario != param.type) {
+		prev_scenario = param.type;
+		param.frame_change = true;
+	} else {
+		param.frame_change = (ctx->frame_count == 0) ? true : false;
+	}
+
 	if (param.frame_change)
 		dev_info(&ctx->mdp_dev->pdev->dev,
 			 "MDP Scenario: %d\n", param.type);
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
index 92f337077411..91c5e35947d3 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
@@ -10,7 +10,7 @@
 #include "mtk-mdp3-core.h"
 #include "mtk-mdp3-regs.h"
 
-#define QHD (2560 * 1440)
+#define FHD (1920 * 1080)
 
 static const struct mdp_limit mdp_def_limit = {
 	.out_limit = {
@@ -445,7 +445,7 @@ void mdp_set_scenario(struct mdp_dev *mdp,
 		return;
 
 	if (mdp->mdp_data->mdp_cfg->support_dual_pipe) {
-		if ((width * height) >= QHD)
+		if ((width * height) >= FHD)
 			param->type = MDP_STREAM_TYPE_DUAL_BITBLT;
 	}
 }
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
index f91d817ea379..f99233060c99 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
@@ -10,7 +10,8 @@
 #include "mtk-mdp3-core.h"
 
 #define MDP_VPU_MESSAGE_TIMEOUT 500U
-#define vpu_alloc_size		0x600000
+#define MDP_DUAL_PIPE		2
+#define MDP_VPU_PATH_SIZE	0x78000
 
 static inline struct mdp_dev *vpu_to_mdp(struct mdp_vpu_dev *vpu)
 {
@@ -22,10 +23,22 @@ static int mdp_vpu_shared_mem_alloc(struct mdp_vpu_dev *vpu)
 	if (vpu->work && vpu->work_addr)
 		return 0;
 
-	vpu->work = dma_alloc_coherent(scp_get_device(vpu->scp), vpu_alloc_size,
-				       &vpu->work_addr, GFP_KERNEL);
+	if (vpu->config && vpu->config_addr)
+		return 0;
+
+	if (vpu->path && vpu->path_addr)
+		return 0;
+
+	vpu->work = dma_alloc_wc(scp_get_device(vpu->scp), vpu->work_size,
+				 &vpu->work_addr, GFP_KERNEL);
 
-	if (!vpu->work)
+	vpu->config = dma_alloc_wc(scp_get_device(vpu->scp), vpu->config_size,
+				   &vpu->config_addr, GFP_KERNEL);
+
+	vpu->path = dma_alloc_wc(scp_get_device(vpu->scp), vpu->path_size,
+				 &vpu->path_addr, GFP_KERNEL);
+
+	if (!vpu->work || !vpu->config || !vpu->path)
 		return -ENOMEM;
 	else
 		return 0;
@@ -34,8 +47,16 @@ static int mdp_vpu_shared_mem_alloc(struct mdp_vpu_dev *vpu)
 void mdp_vpu_shared_mem_free(struct mdp_vpu_dev *vpu)
 {
 	if (vpu->work && vpu->work_addr)
-		dma_free_coherent(scp_get_device(vpu->scp), vpu_alloc_size,
+		dma_free_coherent(scp_get_device(vpu->scp), vpu->work_size,
 				  vpu->work, vpu->work_addr);
+
+	if (vpu->config && vpu->config_addr)
+		dma_free_coherent(scp_get_device(vpu->scp), vpu->config_size,
+				  vpu->config, vpu->config_addr);
+
+	if (vpu->path && vpu->path_addr)
+		dma_free_coherent(scp_get_device(vpu->scp), vpu->path_size,
+				  vpu->path, vpu->path_addr);
 }
 
 static void mdp_vpu_ipi_handle_init_ack(void *data, unsigned int len,
@@ -155,9 +176,6 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
 	struct mdp_ipi_init_msg msg = {
 		.drv_data = (unsigned long)vpu,
 	};
-	size_t mem_size;
-	phys_addr_t pool;
-	const size_t pool_size = sizeof(struct mdp_config_pool);
 	struct mdp_dev *mdp = vpu_to_mdp(vpu);
 	int err;
 
@@ -170,33 +188,19 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
 		goto err_work_size;
 	/* vpu work_size was set in mdp_vpu_ipi_handle_init_ack */
 
-	mem_size = vpu_alloc_size;
+	vpu->config_size = MDP_DUAL_PIPE * sizeof(struct img_config);
+	vpu->path_size = MDP_VPU_PATH_SIZE;
 	if (mdp_vpu_shared_mem_alloc(vpu)) {
 		dev_err(&mdp->pdev->dev, "VPU memory alloc fail!");
 		goto err_mem_alloc;
 	}
 
-	pool = ALIGN((phys_addr_t)vpu->work + vpu->work_size, 8);
-	if (pool + pool_size - (phys_addr_t)vpu->work > mem_size) {
-		dev_err(&mdp->pdev->dev,
-			"VPU memory insufficient: %zx + %zx > %zx",
-			vpu->work_size, pool_size, mem_size);
-		err = -ENOMEM;
-		goto err_mem_size;
-	}
-
-	dev_dbg(&mdp->pdev->dev,
-		"VPU work:%pK pa:%pad sz:%zx pool:%pa sz:%zx (mem sz:%zx)",
-		vpu->work, &vpu->work_addr, vpu->work_size,
-		&pool, pool_size, mem_size);
-	vpu->pool = (struct mdp_config_pool *)pool;
 	msg.work_addr = vpu->work_addr;
 	msg.work_size = vpu->work_size;
 	err = mdp_vpu_sendmsg(vpu, SCP_IPI_MDP_INIT, &msg, sizeof(msg));
 	if (err)
 		goto err_work_size;
 
-	memset(vpu->pool, 0, sizeof(*vpu->pool));
 	return 0;
 
 err_work_size:
@@ -209,7 +213,6 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
 		break;
 	}
 	return err;
-err_mem_size:
 err_mem_alloc:
 	return err;
 }
@@ -232,12 +235,8 @@ static struct img_config *mdp_config_get(struct mdp_vpu_dev *vpu,
 	if (id < 0 || id >= MDP_CONFIG_POOL_SIZE)
 		return ERR_PTR(-EINVAL);
 
-	mutex_lock(vpu->lock);
-	vpu->pool->cfg_count[id]++;
-	config = &vpu->pool->configs[id];
-	*addr = vpu->work_addr +
-		((unsigned long)config - (phys_addr_t)vpu->work);
-	mutex_unlock(vpu->lock);
+	config = vpu->config;
+	*addr = vpu->config_addr;
 
 	return config;
 }
@@ -250,14 +249,7 @@ static int mdp_config_put(struct mdp_vpu_dev *vpu,
 
 	if (id < 0 || id >= MDP_CONFIG_POOL_SIZE)
 		return -EINVAL;
-	if (vpu->lock)
-		mutex_lock(vpu->lock);
-	if (!vpu->pool->cfg_count[id] || config != &vpu->pool->configs[id])
-		err = -EINVAL;
-	else
-		vpu->pool->cfg_count[id]--;
-	if (vpu->lock)
-		mutex_unlock(vpu->lock);
+
 	return err;
 }
 
@@ -299,7 +291,13 @@ int mdp_vpu_process(struct mdp_vpu_ctx *ctx, struct img_ipi_frameparam *param)
 		}
 	}
 	memset((void *)ctx->vpu_dev->work, 0, ctx->vpu_dev->work_size);
-	memset(ctx->config, 0, sizeof(*ctx->config));
+
+	if (param->frame_change)
+		memset((void *)ctx->vpu_dev->path, 0, ctx->vpu_dev->path_size);
+	param->self_data.pa = ctx->vpu_dev->path_addr;
+	param->self_data.va = (phys_addr_t)ctx->vpu_dev->path;
+
+	memset(ctx->config, 0, ctx->vpu_dev->config_size);
 	param->config_data.va = (unsigned long)ctx->config;
 	param->config_data.pa = ctx->inst_addr;
 	param->drv_data = (unsigned long)ctx;
@@ -308,5 +306,5 @@ int mdp_vpu_process(struct mdp_vpu_ctx *ctx, struct img_ipi_frameparam *param)
 	addr.pa = ctx->vpu_dev->work_addr;
 	addr.va = (phys_addr_t)ctx->vpu_dev->work;
 	return mdp_vpu_sendmsg(ctx->vpu_dev, SCP_IPI_MDP_FRAME,
-		&addr, sizeof(addr));
+			       &addr, sizeof(addr));
 }
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
index e831070b44d0..d3557f2d9002 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
@@ -57,6 +57,14 @@ struct mdp_vpu_dev {
 	size_t			work_size;
 	struct mdp_config_pool	*pool;
 	u32			status;
+
+	void			*config;
+	dma_addr_t		config_addr;
+	size_t			config_size;
+
+	void			*path;
+	dma_addr_t		path_addr;
+	size_t			path_size;
 };
 
 struct mdp_vpu_ctx {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
