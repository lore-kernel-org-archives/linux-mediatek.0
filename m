Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1BCE6FE49
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Sep 2024 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tqwhJtSpVBRE2P+yWS/8hgOJL8h+VSv3t9HsbyQZCr0=; b=hMYHnPL7SyxYJV
	giTb1y7msz428EjrWtRshQi7b3xgH00R1tiNrO3m4pgSyL8+AqcC9qe7ySxCvq9POhlfBUn0gCZEC
	VeED894sPYe3K7PsxT/UKe+gsjY0DbYsTOBGqVRx3VLxeNjqGESbppNaROm176w4OQ8Ta0X9Y1gKR
	QEb4IKFFFymF85dkWSMfhutfpdLXUloqpKlbfH91dOTiA6G4De7MRHeWW5+xQI2nKTUPjwlR2UYJl
	mbbO/YwjvFhgj1YH5sQCSnnrtSpPAUudBiuAlaiPDSW7a+nxssquVOfk2KH71HlD77+2Yv0WB23B8
	jv5yzfN9kYX6pqzaYrQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snIoZ-0000000GwCj-2qKs;
	Sun, 08 Sep 2024 14:22:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snInV-0000000Gvpy-0oB1
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Sep 2024 14:21:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42cb6eebfa1so283765e9.0
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Sep 2024 07:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725805307; x=1726410107; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tqwhJtSpVBRE2P+yWS/8hgOJL8h+VSv3t9HsbyQZCr0=;
        b=LEsqNbYPOHvF2SohN5lBdgXln3Qo1DTy6RDI/FFJrjDxaRuzEE/teBueewdavv8aLL
         HQuTANHBJ9CcG2rh964yPubv4bKqGNDz8E3bvT54NM8lkDiQY4ttPATXFY3kCn7Bsch/
         HcwqxK1pTHq/ty7NVf4yyUqPDsXIOCbDlC6hIX5z+ktfchGW1Tg9pENrPJ5pPPZIbWrb
         F7SMGL9K1DWLvz/TZMp3d5NLYsG4nTXKcZ5pnNb+VZD50y23KJKfYwOqc0XwZm9O8Yse
         /2crbQtNR5l9/aovR2bncUVvT9S50O522k9ttuapKaBxkWY5XcDcIxj1CZmWe7o212un
         9M1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725805307; x=1726410107;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tqwhJtSpVBRE2P+yWS/8hgOJL8h+VSv3t9HsbyQZCr0=;
        b=mJk006VA4mcpTR1s9SYCMOeK4bJWZDI7UNQQ9Rrp/BIL+FOTI4VkY/zw5O2r0GECiz
         wwRgWMkC5DlYoHtIP4VLfCQkgUNaq7Rwp2kNY0Fc9UUNDhPRSCSF5LKBlp5ymFfkzz8p
         E47A61zDGZEahKEPrMogSMfmTYF1q0TfBCS11Ot1xnp7qg15lOBBTg7p4MI7mtc8jtn5
         r4RpgtmqDzigy6y2rwjDJJndQzdS/ps/atDbKgzBQi4zqf4YyNIcJ9n00UiyQ4dCc5W2
         K7FWvqz0JnTSgtYZ2b+LsR2wu6lwf9jJndkrwLzexma5P1MiR1m6whlHsdQlBurIuEXW
         PP0w==
X-Forwarded-Encrypted: i=1; AJvYcCWObtA4eI1ikxnTMc8wOUQoFR0LwDvucrQ9c2LJ8ago8e9zwgA3pQjhUyCwO8wQYafwf8mbJOcQggMFJeSgBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYj/do9KjA9EDCLRFtNZKxgLYZMjiwoVLUXd4jiR8yh9NQbbyE
	7tmxKMdKL2yB7b6LABz75JO9YMBKM9+AJJGOEq/XkIcWxFw5fKLDXrSI/LrbPiI=
