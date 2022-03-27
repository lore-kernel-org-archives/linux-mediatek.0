Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAACC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 22:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xppENEyJ4IluKGzA+XsnN/GYlj2c2dmnM/humPl8ZUA=; b=biPjQ/mmlsnrqT
	5AJEhbTIunEB1U54x8F7I/BgVGMXHCXEyiDhMRLXgb9X/Lvypk5k57CptnYmAagtSLsQ4BZ75rddF
	SPUZ47+zIMLOuHp8E/8t+dyaXdsN6NbmXkQtp/dbkruRO2Pb6FAplqWfPtLM3VMSacl6iCouV6HNy
	Xatzk1oSyhNPRU49eRioBgYcqgH1hOZ/p3BobZYUaSZmZSXSLVnBwv8oE1hayQnGKMZI/GHf/akPX
	ahkYKHfus5LZUvQKFUUg4j6OVDOd4v9hERAXcYBtSK2RRrcraRlM9B+lVBDeVA8S04uc9JlTu94xP
	UOZmkUR0OWc2mIU1Gauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYbc7-006WoD-LT; Sun, 27 Mar 2022 22:43:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYbZS-006V22-Ie
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 22:41:19 +0000
Received: by mail-wm1-x330.google.com with SMTP id n35so7378364wms.5
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 15:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6eEHSj6Z+4nINe2TDPCkNf9jm6eypipKQx8L5na/Yyk=;
 b=DtFMnxGtYKmHRMUzTzh7I6DLdETH4okBmY0yZ9MvHLaMjh7fxn1GjzlARnO3nrFeWF
 fAPT53BgUugvQLqbPDGrhB8vEtKqIwVN94hSFvkmA+1bqD4Uvxix0VTlrpWP+D8m8qF7
 bA0xO4T7ZA81J57O0lYpS9zt3+ibyiWZJaCZO5Abrn5mdXVOteXj2y1+H6YjtusmUJ08
 u/HDaDEKnxRVhmoH8NbMPtcEq+5nqkd3h9yfBlUw4wsUouWfc8lt4x6PuqSNljcI4QXi
 QV28++7r5tExDrqDZ0A+kVrw7hf/wJX3e66BiKMUKqmqvQ31tSdpibf2ahQvnwpwenD8
 JVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6eEHSj6Z+4nINe2TDPCkNf9jm6eypipKQx8L5na/Yyk=;
 b=CyFCcMxjwhWFAW/ZeXx2Z6JRwO6CyfyNnuU3mzCHK50jh/sbXobI+/YddU7T2CZ/IU
 qhWe0uOwIq6SSe9tW+elyj3TiN7KXKhss62UCU0cv/zelg8O/Oo8/4f8DULVCu/zzNHw
 K+iY0pAGj2rUBTb59YdYVAlodk0MAQs/sHuIm19KYMtbWWWef8V5wJ+JQTBcPDzhrP7z
 4wRYo028+Glqy3shMXb8z2ttOr6EhisMrt8N0A0cp4npjzV+ZyGbxpZz7amK+TVJ6+tc
 EZVIJN1gTQ+vtOSz8hvumRkr670JmjTs+GBz3xubPbGNbqk/xVIRVyUlDV6qSwuAksq7
 LQ4Q==
X-Gm-Message-State: AOAM531Yxack5h0cL0isnuCMDrQaWsG07EAmT/79iAj7utrOqQh1CbY+
 5b84pOpzJ5dGHq0QCS3vUnyeSA==
X-Google-Smtp-Source: ABdhPJwwxg1FtE27D6XIHM4ZTzbNM8vseNiuJQfxCtcwkqMIdfzlsCy1lOxRrCu9aFCLBsjbKsrLYQ==
X-Received: by 2002:a7b:ce92:0:b0:38b:ed80:9e66 with SMTP id
 q18-20020a7bce92000000b0038bed809e66mr31716224wmj.82.1648420873144; 
 Sun, 27 Mar 2022 15:41:13 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:12 -0700 (PDT)
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
Subject: [PATCH v9 09/22] drm/mediatek: dpi: implement a swap_input toggle in
 SoC config
Date: Mon, 28 Mar 2022 00:39:14 +0200
Message-Id: <20220327223927.20848-10-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_154114_654730_98AB00DF 
X-CRM114-Status: GOOD (  11.44  )
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
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
