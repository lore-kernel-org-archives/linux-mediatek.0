Return-Path: <SRS0=EkB4=4W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D595C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 16:01:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8205208CD
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 16:01:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qE9Uv+mH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8205208CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ImeY6as63ajLyZaiO+rdbpRwx+giytAyJoLgjhC6aMA=; b=qE9Uv+mHsTjC2N
	v4i1frgbi14TvrApckwGjaknejzE4aF9uc5xWEelbUnbEBMJaIh6dM0xsfw/IB6iR1tbxvkRRcFj2
	NNlgqPjUORqkAXPyTFbMyO+al4mhCjKXldhKm/h2NGtJIETEHb5e6PUFssa+v6tUKaXA7LX/DxG+T
	SEHFexkXC8moH2yr2UJShuf9nHAyYb8y6TnRiP2BNMTFOwMNYxGESmn3THPZKH8ZySGdRxOKsIxX/
	gly3Lr3f8fSLJOvoY8lE/8BneRp74z5Pjv/LpIvlDZd47hccYmWDphdIwQmOSVneJWb1HKMLt90w/
	SCitLKfUMo/Y+5u5kdiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9swN-0008PR-K9; Thu, 05 Mar 2020 16:01:39 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9sv2-0006xi-Th; Thu, 05 Mar 2020 16:00:20 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CF5EAABCF;
 Thu,  5 Mar 2020 16:00:13 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org, abrodkin@synopsys.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jingoohan1@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, stefan@agner.ch, alison.wang@nxp.com,
 patrik.r.jakobsson@gmail.com, xinliang.liu@linaro.org,
 zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 linux@armlinux.org.uk, p.zabel@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, paul@crapouillou.net, ck.hu@mediatek.com,
 matthias.bgg@gmail.com, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
 heiko@sntech.de, wens@csie.org, jernej.skrabec@siol.net,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jsarha@ti.com,
 tomi.valkeinen@ti.com, eric@anholt.net, kraxel@redhat.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 sebastian.reichel@collabora.com
