Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5238EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 04:09:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 032B56103C
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 04:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 032B56103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aIBsVbSn5tLP7yF1hgVZr7xQX8Ahgh/NdFoKT3gJCv4=; b=iastZOlXk+kxkL
	gqL1qsFK6b4ddngf1ZSphNMLejTKEgdidbMSzbB1qseaE/Oh1gQ9mUiuRb4Bu5K+bT8oXOq0bjJH/
	y3umVHCR0UFvOLLICISH8z9lwFCjVrk+750XjzPpdUm6ULHF8vThQxccwWkHQlzZK4cwFWXwTABs4
	h4uYHDpFIz/tW1s89298EzyEvA1UdaUmipD2OPz/xISC60QMHYkXE/zBGFiU04/fqFs2nDYz8tSiF
	qx0dB1fit1XZ9rCSiX3Zl4O8mvLZLd+2w3dDGcmmg+kWLPRf5UgHnpSNTXZOZv2lKLEd3gwbj7zTq
	FbSV1/G+lJbsyvwq2lnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfwjP-006pFT-20; Thu, 28 Oct 2021 04:09:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfwj8-006pBZ-Ho; Thu, 28 Oct 2021 04:09:21 +0000
X-UUID: 974050c23d3040c6838c886677b385a6-20211027
X-UUID: 974050c23d3040c6838c886677b385a6-20211027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1735637085; Wed, 27 Oct 2021 21:09:13 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Oct 2021 21:09:12 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Oct 2021 12:09:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 28 Oct 2021 12:09:11 +0800
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
Subject: [PATCH v1] media: platform: mtk-mdp3: Revise frame change criteria
Date: Thu, 28 Oct 2021 12:09:02 +0800
Message-ID: <20211028040902.437-1-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_210918_625200_B050E994 
X-CRM114-Status: GOOD (  14.80  )
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

frame_change will trigger MDP SCP to re-calculate path and parameter.
MDP fails when it doesn't get correct parameter to process frame.
frame_change raises when size change occurs
no matter it happens in input or output frame

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
This patch is based on [1]
[1] Reconfigure SHM to improve performance
    - https://patchwork.kernel.org/project/linux-mediatek/patch/20211022092827.24631-3-roy-cw.yeh@mediatek.com/
---
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |  2 +
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    | 20 ++++----
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   | 50 +++++++++++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  8 +++
 4 files changed, 71 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
index 737082093997..0d2b86019723 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
@@ -11,6 +11,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
+#include "mtk-mdp3-regs.h"
 #include "mtk-mdp3-comp.h"
 #include "mtk-mdp3-vpu.h"
 
