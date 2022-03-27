Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FFCC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 22:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blo62RJYqJ5wit4aDYvi6nYIJeRmqcmfRG+Afvt37pU=; b=hMA1gutKOg1UP7
	ncSABnG6QxlY3FUexfiE7Sku79lJcui6d989LmvdEF9//sZfvADtkjABWzMk6FK9NTaGk4U5rTOWh
	8/SiSMTmgmXYKDLf4A93m9gqmyuiOMCg1+N/hJwlNPf0wUEwdQWBUyrwlERxwjnYyZqpmwfkSgD7m
	EgXGeNrc1gl/xAVB/rKRy9g/bWz8D3klSTeo4mUyvYuCRj8p0UChlCPODIBNDfmCcBt94gDZU1dnq
	cSu6BNHR23KaX0cRJ7SCO+HdiLcLV8FVMHPzahViXq4iYnXzvDvV/DHotUQF/rMiDuK5KJPj7dy6E
	07BnSkPor/1oxUXJcFAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYbdC-006XQo-Na; Sun, 27 Mar 2022 22:45:06 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYbZW-006V5p-6D
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 22:41:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id m30so17929060wrb.1
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 15:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N+2J73LOuWbWcemSAZjUl4sSAKtMqGO4YAvYLQzrZlU=;
 b=E4oNP+5wDcmJ5i000GikoKEi90gXov2bLa23K1SIi7neciorzuHsTWtVtSG/MyuPzJ
 cgNv9AVDJYJuVrhtNppLiz7v3iitzqo85CiC47K8+d07We4AN6Z0scS6razrIRbyopGh
 j51tFAQTyn2q+Ad6qqdOSzynKQJk4ln13KkEHc5g+e2Zs4CgDY5deqZUktsyF3a7+0AJ
 40YFFjFO6Hc1RY/a1pmyTkwVarTDj7cZDFs08M64wGny53x22XnqJn8GGSxdBq5kPxW3
 9esmiCuqWL2y+tdsdxtiiA4+/eNhMusp4JWIhN6THPfie332czdCkTkJDRlAPn/LmyRx
 xxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N+2J73LOuWbWcemSAZjUl4sSAKtMqGO4YAvYLQzrZlU=;
 b=RNNlEiL5+roQ8F1G8PEW7fq/UCvQh5wJw/EkhsmOcYkFkluGS+bPSAxcjJRbL9X0l6
 0IJoHlRa36E3ddyuOrUZqOc9Brett4wBtNIl/uGdq8wjETdC+6aTDMu7H6gky2GYWm4C
 /+KTf7FKhfLYcBuy3Hd0qU6ek03rOIBDnc0LQwMCVKH4KlxD08N37wLoAiXHKhC1kXT9
 0FdpFYiGmFqQ6vl3+lEuKOQLHmmaotHYa/WWGfDoovWS75Gly6RCBeQqY88Yv/JLFa1k
 aS2KS1tza47NhzqywS+8Ia/icvnNAMrcXS0MSd1YXko0fZpS0PN8OqU1G/AK7J+pykBy
 XwAg==
X-Gm-Message-State: AOAM531dIpiULPd3hdAcbNediS1REmY6aFBb5V18xhSTMoE3s01CfVWh
 CdKkIr8gKIPDIDgeH3nBruaUXg==
X-Google-Smtp-Source: ABdhPJzWjrD9juKEr+3UC3+YD5gLcmwlD/B2f09xt07bgXHd7vxnYEncWlqLIe8A/rEUk8Q4uBOJtA==
X-Received: by 2002:adf:fad0:0:b0:205:ad54:e51e with SMTP id
 a16-20020adffad0000000b00205ad54e51emr10530199wrs.650.1648420876648; 
 Sun, 27 Mar 2022 15:41:16 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:16 -0700 (PDT)
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
Subject: [PATCH v9 11/22] drm/mediatek: dpi: move hvsize_mask to SoC config
Date: Mon, 28 Mar 2022 00:39:16 +0200
Message-Id: <20220327223927.20848-12-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_154118_253191_41BAF0C9 
X-CRM114-Status: GOOD (  10.63  )
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

Add flexibility by moving the hvsize mask to SoC specific config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index bf098f36a466..6eeda222a973 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -129,6 +129,8 @@ struct mtk_dpi_conf {
 	bool swap_input_support;
 	/* Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (no shift) */
 	u32 dimension_mask;
+	/* HSIZE and VSIZE mask (no shift) */
+	u32 hvsize_mask;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -243,8 +245,10 @@ static void mtk_dpi_config_interface(struct mtk_dpi *dpi, bool inter)
 
 static void mtk_dpi_config_fb_size(struct mtk_dpi *dpi, u32 width, u32 height)
 {
-	mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE, HSIZE_MASK);
-	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
+	mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE,
+		     dpi->conf->hvsize_mask << HSIZE);
+	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE,
+		     dpi->conf->hvsize_mask << VSIZE);
 }
 
 static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi)
@@ -816,6 +820,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -829,6 +834,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -841,6 +847,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -853,6 +860,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
