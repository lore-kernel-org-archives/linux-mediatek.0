Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2ECC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 22:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpAS2sHSGcAPImSLyCgVjeM7GkzUVuL7/YD69fBSME0=; b=OLo5mF3OXrSnTj
	bFDZbL+Tjykyd7DoWhIy+yRYmWCZKZd++B1GX0qiSadwIQ+G/St+VEyqW+bNmCcUSYXoIXgDnz5Cr
	zrnqxGjq6XJXn+odS25OwAMDUlEEkYSuhyV1+7IwYm/rZreWgDuspN3KZR4hhDSHAOSRkvoRLL8Tx
	hQs2sFFn273A/hnvrALgjkX8V51t6vDCeQlQon603ZBjtjiRGkPTkPUoeY7X4y38rSsHM0BQG/e3s
	Je2ESFlCLkUlgw5yo3OYoGQ6ivnV+zYS4rZQnwz3+mwIh2QiUrju4WVgWoN7YOoDTLrmGTHh74aXo
	sPNBm0/TQ0S3o3bESi4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYbfC-006Yba-V7; Sun, 27 Mar 2022 22:47:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYbZb-006VBD-2r
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 22:41:28 +0000
Received: by mail-wm1-x32a.google.com with SMTP id r64so7383167wmr.4
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 15:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMvfz+B/fO4XaHRDT9xBCSiSBmXbtSzCBQeXFCLeYNU=;
 b=Vw1X4Y5lVyD515NEiLFa95V22KLRWSgdoITSR0BCjkY5StkoBpSinhOQfwnxA0wleD
 aHkviACkx2lXQf8Nu4082lNMVO729F9b924rICzamKBrUbBWhqbOCJt50We8bvy+sCNa
 u45slmKu49mbiiFUcL4hjlXUwNTMddzcSbd1bgu8VDFdLnpy7Te2BWHjLvNfJdbFnzLi
 hh1GZRZDDID3Ho6e7tPNHpJFoWHGHnMVJ/m3tyWpSVadNxtS/SphHBr3o95nK2qnYniR
 8rm30oqWbcNBC9jeAmOMkIFgJl9RrVBVrdF1n8qsHkXeEQS3je6Nx1VGhXhPNecFQYVH
 YPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KMvfz+B/fO4XaHRDT9xBCSiSBmXbtSzCBQeXFCLeYNU=;
 b=KisyzWj5mLZ456YCY1uJ7lXla5uICSxaqkqo6+P+qMGUh5/ALJ/2dKdjMzCTWuf+pl
 K5hyOIgANV4vC8pC/Pk5GH19BrYADcD4MJnqJIc9D+DdgEzZCTQt3r9rRKzlfkUnYJJJ
 fikIj8oKfKrLiIS3b3yck3Zgn8hIaGY8CB5Z98cC+X0rYg3RRy0S3OO1gvj652QscxEW
 34BjB75CEeqxgj52GN1EROir5RnGsgs5rm8qeFVKrr7EPyP349ChLHjcQbt/R13TNGX5
 ZJrLUNqpVkUKUyz5sqRK2HlBrQSso4XxJzLGz5X7ylwLIcXEbtmahvlzNiBV5iHJBRYr
 1yxA==
X-Gm-Message-State: AOAM530wGppVtzvGXPRTldnyPMoRBDkplPFgcz5nhwhvga/ONzx1TQbP
 1hPCZocEDv77ZqjeTuwYoxiMug==
X-Google-Smtp-Source: ABdhPJyr9nCr1C5pKgpwF1xz6b96JegOEEG0alyMX5WbHq+R8Ld7G7nR3JeuDRCJBV3mixw3fJxVKA==
X-Received: by 2002:a05:600c:1ca3:b0:38c:ccd1:bb1c with SMTP id
 k35-20020a05600c1ca300b0038cccd1bb1cmr21546319wms.199.1648420881794; 
 Sun, 27 Mar 2022 15:41:21 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:21 -0700 (PDT)
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
Subject: [PATCH v9 14/22] drm/mediatek: dpi: move the csc_enable bit to SoC
 config
Date: Mon, 28 Mar 2022 00:39:19 +0200
Message-Id: <20220327223927.20848-15-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_154123_218795_6AC63CF3 
X-CRM114-Status: GOOD (  10.67  )
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

Add flexibility by moving the csc_enable bit to SoC specific config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 40254cd9d168..eb969c5c5c2e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -133,6 +133,7 @@ struct mtk_dpi_conf {
 	u32 hvsize_mask;
 	u32 channel_swap_shift;
 	u32 yuv422_en_bit;
+	u32 csc_enable_bit;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -363,7 +364,8 @@ static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
 
 static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool enable)
 {
-	mtk_dpi_mask(dpi, DPI_CON, enable ? CSC_ENABLE : 0, CSC_ENABLE);
+	mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->csc_enable_bit : 0,
+		     dpi->conf->csc_enable_bit);
 }
 
 static void mtk_dpi_config_swap_input(struct mtk_dpi *dpi, bool enable)
@@ -827,6 +829,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -843,6 +846,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -858,6 +862,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -873,6 +878,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
