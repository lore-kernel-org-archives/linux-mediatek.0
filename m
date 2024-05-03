Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33F9C10F16
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 22:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJSS1xLEfY3Y1Nc4TX+Fmok5eKTdIJMR9yqmN0qgIiI=; b=SY/vcHY7DzJBEAPJ1pwrGc1Vj+
	zoLjE6iNwib4xsAjPUZ2wA2kOv9XyWKm1rDx/KsHCp6KKxp9AYIir4wGxaH5NKk3IJEF7HbmgvTUk
	oyhhg5F6fLz9PTtHRcsDTGky9nIjnqjxhA6QIZy+PoGdr6DdEfQ1w3kuDbl2+DtW0sVCYIoaF7m5k
	NVGlnhDxjCw6ZDDra7fHvchZ3o2HDziEiU5stSVaGc45ppFJqOZfy1kb2eH4/ec/dGpsdTWl1TRIl
	I3m+dNvha3pmWaKtEqnypy008WUgC1c1dfCJlaa/weUt33G1e14lM+YXwU8XRejGROkKC5EOYyXWv
	DkUWZE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s31fn-00000000eQY-0MSi;
	Fri, 03 May 2024 22:46:35 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s30a4-00000000RYA-3xg3
	for linux-mediatek@lists.infradead.org;
	Fri, 03 May 2024 21:36:42 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1eab16c8d83so853265ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 May 2024 14:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714772194; x=1715376994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJSS1xLEfY3Y1Nc4TX+Fmok5eKTdIJMR9yqmN0qgIiI=;
        b=HINDPiK06Ur6vaW0feaQ8stX4MCvSpV2vYIGuzEA6PnGYkSLsToGDt/ft3HJhUrDBQ
         1qB16Wh+yB4sHEC/7Wjn2bXLFQFY1hN78gGVdEuCBEM4P2VSBzjAdLVYcJ1shWtkzMls
         yq/W2C0GOavW0dlD0TZPf/oFrxX2G/0QGdm8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714772194; x=1715376994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJSS1xLEfY3Y1Nc4TX+Fmok5eKTdIJMR9yqmN0qgIiI=;
        b=iU3zajPZxeB2UPsKcOML3L5FC91egfWvAiCtlAejhT8Vlv+HZN8KdFyIAFU1SCrxmQ
         VgY9zxSdEtkjKrrvzeS+ipmE1hOOMa0iazrXMXNoxH2VWLiFSajw47bcMedsJVAk9vP0
         XHaXW9jRFaWFCCxCngaT2B1jN0lulrQSR7KjuXXX1syEQ1EUThIARIysNX67teJ4Nh5O
         qTu4y9WEw+CEgQeea/u+RI3YD0NzmAGOcDPly9j+uNta0zZlSW79sVm3o3vmMLAAeJCA
         a/nEvL90nIqoaNJAM7ilpKx4OVD0I9r4nWuPJb/Dspwcx4nHcE20YL5+TBqb7XxslonE
         fggA==
X-Forwarded-Encrypted: i=1; AJvYcCXrUdOucvHYzhgiyw1KKqW5Q3AEQhohUHSFEz8B9DaF2R6Ie9BfbejpmSPWXkC1N6agudu0Kn380rZHSKKLTxHwRm9s80UmQdBbiTfU0aBQyYiz
X-Gm-Message-State: AOJu0YweAB4nwlSrlCWAWC1DObaA/7bhxPwnc1bh8GnDy+ZqgeMog3sM
	4E9MD33JXDJ8g6nOHP/vzKQZONMk8ZC0b6/hIwwO5quwaqLrhvWcCQktgPTvLg==
X-Google-Smtp-Source: AGHT+IF/xaXv/X0Wte4aZNJO+64pdFolxJxdcSTQcUQ0uEZBKmCrVQEqCkWitBuj2PfiwIvx+UWLZQ==
X-Received: by 2002:a17:903:41d1:b0:1ec:22ca:b290 with SMTP id u17-20020a17090341d100b001ec22cab290mr5154916ple.21.1714772194313;
        Fri, 03 May 2024 14:36:34 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
        by smtp.gmail.com with ESMTPSA id j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 14:36:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Yuran Pereira <yuran.pereira@hotmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [RFT PATCH v2 04/48] drm/panel: boe-tv101wum-nl6: Stop tracking prepared
Date: Fri,  3 May 2024 14:32:45 -0700
Message-ID: <20240503143327.RFT.v2.4.Ib501f2eceb62016e09cfb17bca29bde0f605a567@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_143637_223963_D8EE7715 
X-CRM114-Status: GOOD (  13.15  )
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

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

Cc: Jitao Shi <jitao.shi@mediatek.com>
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 0ffe8f8c01de..667e1bb4a58b 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -50,8 +50,6 @@ struct boe_panel {
 	struct regulator *avee;
 	struct regulator *avdd;
 	struct gpio_desc *enable_gpio;
-
-	bool prepared;
 };
 
 enum dsi_cmd_type {
@@ -1450,9 +1448,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 {
 	struct boe_panel *boe = to_boe_panel(panel);
 
-	if (!boe->prepared)
-		return 0;
-
 	if (boe->desc->discharge_on_disable) {
 		regulator_disable(boe->avee);
 		regulator_disable(boe->avdd);
@@ -1471,8 +1466,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 		regulator_disable(boe->pp3300);
 	}
 
-	boe->prepared = false;
-
 	return 0;
 }
 
@@ -1481,9 +1474,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	struct boe_panel *boe = to_boe_panel(panel);
 	int ret;
 
-	if (boe->prepared)
-		return 0;
-
 	gpiod_set_value(boe->enable_gpio, 0);
 	usleep_range(1000, 1500);
 
@@ -1523,8 +1513,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	boe->prepared = true;
-
 	return 0;
 
 poweroff:
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


