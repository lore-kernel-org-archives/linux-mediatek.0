Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CB8E77173
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2024 10:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pny3/oZCZ9HdOf4g0MKJrdxu4AmPeKVKO+XjLSvPYWE=; b=e/q6RdBUdHxsOj8JNHtP5Qi8h/
	9fEdsXY87DJMwip5pzygxc0x1GTlt4YvtJx9i32coTV17Qq9qoyuiEj7aOssORIxSyMIAw0meRMS+
	3sxdMq+v5P2Q3aFsuCssMEJ9q0LKC4+n1gPhdNrgRAkWHIhmNFLeb5am4miZP7kx6HEe/Jj5cdU3A
	j230vpYPkEr/61UQbp0jve7k7j+dUyjKfipHNtX520OXoLrQlhyJqCNTXLE3NJNfYqaitBNTuQefK
	nJZVgB6mO8AGbK7g9htoaVm5+CHMcK1mqwty6qYyvz+Sokk4HQCNQ5P0bBN3V9S/3fxGPa26xI3Yt
	RCdns/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVnU-00000001LC3-0M1B;
	Fri, 06 Dec 2024 10:42:56 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVOX-00000001EWS-1Wuu
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Dec 2024 10:17:10 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ffe4569fbeso28942891fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Dec 2024 02:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733480227; x=1734085027; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pny3/oZCZ9HdOf4g0MKJrdxu4AmPeKVKO+XjLSvPYWE=;
        b=UItzsRw0x0x3+LnsD44CUevwsoH3coJ3P62t0byV87JLaQv43+V/kzz+MI+21CNuaj
         NmmbjNUg5QMlUUPg2ETN/VrqozumLO6N1ttgv2gwbEbWr2A+9rfDc7Vkf3juiRsyUvbV
         yVEr/v+gAgZYrrIpxk+OTBZITx6VMINkmGMSLvhB7piJB6zoVjxA1jEyg1UkWADM+FVS
         GHdgOjgyUn4weuFSli2rCOeTnprAaHYt4zLGWmj8hvLHQUa9n01Umeyo36L7gXRuYPFF
         N62q3BOFHXArqzvmuxaEeBYfBEQjWeqh6CvMlvEbbXLNrOZnY59aEtDjSnISAd14LzT2
         n8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733480227; x=1734085027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pny3/oZCZ9HdOf4g0MKJrdxu4AmPeKVKO+XjLSvPYWE=;
        b=ihBUcYavyDUcfCuP0Q1Ly1s09d9x99nJOIi6CmxIdnLzBsJ2edLxc9DSZftfbsaJk1
         FzXb3PXKVw7arbMmU+O5+66S4yWJvZMFbkUKesivOmax57qS7eBWTcFVBsnEcIov7gTh
         acXsEXe6WrfpIOkcy5eUW2JolwNWkBF5X+lJCTmvw8re8f2oQugJcpM72MEk7eMwUDpT
         6TCqdclXUDFc1wwi9eK40JuHXaVvLg1IMU6GWtzjdjbT2Yljic1MJEG+xsNRfvwKu5ek
         Lhpu5jAvr2ZydgkqFzAzUcFVDxf1MZlbamJ06zXLbnat5tZaJyhEXWwn2saIN5nk04Ac
         gvOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgPZ6WIYLbTonUGehZ7cjeX6JgJxJHcp1Cne03+pcPAc1y0vUx3ESUkn6ui9UiemaCOfRQ4L3o6zmCWh6Gyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5rSxWI8Up85qi7y9InNtmUqcmxVaU5iUPPV+qULN/k68+Fo7K
	NESvTdvgjJSdE/sXhKINqysUxtpgobbPhSa/ANFuiZvLH4D8NwPJHr6vEXBhlEg=
X-Gm-Gg: ASbGncvd7imHkIxUzBGVLuTA3jc5jHTPGWhUsTrTpeM9k1CcqVILquSn45ds7vi+ta2
	cRK2NGs0y4Nr3232cFjSDGszC0qU3wDGDvxSX7IYfcUH3Qn+ho45h5DKZQtjTV6/aT6rZv9ds2d
	knGHmjtHvtpdVR5Er/SQ5OtCek9kyt5CPwpfoRnNu4+79oViMU5r891XFdyc4tgTaPowZ9aB9IF
	wd2G0mPRzpz1mkmaVFKKn+NKF68u7EvAP0oeEeymP3PeheKjpLiAclsMg==
X-Google-Smtp-Source: AGHT+IG0QcicheINkpKVEV+N7iY9KUPWDy1N6KSKw3gesi4tsLvAixCI3qsFKZ6xn3HsNze5iUigBQ==
X-Received: by 2002:a05:6512:a92:b0:53e:335e:774c with SMTP id 2adb3069b0e04-53e335e7ba2mr484774e87.4.1733480227384;
        Fri, 06 Dec 2024 02:17:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:17:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:16:04 +0200
Subject: [PATCH v6 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug_edid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-10-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7txoET57jmm2MW5aKrjVDlHM8PA3Hnz9H/pYu/wP770=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8K5vHn00gwDj19cHn3nMju2ruWputUg2V4s
 rnN4SzdgMGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCgAKCRCLPIo+Aiko
 1RVxB/9ibECV3IDeNQwRoXBtxBfb5q/3fQOiAqYySeNrd22PjQ76DgDyRwsiItUPMPc5OBiBz7R
 KSQ40mwZyXC2r5WzaKmY4gs1aaAPiwRIy/TMksz2RGvCApkg4Hd8RszaQi+oq6e9ZLtPrCaUdeo
 Jh4fAV9j95blixfhq/8PiFnIopXyYOGqUrL9GnlglKBRAS/27u0MRm3ay1l/GbNb+sg9tEOmo4D
 TZAS0Fi9bgzcOqAy5fbB10xB4BGALGKhX9Se5PnEl1aK+rp+EAbfkeKXHZ+QBunTMGd2ByF85Gl
 W+VlY+DypXhupcZsmPnLbRDQPG9h1x7PPZr+p5kNFuOmenmE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_021709_398730_07DBB6E6 
X-CRM114-Status: GOOD (  12.35  )
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3364ef90968dad3074800f02926300ffceb75c69..3fe025251f939290bb4430e2f5163b6549479fc0 100644
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

-- 
2.39.5


