Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5E8E7717B
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2024 10:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unYAkXaFAf42yLsiWl79k+U7AAWsXSetaGBwV9Nyen4=; b=Pd+L5HTGRyXEyOe/8/meKt4mPH
	GiXbd0ME7VkyZYe9P6boOvU2hftSxBuhk9Fky4ur5o3qrwJE3ngDAIvToEipB/FqFDOuV5J9sgaJw
	Zndn+oD98einYWWkBFfmI1qPX6Iar8WDul0lHJhoFaF0Yg+4RM687th9o2KAIqqi1/z08eMXR4ttC
	ZPomwROFHW4X6tmyzJDgUJsAiocrmytB5CQjiVGlR3u9BIM1D4OEh9MORuyOviedShaQ0wAO2Fv5O
	cSmL2JmRrIUM+lfOE6eYIvg9FVlx5NO5n5ueLDBqJQTIkxvsx3+QvxI2IKvyKuulblInbFmckGGQZ
	vfx2holg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJViL-00000001KJF-1H8H;
	Fri, 06 Dec 2024 10:37:37 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVOO-00000001EPU-3FOv
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Dec 2024 10:17:01 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53dde4f0f23so1730684e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Dec 2024 02:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733480219; x=1734085019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unYAkXaFAf42yLsiWl79k+U7AAWsXSetaGBwV9Nyen4=;
        b=noVhEEnvOkOoBiSVo9Q7WIXxxh4F+nBMupnQX0gEwj4QcjVGEe0GAFSv1xVot6LV2X
         aDy1nkrkJvHX/6GLWlyovMoDQ7E1m4Q8bCmoxDbCFuevkfdiPXCW1t+lWIapm5tb7YvN
         X5Ki1YnRWvQOsroA0BWtZ345S1bGqMFntHFCFrtm0XVvvDcC/hCWaE7cMvewojrH6xu9
         KzyY2p0Qr2ap0SRmREnJ4Ltc4IXsAdpn+VVZ6bgw/2anFpUiq17QUTwVuzkjQHUa539z
         2sGKC+l2n/WY9L8HqbMDoDUx3Gxgv6CzsMyn3W88EWiWAsUV37rb9Fc4/rgWON5JpqLt
         EGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733480219; x=1734085019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unYAkXaFAf42yLsiWl79k+U7AAWsXSetaGBwV9Nyen4=;
        b=DvNndLsnCPIKTgxkzXTstDH8RHralg6wEtumA/iRpySo1XjiKUSIEBds64fEB731XU
         WjM09EbKJ2o9xbnrtiEL/TrrVjWcSVoxI1X9Qm91UqA4Acd/5SlQUiq7n6J/lkJ4fmnL
         obgKMNg/CngySKSGiiogGQ5DuarpU8RsDguysDCP0IGUUd4tXXVicexhkNdVwfJ2m/05
         2pryGUjM+6RirYSIfV25Wv87Hgtovzj4FnNVV9LP0o5gB2Fh4/6SDgG52KN/9PJDHkql
         H/oLWKSOOYu4/zuky6kb8kXHSyEguTHW5fL/oQaodFG8qvvWOh7yu6FQJJ4VT+mgw1Ws
         9Uyg==
X-Forwarded-Encrypted: i=1; AJvYcCUOO/xxdXpkgrHcVFeUwDRHDb1ZV1wDb57m47anRj89+QECtZYmqbC8ocCmi8p0KvhuS+9i4A9hFdtO/GGdIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl22bDoRLKCMdMSsQsMMb1fn+Zj4bqVrahsE881dLFla9sUSdT
	cPJzDjRqdOq6T3bEw3MEZWCZrCsas5SLpjfK2CJi+eOUYxx2i8RKIRuvAtw/Piw=
