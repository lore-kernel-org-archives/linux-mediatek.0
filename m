Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C8AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 20:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75icLEadDg9SuYiVLRWZ8hvxFN2k+OEtdzVewKs1CdQ=; b=VopShk0G6omemW
	QnIFvQQP4bdLett8KIKWuPoRR9nuywJL8hpSCOOE9wJ0FUB+SVMglkGH6TG94BM8VpcpDi5fR/+44
	HcZAsSewKPug9zwar3YdzNVfDhmf5KXs2Prx04HhAbDrpmdrMXoIqEs+RuerlInJ4x8a/LF3HHRDw
	7tvXXaBeszaS580R6AUldMnZIL7ldp62gX+W+RdxaiPjeYWs3JIdP3rAZMTTaoblHcSN9nM6TUnsw
	g717a4yg/t9KvtIzWulrLBuAEDw9RAV2bVgDtfffIBuVOddQPpHnDrKTL3ABKqiiNvpus2UrcY3zy
	UmzAMKgRabxduFM3aeCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvlos-008A5t-Au; Mon, 30 May 2022 20:16:54 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvlnB-0089D6-Hs
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 20:15:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id s24so8691027wrb.10
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 13:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PD07AGQSISBrBm8fI0Y+y6jJGPbS9zphsEozNpxvp5c=;
        b=MIjCVNm9g03WUwxU5l29QvEepUh5wgB7oQF4k3VLWcYaS9VXU+YwiZFLHJ3xuT1eSW
         nfeoWSQ3Cx/AgyV8zGDKSNUGXjId6MJxju4d+uaToMm2lBCqtTOldeSKsdYeocKgPt6D
         dZVvQ6Mxp5sMfcruCnIxWupF/gPGMBjsDRzn+lCvvIw+tg8dBT2+NAXfkzpUjRX5sUUC
         E257NMxeK8YUQWugfDhCqwmO8DVnL/8cDLQ5sC+LTETOKTR4CIsFg/KT7pRcoFc2YrS2
         VMvs2eDy8Ql5unLyZ1AdVLM32fevHoEod0supyC5nJJeKF7FJokoujZTL4357QG7MrNL
         IKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PD07AGQSISBrBm8fI0Y+y6jJGPbS9zphsEozNpxvp5c=;
        b=NqHjpL2nJ/8bmP+rJOEQ2XplpQzRxtOUeHPnwDA0OBQNY27UjV30YyYk5OPaY2Ikd5
         Ajv01+bUtUCxEv6p32NqSfe4qAaboW97k754GLkxT8uC/VBEEAeFnDjWMGp5idgzZPTN
         HGLY68nFy6ENFmUAY96KzXC1CA5dGSUdRlg72Lwi4CrU3GxVErz4W0/S7D7+qZbPTtnU
         6CFjCzgVVsePWkIpnaSTEhIF3wcAOO4N/oYT8l5YSCOGPkkc8Sw7TzbeyG3bz9H/TWvs
         Yeff7/Lq4pOfqKo8NUEb2bP7lMN86PlRKW6+bWS/hdicRER4Eh8YXlnk0FIeqKsQOicq
         f5zQ==
X-Gm-Message-State: AOAM531OR6jhfpF3Xhdv1wu2/J/Y+emwsdSImjqQf2WQWhwm+2SFj8VI
	FG//ILuzlaajnZhRKzCuTAXfRQ==
X-Google-Smtp-Source: ABdhPJzABVtC2tkCZEtAl4IfibZ4A1woYgNYxWWP2/bB92DTuTd5TnPRpW2iy1sQkdfWlmVR0yHj5Q==
X-Received: by 2002:a05:6000:15c7:b0:210:472:e0e8 with SMTP id y7-20020a05600015c700b002100472e0e8mr20637968wry.365.1653941706961;
        Mon, 30 May 2022 13:15:06 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe101000000b0020d110bc39esm9770401wrz.64.2022.05.30.13.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 13:15:06 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: matthias.bgg@gmail.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Cc: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 6/7] drm/mediatek: dpi: add support for dpi clock
Date: Mon, 30 May 2022 22:14:35 +0200
Message-Id: <20220530201436.902505-6-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530201436.902505-1-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_131509_635602_FC98DC55 
X-CRM114-Status: GOOD (  15.29  )
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

MT8365 requires an additional clock for DPI. Add support for that
additional clock.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index e61cd67b978f..7872db60840e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -72,6 +72,7 @@ struct mtk_dpi {
 	struct device *dev;
 	struct clk *engine_clk;
 	struct clk *pixel_clk;
+	struct clk *dpi_clk;
 	struct clk *tvd_clk;
 	int irq;
 	struct drm_display_mode mode;
@@ -412,6 +413,7 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 	mtk_dpi_disable(dpi);
 	clk_disable_unprepare(dpi->pixel_clk);
 	clk_disable_unprepare(dpi->engine_clk);
+	clk_disable_unprepare(dpi->dpi_clk);
 }
 
 static int mtk_dpi_power_on(struct mtk_dpi *dpi)
@@ -421,10 +423,16 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 	if (++dpi->refcount != 1)
 		return 0;
 
+	ret = clk_prepare_enable(dpi->dpi_clk);
+	if (ret) {
+		dev_err(dpi->dev, "failed to enable dpi clock: %d\n", ret);
+		goto err_refcount;
+	}
+
 	ret = clk_prepare_enable(dpi->engine_clk);
 	if (ret) {
 		dev_err(dpi->dev, "Failed to enable engine clock: %d\n", ret);
-		goto err_refcount;
+		goto err_engine;
 	}
 
 	ret = clk_prepare_enable(dpi->pixel_clk);
@@ -441,6 +449,8 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 
 err_pixel:
 	clk_disable_unprepare(dpi->engine_clk);
+err_engine:
+	clk_disable_unprepare(dpi->dpi_clk);
 err_refcount:
 	dpi->refcount--;
 	return ret;
@@ -893,6 +903,12 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dpi->dpi_clk = devm_clk_get_optional(dev, "dpi");
+	if (IS_ERR(dpi->dpi_clk)) {
+		return dev_err_probe(dev, ret, "Failed to get dpi clock: %pe\n",
+				     dpi->dpi_clk);
+	}
+
 	dpi->irq = platform_get_irq(pdev, 0);
 	if (dpi->irq <= 0)
 		return -EINVAL;
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