X-Google-Smtp-Source: AGHT+IG9ZRq/DMRhNGgXiF+TDH9JtKI9MBZDNIgFAd+SfH8Xnqjsitbh2pFtDM7PPUl5w/VKJP4Lag==
X-Received: by 2002:a5d:64e5:0:b0:374:cef0:fd46 with SMTP id ffacd0b85a97d-3788964fa72mr2863505f8f.5.1725805305990;
        Sun, 08 Sep 2024 07:21:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675bc9sm3465092f8f.56.2024.09.08.07.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 07:21:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] drm: misc: few simple cleanups
Date: Sun, 08 Sep 2024 16:21:30 +0200
Message-Id: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOqy3WYC/x2MQQqAIBAAvxJ7TlCJsL4SHdRW20MqGhFIf886D
 XOYqVAwExaYuwoZLyoUQxPRd2B3HTwy2pqD5HLgE1csoz90YjYGR/5DOZk0Iwo5OjTKQCtTRkf
 3f13W53kBHBWAnmUAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=839;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cTToaTVq2mBf2Fn9C8i98ir1v99mJbXz1+GQpR3uiOI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3bLvNFcaXf8SGW37AV8bPzrMpFogzThXLLuQG
 l+3znii392JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt2y7wAKCRDBN2bmhouD
 12t0D/oCKBiGiFWPFsnvZbBBzS6lfNLS6Y9kmHg76mabyuHNJMF0vh1D359N4I6rnoOl0eLvI5O
 zzML2lKr9W9iodldL+NGvVQky/fuNnciPMFuiVmyiSUprJ8GbdpaFqoqZurKI18YJm7utqyRo5y
 oVfj2W2DxvKnL0fKgIHnpNTlvHunHINm0Q+5tJtb4WGdi5ccjJm7NP1lOwtbkyrRYZpVM1g5d2R
 ZYKKNey8wi0sWZMr0eI1XRsstmm5oBFK5V1kA2ShdX9B8IRePN/vxpkRZynbDx80HJpnYRCdfMX
 TS/gKTYUxj9xnpdTiaGx2K9pE9eRVVrv8FWBRYnq+PfxRtyK/b4/++or0Ib3763JRCQUTI6KMyG
 +Y9HYhCTjKq0dH72Ur2Id8SWOjrbyCTGAZqdLoQ1rZStOx3KxQE4qjKmIXaqnzwLP4vdy0UYTuC
 Y3TKFIhmMkAasktectjZjE6zcYluKkyyYghp3hKRIbYwuPOgKEjzDXH75nUHHyKLgnjxVIEPbNu
 X8LRB+WxdcYJJ7aLwXvbeTz2zvnEgFIudoJPQA+grpjUsPnWelYqnK6WeJsKKP9RAl7uqi6Cr7O
 jfzM1A05b9FHTIW+dNNbkZOafygeEjHY8eQ0tGoMb9RAA6SywaWmJHtNuRPSpGTZdy3R2VW1/OD
 g1bC0WL8WXxTFKw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_072149_282143_1A74742B 
X-CRM114-Status: UNSURE (   6.46  )
X-CRM114-Notice: Please train this message.
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

No dependencies, trivial patches.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      drm/meson: drop unused staitc dw_hdmi_dwc_write_bits
      drm/meson: constify regmap_config
      drm/fsl-dcu: constify regmap_config
      drm/mediatek: dp: constify regmap_config
      drm/bridge: ti-dlpc3433: constify regmap_config

 drivers/gpu/drm/bridge/ti-dlpc3433.c  |  2 +-
 drivers/gpu/drm/fsl-dcu/fsl_tcon.c    |  2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c     |  2 +-
 drivers/gpu/drm/meson/meson_drv.c     |  2 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 14 --------------
 5 files changed, 4 insertions(+), 18 deletions(-)
---
base-commit: ad40aff1edffeccc412cde93894196dca7bc739e
change-id: 20240908-regmap-config-const-2b6e126feb8b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


