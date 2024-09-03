Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77F0CD3427
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 02:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zW4Dkbs/DpuJ5jOJGFiWuBbUi352hxlJAviTa72dXa8=; b=lQbWwBgIiX7Z8Sp2fT7XCMTtuw
	iTvd1tsg/EBtvZu7O3L6LdjNILil3zO0y0MfEWHDhh/5GoQkxaJy4I3wQXrOgTZh6JD5uAKS/FlTV
	x/QYwu0p7eeSVij/8qgLjscWNaYHg2sHrUxXqbe2REL+FetqhrG+ZGXn1aQYxIH5dscu1x60/ghNY
	F7nmSovOzLUdAYDSXDk2kAZSs2GRFMky4gfkzEBDQLqxPN0zX/3VXwvTR12DPEwy1Ra8T+DbEWwk+
	ljeb8TzXgFKd3FD9Jz2G3TGwAQcgItX0ZdVp1eq15Fvviyz/ctpKnBKFajPkDHv35f9DQJtSj0WZD
	fDzUvgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slIs0-0000000G0ZV-05Wt;
	Tue, 03 Sep 2024 02:02:12 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slIrt-0000000G0U3-40as
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Sep 2024 02:02:10 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2f43de7ad5eso61218881fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Sep 2024 19:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725328924; x=1725933724; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zW4Dkbs/DpuJ5jOJGFiWuBbUi352hxlJAviTa72dXa8=;
        b=ZqEQBRJrwg+QtHAJ+6o3Y7KjAQYfclWmbgwm6pJ0mWn+h/KYxXm+Opo8d8E/GKAhCM
         cwSR/qVXzY5J8OC2tB1HxjwHGgPbZYA0r5DoBbEMIw43Spa1vkjHjgg1fVk0oo1A+bLt
         /E7PW9BOuKNyRPlbETRDJ1x9gGlx6tI/IODrcGitv1leh0BAr3S+sZzks3LxLrE4yzSl
         Phrmtx/pgamav+RhZwUGzMHzLEfUOrmHYfgGL3wGNws4XSDS449WGPimaGr7uth32/jG
         DbvWvir4YlW8uuV/Ko2mnzCDpkj3IANkDPgfIzX53TOEXuttXtOzD+SXqX9jifVRXchQ
         h3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725328924; x=1725933724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zW4Dkbs/DpuJ5jOJGFiWuBbUi352hxlJAviTa72dXa8=;
        b=d0t/fQ3G/wjokixQX4L9N2z3uw0Wv8Hm134VHSWRYpTwsdZ5F7vsb1iQhsnI1/5DRU
         /PYOAZ8bopIPekz4ukirhxOaI6aoy2RM1MAmLu9OA8FzyGB2wfke0oomIcJRsOXdodnX
         9mTLgPFxrCQQic3vie5gwjdicu5fzhCLJEudwzHNp7lOxKGjAKf4JUNvVjPHPjHYSFVn
         kMC5cXqZ/aW9otlZ4NPDjK+61wCprg1UlQP3IEca+F6yOkMeiuzzlBGrVyrjL+Bdj7Fh
         mWHLd13Rzqve+qwY1rNQPU6OMFaxCpwEsXRP9/oPPFgSlt36SPSuy55UuMW/P0ACzLjg
         MTkA==
X-Forwarded-Encrypted: i=1; AJvYcCUgvj7vczo5hDWHiNi78FZrvXt/wMFOruKbnWCip0JhIr99GuNyhbLfy68i1c1UtxX1Aiv71WqPrLkQo7bdTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWn0w8YTFsiHtpBIn+8ce6TXxSi1/xT6nDghgerF9HQrNK+xHA
	HhS+l6hWfmFuQw1FRoRJjN6hhymZ8QS4qJ00Pcc5vYci5/xbpBdic8Z5Oblco4A=
