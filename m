Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1CAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 15:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLQoL3kHd0rqyVhr+1ldXFHO1WVnG8s9YwecvWAFPLI=; b=z6Yex/fgyICwCg
	v7TI7ngggpbXXyVB6wW+nGlvJtIYfR+V0ZInAF6/brnE9f3IBRiAUvWsrt5Bzk2tBibcjbntOrx3v
	7EhCPeRSNTbFg7ozpn3ZH95r+5Xiy34cVVoPcUTlyWFQ8pDMikr1fb4PxOTgEWt3JmKYltykYxeV6
	vxtIgaq/oTBd3jfsFp2i0LzhaCLnvYGKyofEalM47298IV7sdAShoGQYojC6g33ffi5785uuA5k/9
	TDovkcpCm3J/GmTVPe3Qy0ZrW8+SeEtTFYClNf451Gc+BWJGVAHbwYnY+M3+v5GJwqfn2hCt88jnC
	1FCLBHg1ZuXzQS4D9vFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4r0-00EyDf-UX; Fri, 18 Feb 2022 15:07:27 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4g9-00Es7t-MQ
 for linux-mediatek@lists.infradead.org; Fri, 18 Feb 2022 14:56:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id d27so15049279wrb.5
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Feb 2022 06:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=05D+3SKZ7tKyXIjmuWnmBbAFic5DyC5nxoFhcmxTYHM=;
 b=XRVLtCA6bB2RENQ6zCTV2QK0fMPPuWQMd9PHjYs2TWXZ+/XIHN7/vUE0nW/8Sudo5L
 ixxyQe/plaAI+6zg7JFobruNHFdn+qRcrRo2T7p0v5CdmK+tfhqNcOgS35lwdQah+ds+
 OQlk8nTP78vlPGMuwezHTJ1e4Eyomy7OMzZ6YfSwoSPzmPqobc5TfETm/nZu+Vw8TRDt
 q/NFNvbHzBv4sDjyf6VrG0aEFY3xjvydfdTo1eA496dSKUVmSLEV1LX2+kS0i4Z7of/B
 dEoOd1OZvv2mWWmmtF/J1GgEi3cGWh8Jw7oqBWBb/tLB1/DUOSWTLShdrc5bWKCbsH0K
 PL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=05D+3SKZ7tKyXIjmuWnmBbAFic5DyC5nxoFhcmxTYHM=;
 b=265L2AjQD+qhh+LMLzjrsY1apcFCGJl+4q+/Z89X913OyZHYD38ExpWbBhb+3Y3NzR
 /6JoP+CmODdtwpBe0ZyxcSisyjiPwqDWrZYLpGo9bihdR07jmY+TqtLs+zuhaMv3qZ6w
 BzHWFTatfU8ZO6DHkesphqMJmtlOMxwkSfxCsQ3C8bY6eOHlw2tW0elLyPMQZ8NYvU/9
 jaCBlsPPAJJmT0GlZSHgI3rN9IhjtN9WXTOHk8UzSOunsu1UsOn+JUUf5F0IuAvoQlWg
 qlTb/RYFTBEMYtMvSWzcoG8Y8g/7DdBWlcaSHThEM0MdEmP2NiiB1U5ayKXKA/R1N6SJ
 6Zrg==
X-Gm-Message-State: AOAM533A7rR+7T6M1+eJaGMPvuvOCx2JVapEsUJ+BJRSlOaZWt45cwRa
 A8olhkZ2jkhoEtsmEtFI65E1+g==
X-Google-Smtp-Source: ABdhPJxzIJ4HeICGEQlbgAY6RhWstXxhrG+4xKFtg/DzjbljouSlndT3aFcLqryjNnjrzZMMpbND/w==
X-Received: by 2002:a05:6000:257:b0:1e3:3a1b:d4ca with SMTP id
 m23-20020a056000025700b001e33a1bd4camr6305144wrz.112.1645196172298; 
 Fri, 18 Feb 2022 06:56:12 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:11 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v8 07/19] drm/mediatek: dpi: implement a swap_input toggle in
 board config
Date: Fri, 18 Feb 2022 15:54:25 +0100
Message-Id: <20220218145437.18563-8-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_065613_822327_56703EA9 
X-CRM114-Status: GOOD (  11.87  )
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

Adds a bit of flexibility to support boards without swap_input support

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 545a1337cc899..454f8563efae4 100644
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
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
