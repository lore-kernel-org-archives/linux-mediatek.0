Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60403E7718D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 03:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=; b=J+kGHnXPvWYTJroiYnRvWr9np5
	VJRzz5ajov09utvdhl7Cc5lcHaIAIaIBiWbqnztHJmu+ZgTMHZKlyXr0tnsLaJKCMOkkQB8FW4+iR
	TX4nNdrxKm8Se9bgbbmtNSr+T5uDmmyZdefW2HNRumY4/jt+Zb4XSB/j8GDxRxti4HO9d32nSboHc
	LgQgSJXoog1wXyPldyCqmsd8cvv0cb11tlR/PACMn+SJqA9X8euF1PGtT04ptzhq2VpV375854DPC
	MaZbjcQo58tSRwnATt3DH2dR4JtxgPyUbJWTew3yZO5csnX2xiLz7WZST18TbDyjMQFuF/MnCdnas
	JLDJSxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYqg-00000009Epa-1Lcb;
	Mon, 23 Dec 2024 03:11:14 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYfG-00000009C3h-1ktM
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 02:59:27 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54025432becso3967551e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Dec 2024 18:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734922765; x=1735527565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
        b=lho+ngpCW2JkEfWy3IHDtQtkok/RIAJe3IXq2dEBObyf1l9y69zBoXDciE3Tc4bxhv
         6AWdAmzXPSk/mnZMMlhOuY0KZj5TWmBW1S38UI6gw99gUmz3qDymru0Om/3Q9g6YxZ1C
         n9/jZvd0KXEQi+4/ofD9+5MJ5R5MAJRcfksaK0U2RcCKxRHUNjMS4gaySTsusx+I80jY
         qj/pzjCihL6MiGFpto7pFgeJG3JudhEA3oMCvvWj+YAke5Wb+PsHP4KIYohCHq7/Vdwk
         7hPX5MndMwhmTWipuzF94/ahNBmUiPi2fqGuqFMSqoxU1AEfdCROYw9VkQk56Oq8ZnoK
         4Pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734922765; x=1735527565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
        b=LX7pm56/6jZ7N4V8E3N3cCFFNHvWB3LYSmNSqE/YmvwBEYxuA3iLgVLE64VGxxyv1q
         aqafzR3KrusZDjPZ3TZoxSsdn6V50tLC8mDUvuDOHlNOH3JhLAo8ENDkA8BMMq6FbO31
         pRkkkxuHg+J4KlLuBWZihaw3WzBNRR172Qwg06h7vVrHWQ2vniBnXmsz2PBKX4J7aQy0
         RURXY+JY8pnD7UdEgKyj1xjwByAGVmpZtQoY5hNQrkrswtN8VvpBTjqax62Kioja+wid
         xoSQcIRE65OJ0gFtUHaJqbXg/19fCHsC7OEhvBi6oVGfwXAAbY/cQsn+uxQBfZx9CKlp
         q7+A==
X-Forwarded-Encrypted: i=1; AJvYcCX3Wv+y4Wqf/cjYwjKxj9DodQCJAcKKjA+eQp8wjeZiYzJ9PrOsNLIB7DdqRPkVVeOfuNFfys6is0EjC+Pmdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YydFGLoGxDSCnRcvfwYqRssQS1mvSpCt7iEX4lXHW7yyCTMJybc
	sf5Jux73guWDvhrTFv2x+8NPAVGv8j+5FaaM0Cv5Jo0H3aHCZRhpK/wQEBxanZw=
X-Gm-Gg: ASbGncte5u7Giur64pBkieiLPBap2GIDWgXJury1Bxesglvpcyrzqx2ycxQQVabVi2A
	i7Kp+M7bgX6q7P2CctDdyLHaQqTxXtiwVKimQEVftfowIM/VBwvMKpaB+GF7TKBFOo7ZTRDfnGQ
	iidMMlfdMXRR3O/54ZCfPs2weme9OwW/bYslv39CHZteaVGaYCW4X+yl0IqqwM/qgMwWgt14+2B
	vByoVl+XpIG4p8kJc4NE0xCJ35UKItCWqIRGBwVM1pFRt2MkrUaeUVPv8mCxEQM
X-Google-Smtp-Source: AGHT+IELf7Q9dKbwaApXTdiac6rXIdbml/bGXuPDMlX/oPVs9y7YxdDq3vkjKfSAR1daoK1hDBNZTw==
X-Received: by 2002:a05:6512:e8c:b0:542:2905:ae52 with SMTP id 2adb3069b0e04-54229582562mr3253920e87.45.1734922764852;
        Sun, 22 Dec 2024 18:59:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:59:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:59:01 +0200
Subject: [PATCH v9 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-10-6ce16bcedb8b@linaro.org>
References: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
In-Reply-To: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XEE5uVlLO0AwRnx9UbXjwAPIkR4mEqLYJ4bDyDXWCRU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHx7x+4SbLumBUmOEkbtu6Fr6hU1V56PPenf
 rTlgrJow96JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1evYB/9rPAzB3kkXRyr5OKaHMHSiShXf4rybV/gUkj3QflXjD9f8CPYW/cyNWoJQtSWoK8S9WTG
 Hfj6UgBsGVxS2w97497ZGuAlKy/qxgFdBiXqhOUD7TcjvPJwX/QX57ZzOuDajdo8WqeLrDtYU0s
 nxyhgsO1hqWEZ6EhXrJJQrwsgZWJyArs3jqtvSNURojm1mh3pntNVs0ZPYtB0DZvAeVNN+F3Iqu
 ftO2or9x4WGL8Bi2fIxxRaweVXdxK7nLNQH6PvvOeJnKAC1cD0oBV896Z9tP2SAFpG3WmCD4Pzd
 f/F/DTBdG0+u6dDWeil9xt7qN2QO/kPVNagQ1xbmxphKStOP
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_185926_471102_60CC71E2 
X-CRM114-Status: GOOD (  13.00  )
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

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5282dd765cc9478361a705dca85f615015b12e8e..82eeb08c183420b000b351da1e05f9a47baeda90 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -383,7 +383,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
@@ -405,17 +404,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 		return;
 	}
 
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-	drm_edid_connector_update(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 
-	if (!drm_edid)
+	if (status != connector_status_connected)
 		return;
 
-	drm_edid_free(drm_edid);
-
 	for (;;) {
 		ret = vc4_hdmi_reset_link(connector, ctx);
 		if (ret == -EDEADLK) {
@@ -549,6 +545,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
+	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.5


