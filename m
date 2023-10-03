Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4E4E75433
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkqIHwE/r1uwsEs78ypgy8bMOh4izrOAeqpphIKik8A=; b=oNuUUWe/L1/ObepP5Aswtjfcpx
	XqO5ptK0M0hcTHs/iuO7jVd/7U5mIOw92paV/f5GEyYirazcroshThT3224Dd0WYhPcbtUxv5Wazz
	mQVnaeGkIqFKE4fjHvSEn9cZGX72AcI7mbLKKkm7pmlC0K2wLOQ4U/Q528G2V0XxjvF0YY4+sdpjF
	lpeAcN3QWBgh58PLduS0axVRVHw/WnaluYsErPKClijNa6pmoox1EfJVtyz5j3SMfgX2aHwiQhPtf
	BnPdUbxlE7iTaxTvBZv5BTt50WcZBvBpkTDaMJBiYYZhYVxV3SdDmoveAp2Tx2/GJuxWBLxeaNleC
	hrxF4Xkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaSq-00E54e-12;
	Tue, 03 Oct 2023 08:09:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRA-00E3CG-2E;
	Tue, 03 Oct 2023 08:07:34 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3FF16660734C;
	Tue,  3 Oct 2023 09:07:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320442;
	bh=G1d7K+QU+qOmdvGntI5BZm0vkE40HwEf9qtRlxyqy2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k52b/RsALlGVRVYOFw45uhCFAiQdegPSy9/pGcxNmCjv9pR4hGhGSdeD4ybRINC15
	 Mnu7myPS5aE5CfcMs0vuowiU2B+h07nvPYYxE38crq+uyi52dr/GXuD0pPqX5uTjGb
	 10hpIxDNEg7eAK+l0MpKrLJO2dC8LY247N539wxumUinyp5X26wIgZngUyrRU0DR/Z
	 A2awLXulx9p1JLmD7pfUCKt54WQ4JN8GsyV2fb8pFRERJ6NAXpiGizrmE1xR5wvBhv
	 DKmfhkjrvllpAPf30n8yV/CF3qxH8MXn29qNSCvU8Ekpglkh9KD6coJX98IEs6OrXU
	 BqFZC2O0z0flQ==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v10 18/54] media: verisilicon: g2: Use common helpers to compute chroma and mv offsets
Date: Tue,  3 Oct 2023 10:06:27 +0200
Message-Id: <20231003080704.43911-19-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_010725_045108_D1A3DE27 
X-CRM114-Status: GOOD (  13.98  )
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

HEVC and VP9 are running on the same hardware and share the same
chroma and motion vectors offset constraint.
Create common helpers functions for these computation.
Source and destination buffer height may not be the same because
alignment constraint are different so use destination height to
compute chroma offset because we target this buffer as hardware
output.
To be able to use the helpers in both VP9 HEVC code remove dec_params
and use context->bit_depth instead.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/platform/verisilicon/hantro_g2.c    | 14 ++++++++++
 .../platform/verisilicon/hantro_g2_hevc_dec.c | 18 ++-----------
 .../platform/verisilicon/hantro_g2_vp9_dec.c  | 26 +++----------------
 .../media/platform/verisilicon/hantro_hw.h    |  3 +++
 4 files changed, 23 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_g2.c b/drivers/media/platform/verisilicon/hantro_g2.c
index ee5f14c5f8f2..b880a6849d58 100644
--- a/drivers/media/platform/verisilicon/hantro_g2.c
+++ b/drivers/media/platform/verisilicon/hantro_g2.c
@@ -8,6 +8,8 @@
 #include "hantro_hw.h"
 #include "hantro_g2_regs.h"
 
+#define G2_ALIGN	16
+
 void hantro_g2_check_idle(struct hantro_dev *vpu)
 {
 	int i;
@@ -42,3 +44,15 @@ irqreturn_t hantro_g2_irq(int irq, void *dev_id)
 
 	return IRQ_HANDLED;
 }
+
+size_t hantro_g2_chroma_offset(struct hantro_ctx *ctx)
+{
+	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
+}
+
+size_t hantro_g2_motion_vectors_offset(struct hantro_ctx *ctx)
+{
+	size_t cr_offset = hantro_g2_chroma_offset(ctx);
+
+	return ALIGN((cr_offset * 3) / 2, G2_ALIGN);
+}
diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index a9d4ac84a8d8..d3f8c33eb16c 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
@@ -8,20 +8,6 @@
 #include "hantro_hw.h"
 #include "hantro_g2_regs.h"
 
