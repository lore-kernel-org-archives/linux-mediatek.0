Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67512C48BEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 10:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bh54CrUmjht+EttVRp4xxlMaCLQOTJACukUzbcq6Rlo=; b=sIuMhxy9ZtMWD9SntpwQgpOdle
	Pj3mWXbjYi5Kef3AN5KaW05Yf7uiVAU8plr2HJsyYoOvY+2fgdJi+CXH5plpJhyPSLzkXwUmtBnH1
	tnIsk+pjuFpctoa4LbffOCFoiIa6ndR8lCK9ok89bbM5GW/Nn77kVFaI+NXrz/E4tCvUt+yLIANXz
	cZ7Is+8I0fmjuJ7Lzv7nekv4Q1AZXxAvGASpB3uO1L3b1H4ruXnL5V0i2wTLB+MYdHup82aM7oSNB
	rmjQFL2OEuHYc/3mHzXLM0yqp2ZKZC7to3M7MlPQyRMzuwAo4pBdmGXdCoZBEgQJqBzod1UuMhoND
	ryMnSTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raYix-0000000Fhex-3rfn;
	Thu, 15 Feb 2024 10:12:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raYiL-0000000FhC6-3daM;
	Thu, 15 Feb 2024 10:11:36 +0000
X-UUID: 94a500cecbea11eea0bf134e88e6c2dc-20240215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Bh54CrUmjht+EttVRp4xxlMaCLQOTJACukUzbcq6Rlo=;
	b=SoMuA3mGg+nzcM0151VvhGh9JCTtQgeJjApmC4YJJahEKBLPOhoQiiXb4C0Noj9Xz6Q2gXbGqmeIjvQLZkRQPy9Id17Z76m98zFeryJC8NOtPtfxdJfslKWlth1i32mbdDCqs3VSs2/DdG+RhVogQ52Rg7mLj73RFZfJ/0DoXYE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:87986da5-13ae-4955-99c1-0d6c94c2e150,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:075dd0fe-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 94a500cecbea11eea0bf134e88e6c2dc-20240215
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 111454411; Thu, 15 Feb 2024 03:11:27 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 15 Feb 2024 18:11:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 15 Feb 2024 18:11:22 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v5 08/13] drm/mediatek: Support alpha blending in OVL
Date: Thu, 15 Feb 2024 18:11:14 +0800
Message-ID: <20240215101119.12629-9-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240215101119.12629-1-shawn.sung@mediatek.com>
References: <20240215101119.12629-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.422500-8.000000
X-TMASE-MatchedRID: IVz/1v+EsXqc95xD+Eo4wGwbuvhCHs3cIfZjRfGTydgE6M1YtcX6vCtt
	gmG94b4GsoaiX/cNXYAnOAFYLaUTjQDNPxu11HXj4pdq9sdj8LW2McZY43zJ423D6f6IpbLIADR
	MoifoBflorIKifKWWgpFekOtgEgco1h970BFpuVIMH4SsGvRsA3cF/0kiqyh4eNDQ2odiEiHEZK
	HidzhUXGFAOEChoDSdWSIk5NxwrX50tvaBTTwwfMDORqgKKiYqPmpaNflBE4lshKp86qG4XKPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KraBhGN9wL6699f58OWKW5VIJPReTTpGttRDnu7o0L82DtHJp
	cJibaSI=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.422500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8FAECF8407891910EDE444F1DC316FB84B0D2E7E74C1867CF75EE1E2F1AE81C92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_021133_935999_5DC096DA 
X-CRM114-Status: GOOD (  14.90  )
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
Cc: linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, Sean Paul <seanpaul@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Hsiao Chien Sung <shawn.sung@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support "Pre-multiplied" and "None" blend mode on MediaTek's chips.
Before this patch, only the "Coverage" mode is supported.

Please refer to the description of the commit
"drm/mediatek: Support alpha blending in display driver"
for more information.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 83 +++++++++++++++++++++----
 1 file changed, 72 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index c42fce38a35eb..98c989fddcc08 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -39,6 +39,7 @@
 #define DISP_REG_OVL_PITCH_MSB(n)		(0x0040 + 0x20 * (n))
 #define OVL_PITCH_MSB_2ND_SUBBUF			BIT(16)
 #define DISP_REG_OVL_PITCH(n)			(0x0044 + 0x20 * (n))
