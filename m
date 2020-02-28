Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BEDC3F2D0
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 08:26:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8AFF246A2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 08:26:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G6cqefLP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Tj8fjfxq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8AFF246A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAkXymBpV4De0j46/kgK9d/OIkBRJjWaVNpmB4BzOA0=; b=G6cqefLPtdS+As
	Vx/cyjz4l93gbip7Psi9rVysW2JNB/ACe8Ze0T5f2Aq2wW+BlPCjvsol5MKh3d148MkyEYYeoRYIv
	ttbAgTqZVzmCoFIVB3BZF/tt078QBJ0tHe5ukfbCD+8YGgG7ogmAxz6tH4gGN0rGG9wFTkT5vupcv
	fhNC+keVRc7vtcrACtOnNx5/uBAjLH8YucCjEms1o00zgrQHYizuzcqeSN2phzJwipE5MSSSPiVMY
	h2qV1TXcGRQ1wFpQg8XPt+A1ITa8IwfP3DGguXcbbcbNmxVlYNtPY0TpVIw5jV2S3ukcFuhF67Vlc
	x4Rs/DTimybqMxh7/mLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7ay9-0000aC-DW; Fri, 28 Feb 2020 08:26:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7ay5-0000UT-Id; Fri, 28 Feb 2020 08:25:59 +0000
X-UUID: e335bcfa98fc44cfa30d7e8ccabeb837-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZURVBJvcNy7+s3YjJr/hwpBv6N9yfElSzaYb2eZ+VsU=; 
 b=Tj8fjfxqK6xefdVl38PW4a0nNb12+pEhxrLQO0X/GDCrYF62RjBMz7h/cOHtQObObPAl4tjl70tMNlIXp3PFoAS+ONbBvDlSBEzkOJRBxUxmrBANJ98uBBJmSaoR8cG9Epa9jODcs9/YJ03Yi/mY90hRcOxn623j62JCsYAbKZA=;
X-UUID: e335bcfa98fc44cfa30d7e8ccabeb837-20200228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1195940207; Fri, 28 Feb 2020 00:25:54 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 00:17:01 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 28 Feb 2020 16:14:28 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Fri, 28 Feb 2020 16:16:06 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 6/6] drm/mediatek: set dpi pin mode to gpio low to avoid
 leakage current
Date: Fri, 28 Feb 2020 16:14:41 +0800
Message-ID: <20200228081441.88179-7-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200228081441.88179-1-jitao.shi@mediatek.com>
References: <20200228081441.88179-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4B695817580141192BDE9DB1EA1283C630CF297A489B08CFEF63122DE1C7CFB32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_002557_715777_21A123A9 
X-CRM114-Status: GOOD (  12.24  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Config dpi pins mode to output and pull low when dpi is disabled.
Aovid leakage current from some dpi pins (Hsync Vsync DE ... ).

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 44 ++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index db3272f7a4c4..fece8661d8b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -10,7 +10,9 @@
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_gpio.h>
 #include <linux/of_graph.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
@@ -74,6 +76,9 @@ struct mtk_dpi {
 	enum mtk_dpi_out_yc_map yc_map;
 	enum mtk_dpi_out_bit_num bit_num;
 	enum mtk_dpi_out_channel_swap channel_swap;
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pins_gpio;
+	struct pinctrl_state *pins_dpi;
 	int refcount;
 	u32 pclk_sample;
 };
@@ -387,6 +392,9 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 	if (--dpi->refcount != 0)
 		return;
 
+	if (dpi->pinctrl && dpi->pins_gpio)
+		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
+
 	mtk_dpi_disable(dpi);
 	clk_disable_unprepare(dpi->pixel_clk);
 	clk_disable_unprepare(dpi->engine_clk);
@@ -411,6 +419,9 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 		goto err_pixel;
 	}
 
+	if (dpi->pinctrl && dpi->pins_dpi)
+		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
+
 	mtk_dpi_enable(dpi);
 	return 0;
 
@@ -705,6 +716,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 static int mtk_dpi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *ep;
 	struct mtk_dpi *dpi;
 	struct resource *mem;
 	int comp_id;
@@ -716,9 +728,37 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 
 	dpi->dev = dev;
 	dpi->conf = (struct mtk_dpi_conf *)of_device_get_match_data(dev);
-	of_property_read_u32_index(dev->of_node, "pclk-sample", 1,
-				   &dpi->pclk_sample);
 
+	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+	if (!ep) {
+		dev_err(dev, "Failed get the endpoint port\n");
+		return -EINVAL;
+	}
+
+	/* Get the sampling edge from the endpoint. */
+	of_property_read_u32(ep, "pclk-sample", &dpi->pclk_sample);
+	of_node_put(ep);
+
+	dpi->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(dpi->pinctrl)) {
+		dpi->pinctrl = NULL;
+		dev_dbg(&pdev->dev, "Cannot find pinctrl!\n");
+	}
+	if (dpi->pinctrl) {
+		dpi->pins_gpio = pinctrl_lookup_state(dpi->pinctrl, "idle");
+		if (IS_ERR(dpi->pins_gpio)) {
+			dpi->pins_gpio = NULL;
+			dev_dbg(&pdev->dev, "Cannot find pinctrl idle!\n");
+		}
+		if (dpi->pins_gpio)
+			pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
+
+		dpi->pins_dpi = pinctrl_lookup_state(dpi->pinctrl, "active");
+		if (IS_ERR(dpi->pins_dpi)) {
+			dpi->pins_dpi = NULL;
+			dev_dbg(&pdev->dev, "Cannot find pinctrl active!\n");
+		}
+	}
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dpi->regs = devm_ioremap_resource(dev, mem);
 	if (IS_ERR(dpi->regs)) {
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