X-Gm-Gg: ASbGncseFu5dvNiQM9dVO+1dP1emPgtJBnA2ZWIGwTBQmOuG9xEOJgZ27NDDCIu/Gct
	doFD8gBBFQJ8Hvfslsc+AJyWjlbnePWAgMJN2p+0ka5h7wNfMHqNvFU8Khm+z8jhU5tK6zv1c8k
	2wdKC5I8AGo2NXKcKI4YqLJdtrwfWZpbqP70H2pxpxZVgurVmQa6LnRwk/hTv/hKT7HqsA9ZVTa
	5PwUibpycHZjAOYZX6Ok1NZ7G756VfnX0HDlRDgzcYoU9AOoBKl7jNmtA==
X-Google-Smtp-Source: AGHT+IH8kc6+cltsERv2tTI87w9RpzrI/Uxd36n75mjO1x7LsaWpJdqUf3dwGEmcu3AmNY3dvipvnQ==
X-Received: by 2002:a05:6512:3c82:b0:53e:1bb7:588b with SMTP id 2adb3069b0e04-53e2c303797mr785196e87.44.1733480219213;
        Fri, 06 Dec 2024 02:16:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:16:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:16:01 +0200
Subject: [PATCH v6 07/10] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_hotplug_edid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-7-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2587;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mWpkFqjp1yyO8iD77i9han60egAD/evnvMAnr5hrOdc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8JXoJleVeXT84oS2M6AvDZrSRqHGCIJXg/5
 lKSomHX+x6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCQAKCRCLPIo+Aiko
 1f/YB/41OkBVU1XNEzkbG3DFY23S7DFi6wn2p8ZEfwQDqQLsyhZyNih+ddfBVpgTUXQvmrBZq8m
 jEoBlwO6SyUFPTywjLRGEna/tCKshIaqoAP8bnj8L6rSMqfhmrLqUH66F7UYeIjwGGE0uE2JGRy
 f+WlCpQUacATeokiK7MFZVVHK4lACJtBnqABGrh1qEuBurO2OPyoDaHl8qncLNKcFYORUqQGUDF
 5v7R06MJ22XXDshojT4piLRisvT1R3QxDA5xO6/+mZScp0e6U306TQvzKyV0Z034+8I07KtdgIZ
 lmUAoiLMZF2w/xvIwsLBKtV6o/962J/nSm2NMiY85RFQDbNh
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_021700_845057_6ACE10DF 
X-CRM114-Status: GOOD (  15.47  )
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

Extend drm_bridge_connector code to read the EDID and use it to update
connector status if the bridge chain implements HDMI bridge. Performing
it from the generic location minimizes individual bridge's code and
enforces standard behaviour from all corresponding drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 4fa1bb73d430d02d5b79a1a184c203ec9e9c66e7..0ff82900bd07933e292948446b9637ebf2076694 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
@@ -182,11 +183,29 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 
 	if (detect) {
 		status = detect->funcs->detect(detect);
 
+		if (hdmi) {
+			const struct drm_edid *drm_edid;
+			struct drm_bridge *bridge;
+			int ret;
+
+			bridge = bridge_connector->bridge_edid;
+			if (!bridge)
+				return status;
+
+			drm_edid = drm_bridge_edid_read(bridge, connector);
+			ret = drm_atomic_helper_connector_hdmi_hotplug_edid(connector, status, drm_edid);
+			if (ret)
+				drm_warn(connector->dev, "updating EDID failed with %d\n", ret);
+
+			drm_edid_free(drm_edid);
+		}
+
 		drm_bridge_connector_hpd_notify(connector, status);
 	} else {
 		switch (connector->connector_type) {
@@ -278,6 +297,14 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
+	/*
+	 * If there is a HDMI bridge, EDID has been updated as a part of
+	 * the .detect(). Just update the modes here.
+	 */
+	bridge = bridge_connector->bridge_hdmi;
+	if (bridge)
+		return drm_edid_connector_add_modes(connector);
+
 	/*
 	 * If display exposes EDID, then we parse that in the normal way to
 	 * build table of supported modes.

-- 
2.39.5


