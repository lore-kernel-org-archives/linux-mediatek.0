Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E209DCD3427
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 02:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpzQw9LNt+SDHOumdIx/cD2vW3Vk+Ggm6Q+ZCEu5Pho=; b=ND/qPS+/PNFm2GveUxausMccre
	So3OmMZZbGqoxHcU9xK4eyxAaeRE7PUJDT9+E5pxgr/FAuWHI/zmXOYppC1TeSGJxsDVsQRXkBDE6
	SG6aXcWzLsd5bY9IwIwM1zof3uRBrktL2+15KDcE/2SJLsqhIN4FOMWg8ovTok49agzBypo/LY3Dl
	l0ge5iVxfDjlz41YdonapKOiYEXgij8T6X7xA10xt9ywpJmGzAJchrdgj1H9QpKAwq4zRxwPAm6R7
	lPT6WAwbGq7G0PxJ4+WZNc8RVPRwhrPLnA36P/S8vWmJUtkT+VJXIXDc5hZqZpBAOmajlu0SquLlX
	2TFtnoIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slIsF-0000000G0m4-2QEW;
	Tue, 03 Sep 2024 02:02:27 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slIrx-0000000G0W5-2EuG
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Sep 2024 02:02:17 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2f50966c478so49909421fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Sep 2024 19:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725328926; x=1725933726; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpzQw9LNt+SDHOumdIx/cD2vW3Vk+Ggm6Q+ZCEu5Pho=;
        b=KWG2nRT4E0AWT7m2zCty4O5VThhMbLEZrqAYWA4A+2so3V/c6PICdcCS5rjC5kIe0O
         Cqi0AYxI2pZJzWIana5r5SPtjFso6i9ptdKPYYX+e0MneVKw8bLRJwjJK26dXdKFgyjW
         ZzPcZMhvUzmFlgPh3pb0RDRbecj0mU2Q7NfQTB4xILtl+J3eX5dKGsm8FRfqWuJ+uss3
         tX2avkAMRm8YFns0A9Vt+HNffibMauj8X8zuYj0+8xBEF/LCjUKltpBS5mxqWLRWCDS/
         FH6wgsXbAAes7Ym0e/U0FulwcafciNsiz3bv+jxlIKztQCG9QT85fAZ8CbRf47R55Q9b
         uDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725328926; x=1725933726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpzQw9LNt+SDHOumdIx/cD2vW3Vk+Ggm6Q+ZCEu5Pho=;
        b=fvKB3zjCMIWoLrxM5qd3oRjpv+6xJlrFw/jcnIZ+jrQJhMxthmy6njmRyajP5o+TlA
         52mxwKSShyTOmXYkv+x+JSLC6sixqJZ45ACzCOKsRcYVnsgvBStjINDAnsHufZxYGI9h
         JDKw3kbj64AYna050LEGla6Gy0tR5waDpYsXiZzndi9Be3+vOCUd44ieuc7t/5caQlfz
         kZYg4VUENZ/5j5G1HfwFRVY+GykHTjgeYGqJdhjYFLUOD2ToudhPJrTcqWToEMmqmNxF
         XH4h7BiDYBH2t5N+Y9oxp4B0IxqYLWIE0voGLgKmA9aPxL644ybo3mgxh5bZBHLfQGYh
         batw==
X-Forwarded-Encrypted: i=1; AJvYcCWc8jeohLpr+ACnwG4kdzfn6zQu0fgs6tHIbUitgERRYINYbRsRw+JZWxG8kiYqnZIrXjPvTGAdyc/uYSgyfg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Q5JEIIpAUEbH3bzNIqYjzRLavKRtmCrx7s4KMgmn42IikUeG
	XLAlpoUHkOeRrsXJchypMrI4XA6y92M+hriAUQUxs17f3iTqu+Uv8oaVLt+s5VE=
X-Google-Smtp-Source: AGHT+IF8v8eYKKb2eQMr0Hsc2qs48UsPP7HLkrE86Dm+WJr2IzV/yR9tjZDK7rnfHNsBM4q2M+EhlA==
X-Received: by 2002:a05:651c:19a9:b0:2ef:296d:1dda with SMTP id 38308e7fff4ca-2f61e025871mr77730561fa.1.1725328925919;
        Mon, 02 Sep 2024 19:02:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm20827761fa.8.2024.09.02.19.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 19:02:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 05:01:58 +0300
Subject: [PATCH v5 3/3] drm/bridge-connector: reset the HDMI connector
 state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-3-daebde6d9857@linaro.org>
References: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-0-daebde6d9857@linaro.org>
In-Reply-To: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-0-daebde6d9857@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2407;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/mT5/AR35rbIDoBCMIT6yhd22qoLCIO/78RuGNtcQT0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9q1PMnqI1KVspetFZi3Gl8JEpLtUs6+nOiyV+WlRKv/7
 tQfLsWdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhIbif7PxXBmk0v/1w+d0WT
 71S6XpXL7jLtn4avhQsSLjYWFpWlNFyaLt3N/iGnatKcwkMCu7O/rjFqCDz8KJc5ufCiQ8KledW
 /uRseHIiy8MxMVvnEyeb7WHv1FZfUhPk9i/cUHg/6HX76mM8Wtf6ERceePG1tVaz5/H9DQNLcGZ
 y6Llcc8p0+KzalN0T9jE0QmaB78cCR07q69f850w4GJ+7JZ4t78CCmYvZnNaPsssesT1P7DzTWz
 mNsNlHTrT7mds9yCbu/axEfR516y5TjmctOSC///F7oMUO36NtU1kIT+YKzleddOzbMTjo2R/KQ
 K/f8d0nnXwQH3rwSL3mk4NsGjQcrfrHr8a45VH/B/RMXAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_190209_668831_2003B75D 
X-CRM114-Status: GOOD (  13.38  )
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

On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
IGT chokes on the max_bpc property in several kms_properties tests due
to the drm_bridge_connector failing to reset HDMI-related
properties.

Call __drm_atomic_helper_connector_hdmi_reset() if the
drm_bridge_connector has bridge_hdmi.

It is impossible to call this function from HDMI bridges, none of the
bridge callbacks correspond to the drm_connector_funcs::reset().

Fixes: 6b4468b0c6ba ("drm/bridge-connector: implement glue code for HDMI connector")
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig                |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 8c174ceb0c4d..3763649ba251 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -15,6 +15,7 @@ if DRM_DISPLAY_HELPER
 
 config DRM_BRIDGE_CONNECTOR
 	bool
+	select DRM_DISPLAY_HDMI_STATE_HELPER
 	help
 	  DRM connector implementation terminating DRM bridge chains.
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index a4fbf1eb7ac5..3da5b8bf8259 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -216,8 +216,19 @@ static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 	}
 }
 
+static void drm_bridge_connector_reset(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	drm_atomic_helper_connector_reset(connector);
+	if (bridge_connector->bridge_hdmi)
+		__drm_atomic_helper_connector_hdmi_reset(connector,
+							 connector->state);
+}
+
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.2


