Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66B4C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6KllJHUXDeZBXsAtzTGNXsyP9gyEJdVTnwR7KWgVfA=; b=KgA32fEZDSVEz7dv3lzOa/kY74
	sAZ5fhS6orsIePHUQjNx59gGJrBP5Yfc3uAZ+PYIeXcaKgIO8IwjtEKupAvwwtqxRntD2Rm1BXOzc
	Qv0FqGGX7KANYKTb6/nX0/vxIxf+z3B1xZyaa1eF6TGp+w6JPaX4QMdogwgwVCN8djayK2qpai8S4
	gvkH0qLIjib9wFUqsO3KXOeV9n1uQJFDQEVg6DL233OCyVKmKFPM1mj9lRnRa1Pmb1K54W3CM9yGI
	nosZ1fUWyn+XtgMU7KgQPjg0+oH3xkNKXMSnspyJuw4gnUECHSKEGSw8GwxZf/s5mC0kCqOf3glje
	WdagJXZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHXo-00AeXx-5m; Thu, 09 Mar 2023 14:47:00 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHWQ-00Adwr-IK
	for linux-mediatek@bombadil.infradead.org; Thu, 09 Mar 2023 14:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=D6KllJHUXDeZBXsAtzTGNXsyP9gyEJdVTnwR7KWgVfA=; b=XdGtw6tQmB/9nxGZ0gfNjXgzVg
	/nCv/bd5HESMagOJrBRzrzOpE/Cw81V+1HZ6pEMsdiWZTppkldzw+bW7p4HTlIsD1sJg/FddokKbx
	5f0lLLYATVeGt8MHPpiSjmjoIbmJbREJ2ect18FTB38y9NPYP21s2dR89jl3Xpbd6Am73QJIuKZm2
	S5iRqw9Z+kyEVm8js4G/l7CE/Sq13+GiTXLxK1bIE7Suqy8bEqbsoVgemp2g+/0SlW8K1SNyZyVYA
	oK0KDAVXiIXslBA14t1gMs+sNt8ze8lw4IbjamHVN77XAm4HhCFkRuvdetjFEMkafAFfkjdZazuoe
	zyxdconQ==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1paHAw-0008UI-0F
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Mar 2023 14:23:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id k37so1286221wms.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6KllJHUXDeZBXsAtzTGNXsyP9gyEJdVTnwR7KWgVfA=;
        b=fLsjQNlasjebBF0epqPyPa31km+kGq5l8Xk4GxPJTwvF9zJ8Q/7Zd0e4ZGDeQjJuJs
         xw9cESvKeTfO6AA5BJDGhUvflCa2kd5me2Q0w9qrb2ChFHaip3IDsktWhYVy7Nb9Q6mU
         NA7S8qjtDtxr50TPX+fXckg2VtuzGLeV1LorvedOU47YMl00F1g+1m0PfUsQ1WNaiHDr
         MrCtNUIZkRzLI5kgFbZ87qCWu4NzCLeeCGUppie6LnBOwWcmjf4+Wz0NHyG0seHrKuB8
         FINZCxu3qcXVB18sAP65jZ+yZ1OeiEP53WzEuFzLsI0laU+dNumit4oxoTPEPDcNfoXd
         AHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6KllJHUXDeZBXsAtzTGNXsyP9gyEJdVTnwR7KWgVfA=;
        b=lgvxylw4WdWCip9B3z0qrYtt+XLroGkYtbqfoaMRpmSq58JuYYPmgNsw47ttuuWFia
         vbDheeiswOYS4IQbQJF8iYiEVLKnrDGUrkyO7rYhF8Vz5G4cLIDrHd1sSLMNIsSN9Km8
         VKLuIzVKutpQOUeuamaG/MdY3uu3cLppwEWbTi1U/raHW6IL3SYxG/SmTyUZD2lQGA9f
         +16cesQ5+q3ksz74GIhQjWMUnuDuSBCd7YOWRIhqtHq+iziwjJAOrfBEZxtoEgL9Rlly
         4SGqT8Vc5oI4qyaGnX8Da2XVHcyWCEqC5C5wB0KFmSoqiw+/hdZlUbtA3iO7UFpOQyNL
         sTHw==
X-Gm-Message-State: AO0yUKWayzqB7dhwgrzb/EMWHMTL7ah4AYtO1vMYggS5n3SXcWxcRVGs
	lAzftwY6CaRnaW8BQGf67q3YyA==