-#define G2_ALIGN	16
-
-static size_t hantro_hevc_chroma_offset(struct hantro_ctx *ctx)
-{
-	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
-}
-
-static size_t hantro_hevc_motion_vectors_offset(struct hantro_ctx *ctx)
-{
-	size_t cr_offset = hantro_hevc_chroma_offset(ctx);
-
-	return ALIGN((cr_offset * 3) / 2, G2_ALIGN);
-}
-
 static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
@@ -384,8 +370,8 @@ static int set_ref(struct hantro_ctx *ctx)
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *vb2_dst;
 	struct hantro_decoded_buffer *dst;
-	size_t cr_offset = hantro_hevc_chroma_offset(ctx);
-	size_t mv_offset = hantro_hevc_motion_vectors_offset(ctx);
+	size_t cr_offset = hantro_g2_chroma_offset(ctx);
+	size_t mv_offset = hantro_g2_motion_vectors_offset(ctx);
 	u32 max_ref_frames;
 	u16 dpb_longterm_e;
 	static const struct hantro_reg cur_poc[] = {
diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
index 6db1c32fce4d..342e543dee4c 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
@@ -16,8 +16,6 @@
 #include "hantro_vp9.h"
 #include "hantro_g2_regs.h"
 
-#define G2_ALIGN 16
-
 enum hantro_ref_frames {
 	INTRA_FRAME = 0,
 	LAST_FRAME = 1,
@@ -90,22 +88,6 @@ static int start_prepare_run(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_
 	return 0;
 }
 
-static size_t chroma_offset(const struct hantro_ctx *ctx,
-			    const struct v4l2_ctrl_vp9_frame *dec_params)
-{
-	int bytes_per_pixel = dec_params->bit_depth == 8 ? 1 : 2;
-
-	return ctx->src_fmt.width * ctx->src_fmt.height * bytes_per_pixel;
-}
-
-static size_t mv_offset(const struct hantro_ctx *ctx,
-			const struct v4l2_ctrl_vp9_frame *dec_params)
-{
-	size_t cr_offset = chroma_offset(ctx, dec_params);
-
-	return ALIGN((cr_offset * 3) / 2, G2_ALIGN);
-}
-
 static struct hantro_decoded_buffer *
 get_ref_buf(struct hantro_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 timestamp)
 {
@@ -156,13 +138,13 @@ static void config_output(struct hantro_ctx *ctx,
 	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
 	hantro_write_addr(ctx->dev, G2_OUT_LUMA_ADDR, luma_addr);
 
-	chroma_addr = luma_addr + chroma_offset(ctx, dec_params);
+	chroma_addr = luma_addr + hantro_g2_chroma_offset(ctx);
 	hantro_write_addr(ctx->dev, G2_OUT_CHROMA_ADDR, chroma_addr);
-	dst->vp9.chroma_offset = chroma_offset(ctx, dec_params);
+	dst->vp9.chroma_offset = hantro_g2_chroma_offset(ctx);
 
-	mv_addr = luma_addr + mv_offset(ctx, dec_params);
+	mv_addr = luma_addr + hantro_g2_motion_vectors_offset(ctx);
 	hantro_write_addr(ctx->dev, G2_OUT_MV_ADDR, mv_addr);
-	dst->vp9.mv_offset = mv_offset(ctx, dec_params);
+	dst->vp9.mv_offset = hantro_g2_motion_vectors_offset(ctx);
 }
 
 struct hantro_vp9_ref_reg {
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 292a76ef643e..9aec8a79acdc 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -521,6 +521,9 @@ hantro_av1_mv_size(unsigned int width, unsigned int height)
 	return ALIGN(num_sbs * 384, 16) * 2 + 512;
 }
 
+size_t hantro_g2_chroma_offset(struct hantro_ctx *ctx);
+size_t hantro_g2_motion_vectors_offset(struct hantro_ctx *ctx);
+
 int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
 int rockchip_vpu2_mpeg2_dec_run(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
-- 
2.39.2


