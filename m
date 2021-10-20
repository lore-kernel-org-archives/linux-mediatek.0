Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD6DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:21:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE12860F59
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE12860F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EEyC3WPXDevJsnap6G4B0HP6r76XF8goxjhnpqcjRQ=; b=kpMuDh84HZSIdo
	RQWpyYi8AW0MsjYdKjeEB/3myOFFbCY+/WOFVNCmk4iTKHObqyTfOrpooT3xbJ2gDOKoJpgrOumNK
	Ww6l6CKx7ADrb0Pb49VlVuNu/BOVtH+Qjussz+jKi1J4axBhvqqm0XESUqn0vRve80aL/mBzrwJvA
	ZYcPUOzEakIc4cAXJ0n+oyiGfntHEDUq+7UennDkYfAW9Xz2VH7fUZY5FTAM96y4iWQ86g0KoecVL
	nQw0Gc/KvhhIche58cbzIb7Zx8r+CdsWfahBJMTaH488wNStnarm9ZK4p/kECXPJkQKJ7ODYPyCBA
	g2E+B2AG1GxxGvwNEWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md5ty-003alN-L8; Wed, 20 Oct 2021 07:20:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md5pB-003Y6z-QS; Wed, 20 Oct 2021 07:16:06 +0000
X-UUID: 1f267a4bff494bb39bc10a63a38e45f4-20211020
X-UUID: 1f267a4bff494bb39bc10a63a38e45f4-20211020
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1527368958; Wed, 20 Oct 2021 00:15:30 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 00:15:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 20 Oct 2021 15:15:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Oct 2021 15:15:26 +0800
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
Subject: [PATCH v2 3/9] media: platform: mtk-mdp3: add chip independence
 architecture
Date: Wed, 20 Oct 2021 15:14:42 +0800
Message-ID: <20211020071448.14187-4-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211020071448.14187-1-roy-cw.yeh@mediatek.com>
References: <20211020071448.14187-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_001546_099224_EA8E6CDB 
X-CRM114-Status: GOOD (  21.55  )
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

Add chip independence architecture
- Add hal architecture for mt8183
- Add driver data to adapt other soc

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   | 154 ++++---
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 181 ++++-----
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   | 193 ++++++++-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   | 383 +++++++++++++++++-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |  19 +
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  10 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   | 259 +-----------
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   | 268 ++++++------
 8 files changed, 925 insertions(+), 542 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
index 1636b60251ce..8972cb8de755 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
@@ -42,16 +42,43 @@ static bool is_output_disable(const struct img_compparam *param, u32 count)
 		true;
 }
 
