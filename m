Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C214AC54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 23:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mA1eEQId+fRadARgVpAGn3OX27BY/xF1SB4oOj5Sfcc=; b=0tLfjVo90LNj5AzYKPIibEjHGO
	Cxjo4/+nwh/6d3n/9VVSnEHMsN1NvSrFSlLcUzqLJd1v8OIjxxrJLbbxZtb0eEaBIUQePKkozseVg
	RUQ4jUgYE3AVCR82MODEqalaJp9ufFlX2KnLG8zhXB9SA55OJsF8nNRtEUTPWSr4ua7LGXx4tUAGi
	hXEs2vpKoYTwxZ/ufmxhI++5/LExBCONGzGq/E67j4mWw/AGw6IbNVco4QW2uGWWe+XSWxKvo1Jea
	H7CooaBBOlmTHB8109xrBjY+Fn5rJ2MWhWeb/5H3T/pxzvga8jIP05mEd8G1O71qKbAxjQvGCWgn9
	V8rUq15w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLXjJ-00GmCj-V3; Fri, 27 Jan 2023 23:01:57 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLXjG-00GmAt-Qu
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 23:01:57 +0000
Received: by mail-oi1-x22a.google.com with SMTP id r9so5368813oig.12
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 15:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mA1eEQId+fRadARgVpAGn3OX27BY/xF1SB4oOj5Sfcc=;
        b=eDxsbIc99OM4JSDrGKol8A9E0+aFZeUVBPCZfDRI0UjRJ0LlcaUhkPhneOoRDnb/OP
         RjuyJy6wMCOT6js7DO6hH8pGQZpiyTdCEVBxBl2jEb46Pt5OwjJwkiH3ZkIfevfAn4Ej
         zGz/Zq+uHTD1vZmscC50OYHqY3K+jToDxUF0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mA1eEQId+fRadARgVpAGn3OX27BY/xF1SB4oOj5Sfcc=;
        b=GUeDQYq1kFoAQ9rz3ox/AMkmJNw4MH+bBHblO4TVmVM0AAC2bIGvY3qTdgh9YAshu0
         Cphaf4D3WSc+KsgxpESXRe1NifXrSXJK+IXQcZr+GT++5EwzXgDax9SGGQwHcs9MZdvS
         K/GuV4RcjeN1UbJoDpbSUREbKPJ7cOyruVoKog9odigm0Zy+mqiOnng2Arx93a8afcN4
         R3uElMEvaBi/dc2fSM5q8VViN3X7hn1xm7Ko0CFOpJdnhJ9hUkUQfm+k+owWB+dvqWJ1
         uIXR/mMaMj6QPbPDlC05il1Navz2UdzJbp1o92eGNFZVG217oYzEDM3EfMam/o4VzvjA
         gbXw==
X-Gm-Message-State: AFqh2kr027hOW7MjJQPsfYyCsWAJLj2GvtRLnwlWa9faFyQ9dnzaDR8O
	Sx7H+ziUJ1MV4R/5cEy8mzdj6H5oy1S3+9DP
X-Google-Smtp-Source: AMrXdXvv/rYSpKFQ/LEDznU6ounhRBpLnDgiWgIPpjfHwMczW/2W6LO4MsR1ocQEgXff/puIUy8xUg==
X-Received: by 2002:a05:6808:8f0:b0:361:105e:a7b9 with SMTP id d16-20020a05680808f000b00361105ea7b9mr17272451oic.18.1674860511524;
        Fri, 27 Jan 2023 15:01:51 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:64e8:5795:9a35:1a2c])
        by smtp.gmail.com with ESMTPSA id e8-20020a05620a12c800b006fa22f0494bsm3711133qkl.117.2023.01.27.15.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 15:01:51 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
X-Google-Original-From: Justin Green <greenjustin@google.com>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	justin.yeh@mediatek.com,
	wenst@chromium.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	matthias.bgg@gmail.com,
	daniel@ffwll.ch,
	daniel@fooishbar.org,
	greenjustin@chromium.org,
	Justin Green <greenjustin@google.com>
