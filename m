Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB66C54E69
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 11:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaIDC2m2nJb1fg6AN4p/QKYjriwNenP9PPh0twqZQZM=; b=zAdZYqpy/lwqiSV7+4vQJYtves
	ukJje34iwDhyxiCTBWRIWnseI+llpiQEGk1ctQ1dg5nUp0lhgKv6ZwWr8LbwIH1p5auHCdcCzFa0o
	jXpvEkp8L+bMa7PwdZbulno5dbC92Ksc8o6J7Fx5YLd0IjSrXlwcpZTYZ6GT1ce1gt0IRopPmCEWs
	5hlq9OsIlAz2HM6PoFFMsFKnyHay+g0P+AdtvXn1q94UhwOC5n0GhT+J+lc0lfPsVJxdZ+EaFtuq9
	tpflzxesMmPGZwMME3C+O5jjhUNxTmSQaSRiYUNasAPN3sA2jjpKSHaozsNj+Gb10zKXeg6qt7aGX
	GXzs2Oog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkjWI-0000000E76s-1BOU;
	Thu, 14 Mar 2024 11:45:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkjWD-0000000E74L-3EnF;
	Thu, 14 Mar 2024 11:45:07 +0000
X-UUID: 4a555feae1f811eeacdb61a41848c7d2-20240314
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GaIDC2m2nJb1fg6AN4p/QKYjriwNenP9PPh0twqZQZM=;
	b=CNMuBz3vSGGU4ncZI3CQhlBVn/ocE571c8gEefl4S4tzd3/pWRcdv6yqwTLjFPd8rWtygSLeSKGdlePS6RYoY7/vTDBQKLI3IUHGawdRXXBTbTKtVN/8zzwaFeEW3YApMGHHf293QmNBO4FZIVWFtJc44nfki8MzW1cCm/026Ik=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:c3dda5aa-05e8-4917-b8dc-c1cf794d447d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-35
X-CID-META: VersionHash:6f543d0,CLOUDID:363a6790-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4a555feae1f811eeacdb61a41848c7d2-20240314
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1116031484; Thu, 14 Mar 2024 04:45:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Mar 2024 19:44:58 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Mar 2024 19:44:57 +0800
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
Subject: [PATCH v2,4/4] media: mediatek: vcodec: replace v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove
Date: Thu, 14 Mar 2024 19:44:52 +0800
Message-ID: <20240314114452.17532-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240314114452.17532-1-yunfei.dong@mediatek.com>
References: <20240314114452.17532-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_044505_857979_B505349E 
X-CRM114-Status: GOOD (  15.00  )
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

There isn't lock to protect source buffer when get next src buffer, if
the source buffer is removed for some unknown reason before lat work queue
execute done, will lead to remove source buffer or buffer done error.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 +++++++++----
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 25 ++++++--------
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 33 ++++++++-----------
 3 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 3060768e0ea9..bb2680f3ec5b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -328,7 +328,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 	bool res_chg = false;
 	int ret;
 
