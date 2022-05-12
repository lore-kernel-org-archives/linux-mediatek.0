Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDC6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 02:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LyuZozVnKVfDF4hBwob/j4DETuOJxhLx/5GrMZuCtto=; b=uKU+HEZPX6IRaI
	VAZwZoMRvGNYkP2t8XO2NnCmFUYTNSHsiASNly9a8bBgmD5cNk99RKi8MoCm9Q15T8bunLFsUGfuz
	jaWqlrA0W6fbcxkIzKR1ei3oLP86W3dmPTXqbpKKFWPEc1gltfa8T+lYKRwfPiTPDcHABbjcvMz2X
	h+eRH1/fkV3Ommw7EySKYLarq2EfEgcBKrApO2ggYREiF2x3ReIzKbybkOfiRifDA/IUDdHrohMlh
	jiCVuxXCA3zzwC+vN4GSOGBxXiJMI78ItdTWMn0W5kzuUfcyGZcG1zLzvSzF7nSM/ny7RLX8pgPdY
	9/tlz/osOX2MjKrMkaGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noyYn-009Svi-BK; Thu, 12 May 2022 02:28:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noyTQ-009PsD-3q; Thu, 12 May 2022 02:22:42 +0000
X-UUID: d6433cf6e1234dd680b0ae6a56a722f9-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:89954354-ce26-4108-aabc-08fa02a04c57, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-15
X-CID-META: VersionHash:faefae9, CLOUDID:b33b4125-b432-452e-9e03-2bf3148aed85,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: d6433cf6e1234dd680b0ae6a56a722f9-20220511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2039567619; Wed, 11 May 2022 19:22:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 19:20:04 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 12 May 2022 10:20:02 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 May 2022 10:20:00 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v12,
 06/17] media: mediatek: vcodec: Refactor get and put capture buffer
 flow
Date: Thu, 12 May 2022 10:19:39 +0800
Message-ID: <20220512021950.29087-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512021950.29087-1-yunfei.dong@mediatek.com>
References: <20220512021950.29087-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_192240_206245_583CA953 
X-CRM114-Status: GOOD (  18.76  )
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

For lat and core decode in parallel, need to get capture buffer
when core start to decode and put capture buffer to display
list when core decode done.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/mtk_vcodec_dec_stateless.c         | 88 +++++++++++++------
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  6 +-
 .../mediatek/vcodec/vdec/vdec_h264_req_if.c   | 11 ++-
 .../platform/mediatek/vcodec/vdec_msg_queue.h |  2 +
 4 files changed, 80 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index 4df7b158ec5e..c61df1f51185 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -108,20 +108,50 @@ static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
 
 #define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
 
-static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx,
-					   struct vb2_v4l2_buffer *vb2_v4l2)
+static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_ctx *ctx, int error,
+					   struct media_request *src_buf_req)
 {
-	struct mtk_video_dec_buf *framebuf =
-		container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
-	struct vdec_fb *pfb = &framebuf->frame_buffer;
-	struct vb2_buffer *dst_buf = &vb2_v4l2->vb2_buf;
+	struct vb2_v4l2_buffer *vb2_dst;
+	enum vb2_buffer_state state;
 
-	pfb->base_y.va = NULL;
+	if (error)
+		state = VB2_BUF_STATE_ERROR;
+	else
+		state = VB2_BUF_STATE_DONE;
+
+	vb2_dst = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+	v4l2_m2m_buf_done(vb2_dst, state);
+
+	mtk_v4l2_debug(2, "free frame buffer id:%d to done list",
+		       vb2_dst->vb2_buf.index);
+
+	if (src_buf_req)
+		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+}
+
+static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_video_dec_buf *framebuf;
+	struct vb2_v4l2_buffer *vb2_v4l2;
+	struct vb2_buffer *dst_buf;
+	struct vdec_fb *pfb;
+
+	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	if (!vb2_v4l2) {
+		mtk_v4l2_debug(1, "[%d] dst_buf empty!!", ctx->id);
+		return NULL;
+	}
+
+	dst_buf = &vb2_v4l2->vb2_buf;
+	framebuf = container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
+
+	pfb = &framebuf->frame_buffer;
+	pfb->base_y.va = vb2_plane_vaddr(dst_buf, 0);
 	pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
 	pfb->base_y.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
 
 	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
-		pfb->base_c.va = NULL;
+		pfb->base_c.va = vb2_plane_vaddr(dst_buf, 1);
 		pfb->base_c.dma_addr =
 			vb2_dma_contig_plane_dma_addr(dst_buf, 1);
 		pfb->base_c.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
@@ -145,12 +175,12 @@ static void mtk_vdec_worker(struct work_struct *work)
 	struct mtk_vcodec_ctx *ctx =
 		container_of(work, struct mtk_vcodec_ctx, decode_work);
 	struct mtk_vcodec_dev *dev = ctx->dev;
-	struct vb2_v4l2_buffer *vb2_v4l2_src, *vb2_v4l2_dst;
+	struct vb2_v4l2_buffer *vb2_v4l2_src;
 	struct vb2_buffer *vb2_src;
 	struct mtk_vcodec_mem *bs_src;
 	struct mtk_video_dec_buf *dec_buf_src;
 	struct media_request *src_buf_req;
-	struct vdec_fb *dst_buf;
+	enum vb2_buffer_state state;
 	bool res_chg = false;
 	int ret;
 
@@ -161,13 +191,6 @@ static void mtk_vdec_worker(struct work_struct *work)
 		return;
 	}
 