X-Google-Smtp-Source: AGHT+IFmUC62ts4TlsiKbmKtX0hZZ8aQftMcsTMwsK5R1sswn3munGEWxmkaVy5WBPmPGx4nrbeQOQ==
X-Received: by 2002:a2e:6111:0:b0:2ec:3d74:88ca with SMTP id 38308e7fff4ca-2f626585672mr58938981fa.25.1725328923605;
        Mon, 02 Sep 2024 19:02:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm20827761fa.8.2024.09.02.19.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 19:02:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 05:01:56 +0300
Subject: [PATCH v5 1/3] drm/display: stop depending on DRM_DISPLAY_HELPER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-1-daebde6d9857@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2696;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=eQJ3hRch4PVpnxcgcIs2vVrHHBN8kCt55Lg1+zlGYoo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1m4Ydfw19JUYRwn1jTaddmh8cQLUA2XqNCKhP
 lN9A0ASCZWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtZuGAAKCRCLPIo+Aiko
 1WImB/48EDSxmra6JSSLZCioPN1jQgA037hCAO6vQjo/qRj7VRQGLSHJ+bxa6Z3+La9aIP6xrz7
 ruMK94QpzIyTF6dMy30OaTgS6ZX96eBlR6vKDwhaeiJevCDRZnVTejmWXXh4gizEIp0AsbN6a6t
 52BW8FdsYKtqO5NMYODz1yXrCckyJ22+M8hi6JUndhd04OylNhmOd1H/E2afMOvE/VXfnnlLPab
 aCGDA9Jq4qxZHernrwhzxi2K0ppV1dmg8mTTK7KHrv5zpjjtNeVzbr+alSFN51EgWxV43rg+Ugq
 9krzcgaLUA7XPlXqn86PPRCYCxMtmeDaupqUIYvNX98r2CAb
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_190206_245539_B9269B45 
X-CRM114-Status: GOOD (  12.36  )
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

Kconfig symbols should not declare dependency on DRM_DISPLAY_HELPER.
Move all parts of DRM_DISPLAY_HELPER to an if DRM_DISPLAY_HELPER block.

It is not possible to make those symbols select DRM_DISPLAY_HELPER
because of the link issues when a part of the helper is selected to be
built-in, while other part is selected to be as module. In such a case
the modular part doesn't get built at all, leading to undefined symbols.

The only viable alternative is to split drm_display_helper.ko into
several small modules, each of them having their own dependencies.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index a2e42014ffe0..9c2da1e48b75 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -1,19 +1,20 @@
 # SPDX-License-Identifier: MIT
 
+config DRM_DISPLAY_DP_AUX_BUS
+	tristate
+	depends on DRM
+	depends on OF || COMPILE_TEST
+
 config DRM_DISPLAY_HELPER
 	tristate
 	depends on DRM
 	help
 	  DRM helpers for display adapters.
 
-config DRM_DISPLAY_DP_AUX_BUS
-	tristate
-	depends on DRM
-	depends on OF || COMPILE_TEST
+if DRM_DISPLAY_HELPER
 
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
-	depends on DRM && DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	select CEC_CORE
 	help
@@ -25,7 +26,6 @@ config DRM_DISPLAY_DP_AUX_CEC
 
 config DRM_DISPLAY_DP_AUX_CHARDEV
 	bool "DRM DP AUX Interface"
-	depends on DRM && DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	help
 	  Choose this option to enable a /dev/drm_dp_auxN node that allows to
@@ -34,7 +34,6 @@ config DRM_DISPLAY_DP_AUX_CHARDEV
 
 config DRM_DISPLAY_DP_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for DisplayPort.
 
@@ -61,25 +60,23 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 
 config DRM_DISPLAY_DSC_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for VESA DSC (used by DSI and DisplayPort).
 
 config DRM_DISPLAY_HDCP_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDCP.
 
 config DRM_DISPLAY_HDMI_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDMI.
 
 config DRM_DISPLAY_HDMI_STATE_HELPER
 	bool
-	depends on DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	help
 	  DRM KMS state helpers for HDMI.
+
+endif # DRM_DISPLAY_HELPER

-- 
2.39.2


