Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B462FC4BA0A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 05:42:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E77A222C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 05:42:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rJZmbrpr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="X16CoxP/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E77A222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hxBHf6XV9KAMgm8lYQacHVAkHtRWtUmbyAmJN9HNCQ=; b=rJZmbrprmH8DDB
	APCyr53huv4w3TjJrtHLTAqDMkPO8U/GKjldeY5He4CaWabBnCrY+8CWr3wppLG2fhGoHyGNdzt2P
	PxIn/IAp4ev/9g5BbwaF0aEmORgnjcLhh+CTPYZnF6Cj6u2EDfzp+/K5oMJ30NawFJAzy51rZRm3z
	8bv8mxa2oKxnLUw2TslZY/HeEBaYueVz+zuzOeEJA/rSX5+Qpir0E4Krr344JK+3Lq2Fg8S7tA1PD
	1rEP7vhBeGlhRu/kTOIrzgmEo4vshnI/UsFSkOQalLPklvNPyzBR2lPAaZd5obhjl+QjFurlgXgZ+
	jZ/AeVEut24K7QrTfJEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6pSu-0006K8-FH; Wed, 26 Feb 2020 05:42:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6pRf-0005I9-MI; Wed, 26 Feb 2020 05:41:21 +0000
X-UUID: 9b759bf8269644f09299c868443007c1-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=x7STFyQuO/xyu34ZYtZeHjDau3Np4ocLuWWyy6b0cAI=; 
 b=X16CoxP/dyFBzfjosrCDBmmZNMDYmZCpIhNWGFH4XJ0aTsHA+9gCNrsq5wFoNbHOHGxDfomaJEnezXW5C3vzR7JT02oNu01/7VpioFj2wOHes8lWZ/LZMfsmNqK3DGzcPPFmPMyK1cAIrWCgBB4FxrzKfJF+fnabxQpdtPIEYO8=;
X-UUID: 9b759bf8269644f09299c868443007c1-20200225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1341879466; Tue, 25 Feb 2020 21:41:12 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 21:33:34 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 26 Feb 2020 13:28:53 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 26 Feb 2020 13:31:28 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 5/5] drm/mediatek: set dpi pin mode to gpio low to avoid
 leakage current
Date: Wed, 26 Feb 2020 13:32:38 +0800
Message-ID: <20200226053238.31646-6-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200226053238.31646-1-jitao.shi@mediatek.com>
References: <20200226053238.31646-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FE2D5650BCB40F1CA1B9C24BBECF52B836DCD3F5FD44BDAEC5892942C903FDF62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_214119_812837_BEEA5B34 
X-CRM114-Status: GOOD (  10.24  )
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
 drivers/gpu/drm/mediatek/mtk_dpi.c | 31 ++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index db3272f7a4c4..ae4c6308bb68 100644
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
 
@@ -719,6 +730,26 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	of_property_read_u32_index(dev->of_node, "pclk-sample", 1,
 				   &dpi->pclk_sample);
 
+	dpi->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(dpi->pinctrl)) {
+		dpi->pinctrl = NULL;
+		dev_dbg(&pdev->dev, "Cannot find pinctrl!\n");
+	}
+	if (dpi->pinctrl) {
+		dpi->pins_gpio = pinctrl_lookup_state(dpi->pinctrl, "gpiomode");
+		if (IS_ERR(dpi->pins_gpio)) {
+			dpi->pins_gpio = NULL;
+			dev_dbg(&pdev->dev, "Cannot find pinctrl gpiomode!\n");
+		}
+		if (dpi->pins_gpio)
+			pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
+
+		dpi->pins_dpi = pinctrl_lookup_state(dpi->pinctrl, "dpimode");
+		if (IS_ERR(dpi->pins_dpi)) {
+			dpi->pins_dpi = NULL;
+			dev_dbg(&pdev->dev, "Cannot find pinctrl dpimode!\n");
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
