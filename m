Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C83ECD4F4C
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Sep 2024 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uB5jr1/a17Qw9RVDWm+OnjEYYAvO8EC+zVlD8qC1Kcs=; b=PcIHBYopi7Xpc5FKQJvYXDQvZw
	ZLgyGDfYHMPxc2LvV7GnvhKYVLqMWpQIws7S947V0VRd+YIMnFMsQOYFeOs/eZizUUomWRNrSioxW
	zGQgTradbpJDT4IqYlEu31OhEOqakddBEF2UAakVwoHJ4NEOuZVNOKv+dAJQc3XOowersZPaz0C7i
	dpqsCUc+/COIpgRBZZXnQcgK3RsBCnFfAZ/Ij+c0knoPGloFw/OY3Pb6UOSHh3OqcPGRUoidUwmWR
	OB19KxywgliGJYVd5Ykg1C4CWABktYboFJRe0R/bzuCjH0R247VznW22sZT2EFvsrYvRKs89qes2Q
	FaR9Kt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snIsQ-0000000Gwss-3zPH;
	Sun, 08 Sep 2024 14:26:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snInd-0000000Gvv8-0nhl
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Sep 2024 14:21:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42cb0d0311fso1541575e9.1
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Sep 2024 07:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725805316; x=1726410116; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uB5jr1/a17Qw9RVDWm+OnjEYYAvO8EC+zVlD8qC1Kcs=;
        b=rKOI4i0xJF5dL+K3blwJJFUsu8RT3F8Xpy/QOij7NtcFOtgTA3SeJTDsKnKjFkipYc
         jb2Ws49rfasSXdwngScudRfGhFc9sVszYTn404CbXXe9upaCCvSnMzenJCGwlCy67R3o
         hu514xBIFu49sZQXXDkOeQB8Q7EjfcyH5k1JKrnhfPOyjv0OaVgJAlqoAw2SAgaFpXMO
         DmS8Ck00GzWCqjDCz6K2EzPaspJMaf69SBqqaEX+S9Nr711fGfXxcIQT5efEPnpg0UfB
         acY4sAEAHaV4tMMDhfeOYdPrqgFBh8VmYOdenX+9nk4gzh4Xw+hK9dmSVrz0p0P35CsG
         b9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725805316; x=1726410116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uB5jr1/a17Qw9RVDWm+OnjEYYAvO8EC+zVlD8qC1Kcs=;
        b=nrs2DhHb+kQ+GuAZJXD3IRulQr14wSRVuaq8GMebCSeVNGwIZKK1osXZMrcvwSQba4
         g1VVWlh/yIThRyBo0hkTxSkF/NehRygwQnTpWFyjlZlPEO0oPzsFv3sXApjnTHpCY2Jn
         J5Xf4qQsYs/RiT8rGxFtMQlA4HmS+EVhQBvUsF6JxhqX4iI1kEiszm38z37vXfaP2KO8
         m9HeIwdb+k2AfneMLoKERyTRq4ZsYLsxH+K1/3PhjrVzehOQSG57yTMw1hzDITWxRsF6
         YicOF/klanLFUh/HyZaUtFQYzhUWNGDDAOnVp4U7NW/JsOjHgO2MWbZCiNo/0TAY/DkS
         uqYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsJDi92uI8W5WpBrj2KuqEUfMQ1e9kBKQ6n/9dXElRX8fkJ/rZ7EOmaRun8G1JnDI/YrSUAlrp6LBry1iwSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw96XX8KyuVmKCnYfTcl2URiXVO7/GhI16bYo1fyHsuBs9ycxV3
	f53icHZDibKWqdVAUFdvqJWes1L8epQipwX1jvy3HpZ2jKk0GMQa36eiR2UiFkY=
X-Google-Smtp-Source: AGHT+IEFghUIs3JLLMCLIc/+MFj1+yQJjFDJp6mNzr37xyzU8YsLEL/hiSYgzOa7b690ExU9/x+VRg==
X-Received: by 2002:a7b:cbd6:0:b0:42c:b55f:f4f with SMTP id 5b1f17b1804b1-42cb55f1448mr4842685e9.6.1725805315297;
        Sun, 08 Sep 2024 07:21:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675bc9sm3465092f8f.56.2024.09.08.07.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 07:21:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 08 Sep 2024 16:21:34 +0200
Subject: [PATCH 4/5] drm/mediatek: dp: constify regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-regmap-config-const-v1-4-28f349004811@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=762;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=crUOVtF8wl03qYwZi7N/pIKnRz+XR7DUlbnH+NouxJI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3bL2WBZUZoPTgLGvdfqLUo2h9AY+9HYWr/Zzr
 GQDQ8pK39aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt2y9gAKCRDBN2bmhouD
 11ZXEACa9khZ8BfJwy1IrIOqvJtmn/fQUMm0z7B3JpGGWvxswrY4bTvTiuOUHGXaWYykA2sKS5R
 /mPLfJixbQ9smQsZ6KU9jCYt0xkLABPMIGAon5DUsQaslCnvbwRBUmFPSOolN2VVr+JFcKGGiwX
 UXBxY+kI+IvA4OG2cqdk4SWgvA0E6Zk/MbmxeP0tQSqOw5zEKAWPU5Z5N4VsiHWBR5Fi4LX0Q+r
 YUwHWlud1iq8Zg6uxf2Uaahu+iHdqsTl8uoU1LUloB7rRNSYEA6MMGquVGp49NxXDT6+F2OlkM7
 ZPpM0YH9fms45q5055fOBsjsvrFv09qSVrXm25l2bmG8MbsOPplxoXHUZ1VucmWYJP1H6RN6+SM
 1MHCeFao243tZxITkw+SH/6X+hFgH3e1mDg31NDKulPxZP/zLJ9d+nJES+SMH3MuDEVkvEjKzIY
 SVEorP6+8K2r5h4Q9pooSy7Lekdhg68VA48BeW2/htj3tjFV6GgEwBRgAntFq/BbwivXmdjzgT4
 71R9akZCVSJxErQ/p8HmBvpSWsgSG/KUo5PepF0xsY/ekvLVh8Ntlpoawlt1EWRqKQ8JIwa0FA/
 UWNdX/v8HqKnFADlWwBpeo1cTswqjmKt3tuwxJcXppAgilI9oAHbyHxbEt+Jtur8WwPsWQpH+Mq
 GFKo3Js0eafmwbA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_072157_307633_54CD10EC 
X-CRM114-Status: GOOD (  11.04  )
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
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index d8796a904eca..f0f6f402994a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -311,7 +311,7 @@ static const struct mtk_dp_efuse_fmt mt8195_dp_efuse_fmt[MTK_DP_CAL_MAX] = {
 	},
 };
 
-static struct regmap_config mtk_dp_regmap_config = {
+static const struct regmap_config mtk_dp_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,

-- 
2.43.0


