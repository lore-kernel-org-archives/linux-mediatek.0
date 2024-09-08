Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AD4E6FE49
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Sep 2024 14:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvzK9QbnMsy2ymdJa9zUCc35kOJVXO+e6EJ8AnZPJwM=; b=hXtH+cKwr5tn7ROnPsw3E8ddFD
	lWmgND8vUobv99TJQ0l+g+MPqaTB32QXPcSJTvMufFpcwzXdsNhsBwvoqoYQAe5IY3hNShUy9eGuD
	wLxBecECuu8Km5S9v5W/aaqfHQuw+7M50DGeWUELaRCMSQXGAt7v2LI42crP0OCSn+bjn4ERZWpBP
	E5A6sOof56VQiOAWduA2xS8n9ODuUvRNTCSQNrb3OI6LxgS2v+V8pcf2Z2unyAlmsM+VyOvCTTpGv
	IDE1NJQvVYM9FdX7DxWZgXD6C4MzUGglseVDeG4VT7dEiX8fqNFjzmV+XBCFrPuha7Fc9fsAQaHjs
	ZOMWjNng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snIpX-0000000GwOq-3hOE;
	Sun, 08 Sep 2024 14:23:55 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snInY-0000000GvrW-34ix
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Sep 2024 14:21:54 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-374c4ea1d75so69357f8f.3
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Sep 2024 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725805311; x=1726410111; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvzK9QbnMsy2ymdJa9zUCc35kOJVXO+e6EJ8AnZPJwM=;
        b=UgMjwLIDH1V7nLcDZB6NHn4wFurrcvjLRB8uHa00TBl+BufILM6LqmevGOFedU1xXy
         W4x60N1wIMr+g7ijfPGMe5pp2yYcJNhKUZwisMorbfVJRlQXQz+Jv4uMLratiHQp/Cex
         Xuwdbb/iMdgwvT0qNicBYg30Lyqu4lB9ZJqO6wHN5AYoVQ7T3B/UM0yVBeP4f9Pz6M42
         oFWfHD8OLJ2NttgGDTvfmbfvb11FIBfYORMPU2GlyzoozQ213YJrgRf6Dx0pP+a97kQx
         +DDxm6bDCsN2uBRt5FA1iGo7xDnBwVyjqAeyQ5IZKYbwP/HNpz1xpCO4iDOlL9k0hWMj
         734Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725805311; x=1726410111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvzK9QbnMsy2ymdJa9zUCc35kOJVXO+e6EJ8AnZPJwM=;
        b=Q7O/NbfM85/6Ku2zdBxgfy+3LiMyGRDPVHjh0lLecQdhwkTK+ElWr3saleTWWT8FuD
         ozFf71dPxXysQfMyROdTgwAUvxvr1NrbL6fWaspIbvr2WXE9QnkGwY+o1c/EyLGEFufO
         +kWq62dNjNo0q4N/AYAte87x+I8NmyADF6A8BhMlxH4YO1+6Oh7sAavc7ERdeMWw4x2N
         EbESyznInWPGzYJXlTRDYIk96ZqJ4Iy8Nni6+oaBYHlnqt1CWQtTjC5VhOgoNOh7/+ao
         VQwidLJiuPdfQynegjd9PuPC+HsRXiC7rmvuQKfo7Prt7JeTGlECsKenf7AC/PuOA4Ns
         Ny7w==
X-Forwarded-Encrypted: i=1; AJvYcCVerLI8k5DAUHdZMPRIgMEOAdb+bYLa8AZQ3TWSKJcnsLdKgWpEjrJRzzc0H1XZPAnznaXKv7XXQggkwEP0qg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyl4YL7pMJi3XG9r+QJHC2Zvk870+G/K2VwUc0tFNl34TrlRkh
	9nBoconTaSN8s0rGUCPUHAag3w7bT+V36Nhg9WZGq0mDg/DEfIOx7+KNylOh5oo=
X-Google-Smtp-Source: AGHT+IFGkCKTBZFIvwjzPmyy0UxMVxAvqoCnC4DEkYoje5P7hwJW0E6txtMBs/tVw5PKSAk1OLHtoQ==
X-Received: by 2002:a5d:598c:0:b0:378:9560:32f with SMTP id ffacd0b85a97d-3789560049bmr1143708f8f.12.1725805310725;
        Sun, 08 Sep 2024 07:21:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675bc9sm3465092f8f.56.2024.09.08.07.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 07:21:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 08 Sep 2024 16:21:32 +0200
Subject: [PATCH 2/5] drm/meson: constify regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-regmap-config-const-v1-2-28f349004811@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=776;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aPIjI3wvog8RSD6EiSqaW+WBy8gBpWkoykw90m+N8VY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3bL0T6C6l0T+jasscr2GbjpaQ6wcbyWT35jQc
 Va62zQLwNOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt2y9AAKCRDBN2bmhouD
 1/0DD/9l6CzinqqFZnvJrhrKjqaSkq5E45kzLhr5PHD/mkCKkD0YY+T84/txfFf6/AaEP/HodmP
 78HhSeHWNPcjWpnxhaRVW3IbwBdX2aFF3BW+2zQ1R/y2F+Jnz6FxpsUuuUljHW2p050ebNx9x/7
 zHQg7WBZPrCGzFSBzDmEGmZvGPfnQYBtODxdINnnoSMRDR4jdbfyXKZq7MMKkdcgBSF6w+1rGp3
 JijCE1endeNXX7boyGXcRaPvGd6NyeeXqwjq2UbzV4NQdccHpQvAxPqhuLsh2+tT53bvTeqXB2A
 jLYI3MzrcVxhUsYstfk2+KtczefK237WvepVp0agYSsV0fWeu4dhhjfpdjzNqXdbkBKdFzdER6b
 IzbEI9wKEN2j66N32zv9zDouDzI8413GbVHRo6DsRQ49rKInBpthEx1mdvklnkPbGLyVrMkflM3
 JGhj7U7GJLZquuk2dLqCQyoSfWnQMRWMQCJ3DBRmhsKLeYOe3jtQvgwxJL8wHmPlqGq+eQwzgrJ
 drJS/MmBSCJOhUk0IqcXBeKumH5sF4VQY3ea9su0SfPWijaHAaZBZvjM/qDhnOtxZB048N5EJhZ
 MjGGdoBwWnh/NeQ74ple37I5eEF0/6l3V82Qs0HJ+mEM9MLVmHcOuTxPeR28pOP5KrThISJF+w6
 gV3tP7nWzxcLwlA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_072152_819003_8E57EE1E 
X-CRM114-Status: GOOD (  10.54  )
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
 drivers/gpu/drm/meson/meson_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 4bd0baa2a4f5..6c8677d1f562 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -126,7 +126,7 @@ static bool meson_vpu_has_available_connectors(struct device *dev)
 	return false;
 }
 
-static struct regmap_config meson_regmap_config = {
+static const struct regmap_config meson_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

-- 
2.43.0


