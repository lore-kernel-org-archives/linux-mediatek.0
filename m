Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB17C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 22:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=luz/vlDVXYzjKtaB0wHP4LO+bJYKT3P7tCgnOFI3cYo=; b=Df1p9WzikTZUGG
	6aZGrKVGzupiWLnjtOyl9NGwlu0l/u8KenKmD2blc55qdwU4Gd6brgd7aM795HCNcoD6iGA9+qti7
	y5CWFaHlw5t9Ly92h3YrQ3YZOBYvheEF3Zrj+pZhkMUZXSwHoy9Kk0I5wS9r6rFFjnUIln+i3rZSi
	x0xFq4EFaCcX4uqBWOL7cVt6d/6fG3NPGh+d8IQU0qJ5hUT914tczp0GasfyaCFAjYtaM4q8v8+L4
	ceRm9lpzCJF2fQNIiAfaF2ImxL2izJXO55YXXCAwSE6NJDGYKK45izcTXsP1RozqxP/kZYRQoFYSi
	2+dhAPBTefZK7/1qum+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYbfF-006Yci-7f; Sun, 27 Mar 2022 22:47:13 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYbZe-006VET-Np
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 22:41:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id j18so17893390wrd.6
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 15:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NwaCkEqFprXU1DDLFh3M1rthbSN4qp5btRr4op3u7Dg=;
 b=iR4hb0eiA/yMyu09+mRgbnoSC/7qohqOzylOoDiFDgH3Rm+c3s7WIszZVaVy+GImNV
 DTSRSqdmfABnk/xat2efXMy1mhyJpzBS+TT2Bo75iQNq56Zir2I/bXyyr9fjFLWjxvNb
 lySLAFpXdhfTvJIIbzQ4kJ+UJxpDQCD7FFe/Pz7gB2zTJV+6XDH2G/EwGHt9X30cYP/I
 wNdBN3harmrRCeBtvLDP+RuIcQF0yiQBlUnWQ8NXwfC3QZTUuQ10/9inAvac5ha5qrEr
 tK1Z9hHyDh5Ic98lIXlYbSKETLhv3W20iVpVJW86d8TFe487NdmrnA2h4iaWXAqPuNPv
 SZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NwaCkEqFprXU1DDLFh3M1rthbSN4qp5btRr4op3u7Dg=;
 b=ziN/NafaHyV0Y3qVgEKIbAvpgqvUMMvIz9eB4cECogWGYkG2vV6q5Pn478dOiGX+G6
 xAlj3iMWqD3AWiK0ip4ZvSV1/l3MKmsv2dz6H9qh2GSQUWtfJ4sZ3n+/i9gl5/gEJ8PQ
 ZiPOyxx3xyaj9R7p328QeDZTQSqgNXITsja30Rb8TDU/fNxpgHh1XVDhFVUpH6g/7Lhj
 UJFcXKuu6e7teBHITbpyZN+5onjG/ifS62NMmKU/gBOOWGnwXXAmRLL89TMrQ5I22Fe4
 4T2Dqry7+A1NXkifny9VhY6vrJwFuzRIoEx2ZmgbG0Ed95xP5o9RV3jNEEniWgveubfN
 LjcQ==
X-Gm-Message-State: AOAM533lq0iEmmtiUlUOnL8JdvUbZz4TNjkXWML8QhIRPPJGqpCjetYH
 GBIa+KyLFpYYlySdZwTFHNCgOw==
X-Google-Smtp-Source: ABdhPJwopKrzbeQi71t9oGesuR9nTk+ttZWzOngQzcK6unOKCfR+nbvvbDNuuP8jxHUdXyvs6NC+NA==
X-Received: by 2002:adf:de81:0:b0:203:fcba:84c3 with SMTP id
 w1-20020adfde81000000b00203fcba84c3mr19091884wrl.398.1648420885440; 
 Sun, 27 Mar 2022 15:41:25 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:24 -0700 (PDT)
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
Subject: [PATCH v9 16/22] drm/meditek: dpi: Add matrix_sel helper
Date: Mon, 28 Mar 2022 00:39:21 +0200
Message-Id: <20220327223927.20848-17-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_154126_839549_6D7D33B3 
X-CRM114-Status: GOOD (  10.43  )
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

Add a mtk_dpi_matrix_sel() helper to update the DPI_MATRIX_SET
register depending on the color format.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 8198d3cf23ac..82f97c687652 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -385,6 +385,25 @@ static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
 		mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_EN);
 }
 
+static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi, enum mtk_dpi_out_color_format format)
+{
+	u32 matrix_sel = 0;
+
+	switch (format) {
+	case MTK_DPI_COLOR_FORMAT_YCBCR_422:
+	case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
+	case MTK_DPI_COLOR_FORMAT_YCBCR_444:
+	case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
+	case MTK_DPI_COLOR_FORMAT_XV_YCC:
+		if (dpi->mode.hdisplay <= 720)
+			matrix_sel = 0x2;
+		break;
+	default:
+		break;
+	}
+	mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel, INT_MATRIX_SEL_MASK);
+}
+
 static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 					enum mtk_dpi_out_color_format format)
 {
@@ -392,6 +411,7 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, false);
 		mtk_dpi_config_csc_enable(dpi, true);
+		mtk_dpi_matrix_sel(dpi, format);
 		if (dpi->conf->swap_input_support)
 			mtk_dpi_config_swap_input(dpi, false);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_BGR);
@@ -399,6 +419,7 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, true);
 		mtk_dpi_config_csc_enable(dpi, true);
+		mtk_dpi_matrix_sel(dpi, format);
 		if (dpi->conf->swap_input_support)
 			mtk_dpi_config_swap_input(dpi, true);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
