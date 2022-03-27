Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6E5C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 22:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bjj0s4kX0iNAsPTVmsg6mcnBmdFhzNi68iV7kXRjtQ=; b=Yv33RJopD1ywUb
	ykIR86F95uhc7YNhNZWqoMt6X6tQJ5Mn3aqC+i7TJKcAiuVf8fmuerMpX4lJEqnycy79Vfo2MPwPf
	N08pfv0nBagVhZBJyStWCSlBYLdO6fkjRZ6W6YUCl5gEcl0p+UouzsHQbjtMkwZtTJdZkAjKQ0Sd5
	IuXfRN3DTO+gASFrxCl5ZjM4M1nVCMwM+36jfqs3ElPfwV5e7tXvPdN9pI9Blcx1orzC6CkNWQkYg
	ImGi7GtPeY2eM10lWqlW35rsO+kQRckuTe1L1CrWnfMOqL93tpExQndsXBSl5twgs7ZeNhp3cxdIQ
	KDcS4D2mvlNylRVonphQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYbcd-006X7h-CW; Sun, 27 Mar 2022 22:44:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYbZU-006V3p-JY
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 22:41:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 i204-20020a1c3bd5000000b0038ce25c870dso179088wma.1
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 15:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XC6XswkJj9AaYIVp5h6fpj+i9TeNQ29eMbDaNcuaTD0=;
 b=gpx7DXyvMS5a9EuMo3979p8BL242XxGFd/Jbxb6UZWJUuu5/yrdhc7cqFHJX3VBrWV
 9Wv57i55/WqeSGz2+jUfLF4U6p/d6e7kwMvN7fq+Q0VLIVvG177IWM72VXIRpQ3rUxGz
 8Ju16is/FCkoarMtGzdxW97JEBBo0wbX6zaorqAPEc8yiqXrplj5LPoTDKtFoH/4/hrE
 6iQLayY59U8tOymX+NGMMajUq5Ir/+Moky7f9MmFYcbGUhKKNWSv2SUx9LoxogYtIrV/
 ajHoYH+RpLI+wXiEDo9fFmw7QCU6huRhWc8bVdas/6rdBzTtmLBg2l8OPUduyBTJCQyc
 jg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XC6XswkJj9AaYIVp5h6fpj+i9TeNQ29eMbDaNcuaTD0=;
 b=vn74gDarSfDruwmV+4ntKsDi6ugsVJgUM9YiZXaPVTAZcda/6z040IDs8Mse9NEnMj
 Cb6zzYotiC9lvEG79hC5SR5T03ZUu6ZHVfkTg2cU6wPk0TtOOlx0DYdLanpY4pPJ4rCQ
 bnK4qyaEQo1uPPDkzciLdp2ECqRhaBRr/KdSv48AxaQ6Fp9kzW2fEkqKrf7CDiqIL65j
 Hp+mUlc1U71oXhWrPseJy7TH+UcfkXBB6ubbK6lZMLcYjNO1oxV4cddmZZcqxkhNhKcV
 AQxoA6r+srIijEr2iCWVBMpZEfXE92W9itaAv64opDIwktq94+zNkh3llwNOYl+pjOcH
 KWAw==
X-Gm-Message-State: AOAM530uLqnIyv+hBUpPAeZV0ytz2aP1uZD1jIEWO079qKiFcIKoXwcr
 PJJCrv0g81Qf/dDmmPmAP7wGsw==
X-Google-Smtp-Source: ABdhPJwEe1v2JbBYTHnfiXw0K97yw2rhxs5cAcCUspAoi18e3S0BP2YTH5oTq716yBth0/2APkGuGw==
X-Received: by 2002:a05:600c:500a:b0:38c:991b:a4b with SMTP id
 n10-20020a05600c500a00b0038c991b0a4bmr31403591wmr.50.1648420874862; 
 Sun, 27 Mar 2022 15:41:14 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:14 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, markyacoub@google.com
Subject: [PATCH v9 10/22] drm/mediatek: dpi: move dimension mask to SoC config
Date: Mon, 28 Mar 2022 00:39:15 +0200
Message-Id: <20220327223927.20848-11-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_154116_729344_9C68E359 
X-CRM114-Status: GOOD (  10.29  )
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

Add flexibility by moving the dimension mask to the SoC config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 454f8563efae..bf098f36a466 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -127,6 +127,8 @@ struct mtk_dpi_conf {
 	u32 num_output_fmts;
 	bool is_ck_de_pol;
 	bool swap_input_support;
+	/* Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (no shift) */
+	u32 dimension_mask;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -156,30 +158,30 @@ static void mtk_dpi_disable(struct mtk_dpi *dpi)
 static void mtk_dpi_config_hsync(struct mtk_dpi *dpi,
 				 struct mtk_dpi_sync_param *sync)
 {
-	mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH,
-		     sync->sync_width << HPW, HPW_MASK);
-	mtk_dpi_mask(dpi, DPI_TGEN_HPORCH,
-		     sync->back_porch << HBP, HBP_MASK);
+	mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH, sync->sync_width << HPW,
+		     dpi->conf->dimension_mask << HPW);
+	mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->back_porch << HBP,
+		     dpi->conf->dimension_mask << HBP);
 	mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->front_porch << HFP,
-		     HFP_MASK);
+		     dpi->conf->dimension_mask << HFP);
 }
 
 static void mtk_dpi_config_vsync(struct mtk_dpi *dpi,
 				 struct mtk_dpi_sync_param *sync,
 				 u32 width_addr, u32 porch_addr)
 {
-	mtk_dpi_mask(dpi, width_addr,
-		     sync->sync_width << VSYNC_WIDTH_SHIFT,
-		     VSYNC_WIDTH_MASK);
 	mtk_dpi_mask(dpi, width_addr,
 		     sync->shift_half_line << VSYNC_HALF_LINE_SHIFT,
 		     VSYNC_HALF_LINE_MASK);
+	mtk_dpi_mask(dpi, width_addr,
+		     sync->sync_width << VSYNC_WIDTH_SHIFT,
+		     dpi->conf->dimension_mask << VSYNC_WIDTH_SHIFT);
 	mtk_dpi_mask(dpi, porch_addr,
 		     sync->back_porch << VSYNC_BACK_PORCH_SHIFT,
-		     VSYNC_BACK_PORCH_MASK);
+		     dpi->conf->dimension_mask << VSYNC_BACK_PORCH_SHIFT);
 	mtk_dpi_mask(dpi, porch_addr,
 		     sync->front_porch << VSYNC_FRONT_PORCH_SHIFT,
-		     VSYNC_FRONT_PORCH_MASK);
+		     dpi->conf->dimension_mask << VSYNC_FRONT_PORCH_SHIFT);
 }
 
 static void mtk_dpi_config_vsync_lodd(struct mtk_dpi *dpi,
@@ -813,6 +815,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
+	.dimension_mask = HPW_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -825,6 +828,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
+	.dimension_mask = HPW_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -836,6 +840,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
+	.dimension_mask = HPW_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -847,6 +852,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
+	.dimension_mask = HPW_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
