Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3FBC4320A
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 11:10:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3F0E61C12
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 11:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3F0E61C12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fpj5L9wRQz599UXdAJqpX+DvYOLThJl1gV2fDZtTv84=; b=yvYmp3AUl75lGj
	cU95mdQGZIwFOsJPMWqcoMBIF5T8vG5sivM7NoV3/KN/45k7Cw+x7EZ6wqj3HS+WOwrxJY9YsoxBP
	/kS2qnIa6DSnTvquKmzbDCHpyK5DUeva4z2xEIAnW5Vy+82cJnTnUzMgJzSFQCq6JCBWwLY3oZeWJ
	nVE3p2O2Kq7T2GFj5PC5gTOo4Yvt3qx843hUtS5w8RMnCxO1Pic3z7rklspMkubUMWw0V7ja3pJPs
	6Zzo3cP1NJx7Ltbgtlwj8UsxHdqYE0yZ7shQCq1LvRIx4Ugn0ZfcH0PbI3m7bkwL5/CfOCEpO2uJB
	R7G3ApromDdiu8/8j2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFaVz-00GqEW-5w; Mon, 16 Aug 2021 11:10:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFaVf-00Gq7B-08; Mon, 16 Aug 2021 11:10:30 +0000
X-UUID: 0a0b7429cc7643cb9216c706ac92b8c9-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=OUuZszljChHa9aGE/Jp5R7f8VHG7M9odR9mNME9SjDQ=; 
 b=ouZbpqlr72XvRH9Go9q30xEwm2h+5Yn55rXKsIPFsDlgd0/Z47mH3eL91vKoCIETShQAzHWSUt9lu4JbvS8bSnOpdYLqhVRPtWgA5qbNnc0vfXTyj2BN87vfj2+xblE5dI0LRuAHVFuE9/ViWy4Bm5Ba+TDUnv+vcbXn6P7xQS4=;
X-UUID: 0a0b7429cc7643cb9216c706ac92b8c9-20210816
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1197751747; Mon, 16 Aug 2021 04:10:25 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 04:00:47 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 19:00:45 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 19:00:44 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 9/9] media: mtk-vcodec: Add delayed worker for encode timeout
Date: Mon, 16 Aug 2021 18:59:34 +0800
Message-ID: <20210816105934.28265-10-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210816105934.28265-1-irui.wang@mediatek.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_041027_115422_436E0AA8 
X-CRM114-Status: GOOD (  21.51  )
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

When encoding timeout, a delayed timeout worker is needed because
of asynchronous encoding process, restore encoding process in
timeout worker.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 12 ++++--
 .../platform/mtk-vcodec/mtk_vcodec_enc_hw.c   | 26 +++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_enc_hw.h   |  2 +
 .../platform/mtk-vcodec/venc/venc_common_if.c | 43 +++++++++++++++++--
 4 files changed, 77 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index de8e012f1b0e..bc635436aa90 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -1340,9 +1340,15 @@ void mtk_venc_buf_done(struct mtk_vcodec_ctx *ctx, int core_id,
 		if (key_frame)
 			dst_vb2_v4l2->flags |= V4L2_BUF_FLAG_KEYFRAME;
 
-		v4l2_m2m_buf_done(src_vb2_v4l2, VB2_BUF_STATE_DONE);
-		dst_vb2_v4l2->vb2_buf.planes[0].bytesused = bs_size;
-		v4l2_m2m_buf_done(dst_vb2_v4l2, VB2_BUF_STATE_DONE);
+		if (time_out) {
+			v4l2_m2m_buf_done(src_vb2_v4l2, VB2_BUF_STATE_ERROR);
+			dst_vb2_v4l2->vb2_buf.planes[0].bytesused = 0;
+			v4l2_m2m_buf_done(dst_vb2_v4l2, VB2_BUF_STATE_ERROR);
+		} else {
+			v4l2_m2m_buf_done(src_vb2_v4l2, VB2_BUF_STATE_DONE);
+			dst_vb2_v4l2->vb2_buf.planes[0].bytesused = bs_size;
+			v4l2_m2m_buf_done(dst_vb2_v4l2, VB2_BUF_STATE_DONE);
+		}
 	}
 }
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
index 687b255c58e8..f6a5dfa6929f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
@@ -16,6 +16,28 @@
 #define VENC_PIC_FRM_TYPE	0x0010
 #define VENC_PIC_KEY_FRM	0x2
 
+static void mtk_venc_timeout_worker(struct work_struct *work)
+{
+	struct mtk_venc_comp_dev *dev = container_of(work,
+						     struct mtk_venc_comp_dev,
+						     enc_timeout_worker.work);
+
+	struct mtk_vcodec_ctx *ctx;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->master_dev->irqlock, flags);
+	ctx = dev->curr_ctx;
+
+	dev_err(&dev->plat_dev->dev, "core: %d timeout\n", dev->core_id);
+
+	mtk_venc_buf_done(ctx, dev->core_id, 0, 1, 0);
+
+	mtk_vcodec_enc_clock_off(dev->master_dev, dev->core_id);
+	dev->curr_ctx = NULL;
+	spin_unlock_irqrestore(&dev->master_dev->irqlock, flags);
+
+	mtk_venc_unlock(ctx, dev->core_id);
+}
 /* Wake up core context wait_queue */
 static void mtk_venc_comp_wake_up_ctx(struct mtk_vcodec_ctx *ctx,
 				      unsigned int hw_id)
