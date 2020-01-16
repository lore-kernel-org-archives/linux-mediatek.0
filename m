Return-Path: <SRS0=rC0f=3F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0BFC32771
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 02:25:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DFEE207E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 02:25:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L2tERStj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Xfmj0Xqn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DFEE207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwQR+o/R3X2JTmLzZKsobuHpq2hhfCL72EZtuKsv73g=; b=L2tERStjsyvrGU
	BEKp1k4UnGNhWeX/+4VsJKLl5gPJKHmRTvJ6q1dmWTdZQX/25VETHuDP4VuqRvA98UuRhGcBvddwM
	R+PnlauFFGnLZNrjXw8uP6Q1uruahXMH/1uGNG3NISvgj6NGN6pJTweygih7tgQ6U+bFm6IwfdtSQ
	IIMEbOdSrVgNFq36yK5tKe9UqJtXe1lafZNloEqBWfWJnbArMTWJ2acwotfFfyKUqGqINHBSuV6ps
	JDjvHNuES3sDYc+p25FxaWp8sAdQ+uT8umcVK6yiBd1dOobaz73hwps/xjaiT4aaiUjbuXbYfppDt
	6jcvj39M1W53jUdga+mQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iruqf-0001b1-JA; Thu, 16 Jan 2020 02:25:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iruqc-0001aB-F5
 for linux-mediatek@lists.infradead.org; Thu, 16 Jan 2020 02:25:28 +0000
X-UUID: 77a7307f42274f8ebbcc2ef32549e6ba-20200115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ivEcPT8iEpAX9W6/VujM8EVm+W1Y9SnJ0dVmMcBNlH8=; 
 b=Xfmj0XqnyVnPUnXKOcXQoDdQazli1e0cvGmAGK/uHUMZ3ZlMEBmETiEsiAdheYZaLp/5V2LMc0mkQnGq/zsIkM0H6+v74yor+pGO2xIWcyMiiEkuQ68F3kPbG+GR0UVyN+bWvfQI/mCU7Ak0g9PsAmKWTYCWmYdsJC+dQrpXt8Y=;
X-UUID: 77a7307f42274f8ebbcc2ef32549e6ba-20200115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1760322169; Wed, 15 Jan 2020 18:25:23 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 15 Jan 2020 18:16:16 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 16 Jan 2020 10:14:15 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 16 Jan 2020 10:14:27 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 3/5] drm/panel: support for auo,
 kd101n80-45na wuxga dsi video mode panel
Date: Thu, 16 Jan 2020 10:15:09 +0800
Message-ID: <20200116021511.22675-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200116021511.22675-1-jitao.shi@mediatek.com>
References: <20200116021511.22675-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A9E163718BE7D98B910CE3EDC929C20F035A8CDDEAAD2CE69E028F97959B0B892000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_182526_725722_FB829368 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Auo,kd101n80-45na's connector is same as boe,tv101wum-nl6.
The most codes can be reuse.
So auo,kd101n80-45na and boe,tv101wum-nl6 use one driver file.
Add the different parts in driver data.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  6 +-
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 64 +++++++++++++++++--
 2 files changed, 61 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ca727c233a9a..b5413edd625b 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -30,13 +30,13 @@ config DRM_PANEL_BOE_HIMAX8279D
 	  the host and has a built-in LED backlight.
 
 config DRM_PANEL_BOE_TV101WUM_NL6
-	tristate "BOE TV101WUM 1200x1920 panel"
+	tristate "BOE TV101WUM and AUO KD101N80 45NA 1200x1920 panel"
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
-	  Say Y here if you want to support for BOE TV101WUM WUXGA PANEL
-	  DSI Video Mode panel
+	  Say Y here if you want to support for BOE TV101WUM and AUO KD101N80
+	  45NA WUXGA PANEL DSI Video Mode panel
 
 config DRM_PANEL_LVDS
 	tristate "Generic LVDS panel driver"
diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 51fde588adc1..2160144ca51b 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -34,6 +34,7 @@ struct panel_desc {
 	enum mipi_dsi_pixel_format format;
 	const struct panel_init_cmd *init_cmds;
 	unsigned int lanes;
+	bool discharge_on_disable;
 };
 
 struct boe_panel {
@@ -367,6 +368,15 @@ static const struct panel_init_cmd boe_init_cmd[] = {
 	{},
 };
 
+static const struct panel_init_cmd auo_kd101n80_45na_init_cmd[] = {
+	_INIT_DELAY_CMD(24),
+	_INIT_DCS_CMD(0x11),
+	_INIT_DELAY_CMD(120),
+	_INIT_DCS_CMD(0x29),
+	_INIT_DELAY_CMD(120),
+	{},
+};
+
 static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)
 {
 	return container_of(panel, struct boe_panel, base);
@@ -444,12 +454,22 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 	}
 
 	msleep(150);
-	gpiod_set_value(boe->enable_gpio, 0);
-	usleep_range(500, 1000);
-	regulator_disable(boe->avee);
-	regulator_disable(boe->avdd);
-	usleep_range(5000, 7000);
-	regulator_disable(boe->pp1800);
+
+	if (boe->desc->discharge_on_disable) {
+		regulator_disable(boe->avee);
+		regulator_disable(boe->avdd);
+		usleep_range(5000, 7000);
+		gpiod_set_value(boe->enable_gpio, 0);
+		usleep_range(5000, 7000);
+		regulator_disable(boe->pp1800);
+	} else {
+		gpiod_set_value(boe->enable_gpio, 0);
+		usleep_range(500, 1000);
+		regulator_disable(boe->avee);
+		regulator_disable(boe->avdd);
+		usleep_range(5000, 7000);
+		regulator_disable(boe->pp1800);
+	}
 
 	boe->prepared = false;
 
@@ -542,6 +562,35 @@ static const struct panel_desc boe_tv101wum_nl6_desc = {
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 		      MIPI_DSI_MODE_LPM,
 	.init_cmds = boe_init_cmd,
+	.discharge_on_disable = false,
+};
+
+static const struct drm_display_mode auo_kd101n80_45na_default_mode = {
+	.clock = 157000,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 80,
+	.hsync_end = 1200 + 80 + 24,
+	.htotal = 1200 + 80 + 24 + 36,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 16,
+	.vsync_end = 1920 + 16 + 4,
+	.vtotal = 1920 + 16 + 4 + 16,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc auo_kd101n80_45na_desc = {
+	.modes = &auo_kd101n80_45na_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 135,
+		.height_mm = 216,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init_cmds = auo_kd101n80_45na_init_cmd,
+	.discharge_on_disable = true,
 };
 
 static int boe_panel_get_modes(struct drm_panel *panel,
@@ -673,6 +722,9 @@ static const struct of_device_id boe_of_match[] = {
 	{ .compatible = "boe,tv101wum-nl6",
 	  .data = &boe_tv101wum_nl6_desc
 	},
+	{ .compatible = "auo,kd101n80-45na",
+	  .data = &auo_kd101n80_45na_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, boe_of_match);
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
