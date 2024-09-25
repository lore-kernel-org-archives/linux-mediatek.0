Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A35CCF9E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 15:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tgLjgsBATCSWM6XL4qorkL1lHK3PtUuXoapmBEAcGck=; b=Pj7LUh3LLXun0U
	iHvlXQzAFgI8nxNway7Cggb4y1POBcCjSbRRwAgy3O1MTWUcFCczstqWoopadFY2IaKzWbkW3pEsr
	7w9ej9nFBy1WwUUcJZhhA8TH1U/mEMW60XFTYB50uaPnn4X6pvl9/8ggLtzuQCngYRO5Xmf5zp/qp
	j3+eIzjA+ckCC/riucJAGgbcyW8gsGqDupFEMFPTh4LhZIZGbjRX0+B8jgRNwQ6TWT2DgBlDCDXdL
	yOOdzNmGflXllwNnKoVVKMNV3auoBoLhO4nCWrUVYFmtbMmCTmzS0Pf6VeblJ2AWeHp52Vj1EDJ8v
	7UA4lX6sD99zDuQ3pwCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stUAR-00000005usD-0osD;
	Wed, 25 Sep 2024 15:43:03 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stUAN-00000005uqT-29uU;
	Wed, 25 Sep 2024 15:43:01 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a8d3cde1103so660672066b.2;
        Wed, 25 Sep 2024 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727278977; x=1727883777; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tgLjgsBATCSWM6XL4qorkL1lHK3PtUuXoapmBEAcGck=;
        b=aubsKbhXOgGV7GkxgNFN8tGs/20kbQtz4aXlklGs3aAg7u9VchHTq/YV0rDcjJMajG
         OY3VJwkeeicS1ADD6YsrCLxHp9FvnJVmjQ5ptTDfDG334TdQy8tx7h8TZ++xpWKA07ph
         fcUUQzrZjP2RUvO0TaRDwNOk3hDkYEhEdjfr5WrOe7fcjVpWhzkuKDvLsp7+7fbdAnH6
         sSS62kMdg4/odbSXyNay6cgINWZhwtrNXkPGtWm0Uj1jfkdbx72WqVt3LBob9V62rBg8
         YDIcLZ2X3IEJPNWMWNwBgRxFasJEy4VAssUpxQCJJZV4CE7V2Uw5/XP3t5LVLrhk7qQR
         G/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727278977; x=1727883777;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgLjgsBATCSWM6XL4qorkL1lHK3PtUuXoapmBEAcGck=;
        b=w+qDlUXkrQenQyNPcW5F90A10xQhbh6Yl6tHG0ZzGjmbddsYU21yL2ny2v2eGiEtFY
         YgiMpA3jp0IEGTmHq8xbXMLE0+arSE3n8E969dorS8h13cqgXkR1tDFO4LqG/F9XI4OL
         tIZGCDZTZRD12TThHdy4sD232AO/ZBLKZqfMqAMyPKrLaT0lLwZ+ICeZV8wsGfr/FHMJ
         GoftKnNEKG0vZ9mJkj9NmzYmtqopkeElywc6368LuzoEoHFb+ixf6jxLPM3H4/qYXl0b
         4idFHc1D/3TLjipvHvVrCGCsU5buFHsxy5S+/iSNx71d3s94pYVoZJDZAIPnBwxYet+U
         w3UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtREnf28zKOaBn1UqJW4Ce6DG3ENJ+CkdYkdC9Cb02qM/dMF5sIvSsizuoabf5Uqg9cUNXlLyCasoAQ0vt@lists.infradead.org, AJvYcCW3bZlDcytwgGgQxmbu7doSwwCyx+WS3kpeRWRQKArEvItP+cZXT3/7/b9hp60MyHtRKZktjOMM4n8Jmq4Sd/E=@lists.infradead.org, AJvYcCX2/NFMUcK6ipyT+qZ+KRHNrO8cSQY32lIy4G76lg5xL616Tw42/pwt43RkJFLAii4igUBFFcA0vm+Oq7iWuKIGJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOLwl5Ujz8QZCt2+38Gxe4JFwnlYBAQI0lf49B8Az01WwWMqs/
	UcXtkhBIMv6x/STXenH4nWnbHSxKDWMF82s07ZBSqUFLcZBpStAkvfHGiraO
X-Google-Smtp-Source: AGHT+IFkZ1n37tP3Rc2/BMb8UIyY4klrs21gwIaq2A7G/dBjrAoB3ccE5EDVcggDj2gmdvtj2kWRUg==
X-Received: by 2002:a17:907:7da7:b0:a8c:d6a3:d038 with SMTP id a640c23a62f3a-a93a03e3095mr316176266b.37.1727278976983;
        Wed, 25 Sep 2024 08:42:56 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f3420esm221803466b.40.2024.09.25.08.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 08:42:56 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/6] drm: constify read-only regmap structs
Date: Wed, 25 Sep 2024 17:42:39 +0200
Message-Id: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG8v9GYC/x3MTQqAIBBA4avIrBswK/q5SrQInWoWmowRgXT3p
 OW3eC9DImFKMKkMQjcnPkNBXSmwxxp2QnbFYLRp9Wg6dOLRniFdKLT7NWKj+83YphtcraFkUWj
 j51/Oy/t+aWaESWIAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727278971; l=1173;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=mV011lLjGh5QUEeOXJ02JFFzg3GXgCu8+SSQahiHbas=;
 b=myNkjRQ3PFvNNvW6MYUDscCs4qRnSff9r34U0SADdEuPuz6/EHK14GRk3jXV4EQhRuDrFFBYk
 q/5VY5I1EZoCwxtXU4F47W872f6MFmFLNx3SrzjZfC9qmsxNSZ5SlmM
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_084259_588851_D7D949A4 
X-CRM114-Status: UNSURE (   8.31  )
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

This series adds the const modifier to the remaining regmap_bus and
regmap_config structs under drm/ that are effectively used as const
(i.e., only read after their declaration), but kept ad writtable data.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (6):
      drm/bridge: dpc3433: Constify struct regmap_config
      drm/fsl-dcu: Constify struct regmap_config
      drm/mediatek: dp: Constify struct regmap_config
      drm/meson: Constify struct regmap_config
      drm/panel: ili9322: Constify struct regmap_bus
      drm/sprd: Constify struct regmap_bus

 drivers/gpu/drm/bridge/ti-dlpc3433.c         | 2 +-
 drivers/gpu/drm/fsl-dcu/fsl_tcon.c           | 2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c            | 2 +-
 drivers/gpu/drm/meson/meson_drv.c            | 2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 2 +-
 drivers/gpu/drm/sprd/sprd_dsi.c              | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 2b7275670032a98cba266bd1b8905f755b3e650f
change-id: 20240925-drm-const-regmap-307f2c358d10

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