-	vb2_v4l2_src = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
+	vb2_v4l2_src = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
 	if (!vb2_v4l2_src) {
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		mtk_v4l2_vdec_dbg(1, ctx, "[%d] no available source buffer", ctx->id);
@@ -363,7 +363,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
 
 	ret = vdec_if_decode(ctx, bs_src, NULL, &res_chg);
-	if (ret && ret != -EAGAIN) {
+	if (ret) {
 		mtk_v4l2_vdec_err(ctx,
 				  "[%d] decode src_buf[%d] sz=0x%zx pts=%llu ret=%d res_chg=%d",
 				  ctx->id, vb2_src->index, bs_src->size,
@@ -380,11 +380,21 @@ static void mtk_vdec_worker(struct work_struct *work)
 	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
 		if (src_buf_req)
 			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
-		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
-	} else {
-		if (ret != -EAGAIN)
-			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		if (vb2_v4l2_src)
+			v4l2_m2m_buf_done(vb2_v4l2_src, state);
+
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+	} else {
+		if (!ret) {
+			v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		} else {
+			if (src_buf_req)
+				v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+			if (vb2_v4l2_src)
+				v4l2_m2m_buf_done(vb2_v4l2_src, state);
+
+			v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		}
 	}
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index f277b907c345..339c5c88da1a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1052,23 +1052,18 @@ static inline void vdec_av1_slice_vsi_to_remote(struct vdec_av1_slice_vsi *vsi,
 	memcpy(remote_vsi, vsi, sizeof(*vsi));
 }
 
-static int vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_instance *instance,
-						 struct vdec_av1_slice_vsi *vsi,
-						 struct vdec_lat_buf *lat_buf)
+static int vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_vsi *vsi,
+						 struct vdec_lat_buf *lat_buf,
+						 struct mtk_vcodec_mem *bs)
 {
-	struct vb2_v4l2_buffer *src;
-	struct vb2_v4l2_buffer *dst;
-
-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
-	if (!src)
-		return -EINVAL;
+	struct mtk_video_dec_buf *src_buf_info;
 
-	lat_buf->src_buf_req = src->vb2_buf.req_obj.req;
-	lat_buf->vb2_v4l2_src = src;
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
 
-	dst = &lat_buf->ts_info;
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
-	vsi->frame.cur_ts = dst->vb2_buf.timestamp;
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
+	vsi->frame.cur_ts = lat_buf->ts_info.vb2_buf.timestamp;
 
 	return 0;
 }
@@ -1717,7 +1712,7 @@ static int vdec_av1_slice_setup_lat(struct vdec_av1_slice_instance *instance,
 	struct vdec_av1_slice_vsi *vsi = &pfc->vsi;
 	int ret;
 
-	ret = vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, lat_buf);
+	ret = vdec_av1_slice_setup_lat_from_src_buf(vsi, lat_buf, bs);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 0dedbc3680e8..2697e04f4313 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -693,39 +693,34 @@ static int vdec_vp9_slice_tile_offset(int idx, int mi_num, int tile_log2)
 }
 
 static
-int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *instance)
+int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *instance,
+						struct mtk_vcodec_mem *bs)
 {
-	struct vb2_v4l2_buffer *src;
 	struct vb2_v4l2_buffer *dst;
+	struct mtk_video_dec_buf *src_buf_info;
 
-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
-	if (!src)
-		return -EINVAL;
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
 
 	dst = v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx);
 	if (!dst)
 		return -EINVAL;
 
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, dst, true);
 
 	return 0;
 }
 
-static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance *instance,
-						 struct vdec_lat_buf *lat_buf)
+static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_lat_buf *lat_buf,
+						 struct mtk_vcodec_mem *bs)
 {
-	struct vb2_v4l2_buffer *src;
-	struct vb2_v4l2_buffer *dst;
+	struct mtk_video_dec_buf *src_buf_info;
 
-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
-	if (!src)
-		return -EINVAL;
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
 
-	lat_buf->src_buf_req = src->vb2_buf.req_obj.req;
-	lat_buf->vb2_v4l2_src = src;
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
 
-	dst = &lat_buf->ts_info;
-	v4l2_m2m_buf_copy_metadata(src, dst, true);
 	return 0;
 }
 
@@ -1155,7 +1150,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
 	struct vdec_vp9_slice_vsi *vsi = &pfc->vsi;
 	int ret;
 
-	ret = vdec_vp9_slice_setup_lat_from_src_buf(instance, lat_buf);
+	ret = vdec_vp9_slice_setup_lat_from_src_buf(lat_buf, bs);
 	if (ret)
 		goto err;
 
@@ -1796,7 +1791,7 @@ static int vdec_vp9_slice_setup_single(struct vdec_vp9_slice_instance *instance,
 	struct vdec_vp9_slice_vsi *vsi = &pfc->vsi;
 	int ret;
 
-	ret = vdec_vp9_slice_setup_single_from_src_to_dst(instance);
+	ret = vdec_vp9_slice_setup_single_from_src_to_dst(instance, bs);
 	if (ret)
 		goto err;
 
-- 
2.18.0