Subject: [PATCH v3] drm/mediatek: Add support for AR30 and BA30
Date: Fri, 27 Jan 2023 18:01:23 -0500
Message-Id: <20230127230123.941930-1-greenjustin@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_150154_913419_A10097ED 
X-CRM114-Status: GOOD (  18.50  )
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

Add support for AR30 and BA30 pixel formats to the Mediatek DRM driver.

Tested using "modetest -P" on an MT8195.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
v2:
 * Rebase and resolve merge conflicts with the AFBC patch.
v3:
 * Moved 10-bit support detection to mtk_disk_ovl.c

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 37 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  3 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 10 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 37 ++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  2 +-
 7 files changed, 84 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 33e61a136bbc..b75139da3032 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -96,6 +96,7 @@ void mtk_ovl_register_vblank_cb(struct device *dev,
 void mtk_ovl_unregister_vblank_cb(struct device *dev);
 void mtk_ovl_enable_vblank(struct device *dev);
 void mtk_ovl_disable_vblank(struct device *dev);
+int mtk_ovl_supports_10bit(struct device *dev);
 
 void mtk_rdma_bypass_shadow(struct device *dev);
 int mtk_rdma_clk_enable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 84daeaffab6a..412a749a509e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -41,6 +41,7 @@
 #define DISP_REG_OVL_RDMA_CTRL(n)		(0x00c0 + 0x20 * (n))
 #define DISP_REG_OVL_RDMA_GMC(n)		(0x00c8 + 0x20 * (n))
 #define DISP_REG_OVL_ADDR_MT2701		0x0040
+#define DISP_REG_OVL_CLRFMT_EXT			0x02D0
 #define DISP_REG_OVL_ADDR_MT8173		0x0f40
 #define DISP_REG_OVL_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n))
 #define DISP_REG_OVL_HDR_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n) + 0x04)
@@ -61,6 +62,10 @@
 					0 : OVL_CON_CLRFMT_RGB)
 #define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
 					OVL_CON_CLRFMT_RGB : 0)
+#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(ovl)	(0xFF << 4 * (ovl))
+#define OVL_CON_CLRFMT_BIT_DEPTH(depth, ovl)	(depth << 4 * (ovl))
+#define OVL_CON_CLRFMT_8_BIT			0x00
+#define OVL_CON_CLRFMT_10_BIT			0x01
 #define	OVL_CON_AEN		BIT(8)
 #define	OVL_CON_ALPHA		0xff
 #define	OVL_CON_VIRT_FLIP	BIT(9)