+#define OVL_CONST_BLEND					BIT(28)
 #define DISP_REG_OVL_RDMA_CTRL(n)		(0x00c0 + 0x20 * (n))
 #define DISP_REG_OVL_RDMA_GMC(n)		(0x00c8 + 0x20 * (n))
 #define DISP_REG_OVL_ADDR_MT2701		0x0040
@@ -52,13 +53,16 @@
 #define GMC_THRESHOLD_HIGH	((1 << GMC_THRESHOLD_BITS) / 4)
 #define GMC_THRESHOLD_LOW	((1 << GMC_THRESHOLD_BITS) / 8)
 
+#define OVL_CON_CLRFMT_MAN	BIT(23)
 #define OVL_CON_BYTE_SWAP	BIT(24)
-#define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
+#define OVL_CON_RGB_SWAP	BIT(25)
 #define OVL_CON_CLRFMT_RGB	(1 << 12)
 #define OVL_CON_CLRFMT_RGBA8888	(2 << 12)
 #define OVL_CON_CLRFMT_ARGB8888	(3 << 12)
 #define OVL_CON_CLRFMT_UYVY	(4 << 12)
 #define OVL_CON_CLRFMT_YUYV	(5 << 12)
+#define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
+#define OVL_CON_CLRFMT_PARGB8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_CLRFMT_MAN)
 #define OVL_CON_CLRFMT_RGB565(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
 					0 : OVL_CON_CLRFMT_RGB)
 #define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
@@ -72,6 +76,22 @@
 #define	OVL_CON_VIRT_FLIP	BIT(9)
 #define	OVL_CON_HORZ_FLIP	BIT(10)
 
+static inline bool is_10bit_rgb(u32 fmt)
+{
+	switch (fmt) {
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_RGBX1010102:
+	case DRM_FORMAT_RGBA1010102:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
+	case DRM_FORMAT_BGRX1010102:
+	case DRM_FORMAT_BGRA1010102:
+		return true;
+	}
+	return false;
+}
+
 static const u32 mt8173_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
