Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854DD1088E65
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2026 02:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCvG5YIQQsu1GQqt1WOxfUKgVrGd+jt/hHA/QIxIuKY=; b=WhTqXcU3u6BZHL5sOGyT143tv9
	GtY2uU6Jujyx88pYyKedail8QUH79POFzW2+ZJaDZ730uDOdpFYnnLn7EHJm5gO/Rti25RnNhXbjr
	7cEoMJknQyp439k6n+rIdAFpWYQtEft0sprUmLpxf9Ix2DOcQFiixytWTW6wXIMcUiFfPq1txTqAK
	FPOO3qGTDP/Qr7a4I+LAJSZPjOGkgYQQrKLRZUSzXnpOC2/baoaq8Axk6Rhp9AkGnXEm/1f3P8jfo
	F0bFjkekxbQbNv7ATCLxS14jsllDEMTBVOGQQFcqW9wS69GfyWs5Caaq8UtoGOmrxyb+cC7PkTtp7
	ZxLGWlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32kc-00000009eJa-2ciO;
	Thu, 19 Mar 2026 02:04:42 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32kT-00000009e5o-28qv;
	Thu, 19 Mar 2026 02:04:35 +0000
X-UUID: f3535ac0233711f1a21c59e7364eecb8-20260319
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:a44ca008-d1ba-4472-b7ff-443f1045baa9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:01771772bd513303bc6f8e60329af1db,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f3535ac0233711f1a21c59e7364eecb8-20260319
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 518993943; Thu, 19 Mar 2026 10:04:23 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	broonie@kernel.org,
	Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v5 09/17] spi: sifive: Simplify clock handling with devm_clk_get_enabled()
Date: Thu, 19 Mar 2026 10:04:05 +0800
Message-Id: <73d0d8ecb4e1af5a558d6a7866c0f886d94fe3d1.1773885292.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773885292.git.xiaopei01@kylinos.cn>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_190434_231856_2C4310D1 
X-CRM114-Status: GOOD (  14.91  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Replace devm_clk_get() followed by clk_prepare_enable() with
devm_clk_get_enabled() for the bus clock. This reduces boilerplate code
and error handling, as the managed API automatically disables the clock
when the device is removed or if probe fails.

Remove the now-unnecessary clk_disable_unprepare() calls from the probe
error path and the remove callback. Adjust the error handling to use the
existing put_host label.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-sifive.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
index 6c7aba8befa0..54adbc057af6 100644
--- a/drivers/spi/spi-sifive.c
+++ b/drivers/spi/spi-sifive.c
@@ -312,7 +312,8 @@ static int sifive_spi_probe(struct platform_device *pdev)
 		goto put_host;
 	}
 
-	spi->clk = devm_clk_get(&pdev->dev, NULL);
+	/* Spin up the bus clock before hitting registers */
+	spi->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(spi->clk)) {
 		dev_err(&pdev->dev, "Unable to find bus clock\n");
 		ret = PTR_ERR(spi->clk);
@@ -342,13 +343,6 @@ static int sifive_spi_probe(struct platform_device *pdev)
 		goto put_host;
 	}
 
-	/* Spin up the bus clock before hitting registers */
-	ret = clk_prepare_enable(spi->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable bus clock\n");
-		goto put_host;
-	}
-
 	/* probe the number of CS lines */
 	spi->cs_inactive = sifive_spi_read(spi, SIFIVE_SPI_REG_CSDEF);
 	sifive_spi_write(spi, SIFIVE_SPI_REG_CSDEF, 0xffffffffU);
@@ -357,14 +351,14 @@ static int sifive_spi_probe(struct platform_device *pdev)
 	if (!cs_bits) {
 		dev_err(&pdev->dev, "Could not auto probe CS lines\n");
 		ret = -EINVAL;
-		goto disable_clk;
+		goto put_host;
 	}
 
 	num_cs = ilog2(cs_bits) + 1;
 	if (num_cs > SIFIVE_SPI_MAX_CS) {
 		dev_err(&pdev->dev, "Invalid number of spi targets\n");
 		ret = -EINVAL;
-		goto disable_clk;
+		goto put_host;
 	}
 
 	/* Define our host */
@@ -392,7 +386,7 @@ static int sifive_spi_probe(struct platform_device *pdev)
 			       dev_name(&pdev->dev), spi);
 	if (ret) {
 		dev_err(&pdev->dev, "Unable to bind to interrupt\n");
-		goto disable_clk;
+		goto put_host;
 	}
 
 	dev_info(&pdev->dev, "mapped; irq=%d, cs=%d\n",
@@ -401,13 +395,11 @@ static int sifive_spi_probe(struct platform_device *pdev)
 	ret = devm_spi_register_controller(&pdev->dev, host);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "spi_register_host failed\n");
-		goto disable_clk;
+		goto put_host;
 	}
 
 	return 0;
 
-disable_clk:
-	clk_disable_unprepare(spi->clk);
 put_host:
 	spi_controller_put(host);
 
@@ -421,7 +413,6 @@ static void sifive_spi_remove(struct platform_device *pdev)
 
 	/* Disable all the interrupts just in case */
 	sifive_spi_write(spi, SIFIVE_SPI_REG_IE, 0);
-	clk_disable_unprepare(spi->clk);
 }
 
 static int sifive_spi_suspend(struct device *dev)
-- 
2.25.1


