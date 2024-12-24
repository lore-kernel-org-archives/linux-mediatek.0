Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C1EE7718E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2024 02:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x27qjhhHmmSFc4Yew7R/X79LJ3J4qUtREtZZ6cr9W9o=; b=dWfhND1YAhYZLKHF2QCD+CIn5t
	VEEZhxzbpFyncC3esdxW04WLN1b4g+3BWoTrAG85yJWrTXruHzdPqpnBunagQrZuX3P4j8J+YETsY
	qcpXtFdaVvfp6n4Lzco/spRpegqvjdGoyihcPSKsxJ3GsyXCqsxuCwrhfR7HPRclhBBQ3kMAVomVj
	cP1vDlyMvb1AyCjO7snFFxr47Yk0F3xwZHzhgYQ+J1HmzoWRLyJEEvpG5GFmhEZhfEVz/PUcgs1HN
	zkWAqDlKvOCtr83PEV6kKkbRBJGr4mvUkMGiWP/FIphAHiMmPfOMmm41vK0vCrZjhqEj8ueRwBlg5
	rgVCKAUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPuGJ-0000000B3to-29XU;
	Tue, 24 Dec 2024 02:03:07 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPu26-0000000B1e3-3qOK
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Dec 2024 01:48:28 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so4907829e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Dec 2024 17:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004905; x=1735609705; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x27qjhhHmmSFc4Yew7R/X79LJ3J4qUtREtZZ6cr9W9o=;
        b=XOoJdrJ8KfEIHeLeH2JWUrhfQHRuul2+yDE+4yOhZoRCll6BKFI0k7W+6TQ/Dj9LBH
         fbwsCxm8yeu8v+e5I8cp3R2Qg9/iFRIoIakjGLSBcm/Xn1pZkT6YovHOFGJEl0mYP7kD
         lMDTvXVDpMg6QNPyAoCmeBn60YF4Rqupg65mDslNLBYowAIHpq+NRm7WnIDUm1nYoazD
         C6peyV/mWj9CA1XvdkcLdBn5qmvtwm40K0xjJyE7h2mhbnm3s4QsDqve/n6iK6NI8OxL
         bn/9aiJbJe9juTMmDj55ol3Hw3LZh/AwyErwDtmVRgAMELqi3efdwAM1odxWjoMEOs8e
         h8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004905; x=1735609705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x27qjhhHmmSFc4Yew7R/X79LJ3J4qUtREtZZ6cr9W9o=;
        b=kd1E3ncgAODwq/1yxqjjq75lnXAvqJE+1QOJhdnQDATAOg/UGjMEp3+fonc8ojLFna
         Cr/44aboLuf252TRzdWaDRDqWz/hzrWd/DYoPfqF2gLJ1kq0rTzwcgR7uMVjZS4OTpiW
         El90/ypUl+1tF7mI83Yj+3a4D+/Js3kBtJPmSLyld0zj755Bu0ntsHVfG33cI0vzWDsZ
         3xEPozJXrfRrBJxYzxtoUTJ25qaDc/H7vWZ7iZaUe3sSQC0a0IeUJt92I7xx4TyxyQiG
         QdhaCfdf9gwUIoaiyMOsbS/rXZyXj70RlhZaKeip9eqCoxBbbuJ0P9cDCkRJW69JomBh
         AkuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuQX0QJHPYUYWVV8ydrOJsfLwoK2LBJVpgLRI8SnycUFa7CJELoo+qx0vCyDn5uDmwJ/ttNdVerFSYh0hLpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeGF3sZipiz1d1X6JsUIJBd84Ukk7KlQkMJE8ngfrD2eVWD6YJ
	4R4Ro6E0FKmWZBBA6sfA0uYW5V1fcogdo9Aslyo/2Zs+GRVO9RkFiqzdHxtewRY=
X-Gm-Gg: ASbGncsbDAgvkwI9OIzYCCxfj4gIxi8Q65RyYynD8/IhPY6Ybu0Lbp+OSQ/xSHeUVXz
	6r4z/6qjPX/0KaErob4PeX72FyVSG6Pe/6OQ/mXMQdXWg1qY40YvgwWY6KrBH+0qLmT+LVJcWP4
	nklpXCLjqx+Kl3mwCv7Q+ko/AhS/kue8YrISaq2Q0wH5ARKX3yfbYFtiqHNqhbihi6jGW5d2v3V
	bL/hQXFoareL2ngaFd8P9RbrIlWWBxCleAP+wihTSD0HPi6vuQglUf0Cn9QQYzN
X-Google-Smtp-Source: AGHT+IGxywAHlZ5biHokHnOEm3MPf0yFL5QnCm6g8X8iUKGFmxEoXLpi8MebkWFCTzgOs9+bQfvDzA==
X-Received: by 2002:a05:6512:1245:b0:53e:395c:688b with SMTP id 2adb3069b0e04-5422956b5b1mr5020537e87.47.1735004905376;
        Mon, 23 Dec 2024 17:48:25 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:48:02 +0200
Subject: [PATCH v10 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-10-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
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
 bh=B+VyVi47xGS5Rgo1fXAf2iMXQyx6B0hUm57mitVwu5U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLO/eNo/39x/HJrv+HFXwG6d8BCBlotDoJCU
 qqGZkD6mo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzgAKCRCLPIo+Aiko
 1TWHCACeIhaoB+aD1Id5dsTO6uA+nC/AVkJRJD/7UYmW8Ex7Zn2qDhEmWtBdITotMWW3ByYkUvj
 uWd356HEakck9NA8ieyZDfqWEWxIYpA8KfFQcvIFiYtmcFLi8kJSZDn50oFIpYvQaj2/gM0dAUN
 p8u9lmdLuAdFhoJjHaZawfbQ74cmm6k0F0FhKKbhW+u/RzdcsQu+fDZ+GzwQfElhQt5Cabh9VTD
 9m+cMW8Yv8g3rD7N8BgPs/xSnrX5W/1NqXWaD3O5GzP50Iks3oWr3bfaQmjdOpjCu4PWuKpHVmB
 5WNoz9+G5V+lgNo6KogfIsR04KOp+MyB/Lr4QH+DuZNDR5I1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_174826_971567_0F0279D9 
X-CRM114-Status: GOOD (  12.93  )
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
index 4949171c28876a9145ddf03e99c00feff4df255a..47d9ada98430634cfd8c1e21c2a4d00d501bab7e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -384,7 +384,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
@@ -406,17 +405,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
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
@@ -550,6 +546,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
+	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.5


