Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526C9C54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGkKXuCE0erUTbKA3QGMviagg6ghSrlGpkkcnBCq/7s=; b=C7KwiKHO5iYyuFdn7Vl+XZM/Rl
	/QNRNeclzceDjJspnF8K1/fxYDMb/iovZw6gmMRighbTQg13chGR7x/h900xWaEp2FPpGUJ0bl0uU
	AzHGHBHwvWQUiLqKZ/RfR4/SgTq4j8TAhefXRlDeSNTAZLm6GAC0+fwDMdLW34gKxNai7VTtAuRLM
	gtRIeH1xCUqaG7Nsa51ciBwC39Bj7n9dKs2dOl6PfdUaKNRc8R0RKkmD1g4M6TXfiIC0Eue0pEHsU
	FaBtG9KiBLJMMjeVzARtcLvYV0mlhxEGiKHt9fSrmFnN/qs7Myfmrsgx3acAPvTYmiP7VmNSa8WCG
	cPu0r/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkjWF-0000000E75N-3c0o;
	Thu, 14 Mar 2024 11:45:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkjWC-0000000E73K-1Cwd;
	Thu, 14 Mar 2024 11:45:05 +0000
X-UUID: 488db5d6e1f811eeacdb61a41848c7d2-20240314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EGkKXuCE0erUTbKA3QGMviagg6ghSrlGpkkcnBCq/7s=;
	b=IK236IGIf9TVZs3TF6hPencHdEN65Y//bZrIHhFgIsJ5DIITfBEBE6epczBXb9m/SD69IhNEwOkb0lIRCcEAV5t8cBeIKwqr/EaUotmspRuPgGhZ/h23sBpB+gFLaxxT+ful2SXXnMIgmE++0VodU6G3SjwOmBSSUE3PJTZZVGY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:fa48f5a7-022f-46f5-9c7a-b59a9c168337,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:14790085-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 488db5d6e1f811eeacdb61a41848c7d2-20240314
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 219139637; Thu, 14 Mar 2024 04:44:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Mar 2024 19:44:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Mar 2024 19:44:54 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,1/4] media: mediatek: vcodec: setting request complete before buffer done
Date: Thu, 14 Mar 2024 19:44:49 +0800
Message-ID: <20240314114452.17532-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240314114452.17532-1-yunfei.dong@mediatek.com>
References: <20240314114452.17532-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_044504_367246_95B6A222 
X-CRM114-Status: GOOD (  16.61  )
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

The request status of output queue will be set to MEDIA_REQUEST_STATE_COMPLETE
when user space dequeue output buffer. Then calling v4l2_ctrl_request_complete
will get below warning, need to call v4l2_ctrl_request_complete before
v4l2_m2m_buf_done.
Workqueue: core-decoder vdec_msg_queue_core_work [mtk_vcodec_dec]
pstate: 80c00089 (Nzcv daIf +PAN +UAO -TCO BTYPE=--)
pc : media_request_object_bind+0xa8/0x124
lr : media_request_object_bind+0x50/0x124
sp : ffffffc011393be0
x29: ffffffc011393be0 x28: 0000000000000000
x27: ffffff890c280248 x26: ffffffe21a71ab88
x25: 0000000000000000 x24: ffffff890c280280
x23: ffffff890c280280 x22: 00000000fffffff0
x21: 0000000000000000 x20: ffffff890260d280
x19: ffffff890260d2e8 x18: 0000000000001000
x17: 0000000000000400 x16: ffffffe21a4584a0
x15: 000000000053361d x14: 0000000000000018
x13: 0000000000000004 x12: ffffffa82427d000
x11: ffffffe21ac3fce0 x10: 0000000000000001
x9 : 0000000000000000 x8 : 0000000000000003
x7 : 0000000000000000 x6 : 000000000000003f
x5 : 0000000000000040 x4 : ffffff89052e7b98
x3 : 0000000000000000 x2 : 0000000000000001
x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 media_request_object_bind+0xa8/0x124
 v4l2_ctrl_request_bind+0xc4/0x168
 v4l2_ctrl_request_complete+0x198/0x1f4
 mtk_vdec_stateless_cap_to_disp+0x58/0x8c [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
 vdec_vp9_slice_core_decode+0x1c0/0x268 [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
 vdec_msg_queue_core_work+0x60/0x11c [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
 process_one_work+0x140/0x480
 worker_thread+0x12c/0x2f8
 kthread+0x13c/0x1d8
 ret_from_fork+0x10/0x30

'Fixes: 7b182b8d9c852 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")'
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c         |  4 ++--
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  3 ++-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c        | 12 +++++++-----
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c        |  7 +++++--
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c     |  3 ++-
 .../vcodec/decoder/vdec/vdec_hevc_req_multi_if.c     |  3 ++-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        |  6 ++++--
 .../mediatek/vcodec/decoder/vdec_msg_queue.h         |  2 ++
 8 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index ba742f0e391d..409a105c5c12 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -839,10 +839,10 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 			if (src_buf != &ctx->empty_flush_buf.vb) {
 				struct media_request *req =
 					src_buf->vb2_buf.req_obj.req;
-				v4l2_m2m_buf_done(src_buf,
-						VB2_BUF_STATE_ERROR);
+
 				if (req)
 					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
+				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
 			}
 		}
 		return;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 849b89dd205c..3f5b625330bc 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -111,7 +111,8 @@ struct mtk_vcodec_dec_pdata {
 	int (*flush_decoder)(struct mtk_vcodec_dec_ctx *ctx);
 	struct vdec_fb *(*get_cap_buffer)(struct mtk_vcodec_dec_ctx *ctx);
 	void (*cap_to_disp)(struct mtk_vcodec_dec_ctx *ctx, int error,
-			    struct media_request *src_buf_req);
+			    struct media_request *src_buf_req,
+			    struct vb2_v4l2_buffer *vb2_v4l2_src);
 
 	const struct vb2_ops *vdec_vb2_ops;
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index b903e39fee89..3060768e0ea9 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -245,7 +245,8 @@ static const struct v4l2_frmsize_stepwise stepwise_fhd = {
 };
 
 static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int error,
-					   struct media_request *src_buf_req)
+					   struct media_request *src_buf_req,
+					   struct vb2_v4l2_buffer *vb2_v4l2_src)
 {
 	struct vb2_v4l2_buffer *vb2_dst;
 	enum vb2_buffer_state state;
@@ -266,6 +267,9 @@ static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int e
 
 	if (src_buf_req)
 		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+
+	if (vb2_v4l2_src)
+		v4l2_m2m_buf_done(vb2_v4l2_src, state);
 }
 
 static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
