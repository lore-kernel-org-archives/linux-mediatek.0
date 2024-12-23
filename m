Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A93E77188
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 03:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=; b=huDo4ZuTa2+j3tlehk457WjSrF
	TeKEIZN8m0Wj/xdWgA7w0EPl0DSmLzvScGROvgDWwWxoJ079IZymMhpaQgBFv+SsdYiiX/aFRnsWK
	Magbq2rIffsZj7MJw3XoeJ+j2P5gpdgHhtEW4F1L8iLee7/HHO9OFiHsMzlej29+23UzjDhBy6sHO
	KAkHiiItA4k05z+7C7d9wG0m2x+NyuIu2jNXcq7fmeW2eCqp9jH/XomJ1s/K13IsBomZnP76B2ydq
	zUrbLMq2J6XT6tjP9zXnZLv9ZMSnVUsFtwQxyxs1nbow0g4HUUh198H95l066+u/KOb5UVdmFHaqZ
	JlKmZSGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYpW-00000009EZ3-0Q3m;
	Mon, 23 Dec 2024 03:10:02 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYfD-00000009C1S-359U
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 02:59:24 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so5661366e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Dec 2024 18:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734922762; x=1735527562; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=;
        b=OM2ktskLenmHZL2kJ/aIi0TM7ptjszCNZ9JKcInRlKmuCV0XduzgfbONhhgYBGSDoK
         3ZXmSzY3yvNSqsbaRzrXvH/laXFTazrz10XEOLtir82fYhmFBC0cS+CGk8ZufJNJwDjx
         SMNKM88kmMytpDx/GSMNTN+s7VnSCv7FhzMwEUOOQ0N11DGNunehUzVkf0PK+qtizPKS
         +d65m4DVqHb6ZY/p6ikhip4WGu2U7V5NbCbIIWOetuomogTKWQfJFDR5AIni5X3TdZlE
         bOISLPB9hzTYr3R6ir2XZkbOGfP/O2FIUqvRgpHJ0D9NYNsLBia/VDC8pzu8XrYwfmvV
         bLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734922762; x=1735527562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=;
        b=E/UcXryTEG2fRXZxAYx3TeOEIVn862Bp7HvD9lOJi65LH1JQBN7FXy37iqWw2agsLe
         8ROLSleC2nOw6YouX0EsrNut/H64rypYzX9Wq940CM2fCuXzAXoXV04QsUwKPZr5wztJ
         K3UQpYu2ebdLPTbRSLjZ9BLN6pt1Wluu+uszXS65i/cn3rlAr1oLF2YMvH2kGTIUAB65
         Lhh0I5u/enWWBQpNo8ay5sPxI0pQ4Rq3kpw/nBhVhOrFubhdCrjRuyOSii4yAY5zx/mC
         mevo/BEyRnEmVroN9KVZtklzw6stTREcwBM3fEQ61ycl4blr5WLdCh8XOFct4yhwJWlM
         kpsg==
X-Forwarded-Encrypted: i=1; AJvYcCWJJqO9Y+8pyFJLU+naxBUK3EvsXfXK365Jdbmz5li2ZwSZn1JQfyEZjLQMj/ZScdRkwnZ7n/izbMWb8lX9pg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoC2eoZZfhGII1pGrw52SQ1JXNMXJPijLkBRpbC24W/guZFVek
	llKp2RUGBt/4W8bXYEzg4FiUVdP2PD9r1xzd3EtyEj737oGqmg6xMLZ26hOqKWA=
X-Gm-Gg: ASbGncvg+vLVOJl/y1e2vub/dA/srT/eSiprmex6WZiQs1O3DkO0IwHN62b4HSMABLK
	/9BIJi+lhpn0UioxJcyr6Rlg8SdZbZfORXiDBywG/ti5X3d5rwOWaQtk/VoCEsvbs5FjmueLuvp
	VYxxpKjcAJI5VPiIc2ovxuVefAP6WD6+3Qlcnp9j6a1XN3AnCMqSCK7/VDQNsyCK6i+7NhPb5tt
	GKC+LUrWwcGPRUiQeKAmKaqrOjurGYQcf3aii3i9q24IYxS6aHpQ3xYkDDlyRua
X-Google-Smtp-Source: AGHT+IGXP4rXvq7W3fLpzfisWqyUJAOUer76ywuuwhoE5fp8LHSToAxEcbOqHJy2piepiuWIG7rxUA==
X-Received: by 2002:ac2:4e07:0:b0:540:25a6:c342 with SMTP id 2adb3069b0e04-54229525435mr3832068e87.4.1734922762189;
        Sun, 22 Dec 2024 18:59:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:59:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:59:00 +0200
Subject: [PATCH v9 09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-9-6ce16bcedb8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zd/Y8mBxMdBApDi5CzqJHH1RW7mj7RyJYMvyUl/+gqU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHxS+CfU4MvBlw2osJl83QA+wZ5kGncYgdoc
 JR2tU6eRoKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1TOJCACrRFuRB+oY+c98sRz7Ma4pmcP9hkSpViEb1HhcqhQ+wSNrwsLQ11Regmd4mJBK79nOzwT
 Nfpri3HXgX0HS3qFYrZcUzi+B68x6wvwU60GwKMd/PZvyFIX8OxvcXzgOk2EQ/3yygWo8fFGThO
 X2MGTJqbpeegKvCKA3d3otC6Eu9/QitcjoKBNIh5HDbkAMlRMwzWQ2lriSa9FMiZYkSuA8vpt76
 bPSe/sIipmve9fE5crzyrvzklzHGaOofu5vsyHZI8cgf3TMNtOEi0MelWz3Xs3r09Ix2sCQ34be
 pLuk4G41OLEBneTNS266BoRuUdJI0xxWKkNROz1buEXtKh/I
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_185923_786085_D000F90C 
X-CRM114-Status: GOOD (  13.03  )
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

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 24199b511f2ee1bc3aa5f4a30e9d3d928d556ff1..5282dd765cc9478361a705dca85f615015b12e8e 100644
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