@@ -73,6 +78,7 @@ struct mtk_disp_ovl_data {
 	bool fmt_rgb565_is_0;
 	bool smi_id_en;
 	bool supports_afbc;
+	bool supports_10bit;
 };
 
 /*
@@ -188,6 +194,26 @@ static void mtk_ovl_set_afbc(struct mtk_disp_ovl *ovl, struct cmdq_pkt *cmdq_pkt
 			   DISP_REG_OVL_DATAPATH_CON, OVL_LAYER_AFBC_EN(idx));
 }
 
+static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 format,
+				  struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+	unsigned int reg;
+	unsigned int bit_depth = OVL_CON_CLRFMT_8_BIT;
+
+	reg = readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
+	reg &= ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
+
+	if (format == DRM_FORMAT_RGBA1010102 ||
+	    format == DRM_FORMAT_BGRA1010102 ||
+	    format == DRM_FORMAT_ARGB2101010)
+		bit_depth = OVL_CON_CLRFMT_10_BIT;
+
+	reg |= OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
+
+	mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_CLRFMT_EXT);
+}
+
 void mtk_ovl_config(struct device *dev, unsigned int w,
 		    unsigned int h, unsigned int vrefresh,
 		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -216,6 +242,13 @@ unsigned int mtk_ovl_supported_rotations(struct device *dev)
 	       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
 }
 
+int mtk_ovl_supports_10bit(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return ovl->data->supports_10bit;
+}
+
 int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
 			struct mtk_plane_state *mtk_state)
 {
@@ -302,9 +335,11 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
 		return OVL_CON_CLRFMT_ARGB8888;
 	case DRM_FORMAT_BGRX8888:
 	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_BGRA1010102:
 		return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_ARGB2101010:
 		return OVL_CON_CLRFMT_RGBA8888;
 	case DRM_FORMAT_XBGR8888:
 	case DRM_FORMAT_ABGR8888:
@@ -388,6 +423,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));
 	}
 
+	mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
 	mtk_ovl_layer_on(dev, idx, cmdq_pkt);
 }
 
@@ -541,6 +577,7 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
+	.supports_10bit = true,
 };
 
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 112615817dcb..9f162c9b504a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -856,7 +856,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 				BIT(pipe),
 				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
 							num_planes),
-				mtk_ddp_comp_supported_rotations(comp));
+				mtk_ddp_comp_supported_rotations(comp),
+				mtk_ddp_comp_supports_10bit(comp));
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 6b6d5335c834..708963c613d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -359,6 +359,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
 	.layer_config = mtk_ovl_layer_config,
 	.bgclr_in_on = mtk_ovl_bgclr_in_on,
 	.bgclr_in_off = mtk_ovl_bgclr_in_off,
+	.supports_10bit = mtk_ovl_supports_10bit,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_postmask = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 2d0052c23dcb..18ec5dca2337 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -71,6 +71,7 @@ struct mtk_ddp_comp_funcs {
 	void (*bgclr_in_off)(struct device *dev);
 	void (*ctm_set)(struct device *dev,
 			struct drm_crtc_state *state);
+	int (*supports_10bit)(struct device *dev);
 };
 
 struct mtk_ddp_comp {
@@ -151,6 +152,15 @@ unsigned int mtk_ddp_comp_supported_rotations(struct mtk_ddp_comp *comp)
 	return 0;
 }
 
+static inline
+int mtk_ddp_comp_supports_10bit(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->supports_10bit)
+		return comp->funcs->supports_10bit;
+
+        return 0;
+}
+
 static inline unsigned int mtk_ddp_comp_layer_nr(struct mtk_ddp_comp *comp)
 {
 	if (comp->funcs && comp->funcs->layer_nr)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index d54fbf34b000..e94a07cdda32 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -19,7 +19,7 @@
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
 
-static const u32 formats[] = {
+static const u32 default_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_BGRX8888,
@@ -41,6 +41,22 @@ static const u64 modifiers[] = {
 	DRM_FORMAT_MOD_INVALID,
 };
 
+static const u32 formats_with_10bit_cap[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+};
+
 static void mtk_plane_reset(struct drm_plane *plane)
 {
 	struct mtk_plane_state *state;
@@ -315,13 +331,24 @@ static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
 
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
-		   unsigned int supported_rotations)
+		   unsigned int supported_rotations, bool supports_10bit)
 {
 	int err;
 
-	err = drm_universal_plane_init(dev, plane, possible_crtcs,
-				       &mtk_plane_funcs, formats,
-				       ARRAY_SIZE(formats), modifiers, type, NULL);
+	if (supports_10bit) {
+		err = drm_universal_plane_init(dev, plane, possible_crtcs,
+					       &mtk_plane_funcs,
+					       formats_with_10bit_cap,
+					       ARRAY_SIZE(formats_with_10bit_cap),
+					       modifiers, type, NULL);
+	} else {
+		err = drm_universal_plane_init(dev, plane, possible_crtcs,
+					       &mtk_plane_funcs,
+					       default_formats,
+					       ARRAY_SIZE(default_formats),
+					       modifiers, type, NULL);
+	}
+
 	if (err) {
 		DRM_ERROR("failed to initialize plane\n");
 		return err;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index 8f39011cdbfc..d3e6f29a1e25 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -48,6 +48,6 @@ to_mtk_plane_state(struct drm_plane_state *state)
 
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
-		   unsigned int supported_rotations);
+		   unsigned int supported_rotations, bool supports_10bit);
 
 #endif
-- 
2.39.1.456.gfc5497dd1b-goog


