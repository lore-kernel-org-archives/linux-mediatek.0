Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5EBC433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 22:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bY/0awXkFmjKI3AL9awwv5Vde9v6Vpr4itG0Dsi0z3s=; b=M8BG+MEgtLuTCx
	XatlnIsdrSQ7kIRZkdIYBfaFduurQaZf0tXHZDeFme+Dz6nEqzSZWzT0mT0LKHKPxBOtvOseLRv0r
	BWjC17lkEX5pFFd00uzSoLQhZSw+RW0n5LYe8w7TESGmw7QahqwlV0Bxe4KirwhwSX270h59jirJv
	4xcq9dgsKvh0DSweC3M7gLfr3Db+PXMvv46BnSDQaWlSxvGgdgZ42jm7nhgE3z2JE2xV3eBol/E5o
	spkOTRpi4fqnXFKB2es3OAA/JGli50mMrBsywH0HTdlmhVAHneqc3SkfyAIHmQ8hbMHaqAYQbNgsZ
	boESXzZgWVL2oKd/kn+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYbc8-006Won-WB; Sun, 27 Mar 2022 22:44:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYbZQ-006Uzv-VG
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 22:41:19 +0000
Received: by mail-wm1-x330.google.com with SMTP id p189so7388058wmp.3
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 15:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z0UyPlWzo4y5KtqMIJtLeHp3pqp/XkkAPry5DhA+scQ=;
 b=KgkgNYwWNWYqMssq1TxVj6hHdHwIijT+06s/VUmK5PvHiiHhDPIwS4ruW+rc0C9rNj
 8nb7tNefHtXIB6cfSd9oZPKbXI+IRzTudGx/WYxtsWom+dBqWi39S8AX2JTc32CiT4re
 MwUTYZ2AOnsDG9Xlaun0ZDLWrv5SQfgqRn/BEA4zTa4GLQG2o3iXXcmwO6qE1bmts/VL
 02VX+oR8i4R0llcLLZRkM4qLE1+ZacJzwCicW3L21LO4SPQdOUootaue+SeD6uOOhmsp
 13ZRyT+jQjhxig6G7ZfC0uabcu0OzgexMWk1Z23gDAwYn1fFFUCCEBKFDv/eyN7wpe2o
 AKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z0UyPlWzo4y5KtqMIJtLeHp3pqp/XkkAPry5DhA+scQ=;
 b=c1edbHZEooxhDSuJM4w5iyWmcgnjEtJHKabmTbBb+Qj/jw3yKqbsXH/nq8z9TyTz9C
 4CcvgGXe+SYhI8kMd3ElB5xl25RsTPXGjtCCjvOVpgPl2GgcnysyI45yXpPm0gdwR7WF
 oQCM252r9xUeoAsFe2BM1D3HaDfZJfCGq72dUsd4VVCp5nbq0Yfn1YUuVCipp+cunAmH
 CRsxmwe2ytuq4Fb7YASszQgMxX5ieCuRv6Wj24mO0I1a6ez4QOmsZ+Bh4BOAY3VsX27z
 sbTbjv0vIzWyEymBftudUsOPv1XvzwsFOIHot/ifI02Ylz+yDhp2G+jaxQeDqAo6/Ohf
 R8pw==
X-Gm-Message-State: AOAM532vLGx6l91SDr4Tck//BynwUcOhv2jkHFGPoeCTYZbjVwzTHack
 HcTkjF2/x4jmNZgoxOD8ybgVOw==
X-Google-Smtp-Source: ABdhPJwb1jYMbNoXQ+5XpX8dYg7AJHIw9s/jIzUwv5bmDSFVsCtOqUxBeJFvHmVp0i1tQgEDQdGcHA==
X-Received: by 2002:a7b:c30a:0:b0:389:9e1e:a15f with SMTP id
 k10-20020a7bc30a000000b003899e1ea15fmr21814588wmj.28.1648420871313; 
 Sun, 27 Mar 2022 15:41:11 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:10 -0700 (PDT)
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
Subject: [PATCH v9 08/22] drm/mediatek: dpi: implement a CK/DE pol toggle in
 SoC config
Date: Mon, 28 Mar 2022 00:39:13 +0200
Message-Id: <20220327223927.20848-9-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_154113_050056_ADEFA569 
X-CRM114-Status: GOOD (  11.89  )
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

Adds a bit of flexibility to support SoCs without CK/DE pol support

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 4746eb342567..545a1337cc89 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -125,6 +125,7 @@ struct mtk_dpi_conf {
 	bool edge_sel_en;
 	const u32 *output_fmts;
 	u32 num_output_fmts;
+	bool is_ck_de_pol;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -211,13 +212,20 @@ static void mtk_dpi_config_pol(struct mtk_dpi *dpi,
 			       struct mtk_dpi_polarities *dpi_pol)
 {
 	unsigned int pol;
+	unsigned int mask;
 
-	pol = (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ? 0 : CK_POL) |
-	      (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ? 0 : DE_POL) |
-	      (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 : HSYNC_POL) |
+	mask = HSYNC_POL | VSYNC_POL;
+	pol = (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 : HSYNC_POL) |
 	      (dpi_pol->vsync_pol == MTK_DPI_POLARITY_RISING ? 0 : VSYNC_POL);
-	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol,
-		     CK_POL | DE_POL | HSYNC_POL | VSYNC_POL);
+	if (dpi->conf->is_ck_de_pol) {
+		mask |= CK_POL | DE_POL;
+		pol |= (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ?
+			0 : CK_POL) |
+		       (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ?
+			0 : DE_POL);
+	}
+
+	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol, mask);
 }
 
 static void mtk_dpi_config_3d(struct mtk_dpi *dpi, bool en_3d)
@@ -799,6 +807,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.max_clock_khz = 300000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.is_ck_de_pol = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -809,6 +818,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.is_ck_de_pol = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -818,6 +828,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.max_clock_khz = 100000,
 	.output_fmts = mt8183_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.is_ck_de_pol = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -827,6 +838,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.is_ck_de_pol = true,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