X-Google-Smtp-Source: AK7set9HyqvkE3Hz8Co8XteBvxDYXIqNVoqota62N1DOTm3jGNqEesiyfh51GaIKBky/QKHG9RaJKA==
X-Received: by 2002:a05:600c:4509:b0:3eb:32ff:da8 with SMTP id t9-20020a05600c450900b003eb32ff0da8mr20829898wmo.16.1678371801592;
        Thu, 09 Mar 2023 06:23:21 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:21 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:10 +0100
Subject: [PATCH 21/21] panel: startek-kd070fhfid015: add support of this display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-21-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=14592;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=F1sY83LBSMBqvT5k/91ULWgrdpy2pr0yELajpS3zmxc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+D2LAvO3T46e1nwJCXWgndX/z0FoMSsVKFeb3
 98OYoTOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURZz3D/
 4uc+5J5MnrgFJzo/vIR01HB+hITFpnLEm7e4yU2pBfkduM69jOnXUHBmZzXYaykPLk/rgB2u2IcNDg
 qwzTloh4D1NicmiHe7rHLpb4Ye0yCemrgBLkJXKLRmauoq9XR46KRgIjaJ1tcLvWkcJXQo2tCku14Z
 dEjqZIsp64IsQevsw4s4mZdtd2fjpEdGRYhYcRE0vfCeS03lNrk4BYmEpGt7doc9vqDD9Alz1gLQeL
 ofjTSNrp0HAK8+GoDSa7kMSPJge7oWTjvDM3m98rerGb0xopnUtcWJuvQIoFxsz+QKSqEoGMqc+jTN
 t8atEzs9MTEYN2c5Eh7dlR4KwbJgzzeNZrWMaFN6AcTrzb7fWBiekiB2fwbaEh4nZKorxiHgtO+c9N
 ZQqfQPGFdLtfe1zw+oW59jXn3GsOr+L//StUCAMnd0owICoi70Cgclvhdk0JixjCiAcCwKMhT1vpOe
 QQCDCMROQeedW8aImyYC7wfMad3vc6kUo072Vf3nbh8ZU8n6kkykfYHa+AxI1du1Opb37R5RYQVSTy
 t+hh5hMb4F79c3mKfM4D86/g9aU0W75yNwZDl7SZP6xMBkzyFuLFezm01u0Qa1TnzIutoDykevwkxj
 MR88e4Ykno09Vi80puy3OgLDKLOPowtpc+gfjfZYE/djx84p+K0AuPF2c91Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_142322_499461_E58F87BE 
X-CRM114-Status: GOOD (  19.74  )
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

From: Guillaume La Roque <glaroque@baylibre.com>

This driver support the Startek KD070FHFID015, which is a 7-inch TFT LCD
display using MIPI DSI interface.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 483 +++++++++++++++++++++
 3 files changed, 496 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 737edcdf9eef..3fccf025013b 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -666,6 +666,17 @@ config DRM_PANEL_SONY_TULIP_TRULY_NT35521
 	  NT35521 1280x720 video mode panel as found on Sony Xperia M4
 	  Aqua phone.
 
+config DRM_PANEL_STARTEK_KD070FHFID015
+	tristate "STARTEK KD070FHFID015 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for STARTEK KD070FHFID015 DSI panel
+	  based on RENESAS-R69429 controller. The pannel is a 7-inch TFT LCD display
+	  with a resolution of 1024 x 600 pixels. It provides a MIPI DSI interface to
+	  the host, a built-in LED backlight and touch controller.
+
 config DRM_PANEL_TDO_TL070WSH30
 	tristate "TDO TL070WSH30 DSI panel"
 	depends on OF
@@ -736,4 +747,5 @@ config DRM_PANEL_XINPENG_XPP055C272
 	  Say Y here if you want to enable support for the Xinpeng
 	  XPP055C272 controller for 720x1280 LCD panels with MIPI/RGB/SPI
 	  system interfaces.
+
 endmenu
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index f8f9d9f6a307..35771fc51187 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
 obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += panel-sony-tulip-truly-nt35521.o
+obj-$(CONFIG_DRM_PANEL_STARTEK_KD070FHFID015) += panel-startek-kd070fhfid015.o
 obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
