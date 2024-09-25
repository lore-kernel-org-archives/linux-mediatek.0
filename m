Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944B7CCF9E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 15:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tq2TptZvyceBLBBx7LtBZE3h+E/rY5vjthtbIWopdq8=; b=GoLEWtWv6dPzqb4Qlulpsrm8+S
	m2RIA9S3KKd0ceQRnI+HxdrlVdNFSUsAH6Z+9IkAuvHYuP4669tbKEZh70Ml3C5iWDQXKLtck6A/8
	e8vW2EDSuY2iC9OAkkWkdYt/+m4i7XKqEOxvDT1a+CogqGy5G8Vwa8W8kOi2ldSc+rfzlGmQFRi9k
	PvWxsN0wR2YO/Md8UFSlAoE4VmKVtHKDO9thiGVSI2/moPjjL+tMiIVEn5lPbjKcqIKgHo0O0hAHi
	6D2ZzfvqmWeHOXuf5gyu6biHuzruZWZGWfb/Qq/dwmrs7Jb/2O3W6PwUwUb4GUFUY6swPS9DuikMp
	AWb34vbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stUGD-00000005wk1-27RC;
	Wed, 25 Sep 2024 15:49:01 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stUAc-00000005v0R-2H1W;
	Wed, 25 Sep 2024 15:43:15 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a7aa086b077so146666b.0;
        Wed, 25 Sep 2024 08:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727278992; x=1727883792; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tq2TptZvyceBLBBx7LtBZE3h+E/rY5vjthtbIWopdq8=;
        b=X+CVcMvPQQ1LSnUVlWCuUv2FlIgu2dp89FCMtoHs7ETegPq0egLcbuUFITMlrBbrfl
         sU/wY/5Cd0U9GLduIwAdfz2CicnDF9FrElvEr8VbhIdxZPZTH+C0ZNG62p85jGwSqit5
         ppt/PO3KEBVyv0g+ZiFGf6Qy6vWRGE+Z0SVwrzZxb1W/bZNvp/Bm9E+OjnXACCCdEPhH
         XfaWrgbpAshLI0LSuks5BJis83Aq4VJMdJokuuEPe5VlFjQeB9GSl1YOB+wFxA57DQgv
         wUe2G1zYy9MT1bfy5liWTa+2XESqjRRHtBataryEdofvZsr4VL3AhhnLKOpSa0RRObz8
         G4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727278992; x=1727883792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tq2TptZvyceBLBBx7LtBZE3h+E/rY5vjthtbIWopdq8=;
        b=VNby4ZEq8enwwmIxT9lbrTMcP4KFtzGapXh8/G1Uk+G1TXpDLuDDzNjZwLETlGpuIg
         Bsg3ooBHgilj2kPw0sNW++s95JPsjV4U49JHTWTESuF+6e8QkqZIpYxif4DkPELvVj5v
         GY83mg9PwypxBF18h815HXM8iE6OQjYV7W5KgmAqY/B7MGsw7fyNjMSNZT9A9qlm65Ip
         yTvMFS2DRulCxVAQdKEAL9kz5eabAf1csTEomAx3pQeJRV9298s5Tfba9adryDYgzktH
         YgxPK7Q3XZM7VHkbHIeZJ5U1+Nre5MGmk9E4Lp+IA5CHtPKbZ8ICL72q9D5hds7TA86O
         eqeg==
X-Forwarded-Encrypted: i=1; AJvYcCWRkCU0T9doJucnU1nO7idfU2T8KOSfju0YrJaob3v819oYszMXw3xSI4KwfCsCl6UjGuFH1FzYfSvBXNDVSIyI0g==@lists.infradead.org, AJvYcCWzF0L6pSNtv7uIynRtXsZybmTVkKVDv4xnCLIMOKJKrHQ1ENbnBMiFyLxcCaVSt/YrhpDnmCNZs/RG+bqwqR4=@lists.infradead.org, AJvYcCX0jR7nKR/eb7Wo0ADJiocTD25GgKI+7lUSvgL+cB3fVEFnh2gSV98S3r6SYZ9Qe15AEtds8UQlnhZzaSWY@lists.infradead.org
X-Gm-Message-State: AOJu0YyVcFaSRqnf/ioR8SVirEPjRQrz7tiTQwnr9d8iBt2Wq0OI/9Cm
	A9KClEDvgChfXS69PUNGv1HjkHJaeSLuW2YMIMb6W2wJJu2LuPAv
X-Google-Smtp-Source: AGHT+IHHc8HHdLYal7Pmze3ybNwhfKc28k6q1+c6BRN4mTyPbMmAiS5NmCbp8C1cZy+2fjcsw/yvLA==
X-Received: by 2002:a17:907:70b:b0:a8d:75ab:17aa with SMTP id a640c23a62f3a-a93a03c61cbmr314978966b.37.1727278992373;
        Wed, 25 Sep 2024 08:43:12 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f3420esm221803466b.40.2024.09.25.08.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 08:43:11 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 25 Sep 2024 17:42:44 +0200
Subject: [PATCH 5/6] drm/panel: ili9322: Constify struct regmap_bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240925-drm-const-regmap-v1-5-e609d502401b@gmail.com>
References: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
In-Reply-To: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727278971; l=929;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=w4RqhIFVBN4KBuZwGM8vHSEfTfAmOJ8kTf3Rh0OtbcY=;
 b=pFLApbC3MB4uKW0ZEVlNXM9AhpNeBXEs3My6pYnOwU646q8xtnwHyVxasmviBPw02fUL94CWi
 xgK5yWm/k67BakTjtq6lgKkPmmAhABqOvLOLqnuQGNEghVM3/8W6sHR
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_084314_639880_C7F1C649 
X-CRM114-Status: GOOD (  12.29  )
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

`ili9322_regmap_bus` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
index 4a6dcfd781e8..94b7dfef3b5e 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
@@ -318,7 +318,7 @@ static int ili9322_regmap_spi_read(void *context, const void *reg,
 	return spi_write_then_read(spi, buf, 1, val, 1);
 }
 
-static struct regmap_bus ili9322_regmap_bus = {
+static const struct regmap_bus ili9322_regmap_bus = {
 	.write = ili9322_regmap_spi_write,
 	.read = ili9322_regmap_spi_read,
 	.reg_format_endian_default = REGMAP_ENDIAN_BIG,

-- 
2.43.0


