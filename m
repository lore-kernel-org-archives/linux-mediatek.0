Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87CEC3DA66
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 10:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsUooYzB/XFcQJO1JT6BLvb7XbidadLz63hAu/SXJ+s=; b=u8BJA26Iy0VhOZBs8rbm60OpFO
	w0VdiPpiL9ce0cm+RCtD/K7nwYKwD+pmQHzKtFH/XR1av6mXVoAaQSA/zuVV5QyDpM1NbDO/88jSL
	2P3i7ggPnFBMZ2rf3WEZo499MYbvXkoXwRVO4IT+VRkpOFHSRs2hZK9HMpzdiDX/yxxUFXfA0VYlx
	uSxbjSkL1zCr5/eynFGCSLGfy2PesfpjPz+9I2ZEoAJ8fKS4O2CzMJtSxCC80XObVWzWzKLlDMTEi
	BA5BzZUlc9qQrs7EbBj0Nr3J/g/2lvmm4pWNyZo92UxZYXe9M76E8BMMSK1ehwv5lsbcA9Ddj4ARU
	l3ZiQ8Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZUWS-004x4g-1z;
	Fri, 25 Aug 2023 10:58:36 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZUW6-004wmh-1U;
	Fri, 25 Aug 2023 10:58:17 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RXGzj3jf7ztSJw;
	Fri, 25 Aug 2023 18:54:25 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 25 Aug
 2023 18:58:11 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<Michael.Hennerich@analog.com>, <heiko@sntech.de>,
	<yangyingliang@huawei.com>, <robh@kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 4/4] iio: frequency: adf4350: Use devm_clk_get_enabled() helper function
Date: Fri, 25 Aug 2023 18:57:46 +0800
Message-ID: <20230825105746.2999548-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825105746.2999548-1-ruanjinjie@huawei.com>
References: <20230825105746.2999548-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_035814_721959_312F18F3 
X-CRM114-Status: GOOD (  11.29  )
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

The devm_clk_get_enabled() helper:
    - calls devm_clk_get()
    - calls clk_prepare_enable() and registers what is needed in order to
      call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/iio/frequency/adf4350.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/frequency/adf4350.c b/drivers/iio/frequency/adf4350.c
index 85e289700c3c..22330d1768ff 100644
--- a/drivers/iio/frequency/adf4350.c
+++ b/drivers/iio/frequency/adf4350.c
@@ -491,20 +491,14 @@ static int adf4350_probe(struct spi_device *spi)
 	}
 
 	if (!pdata->clkin) {
-		clk = devm_clk_get(&spi->dev, "clkin");
+		clk = devm_clk_get_enabled(&spi->dev, "clkin");
 		if (IS_ERR(clk))
-			return -EPROBE_DEFER;
-
-		ret = clk_prepare_enable(clk);
-		if (ret < 0)
-			return ret;
+			return PTR_ERR(clk);
 	}
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
-	if (indio_dev == NULL) {
-		ret =  -ENOMEM;
-		goto error_disable_clk;
-	}
+	if (indio_dev == NULL)
+		return -ENOMEM;
 
 	st = iio_priv(indio_dev);
 
@@ -512,7 +506,7 @@ static int adf4350_probe(struct spi_device *spi)
 	if (!IS_ERR(st->reg)) {
 		ret = regulator_enable(st->reg);
 		if (ret)
-			goto error_disable_clk;
+			return ret;
 	}
 
 	spi_set_drvdata(spi, indio_dev);
@@ -564,8 +558,6 @@ static int adf4350_probe(struct spi_device *spi)
 error_disable_reg:
 	if (!IS_ERR(st->reg))
 		regulator_disable(st->reg);
-error_disable_clk:
-	clk_disable_unprepare(clk);
 
 	return ret;
 }
@@ -581,8 +573,6 @@ static void adf4350_remove(struct spi_device *spi)
 
 	iio_device_unregister(indio_dev);
 
-	clk_disable_unprepare(st->clk);
-
 	if (!IS_ERR(reg))
 		regulator_disable(reg);
 }
-- 
2.34.1


