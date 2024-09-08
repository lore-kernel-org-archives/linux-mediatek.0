Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410FEE6FE49
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Sep 2024 14:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opqWrHh+Ch6fI6vTB63ZLyRaFP0rdq6mZByygqOLt7w=; b=LY+ioIxkOIB1lNF3sjdWJ8TdIL
	B9XEcSlpy1RCDl7M7RWPGy1sKw62KA+kLNMjzD3Z1pnCJliu8z8FHIoffD7g+PeE0+iCn56Es+OQR
	g+XS9iu7F8pUGsUogCGdpqqDhgaAjlqUcNSqa8ZIntY615YcUPTt2SkKmKHXhcS72nFYD5MwsPW1A
	jmxXeYn9uKwOMvqk70X7u9GDReWCcvvSk7ot1C0c1anFjMkzIe+evTPOgEAcQchQIiXyWfmGYGhYJ
	zIFNU1TXq90tTRw1Osx66caHuM4h73kl++UXESEubHuE+WC75oaNOgmu5qK2q9f9P6f9wql2YKjrT
	3O02yhXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snIqV-0000000Gwap-43PD;
	Sun, 08 Sep 2024 14:24:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snIna-0000000Gvt5-2QS5
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Sep 2024 14:21:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42caeb4d671so1826275e9.2
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Sep 2024 07:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725805313; x=1726410113; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opqWrHh+Ch6fI6vTB63ZLyRaFP0rdq6mZByygqOLt7w=;
        b=uscxuAkNAFTVaRPJ9KEOrTzpC558/FHz9olXUwTHWX2Ocgxai16FSmySNcTAnr1XiG
         k+rFO05m5jU0rK3KcRUZqHf6hk6lCAAByoUo8mzhYtXpf4L6K+KZZ3anVyX0JJcEQA2X
         iFoj3XVmpn5YN53YWiCJQnGhdqbK1CzRn1AGqbZB9Zo9KMoMNtXDtlK2vl2mJmv9HjTZ
         6Ir7AKOJsyHL4rQ1rbLxDDbha96Qm/m4KCCorLlhWM6VeUAuNMSW3J9iL6jW8nU50DYb
         Oz62g2bWJDb3ch/H9mMSlhO0o0kprn7FPRi5X0NZz7SY4QfCXtqWmufLsOYmoHeZZhe+
         R2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725805313; x=1726410113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opqWrHh+Ch6fI6vTB63ZLyRaFP0rdq6mZByygqOLt7w=;
        b=Gng0rt0EM1PCq15I2gBcklRT+31uDX8QAWytldY7ArwSmzN/Aec6Qas4yxuRd2IflM
         jF75uta2Fmelj5njURiRk1LRUPSTzNlywbmH0r7I/v2mKberiyWBzocim6eM/a4lIWA7
         4Iu9f9vuEdG+wHdpgsvjved9wEbna7nLVgrCyhed74Te3i9zyo+JmQmEsrvexODhpMho
         a1bSDje8C5ZsVQHdM4c9LGaj92Ey8871WBYN59shJZGWOfcztuXeALC3Uvv+ijTS+I05
         6z0N9BDe+pld1Y0bNHG0JD9RYIYoUJeiznlWrS70g0rdJhfcX1aqgH6B6GNMw7T/0NLn
         G+2w==
X-Forwarded-Encrypted: i=1; AJvYcCU/f9u4cYARSeYHAMCgBcUET/EMZyKkbOZmSXWwoZ72w/HhWyOiXNir45/U9LWFLszSsdk9yDbez0NlVHBKgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGBIrm1Fl+CBsXvvVQ/7hFhXpNuHSg79nXuDDpY6UZ6TQBtpR8
	Ap8+HuiSD/6wgSYVBNjgVv58+vUc0evKRgY2fYukN2/l3AKQqGXrT58qT08MFKc=
X-Google-Smtp-Source: AGHT+IHk8lX+IYMMyPu1J/51I1ma3xgJuFFXQvGLe9njZslD8gy0z/8eNeprhovuMvXcy51jKG/AEQ==
X-Received: by 2002:a05:6000:4012:b0:374:cef0:fd3b with SMTP id ffacd0b85a97d-378896d9cb1mr2543013f8f.7.1725805312996;
        Sun, 08 Sep 2024 07:21:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675bc9sm3465092f8f.56.2024.09.08.07.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 07:21:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 08 Sep 2024 16:21:33 +0200
Subject: [PATCH 3/5] drm/fsl-dcu: constify regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-regmap-config-const-v1-3-28f349004811@linaro.org>
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
In-Reply-To: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=773;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fRgUGDqaRoZtIl+WHmIGQHM80N5JZYutQfaDHkXDk08=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3bL1Qv6Igmg4XEMVNhOLdsVdTsUR1ueqJ3Ovb
 bpFAYP2+5SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt2y9QAKCRDBN2bmhouD
 120OD/0T8cOrR9KrPkxGh35sFSSSYkDyfJm+7NO4H+CL5+6LxsJSQE32qyrJBthu/NHaSb0FOrS
 DuOXs0fccV7E2KOD0uWG1qqTFo1p+lRlt6xYtbe5JNCxa2Nb5Zyjj76X5BGxhnjHZwU7E/lVJDz
 UAKQC97zY7Lg5q0ipatllnHQtpXMxb9HzSbRpUO8nYrjKkFwTw9630C8UK7u7SG2+F3A+gEE27T
 R296FzEoWCTMK2XNdVIzoa8ReBXqqbA5OtA0FwjYu1NeORxZdfMyZoxVrOK6sj0K8C5PZOdiXAh
 KiGP8jZg+v/cZMqyGmMbyHn5upctXKk+zGRag4ntk3BZJILn30VGw0bEppoaWeDkmQ6QlsQlkBu
 Ez5xrnnarhQjKlcyUQ+p238dxH68dhDA3QPQ7i8U+hf7rAnNicPIYmbbPkpKE3vXrWD23XrxBZX
 1WNEXsc/idRNn+1RHHO7CsZuehyZL0TZJjbTAU1ZNWa9Mm2BbUwM+MaQxqRZr1w2tNWnk6A9UAQ
 TRSOKKX1sUFNsHOymhvkvG2J7It1/eYgYu3LKmvikixTnT7OwugUQdVVLAog52PVjM1Jojj5mHK
 cM88yx9IKD5tes6N9i5SWjkR2X7Ri5/9EOI0naJm452GPgBcBh2YQZFUC2VhKNQ3rWRWc1+ZhtU
 00CRDz+hXylwv1Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_072154_728859_2C4D902B 
X-CRM114-Status: GOOD (  10.62  )
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

Mark local static 'struct regmap_config' as const for safer and more
obvious code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/fsl-dcu/fsl_tcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_tcon.c b/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
index 9eb5abaf7d66..49bbd00c77ae 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
@@ -29,7 +29,7 @@ void fsl_tcon_bypass_enable(struct fsl_tcon *tcon)
 			   FSL_TCON_CTRL1_TCON_BYPASS);
 }
 
-static struct regmap_config fsl_tcon_regmap_config = {
+static const struct regmap_config fsl_tcon_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,

-- 
2.43.0


