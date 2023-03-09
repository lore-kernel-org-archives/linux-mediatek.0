Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5E2C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 21:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvVBHvYo5PCvL4M3dFLxsMPnjamk2TTn3KNNyLW5LSk=; b=ZzDpwYZFSa5okA8D9oHa/TCijf
	tlviNbS7WdI3GjkrSeYiau2DGQxgb/axMzGnz49+WWn1ChNrt8yUOlpG2gWxSDLvSzE9MiceIcnX0
	SdGNHwiSs+UirV2u3jAFs14RVLqROspvjwpOzrGkziI+xh6/BKpyya0ZEqusMHpEBXslwwlm51+5C
	iTv1NctWJiZ08SXsx3inw20ggLybIkF/aAj8n6boZbLjBxOCyD9zrByBIMzFnHcJhs07Uy4ETV7bB
	9TSxYRAJoeRGfacioYUeJB3xI5lYYFm+pdgsPiZob/TvMRmLSRuxXVbKxyV4RpzLbtbX1BWk5easi
	Ub5dA7Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNSF-00BvOe-HT; Thu, 09 Mar 2023 21:05:39 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNS9-00BvLf-Lk
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 21:05:37 +0000
Received: by mail-qt1-x82a.google.com with SMTP id y10so3612672qtj.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 13:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678395932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvVBHvYo5PCvL4M3dFLxsMPnjamk2TTn3KNNyLW5LSk=;
        b=XWCPwUQGxJMWuwLvyWPN20b7x+5F9L8NgqXR1YlWFwn9BFTLvR+6z7FoEytMc4WcGb
         xC0qmknL7itNZpujB5p5fAme/f8rzPOkMg2djObe1nfb/m7PFJAirfIDSQbsc2QA26wr
         xofBWKsau0aTZyRSDLdUahS8oKI9GZnSd/C1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678395932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvVBHvYo5PCvL4M3dFLxsMPnjamk2TTn3KNNyLW5LSk=;
        b=GSu8a8vcKQIAtcHZEtfxX3zY7zE0pbT/pXKfDNvGl8r6MahSETozZe9zLLqFg3oQrj
         TIfL7C7YpBHvI0M4+WR5FnjoH7MBheU9A3PEYdJ0H6WN/Yx954muR9TbTm0gkKviN0Fe
         7ooEGX0sfUCL4F2GpJkrdyFBrIaXnlddfqrlK0g7DRbg698pxCO8ScRjsPHoH2Uw9IR7
         OZTlHrvbs3k2ti6uk6qtuvdkSgtOHDywX+lk7mzEnJ+xOx1tG8eubteSAgu8QSWWGAHW
         fVx864ODpQVvt3n/NuAXPF3Ftq46upatVc9p125cBixfsC4P8N97Gnlhc8716gnPe8Gi
         bWaA==
X-Gm-Message-State: AO0yUKV7YiLMTIyYt6sKp33WyfIF/MbkD6ZIStOiLRKWBf7voqC1NfB+
	9IioXciOb6U6LuWO96Laidi+1JliG95WhgW+LIPoiQ==
X-Google-Smtp-Source: AK7set+yTjyyrP7pSXYGgS3TOnfnhe8YnQQ/L6dG5pAPlJmihwJcNEaLZqoMrWZzeMVh0n1eTgXjrQ==
X-Received: by 2002:ac8:5c13:0:b0:3c0:3b79:9fb0 with SMTP id i19-20020ac85c13000000b003c03b799fb0mr18754512qti.47.1678395931928;
        Thu, 09 Mar 2023 13:05:31 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:a575:2520:a8e1:989d])
        by smtp.gmail.com with ESMTPSA id 69-20020a370548000000b007426f115a4esm14302375qkf.129.2023.03.09.13.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 13:05:31 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	justin.yeh@mediatek.com,
	wenst@chromium.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	daniel@ffwll.ch,
	daniel@fooishbar.org,
	greenjustin@chromium.org
