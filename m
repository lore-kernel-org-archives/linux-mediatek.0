Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8420E7717B
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2024 10:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFa29zGokenJpe5mqg9zveoS4Rwgzi3mBzBv5L26SAE=; b=DMYomEHJvhZ5yjbECSkGHm8n36
	nb8cVmY3/opbpGQ0mx1hrhMJycXPSUkJ3q9KxoHoXbOSULd11bHVVX566pnlVBWbxZF2m7UdryaoT
	TSa6qVm32B3Q6ByMKwIzaofLFCoMwAPisd1hgf6kjPwG++ZUlGWFrIosJIfVbl4UTQ22q1uN6tGr5
	EqNjOWtaBIaPkcRnXfF7Po6Pl082t03lVjKEeXhAksyixVq125g2WqwTQpr6ESSe8zzXWXa8eXFKa
	g+FV3whkPFaq3Ece7f+K2F4R7X04afFmohuBDRiigZTaN3/r9xVRXd7fdZbu3shKjyU0/LflVrTTp
	IyoVPDOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVlL-00000001Kqa-0Ozt;
	Fri, 06 Dec 2024 10:40:43 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVOU-00000001ETp-1O2Z
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Dec 2024 10:17:08 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53ded167ae3so1889555e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Dec 2024 02:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733480225; x=1734085025; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFa29zGokenJpe5mqg9zveoS4Rwgzi3mBzBv5L26SAE=;
        b=b/66Jqg/is7AjAyYWWkEJn9tScwTrzCrMPdKlw9E1nAzSdBxj6xaskWDyCzUAQsZyt
         r7VGg5F5V/WP+zAd1oNYwPgZpdrtyjNEDeWhcPtk+f+NwcsYpI8e8KeCQylIhcT0sg6q
         wJ8l5mPN2U3dDbtxuWysdvr7k9nYSfHAsZBf2AWlPh5ayCedYYyoNJHB0TI31huvWUki
         lkI5hamX8buDcCVkW54AqgWYK4tteaHVz3W50j7En2pNpDCtawEyJSG9yT2O+gRvcG3l
         5jxRGb/xQ4knG6Nec9xmP5RSR+jI+2Ra7rDJIZSwSyARl76enXx0KII3hiyd8Fzjq7oi
         DPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733480225; x=1734085025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFa29zGokenJpe5mqg9zveoS4Rwgzi3mBzBv5L26SAE=;
        b=M6DhCIFsxxkuyxfiY7uR02WQqBqHizzIBZbQPj1rNVHc1r6mfrlwPojZ2CIhJpuWnm
         Vdp80Y1qZtfNkq8ciHEAo7aS5/qDuUlxIwd+C2PPOH5laxSko0PmYsgQIbG1fcDTo6Uf
         bI6imONOSYvOm/gRlg7nARjZfqxIbOXZfoW7NWJiRW53Qkz0rCrM/AixBSnEXBrscyQw
         mFMJLKYAKVbxS7L+iI44yCXFMMOvDgspUL7U92kMQILyNY9nV2WvcD+ORKXoAX602OIP
         qz8crIGMEJ9e2v/YbAqvpiaXFG4vMLFoY5qUM21LnErf9U5kZwuLi6vzPr+aRtIVeqKS
         nujA==
X-Forwarded-Encrypted: i=1; AJvYcCXVW6rkYPJ7YAyoeivevIN+0ZriYU2pxWKGC0zAg0L0UIDuA+FeKbKtiE0jW4ZItrzMlxQavjLzFJ5KTisYIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV779wTr78P7uV8NPVStj9gz6vw7l0bAM2GTzcdJAdG7bo9gmA
	jtdFT6/Ycy0fgt/Ljc7HKBT7lZMAZvpLGDCnE8We+SgWKNhynPk+jYn5Gzvw39Q=
X-Gm-Gg: ASbGncu6fX75oeVtJsPIQlys2J7a7wvDhNBzp7uwjKykohRu8hQWst2y1UWDmR1Z6Bq
	vGO/2Ro0GjoQqFR2XXQ/+UywPz7JA+e1xLshYB35ojqFZayd9/IaelQD0l6wiC8CGMLTOsalSWG
	rzmxNlR6TZgMKFlRlJO6LI6+tNHOrJGE/67fUe25+tWoV0Lhfl9suppRFeLwp0uJo1A71ROtw+S
	eiJoZ0dNaVMyiRd3L0et3/AlMsr1hOT+0Ysp8Ca5rJbY0abeRhGIrWwkQ==
X-Google-Smtp-Source: AGHT+IHNpBuRwgKK1CNP9DRuR/Gs67kp3cCMnKwV+VXX45IVym/LnbP/Ke7fYrgOf+QZmiMXYQapcQ==
X-Received: by 2002:a05:6512:6cd:b0:53d:d17f:9c82 with SMTP id 2adb3069b0e04-53e2c2eb825mr792722e87.41.1733480224767;
        Fri, 06 Dec 2024 02:17:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:17:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:16:03 +0200
Subject: [PATCH v6 09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-9-50dc145a9c06@linaro.org>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
In-Reply-To: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=j2kemq017HscgmDjZnV9e0NQWZYYUNRM9WTXAZ5h3gA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8K05s0noSk+VgReu16bZ6zGhMIKEKZYWvMH
 cWDBoC5MeeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCgAKCRCLPIo+Aiko
 1egSB/0eK1psxHQsYpRADr6zCNmEK9ALrprmuzg9K5OGMiQy4CeKh8wWSI8ng+ZMiQrN0gysIOa
 gP4xcWyhTKvzseLul6LUz7vNnN2oLBaT6a9kOqq7zHzZ5BC1htBwJHDvvs6gyNE328fVF96Vz1X
 o1rKdI0JsvDb7LgVYbZkcTMIWCAQjEs/CRHfthdOxmJLdTMad0FkWzEOQfDpKEXyPfaSLg3PpFX
 6Vso3jxPVmBwM97QKw3Y/jVXRDBDC/Ltjr/SR4rwzm+rasXspSzT4DM52M5bK4BhVxBYMiNjtv4
 TzyaS5rLJ4DQdUBsTW0TJ+Y66IYpoCUW/OdPh+fArsVpGgLm
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_021706_402614_6B7B16B1 
X-CRM114-Status: GOOD (  12.90  )
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

The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
already reads EDID and propagates it to the drm_connector. Stop
rereading EDID as a part of the .get_modes() callback and just update
the list of modes. This matches the behaviour of the i915 driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e5ab42f72f618b90f956482db6c9c8074c1e3bf1..3364ef90968dad3074800f02926300ffceb75c69 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -470,31 +470,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
-	const struct drm_edid *drm_edid;
 	int ret = 0;
 
-	/*
-	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
-	 * results in reentrancy issues since cec_s_phys_addr() might call
-	 * .adap_enable, which leads to that funtion being called with our mutex
-	 * held.
-	 *
-	 * Concurrency isn't an issue at the moment since we don't share
-	 * any state with any of the other frameworks so we can ignore
-	 * the lock for now.
-	 */
-
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
-	cec_s_phys_addr(vc4_hdmi->cec_adap,
-			connector->display_info.source_physical_address, false);
-	if (!drm_edid)
-		return 0;
-
 	ret = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
 
 	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20) {
 		struct drm_device *drm = connector->dev;

-- 
2.39.5


