Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27748C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fuHZll1Xmg7whYMmwtA6RtcmDLU5KFsDZnf/+wpBdoY=; b=rZvIhdf6KITJ/5
	rtulCptRJU5HWHp9Kv20/P/ou3WOvLdUc98grlo5LA+Neg4k1RvUuRMdz7ewRwaUA0V0jn1gA/IMO
	9m2JW37lNJHHkMZ/3ZHwmZKLz/11jHdDE3afqfGxAERJK7qzvOwHlz2+b1LHkNQM3nLJLrijY0+rP
	1iPf/Et2S2EZsYUbKmfKaoNK4Wsd6uLMMaozOa31ecNRh58hXTbgeu0WTFfyOtB7JlDvVX5P8qNSZ
	feEInXeY3ooT7KTihAn3cC1Q7vd4KLnIvFpulLc0VgYby4/JS5lwIEyZaH6wuz5muJ8+jUmPydtWq
	0jRwKCIc/IOGQgtBXRuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt6JL-003jpv-4Y; Mon, 23 May 2022 11:33:19 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5eK-003Pqa-Vk
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 10:50:58 +0000
Received: by mail-wr1-x42d.google.com with SMTP id e28so20143919wra.10
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9jP9dq0eqNju1JFK7hi0cYxaapGwnNAhPGRZeD+o+7w=;
 b=M1PApx6JO0ucI5ZRRlGl3kXqjmvvORDiFf9UkR8kuE9PiPMj6LBUsOXOQkYghTqWM6
 Y42sddN4qCdj6Cc7brfNShxohE/SwqyqfOLeLv/zN7i4CeqEDu0/IrVGnghkWEatMuph
 1lwMHmTxyavp/pTF6hk5EjgcSgP+Kz3zP5jgkEVbTLboSIVw++xZCi7NTOBqv5+bKIVv
 QL9/y/wZd9lzwop/5tkjaPlvmmFqgs/8W0qu77UmDJvIS55j3zJx+pgxdFe8GwqCcJQo
 60IvuR05z6saM5V8DM4eI/hgCPbuj+ZMwVIj1R/1f7dFfIaLu+BjfsfnN+yXwBDedu2x
 lvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9jP9dq0eqNju1JFK7hi0cYxaapGwnNAhPGRZeD+o+7w=;
 b=tLWDgCjIYifVr/tTnc5ZHM5gf3JAb/VN5O7h3HvVohkAA9ft3CvLfch5/+AhqyFIm1
 E79m90Q8lzO6SJ9W0vp2Z0MUds3cb6/NPFw7ZCT+QsORWbXhP4ko5qNbYxQQz/WAUiOI
 rn9rQYfpVYwvjunwRGVADubFl1KrIjBP8YW3ZaKr//bc9qOaShbH4W3g9/5s0mNo1ND2
 DTq61eVXwk17ft5y3g+n3HHzNhmaQh9aqupmdiqtr77Wz20w/XHvJdaFAy6N+1cJ++xs
 IOU/lUSqDX+1/T0OHJH1C/kWYmZzYlMZt69aDqps3Q/tQ9ewjyhE8Sx3FDbhntm70URt
 5YGg==
X-Gm-Message-State: AOAM533JyGMiWVwCsCplJqX5vGAMg0V+8Nto5Saikc3kNqDDvsMvnZ9H
 6I2crGlfQqZPL4GXNy4y85ILaQ==
X-Google-Smtp-Source: ABdhPJzFVsn52LLkc6F5P2MSaLKmhQPgvOfhCMFcPHG2HJ9CtCk4fi83gaSnITOg3ufjkMvUe7umaQ==
X-Received: by 2002:a5d:6042:0:b0:20e:65c0:f69b with SMTP id
 j2-20020a5d6042000000b0020e65c0f69bmr18712524wrt.524.1653303056451; 
 Mon, 23 May 2022 03:50:56 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:50:56 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v10 08/21] drm/mediatek: dpi: implement a swap_input toggle in
 SoC config
Date: Mon, 23 May 2022 12:47:41 +0200
Message-Id: <20220523104758.29531-9-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_035057_100123_2A79BBD3 
X-CRM114-Status: GOOD (  13.07  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Adds a bit of flexibility to support SoCs without swap_input support

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 545a1337cc89..454f8563efae 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -126,6 +126,7 @@ struct mtk_dpi_conf {
 	const u32 *output_fmts;
 	u32 num_output_fmts;
 	bool is_ck_de_pol;
+	bool swap_input_support;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -378,18 +379,21 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, false);
 		mtk_dpi_config_csc_enable(dpi, true);
-		mtk_dpi_config_swap_input(dpi, false);
+		if (dpi->conf->swap_input_support)
+			mtk_dpi_config_swap_input(dpi, false);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_BGR);
 	} else if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
 		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, true);
 		mtk_dpi_config_csc_enable(dpi, true);
-		mtk_dpi_config_swap_input(dpi, true);
+		if (dpi->conf->swap_input_support)
+			mtk_dpi_config_swap_input(dpi, true);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
 	} else {
 		mtk_dpi_config_yuv422_enable(dpi, false);
 		mtk_dpi_config_csc_enable(dpi, false);
-		mtk_dpi_config_swap_input(dpi, false);
+		if (dpi->conf->swap_input_support)
+			mtk_dpi_config_swap_input(dpi, false);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
 	}
 }
@@ -808,6 +812,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
 	.is_ck_de_pol = true,
+	.swap_input_support = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -819,6 +824,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
 	.is_ck_de_pol = true,
+	.swap_input_support = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -829,6 +835,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.output_fmts = mt8183_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
 	.is_ck_de_pol = true,
+	.swap_input_support = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -839,6 +846,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
 	.is_ck_de_pol = true,
+	.swap_input_support = true,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