+static int mdp_get_mutex_idx(const struct mtk_mdp_driver_data *data, enum mtk_mdp_pipe_id pipe_id)
+{
+	int i = 0;
+
+	for (i = 0; i < data->pipe_info_len; i++) {
+		if (pipe_id == data->pipe_info[i].pipe_id)
+			return i;
+	}
+
+	return -ENODEV;
+}
+
+int mdp_get_event_idx(struct mdp_dev *mdp, enum mdp_comp_event event)
+{
+	int i = 0;
+
+	for (i = 0; i < mdp->mdp_data->event_len; i++) {
+		if (event == mdp->mdp_data->event[i])
+			return i;
+	}
+
+	return -ENODEV;
+}
+
 static int mdp_path_subfrm_require(struct mdp_path_subfrm *subfrm,
 				   const struct mdp_path *path,
 				   struct mmsys_cmdq_cmd *cmd, u32 count)
 {
 	const struct img_config *config = path->config;
 	const struct mdp_comp_ctx *ctx;
+	const struct mtk_mdp_driver_data *data = path->mdp_dev->mdp_data;
 	struct device *dev = &path->mdp_dev->pdev->dev;
 	struct mtk_mutex **mutex = path->mdp_dev->mdp_mutex;
 	s32 mutex_id = -1;
-	int index;
+	u32 mutex_sof = 0;
+	int index, j;
+	enum mtk_mdp_comp_id mtk_comp_id = MDP_COMP_NONE;
 
 	/* Default value */
 	memset(subfrm, 0, sizeof(*subfrm));
@@ -60,62 +87,54 @@ static int mdp_path_subfrm_require(struct mdp_path_subfrm *subfrm,
 		ctx = &path->comps[index];
 		if (is_output_disable(ctx->param, count))
 			continue;
-		switch (ctx->comp->id) {
-		/**********************************************
-		 * Name            MSB LSB
-		 * DISP_MUTEX_MOD   23   0
-		 *
-		 * Specifies which modules are in this mutex.
-		 * Every bit denotes a module. Bit definition:
-		 *  2 mdp_rdma0
-		 *  4 mdp_rsz0
-		 *  5 mdp_rsz1
-		 *  6 mdp_tdshp
-		 *  7 mdp_wrot0
-		 *  8 mdp_wdma
-		 *  13 mdp_color
-		 *  23 mdp_aal
-		 *  24 mdp_ccorr
-		 **********************************************/
+
+		mtk_comp_id = data->comp_data[ctx->comp->id].match.public_id;
+		switch (mtk_comp_id) {
 		case MDP_COMP_AAL0:
-			subfrm->mutex_mod |= 1 << 23;
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
 			break;
 		case MDP_COMP_CCORR0:
-			subfrm->mutex_mod |= 1 << 24;
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
 			break;
 		case MDP_COMP_WDMA:
-			subfrm->mutex_mod |= 1 << 8;
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
 			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_WDMA;
 			break;
 		case MDP_COMP_WROT0:
-			subfrm->mutex_mod |= 1 << 7;
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
 			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_WROT0;
 			break;
 		case MDP_COMP_TDSHP0:
-			subfrm->mutex_mod |= 1 << 6;
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
 			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_TDSHP0;
 			break;
 		case MDP_COMP_RSZ1:
-			subfrm->mutex_mod |= 1 << 5;
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
 			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RSZ1;
 			break;
 		case MDP_COMP_RSZ0:
-			subfrm->mutex_mod |= 1 << 4;
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
 			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RSZ0;
 			break;
 		case MDP_COMP_RDMA0:
-			mutex_id = MDP_PIPE_RDMA0;
-			subfrm->mutex_mod |= 1 << 2;
+			j = mdp_get_mutex_idx(data, MDP_PIPE_RDMA0);
+			mutex_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
 			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RDMA0;
 			break;
 		case MDP_COMP_ISP_IMGI:
-			mutex_id = MDP_PIPE_IMGI;
+			j = mdp_get_mutex_idx(data, MDP_PIPE_IMGI);
+			mutex_id = data->pipe_info[j].mutex_id;
 			break;
 		case MDP_COMP_WPEI:
-			mutex_id = MDP_PIPE_WPEI;
+			j = mdp_get_mutex_idx(data, MDP_PIPE_WPEI);
+			mutex_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
 			break;
 		case MDP_COMP_WPEI2:
-			mutex_id = MDP_PIPE_WPEI2;
+			j = mdp_get_mutex_idx(data, MDP_PIPE_WPEI2);
+			mutex_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex_mod |= data->comp_data[ctx->comp->id].mutex.mod;
 			break;
 		default:
 			break;
@@ -129,8 +148,10 @@ static int mdp_path_subfrm_require(struct mdp_path_subfrm *subfrm,
 	}
 
 	/* Set mutex modules */
-	if (subfrm->mutex_mod)
-		mtk_mutex_add_mdp_mod(mutex[mutex_id], subfrm->mutex_mod, cmd);
+	if (subfrm->mutex_mod) {
+		mtk_mutex_add_mdp_mod(mutex[mutex_id], subfrm->mutex_mod,
+				      0, mutex_sof, cmd);
+	}
 
 	return 0;
 }
@@ -149,33 +170,36 @@ static int mdp_path_subfrm_run(const struct mdp_path_subfrm *subfrm,
 	}
 
 	if (subfrm->mutex_mod) {
-		int index;
+		int index, evt;
 
 		/* Wait WROT SRAM shared to DISP RDMA */
 		/* Clear SOF event for each engine */
 		for (index = 0; index < subfrm->num_sofs; index++) {
 			switch (subfrm->sofs[index]) {
 			case MDP_COMP_RDMA0:
-				MM_REG_CLEAR(cmd, RDMA0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA0_SOF);
 				break;
 			case MDP_COMP_TDSHP0:
-				MM_REG_CLEAR(cmd, TDSHP0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, TDSHP0_SOF);
 				break;
 			case MDP_COMP_RSZ0:
-				MM_REG_CLEAR(cmd, RSZ0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, RSZ0_SOF);
 				break;
 			case MDP_COMP_RSZ1:
-				MM_REG_CLEAR(cmd, RSZ1_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, RSZ1_SOF);
 				break;
 			case MDP_COMP_WDMA:
-				MM_REG_CLEAR(cmd, WDMA0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, WDMA0_SOF);
 				break;
 			case MDP_COMP_WROT0:
-				MM_REG_CLEAR(cmd, WROT0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, WROT0_SOF);
 				break;
 			default:
+				evt = -1;
 				break;
 			}
+			if (evt > 0)
+				MM_REG_CLEAR(cmd, evt);
 		}
 
 		/* Enable the mutex */
@@ -185,26 +209,29 @@ static int mdp_path_subfrm_run(const struct mdp_path_subfrm *subfrm,
 		for (index = 0; index < subfrm->num_sofs; index++) {
 			switch (subfrm->sofs[index]) {
 			case MDP_COMP_RDMA0:
-				MM_REG_WAIT(cmd, RDMA0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA0_SOF);
 				break;
 			case MDP_COMP_TDSHP0:
-				MM_REG_WAIT(cmd, TDSHP0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, TDSHP0_SOF);
 				break;
 			case MDP_COMP_RSZ0:
-				MM_REG_WAIT(cmd, RSZ0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, RSZ0_SOF);
 				break;
 			case MDP_COMP_RSZ1:
-				MM_REG_WAIT(cmd, RSZ1_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, RSZ1_SOF);
 				break;
 			case MDP_COMP_WDMA:
-				MM_REG_WAIT(cmd, WDMA0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, WDMA0_SOF);
 				break;
 			case MDP_COMP_WROT0:
-				MM_REG_WAIT(cmd, WROT0_SOF);
+				evt = mdp_get_event_idx(path->mdp_dev, WROT0_SOF);
 				break;
 			default:
+				evt = -1;
 				break;
 			}
+			if (evt > 0)
+				MM_REG_WAIT(cmd, evt);
 		}
 	}
 	return 0;
@@ -235,7 +262,9 @@ static int mdp_path_config_subfrm(struct mmsys_cmdq_cmd *cmd,
 	struct mdp_path_subfrm subfrm;
 	const struct img_config *config = path->config;
 	struct device *mmsys_dev = path->mdp_dev->mdp_mmsys;
+	const struct mtk_mdp_driver_data *data = path->mdp_dev->mdp_data;
 	struct mdp_comp_ctx *ctx;
+	enum mdp_comp_id cur, next;
 	int index, ret;
 
 	/* Acquire components */
@@ -243,10 +272,14 @@ static int mdp_path_config_subfrm(struct mmsys_cmdq_cmd *cmd,
 	if (ret)
 		return ret;
 	/* Enable mux settings */
-	for (index = 0; index < (config->num_components - 1); index++)
+	for (index = 0; index < (config->num_components - 1); index++) {
+		cur = path->comps[index].comp->id;
+		next = path->comps[index + 1].comp->id;
 		mtk_mmsys_mdp_connect(mmsys_dev, cmd,
-				      path->comps[index].comp->id,
-				      path->comps[index + 1].comp->id);
+				data->comp_data[cur].match.public_id,
+				data->comp_data[next].match.public_id);
+	}
+
 	/* Config sub-frame information */
 	for (index = (config->num_components - 1); index >= 0; index--) {
 		ctx = &path->comps[index];
@@ -277,10 +310,14 @@ static int mdp_path_config_subfrm(struct mmsys_cmdq_cmd *cmd,
 			return ret;
 	}
 	/* Disable mux settings */
-	for (index = 0; index < (config->num_components - 1); index++)
+	for (index = 0; index < (config->num_components - 1); index++) {
+		cur = path->comps[index].comp->id;
+		next = path->comps[index + 1].comp->id;
 		mtk_mmsys_mdp_disconnect(mmsys_dev, cmd,
-					 path->comps[index].comp->id,
-					 path->comps[index + 1].comp->id);
+				data->comp_data[cur].match.public_id,
+				data->comp_data[next].match.public_id);
+	}
+
 	return 0;
 }
 
@@ -330,12 +367,14 @@ static void mdp_auto_release_work(struct work_struct *work)
 {
 	struct mdp_cmdq_cb_param *cb_param;
 	struct mdp_dev *mdp;
+	int i;
 
 	cb_param = container_of(work, struct mdp_cmdq_cb_param,
 				auto_release_work);
 	mdp = cb_param->mdp;
 
-	mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
+	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
+	mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
 	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
 			    cb_param->num_comps);
 
@@ -351,6 +390,7 @@ static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
 	struct mdp_cmdq_cb_param *cb_param;
 	struct mdp_dev *mdp;
 	struct device *dev;
+	int i;
 
 	if (!data.data) {
 		pr_info("%s:no callback data\n", __func__);
@@ -376,7 +416,8 @@ static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
 	INIT_WORK(&cb_param->auto_release_work, mdp_auto_release_work);
 	if (!queue_work(mdp->clock_wq, &cb_param->auto_release_work)) {
 		dev_err(dev, "%s:queue_work fail!\n", __func__);
-		mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
+		i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
+		mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
 		mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
 				    cb_param->num_comps);
 
@@ -430,7 +471,9 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		goto err_destroy_pkt;
 	}
 
-	mtk_mutex_prepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
+	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
+	mtk_mutex_prepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
+
 	for (i = 0; i < param->config->num_components; i++)
 		mdp_comp_clock_on(&mdp->pdev->dev, path.comps[i].comp);
 
@@ -475,7 +518,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	return 0;
 
 err_clock_off:
-	mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
+	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
+	mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
 	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
 			    cb_param->num_comps);
 err_destroy_pkt:
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
index 27c70289cc90..f690502ee42b 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
@@ -19,6 +19,38 @@
 #include "mdp_reg_wdma.h"
 #include "mdp_reg_isp.h"
 
+static struct mdp_comp_list comp_list;
+
+enum mdp_comp_id get_comp_camin(void)
+{
+	return comp_list.camin;
+}
+
+enum mdp_comp_id get_comp_camin2(void)
+{
+	return comp_list.camin2;
+}
+
+enum mdp_comp_id get_comp_rdma0(void)
+{
+	return comp_list.rdma0;
+}
+
+enum mdp_comp_id get_comp_rsz1(void)
+{
+	return comp_list.rsz1;
+}
+
+enum mdp_comp_id get_comp_merge2(void)
+{
+	return comp_list.merge2;
+}
+
+enum mdp_comp_id get_comp_merge3(void)
+{
+	return comp_list.merge3;
+}
+
 static const struct mdp_platform_config *__get_plat_cfg(const struct mdp_comp_ctx *ctx)
 {
 	if (!ctx)
@@ -32,8 +64,8 @@ static s64 get_comp_flag(const struct mdp_comp_ctx *ctx)
 	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
 
 	if (mdp_cfg && mdp_cfg->rdma_rsz1_sram_sharing)
-		if (ctx->comp->id == MDP_COMP_RDMA0)
-			return (1 << MDP_COMP_RDMA0) | (1 << MDP_COMP_RSZ1);
+		if (ctx->comp->id == MDP_RDMA0)
+			return (1 << MDP_RDMA0) | (1 << MDP_RSZ1);
 
 	return 1 << ctx->comp->id;
 }
@@ -45,10 +77,10 @@ static int init_rdma(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 	u8 subsys_id = ctx->comp->subsys_id;
 
 	if (mdp_cfg && mdp_cfg->rdma_support_10bit) {
-		struct mdp_comp *prz1 = ctx->comp->mdp_dev->comp[MDP_COMP_RSZ1];
+		struct mdp_comp *prz1 = ctx->comp->mdp_dev->comp[MDP_RSZ1];
 
 		/* Disable RSZ1 */
-		if (ctx->comp->id == MDP_COMP_RDMA0 && prz1)
+		if (ctx->comp->id == MDP_RDMA0 && prz1)
 			MM_REG_WRITE(cmd, subsys_id, prz1->reg_base, PRZ_ENABLE,
 				     0x00000000, 0x00000001);
 	}
@@ -197,12 +229,15 @@ static int wait_rdma_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 {
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
+	int evt = -1;
 
 	if (ctx->comp->alias_id == 0)
-		MM_REG_WAIT(cmd, RDMA0_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, RDMA0_DONE);
 	else
 		pr_err("Do not support RDMA1_DONE event\n");
 
+	if (evt > 0)
+		MM_REG_WAIT(cmd, evt);
 	/* Disable RDMA */
 	MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_EN, 0x00000000,
 		     0x00000001);
@@ -438,12 +473,16 @@ static int wait_wrot_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
+	int evt = -1;
 
 	if (ctx->comp->alias_id == 0)
-		MM_REG_WAIT(cmd, WROT0_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, WROT0_DONE);
 	else
 		pr_err("Do not support WROT1_DONE event\n");
 
+	if (evt > 0)
+		MM_REG_WAIT(cmd, evt);
+
 	if (mdp_cfg && mdp_cfg->wrot_filter_constraint)
 		MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE, 0,
 			     0x00000077);
@@ -549,8 +588,11 @@ static int wait_wdma_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 {
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
+	int evt;
 
-	MM_REG_WAIT(cmd, WDMA0_DONE);
+	evt = mdp_get_event_idx(ctx->comp->mdp_dev, WDMA0_DONE);
+	if (evt > 0)
+		MM_REG_WAIT(cmd, evt);
 	/* Disable WDMA */
 	MM_REG_WRITE(cmd, subsys_id, base, WDMA_EN, 0x00, 0x00000001);
 	return 0;
@@ -619,13 +661,13 @@ static int init_isp(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 	const struct isp_data *isp = &ctx->param->isp;
 
 	/* Direct link */
-	if (isp->dl_flags & (1 << MDP_COMP_CAMIN)) {
-		dev_info(dev, "SW_RST ASYNC");
+	if (isp->dl_flags & (1 << MDP_CAMIN)) {
+		dev_err(dev, "SW_RST ASYNC");
 		mtk_mmsys_mdp_isp_ctrl(dev, cmd, MDP_COMP_CAMIN);
 	}
 
-	if (isp->dl_flags & (1 << MDP_COMP_CAMIN2)) {
-		dev_info(dev, "SW_RST ASYNC2");
+	if (isp->dl_flags & (1 << MDP_CAMIN2)) {
+		dev_err(dev, "SW_RST ASYNC2");
 		mtk_mmsys_mdp_isp_ctrl(dev, cmd, MDP_COMP_CAMIN2);
 	}
 
@@ -736,13 +778,14 @@ static int wait_isp_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 	struct device *dev = &ctx->comp->mdp_dev->pdev->dev;
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
+	int evt;
 
 	/* MDP_DL_SEL: select MDP_CROP */
-	if (isp->dl_flags & (1 << MDP_COMP_CAMIN))
+	if (isp->dl_flags & (1 << MDP_CAMIN))
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x0030, 0x00000000,
 				  0x00000200);
 	/* MDP2_DL_SEL: select MDP_CROP2 */
-	if (isp->dl_flags & (1 << MDP_COMP_CAMIN2))
+	if (isp->dl_flags & (1 << MDP_CAMIN2))
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x0030, 0x00000000,
 				  0x00000C00);
 
@@ -750,68 +793,70 @@ static int wait_isp_event(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 	case ISP_DRV_DIP_CQ_THRE0:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0001,
 				  0x00000001);
-		MM_REG_WAIT(cmd, ISP_P2_0_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_0_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE1:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0002,
 				  0x00000002);
-		MM_REG_WAIT(cmd, ISP_P2_1_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_1_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE2:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0004,
 				  0x00000004);
-		MM_REG_WAIT(cmd, ISP_P2_2_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_2_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE3:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0008,
 				  0x00000008);
-		MM_REG_WAIT(cmd, ISP_P2_3_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_3_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE4:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0010,
 				  0x00000010);
-		MM_REG_WAIT(cmd, ISP_P2_4_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_4_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE5:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0020,
 				  0x00000020);
-		MM_REG_WAIT(cmd, ISP_P2_5_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_5_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE6:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0040,
 				  0x00000040);
-		MM_REG_WAIT(cmd, ISP_P2_6_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_6_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE7:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0080,
 				  0x00000080);
-		MM_REG_WAIT(cmd, ISP_P2_7_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_7_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE8:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0100,
 				  0x00000100);
-		MM_REG_WAIT(cmd, ISP_P2_8_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_8_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE9:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0200,
 				  0x00000200);
-		MM_REG_WAIT(cmd, ISP_P2_9_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_9_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE10:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0400,
 				  0x00000400);
-		MM_REG_WAIT(cmd, ISP_P2_10_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_10_DONE);
 		break;
 	case ISP_DRV_DIP_CQ_THRE11:
 		MM_REG_WRITE_MASK(cmd, subsys_id, base, 0x2000, 0x0800,
 				  0x00000800);
-		MM_REG_WAIT(cmd, ISP_P2_11_DONE);
+		evt = mdp_get_event_idx(ctx->comp->mdp_dev, ISP_P2_11_DONE);
 		break;
 	default:
 		dev_err(dev, "Do not support this cq (%d)", isp->cq_idx);
 		return -EINVAL;
 	}
 
+	MM_REG_WAIT(cmd, evt);
+
 	return 0;
 }
 
@@ -874,32 +919,6 @@ static const struct mdp_comp_ops *mdp_comp_ops[MDP_COMP_TYPE_COUNT] = {
 	[MDP_COMP_TYPE_DL_PATH2] =	&camin_ops,
 };
 
-struct mdp_comp_match {
-	enum mdp_comp_type	type;
-	u32			alias_id;
-};
-
-static const struct mdp_comp_match mdp_comp_matches[MDP_MAX_COMP_COUNT] = {
-	[MDP_COMP_WPEI] =	{ MDP_COMP_TYPE_WPEI, 0 },
-	[MDP_COMP_WPEO] =	{ MDP_COMP_TYPE_EXTO, 2 },
-	[MDP_COMP_WPEI2] =	{ MDP_COMP_TYPE_WPEI, 1 },
-	[MDP_COMP_WPEO2] =	{ MDP_COMP_TYPE_EXTO, 3 },
-	[MDP_COMP_ISP_IMGI] =	{ MDP_COMP_TYPE_IMGI, 0 },
-	[MDP_COMP_ISP_IMGO] =	{ MDP_COMP_TYPE_EXTO, 0 },
-	[MDP_COMP_ISP_IMG2O] =	{ MDP_COMP_TYPE_EXTO, 1 },
-
-	[MDP_COMP_CAMIN] =	{ MDP_COMP_TYPE_DL_PATH1, 0 },
-	[MDP_COMP_CAMIN2] =	{ MDP_COMP_TYPE_DL_PATH2, 1 },
-	[MDP_COMP_RDMA0] =	{ MDP_COMP_TYPE_RDMA, 0 },
-	[MDP_COMP_CCORR0] =	{ MDP_COMP_TYPE_CCORR, 0 },
-	[MDP_COMP_RSZ0] =	{ MDP_COMP_TYPE_RSZ, 0 },
-	[MDP_COMP_RSZ1] =	{ MDP_COMP_TYPE_RSZ, 1 },
-	[MDP_COMP_PATH0_SOUT] =	{ MDP_COMP_TYPE_PATH1, 0 },
-	[MDP_COMP_PATH1_SOUT] =	{ MDP_COMP_TYPE_PATH2, 1 },
-	[MDP_COMP_WROT0] =	{ MDP_COMP_TYPE_WROT, 0 },
-	[MDP_COMP_WDMA] =	{ MDP_COMP_TYPE_WDMA, 0 },
-};
-
 static const struct of_device_id mdp_comp_dt_ids[] = {
 	{
 		.compatible = "mediatek,mt8183-mdp3-rdma",
@@ -943,34 +962,13 @@ static const struct of_device_id mdp_sub_comp_dt_ids[] = {
 	{}
 };
 
-/* Used to describe the item order in MDP property */
-struct mdp_comp_info {
-	u32	clk_num;
-	u32	clk_ofst;
-	u32	dts_reg_ofst;
-};
-
-static const struct mdp_comp_info mdp_comp_dt_info[MDP_COMP_TYPE_COUNT] = {
-	[MDP_COMP_TYPE_RDMA]		= {2, 0, 0},
-	[MDP_COMP_TYPE_RSZ]		= {1, 0, 0},
-	[MDP_COMP_TYPE_WROT]		= {1, 0, 0},
-	[MDP_COMP_TYPE_WDMA]		= {1, 0, 0},
-	[MDP_COMP_TYPE_PATH1]		= {0, 0, 2},
-	[MDP_COMP_TYPE_PATH2]		= {0, 0, 3},
-	[MDP_COMP_TYPE_CCORR]		= {1, 0, 0},
-	[MDP_COMP_TYPE_IMGI]		= {0, 0, 4},
-	[MDP_COMP_TYPE_EXTO]		= {0, 0, 4},
-	[MDP_COMP_TYPE_DL_PATH1]	= {2, 2, 1},
-	[MDP_COMP_TYPE_DL_PATH2]	= {2, 4, 1},
-};
-
-static int mdp_comp_get_id(enum mdp_comp_type type, u32 alias_id)
+static int mdp_comp_get_id(struct mdp_dev *mdp, enum mdp_comp_type type, u32 alias_id)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(mdp_comp_matches); i++)
-		if (mdp_comp_matches[i].type == type &&
-		    mdp_comp_matches[i].alias_id == alias_id)
+	for (i = 0; i < mdp->mdp_data->comp_data_len; i++)
+		if (mdp->mdp_data->comp_data[i].match.type == type &&
+		    mdp->mdp_data->comp_data[i].match.alias_id == alias_id)
 			return i;
 	return -ENODEV;
 }
@@ -1028,7 +1026,7 @@ void mdp_comp_clocks_off(struct device *dev, struct mdp_comp *comps, int num)
 		mdp_comp_clock_off(dev, &comps[i]);
 }
 
-static int mdp_get_subsys_id(struct device *dev, struct device_node *node,
+static int mdp_get_subsys_id(struct mdp_dev *mdp, struct device *dev, struct device_node *node,
 			     struct mdp_comp *comp)
 {
 	struct platform_device *comp_pdev;
@@ -1047,7 +1045,7 @@ static int mdp_get_subsys_id(struct device *dev, struct device_node *node,
 		return -ENODEV;
 	}
 
-	index = mdp_comp_dt_info[comp->type].dts_reg_ofst;
+	index = mdp->mdp_data->comp_info[comp->type].dts_reg_ofst;
 	ret = cmdq_dev_get_client_reg(&comp_pdev->dev, &cmdq_reg, index);
 	if (ret != 0) {
 		dev_err(&comp_pdev->dev, "cmdq_dev_get_subsys fail!\n");
@@ -1065,7 +1063,7 @@ static void __mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
 {
 	struct resource res;
 	phys_addr_t base;
-	int index = mdp_comp_dt_info[comp->type].dts_reg_ofst;
+	int index = mdp->mdp_data->comp_info[comp->type].dts_reg_ofst;
 
 	if (of_address_to_resource(node, index, &res) < 0)
 		base = 0L;
@@ -1078,7 +1076,7 @@ static void __mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
 }
 
 static int mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
-			 struct mdp_comp *comp, enum mtk_mdp_comp_id id)
+			 struct mdp_comp *comp, enum mdp_comp_id id)
 {
 	struct device *dev = &mdp->pdev->dev;
 	int clk_num;
@@ -1090,14 +1088,14 @@ static int mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
 		return -EINVAL;
 	}
 
-	comp->type = mdp_comp_matches[id].type;
+	comp->type = mdp->mdp_data->comp_data[id].match.type;
 	comp->id = id;
-	comp->alias_id = mdp_comp_matches[id].alias_id;
+	comp->alias_id = mdp->mdp_data->comp_data[id].match.alias_id;
 	comp->ops = mdp_comp_ops[comp->type];
 	__mdp_comp_init(mdp, node, comp);
 
-	clk_num = mdp_comp_dt_info[comp->type].clk_num;
-	clk_ofst = mdp_comp_dt_info[comp->type].clk_ofst;
+	clk_num = mdp->mdp_data->comp_info[comp->type].clk_num;
+	clk_ofst = mdp->mdp_data->comp_info[comp->type].clk_ofst;
 
 	for (i = 0; i < clk_num; i++) {
 		comp->clks[i] = of_clk_get(node, i + clk_ofst);
@@ -1105,14 +1103,14 @@ static int mdp_comp_init(struct mdp_dev *mdp, struct device_node *node,
 			break;
 	}
 
-	mdp_get_subsys_id(dev, node, comp);
+	mdp_get_subsys_id(mdp, dev, node, comp);
 
 	return 0;
 }
 
 static struct mdp_comp *mdp_comp_create(struct mdp_dev *mdp,
 					struct device_node *node,
-					enum mtk_mdp_comp_id id)
+					enum mdp_comp_id id)
 {
 	struct device *dev = &mdp->pdev->dev;
 	struct mdp_comp *comp;
@@ -1148,7 +1146,7 @@ static int mdp_sub_comps_create(struct mdp_dev *mdp, struct device_node *node)
 
 	of_property_for_each_string(node, "mdp3-comps", prop, name) {
 		const struct of_device_id *matches = mdp_sub_comp_dt_ids;
-		enum mdp_comp_type type = MDP_COMP_NONE;
+		enum mdp_comp_type type = MDP_COMP_INVALID;
 		u32 alias_id;
 		int id, ret;
 		struct mdp_comp *comp;
@@ -1168,7 +1166,7 @@ static int mdp_sub_comps_create(struct mdp_dev *mdp, struct device_node *node)
 			return ret;
 		}
 
-		id = mdp_comp_get_id(type, alias_id);
+		id = mdp_comp_get_id(mdp, type, alias_id);
 		if (id < 0) {
 			dev_err(dev, "Failed to get comp id: %s (%d, %d)\n",
 				name, type, alias_id);
@@ -1197,8 +1195,8 @@ void mdp_component_deinit(struct mdp_dev *mdp)
 {
 	int i;
 
-	for (i = 0; i < MDP_PIPE_MAX; i++)
-		mtk_mutex_put(mdp->mdp_mutex[i]);
+	for (i = 0; i < mdp->mdp_data->pipe_info_len; i++)
+		mtk_mutex_put(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].pipe_id]);
 
 	for (i = 0; i < ARRAY_SIZE(mdp->comp); i++) {
 		if (mdp->comp[i]) {
@@ -1216,6 +1214,7 @@ int mdp_component_init(struct mdp_dev *mdp)
 	u32 alias_id;
 	int i, ret;
 
+	memcpy(&comp_list, mdp->mdp_data->comp_list, sizeof(struct mdp_comp_list));
 	parent = dev->of_node->parent;
 	/* Iterate over sibling MDP function blocks */
 	for_each_child_of_node(parent, node) {
@@ -1241,7 +1240,7 @@ int mdp_component_init(struct mdp_dev *mdp)
 				 node);
 			continue;
 		}
-		id = mdp_comp_get_id(type, alias_id);
+		id = mdp_comp_get_id(mdp, type, alias_id);
 		if (id < 0) {
 			dev_err(dev,
 				"Fail to get component id: type %d alias %d\n",
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
index 7b34f9c42410..02957abd12d0 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
@@ -38,31 +38,94 @@
 		(((mask) & (ofst##_MASK)) == (ofst##_MASK)) ? \
 			(0xffffffff) : (mask), ##__VA_ARGS__)
 
+#define MDP_CAMIN       get_comp_camin()
+#define MDP_CAMIN2      get_comp_camin2()
+#define MDP_RDMA0       get_comp_rdma0()
+#define MDP_RSZ1        get_comp_rsz1()
+#define MDP_MERGE2      get_comp_merge2()
+#define MDP_MERGE3      get_comp_merge3()
+
 enum mdp_comp_type {
 	MDP_COMP_TYPE_INVALID = 0,
 
+	MDP_COMP_TYPE_IMGI,
+	MDP_COMP_TYPE_WPEI,
+
 	MDP_COMP_TYPE_RDMA,
 	MDP_COMP_TYPE_RSZ,
 	MDP_COMP_TYPE_WROT,
 	MDP_COMP_TYPE_WDMA,
 	MDP_COMP_TYPE_PATH1,
 	MDP_COMP_TYPE_PATH2,
+	MDP_COMP_TYPE_SPLIT,
+	MDP_COMP_TYPE_STITCH,
+	MDP_COMP_TYPE_FG,
+	MDP_COMP_TYPE_OVL,
+	MDP_COMP_TYPE_PAD,
+	MDP_COMP_TYPE_MERGE,
 
 	MDP_COMP_TYPE_TDSHP,
 	MDP_COMP_TYPE_COLOR,
 	MDP_COMP_TYPE_DRE,
 	MDP_COMP_TYPE_CCORR,
 	MDP_COMP_TYPE_HDR,
+	MDP_COMP_TYPE_AAL,
+	MDP_COMP_TYPE_TCC,
 
-	MDP_COMP_TYPE_IMGI,
-	MDP_COMP_TYPE_WPEI,
 	MDP_COMP_TYPE_EXTO,	/* External path */
 	MDP_COMP_TYPE_DL_PATH1, /* Direct-link path1 */
 	MDP_COMP_TYPE_DL_PATH2, /* Direct-link path2 */
+	MDP_COMP_TYPE_DL_PATH3, /* Direct-link path3 */
+	MDP_COMP_TYPE_DL_PATH4, /* Direct-link path4 */
+	MDP_COMP_TYPE_DL_PATH5, /* Direct-link path5 */
+	MDP_COMP_TYPE_DL_PATH6, /* Direct-link path6 */
+	MDP_COMP_TYPE_DUMMY,
 
 	MDP_COMP_TYPE_COUNT	/* ALWAYS keep at the end */
 };
 
+enum mdp_comp_id {
+	MDP_COMP_INVALID = -1,     /* Invalid engine */
+
+	/* MT8183 Comp id */
+	/* ISP */
+	MT8183_MDP_COMP_WPEI = 0,
+	MT8183_MDP_COMP_WPEO,           /* 1 */
+	MT8183_MDP_COMP_WPEI2,          /* 2 */
+	MT8183_MDP_COMP_WPEO2,          /* 3 */
+	MT8183_MDP_COMP_ISP_IMGI,       /* 4 */
+	MT8183_MDP_COMP_ISP_IMGO,       /* 5 */
+	MT8183_MDP_COMP_ISP_IMG2O,      /* 6 */
+
+	/* IPU */
+	MT8183_MDP_COMP_IPUI,           /* 7 */
+	MT8183_MDP_COMP_IPUO,           /* 8 */
+
+	/* MDP */
+	MT8183_MDP_COMP_CAMIN,          /* 9 */
+	MT8183_MDP_COMP_CAMIN2,         /* 10 */
+	MT8183_MDP_COMP_RDMA0,          /* 11 */
+	MT8183_MDP_COMP_AAL0,           /* 12 */
+	MT8183_MDP_COMP_CCORR0,         /* 13 */
+	MT8183_MDP_COMP_RSZ0,           /* 14 */
+	MT8183_MDP_COMP_RSZ1,           /* 15 */
+	MT8183_MDP_COMP_TDSHP0,         /* 16 */
+	MT8183_MDP_COMP_COLOR0,         /* 17 */
+	MT8183_MDP_COMP_PATH0_SOUT,     /* 18 */
+	MT8183_MDP_COMP_PATH1_SOUT,     /* 19 */
+	MT8183_MDP_COMP_WROT0,          /* 20 */
+	MT8183_MDP_COMP_WDMA,           /* 21 */
+
+	/* Dummy Engine */
+	MT8183_MDP_COMP_RDMA1,          /* 22 */
+	MT8183_MDP_COMP_RSZ2,           /* 23 */
+	MT8183_MDP_COMP_TDSHP1,         /* 24 */
+	MT8183_MDP_COMP_WROT1,          /* 25 */
+	MT8183_MDP_MAX_COMP_COUNT,
+
+	MDP_MAX_COMP      /* ALWAYS keep at the end */
+};
+
 enum mdp_comp_event {
 	RDMA0_SOF,
 	RDMA0_DONE,
@@ -73,6 +136,18 @@ enum mdp_comp_event {
 	WROT0_DONE,
 	WDMA0_SOF,
 	WDMA0_DONE,
+	RDMA1_SOF,
+	RDMA2_SOF,
+	RDMA3_SOF,
+	WROT1_SOF,
+	WROT2_SOF,
+	WROT3_SOF,
+	RDMA1_FRAME_DONE,
+	RDMA2_FRAME_DONE,
+	RDMA3_FRAME_DONE,
+	WROT1_FRAME_DONE,
+	WROT2_FRAME_DONE,
+	WROT3_FRAME_DONE,
 
 	ISP_P2_0_DONE,
 	ISP_P2_1_DONE,
@@ -96,6 +171,104 @@ enum mdp_comp_event {
 	MDP_MAX_EVENT_COUNT	/* ALWAYS keep at the end */
 };
 
+enum mdp_mmsys_config_id {
+	CONFIG_VPP0_HW_DCM_1ST_DIS0,
+	CONFIG_VPP0_DL_IRELAY_WR,
+	CONFIG_VPP1_HW_DCM_1ST_DIS0,
+	CONFIG_VPP1_HW_DCM_1ST_DIS1,
+	CONFIG_VPP1_HW_DCM_2ND_DIS0,
+	CONFIG_VPP1_HW_DCM_2ND_DIS1,
+	CONFIG_SVPP2_BUF_BF_RSZ_SWITCH,
+	CONFIG_SVPP3_BUF_BF_RSZ_SWITCH,
+	MDP_MAX_CONFIG_COUNT
+};
+
+struct mdp_comp_list {
+	enum mdp_comp_id wpei;
+	enum mdp_comp_id wpeo;
+	enum mdp_comp_id wpei2;
+	enum mdp_comp_id wpeo2;
+	enum mdp_comp_id camin;
+	enum mdp_comp_id camin2;
+	enum mdp_comp_id split;
+	enum mdp_comp_id split2;
+	enum mdp_comp_id rdma0;
+	enum mdp_comp_id rdma1;
+	enum mdp_comp_id rdma2;
+	enum mdp_comp_id rdma3;
+	enum mdp_comp_id stitch;
+	enum mdp_comp_id fg0;
+	enum mdp_comp_id fg1;
+	enum mdp_comp_id fg2;
+	enum mdp_comp_id fg3;
+	enum mdp_comp_id hdr0;
+	enum mdp_comp_id hdr1;
+	enum mdp_comp_id hdr2;
+	enum mdp_comp_id hdr3;
+	enum mdp_comp_id aal0;
+	enum mdp_comp_id aal1;
+	enum mdp_comp_id aal2;
+	enum mdp_comp_id aal3;
+	enum mdp_comp_id rsz0;
+	enum mdp_comp_id rsz1;
+	enum mdp_comp_id rsz2;
+	enum mdp_comp_id rsz3;
+	enum mdp_comp_id tdshp0;
+	enum mdp_comp_id tdshp1;
+	enum mdp_comp_id tdshp2;
+	enum mdp_comp_id tdshp3;
+	enum mdp_comp_id color0;
+	enum mdp_comp_id color1;
+	enum mdp_comp_id color2;
+	enum mdp_comp_id color3;
+	enum mdp_comp_id ccorr0;
+	enum mdp_comp_id ovl0;
+	enum mdp_comp_id ovl1;
+	enum mdp_comp_id pad0;
+	enum mdp_comp_id pad1;
+	enum mdp_comp_id pad2;
+	enum mdp_comp_id pad3;
+	enum mdp_comp_id tcc0;
+	enum mdp_comp_id tcc1;
+	enum mdp_comp_id wrot0;
+	enum mdp_comp_id wrot1;
+	enum mdp_comp_id wrot2;
+	enum mdp_comp_id wrot3;
+	enum mdp_comp_id merge2;
+	enum mdp_comp_id merge3;
+	enum mdp_comp_id wdma;
+	enum mdp_comp_id vdo0dl0;
+	enum mdp_comp_id vdo1dl0;
+	enum mdp_comp_id vdo0dl1;
+	enum mdp_comp_id vdo1dl1;
+	enum mdp_comp_id path0_sout;
+	enum mdp_comp_id path1_sout;
+};
+
+struct mdp_comp_match {
+	enum mdp_comp_type	type;
+	u32			alias_id;
+	enum mtk_mdp_comp_id public_id;
+};
+
+struct mdp_mutex_info {
+	u32 mmsys_id;
+	u32 mod;
+	u32 mod2;
+};
+
+struct mdp_comp_data {
+	struct mdp_comp_match match;
+	struct mdp_mutex_info mutex;
+};
+
+/* Used to describe the item order in MDP property */
+struct mdp_comp_info {
+	u32	clk_num;
+	u32 clk_ofst;
+	u32	dts_reg_ofst;
+};
+
 struct mdp_comp_ops;
 
 struct mdp_comp {
@@ -106,7 +279,7 @@ struct mdp_comp {
 	struct clk			*clks[6];
 	struct device			*comp_dev;
 	enum mdp_comp_type		type;
-	enum mtk_mdp_comp_id		id;
+	enum mdp_comp_id		id;
 	u32				alias_id;
 	const struct mdp_comp_ops	*ops;
 };
@@ -134,6 +307,18 @@ struct mdp_comp_ops {
 
 struct mdp_dev;
 
+enum mdp_comp_id get_comp_camin(void);
+enum mdp_comp_id get_comp_camin2(void);
+enum mdp_comp_id get_comp_rdma0(void);
+enum mdp_comp_id get_comp_aal0(void);
+enum mdp_comp_id get_comp_ccorr0(void);
+enum mdp_comp_id get_comp_rsz0(void);
+enum mdp_comp_id get_comp_rsz1(void);
+enum mdp_comp_id get_comp_tdshp0(void);
+enum mdp_comp_id get_comp_color0(void);
+enum mdp_comp_id get_comp_wrot0(void);
+enum mdp_comp_id get_comp_wdma(void);
+
 int mdp_component_init(struct mdp_dev *mdp);
 void mdp_component_deinit(struct mdp_dev *mdp);
 void mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp);
@@ -144,4 +329,6 @@ int mdp_comp_ctx_init(struct mdp_dev *mdp, struct mdp_comp_ctx *ctx,
 		      const struct img_compparam *param,
 	const struct img_ipi_frameparam *frame);
 
+int mdp_get_event_idx(struct mdp_dev *mdp, enum mdp_comp_event event);
+
 #endif  /* __MTK_MDP3_COMP_H__ */
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
index 8459b0afa84c..4f7d8bc1bf24 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
@@ -26,8 +26,375 @@ static const struct mdp_platform_config mt8183_plat_cfg = {
 	.gce_event_offset		= 0,
 };
 
+static const struct mdp_comp_list mt8183_comp_list = {
+	.wpei		= MT8183_MDP_COMP_WPEI,
+	.wpeo		= MT8183_MDP_COMP_WPEO,
+	.wpei2		= MT8183_MDP_COMP_WPEI2,
+	.wpeo2		= MT8183_MDP_COMP_WPEO2,
+	.camin		= MT8183_MDP_COMP_CAMIN,
+	.camin2		= MT8183_MDP_COMP_CAMIN2,
+	.split		= MDP_COMP_INVALID,
+	.split2		= MDP_COMP_INVALID,
+	.rdma0		= MT8183_MDP_COMP_RDMA0,
+	.rdma1		= MDP_COMP_INVALID,
+	.rdma2		= MDP_COMP_INVALID,
+	.rdma3		= MDP_COMP_INVALID,
+	.stitch		= MDP_COMP_INVALID,
+	.fg0		= MDP_COMP_INVALID,
+	.fg1		= MDP_COMP_INVALID,
+	.fg2		= MDP_COMP_INVALID,
+	.fg3		= MDP_COMP_INVALID,
+	.hdr0		= MDP_COMP_INVALID,
+	.hdr1		= MDP_COMP_INVALID,
+	.hdr2		= MDP_COMP_INVALID,
+	.hdr3		= MDP_COMP_INVALID,
+	.aal0		= MT8183_MDP_COMP_AAL0,
+	.aal1		= MDP_COMP_INVALID,
+	.aal2		= MDP_COMP_INVALID,
+	.aal3		= MDP_COMP_INVALID,
+	.rsz0		= MT8183_MDP_COMP_RSZ0,
+	.rsz1		= MT8183_MDP_COMP_RSZ1,
+	.rsz2		= MDP_COMP_INVALID,
+	.rsz3		= MDP_COMP_INVALID,
+	.tdshp0		= MT8183_MDP_COMP_TDSHP0,
+	.tdshp1		= MDP_COMP_INVALID,
+	.tdshp2		= MDP_COMP_INVALID,
+	.tdshp3		= MDP_COMP_INVALID,
+	.color0		= MT8183_MDP_COMP_COLOR0,
+	.color1		= MDP_COMP_INVALID,
+	.color2		= MDP_COMP_INVALID,
+	.color3		= MDP_COMP_INVALID,
+	.ccorr0		= MT8183_MDP_COMP_CCORR0,
+	.ovl0		= MDP_COMP_INVALID,
+	.ovl1		= MDP_COMP_INVALID,
+	.pad0		= MDP_COMP_INVALID,
+	.pad1		= MDP_COMP_INVALID,
+	.pad2		= MDP_COMP_INVALID,
+	.pad3		= MDP_COMP_INVALID,
+	.tcc0		= MDP_COMP_INVALID,
+	.tcc1		= MDP_COMP_INVALID,
+	.wrot0		= MT8183_MDP_COMP_WROT0,
+	.wrot1		= MDP_COMP_INVALID,
+	.wrot2		= MDP_COMP_INVALID,
+	.wrot3		= MDP_COMP_INVALID,
+	.merge2		= MDP_COMP_INVALID,
+	.merge3		= MDP_COMP_INVALID,
+	.wdma		= MT8183_MDP_COMP_WDMA,
+	.vdo0dl0	= MDP_COMP_INVALID,
+	.vdo1dl0	= MDP_COMP_INVALID,
+	.vdo0dl1	= MDP_COMP_INVALID,
+	.vdo1dl1	= MDP_COMP_INVALID,
+	.path0_sout	= MT8183_MDP_COMP_PATH0_SOUT,
+	.path1_sout	= MT8183_MDP_COMP_PATH1_SOUT,
+};
+
+static const struct mdp_comp_data mt8183_mdp_comp_data[MT8183_MDP_MAX_COMP_COUNT] = {
+	[MT8183_MDP_COMP_WPEI] = { {MDP_COMP_TYPE_WPEI, 0, MDP_COMP_WPEI}, {0, 0, 0} },
+	[MT8183_MDP_COMP_WPEO] = { {MDP_COMP_TYPE_EXTO, 2, MDP_COMP_WPEO}, {0, 0, 0} },
+	[MT8183_MDP_COMP_WPEI2] = { {MDP_COMP_TYPE_WPEI, 1, MDP_COMP_WPEI2}, {0, 0, 0} },
+	[MT8183_MDP_COMP_WPEO2] = { {MDP_COMP_TYPE_EXTO, 3, MDP_COMP_WPEO2}, {0, 0, 0} },
+	[MT8183_MDP_COMP_ISP_IMGI] = { {MDP_COMP_TYPE_IMGI, 0, MDP_COMP_ISP_IMGI}, {0, 0, 0} },
+	[MT8183_MDP_COMP_ISP_IMGO] = { {MDP_COMP_TYPE_EXTO, 0, MDP_COMP_ISP_IMGO}, {0, 0, 0} },
+	[MT8183_MDP_COMP_ISP_IMG2O] = { {MDP_COMP_TYPE_EXTO, 1, MDP_COMP_ISP_IMG2O}, {0, 0, 0} },
+
+	[MT8183_MDP_COMP_CAMIN] = { {MDP_COMP_TYPE_DL_PATH1, 0, MDP_COMP_CAMIN}, {0, 0, 0} },
+	[MT8183_MDP_COMP_CAMIN2] = { {MDP_COMP_TYPE_DL_PATH2, 1, MDP_COMP_CAMIN2}, {0, 0, 0} },
+	[MT8183_MDP_COMP_RDMA0] = { {MDP_COMP_TYPE_RDMA, 0, MDP_COMP_RDMA0}, {0, BIT(2), 0} },
+	[MT8183_MDP_COMP_AAL0] = { {MDP_COMP_TYPE_AAL, 0, MDP_COMP_AAL0}, {0, BIT(23), 0} },
+	[MT8183_MDP_COMP_CCORR0] = { {MDP_COMP_TYPE_CCORR, 0, MDP_COMP_CCORR0}, {0, BIT(24), 0} },
+	[MT8183_MDP_COMP_RSZ0] = { {MDP_COMP_TYPE_RSZ, 0, MDP_COMP_RSZ0}, {0, BIT(4), 0} },
+	[MT8183_MDP_COMP_RSZ1] = { {MDP_COMP_TYPE_RSZ, 1, MDP_COMP_RSZ1}, {0, BIT(5), 0} },
+	[MT8183_MDP_COMP_TDSHP0] = { {MDP_COMP_TYPE_TDSHP, 0, MDP_COMP_TDSHP0}, {0, BIT(6), 0} },
+	[MT8183_MDP_COMP_PATH0_SOUT] = { {MDP_COMP_TYPE_PATH1, 0, MDP_COMP_PATH0_SOUT}, {0, 0, 0} },
+	[MT8183_MDP_COMP_PATH1_SOUT] = { {MDP_COMP_TYPE_PATH2, 1, MDP_COMP_PATH1_SOUT}, {0, 0, 0} },
+	[MT8183_MDP_COMP_WROT0] = { {MDP_COMP_TYPE_WROT, 0, MDP_COMP_WROT0}, {0, BIT(7), 0} },
+	[MT8183_MDP_COMP_WDMA] = { {MDP_COMP_TYPE_WDMA, 0, MDP_COMP_WDMA}, {0, BIT(8), 0} },
+};
+
+static const enum mdp_comp_event mt8183_mdp_event[] = {
+	RDMA0_SOF,
+	RDMA0_DONE,
+	RSZ0_SOF,
+	RSZ1_SOF,
+	TDSHP0_SOF,
+	WROT0_SOF,
+	WROT0_DONE,
+	WDMA0_SOF,
+	WDMA0_DONE,
+	ISP_P2_0_DONE,
+	ISP_P2_1_DONE,
+	ISP_P2_2_DONE,
+	ISP_P2_3_DONE,
+	ISP_P2_4_DONE,
+	ISP_P2_5_DONE,
+	ISP_P2_6_DONE,
+	ISP_P2_7_DONE,
+	ISP_P2_8_DONE,
+	ISP_P2_9_DONE,
+	ISP_P2_10_DONE,
+	ISP_P2_11_DONE,
+	ISP_P2_12_DONE,
+	ISP_P2_13_DONE,
+	ISP_P2_14_DONE,
+	WPE_DONE,
+	WPE_B_DONE
+};
+
+static const struct mdp_comp_info mt8183_comp_dt_info[] = {
+	[MDP_COMP_TYPE_RDMA]		= {2, 0, 0},
+	[MDP_COMP_TYPE_RSZ]			= {1, 0, 0},
+	[MDP_COMP_TYPE_WROT]		= {1, 0, 0},
+	[MDP_COMP_TYPE_WDMA]		= {1, 0, 0},
+	[MDP_COMP_TYPE_PATH1]		= {0, 0, 2},
+	[MDP_COMP_TYPE_PATH2]		= {0, 0, 3},
+	[MDP_COMP_TYPE_CCORR]		= {1, 0, 0},
+	[MDP_COMP_TYPE_IMGI]		= {0, 0, 2},
+	[MDP_COMP_TYPE_EXTO]		= {0, 0, 2},
+	[MDP_COMP_TYPE_DL_PATH1]	= {2, 2, 1},
+	[MDP_COMP_TYPE_DL_PATH2]	= {2, 4, 1},
+};
+
+static const struct mdp_pipe_info mt8183_pipe_info[] = {
+	{MDP_PIPE_IMGI, 0, 0},
+	{MDP_PIPE_RDMA0, 0, 1},
+	{MDP_PIPE_WPEI, 0, 2},
+	{MDP_PIPE_WPEI2, 0, 3}
+};
+
+static const struct mdp_format mt8183_formats[] = {
+	{
+		.pixelformat	= V4L2_PIX_FMT_GREY,
+		.mdp_color	= MDP_COLOR_GREY,
+		.depth		= { 8 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_RGB565X,
+		.mdp_color	= MDP_COLOR_RGB565,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_RGB565,
+		.mdp_color	= MDP_COLOR_BGR565,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_RGB24,
+		.mdp_color	= MDP_COLOR_RGB888,
+		.depth		= { 24 },
+		.row_depth	= { 24 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_BGR24,
+		.mdp_color	= MDP_COLOR_BGR888,
+		.depth		= { 24 },
+		.row_depth	= { 24 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_ABGR32,
+		.mdp_color	= MDP_COLOR_BGRA8888,
+		.depth		= { 32 },
+		.row_depth	= { 32 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_ARGB32,
+		.mdp_color	= MDP_COLOR_ARGB8888,
+		.depth		= { 32 },
+		.row_depth	= { 32 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_UYVY,
+		.mdp_color	= MDP_COLOR_UYVY,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_VYUY,
+		.mdp_color	= MDP_COLOR_VYUY,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUYV,
+		.mdp_color	= MDP_COLOR_YUYV,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVYU,
+		.mdp_color	= MDP_COLOR_YVYU,
+		.depth		= { 16 },
+		.row_depth	= { 16 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUV420,
+		.mdp_color	= MDP_COLOR_I420,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVU420,
+		.mdp_color	= MDP_COLOR_YV12,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV12,
+		.mdp_color	= MDP_COLOR_NV12,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV21,
+		.mdp_color	= MDP_COLOR_NV21,
+		.depth		= { 12 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV16,
+		.mdp_color	= MDP_COLOR_NV16,
+		.depth		= { 16 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV61,
+		.mdp_color	= MDP_COLOR_NV61,
+		.depth		= { 16 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV24,
+		.mdp_color	= MDP_COLOR_NV24,
+		.depth		= { 24 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV42,
+		.mdp_color	= MDP_COLOR_NV42,
+		.depth		= { 24 },
+		.row_depth	= { 8 },
+		.num_planes	= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_MT21C,
+		.mdp_color	= MDP_COLOR_420_BLKP_UFO,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 4,
+		.halign		= 5,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_MM21,
+		.mdp_color	= MDP_COLOR_420_BLKP,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 4,
+		.halign		= 5,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV12M,
+		.mdp_color	= MDP_COLOR_NV12,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV21M,
+		.mdp_color	= MDP_COLOR_NV21,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV16M,
+		.mdp_color	= MDP_COLOR_NV16,
+		.depth		= { 8, 8 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_NV61M,
+		.mdp_color	= MDP_COLOR_NV61,
+		.depth		= { 8, 8 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.walign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YUV420M,
+		.mdp_color	= MDP_COLOR_I420,
+		.depth		= { 8, 2, 2 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}, {
+		.pixelformat	= V4L2_PIX_FMT_YVU420M,
+		.mdp_color	= MDP_COLOR_YV12,
+		.depth		= { 8, 2, 2 },
+		.row_depth	= { 8, 4, 4 },
+		.num_planes	= 3,
+		.walign		= 1,
+		.halign		= 1,
+		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
+	}
+};
+
 static const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.mdp_cfg = &mt8183_plat_cfg,
+	.event = mt8183_mdp_event,
+	.event_len = ARRAY_SIZE(mt8183_mdp_event),
+	.comp_list = &mt8183_comp_list,
+	.comp_data = mt8183_mdp_comp_data,
+	.comp_data_len = ARRAY_SIZE(mt8183_mdp_comp_data),
+	.comp_info = mt8183_comp_dt_info,
+	.comp_info_len = ARRAY_SIZE(mt8183_comp_dt_info),
+	.pipe_info = mt8183_pipe_info,
+	.pipe_info_len = ARRAY_SIZE(mt8183_pipe_info),
+	.format = mt8183_formats,
+	.format_len = ARRAY_SIZE(mt8183_formats),
 };
 
 static const struct of_device_id mdp_of_ids[] = {
@@ -119,7 +486,7 @@ static int mdp_probe(struct platform_device *pdev)
 	struct device_node *mdp_node;
 	struct platform_device *mm_pdev;
 	u32 i, event_ofst;
-	int ret;
+	int ret, i, mutex_id;
 
 	mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
 	if (!mdp) {
@@ -143,7 +510,7 @@ static int mdp_probe(struct platform_device *pdev)
 	}
 
 	event_ofst = mdp->mdp_data->mdp_cfg->gce_event_offset;
-	for (i = RDMA0_SOF; i < MDP_MAX_EVENT_COUNT; i++) {
+	for (i = 0; i < mdp->mdp_data->event_len; i++) {
 		s32 event_id;
 
 		if (!dev)
@@ -167,9 +534,15 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_return;
 	}
 
-	for (i = 0; i < MDP_PIPE_MAX; i++) {
-		mdp->mdp_mutex[i] = mtk_mutex_mdp_get(&mm_pdev->dev, i);
-		if (!mdp->mdp_mutex[i]) {
+	for (i = 0; i < mdp->mdp_data->pipe_info_len; i++) {
+		mutex_id = mdp->mdp_data->pipe_info[i].mutex_id;
+		if (mdp->mdp_mutex[mutex_id])
+			continue;
+
+		mdp->mdp_mutex[mutex_id] =
+			mtk_mutex_mdp_get(&mm_pdev->dev, mdp->mdp_data->pipe_info[i].pipe_id);
+
+		if (!mdp->mdp_mutex[mutex_id]) {
 			ret = -ENODEV;
 			goto err_return;
 		}
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
index d996d9e71356..f6d70af80b3e 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
@@ -35,6 +35,18 @@ struct mdp_platform_config {
 
 struct mtk_mdp_driver_data {
 	const struct mdp_platform_config *mdp_cfg;
+	const enum mdp_comp_event *event;
+	unsigned int event_len;
+	const struct mdp_comp_list *comp_list;
+	const struct mdp_comp_data *comp_data;
+	unsigned int comp_data_len;
+	const struct mdp_comp_info *comp_info;
+	unsigned int comp_info_len;
+	const struct mdp_pipe_info *pipe_info;
+	unsigned int pipe_info_len;
+	const struct mdp_format *format;
+	unsigned int format_len;
+	const enum mdp_mmsys_config_id *config_table;
 };
 
 struct mdp_dev {
@@ -67,6 +79,13 @@ struct mdp_dev {
 	atomic_t				job_count;
 };
 
+struct mdp_pipe_info {
+	enum mtk_mdp_pipe_id pipe_id;
+	u32 mmsys_id;
+	u32 mutex_id;
+	u32 sof;
+};
+
 int mdp_vpu_get_locked(struct mdp_dev *mdp);
 void mdp_vpu_put_locked(struct mdp_dev *mdp);
 int mdp_vpu_register(struct mdp_dev *mdp);
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
index 584804ef7bc4..0b81f8ea16a8 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
@@ -286,7 +286,9 @@ static int mdp_m2m_querycap(struct file *file, void *fh,
 static int mdp_m2m_enum_fmt_mplane(struct file *file, void *fh,
 				   struct v4l2_fmtdesc *f)
 {
-	return mdp_enum_fmt_mplane(f);
+	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
+
+	return mdp_enum_fmt_mplane(ctx->mdp_dev, f);
 }
 
 static int mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
@@ -323,7 +325,7 @@ static int mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 
 	dev_info(dev, "[%d] type:%d", ctx->id, f->type);
 
-	fmt = mdp_try_fmt_mplane(f, &ctx->curr_param, ctx->id);
+	fmt = mdp_try_fmt_mplane(ctx->mdp_dev, f, &ctx->curr_param, ctx->id);
 	if (!fmt) {
 		dev_info(dev, "[%d] try_fmt failed, type:%d", ctx->id, f->type);
 		return -EINVAL;
@@ -370,7 +372,7 @@ static int mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
 {
 	struct mdp_m2m_ctx *ctx = fh_to_ctx(fh);
 
-	if (!mdp_try_fmt_mplane(f, &ctx->curr_param, ctx->id))
+	if (!mdp_try_fmt_mplane(ctx->mdp_dev, f, &ctx->curr_param, ctx->id))
 		return -EINVAL;
 
 	return 0;
@@ -662,7 +664,7 @@ static int mdp_m2m_open(struct file *file)
 
 	INIT_WORK(&ctx->work, mdp_m2m_worker);
 
-	ret = mdp_frameparam_init(&ctx->curr_param);
+	ret = mdp_frameparam_init(mdp, &ctx->curr_param);
 	if (ret) {
 		dev_err(dev, "Failed to initialize mdp parameter\n");
 		goto err_release_m2m_ctx;
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
index a6caefb097be..50fd5430a565 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
@@ -10,227 +10,6 @@
 #include "mtk-mdp3-core.h"
 #include "mtk-mdp3-regs.h"
 
-static const struct mdp_format mdp_formats[] = {
-	{
-		.pixelformat	= V4L2_PIX_FMT_GREY,
-		.mdp_color	= MDP_COLOR_GREY,
-		.depth		= { 8 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_RGB565X,
-		.mdp_color	= MDP_COLOR_RGB565,
-		.depth		= { 16 },
-		.row_depth	= { 16 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_RGB565,
-		.mdp_color	= MDP_COLOR_BGR565,
-		.depth		= { 16 },
-		.row_depth	= { 16 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_RGB24,
-		.mdp_color	= MDP_COLOR_RGB888,
-		.depth		= { 24 },
-		.row_depth	= { 24 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_BGR24,
-		.mdp_color	= MDP_COLOR_BGR888,
-		.depth		= { 24 },
-		.row_depth	= { 24 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_ABGR32,
-		.mdp_color	= MDP_COLOR_BGRA8888,
-		.depth		= { 32 },
-		.row_depth	= { 32 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_ARGB32,
-		.mdp_color	= MDP_COLOR_ARGB8888,
-		.depth		= { 32 },
-		.row_depth	= { 32 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_UYVY,
-		.mdp_color	= MDP_COLOR_UYVY,
-		.depth		= { 16 },
-		.row_depth	= { 16 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_VYUY,
-		.mdp_color	= MDP_COLOR_VYUY,
-		.depth		= { 16 },
-		.row_depth	= { 16 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_YUYV,
-		.mdp_color	= MDP_COLOR_YUYV,
-		.depth		= { 16 },
-		.row_depth	= { 16 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_YVYU,
-		.mdp_color	= MDP_COLOR_YVYU,
-		.depth		= { 16 },
-		.row_depth	= { 16 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_YUV420,
-		.mdp_color	= MDP_COLOR_I420,
-		.depth		= { 12 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_YVU420,
-		.mdp_color	= MDP_COLOR_YV12,
-		.depth		= { 12 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV12,
-		.mdp_color	= MDP_COLOR_NV12,
-		.depth		= { 12 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV21,
-		.mdp_color	= MDP_COLOR_NV21,
-		.depth		= { 12 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV16,
-		.mdp_color	= MDP_COLOR_NV16,
-		.depth		= { 16 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV61,
-		.mdp_color	= MDP_COLOR_NV61,
-		.depth		= { 16 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV24,
-		.mdp_color	= MDP_COLOR_NV24,
-		.depth		= { 24 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV42,
-		.mdp_color	= MDP_COLOR_NV42,
-		.depth		= { 24 },
-		.row_depth	= { 8 },
-		.num_planes	= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_MT21C,
-		.mdp_color	= MDP_COLOR_420_BLK_UFO,
-		.depth		= { 8, 4 },
-		.row_depth	= { 8, 8 },
-		.num_planes	= 2,
-		.walign		= 4,
-		.halign		= 5,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_MM21,
-		.mdp_color	= MDP_COLOR_420_BLK,
-		.depth		= { 8, 4 },
-		.row_depth	= { 8, 8 },
-		.num_planes	= 2,
-		.walign		= 4,
-		.halign		= 5,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV12M,
-		.mdp_color	= MDP_COLOR_NV12,
-		.depth		= { 8, 4 },
-		.row_depth	= { 8, 8 },
-		.num_planes	= 2,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV21M,
-		.mdp_color	= MDP_COLOR_NV21,
-		.depth		= { 8, 4 },
-		.row_depth	= { 8, 8 },
-		.num_planes	= 2,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV16M,
-		.mdp_color	= MDP_COLOR_NV16,
-		.depth		= { 8, 8 },
-		.row_depth	= { 8, 8 },
-		.num_planes	= 2,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_NV61M,
-		.mdp_color	= MDP_COLOR_NV61,
-		.depth		= { 8, 8 },
-		.row_depth	= { 8, 8 },
-		.num_planes	= 2,
-		.walign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_YUV420M,
-		.mdp_color	= MDP_COLOR_I420,
-		.depth		= { 8, 2, 2 },
-		.row_depth	= { 8, 4, 4 },
-		.num_planes	= 3,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}, {
-		.pixelformat	= V4L2_PIX_FMT_YVU420M,
-		.mdp_color	= MDP_COLOR_YV12,
-		.depth		= { 8, 2, 2 },
-		.row_depth	= { 8, 4, 4 },
-		.num_planes	= 3,
-		.walign		= 1,
-		.halign		= 1,
-		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
-	}
-};
-
 static const struct mdp_limit mdp_def_limit = {
 	.out_limit = {
 		.wmin	= 16,
@@ -250,32 +29,34 @@ static const struct mdp_limit mdp_def_limit = {
 	.v_scale_down_max = 128,
 };
 
-static const struct mdp_format *mdp_find_fmt(u32 pixelformat, u32 type)
+static const struct mdp_format *mdp_find_fmt(const struct mtk_mdp_driver_data *mdp_data,
+					     u32 pixelformat, u32 type)
 {
 	u32 i, flag;
 
 	flag = V4L2_TYPE_IS_OUTPUT(type) ? MDP_FMT_FLAG_OUTPUT :
 					MDP_FMT_FLAG_CAPTURE;
-	for (i = 0; i < ARRAY_SIZE(mdp_formats); ++i) {
-		if (!(mdp_formats[i].flags & flag))
+	for (i = 0; i < mdp_data->format_len; ++i) {
+		if (!(mdp_data->format[i].flags & flag))
 			continue;
-		if (mdp_formats[i].pixelformat == pixelformat)
-			return &mdp_formats[i];
+		if (mdp_data->format[i].pixelformat == pixelformat)
+			return &mdp_data->format[i];
 	}
 	return NULL;
 }
 
-static const struct mdp_format *mdp_find_fmt_by_index(u32 index, u32 type)
+static const struct mdp_format *mdp_find_fmt_by_index(const struct mtk_mdp_driver_data *mdp_data,
+						      u32 index, u32 type)
 {
 	u32 i, flag, num = 0;
 
 	flag = V4L2_TYPE_IS_OUTPUT(type) ? MDP_FMT_FLAG_OUTPUT :
 					MDP_FMT_FLAG_CAPTURE;
-	for (i = 0; i < ARRAY_SIZE(mdp_formats); ++i) {
-		if (!(mdp_formats[i].flags & flag))
+	for (i = 0; i < mdp_data->format_len; ++i) {
+		if (!(mdp_data->format[i].flags & flag))
 			continue;
 		if (index == num)
-			return &mdp_formats[i];
+			return &mdp_data->format[i];
 		num++;
 	}
 	return NULL;
@@ -352,14 +133,14 @@ static int mdp_clamp_align(s32 *x, int min, int max, unsigned int align)
 	return 0;
 }
 
-int mdp_enum_fmt_mplane(struct v4l2_fmtdesc *f)
+int mdp_enum_fmt_mplane(struct mdp_dev *mdp, struct v4l2_fmtdesc *f)
 {
 	const struct mdp_format *fmt;
 
 	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type))
 		return -EINVAL;
 
-	fmt = mdp_find_fmt_by_index(f->index, f->type);
+	fmt = mdp_find_fmt_by_index(mdp->mdp_data, f->index, f->type);
 	if (!fmt)
 		return -EINVAL;
 
@@ -368,7 +149,8 @@ int mdp_enum_fmt_mplane(struct v4l2_fmtdesc *f)
 	return 0;
 }
 
-const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
+const struct mdp_format *mdp_try_fmt_mplane(struct mdp_dev *mdp,
+					    struct v4l2_format *f,
 					    struct mdp_frameparam *param,
 					    u32 ctx_id)
 {
@@ -381,9 +163,9 @@ const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
 	if (!V4L2_TYPE_IS_MULTIPLANAR(f->type))
 		return NULL;
 
-	fmt = mdp_find_fmt(pix_mp->pixelformat, f->type);
+	fmt = mdp_find_fmt(mdp->mdp_data, pix_mp->pixelformat, f->type);
 	if (!fmt)
-		fmt = mdp_find_fmt_by_index(0, f->type);
+		fmt = mdp_find_fmt_by_index(mdp->mdp_data, 0, f->type);
 	if (!fmt) {
 		pr_err("[%s:%d] pixelformat %c%c%c%c invalid", __func__, ctx_id,
 		       (pix_mp->pixelformat & 0xff),
@@ -709,7 +491,7 @@ void mdp_set_dst_config(struct img_output *out,
 	/* out->flags |= ; */	/* sharpness, dither */
 }
 
-int mdp_frameparam_init(struct mdp_frameparam *param)
+int mdp_frameparam_init(struct mdp_dev *mdp, struct mdp_frameparam *param)
 {
 	struct mdp_frame *frame;
 
@@ -723,7 +505,7 @@ int mdp_frameparam_init(struct mdp_frameparam *param)
 
 	frame = &param->output;
 	frame->format.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
-	frame->mdp_fmt = mdp_try_fmt_mplane(&frame->format, param, 0);
+	frame->mdp_fmt = mdp_try_fmt_mplane(mdp, &frame->format, param, 0);
 	frame->ycbcr_prof =
 		mdp_map_ycbcr_prof_mplane(&frame->format,
 					  frame->mdp_fmt->mdp_color);
@@ -732,7 +514,7 @@ int mdp_frameparam_init(struct mdp_frameparam *param)
 	param->num_captures = 1;
 	frame = &param->captures[0];
 	frame->format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	frame->mdp_fmt = mdp_try_fmt_mplane(&frame->format, param, 0);
+	frame->mdp_fmt = mdp_try_fmt_mplane(mdp, &frame->format, param, 0);
 	frame->ycbcr_prof =
 		mdp_map_ycbcr_prof_mplane(&frame->format,
 					  frame->mdp_fmt->mdp_color);
@@ -744,3 +526,4 @@ int mdp_frameparam_init(struct mdp_frameparam *param)
 
 	return 0;
 }
+
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
index b3aaef8eb7eb..4b6afaaa8645 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
@@ -18,14 +18,17 @@
  * V-subsample: 0, 1
  * Color group: 0-RGB, 1-YUV, 2-raw
  */
-#define MDP_COLOR(PACKED, LOOSE, VIDEO, PLANE, HF, VF, BITS, GROUP, SWAP, ID)\
-	(((PACKED) << 27) | ((LOOSE) << 26) | ((VIDEO) << 23) |\
+#define MDP_COLOR(COMPRESS, PACKED, LOOSE, VIDEO, PLANE, HF, VF, BITS, GROUP, SWAP, ID)\
+	(((COMPRESS) << 29) | ((PACKED) << 28) | ((LOOSE) << 27) | ((VIDEO) << 23) |\
 	 ((PLANE) << 21) | ((HF) << 19) | ((VF) << 18) | ((BITS) << 8) |\
 	 ((GROUP) << 6) | ((SWAP) << 5) | ((ID) << 0))
 
-#define MDP_COLOR_IS_10BIT_PACKED(c)    ((0x08000000 & (c)) >> 27)
-#define MDP_COLOR_IS_10BIT_LOOSE(c)    (((0x0c000000 & (c)) >> 26) == 1)
-#define MDP_COLOR_IS_10BIT_TILE(c)     (((0x0c000000 & (c)) >> 26) == 3)
+#define MDP_COLOR_IS_HYFBC_COMPRESS(c)  ((0x40000000 & (c)) >> 30)
+#define MDP_COLOR_IS_COMPRESS(c)        ((0x20000000 & (c)) >> 29)
+#define MDP_COLOR_IS_10BIT_PACKED(c)    ((0x10000000 & (c)) >> 28)
+#define MDP_COLOR_IS_10BIT_LOOSE(c)     (((0x18000000 & (c)) >> 27) == 1)
+#define MDP_COLOR_IS_10BIT_TILE(c)      (((0x18000000 & (c)) >> 27) == 3)
+#define MDP_COLOR_IS_10BIT_JUMP(c)      ((0x04000000 & (c)) >> 26)
 #define MDP_COLOR_IS_UFP(c)             ((0x02000000 & (c)) >> 25)
 #define MDP_COLOR_IS_INTERLACED(c)      ((0x01000000 & (c)) >> 24)
 #define MDP_COLOR_IS_BLOCK_MODE(c)      ((0x00800000 & (c)) >> 23)
@@ -42,148 +45,120 @@
 #define MDP_COLOR_IS_YUV(c)		(MDP_COLOR_GET_GROUP(c) == 1)
 #define MDP_COLOR_IS_UV_COPLANE(c)	((MDP_COLOR_GET_PLANE_COUNT(c) == 2) &&\
 					 MDP_COLOR_IS_YUV(c))
+#define MDP_COLOR_IS_10BIT(c)            (((0x18000000 & (c)) >> 27) != 0)
+#define MDP_COLOR_GET_AUO_MODE(c)        (MDP_COLOR_IS_10BIT_JUMP(c))
 
 enum mdp_color {
 	MDP_COLOR_UNKNOWN	= 0,
 
-	//MDP_COLOR_FULLG8,
-	MDP_COLOR_FULLG8_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 21),
-	MDP_COLOR_FULLG8_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1,  8, 2,  0, 21),
-	MDP_COLOR_FULLG8_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0,  8, 2,  0, 21),
-	MDP_COLOR_FULLG8_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1,  8, 2,  0, 21),
-	MDP_COLOR_FULLG8	= MDP_COLOR_FULLG8_BGGR,
-
-	//MDP_COLOR_FULLG10,
-	MDP_COLOR_FULLG10_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 21),
-	MDP_COLOR_FULLG10_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 10, 2,  0, 21),
-	MDP_COLOR_FULLG10_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 10, 2,  0, 21),
-	MDP_COLOR_FULLG10_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 10, 2,  0, 21),
-	MDP_COLOR_FULLG10	= MDP_COLOR_FULLG10_BGGR,
-
-	//MDP_COLOR_FULLG12,
-	MDP_COLOR_FULLG12_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 21),
-	MDP_COLOR_FULLG12_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 12, 2,  0, 21),
-	MDP_COLOR_FULLG12_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 12, 2,  0, 21),
-	MDP_COLOR_FULLG12_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 12, 2,  0, 21),
-	MDP_COLOR_FULLG12	= MDP_COLOR_FULLG12_BGGR,
-
-	//MDP_COLOR_FULLG14,
-	MDP_COLOR_FULLG14_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 21),
-	MDP_COLOR_FULLG14_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 14, 2,  0, 21),
-	MDP_COLOR_FULLG14_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 14, 2,  0, 21),
-	MDP_COLOR_FULLG14_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 14, 2,  0, 21),
-	MDP_COLOR_FULLG14	= MDP_COLOR_FULLG14_BGGR,
-
-	MDP_COLOR_UFO10		= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 24),
-
-	//MDP_COLOR_BAYER8,
-	MDP_COLOR_BAYER8_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 20),
-	MDP_COLOR_BAYER8_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1,  8, 2,  0, 20),
-	MDP_COLOR_BAYER8_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0,  8, 2,  0, 20),
-	MDP_COLOR_BAYER8_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1,  8, 2,  0, 20),
-	MDP_COLOR_BAYER8	= MDP_COLOR_BAYER8_BGGR,
-
-	//MDP_COLOR_BAYER10,
-	MDP_COLOR_BAYER10_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 20),
-	MDP_COLOR_BAYER10_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 10, 2,  0, 20),
-	MDP_COLOR_BAYER10_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 10, 2,  0, 20),
-	MDP_COLOR_BAYER10_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 10, 2,  0, 20),
-	MDP_COLOR_BAYER10	= MDP_COLOR_BAYER10_BGGR,
-
-	//MDP_COLOR_BAYER12,
-	MDP_COLOR_BAYER12_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 20),
-	MDP_COLOR_BAYER12_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 12, 2,  0, 20),
-	MDP_COLOR_BAYER12_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 12, 2,  0, 20),
-	MDP_COLOR_BAYER12_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 12, 2,  0, 20),
-	MDP_COLOR_BAYER12	= MDP_COLOR_BAYER12_BGGR,
-
-	//MDP_COLOR_BAYER14,
-	MDP_COLOR_BAYER14_RGGB	= MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 20),
-	MDP_COLOR_BAYER14_GRBG	= MDP_COLOR(0, 0, 0, 1, 0, 1, 14, 2,  0, 20),
-	MDP_COLOR_BAYER14_GBRG	= MDP_COLOR(0, 0, 0, 1, 1, 0, 14, 2,  0, 20),
-	MDP_COLOR_BAYER14_BGGR	= MDP_COLOR(0, 0, 0, 1, 1, 1, 14, 2,  0, 20),
-	MDP_COLOR_BAYER14	= MDP_COLOR_BAYER14_BGGR,
-
-	MDP_COLOR_RGB48		= MDP_COLOR(0, 0, 0, 1, 0, 0, 48, 0,  0, 23),
-	/* For bayer+mono raw-16 */
-	MDP_COLOR_RGB565_RAW	= MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 2,  0, 0),
-
-	MDP_COLOR_BAYER8_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 2,  0, 22),
-	MDP_COLOR_BAYER10_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0, 10, 2,  0, 22),
-	MDP_COLOR_BAYER12_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0, 12, 2,  0, 22),
-	MDP_COLOR_BAYER14_UNPAK	= MDP_COLOR(0, 0, 0, 1, 0, 0, 14, 2,  0, 22),
-
-	/* Unified formats */
-	MDP_COLOR_GREY		= MDP_COLOR(0, 0, 0, 1, 0, 0,  8, 1,  0, 7),
-
-	MDP_COLOR_RGB565	= MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 0,  0, 0),
-	MDP_COLOR_BGR565	= MDP_COLOR(0, 0, 0, 1, 0, 0, 16, 0,  1, 0),
-	MDP_COLOR_RGB888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 24, 0,  1, 1),
-	MDP_COLOR_BGR888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 24, 0,  0, 1),
-	MDP_COLOR_RGBA8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  1, 2),
-	MDP_COLOR_BGRA8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  0, 2),
-	MDP_COLOR_ARGB8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  1, 3),
-	MDP_COLOR_ABGR8888	= MDP_COLOR(0, 0, 0, 1, 0, 0, 32, 0,  0, 3),
-
-	MDP_COLOR_UYVY		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  0, 4),
-	MDP_COLOR_VYUY		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  1, 4),
-	MDP_COLOR_YUYV		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  0, 5),
-	MDP_COLOR_YVYU		= MDP_COLOR(0, 0, 0, 1, 1, 0, 16, 1,  1, 5),
-
-	MDP_COLOR_I420		= MDP_COLOR(0, 0, 0, 3, 1, 1,  8, 1,  0, 8),
-	MDP_COLOR_YV12		= MDP_COLOR(0, 0, 0, 3, 1, 1,  8, 1,  1, 8),
-	MDP_COLOR_I422		= MDP_COLOR(0, 0, 0, 3, 1, 0,  8, 1,  0, 9),
-	MDP_COLOR_YV16		= MDP_COLOR(0, 0, 0, 3, 1, 0,  8, 1,  1, 9),
-	MDP_COLOR_I444		= MDP_COLOR(0, 0, 0, 3, 0, 0,  8, 1,  0, 10),
-	MDP_COLOR_YV24		= MDP_COLOR(0, 0, 0, 3, 0, 0,  8, 1,  1, 10),
-
-	MDP_COLOR_NV12		= MDP_COLOR(0, 0, 0, 2, 1, 1,  8, 1,  0, 12),
-	MDP_COLOR_NV21		= MDP_COLOR(0, 0, 0, 2, 1, 1,  8, 1,  1, 12),
-	MDP_COLOR_NV16		= MDP_COLOR(0, 0, 0, 2, 1, 0,  8, 1,  0, 13),
-	MDP_COLOR_NV61		= MDP_COLOR(0, 0, 0, 2, 1, 0,  8, 1,  1, 13),
-	MDP_COLOR_NV24		= MDP_COLOR(0, 0, 0, 2, 0, 0,  8, 1,  0, 14),
-	MDP_COLOR_NV42		= MDP_COLOR(0, 0, 0, 2, 0, 0,  8, 1,  1, 14),
-
-	/* Mediatek proprietary formats */
-	/* UFO encoded block mode */
-	MDP_COLOR_420_BLK_UFO	= MDP_COLOR(0, 0, 5, 2, 1, 1, 256, 1, 0, 12),
-	/* Block mode */
-	MDP_COLOR_420_BLK	= MDP_COLOR(0, 0, 1, 2, 1, 1, 256, 1, 0, 12),
-	/* Block mode + field mode */
-	MDP_COLOR_420_BLKI	= MDP_COLOR(0, 0, 3, 2, 1, 1, 256, 1, 0, 12),
-	/* Block mode */
-	MDP_COLOR_422_BLK	= MDP_COLOR(0, 0, 1, 1, 1, 0, 512, 1, 0, 4),
-
-	MDP_COLOR_IYU2		= MDP_COLOR(0, 0, 0, 1, 0, 0, 24,  1, 0, 25),
-	MDP_COLOR_YUV444	= MDP_COLOR(0, 0, 0, 1, 0, 0, 24,  1, 0, 30),
-
-	/* Packed 10-bit formats */
-	MDP_COLOR_RGBA1010102	= MDP_COLOR(1, 0, 0, 1, 0, 0, 32,  0, 1, 2),
-	MDP_COLOR_BGRA1010102	= MDP_COLOR(1, 0, 0, 1, 0, 0, 32,  0, 0, 2),
-	/* Packed 10-bit UYVY */
-	MDP_COLOR_UYVY_10P	= MDP_COLOR(1, 0, 0, 1, 1, 0, 20,  1, 0, 4),
-	/* Packed 10-bit NV21 */
-	MDP_COLOR_NV21_10P	= MDP_COLOR(1, 0, 0, 2, 1, 1, 10,  1, 1, 12),
-	/* 10-bit block mode */
-	MDP_COLOR_420_BLK_10_H	= MDP_COLOR(1, 0, 1, 2, 1, 1, 320, 1, 0, 12),
-	/* 10-bit HEVC tile mode */
-	MDP_COLOR_420_BLK_10_V	= MDP_COLOR(1, 1, 1, 2, 1, 1, 320, 1, 0, 12),
-	/* UFO encoded 10-bit block mode */
-	MDP_COLOR_420_BLK_U10_H	= MDP_COLOR(1, 0, 5, 2, 1, 1, 320, 1, 0, 12),
-	/* UFO encoded 10-bit HEVC tile mode */
-	MDP_COLOR_420_BLK_U10_V	= MDP_COLOR(1, 1, 5, 2, 1, 1, 320, 1, 0, 12),
-
-	/* Loose 10-bit formats */
-	MDP_COLOR_UYVY_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 0, 4),
-	MDP_COLOR_VYUY_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 1, 4),
-	MDP_COLOR_YUYV_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 0, 5),
-	MDP_COLOR_YVYU_10L	= MDP_COLOR(0, 1, 0, 1, 1, 0, 20,  1, 1, 5),
-	MDP_COLOR_NV12_10L	= MDP_COLOR(0, 1, 0, 2, 1, 1, 10,  1, 0, 12),
-	MDP_COLOR_NV21_10L	= MDP_COLOR(0, 1, 0, 2, 1, 1, 10,  1, 1, 12),
-	MDP_COLOR_NV16_10L	= MDP_COLOR(0, 1, 0, 2, 1, 0, 10,  1, 0, 13),
-	MDP_COLOR_NV61_10L	= MDP_COLOR(0, 1, 0, 2, 1, 0, 10,  1, 1, 13),
-	MDP_COLOR_YV12_10L	= MDP_COLOR(0, 1, 0, 3, 1, 1, 10,  1, 1, 8),
-	MDP_COLOR_I420_10L	= MDP_COLOR(0, 1, 0, 3, 1, 1, 10,  1, 0, 8),
+	// Unified format
+	MDP_COLOR_GREY           = MDP_COLOR(0, 0, 0, 0, 1, 0, 0,  8, 1,  0, 7),
+
+	MDP_COLOR_RGB565         = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 16, 0,  0, 0),
+	MDP_COLOR_BGR565         = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 16, 0,  1, 0),
+	MDP_COLOR_RGB888         = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24, 0,  1, 1),
+	MDP_COLOR_BGR888         = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24, 0,  0, 1),
+	MDP_COLOR_RGBA8888       = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  1, 2),
+	MDP_COLOR_BGRA8888       = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  0, 2),
+	MDP_COLOR_ARGB8888       = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  1, 3),
+	MDP_COLOR_ABGR8888       = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 32, 0,  0, 3),
+
+	MDP_COLOR_UYVY           = MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  0, 4),
+	MDP_COLOR_VYUY           = MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  1, 4),
+	MDP_COLOR_YUYV           = MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  0, 5),
+	MDP_COLOR_YVYU           = MDP_COLOR(0, 0, 0, 0, 1, 1, 0, 16, 1,  1, 5),
+
+	MDP_COLOR_I420           = MDP_COLOR(0, 0, 0, 0, 3, 1, 1,  8, 1,  0, 8),
+	MDP_COLOR_YV12           = MDP_COLOR(0, 0, 0, 0, 3, 1, 1,  8, 1,  1, 8),
+	MDP_COLOR_I422           = MDP_COLOR(0, 0, 0, 0, 3, 1, 0,  8, 1,  0, 9),
+	MDP_COLOR_YV16           = MDP_COLOR(0, 0, 0, 0, 3, 1, 0,  8, 1,  1, 9),
+	MDP_COLOR_I444           = MDP_COLOR(0, 0, 0, 0, 3, 0, 0,  8, 1,  0, 10),
+	MDP_COLOR_YV24           = MDP_COLOR(0, 0, 0, 0, 3, 0, 0,  8, 1,  1, 10),
+
+	MDP_COLOR_NV12           = MDP_COLOR(0, 0, 0, 0, 2, 1, 1,  8, 1,  0, 12),
+	MDP_COLOR_NV21           = MDP_COLOR(0, 0, 0, 0, 2, 1, 1,  8, 1,  1, 12),
+	MDP_COLOR_NV16           = MDP_COLOR(0, 0, 0, 0, 2, 1, 0,  8, 1,  0, 13),
+	MDP_COLOR_NV61           = MDP_COLOR(0, 0, 0, 0, 2, 1, 0,  8, 1,  1, 13),
+	MDP_COLOR_NV24           = MDP_COLOR(0, 0, 0, 0, 2, 0, 0,  8, 1,  0, 14),
+	MDP_COLOR_NV42           = MDP_COLOR(0, 0, 0, 0, 2, 0, 0,  8, 1,  1, 14),
+
+	// Mediatek proprietary format
+	//Frame mode + Block mode + UFO
+	MDP_COLOR_420_BLKP_UFO   = MDP_COLOR(0, 0, 0, 5, 2, 1, 1, 256, 1, 0, 12),
+	//Frame mode + Block mode + UFO AUO
+	MDP_COLOR_420_BLKP_UFO_AUO   = MDP_COLOR(0, 0, 0, 13, 2, 1, 1, 256, 1, 0, 12),
+	//Frame mode + Block mode
+	MDP_COLOR_420_BLKP       = MDP_COLOR(0, 0, 0, 1, 2, 1, 1, 256, 1, 0, 12),
+	//Field mode + Block mode
+	MDP_COLOR_420_BLKI       = MDP_COLOR(0, 0, 0, 3, 2, 1, 1, 256, 1, 0, 12),
+	//Frame mode
+	MDP_COLOR_422_BLKP       = MDP_COLOR(0, 0, 0, 1, 1, 1, 0, 512, 1, 0, 4),
+
+	MDP_COLOR_IYU2           = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24,  1, 0, 25),
+	MDP_COLOR_YUV444         = MDP_COLOR(0, 0, 0, 0, 1, 0, 0, 24,  1, 0, 30),
+
+	// Mediatek proprietary 10bit format
+	MDP_COLOR_RGBA1010102    = MDP_COLOR(0, 1, 0, 0, 1, 0, 0, 32,  0, 1, 2),
+	MDP_COLOR_BGRA1010102    = MDP_COLOR(0, 1, 0, 0, 1, 0, 0, 32,  0, 0, 2),
+	MDP_COLOR_ARGB1010102    = MDP_COLOR(0, 1, 0, 0, 1, 0, 0, 32,  0, 1, 3),
+	MDP_COLOR_ABGR1010102    = MDP_COLOR(0, 1, 0, 0, 1, 0, 0, 32,  0, 0, 3),
+	//Packed 10bit UYVY
+	MDP_COLOR_UYVY_10P       = MDP_COLOR(0, 1, 0, 0, 1, 1, 0, 20,  1, 0, 4),
+	//Packed 10bit NV21
+	MDP_COLOR_NV12_10P       = MDP_COLOR(0, 1, 0, 0, 2, 1, 1, 10,  1, 0, 12),
+	MDP_COLOR_NV21_10P       = MDP_COLOR(0, 1, 0, 0, 2, 1, 1, 10,  1, 1, 12),
+	//Frame mode + Block mode
+	MDP_COLOR_420_BLKP_10_H          = MDP_COLOR(0, 1, 0, 1, 2, 1, 1, 320, 1, 0, 12),
+	//Frame mode + HEVC tile mode
+	MDP_COLOR_420_BLKP_10_V          = MDP_COLOR(0, 1, 1, 1, 2, 1, 1, 320, 1, 0, 12),
+	//Frame mode + Block mode + Jump
+	MDP_COLOR_420_BLKP_10_H_JUMP     = MDP_COLOR(0, 1, 0, 9, 2, 1, 1, 320, 1, 0, 12),
+	//Frame mode + HEVC tile mode + Jump
+	MDP_COLOR_420_BLKP_10_V_JUMP     = MDP_COLOR(0, 1, 1, 9, 2, 1, 1, 320, 1, 0, 12),
+	//Frame mode + Block mode
+	MDP_COLOR_420_BLKP_UFO_10_H      = MDP_COLOR(0, 1, 0, 5, 2, 1, 1, 320, 1, 0, 12),
+	//Frame mode + HEVC tile mode
+	MDP_COLOR_420_BLKP_UFO_10_V      = MDP_COLOR(0, 1, 1, 5, 2, 1, 1, 320, 1, 0, 12),
+	//Frame mode + Block mode + Jump
+	MDP_COLOR_420_BLKP_UFO_10_H_JUMP = MDP_COLOR(0, 1, 0, 13, 2, 1, 1, 320, 1, 0, 12),
+	//Frame mode + HEVC tile mode + Jump
+	MDP_COLOR_420_BLKP_UFO_10_V_JUMP = MDP_COLOR(0, 1, 1, 13, 2, 1, 1, 320, 1, 0, 12),
+
+	// Loose 10bit format
+	MDP_COLOR_UYVY_10L       = MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 0, 4),
+	MDP_COLOR_VYUY_10L       = MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 1, 4),
+	MDP_COLOR_YUYV_10L       = MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 0, 5),
+	MDP_COLOR_YVYU_10L       = MDP_COLOR(0, 0, 1, 0, 1, 1, 0, 20,  1, 1, 5),
+	MDP_COLOR_NV12_10L       = MDP_COLOR(0, 0, 1, 0, 2, 1, 1, 16,  1, 0, 12),
+	MDP_COLOR_NV21_10L       = MDP_COLOR(0, 0, 1, 0, 2, 1, 1, 16,  1, 1, 12),
+	MDP_COLOR_NV16_10L       = MDP_COLOR(0, 0, 1, 0, 2, 1, 0, 16,  1, 0, 13),
+	MDP_COLOR_NV61_10L       = MDP_COLOR(0, 0, 1, 0, 2, 1, 0, 16,  1, 1, 13),
+	MDP_COLOR_YV12_10L       = MDP_COLOR(0, 0, 1, 0, 3, 1, 1, 16,  1, 1, 8),
+	MDP_COLOR_I420_10L       = MDP_COLOR(0, 0, 1, 0, 3, 1, 1, 16,  1, 0, 8),
+
+	MDP_COLOR_YV12_10P       = MDP_COLOR(0, 1, 0, 0, 3, 1, 1, 10,  1, 1, 8),
+	MDP_COLOR_I422_10P       = MDP_COLOR(0, 1, 0, 0, 3, 1, 0, 10,  1, 0, 9),
+	MDP_COLOR_NV16_10P       = MDP_COLOR(0, 1, 0, 0, 2, 1, 0, 10,  1, 0, 13),
+	MDP_COLOR_NV61_10P       = MDP_COLOR(0, 1, 0, 0, 2, 1, 0, 10,  1, 1, 13),
+
+	MDP_COLOR_I422_10L       = MDP_COLOR(0, 0, 1, 0, 3, 1, 0, 16,  1, 0, 9),
+
+	MDP_COLOR_RGBA8888_AFBC       = MDP_COLOR(1, 0, 0, 0, 1, 0, 0, 32, 0, 1, 2),
+	MDP_COLOR_BGRA8888_AFBC       = MDP_COLOR(1, 0, 0, 0, 1, 0, 0, 32, 0, 0, 2),
+	MDP_COLOR_ARGB8888_AFBC       = MDP_COLOR(1, 0, 0, 0, 1, 0, 0, 32, 0, 1, 3),
+	MDP_COLOR_ABGR8888_AFBC       = MDP_COLOR(1, 0, 0, 0, 1, 0, 0, 32, 0, 0, 3),
+	MDP_COLOR_RGBA1010102_AFBC    = MDP_COLOR(1, 1, 0, 0, 1, 0, 0, 32, 0, 1, 2),
+	MDP_COLOR_BGRA1010102_AFBC    = MDP_COLOR(1, 1, 0, 0, 1, 0, 0, 32, 0, 0, 2),
+	MDP_COLOR_ARGB1010102_AFBC    = MDP_COLOR(1, 1, 0, 0, 1, 0, 0, 32, 0, 1, 3),
+	MDP_COLOR_ABGR1010102_AFBC    = MDP_COLOR(1, 1, 0, 0, 1, 0, 0, 32, 0, 0, 3),
+
+	MDP_COLOR_NV12_AFBC          = MDP_COLOR(1, 0, 0, 0, 2, 1, 1,  12,  1, 0, 12),
+	MDP_COLOR_P010_AFBC          = MDP_COLOR(1, 1, 0, 0, 2, 1, 1,  10,  1, 0, 12),
+
+	MDP_COLOR_NV12_HYFBC          = MDP_COLOR(2, 0, 0, 0, 2, 1, 1,  8,  1, 0, 12),
+	MDP_COLOR_NV21_HYFBC          = MDP_COLOR(2, 0, 0, 0, 2, 1, 1,  8,  1, 1, 12),
+	MDP_COLOR_NV12_10P_HYFBC      = MDP_COLOR(2, 1, 0, 0, 2, 1, 1, 10,  1, 0, 12),
+	MDP_COLOR_NV21_10P_HYFBC      = MDP_COLOR(2, 1, 0, 0, 2, 1, 1, 10,  1, 1, 12),
 };
 
 /* Minimum Y stride that is accepted by MDP HW */
@@ -351,8 +326,9 @@ struct mdp_frameparam {
 	enum v4l2_quantization		quant;
 };
 
-int mdp_enum_fmt_mplane(struct v4l2_fmtdesc *f);
-const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
+int mdp_enum_fmt_mplane(struct mdp_dev *mdp, struct v4l2_fmtdesc *f);
+const struct mdp_format *mdp_try_fmt_mplane(struct mdp_dev *mdp,
+					    struct v4l2_format *f,
 					    struct mdp_frameparam *param,
 					    u32 ctx_id);
 enum mdp_ycbcr_profile mdp_map_ycbcr_prof_mplane(struct v4l2_format *f,
@@ -367,6 +343,6 @@ void mdp_set_src_config(struct img_input *in,
 void mdp_set_dst_config(struct img_output *out,
 			struct mdp_frame *frame, struct vb2_buffer *vb);
 
-int mdp_frameparam_init(struct mdp_frameparam *param);
+int mdp_frameparam_init(struct mdp_dev *mdp, struct mdp_frameparam *param);
 
 #endif  /* __MTK_MDP3_REGS_H__ */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
