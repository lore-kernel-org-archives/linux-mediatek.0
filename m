Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1D3C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ikj7vNEeHwYqr2Sk7V2uWjly1AUS+w1dHEa9aKVsIKM=; b=2kIlqLTAGmK9/gCXJwcuVEsnMf
	QR8/yaTwoCo+7hyEWQgX9FzHYMOShUwZ1qbHQrzXf5a5Y6NIre8Kasf+IC9Hj9mFWiE5XYl23M6UZ
	f6xlA2Q3/kXQ0Sv/xIv52JzwYT6MPJfOkAp13UrSk9teRSpqTKOBwtrT1FguNuBkXbC7ryoR1KQHp
	ALhDInQargAJu/jeDye1MVh/NWCDF9tEYUNoKKn+VF9JDuT31M7VrZjcz/3fwL0EuLNcACt7feiz+
	6Ov8cDeImYcRHZSM+aYiXC7JI32o/kccRia1M6Us+HrNJQiS+Eoj4nHa9hdrd7D7yIAm75OAt2BFl
	Qexejrgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6om-005Kqr-1W;
	Wed, 19 Apr 2023 12:21:48 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6od-005KiP-2y;
	Wed, 19 Apr 2023 12:21:44 +0000
Received: by mail-ej1-x630.google.com with SMTP id kt6so42977798ejb.0;
        Wed, 19 Apr 2023 05:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681906895; x=1684498895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ikj7vNEeHwYqr2Sk7V2uWjly1AUS+w1dHEa9aKVsIKM=;
        b=J0WEgBeH3AuzjTRnY6ZMAG+N2rXXBrZyAUVHDGkCg8XMJg3kPYmEZgrl8woiQWbSKh
         nmMR2xLDudD6Js9Xv6FiFugNVUnAoes4bVBkYwLAWJlEoEQJ9MTUyBrigihKJk7Q5OF6
         pW/Z6pWzYoxgWsGgZpsJTrS068RSJ1yHtPSWLICYYIJ7V5Ozov5wb5+cH8ahPC6mZUab
         uMFxC6RmGEMq6Gqp+fl59jLcNW0UXM7N4Oynkam5frnH3Ol5hdwUXX80rLHKMrWE+ff+
         b6oTsATSAPpAsMuOCtjhUX7M1+/Oiwaa/HvdD3/+nRsnsuXzR5VjtbjdKC1Vr1JNiEuO
         lqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681906895; x=1684498895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikj7vNEeHwYqr2Sk7V2uWjly1AUS+w1dHEa9aKVsIKM=;
        b=BfhKoyxX0ZL9dQ/0W4XJDUnh6WDqw2vRT+xEkAh8520wHjgEtG8JzFuFWZ/+hJxLW4
         RJmCvdDpNbTtFq1/pdLTyrSHlV7lq8NDR70W1kpAtMkQf7WS1ajVfxePtwTWYsKwD313
         +Cvd315atX526zmBdxSvgXy4ehP03DYu3VAqMk9X6den7XiKHye4bIhugI7KPEwnCJqR
         jnvynCkEOLAtBN4r5Vk6SNiurvB2GaMj9VuzwveD+ibAlB7pajeXvxoSjlwFRGEOwR9h
         MLR3x+/nvcyA03TI+ctKWioujnHqC3CMePxvpEyEcV57f/9QSASVtB3JXtYiq6J+RlfG
         fzwQ==
X-Gm-Message-State: AAQBX9d2B5bs4Z6B3WPKAZc7c0pxkCKLY0wHXYg2BBw70+CEYQPsbfMH
	yBWgVugcIHno7HQ3drzJIB41ropruq4=
X-Google-Smtp-Source: AKy350bBzkE95kos0q33LINUgkdtibn6mLbBpYxYOmoVIVcQa18X2jgahr1RB6ARihB/OGEiyt7aTw==
X-Received: by 2002:a17:906:dc1:b0:94a:474a:4dd5 with SMTP id p1-20020a1709060dc100b0094a474a4dd5mr14037623eji.9.1681906895099;
        Wed, 19 Apr 2023 05:21:35 -0700 (PDT)
Received: from localhost (p200300e41f053a00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f05:3a00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id mm14-20020a170906cc4e00b0094f507aa0e9sm5208323ejb.19.2023.04.19.05.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 05:21:34 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Guillaume Ranquet <granquet@baylibre.com>,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH] phy: mediatek: Avoid floating point constants
Date: Wed, 19 Apr 2023 14:21:31 +0200
Message-Id: <20230419122131.2167122-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_052139_964080_8A9668C3 
X-CRM114-Status: GOOD (  13.11  )
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

From: Thierry Reding <treding@nvidia.com>

When building with old versions of GCC (6.3 in this case), the compiler
stumbles over the floating point constants in this driver:

	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c: In function ‘mtk_hdmi_pll_prepare’:
	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:331:23: error: ‘-mgeneral-regs-only’ is incompatible with floating-point code
	  } else if (pixel_clk >= 74.175 * MEGA && pixel_clk <= 300 * MEGA) {

	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:361:12: error: ‘-mgeneral-regs-only’ is incompatible with floating-point code
	 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
		    ^~~~~~~~~~~~~~~~~~~~
	drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:361:12: error: ‘-mgeneral-regs-only’ is incompatible with floating-point code

Fix this by switching to the KILO macro instead and multiplying the
constants by 1000 to get rid of the floating point.

Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index abfc077fb0a8..b10af26cad2f 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -239,9 +239,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
 		txposdiv = 8;
 	else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)
 		txposdiv = 4;
-	else if (tmds_clk >= 148.35 * MEGA && tmds_clk < 296.7 * MEGA)
+	else if (tmds_clk >= 148350 * KILO && tmds_clk < 296700 * KILO)
 		txposdiv = 2;
-	else if (tmds_clk >= 296.7 * MEGA && tmds_clk <= 594 * MEGA)
+	else if (tmds_clk >= 296700 * KILO && tmds_clk <= 594 * MEGA)
 		txposdiv = 1;
 	else
 		return -EINVAL;
@@ -328,12 +328,12 @@ static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
 		clk_channel_bias = 0x34; /* 20mA */
 		impedance_en = 0xf;
 		impedance = 0x36; /* 100ohm */
-	} else if (pixel_clk >= 74.175 * MEGA && pixel_clk <= 300 * MEGA) {
+	} else if (pixel_clk >= 74175 * KILO && pixel_clk <= 300 * MEGA) {
 		data_channel_bias = 0x34; /* 20mA */
 		clk_channel_bias = 0x2c; /* 16mA */
 		impedance_en = 0xf;
 		impedance = 0x36; /* 100ohm */
-	} else if (pixel_clk >= 27 * MEGA && pixel_clk < 74.175 * MEGA) {
+	} else if (pixel_clk >= 27 * MEGA && pixel_clk < 74175 * KILO) {
 		data_channel_bias = 0x14; /* 10mA */
 		clk_channel_bias = 0x14; /* 10mA */
 		impedance_en = 0x0;
-- 
2.40.0


