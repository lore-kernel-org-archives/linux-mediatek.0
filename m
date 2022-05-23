Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CF5C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 12:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKfADrDN5SyD7k9XFooVFuxyc123SPOXEt2JeTD542I=; b=ikmGK2q4vgJcFj
	+g7IzyAZvxJgcXyvTFkN1c3PNhaUXo+6TlcLeGyhBkuie/OQy/XsHx1uesalAaKLOC9y2gbbj7djD
	xH6qm9RA3LZGDJHb/Wh8TGHi8uesN76YVY2wGgQGRnGoB/ztfgMmuV2piA0uqHitLnL5BAmgw5FmV
	t0XB81oIGg+rXWnnEe/f+e5ZuTFHMyrMCwyl51cSQEjHgqs0qlWrxfutNyur0NVvl19cHyBpWQOmi
	z1LEsyvhnQ9ud8r/TwxPCG5+6WKOfhoqSYg0LLXYxSz6DHc8k1kmw56Fp6S7SwEA8FIx0JcxtyANQ
	z6PHUkqS+Y2rv667aPbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt6yH-0042iJ-Po; Mon, 23 May 2022 12:15:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt6R2-003nAx-19
 for linux-mediatek@bombadil.infradead.org; Mon, 23 May 2022 11:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=4zP6HMIa2YPzZ4Ud3UnVV9v/2WWghDZEujrnaWZbPns=; b=VM2pczhvCVaOPvV+qcSEKn3+R5
 PN0XRyb8kkpyztd2p49NrA0nzlGTyxzVH6t4CMLGMRpOL4L2CRnqeAk0qgtOD4zfGVpSBCiD+lt2D
 aSx4mwQMnHrZoRWcsdao9BcWp3v+/VzJXLa9aZWfvlYVWo80RZR6vQmA2Y9Oecjt8LcjtJtLlrfOI
 8Yn7pfVd/aaqEPst/s7d7zOCtRk+UO1MaX1s6tVW1a7eIRMxaM9IYvpoN82ZvjAld4SXlPnJFzxGU
 3sAAQ1HQgdHjI4pVOrHngIbUdWQYFcVbrypabwdfsSwVWeNxl0M7E/TJ0S/Q/QDuF3CA3l3j9buqs
 kzR8Zg9A==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5fE-0011ad-MG
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 10:51:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id t13so1585665wrg.9
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 03:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4zP6HMIa2YPzZ4Ud3UnVV9v/2WWghDZEujrnaWZbPns=;
 b=CVxXAcJ7h3wlqtwZU9H9KpppU+0u/RTKAuP4gBIGTnyBTrBe1J9DA3/oPGdgksz0xy
 GLUAXoK2K5PD5Qa5uoLYqngMrUqTrBQJ22WiVornX3mY7lg3WgNkr4opKRljcDGJ+/bZ
 bW3RuhkiUKraQUELKEkJxDdqc9nVn+Cdrp9idbZpPPJXCWSoi+iPXeHO6GRdDakV8A0+
 KEZmDMyXYpfBriNae5MHHjylHFP8Q/FOiVWpPyPtKhse51L0ASaj2EH1H/nCY3QgBzmZ
 PDdfqUyUduPQmp+OuR3gzYBUFeiFmKAZZCk6UmkCYrXc5uFd1B9NK+3wO+q7fCqOFV0R
 g8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4zP6HMIa2YPzZ4Ud3UnVV9v/2WWghDZEujrnaWZbPns=;
 b=0V5pe0SYaY/+7EqDNZzXg7fNheFZqLTPJm/KgubpGO/+AVcxOEfuipWX4hrVfvXqpY
 5Z6zVVem/zc8ZaFwRICTOg4Tt6i2CWVCejzcYepabzvpnT5SHb52pzTbQyvJZNhqMe5k
 uY/y6XketDp++jmNC6SOQMU7iWLeMsoJ128VLR2w7/org73tn4edml7yLX5X77gPv2PX
 Igf2NXK+p14uoHzqDuvlrNYj1Py3wpzgyZbN5UU+1R660gK1VihTom3DzFG3Z2OvoXyE
 2C/NAabDL//Hz3MO17FWxgc1CvtdUWQaFayIb4A4uHb5Uc4GSgux9X3+7ifws2hitLfo
 xjsg==
X-Gm-Message-State: AOAM533B5hceQ4SXy+jG/9kYMom2j+mkSmW8fA4TK8zU8GSrk4pNsur+
 T7n4NrE2l3WeskorV/loEoPk2A==
X-Google-Smtp-Source: ABdhPJyQ9VeNqhjj7qlI7JhdS3acBdep+9UKDmpO3Y91brQHC2cBHqOMlHX3SGs3/FwHb18YDgbYJA==
X-Received: by 2002:a5d:6484:0:b0:20f:cc0b:e3f1 with SMTP id
 o4-20020a5d6484000000b0020fcc0be3f1mr8011615wri.237.1653303109362; 
 Mon, 23 May 2022 03:51:49 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:51:48 -0700 (PDT)
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
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v10 16/21] drm/meditek: dpi: Add matrix_sel helper
Date: Mon, 23 May 2022 12:47:49 +0200
Message-Id: <20220523104758.29531-17-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_115153_199476_762C4911 
X-CRM114-Status: GOOD (  13.12  )
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
 drivers/gpu/drm/mediatek/mtk_dpi.c      | 21 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index a6b6d62a17e7..5b88a7ed5845 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -386,6 +386,25 @@ static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
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
@@ -393,6 +412,7 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, false);
 		mtk_dpi_config_csc_enable(dpi, true);
+		mtk_dpi_matrix_sel(dpi, format);
 		if (dpi->conf->swap_input_support)
 			mtk_dpi_config_swap_input(dpi, false);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_BGR);
@@ -400,6 +420,7 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, true);
 		mtk_dpi_config_csc_enable(dpi, true);
+		mtk_dpi_matrix_sel(dpi, format);
 		if (dpi->conf->swap_input_support)
 			mtk_dpi_config_swap_input(dpi, true);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
index dd47dd3f2e4f..91b32dfffced 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
@@ -231,6 +231,9 @@
 #define EDGE_SEL_EN			BIT(5)
 #define H_FRE_2N			BIT(25)
 
+#define DPI_MATRIX_SET	0xB4
+#define INT_MATRIX_SEL			BIT(0)
+#define INT_MATRIX_SEL_MASK		(0x1F << 0)
 #define RGB_TO_JPEG			0x00
 #define RGB_TO_FULL709			0x01
 #define RGB_TO_BT601			0x02
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
