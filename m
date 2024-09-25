Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDECCCF9E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 15:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=by/nTcqi0aVjyTogWtw3F/RwUIoI+ZIDj6x5N4uN+wg=; b=iJRl7wzWimuBX7yWvY2YaohE4F
	74m1/AVoi/2b4Dy+jdT51qopPDQHczcvahknSH5tgMvb3tivj6JaNjCfLOCqk+pqs/mdxCTaAnl2i
	Qymuf/uIS4WMdXsKFFFEVh5gYXzlxR6wMIIdFALWUkfVY71DymsO6XyWbHWHhCMlBzN/4heTTvXml
	u9Up9Y6mUIVuJjB29ftNFEknP8qJ5mGwGlbFcuBCnFWW3dhhlE2ue5zXXsHgTFL935hTfQ3tisnpq
	221e5yuebuJCxALJ4QVv5s/8NudenBpbfK72HrT9sW9aLBG/S4ZfBF5Evvo59OJxHBM9Jzcq9px4A
	C6Rn2BLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stUDw-00000005w9i-3pCW;
	Wed, 25 Sep 2024 15:46:40 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stUAW-00000005uvK-1uZq;
	Wed, 25 Sep 2024 15:43:10 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-378c16a4d3eso7457204f8f.1;
        Wed, 25 Sep 2024 08:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727278986; x=1727883786; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=by/nTcqi0aVjyTogWtw3F/RwUIoI+ZIDj6x5N4uN+wg=;
        b=J8E4Wd1DLDnJsWy6vWrj6FCgszFE2zLn5hP/U39tMHF94EE+XGKqPbhJOxX5JfqNqZ
         12iCyZqdev78nFeaRkNngNAECCwP56GO1ZO6reQQ5Afr4c1s3AYTmpCv28bZ0BWJ8g18
         yDTJ2FCWjYN3pR6ln1bgayGBy3TkBNgq3I40Eb3rGK0Qup9qYZY5gO6j0xyGQFtQfG1c
         pEWEH7A4+AxOkREDrf4k1prbpKV9gDLqDBMcWBPhVPr+n1OukSL1YGXXRoBzxQK39vYf
         yOYcOmYXG9qAc1mfjvCNJjF6iWWcqBhKx9dwxfhLuuH9ZfTn969l/I/ShXFEFZIcS2s3
         +lAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727278986; x=1727883786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=by/nTcqi0aVjyTogWtw3F/RwUIoI+ZIDj6x5N4uN+wg=;
        b=al4I0F/Br8lhVcwKe3ScTiRScJ8YQyZd7ZbGyl4/gNrC7USax3N6EyL1h9Tx4hxJ1z
         iqUGw1CjZ7Yljb1kblffQHU0hwbx85pwdeSMrkwj0DaEYxNXzbSmHVu5tEjuNs8PeGqt
         XF67WkBnGjXYvwChzCHdryC3UIg2J37A08K7k7mlR+7Y1NiSx+voM5/M8fIhsCTEHGWM
         6BLOH0bPlfzHAC4NnsMordGVMCHI9/f+Uon62eF9LeG5G3GiKx1KY6yKDmH87H9q9TAo
         ozq3GRRyyyih8nv/eR2KOjm8tpMEmAc2s/y/iwXe9QTZO9nPwh7K1TZMfs4WgKBP7MG7
         8t2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPH+WSXvn76YS7E0J7rIdGLOp265J4f9vG4QIkv6+DlQFKbxbYEuwUu7/HmaHQJZ7bVeqp2fzvpyD//eUs@lists.infradead.org, AJvYcCUqcF/kCijWqXBHK6v4zc6tQtFo9PXlGWgkEdqJwB0Db6dloEV7jUTpImyxPWen9TgpOHnmkjDCpuAyrR3k6i7GQQ==@lists.infradead.org, AJvYcCVTS1O3/ftVxd4Bvt6IkZSVl8bx8odXZZli07oNU8p355t3cL9w0spB2AuVEZ5pJVx8X41TTVnwX34f3C9dPeQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQP7Ez6QdodVw3N5WPC+4Acln6mHnofT73eBcvVEQLfb3iWHjQ
	RPD54Y4ApVQNZxBEYTfmJVgw4PN0L0+CjiIulyHrc1F/A5zIZ+Lw
X-Google-Smtp-Source: AGHT+IHJhvH9gplBfs4rlapKgfN74X4J8uVmh8ECXCHmFytouFZD6MReKNv2uyQvggR0QFC+8+ktEQ==
X-Received: by 2002:adf:fbcc:0:b0:374:c44e:ef27 with SMTP id ffacd0b85a97d-37cc245dd30mr2854153f8f.8.1727278986389;
        Wed, 25 Sep 2024 08:43:06 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f3420esm221803466b.40.2024.09.25.08.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 08:43:06 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 25 Sep 2024 17:42:42 +0200
Subject: [PATCH 3/6] drm/mediatek: dp: Constify struct regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240925-drm-const-regmap-v1-3-e609d502401b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727278971; l=784;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Akh6/NmxNUGKnN3cTl+ADfEVv/jFRL48hClqI8/xUq8=;
 b=IjANioE+JCFwAjMkuWw7rvXfaWWxlLsFG0TPSDiWvDMe+XOLw4C6wtw/QweEtNdXjuNtLJZ0b
 bWnz5DBwP4dBi/Bl+1Ajyf6T97mjVaMth7Bkz45oPrpPhWhldTvE638
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_084308_676465_CDE7BF6F 
X-CRM114-Status: GOOD (  12.18  )
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

`mtk_dp_regmap_config` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
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


