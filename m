Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0A3C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 15:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2B0FpH16IFuaJeD2HJ6G6JQmUQCRiccX+fz8Jm9Nxn0=; b=DVA/IwI8kXo7DQ
	zOdY2D+fpOVVlPXSpQJbCfWCzaWSEJtsr+NRcDdIU6nfUUdC+rkP6+/xzmydIETNM93bjioDJkX2Z
	iT5xFht1QUNhsa82a8roUMN+gvm26cj44ngogkGMoS6J3tDuExiVAq9n4VBbki87PuldS/VZcwfjJ
	UBzGLJ6I17r4nFUdLvrBOML9qYgETtPgXgXEOB6vIifEqOMyQVmvZ+eBVevssGwp/UpsuGYbw9nN+
	SCnEGUXjpcspF1+h+tYopOdv3cbAVlhC/bSGCzI3nYySY0WDOdlt4Sb/OWxLq2GKjnXPWgfsBb2sO
	dl2503vb7MMGG3MXtIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4oq-00ExJx-1o; Fri, 18 Feb 2022 15:05:12 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4g5-00Es4G-Lg
 for linux-mediatek@lists.infradead.org; Fri, 18 Feb 2022 14:56:14 +0000
Received: by mail-wr1-x443.google.com with SMTP id u1so15005409wrg.11
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Feb 2022 06:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rl9GJMwANTs4ZJlwlTLAUM9iGOwBbNwdWImM77zNitM=;
 b=Hq1ej1mQ2MMxf1bH4FLzvR7tpbxNj+Ol/3YFedobT9BlNZW3XGnLfALtYMiNcrFzvx
 6wfzxXM7ZKIwy8BWbif2XP0qliiTiU2SwVHwOoJ0MqJE6DuHFSclcfH5h4QjN8UtDm8T
 IIaoAVlt8blotwG4zd4GBZQgaMwNFiq47JQGj0VDHJmeFcNcGBTyYfvmV4e0IQKILwBT
 YihSV6M8YUNaWuEcTz5iv2sOHevL3jcuTZNiVFYuLPZHhY6LtP5DRie4iwTinXqSZKgv
 Mnorce5EopmKWsKgTqFd7XpUdJOS75xN0MyOPsv4qcw3iMagdkdhheMdVHy6NhAu549X
 1/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rl9GJMwANTs4ZJlwlTLAUM9iGOwBbNwdWImM77zNitM=;
 b=PpZ4DA3rvtIchS7lDz+WhAp/swGmL6WDXg1mg5Q8bDpbL2UO6FmLEDwUuFndD1Yv11
 fawNl/5VosiUZvnrhml5T8mwlLvjTktoZvzpz2MEgGJMA9te0i54hajR1DvnxuX2Volw
 zN75BvHZh1stvLyKdAZ90fHR3xTsZCnQmBxdk3M9L5AfZzzkgP0Wrq+bBCvLS3ffdXn1
 2ELVziVgi9DnVamNce7h8Qb7g+/1dQ1mr1D6K/yJpf1vLua7lTK1bsCBihAm5f8M0KVr
 y6OcCFe/W0hiJ1LxZuVhZbsxX2UtYgj34yLZbcySWd4Ln+ZNU55O4r4NIVXUDoQkz904
 SLiA==
X-Gm-Message-State: AOAM530QxutJry2JA3mZv5oMmCOulOVODjCshIvBDJRZTVHF01pXDd9m
 3XTU+gU8R21a4a8s5HBkBw7AND7/2oS6T/iM