@@ -107,6 +108,7 @@ struct mdp_dev {
 	atomic_t				cmdq_count;
 	struct mdp_cmdq_pkt_pool		*cmdq_pool;
 	struct mdp_cmdq_pkt_pool		*cmdq_d_pool;
+	struct mdp_framechange_param		prev_image;
 };
 
 struct mdp_pipe_info {
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
index 4684bb3718d3..6cd7bd610715 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
@@ -98,8 +98,8 @@ static void mdp_m2m_worker(struct work_struct *work)
 	struct vb2_v4l2_buffer *src_vb, *dst_vb;
 	struct img_ipi_frameparam param = {0};
 	struct mdp_cmdq_param task = {0};
+	struct mdp_framechange_param cur_frame = {0};
 	enum vb2_buffer_state vb_state = VB2_BUF_STATE_ERROR;
-	static u8 prev_scenario;
 	int ret;
 
 	if (mdp_m2m_ctx_is_state_set(ctx, MDP_M2M_CTX_ERROR)) {
@@ -118,21 +118,23 @@ static void mdp_m2m_worker(struct work_struct *work)
 	mdp_set_src_config(&param.inputs[0], frame, &src_vb->vb2_buf);
 	mdp_set_scenario(ctx->mdp_dev, &param, frame);
 
-	if (prev_scenario != param.type) {
-		prev_scenario = param.type;
+	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	dst_vb = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	mdp_set_dst_config(&param.outputs[0], frame, &dst_vb->vb2_buf);
+
+	cur_frame.scenario = param.type;
+	memcpy(&cur_frame.in, &param.inputs[0], sizeof(cur_frame.in));
+	memcpy(&cur_frame.out, &param.outputs[0], sizeof(cur_frame.out));
+
+	if (mdp_get_framechange(ctx->mdp_dev, &cur_frame))
 		param.frame_change = true;
-	} else {
+	else
 		param.frame_change = (ctx->frame_count == 0) ? true : false;
-	}
 
 	if (param.frame_change)
 		dev_info(&ctx->mdp_dev->pdev->dev,
 			 "MDP Scenario: %d\n", param.type);
 
-	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-	dst_vb = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
-	mdp_set_dst_config(&param.outputs[0], frame, &dst_vb->vb2_buf);
-
 	dst_vb->vb2_buf.timestamp = src_vb->vb2_buf.timestamp;
 	param.timestamp = src_vb->vb2_buf.timestamp;
 
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
index 91c5e35947d3..e182d27a1c3f 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
@@ -434,6 +434,56 @@ static u32 mdp_fmt_get_plane_size(const struct mdp_format *fmt,
 	return 0;
 }
 
+int mdp_get_framechange(struct mdp_dev *mdp,
+			struct mdp_framechange_param *cur)
+{
+	int ret = 0;
+	struct mdp_framechange_param *prev;
+
+	prev = &mdp->prev_image;
+	if (prev->scenario != cur->scenario)
+		ret = true;
+
+	if (prev->in.buffer.format.width != cur->in.buffer.format.width ||
+	    prev->in.buffer.format.height != cur->in.buffer.format.height)
+		ret = true;
+
+	if (prev->out.buffer.format.width != cur->out.buffer.format.width ||
+	    prev->out.buffer.format.height != cur->out.buffer.format.height)
+		ret = true;
+
+	if (prev->out.crop.left != cur->out.crop.left ||
+	    prev->out.crop.top != cur->out.crop.top ||
+	    prev->out.crop.width != cur->out.crop.width ||
+	    prev->out.crop.height != cur->out.crop.height)
+		ret = true;
+
+	dev_dbg(&mdp->pdev->dev,
+		"prev[%d] [%d, %d], [%d, %d], [%d, %d, %d, %d]\n", prev->scenario,
+		prev->in.buffer.format.width,
+		prev->in.buffer.format.height,
+		prev->out.buffer.format.width,
+		prev->out.buffer.format.height,
+		prev->out.crop.left,
+		prev->out.crop.top,
+		prev->out.crop.width,
+		prev->out.crop.height);
+
+	dev_dbg(&mdp->pdev->dev,
+		"cur[%d] [%d, %d], [%d, %d], [%d, %d, %d, %d]\n", cur->scenario,
+		cur->in.buffer.format.width,
+		cur->in.buffer.format.height,
+		cur->out.buffer.format.width,
+		cur->out.buffer.format.height,
+		cur->out.crop.left,
+		cur->out.crop.top,
+		cur->out.crop.width,
+		cur->out.crop.height);
+
+	memcpy(prev, cur, sizeof(struct mdp_framechange_param));
+	return ret;
+}
+
 void mdp_set_scenario(struct mdp_dev *mdp,
 		      struct img_ipi_frameparam *param,
 		      struct mdp_frame *frame)
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
index 7979ad60ab87..2d0b3e77f959 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
@@ -329,6 +329,12 @@ struct mdp_frameparam {
 	enum v4l2_quantization		quant;
 };
 
+struct mdp_framechange_param {
+	u8 scenario;
+	struct img_input in;
+	struct img_output out;
+};
+
 int mdp_enum_fmt_mplane(struct mdp_dev *mdp, struct v4l2_fmtdesc *f);
 const struct mdp_format *mdp_try_fmt_mplane(struct mdp_dev *mdp,
 					    struct v4l2_format *f,
@@ -341,6 +347,8 @@ int mdp_try_crop(struct v4l2_rect *r, const struct v4l2_selection *s,
 int mdp_check_scaling_ratio(const struct v4l2_rect *crop,
 			    const struct v4l2_rect *compose, s32 rotation,
 	const struct mdp_limit *limit);
+int mdp_get_framechange(struct mdp_dev *mdp,
+			struct mdp_framechange_param *cur);
 void mdp_set_scenario(struct mdp_dev *mdp,
 		      struct img_ipi_frameparam *param,
 		      struct mdp_frame *frame);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