@@ -89,12 +109,20 @@ static const u32 mt8173_formats[] = {
 static const u32 mt8195_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB2101010,
 	DRM_FORMAT_ARGB2101010,
 	DRM_FORMAT_BGRX8888,
 	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX1010102,
 	DRM_FORMAT_BGRA1010102,
 	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XBGR2101010,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBX1010102,
+	DRM_FORMAT_RGBA1010102,
 	DRM_FORMAT_RGB888,
 	DRM_FORMAT_BGR888,
 	DRM_FORMAT_RGB565,
@@ -254,9 +282,7 @@ static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 format,
 	reg = readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
 	reg &= ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
 
-	if (format == DRM_FORMAT_RGBA1010102 ||
-	    format == DRM_FORMAT_BGRA1010102 ||
-	    format == DRM_FORMAT_ARGB2101010)
+	if (is_10bit_rgb(format))
 		bit_depth = OVL_CON_CLRFMT_10_BIT;
 
 	reg |= OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
@@ -274,7 +300,13 @@ void mtk_ovl_config(struct device *dev, unsigned int w,
 	if (w != 0 && h != 0)
 		mtk_ddp_write_relaxed(cmdq_pkt, h << 16 | w, &ovl->cmdq_reg, ovl->regs,
 				      DISP_REG_OVL_ROI_SIZE);
-	mtk_ddp_write_relaxed(cmdq_pkt, 0x0, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_ROI_BGCLR);
+
+	/*
+	 * The background color should be opaque black (ARGB),
+	 * otherwise there will be no effect with alpha blend
+	 */
+	mtk_ddp_write_relaxed(cmdq_pkt, 0xff000000, &ovl->cmdq_reg,
+			      ovl->regs, DISP_REG_OVL_ROI_BGCLR);
 
 	mtk_ddp_write(cmdq_pkt, 0x1, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RST);
 	mtk_ddp_write(cmdq_pkt, 0x0, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RST);
@@ -352,7 +384,8 @@ void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 }
 
-static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
+static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt,
+				    unsigned int blend_mode)
 {
 	/* The return value in switch "MEM_MODE_INPUT_FORMAT_XXX"
 	 * is defined in mediatek HW data sheet.
@@ -371,17 +404,37 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
 		return OVL_CON_CLRFMT_RGB888(ovl) | OVL_CON_BYTE_SWAP;
 	case DRM_FORMAT_RGBX8888:
 	case DRM_FORMAT_RGBA8888:
+		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
+		       OVL_CON_CLRFMT_ARGB8888 :
+		       OVL_CON_CLRFMT_PARGB8888;
+	case DRM_FORMAT_RGBX1010102:
+	case DRM_FORMAT_RGBA1010102:
 		return OVL_CON_CLRFMT_ARGB8888;
 	case DRM_FORMAT_BGRX8888:
 	case DRM_FORMAT_BGRA8888:
+		return OVL_CON_BYTE_SWAP |
+		       (blend_mode == DRM_MODE_BLEND_COVERAGE ?
+		       OVL_CON_CLRFMT_ARGB8888 :
+		       OVL_CON_CLRFMT_PARGB8888);
+	case DRM_FORMAT_BGRX1010102:
 	case DRM_FORMAT_BGRA1010102:
 		return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
+		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
+		       OVL_CON_CLRFMT_RGBA8888 :
+		       OVL_CON_CLRFMT_PARGB8888;
+	case DRM_FORMAT_XRGB2101010:
 	case DRM_FORMAT_ARGB2101010:
 		return OVL_CON_CLRFMT_RGBA8888;
 	case DRM_FORMAT_XBGR8888:
 	case DRM_FORMAT_ABGR8888:
+		return OVL_CON_RGB_SWAP |
+		       (blend_mode == DRM_MODE_BLEND_COVERAGE ?
+		       OVL_CON_CLRFMT_RGBA8888 :
+		       OVL_CON_CLRFMT_PARGB8888);
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
 		return OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP;
 	case DRM_FORMAT_UYVY:
 		return OVL_CON_CLRFMT_UYVY | OVL_CON_MTX_YUV_TO_RGB;
@@ -403,6 +456,8 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	unsigned int fmt = pending->format;
 	unsigned int offset = (pending->y << 16) | pending->x;
 	unsigned int src_size = (pending->height << 16) | pending->width;
+	unsigned int blend_mode = state->base.pixel_blend_mode;
+	unsigned int ignore_pixel_alpha = 0;
 	unsigned int con;
 	bool is_afbc = pending->modifier != DRM_FORMAT_MOD_LINEAR;
 	union overlay_pitch {
@@ -420,9 +475,15 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		return;
 	}
 
-	con = ovl_fmt_convert(ovl, fmt);
-	if (state->base.fb && state->base.fb->format->has_alpha)
-		con |= OVL_CON_AEN | OVL_CON_ALPHA;
+	con = ovl_fmt_convert(ovl, fmt, blend_mode);
+	if (state->base.fb) {
+		con |= OVL_CON_AEN;
+		con |= state->base.alpha & OVL_CON_ALPHA;
+	}
+
+	if (blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
+	    (state->base.fb && !state->base.fb->format->has_alpha))
+		ignore_pixel_alpha = OVL_CONST_BLEND;
 
 	if (pending->rotation & DRM_MODE_REFLECT_Y) {
 		con |= OVL_CON_VIRT_FLIP;
@@ -439,8 +500,8 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 
 	mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_CON(idx));
-	mtk_ddp_write_relaxed(cmdq_pkt, overlay_pitch.split_pitch.lsb, &ovl->cmdq_reg, ovl->regs,
-			      DISP_REG_OVL_PITCH(idx));
+	mtk_ddp_write_relaxed(cmdq_pkt, overlay_pitch.split_pitch.lsb | ignore_pixel_alpha,
+			      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH(idx));
 	mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_SRC_SIZE(idx));
 	mtk_ddp_write_relaxed(cmdq_pkt, offset, &ovl->cmdq_reg, ovl->regs,
-- 
2.18.0