Subject: [PATCH 14/22] drm/sun4i: Use simple encoder
Date: Thu,  5 Mar 2020 16:59:42 +0100
Message-Id: <20200305155950.2705-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200305155950.2705-1-tzimmermann@suse.de>
References: <20200305155950.2705-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_080017_611256_98404DE8 
X-CRM114-Status: GOOD (  12.44  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The ingenic driver uses empty implementations for its encoders. Replace
the code with the generic simple encoder.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 12 +++---------
 drivers/gpu/drm/sun4i/sun4i_lvds.c     | 12 +++---------
 drivers/gpu/drm/sun4i/sun4i_rgb.c      | 17 +++--------------
 drivers/gpu/drm/sun4i/sun4i_tv.c       | 17 +++--------------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 12 +++---------
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  |  8 ++------
 6 files changed, 17 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 68d4644ac2dc..e324d7db7b7d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -22,6 +22,7 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "sun4i_backend.h"
 #include "sun4i_crtc.h"
@@ -204,10 +205,6 @@ static const struct drm_encoder_helper_funcs sun4i_hdmi_helper_funcs = {
 	.mode_valid	= sun4i_hdmi_mode_valid,
 };
 
-static const struct drm_encoder_funcs sun4i_hdmi_funcs = {
-	.destroy	= drm_encoder_cleanup,
-};
-
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
@@ -611,11 +608,8 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 
 	drm_encoder_helper_add(&hdmi->encoder,
 			       &sun4i_hdmi_helper_funcs);
-	ret = drm_encoder_init(drm,
-			       &hdmi->encoder,
-			       &sun4i_hdmi_funcs,
-			       DRM_MODE_ENCODER_TMDS,
-			       NULL);
+	ret = drm_simple_encoder_init(drm, &hdmi->encoder,
+				      DRM_MODE_ENCODER_TMDS);
 	if (ret) {
 		dev_err(dev, "Couldn't initialise the HDMI encoder\n");
 		goto err_put_ddc_i2c;
diff --git a/drivers/gpu/drm/sun4i/sun4i_lvds.c b/drivers/gpu/drm/sun4i/sun4i_lvds.c
index 26e5c7ceb8ff..ffda3184aa12 100644
--- a/drivers/gpu/drm/sun4i/sun4i_lvds.c
+++ b/drivers/gpu/drm/sun4i/sun4i_lvds.c
@@ -12,6 +12,7 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "sun4i_crtc.h"
 #include "sun4i_tcon.h"
@@ -96,10 +97,6 @@ static const struct drm_encoder_helper_funcs sun4i_lvds_enc_helper_funcs = {
 	.enable		= sun4i_lvds_encoder_enable,
 };
 
-static const struct drm_encoder_funcs sun4i_lvds_enc_funcs = {
-	.destroy	= drm_encoder_cleanup,
-};
-
 int sun4i_lvds_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 {
 	struct drm_encoder *encoder;
@@ -121,11 +118,8 @@ int sun4i_lvds_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 
 	drm_encoder_helper_add(&lvds->encoder,
 			       &sun4i_lvds_enc_helper_funcs);
-	ret = drm_encoder_init(drm,
-			       &lvds->encoder,
-			       &sun4i_lvds_enc_funcs,
-			       DRM_MODE_ENCODER_LVDS,
-			       NULL);
+	ret = drm_simple_encoder_init(drm, &lvds->encoder,
+				      DRM_MODE_ENCODER_LVDS);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't initialise the lvds encoder\n");
 		goto err_out;
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index 3b23d5be3cf3..5a7d43939ae6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -14,6 +14,7 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "sun4i_crtc.h"
 #include "sun4i_tcon.h"
@@ -188,15 +189,6 @@ static struct drm_encoder_helper_funcs sun4i_rgb_enc_helper_funcs = {
 	.mode_valid	= sun4i_rgb_mode_valid,
 };
 
-static void sun4i_rgb_enc_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
-}
-
-static struct drm_encoder_funcs sun4i_rgb_enc_funcs = {
-	.destroy	= sun4i_rgb_enc_destroy,
-};
-
 int sun4i_rgb_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 {
 	struct drm_encoder *encoder;
@@ -218,11 +210,8 @@ int sun4i_rgb_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 
 	drm_encoder_helper_add(&rgb->encoder,
 			       &sun4i_rgb_enc_helper_funcs);
-	ret = drm_encoder_init(drm,
-			       &rgb->encoder,
-			       &sun4i_rgb_enc_funcs,
-			       DRM_MODE_ENCODER_NONE,
-			       NULL);
+	ret = drm_simple_encoder_init(drm, &rgb->encoder,
+				      DRM_MODE_ENCODER_NONE);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't initialise the rgb encoder\n");
 		goto err_out;
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 39c15282e448..63f4428ac3bf 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -19,6 +19,7 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "sun4i_crtc.h"
 #include "sun4i_drv.h"
@@ -473,15 +474,6 @@ static struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
 	.mode_set	= sun4i_tv_mode_set,
 };
 
-static void sun4i_tv_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
-}
-
-static struct drm_encoder_funcs sun4i_tv_funcs = {
-	.destroy	= sun4i_tv_destroy,
-};
-
 static int sun4i_tv_comp_get_modes(struct drm_connector *connector)
 {
 	int i;
@@ -592,11 +584,8 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 
 	drm_encoder_helper_add(&tv->encoder,
 			       &sun4i_tv_helper_funcs);
-	ret = drm_encoder_init(drm,
-			       &tv->encoder,
-			       &sun4i_tv_funcs,
-			       DRM_MODE_ENCODER_TVDAC,
-			       NULL);
+	ret = drm_simple_encoder_init(drm, &tv->encoder,
+				      DRM_MODE_ENCODER_TVDAC);
 	if (ret) {
 		dev_err(dev, "Couldn't initialise the TV encoder\n");
 		goto err_disable_clk;
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 059939789730..f6c67dd87a05 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -24,6 +24,7 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "sun4i_crtc.h"
 #include "sun4i_tcon.h"
@@ -846,10 +847,6 @@ static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs = {
 	.enable		= sun6i_dsi_encoder_enable,
 };
 
-static const struct drm_encoder_funcs sun6i_dsi_enc_funcs = {
-	.destroy	= drm_encoder_cleanup,
-};
-
 static u32 sun6i_dsi_dcs_build_pkt_hdr(struct sun6i_dsi *dsi,
 				       const struct mipi_dsi_msg *msg)
 {
@@ -1062,11 +1059,8 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 
 	drm_encoder_helper_add(&dsi->encoder,
 			       &sun6i_dsi_enc_helper_funcs);
-	ret = drm_encoder_init(drm,
-			       &dsi->encoder,
-			       &sun6i_dsi_enc_funcs,
-			       DRM_MODE_ENCODER_DSI,
-			       NULL);
+	ret = drm_simple_encoder_init(drm, &dsi->encoder,
+				      DRM_MODE_ENCODER_DSI);
 	if (ret) {
 		dev_err(dsi->dev, "Couldn't initialise the DSI encoder\n");
 		return ret;
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index e8a317d5ba19..972682bb8000 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "sun8i_dw_hdmi.h"
 #include "sun8i_tcon_top.h"
@@ -29,10 +30,6 @@ sun8i_dw_hdmi_encoder_helper_funcs = {
 	.mode_set = sun8i_dw_hdmi_encoder_mode_set,
 };
 
-static const struct drm_encoder_funcs sun8i_dw_hdmi_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static enum drm_mode_status
 sun8i_dw_hdmi_mode_valid_a83t(struct drm_connector *connector,
 			      const struct drm_display_mode *mode)
@@ -220,8 +217,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	}
 
 	drm_encoder_helper_add(encoder, &sun8i_dw_hdmi_encoder_helper_funcs);
-	drm_encoder_init(drm, encoder, &sun8i_dw_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 
 	sun8i_hdmi_phy_init(hdmi->phy);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