Subject: [PATCH v8 1/3] drm/mediatek: Refactor pixel format logic
Date: Thu,  9 Mar 2023 16:04:14 -0500
Message-Id: <20230309210416.1167020-2-greenjustin@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230309210416.1167020-1-greenjustin@chromium.org>
References: <20230309210416.1167020-1-greenjustin@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_130533_768789_C29BBDBF 
X-CRM114-Status: GOOD (  16.95  )
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

Add an DDP component interface for querying pixel format support and move list
of supported pixel formats into DDP components instead of mtk_drm_plane.c

Tested by running Chrome on an MT8195.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 ++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 44 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 38 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 ++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 24 ++++-------
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
 8 files changed, 123 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 33e61a136bbc..0df6a06defb8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -96,6 +96,8 @@ void mtk_ovl_register_vblank_cb(struct device *dev,
 void mtk_ovl_unregister_vblank_cb(struct device *dev);
 void mtk_ovl_enable_vblank(struct device *dev);
 void mtk_ovl_disable_vblank(struct device *dev);
+const u32 *mtk_ovl_get_formats(struct device *dev);
+size_t mtk_ovl_get_num_formats(struct device *dev);
 
 void mtk_rdma_bypass_shadow(struct device *dev);
 int mtk_rdma_clk_enable(struct device *dev);
@@ -115,6 +117,8 @@ void mtk_rdma_register_vblank_cb(struct device *dev,
 void mtk_rdma_unregister_vblank_cb(struct device *dev);
 void mtk_rdma_enable_vblank(struct device *dev);
 void mtk_rdma_disable_vblank(struct device *dev);
+const u32 *mtk_rdma_get_formats(struct device *dev);
+size_t mtk_rdma_get_num_formats(struct device *dev);
 
 int mtk_mdp_rdma_clk_enable(struct device *dev);
 void mtk_mdp_rdma_clk_disable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 84daeaffab6a..8743c8047dc9 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -66,6 +66,20 @@
 #define	OVL_CON_VIRT_FLIP	BIT(9)
 #define	OVL_CON_HORZ_FLIP	BIT(10)
 
+static const u32 mt8173_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+};
+
 struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
@@ -73,6 +87,8 @@ struct mtk_disp_ovl_data {
 	bool fmt_rgb565_is_0;
 	bool smi_id_en;
 	bool supports_afbc;
+	const u32 *formats;
+	size_t num_formats;
 };
 
 /*
@@ -138,6 +154,20 @@ void mtk_ovl_disable_vblank(struct device *dev)
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
 }
 
+const u32 *mtk_ovl_get_formats(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return ovl->data->formats;
+}
+
+size_t mtk_ovl_get_num_formats(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return ovl->data->num_formats;
+}
+
 int mtk_ovl_clk_enable(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
@@ -495,6 +525,8 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = false,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
@@ -502,6 +534,8 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
@@ -509,6 +543,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
@@ -516,6 +552,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
@@ -524,6 +562,8 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
@@ -532,6 +572,8 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
@@ -541,6 +583,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 0ec2e4049e07..cf92df845160 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -54,8 +54,24 @@
 
 #define RDMA_MEM_GMC				0x40402020
 
+static const u32 mt8173_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+};
+
 struct mtk_disp_rdma_data {
 	unsigned int fifo_size;
+	const u32 *formats;
+	size_t num_formats;
 };
 
 /*
@@ -126,6 +142,20 @@ void mtk_rdma_disable_vblank(struct device *dev)
 	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT, 0);
 }
 
+const u32 *mtk_rdma_get_formats(struct device *dev)
+{
+	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
+
+	return rdma->data->formats;
+}
+
+size_t mtk_rdma_get_num_formats(struct device *dev)
+{
+	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
+
+	return rdma->data->num_formats;
+}
+
 int mtk_rdma_clk_enable(struct device *dev)
 {
 	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
@@ -360,18 +390,26 @@ static int mtk_disp_rdma_remove(struct platform_device *pdev)
 
 static const struct mtk_disp_rdma_data mt2701_rdma_driver_data = {
 	.fifo_size = SZ_4K,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_rdma_data mt8173_rdma_driver_data = {
 	.fifo_size = SZ_8K,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_rdma_data mt8183_rdma_driver_data = {
 	.fifo_size = 5 * SZ_1K,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_rdma_data mt8195_rdma_driver_data = {
 	.fifo_size = 1920,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 112615817dcb..2ba01c484228 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -856,7 +856,9 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 				BIT(pipe),
 				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
 							num_planes),
-				mtk_ddp_comp_supported_rotations(comp));
+				mtk_ddp_comp_supported_rotations(comp),
+				mtk_ddp_comp_get_formats(comp),
+				mtk_ddp_comp_get_num_formats(comp));
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 6b6d5335c834..4a4c1928f83d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -359,6 +359,8 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
 	.layer_config = mtk_ovl_layer_config,
 	.bgclr_in_on = mtk_ovl_bgclr_in_on,
 	.bgclr_in_off = mtk_ovl_bgclr_in_off,
+	.get_formats = mtk_ovl_get_formats,
+	.get_num_formats = mtk_ovl_get_num_formats,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_postmask = {
@@ -381,6 +383,8 @@ static const struct mtk_ddp_comp_funcs ddp_rdma = {
 	.disable_vblank = mtk_rdma_disable_vblank,
 	.layer_nr = mtk_rdma_layer_nr,
 	.layer_config = mtk_rdma_layer_config,
+	.get_formats = mtk_rdma_get_formats,
+	.get_num_formats = mtk_rdma_get_num_formats,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_ufoe = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 2d0052c23dcb..7f2e638cfdc2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -71,6 +71,8 @@ struct mtk_ddp_comp_funcs {
 	void (*bgclr_in_off)(struct device *dev);
 	void (*ctm_set)(struct device *dev,
 			struct drm_crtc_state *state);
+	const u32 *(*get_formats)(struct device *dev);
+	size_t (*get_num_formats)(struct device *dev);
 };
 
 struct mtk_ddp_comp {
@@ -203,6 +205,24 @@ static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
 		comp->funcs->ctm_set(comp->dev, state);
 }
 
+static inline
+const u32 *mtk_ddp_comp_get_formats(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->get_formats)
+		return comp->funcs->get_formats(comp->dev);
+
+	return NULL;
+}
+
+static inline
+size_t mtk_ddp_comp_get_num_formats(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->get_num_formats)
+		return comp->funcs->get_num_formats(comp->dev);
+
+	return 0;
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index d54fbf34b000..31f9420aff6f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -19,20 +19,6 @@
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
 
-static const u32 formats[] = {
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_BGRX8888,
-	DRM_FORMAT_BGRA8888,
-	DRM_FORMAT_ABGR8888,
-	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_RGB888,
-	DRM_FORMAT_BGR888,
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_UYVY,
-	DRM_FORMAT_YUYV,
-};
-
 static const u64 modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
@@ -315,13 +301,19 @@ static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
 
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
-		   unsigned int supported_rotations)
+		   unsigned int supported_rotations, const u32 *formats,
+		   size_t num_formats)
 {
 	int err;
 
+	if (!formats || !num_formats) {
+		DRM_ERROR("no formats for plane\n");
+		return -EINVAL;
+	}
+
 	err = drm_universal_plane_init(dev, plane, possible_crtcs,
 				       &mtk_plane_funcs, formats,
-				       ARRAY_SIZE(formats), modifiers, type, NULL);
+				       num_formats, modifiers, type, NULL);
 	if (err) {
 		DRM_ERROR("failed to initialize plane\n");
 		return err;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index 8f39011cdbfc..99aff7da0831 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -48,6 +48,7 @@ to_mtk_plane_state(struct drm_plane_state *state)
 
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
-		   unsigned int supported_rotations);
+		   unsigned int supported_rotations, const u32 *formats,
+		   size_t num_formats);
 
 #endif
-- 
2.39.1.456.gfc5497dd1b-goog


