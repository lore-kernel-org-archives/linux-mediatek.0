Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EF5C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 05:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKlcAbpH9U/wbF52qY7vwE1KOfg3zoozmE9WQAhD0B4=; b=aUxpvFKwnOCxeI
	l8egZsH7Lo3RBfnnp32cgcDTL5KnuqNKB9McRRxAKzuweU06K6qQWYPYfatMSTwjzrt+kX/fD27fO
	oHrIHA2IoAUdV5B52GegpJV8i+ZK2VYwXGZl5FEz+j2z/keKM69SYKd/E1ltcvOb2u4eGfFhCTZHi
	X1hdIDDBb2z9/02rOMMTgXRnbrV7byCJyzVUNMJJ1Iki/IjM6a1uOFQ+d9VQolmNIzGRwbj9mBRC/
	hoGqzrWBQB92saX2bCTLI5ReF/pt9avaYw/MT3Ew+HPdq2HlyqkbdX7ONglJ9duvjfaUp8DyO3Mxx
	SbpdhFC8d9E++Y6ITJAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9KxT-00DVrX-EJ; Mon, 17 Jan 2022 05:53:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Kx9-00DVjX-7V; Mon, 17 Jan 2022 05:53:16 +0000
X-UUID: 9fa8f31e06014f5887cfea446c2c765b-20220116
X-UUID: 9fa8f31e06014f5887cfea446c2c765b-20220116
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 911852896; Sun, 16 Jan 2022 22:53:12 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:53:10 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 17 Jan 2022 13:53:09 +0800
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
Subject: [PATCH v1 11/14] media: platform: mtk-mdp3: Revise frame change
 criteria
Date: Mon, 17 Jan 2022 13:52:51 +0800
Message-ID: <20220117055254.9777-12-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_215315_312663_003BC2B1 
X-CRM114-Status: GOOD (  13.91  )
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
MDP fails when it doesn't get correct parameters to process frame,
and it will activate by the following conditions:

1. first frame
2. Scenario changes (single/dual pipe)
3. input size changes
4. input format changes
5. output size changes (crop included)

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |  2 ++
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    | 22 +++++++++++++++----
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   | 19 ++++++++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  9 ++++++++
 4 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
index 0fb932ad3560..0eb08ce69781 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
@@ -11,6 +11,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
+#include "mtk-mdp3-regs.h"
 #include "mtk-mdp3-comp.h"
 #include "mtk-mdp3-vpu.h"
 
@@ -96,6 +97,7 @@ struct mdp_dev {
 	atomic_t				suspended;
 	atomic_t				job_count;
 	atomic_t				cmdq_count[MDP_CMDQ_NUM];
+	struct mdp_framechange_param		prev_image;
 };
 
 struct mdp_pipe_info {
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
index 72a1864d880c..9afe56882208 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
@@ -77,6 +77,7 @@ static void mdp_m2m_worker(struct work_struct *work)
 	struct vb2_v4l2_buffer *src_vb, *dst_vb;
 	struct img_ipi_frameparam param = {0};
 	struct mdp_cmdq_param task = {0};
+	struct mdp_framechange_param cur_frame = {0};
 	enum vb2_buffer_state vb_state = VB2_BUF_STATE_ERROR;
 	int ret;
 
@@ -90,20 +91,33 @@ static void mdp_m2m_worker(struct work_struct *work)
 	param.type = ctx->curr_param.type;
 	param.num_inputs = 1;
 	param.num_outputs = 1;
-	param.frame_change = (ctx->frame_count[MDP_M2M_SRC] == 0);
 
 	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	src_vb = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
 	mdp_set_src_config(&param.inputs[0], frame, &src_vb->vb2_buf);
 	mdp_set_scenario(ctx->mdp_dev, &param, frame);
-	if (param.frame_change)
-		dev_info(&ctx->mdp_dev->pdev->dev,
-			 "MDP Scenario: %d\n", param.type);
 
 	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	dst_vb = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
 	mdp_set_dst_config(&param.outputs[0], frame, &dst_vb->vb2_buf);
 
+	cur_frame.scenario = param.type;
+	cur_frame.frame_count = ctx->frame_count[MDP_M2M_SRC];
+	memcpy(&cur_frame.in, &param.inputs[0], sizeof(cur_frame.in));
+	memcpy(&cur_frame.out, &param.outputs[0], sizeof(cur_frame.out));
+
+	if (mdp_is_framechange(&ctx->mdp_dev->prev_image, &cur_frame)) {
+		memcpy(&ctx->mdp_dev->prev_image, &cur_frame,
+		       sizeof(struct mdp_framechange_param));
+		param.frame_change = true;
+	} else {
+		param.frame_change = false;
+	}
+
+	if (param.frame_change)
+		dev_dbg(&ctx->mdp_dev->pdev->dev,
+			"MDP Scenario: %d\n", param.type);
+
 	param.timestamp = src_vb->vb2_buf.timestamp;
 
 	ret = mdp_vpu_process(&ctx->vpu, &param);
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
index c0a7e3569853..ccd9c338ff49 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
@@ -429,6 +429,25 @@ static u32 mdp_fmt_get_plane_size(const struct mdp_format *fmt,
 	return 0;
 }
 
+bool mdp_is_framechange(struct mdp_framechange_param *prev,
+			struct mdp_framechange_param *cur)
+{
+	if (cur->frame_count == 0 ||
+	    prev->scenario != cur->scenario ||
+	    prev->in.buffer.format.colorformat != cur->in.buffer.format.colorformat ||
+	    prev->in.buffer.format.width != cur->in.buffer.format.width ||
+	    prev->in.buffer.format.height != cur->in.buffer.format.height ||
+	    prev->out.buffer.format.width != cur->out.buffer.format.width ||
+	    prev->out.buffer.format.height != cur->out.buffer.format.height ||
+	    prev->out.crop.left != cur->out.crop.left ||
+	    prev->out.crop.top != cur->out.crop.top ||
+	    prev->out.crop.width != cur->out.crop.width ||
+	    prev->out.crop.height != cur->out.crop.height)
+		return true;
+
+	return false;
+}
+
 void mdp_set_scenario(struct mdp_dev *mdp,
 		      struct img_ipi_frameparam *param,
 		      struct mdp_frame *frame)
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
index 3547ce10948f..436d5c899bc5 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
@@ -397,6 +397,13 @@ struct mdp_frameparam {
 	enum v4l2_quantization		quant;
 };
 
+struct mdp_framechange_param {
+	u8 scenario;
+	u32 frame_count;
+	struct img_input in;
+	struct img_output out;
+};
+
 int mdp_enum_fmt_mplane(struct v4l2_fmtdesc *f);
 const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
 					    struct mdp_frameparam *param,
@@ -408,6 +415,8 @@ int mdp_try_crop(struct mdp_m2m_ctx *ctx, struct v4l2_rect *r,
 int mdp_check_scaling_ratio(const struct v4l2_rect *crop,
 			    const struct v4l2_rect *compose, s32 rotation,
 	const struct mdp_limit *limit);
+bool mdp_is_framechange(struct mdp_framechange_param *prev,
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
