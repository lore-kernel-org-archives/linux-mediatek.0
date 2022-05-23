Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B044C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVgTM4UzzCsIA4axA2/ijvQzldh8v9JPbocjtA1ZJgc=; b=F9N4z5Wu30D3Ba
	KSK6DUoNAIuaCJxbaJH8yWBY4ia6atOfy9To7BawwV2aT25zwOcHLBnAKdMqMqlgvgrCYXGbvyTwF
	DFmTqs1l+GCt4J+1LP+sfTqjN95+XZ1qBDci1JgJkiV0u6L3O4srDt7+tmDvJYMV9tO2Tntf9un7n
	sZze5bEPE9VjCBA6KQ6CDE92z78byRY8ale2tsKWQX0VlNLC1rp/m1Yc/RFd9IkSg5F8H5JZx/4bz
	8SwXKYyrq5NSW9fDgPknXLvt3K27Bb5/rGv8lLsupcyKHDtGzOIxX883NcXDKcP5aLg//aOGpTSUP
	ZnMtgzsiaOb6L3jbGHtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt6LJ-003kdZ-91; Mon, 23 May 2022 11:35:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5eS-003Pxn-DG
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 10:51:06 +0000
Received: by mail-wr1-x432.google.com with SMTP id k30so20742271wrd.5
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtIhUcdCaZnm7jziZDR5Z3AGZFSQmzw1Ey7uWgPET0o=;
 b=wah1jbM7UwwnnOKN9R9SdQNDY2U+2LnBjvHDreFlkmgM6crp7LUE26axhsKHnETs9x
 fR1xJvrqPq4sbqRbxc1TWAN6DPtHiy6slEa8Gvp4dEmJjrC4hKyo7MFmbXD73ikJVWEf
 ZBzqgF1U/EHOPF0GOGPVzUmCKzg3rgNZgVVLV7Hu3dpnKUFmmlX+DIrLoSkUCLm/8GKA
 pSAPX1B6YfDSSalkTcXADWGOYATuLN1r8GlTGFgqjUn51EtxUcvU6gYeyr62c2AR8w15
 XT+EC5FzCBl/Lx1yYauc0D2j8Zy6baO/AXzprpopx8OTp6idfNVzdhb30T/y0T0uEKVg
 mSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtIhUcdCaZnm7jziZDR5Z3AGZFSQmzw1Ey7uWgPET0o=;
 b=HntpaxFSaBKJHWW8Rjh9chTZrQqA72vKe/LlIV9dOLx1uDzCC/wLzhpApqSVS3dVCd
 v9HYdnapojqjqzrYaa4F5NLLWK+38zHor4pChDAv2yftbsA/npV7x92yf0D88FNoTLwQ
 mN7UAaofCILzQVSthoiCEy5FRASJ3fKIqzRMvDSWS3Og4pUoqdd1GdfBLRhOLwxv+Esn
 4T5Ccezr0NMfqzwNpv8PMAdRsKIqP0PDDpJHgE88wpFNi6+2DXloDmdi439jXfwIBUel
 qeAxw2sCk4Zwp09XWDOsBZEdojDVFBmWvlLre+z7EApuj7rp/ecT6PW6+EAyCGCjaSNP
 Os+g==
X-Gm-Message-State: AOAM533IqjBh0NgecHUSbJ+LZ6DaUvpQKjvgZl62ACQdDn/ziHJuSl9M
 oTtbSB1Y8XTPYdvME9vGwVQAYw==
X-Google-Smtp-Source: ABdhPJwlpN+bAQcOMXPxLl3HE4/+S7AO5UZT/ZO654uU7ZtC36wAyqvn+dcGu2/sz9tF0vCBLin/Vw==
X-Received: by 2002:adf:f584:0:b0:20d:431:27f8 with SMTP id
 f4-20020adff584000000b0020d043127f8mr18646173wro.577.1653303063102; 
 Mon, 23 May 2022 03:51:03 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:51:02 -0700 (PDT)
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
Subject: [PATCH v10 09/21] drm/mediatek: dpi: move dimension mask to SoC config
Date: Mon, 23 May 2022 12:47:42 +0200
Message-Id: <20220523104758.29531-10-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_035104_509412_E0C9ACA1 
X-CRM114-Status: GOOD (  11.81  )
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
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
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
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
