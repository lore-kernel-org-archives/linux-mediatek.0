Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3B2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 09:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mM8b/V8ORLBuvVGwA1iyqJSZqUX/+Gs1PQG+BJlkU+s=; b=Vvl5dhenJ2B/Wc
	WTbw3jfTZcGU4ZBq659477Gxs2ctatS0fW+TtxDFsZ4z6fpGaalbxF/rtsBci3T592vHol6OCbKOc
	a5+Cl8UQEXzi4obYHv2MJqXsevWDqV2Dif34gT7s8o+2N/Tw+TG2sPin7n9LnFAyGpuiMVyGt9W+H
	ZAX8VR1pd7f5vyZ+DVzY2U+8Dsihl4OA2OMh68AYXnjyy6eOpco8JTee4hskMHK4I3HUdtRiIvceG
	Or4gcC15IpptKSCZcix2ianzAPhKVwBJhpfQ6QvA7wL6911VOZeC8/x2xo59d8wyJkZBzEpByk0I2
	7/sZagGTvxfSQvlAoA8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNXJE-004EhG-6X; Fri, 25 Feb 2022 09:54:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNXIg-004ETN-1Q; Fri, 25 Feb 2022 09:54:12 +0000
X-UUID: 52a03d69b2664dcf857b42299af216d3-20220225
X-UUID: 52a03d69b2664dcf857b42299af216d3-20220225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 950384284; Fri, 25 Feb 2022 02:54:04 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Feb 2022 01:54:03 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 25 Feb 2022 17:54:02 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 25 Feb 2022 17:54:01 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <jitao.shi@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <rex-bc.chen@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: [PATCH v1,2/3] drm/mediatek: Add TOPCKGEN select mux control dpi_clk
Date: Fri, 25 Feb 2022 17:53:52 +0800
Message-ID: <1645782833-27875-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1645782833-27875-1-git-send-email-xinlei.lee@mediatek.com>
References: <1645782833-27875-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_015410_110436_C384E260 
X-CRM114-Status: GOOD (  12.28  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Dpi_clk is controlled by the mux selected
by TOPCKGEN and APMIXEDSYS can support small resolution.

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 38 ++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 4554e2de1430..bad686817e29 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -63,6 +63,14 @@ enum mtk_dpi_out_color_format {
 	MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
 };
 
+enum TVDPLL_CLK {
+	TVDPLL_PLL = 0,
+	TVDPLL_D2 = 2,
+	TVDPLL_D4 = 4,
+	TVDPLL_D8 = 8,
+	TVDPLL_D16 = 16,
+};
+
 struct mtk_dpi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
@@ -73,6 +81,7 @@ struct mtk_dpi {
 	struct clk *engine_clk;
 	struct clk *pixel_clk;
 	struct clk *tvd_clk;
+	struct clk *pclk_src[5];
 	int irq;
 	struct drm_display_mode mode;
 	const struct mtk_dpi_conf *conf;
@@ -459,6 +468,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	struct videomode vm = { 0 };
 	unsigned long pll_rate;
 	unsigned int factor;
+	struct clk *clksrc = NULL;
 
 	/* let pll_rate can fix the valid range of tvdpll (1G~2GHz) */
 	factor = dpi->conf->cal_factor(mode->clock);
@@ -473,11 +483,26 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 
 	vm.pixelclock = pll_rate / factor;
 	if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
-	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
-		clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
-	else
-		clk_set_rate(dpi->pixel_clk, vm.pixelclock);
+	    (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE)) {
+		if (factor == 8)
+			clksrc = dpi->pclk_src[2];
+		else if (factor == 4)
+			clksrc = dpi->pclk_src[1];
+		else
+			clksrc = dpi->pclk_src[1];
+		}
+	else {
+		if (factor == 8)
+			clksrc = dpi->pclk_src[3];
+		else if (factor == 4)
+			clksrc = dpi->pclk_src[2];
+		else
+			clksrc = dpi->pclk_src[2];
+	}
 
+	clk_prepare_enable(dpi->pixel_clk);
+	clk_set_parent(dpi->pixel_clk, clksrc);
+	clk_disable_unprepare(dpi->pixel_clk);
 
 	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
 
@@ -893,6 +918,11 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dpi->pclk_src[1] = devm_clk_get_optional(dev, "tvdpll_d2");
+	dpi->pclk_src[2] = devm_clk_get_optional(dev, "tvdpll_d4");
+	dpi->pclk_src[3] = devm_clk_get_optional(dev, "tvdpll_d8");
+	dpi->pclk_src[4] = devm_clk_get_optional(dev, "tvdpll_d16");
+
 	dpi->irq = platform_get_irq(pdev, 0);
 	if (dpi->irq <= 0)
 		return -EINVAL;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