new file mode 100644
index 000000000000..88466bf6428d
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
@@ -0,0 +1,483 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2016 InforceComputing
+ * Copyright (C) 2016 Linaro Ltd
+ * Copyright (C) 2023 BayLibre, SAS
+ *
+ * Author:
+ * - Vinay Simha BN <simhavcs@gmail.com>
+ * - Sumit Semwal <sumit.semwal@linaro.org>
+ * - Guillaume La Roque <glaroque@baylibre.com>
+ *
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#define DSI_REG_MCAP	0xB0
+#define DSI_REG_IS	0xB3 /* Interface Setting */
+#define DSI_REG_IIS	0xB4 /* Interface ID Setting */
+#define DSI_REG_CTRL	0xB6
+
+struct stk_panel {
+	struct drm_panel base;
+	struct mipi_dsi_device *dsi;
+
+	struct gpio_desc *enable_gpio;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *dcdc_en_gpio;
+	struct backlight_device *backlight;
+	struct regulator *iovcc_supply;
+	struct regulator *power_supply;
+
+	bool prepared;
+	bool enabled;
+
+	const struct drm_display_mode *mode;
+};
+
+static inline struct stk_panel *to_stk_panel(struct drm_panel *panel)
+{
+	return container_of(panel, struct stk_panel, base);
+}
+
+static int stk_panel_init(struct stk_panel *stk)
+{
+	struct mipi_dsi_device *dsi = stk->dsi;
+	struct device *dev = &stk->dsi->dev;
+	int ret;
+
+	ret = mipi_dsi_dcs_soft_reset(dsi);
+	if (ret < 0) {
+		dev_err(dev, "failed to mipi_dsi_dcs_soft_reset: %d\n", ret);
+		return ret;
+	}
+	mdelay(5);
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "failed to set exit sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(120);
+
+	ret = mipi_dsi_generic_write(dsi, (u8[]){DSI_REG_MCAP, 0x04}, 2);
+	if (ret < 0) {
+		dev_err(dev, "failed to set mcap: %d\n", ret);
+		return ret;
+	}
+	/* Interface setting, video mode */
+	ret = mipi_dsi_generic_write(dsi,
+			(u8[]){DSI_REG_IS, 0x14, 0x08, 0x00, 0x22, 0x00}, 6);
+	if (ret < 0) {
+		dev_err(dev, "failed to set display interface setting: %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_generic_write(dsi, (u8[]){DSI_REG_IIS, 0x0C, 0x00}, 3);
+	if (ret < 0) {
+		dev_err(dev, "failed to set Interface ID setting: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_generic_write(dsi, (u8[]){ DSI_REG_CTRL, 0x3A, 0xD3}, 3);
+	if (ret < 0) {
+		dev_err(dev, "failed to set DSI control: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x77);
+	if (ret < 0) {
+		dev_err(dev, "failed to write display brightness: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				 (u8[]){ MIPI_DCS_WRITE_MEMORY_START }, 1);
+	if (ret < 0) {
+		dev_err(dev, "failed to write control display: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
+	if (ret < 0) {
+		dev_err(dev, "failed to set pixel format: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_set_column_address(dsi, 0, stk->mode->hdisplay - 1);
+	if (ret < 0) {
+		dev_err(dev, "failed to set column address: %d\n", ret);
+		return ret;
+	}
+
+	ret = mipi_dsi_dcs_set_page_address(dsi, 0, stk->mode->vdisplay - 1);
+	if (ret < 0) {
+		dev_err(dev, "failed to set page address: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int stk_panel_on(struct stk_panel *stk)
+{
+	struct mipi_dsi_device *dsi = stk->dsi;
+	struct device *dev = &stk->dsi->dev;
+	int ret;
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0)
+		dev_err(dev, "failed to set display on: %d\n", ret);
+
+	mdelay(20);
+
+	return ret;
+}
+
+static void stk_panel_off(struct stk_panel *stk)
+{
+	struct mipi_dsi_device *dsi = stk->dsi;
+	struct device *dev = &stk->dsi->dev;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_off(dsi);
+	if (ret < 0)
+		dev_err(dev, "failed to set display off: %d\n", ret);
+
+	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
+	if (ret < 0)
+		dev_err(dev, "failed to enter sleep mode: %d\n", ret);
+
+	msleep(100);
+}
+
+static int stk_panel_disable(struct drm_panel *panel)
+{
+	struct stk_panel *stk = to_stk_panel(panel);
+
+	if (!stk->enabled)
+		return 0;
+
+	backlight_disable(stk->backlight);
+
+	stk->enabled = false;
+
+	return 0;
+}
+
+static int stk_panel_unprepare(struct drm_panel *panel)
+{
+	struct stk_panel *stk = to_stk_panel(panel);
+
+	if (!stk->prepared)
+		return 0;
+
+	stk_panel_off(stk);
+	regulator_disable(stk->iovcc_supply);
+	regulator_disable(stk->power_supply);
+	gpiod_set_value(stk->reset_gpio, 0);
+	gpiod_set_value(stk->dcdc_en_gpio, 1);
+
+	stk->prepared = false;
+
+	return 0;
+}
+
+static int stk_panel_prepare(struct drm_panel *panel)
+{
+	struct stk_panel *stk = to_stk_panel(panel);
+	struct device *dev = &stk->dsi->dev;
+	int ret;
+
+	if (stk->prepared)
+		return 0;
+
+	gpiod_set_value(stk->reset_gpio, 0);
+	gpiod_set_value(stk->dcdc_en_gpio, 0);
+	gpiod_set_value(stk->enable_gpio, 0);
+	ret = regulator_enable(stk->iovcc_supply);
+	if (ret < 0)
+		return ret;
+	mdelay(8);
+	ret = regulator_enable(stk->power_supply);
+	if (ret < 0)
+		goto iovccoff;
+	mdelay(20);
+	gpiod_set_value(stk->dcdc_en_gpio, 1);
+	mdelay(20);
+	gpiod_set_value(stk->reset_gpio, 1);
+	mdelay(10);
+
+	ret = stk_panel_init(stk);
+	if (ret < 0) {
+		dev_err(dev, "failed to init panel: %d\n", ret);
+		goto poweroff;
+	}
+
+	ret = stk_panel_on(stk);
+	if (ret < 0) {
+		dev_err(dev, "failed to set panel on: %d\n", ret);
+		goto poweroff;
+	}
+
+	stk->prepared = true;
+
+	return 0;
+
+poweroff:
+	regulator_disable(stk->power_supply);
+iovccoff:
+	regulator_disable(stk->iovcc_supply);
+	gpiod_set_value(stk->enable_gpio, 0);
+	gpiod_set_value(stk->reset_gpio, 0);
+	gpiod_set_value(stk->dcdc_en_gpio, 0);
+
+	return ret;
+}
+
+static int stk_panel_enable(struct drm_panel *panel)
+{
+	struct stk_panel *stk = to_stk_panel(panel);
+
+	if (stk->enabled)
+		return 0;
+
+	backlight_enable(stk->backlight);
+
+	stk->enabled = true;
+
+	return 0;
+}
+
+static const struct drm_display_mode default_mode = {
+		.clock = 163204,
+		.hdisplay = 1200,
+		.hsync_start = 1200 + 144,
+		.hsync_end = 1200 + 144 + 16,
+		.htotal = 1200 + 144 + 16 + 45, // 1405
+		.vdisplay = 1920,
+		.vsync_start = 1920 + 8,
+		.vsync_end = 1920 + 8 + 4,
+		.vtotal = 1920 + 8 + 4 + 4, // 1936
+};
+
+static int stk_panel_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	if (!mode) {
+		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
+			default_mode.hdisplay, default_mode.vdisplay,
+			drm_mode_vrefresh(&default_mode));
+		return -ENOMEM;
+	}
+
+	drm_mode_set_name(mode);
+
+	drm_mode_probed_add(connector, mode);
+
+	connector->display_info.width_mm = 95;
+	connector->display_info.height_mm = 151;
+
+	return 1;
+}
+
+static int dsi_dcs_bl_get_brightness(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	int ret;
+	u16 brightness = bl->props.brightness;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
+	if (ret < 0)
+		return ret;
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return brightness & 0xff;
+}
+
+static int dsi_dcs_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
+	if (ret < 0) {
+		dev_err(dev, "failed to set DSI control: %d\n", ret);
+		return ret;
+	}
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static const struct backlight_ops dsi_bl_ops = {
+	.update_status = dsi_dcs_bl_update_status,
+	.get_brightness = dsi_dcs_bl_get_brightness,
+};
+
+static struct backlight_device *
+drm_panel_create_dsi_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct backlight_properties props;
+
+	memset(&props, 0, sizeof(props));
+	props.type = BACKLIGHT_RAW;
+	props.brightness = 255;
+	props.max_brightness = 255;
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &dsi_bl_ops, &props);
+}
+
+static const struct drm_panel_funcs stk_panel_funcs = {
+	.disable = stk_panel_disable,
+	.unprepare = stk_panel_unprepare,
+	.prepare = stk_panel_prepare,
+	.enable = stk_panel_enable,
+	.get_modes = stk_panel_get_modes,
+};
+
+static const struct of_device_id stk_of_match[] = {
+	{ .compatible = "startek,kd070fhfid015", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, stk_of_match);
+
+static int stk_panel_add(struct stk_panel *stk)
+{
+	struct device *dev = &stk->dsi->dev;
+	int ret;
+
+	stk->mode = &default_mode;
+
+	stk->iovcc_supply = devm_regulator_get(dev, "iovcc");
+	if (IS_ERR(stk->iovcc_supply))
+		return PTR_ERR(stk->iovcc_supply);
+
+	stk->power_supply = devm_regulator_get(dev, "power");
+	if (IS_ERR(stk->power_supply))
+		return PTR_ERR(stk->power_supply);
+
+	stk->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(stk->reset_gpio)) {
+		ret = PTR_ERR(stk->reset_gpio);
+		dev_err(dev, "cannot get reset-gpios %d\n", ret);
+		return ret;
+	}
+
+	stk->dcdc_en_gpio = devm_gpiod_get(dev, "dcdc", GPIOD_OUT_LOW);
+	if (IS_ERR(stk->dcdc_en_gpio)) {
+		ret = PTR_ERR(stk->dcdc_en_gpio);
+		dev_err(dev, "cannot get dcdc-en-gpio %d\n", ret);
+		return ret;
+	}
+
+	stk->backlight = drm_panel_create_dsi_backlight(stk->dsi);
+	if (IS_ERR(stk->backlight)) {
+		ret = PTR_ERR(stk->backlight);
+		dev_err(dev, "failed to register backlight %d\n", ret);
+		return ret;
+	}
+
+	drm_panel_init(&stk->base, &stk->dsi->dev, &stk_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	drm_panel_add(&stk->base);
+
+	return 0;
+}
+
+static void stk_panel_del(struct stk_panel *stk)
+{
+	if (stk->base.dev)
+		drm_panel_remove(&stk->base);
+}
+
+static int stk_panel_probe(struct mipi_dsi_device *dsi)
+{
+	struct stk_panel *stk;
+	int ret;
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = (MIPI_DSI_MODE_VIDEO |
+			   MIPI_DSI_MODE_LPM);
+
+	stk = devm_kzalloc(&dsi->dev, sizeof(*stk), GFP_KERNEL);
+	if (!stk)
+		return -ENOMEM;
+
+	mipi_dsi_set_drvdata(dsi, stk);
+
+	stk->dsi = dsi;
+
+	ret = stk_panel_add(stk);
+	if (ret < 0)
+		return ret;
+
+	return mipi_dsi_attach(dsi);
+}
+
+static void stk_panel_remove(struct mipi_dsi_device *dsi)
+{
+	struct stk_panel *stk = mipi_dsi_get_drvdata(dsi);
+	int err;
+
+	err = stk_panel_disable(&stk->base);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
+
+	err = mipi_dsi_detach(dsi);
+	if (err < 0)
+		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n",
+			err);
+
+	stk_panel_del(stk);
+}
+
+static void stk_panel_shutdown(struct mipi_dsi_device *dsi)
+{
+	struct stk_panel *stk = mipi_dsi_get_drvdata(dsi);
+
+	stk_panel_disable(&stk->base);
+}
+
+static struct mipi_dsi_driver stk_panel_driver = {
+	.driver = {
+		.name = "panel-startek-kd070fhfid015",
+		.of_match_table = stk_of_match,
+	},
+	.probe = stk_panel_probe,
+	.remove = stk_panel_remove,
+	.shutdown = stk_panel_shutdown,
+};
+module_mipi_dsi_driver(stk_panel_driver);
+
+MODULE_AUTHOR("Guillaume La Roque <glaroque@baylibre.com>");
+MODULE_DESCRIPTION("STARTEK KD070FHFID015");
+MODULE_LICENSE("GPL");

-- 
b4 0.10.1