X-Google-Smtp-Source: ABdhPJzLbEEfYgSHqBNDUq8sOQOCufmyh+U/0S0P0s5vcWkm4sqUVe7KIKtrF43MUbMyX5wJmXLcDQ==
X-Received: by 2002:adf:ec07:0:b0:1e3:1ef2:5ff6 with SMTP id
 x7-20020adfec07000000b001e31ef25ff6mr6336681wrn.255.1645196168227; 
 Fri, 18 Feb 2022 06:56:08 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:07 -0800 (PST)
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
Subject: [PATCH v8 05/19] drm/mediatek: dpi: move dpi limits to board config
Date: Fri, 18 Feb 2022 15:54:23 +0100
Message-Id: <20220218145437.18563-6-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_065609_845909_1ECC7669 
X-CRM114-Status: GOOD (  12.04  )
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

Add flexibility by moving the dpi limits to the board config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 4554e2de14309..4746eb3425674 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -125,6 +125,7 @@ struct mtk_dpi_conf {
 	bool edge_sel_en;
 	const u32 *output_fmts;
 	u32 num_output_fmts;
+	const struct mtk_dpi_yc_limit *limit;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -235,9 +236,10 @@ static void mtk_dpi_config_fb_size(struct mtk_dpi *dpi, u32 width, u32 height)
 	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
 }
 
-static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi,
-					 struct mtk_dpi_yc_limit *limit)
+static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi)
 {
+	const struct mtk_dpi_yc_limit *limit = dpi->conf->limit;
+
 	mtk_dpi_mask(dpi, DPI_Y_LIMIT, limit->y_bottom << Y_LIMINT_BOT,
 		     Y_LIMINT_BOT_MASK);
 	mtk_dpi_mask(dpi, DPI_Y_LIMIT, limit->y_top << Y_LIMINT_TOP,
@@ -449,7 +451,6 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 				    struct drm_display_mode *mode)
 {
-	struct mtk_dpi_yc_limit limit;
 	struct mtk_dpi_polarities dpi_pol;
 	struct mtk_dpi_sync_param hsync;
 	struct mtk_dpi_sync_param vsync_lodd = { 0 };
@@ -484,11 +485,6 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
 		pll_rate, vm.pixelclock);
 
-	limit.c_bottom = 0x0010;
-	limit.c_top = 0x0FE0;
-	limit.y_bottom = 0x0010;
-	limit.y_top = 0x0FE0;
-
 	dpi_pol.ck_pol = MTK_DPI_POLARITY_FALLING;
 	dpi_pol.de_pol = MTK_DPI_POLARITY_RISING;
 	dpi_pol.hsync_pol = vm.flags & DISPLAY_FLAGS_HSYNC_HIGH ?
@@ -536,7 +532,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	else
 		mtk_dpi_config_fb_size(dpi, vm.hactive, vm.vactive);
 
-	mtk_dpi_config_channel_limit(dpi, &limit);
+	mtk_dpi_config_channel_limit(dpi);
 	mtk_dpi_config_bit_num(dpi, dpi->bit_num);
 	mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
 	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
@@ -790,12 +786,20 @@ static const u32 mt8183_output_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_2X12_BE,
 };
 
+static const struct mtk_dpi_yc_limit mtk_dpi_limit = {
+	.c_bottom = 0x0010,
+	.c_top = 0x0FE0,
+	.y_bottom = 0x0010,
+	.y_top = 0x0FE0,
+};
+
 static const struct mtk_dpi_conf mt8173_conf = {
 	.cal_factor = mt8173_calculate_factor,
 	.reg_h_fre_con = 0xe0,
 	.max_clock_khz = 300000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.limit = &mtk_dpi_limit,
 };
 
 static const struct mtk_dpi_conf mt2701_conf = {
@@ -805,6 +809,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.limit = &mtk_dpi_limit,
 };
 
 static const struct mtk_dpi_conf mt8183_conf = {
@@ -813,6 +818,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.max_clock_khz = 100000,
 	.output_fmts = mt8183_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.limit = &mtk_dpi_limit,
 };
 
 static const struct mtk_dpi_conf mt8192_conf = {
@@ -821,6 +827,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.limit = &mtk_dpi_limit,
 };
 
 static int mtk_dpi_probe(struct platform_device *pdev)
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