@@ -67,6 +89,7 @@ static irqreturn_t mtk_enc_comp_irq_handler(int irq, void *priv)
 	frm_type = readl(dev->reg_base + VENC_PIC_FRM_TYPE);
 	clean_irq_status(ctx->irq_status, addr);
 	if (ctx->irq_status & MTK_VENC_IRQ_STATUS_FRM) {
+		cancel_delayed_work(&dev->enc_timeout_worker);
 		if (ctx->hdr_size != 0) {
 			bs_size += ctx->hdr_size;
 			ctx->hdr_size = 0;
@@ -182,6 +205,9 @@ static int mtk_venc_comp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, comp_dev);
 
+	INIT_DELAYED_WORK(&comp_dev->enc_timeout_worker,
+			  mtk_venc_timeout_worker);
+
 	ret = component_add(&pdev->dev, &mtk_venc_component_ops);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add component: %d\n", ret);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h
index f9ae97e252dc..e69344e38ca6 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h
@@ -19,6 +19,7 @@
  * @irq_status: venc hw irq status
  * @enc_irq: venc device irq
  * @core id: for venc core id: core#0, core#1...
+ * @enc_timeout_worker: venc timeout worker
  */
 struct mtk_venc_comp_dev {
 	struct platform_device *plat_dev;
@@ -31,6 +32,7 @@ struct mtk_venc_comp_dev {
 	unsigned int irq_status;
 	int enc_irq;
 	int core_id;
+	struct delayed_work enc_timeout_worker;
 };
 
 #endif /* _MTK_VCODEC_ENC_HW_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
index 75b4e90232ae..1aab84faadf0 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_common_if.c
@@ -10,11 +10,13 @@
 #include "../mtk_vcodec_drv.h"
 #include "../mtk_vcodec_util.h"
 #include "../mtk_vcodec_enc_hw.h"
+#include "../mtk_vcodec_enc_pm.h"
 
 static const char h264_filler_marker[] = {0x0, 0x0, 0x0, 0x1, 0xc};
 
 #define H264_FILLER_MARKER_SIZE ARRAY_SIZE(h264_filler_marker)
 #define VENC_PIC_BITSTREAM_BYTE_CNT 0x0098
+#define MTK_VENC_HW_TIMEOUT_MSEC 2000
 
 enum venc_vpu_work_buf {
 	VENC_VPU_WORK_BUF_RC_INFO_CORE0,
@@ -413,6 +415,34 @@ static void h264_encode_filler(struct venc_common_inst *inst, void *buf,
 	memset(p, 0xff, size);
 }
 
+static void init_schedule_work(struct mtk_vcodec_ctx *ctx)
+{
+	unsigned long timeout;
+	struct mtk_venc_comp_dev *venc;
+
+	venc = ctx->dev->enc_comp_dev[ctx->hw_id];
+	timeout = msecs_to_jiffies(MTK_VENC_HW_TIMEOUT_MSEC);
+	schedule_delayed_work(&venc->enc_timeout_worker, timeout);
+}
+
+static void cancel_schedule_work(struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_venc_comp_dev *venc;
+	unsigned long flags;
+
+	venc = ctx->dev->enc_comp_dev[ctx->hw_id];
+	cancel_delayed_work(&venc->enc_timeout_worker);
+
+	mtk_venc_buf_done(ctx, ctx->hw_id, 0, 1, 0);
+	mtk_vcodec_enc_clock_off(ctx->dev, ctx->hw_id);
+
+	spin_lock_irqsave(&ctx->dev->irqlock, flags);
+	venc->curr_ctx = NULL;
+	spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
+
+	mtk_venc_unlock(ctx, ctx->hw_id);
+}
+
 static int venc_init(struct mtk_vcodec_ctx *ctx)
 {
 	int i;
@@ -489,12 +519,13 @@ static int venc_encode(void *handle,
 		ctx->pbs_buf[ctx->hw_id] = bs_buf->buf;
 
 		if (!inst->prepend_hdr) {
+			init_schedule_work(ctx);
 			ret = venc_encode_frame(inst, frm_buf, bs_buf,
 						&result->bs_size, ctx->hw_id);
 			if (ret) {
 				mtk_vcodec_err(inst, "encode frame failed: %d",
 					       ret);
-				return ret;
+				goto encode_err;
 			}
 
 			result->is_key_frm = inst->vpu_inst.is_key_frm;
@@ -503,11 +534,13 @@ static int venc_encode(void *handle,
 
 		mtk_vcodec_debug(inst, "venc_encode_frame prepend SPS/PPS");
 
+		init_schedule_work(ctx);
+
 		ret = venc_encode_header(inst, bs_buf, &bs_size_hdr);
 		if (ret) {
 			mtk_vcodec_err(inst, "encode prepend hdr failed: %d",
 				       ret);
-			return ret;
+			goto encode_err;
 		}
 
 		hdr_sz = bs_size_hdr;
@@ -530,7 +563,7 @@ static int venc_encode(void *handle,
 		if (ret) {
 			mtk_vcodec_err(inst, "encode hdr frame failed: %d",
 				       ret);
-			return ret;
+			goto encode_err;
 		}
 
 		result->bs_size = hdr_sz + filler_sz + bs_size_frm;
@@ -552,6 +585,10 @@ static int venc_encode(void *handle,
 	}
 
 	return ret;
+
+encode_err:
+	cancel_schedule_work(ctx);
+	return ret;
 }
 
 static int venc_set_param(void *handle,
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
