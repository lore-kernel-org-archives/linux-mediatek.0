Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AB3C47422
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 06:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cg9rhVDIUdOGy9/6TLSBnMKtmzezqEQOEQF3unbi4u8=; b=1RwqhIQawOE6VYbEE6KMnQooqP
	nxG8JAa0SwVTuvY0xsrWEA+MgSkY0CnJoVCTWGc0mvYCCzlzWAhVxlY0t2Vw1lo/awfWQKRlpX1vX
	IQx7FivFKIfDZyKCW2BZ1fXThxe/usHnDl1aGMWFFG703Opy4bLEIpx48YPa3DD9AqS4fRWL2EEOI
	wtbLsFleT/1rr4WFZII0RV/fJXPI49s8Wtt6VQL1OWuCyB2fRfdMqah9zQYpAI/kYXKZPFTFzS3mS
	gk92XzgmilNFbwvnB+0cY84tg8DnaUgbKeJrRorKLzGIvSpTt3QJWbWL5Gvix9zskbG/DK/yeE5rz
	+672cxkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULDO-0000000BUzF-1jFK;
	Mon, 29 Jan 2024 06:33:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULBA-0000000BTYy-2ayZ;
	Mon, 29 Jan 2024 06:31:38 +0000
X-UUID: 0afbcfc4be7011ee9a263b4415211400-20240128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Cg9rhVDIUdOGy9/6TLSBnMKtmzezqEQOEQF3unbi4u8=;
	b=UrPGzwAgdAxvRVdFstriWFh0ZO0NP3M985fqXB+u9bDe4Bx5A/mShSGf2gcUkyK1VkKzC1h3qCjrx5BqAuBzNPP+kUBN2Hn6/0z0n1uTmIxNXOjzXmeLqyeUqsUCGbC38HJ3zG27X02B02MwpxotSWlW2EzS2qBjUnLQzULoJMg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:4878967a-0af7-4b52-b1a1-f558935c7053,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6e16cf4,CLOUDID:4eb8c38e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0afbcfc4be7011ee9a263b4415211400-20240128
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 602451146; Sun, 28 Jan 2024 23:31:32 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 29 Jan 2024 14:30:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 29 Jan 2024 14:30:56 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
	"Hsin-Yi Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	"Daniel Vetter" <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	"Brian Starkey" <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T
 . J . Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,16/22] media: mediatek: vcodec: support one plane capture buffer
Date: Mon, 29 Jan 2024 14:30:19 +0800
Message-ID: <20240129063025.29251-17-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240129063025.29251-1-yunfei.dong@mediatek.com>
References: <20240129063025.29251-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.238200-8.000000
X-TMASE-MatchedRID: IdwiQWGfGmyON+GapO42vQI0yP/uoH+Dh+w9Wz/xXDr7efdnqtsaE5kC
	erFMaabilTJXKqh1ne29cOdjc/43lUMpVZZsZyZGHPYwOJi6PLmBHKTJ+sfXGfNhzIgXtFJVJkA
	T6PZqtWG0gVrq9RizuWF6wLzbAtAr7U4NkBX42MYQ9/tMNQ4aiuWNJG9IamrcGM7yl/HgfuBLbT
	Uf+O4SvG0xs/kJ5jkfbhGQTDKMjW9sQJ9Z3jpPTZ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyMdRT
	5TQAJnA56FLyMh+oymI9bcjcLbWqxAoGrvafT2017miKbd1tCqeqD9WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.238200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C2A0D557D206DC74E4C049EF483DD9C943FB0F938B741967A4F6ACCA7EFFA2032000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_223137_147951_3F18F66F 
X-CRM114-Status: GOOD (  14.61  )
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

