Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50730C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRT9cXIxjbPiw784+Qt8Y12TXVD8Sd/Tla/VYCA9yzM=; b=AxyWjYyCLGuAJm
	I2lxZlBz71Sm4hbGaf9ajpAbvkE6Z6hvrDQPLM251RbV/f6Gu91HC6YwvQUqoVjYFf3sYQTVIViNO
	cLoMNFnF3HSv3fikcNMnshXrK/dGwR3d99n5OYUNvOD2B5HpoJP29rhQtt8HfC5CSRsvTmxt7KxpG
	OQx8Slri/VUyETn8c8JXgbjjNvSGITgEYxSXdU8wdE67RnS91j9TpQ8P/jd9qM8F/ymKS1LS3fBfk
	tNpNf6EVZ0l56CgKCQpgKZji79j0ycdPFKf2wXTxlgHkxBJ0BK4Q6xjsTOOxvE/7yJEPz/Ames294
	lYnNE/nYnJ+BrmkYeyeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4ug-00EzuL-HO; Fri, 18 Feb 2022 15:11:14 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4gI-00EsG8-HW
 for linux-mediatek@lists.infradead.org; Fri, 18 Feb 2022 14:56:31 +0000
Received: by mail-wr1-x436.google.com with SMTP id u2so13888313wrw.1
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Feb 2022 06:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=90lBj+uvWW6J+7Bhe1asD0wMcJbCNndSndMWto6+sjw=;
 b=XCTWGHlVeYj1NHNSyLYY4w0WnpflUMMYUJs+ess0tZVzbocvNTlCQ32s2o4ObZQDRW
 P9lK9H/8fBoZHEjWDufRSJ1SsI+Jwr9zO1Ab63LWNxkvl2jhoq/DGKchky7BseFFRARF
 LyYojephNA2plGL6u1WNgFcztI4Zy3fhwQzbyrj1kKcqm5LfLRYIpmoO6a5Yb0d4nAc/
 515MHQEC6IF2aADAxmOC2/g7/goAvZA6GwkBv4WG0pGTgINFjhXO/tyS5P2tYDuXDmmQ
 XlN4Ni6JYJ2UNwlPzA4tAAx8OiewWSjTLOtHopCdrZNvJSLBzd5T0R0FRqnjnljonZM7
 wPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=90lBj+uvWW6J+7Bhe1asD0wMcJbCNndSndMWto6+sjw=;
 b=Bdj0bhNSF1t/d3Ekao361/h6MxxozNxRpVLwSZutWwGgVnC3VOGzOriDsOcvK6QExa
 50t7157BWAGakAqoMS7qN75AHGpFSzIcN+E2m1GkyQsHDEQwFu4T7fxeyxl6Bl28xPxi
 oY/c0K/ZDkIHKXENV57tQGbZalUJlQv5IWKL/w5JCR9VDeKuYemsnvTyztlUsfR4BpVi
 HqMytHkLGtdiZR+i+yNOQkqKx4l6ZzBkWkUZEBh7APVwH/oMoGRqvvb6v70Jzrjehh2q
 eddux0+pqshFz/hbUYZNqCwZjId6IAXVN7gneO0oxGpNYWOfnCBUqANrB8w89KTlsAqm
 tX+A==
X-Gm-Message-State: AOAM532c440BVJIAVt8ifkKt3IvoGsgMCOPCReClVZZtiDGwuW2p/Y78
 O4tPF3vPOsp72SyKEjmO9zNQ/A==
X-Google-Smtp-Source: ABdhPJxdT+Md4Etk8DpDZL2AZLj2CChbsYlZ101cupA/36VJ0hpWjcFNACS2lJ1DlsOujik8l4G8dg==
X-Received: by 2002:a5d:6a8a:0:b0:1e3:310c:8b1e with SMTP id
 s10-20020a5d6a8a000000b001e3310c8b1emr6285623wru.717.1645196181080; 
 Fri, 18 Feb 2022 06:56:21 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:20 -0800 (PST)
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
Subject: [PATCH v8 11/19] drm/mediatek: dpi: move the yuv422_en_bit to board
 config
Date: Fri, 18 Feb 2022 15:54:29 +0100
Message-Id: <20220218145437.18563-12-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_065622_708390_56583832 
X-CRM114-Status: GOOD (  10.92  )
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

Add flexibility by moving the yuv422 en bit to board config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index ec221e24e0fee..fcf88dcd8b89d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -132,6 +132,7 @@ struct mtk_dpi_conf {
 	// Mask used for HSIZE and VSIZE (no shift)
 	u32 hvsize_mask;
 	u32 channel_swap_shift;
+	u32 yuv422_en_bit;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -356,7 +357,8 @@ static void mtk_dpi_config_channel_swap(struct mtk_dpi *dpi,
 
 static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
 {
-	mtk_dpi_mask(dpi, DPI_CON, enable ? YUV422_EN : 0, YUV422_EN);
+	mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->yuv422_en_bit : 0,
+		     dpi->conf->yuv422_en_bit);
 }
 
 static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool enable)
@@ -824,6 +826,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -839,6 +842,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -853,6 +857,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -867,6 +872,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