@@ -374,14 +378,12 @@ static void mtk_vdec_worker(struct work_struct *work)
 	state = ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
 	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
 	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
-		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
 		if (src_buf_req)
 			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
 	} else {
-		if (ret != -EAGAIN) {
+		if (ret != -EAGAIN)
 			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
-			v4l2_m2m_buf_done(vb2_v4l2_src, state);
-		}
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 	}
 }
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 2b6a5adbc419..f277b907c345 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1064,6 +1064,8 @@ static int vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_instance
 		return -EINVAL;
 
 	lat_buf->src_buf_req = src->vb2_buf.req_obj.req;
+	lat_buf->vb2_v4l2_src = src;
+
 	dst = &lat_buf->ts_info;
 	v4l2_m2m_buf_copy_metadata(src, dst, true);
 	vsi->frame.cur_ts = dst->vb2_buf.timestamp;
@@ -2187,7 +2189,7 @@ static int vdec_av1_slice_core_decode(struct vdec_lat_buf *lat_buf)
 		       &instance->core_vsi->trans.dma_addr_end);
 	vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, instance->core_vsi->trans.dma_addr_end);
 
-	ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
+	ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req, lat_buf->vb2_v4l2_src);
 
 	return 0;
 
@@ -2196,7 +2198,8 @@ static int vdec_av1_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
 
 	if (fb)
-		ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->src_buf_req);
+		ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->src_buf_req,
+						  lat_buf->vb2_v4l2_src);
 
 	return ret;
 }
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 0e741e0dc8ba..7033999018ca 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -533,7 +533,7 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 
 vdec_dec_end:
 	vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
-	ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_req);
+	ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_req, lat_buf->vb2_v4l2_src);
 	mtk_vdec_debug(ctx, "core decode done err=%d", err);
 	ctx->decoded_frame_cnt++;
 	return 0;
@@ -606,6 +606,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	inst->vsi->dec.nal_info = buf[nal_start_idx];
 	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
 
 	err = vdec_h264_slice_fill_decode_parameters(inst, share_info);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
index 06ed47df693b..67fe3c4bfac3 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -742,6 +742,7 @@ static int vdec_hevc_slice_setup_lat_buffer(struct vdec_hevc_slice_inst *inst,
 
 	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
 	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
 
 	*res_chg = inst->resolution_changed;
@@ -961,7 +962,7 @@ static int vdec_hevc_slice_core_decode(struct vdec_lat_buf *lat_buf)
 
 vdec_dec_end:
 	vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans.dma_addr_end);
-	ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_req);
+	ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_req, lat_buf->vb2_v4l2_src);
 	mtk_vdec_debug(ctx, "core decode done err=%d", err);
 	ctx->decoded_frame_cnt++;
 	return 0;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index cf48d09b78d7..0dedbc3680e8 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -722,6 +722,7 @@ static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance
 		return -EINVAL;
 
 	lat_buf->src_buf_req = src->vb2_buf.req_obj.req;
+	lat_buf->vb2_v4l2_src = src;
 
 	dst = &lat_buf->ts_info;
 	v4l2_m2m_buf_copy_metadata(src, dst, true);
@@ -2187,7 +2188,7 @@ static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	mtk_vdec_debug(ctx, "core dma_addr_end 0x%lx\n",
 		       (unsigned long)pfc->vsi.trans.dma_addr_end);
 	vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
-	ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
+	ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req, lat_buf->vb2_v4l2_src);
 
 	return 0;
 
@@ -2197,7 +2198,8 @@ static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
 		vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
 
 		if (fb)
-			ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->src_buf_req);
+			ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->src_buf_req,
+							  lat_buf->vb2_v4l2_src);
 	}
 	return ret;
 }
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.h
index 1d9beb9e4a14..b0f2443d186f 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.h
@@ -55,6 +55,7 @@ struct vdec_msg_queue_ctx {
  * @rd_mv_addr:	mv addr for av1 lat hardware output, core hardware input
  * @tile_addr:	tile buffer for av1 core input
  * @ts_info: need to set timestamp from output to capture
+ * @vb2_v4l2_src: the vb2 buffer of output queue
  * @src_buf_req: output buffer media request object
  *
  * @private_data: shared information used to lat and core hardware
@@ -71,6 +72,7 @@ struct vdec_lat_buf {
 	struct mtk_vcodec_mem rd_mv_addr;
 	struct mtk_vcodec_mem tile_addr;
 	struct vb2_v4l2_buffer ts_info;
+	struct vb2_v4l2_buffer *vb2_v4l2_src;
 	struct media_request *src_buf_req;
 
 	void *private_data;
-- 
2.18.0