The capture buffer has two planes for format MM21, but user space only
allocate secure memory for plane[0], and the size is Y data + uv data.
The driver need to support one plane decoder for svp mode.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |  7 ++++-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 26 ++++++++++---------
 .../decoder/vdec/vdec_h264_req_common.c       | 18 ++++++-------
 .../mediatek/vcodec/decoder/vdec_drv_if.c     |  4 +--
 4 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 604fdc8ee3ce..5d876a31e566 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -653,7 +653,12 @@ static int vidioc_vdec_g_fmt(struct file *file, void *priv,
 		 * So we just return picinfo yet, and update picinfo in
 		 * stop_streaming hook function
 		 */
-		q_data->sizeimage[0] = ctx->picinfo.fb_sz[0];
+
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1 || ctx->is_secure_playback)
+			q_data->sizeimage[0] = ctx->picinfo.fb_sz[0] + ctx->picinfo.fb_sz[1];
+		else
+			q_data->sizeimage[0] = ctx->picinfo.fb_sz[0];
+
 		q_data->sizeimage[1] = ctx->picinfo.fb_sz[1];
 		q_data->bytesperline[0] = ctx->last_decoded_picinfo.buf_w;
 		q_data->bytesperline[1] = ctx->last_decoded_picinfo.buf_w;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index cc42c942eb8a..707ed57a412e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -285,14 +285,14 @@ static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
 	framebuf = container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
 
 	pfb = &framebuf->frame_buffer;
-	pfb->base_y.va = vb2_plane_vaddr(dst_buf, 0);
+	if (!ctx->is_secure_playback)
+		pfb->base_y.va = vb2_plane_vaddr(dst_buf, 0);
 	pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
 	pfb->base_y.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
 
-	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
+	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2 && !ctx->is_secure_playback) {
 		pfb->base_c.va = vb2_plane_vaddr(dst_buf, 1);
-		pfb->base_c.dma_addr =
-			vb2_dma_contig_plane_dma_addr(dst_buf, 1);
+		pfb->base_c.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 1);
 		pfb->base_c.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
 	}
 	mtk_v4l2_vdec_dbg(1, ctx,
@@ -339,16 +339,18 @@ static void mtk_vdec_worker(struct work_struct *work)
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] (%d) id=%d, vb=%p", ctx->id,
 			  vb2_src->vb2_queue->type, vb2_src->index, vb2_src);
 
-	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
-	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
-	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
-	if (!bs_src->va) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
-				  vb2_src->index);
-		return;
+	if (!ctx->is_secure_playback) {
+		bs_src->va = vb2_plane_vaddr(vb2_src, 0);
+		if (!bs_src->va) {
+			v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+			mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
+					  vb2_src->index);
+			return;
+		}
 	}
 
+	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
+	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
 	/* Apply request controls. */
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c
index 5ca20d75dc8e..5e0d55218363 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c
@@ -79,15 +79,15 @@ void mtk_vdec_h264_fill_dpb_info(struct mtk_vcodec_dec_ctx *ctx,
 		vb2_v4l2 = container_of(vb, struct vb2_v4l2_buffer, vb2_buf);
 		h264_dpb_info[index].field = vb2_v4l2->field;
 
-		h264_dpb_info[index].y_dma_addr =
-			vb2_dma_contig_plane_dma_addr(vb, 0);
-		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
-			h264_dpb_info[index].c_dma_addr =
-				vb2_dma_contig_plane_dma_addr(vb, 1);
-		else
-			h264_dpb_info[index].c_dma_addr =
-				h264_dpb_info[index].y_dma_addr +
-				ctx->picinfo.fb_sz[0];
+		h264_dpb_info[index].y_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
+		if (!ctx->is_secure_playback) {
+			if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+				h264_dpb_info[index].c_dma_addr =
+					vb2_dma_contig_plane_dma_addr(vb, 1);
+			else
+				h264_dpb_info[index].c_dma_addr =
+					h264_dpb_info[index].y_dma_addr + ctx->picinfo.fb_sz[0];
+		}
 	}
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c
index d0b459b1603f..fb3e4f75ed93 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c
@@ -73,14 +73,14 @@ int vdec_if_decode(struct mtk_vcodec_dec_ctx *ctx, struct mtk_vcodec_mem *bs,
 {
 	int ret = 0;
 
-	if (bs) {
+	if (bs && !ctx->is_secure_playback) {
 		if ((bs->dma_addr & 63) != 0) {
 			mtk_v4l2_vdec_err(ctx, "bs dma_addr should 64 byte align");
 			return -EINVAL;
 		}
 	}
 
-	if (fb) {
+	if (fb && !ctx->is_secure_playback) {
 		if (((fb->base_y.dma_addr & 511) != 0) ||
 		    ((fb->base_c.dma_addr & 511) != 0)) {
 			mtk_v4l2_vdec_err(ctx, "frame buffer dma_addr should 512 byte align");
-- 
2.18.0