-	vb2_v4l2_dst = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
-	if (!vb2_v4l2_dst) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_debug(1, "[%d] no available destination buffer", ctx->id);
-		return;
-	}
-
 	vb2_src = &vb2_v4l2_src->vb2_buf;
 	dec_buf_src = container_of(vb2_v4l2_src, struct mtk_video_dec_buf,
 				   m2m_buf.vb);
@@ -176,9 +199,15 @@ static void mtk_vdec_worker(struct work_struct *work)
 	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p", ctx->id,
 		       vb2_src->vb2_queue->type, vb2_src->index, vb2_src);
 
-	bs_src->va = NULL;
+	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
 	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
 	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
+	if (!bs_src->va) {
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_err("[%d] id=%d source buffer is NULL", ctx->id,
+			     vb2_src->index);
+		return;
+	}
 
 	mtk_v4l2_debug(3, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 		       ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
@@ -189,9 +218,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 	else
 		mtk_v4l2_err("vb2 buffer media request is NULL");
 
-	dst_buf = vdec_get_cap_buffer(ctx, vb2_v4l2_dst);
-	v4l2_m2m_buf_copy_metadata(vb2_v4l2_src, vb2_v4l2_dst, true);
-	ret = vdec_if_decode(ctx, bs_src, dst_buf, &res_chg);
+	ret = vdec_if_decode(ctx, bs_src, NULL, &res_chg);
 	if (ret) {
 		mtk_v4l2_err(" <===[%d], src_buf[%d] sz=0x%zx pts=%llu vdec_if_decode() ret=%d res_chg=%d===>",
 			     ctx->id, vb2_src->index, bs_src->size,
@@ -203,10 +230,17 @@ static void mtk_vdec_worker(struct work_struct *work)
 		}
 	}
 
-	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
-					 ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
-
-	v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+	state = ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
+	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
+	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME || ret) {
+		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
+		if (src_buf_req)
+			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+	} else {
+		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(vb2_v4l2_src, state);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+	}
 }
 
 static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
@@ -336,6 +370,8 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
+	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
+	.get_cap_buffer = vdec_get_cap_buffer,
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 };
@@ -354,6 +390,8 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
+	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
+	.get_cap_buffer = vdec_get_cap_buffer,
 	.is_subdev_supported = true,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 };
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index 6d27e4d41ede..c06463142182 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -350,7 +350,8 @@ enum mtk_vdec_hw_arch {
  * @ctrls_setup: init vcodec dec ctrls
  * @worker: worker to start a decode job
  * @flush_decoder: function that flushes the decoder
- *
+ * @get_cap_buffer: get capture buffer from capture queue
+ * @cap_to_disp: put capture buffer to disp list for lat and core arch
  * @vdec_vb2_ops: struct vb2_ops
  *
  * @vdec_formats: supported video decoder formats
@@ -372,6 +373,9 @@ struct mtk_vcodec_dec_pdata {
 	int (*ctrls_setup)(struct mtk_vcodec_ctx *ctx);
 	void (*worker)(struct work_struct *work);
 	int (*flush_decoder)(struct mtk_vcodec_ctx *ctx);
+	struct vdec_fb *(*get_cap_buffer)(struct mtk_vcodec_ctx *ctx);
+	void (*cap_to_disp)(struct mtk_vcodec_ctx *ctx, int error,
+			    struct media_request *src_buf_req);
 
 	struct vb2_ops *vdec_vb2_ops;
 
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
index 43542de11e9c..27119aa31dd9 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
@@ -670,12 +670,15 @@ static void vdec_h264_slice_deinit(void *h_vdec)
 }
 
 static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
-				  struct vdec_fb *fb, bool *res_chg)
+				  struct vdec_fb *unused, bool *res_chg)
 {
 	struct vdec_h264_slice_inst *inst = h_vdec;
 	const struct v4l2_ctrl_h264_decode_params *dec_params =
 		get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_DECODE_PARAMS);
 	struct vdec_vpu_inst *vpu = &inst->vpu;
+	struct mtk_video_dec_buf *src_buf_info;
+	struct mtk_video_dec_buf *dst_buf_info;
+	struct vdec_fb *fb;
 	u32 data[2];
 	u64 y_fb_dma;
 	u64 c_fb_dma;
@@ -685,6 +688,10 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	if (!bs)
 		return vpu_dec_reset(vpu);
 
+	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+
 	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
 	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
 
@@ -696,6 +703,8 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	inst->vsi_ctx.dec.c_fb_dma = c_fb_dma;
 	inst->vsi_ctx.dec.vdec_fb_va = (u64)(uintptr_t)fb;
 
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
+				   &dst_buf_info->m2m_buf.vb, true);
 	get_vdec_decode_parameters(inst);
 	data[0] = bs->size;
 	/*
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
index b6ba66d3e026..c43d427f5f54 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
@@ -43,6 +43,7 @@ struct vdec_msg_queue_ctx {
  * @wdma_err_addr: wdma error address used for lat hardware
  * @slice_bc_addr: slice bc address used for lat hardware
  * @ts_info: need to set timestamp from output to capture
+ * @src_buf_req: output buffer media request object
  *
  * @private_data: shared information used to lat and core hardware
  * @ctx: mtk vcodec context information
@@ -54,6 +55,7 @@ struct vdec_lat_buf {
 	struct mtk_vcodec_mem wdma_err_addr;
 	struct mtk_vcodec_mem slice_bc_addr;
 	struct vb2_v4l2_buffer ts_info;
+	struct media_request *src_buf_req;
 
 	void *private_data;
 	struct mtk_vcodec_ctx *ctx;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
