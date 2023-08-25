Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A95C7EE2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITnqum0ldaOD7JCwlunOtKVDwpbXjRy5OynsrJcYSzk=; b=Wyw8S0ejbUvf4+0gMW870BYpOR
	RmpIEkSu/1PqVXaGcYNv7+mYAmP/3xcsMM/rm7G0uCtJzbSd3xi1F3umiQH79hr/6NkSD4hQ7a2+M
	iX0ewHB6wlLYRmYT+4B8GBzQTAqT5jMx+ZcgH1oQpOnkZyGnniDxHx79l2UXmTOSUgCXFJV26dV7w
	v8mXY6vo+X2Djpx0164LwBRzH28a9ogsegkGdwGHK2Vzx/NDv3aTX6VciKbxn/O4mYkY4ZXdVL9M9
	2/HfyCmSYieOWqcvdS/Ku3H+BJDDSziNxeP4kQG1pfoZxstc8KzXdenyr3JyD2HaYRdV8DQPOLfhR
	9t5T2QIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZUWT-004x5j-1w;
	Fri, 25 Aug 2023 10:58:37 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZUW6-004wlw-1U;
	Fri, 25 Aug 2023 10:58:17 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RXH2C0VrkzfbnK;
	Fri, 25 Aug 2023 18:56:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 25 Aug
 2023 18:58:07 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<Michael.Hennerich@analog.com>, <heiko@sntech.de>,
	<yangyingliang@huawei.com>, <robh@kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 1/4] iio: adc: at91_adc: Use devm_clk_get_enabled() helper function
Date: Fri, 25 Aug 2023 18:57:43 +0800
Message-ID: <20230825105746.2999548-2-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20230825_035814_932418_9231824B 
X-CRM114-Status: GOOD (  11.04  )
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
 drivers/iio/adc/at91_adc.c | 38 ++++++++++----------------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index de6650f9c4b1..318e33ce22fb 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -1087,32 +1087,20 @@ static int at91_adc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	st->clk = devm_clk_get(&pdev->dev, "adc_clk");
+	st->clk = devm_clk_get_enabled(&pdev->dev, "adc_clk");
 	if (IS_ERR(st->clk)) {
-		dev_err(&pdev->dev, "Failed to get the clock.\n");
-		ret = PTR_ERR(st->clk);
-		goto error_free_irq;
-	}
-
-	ret = clk_prepare_enable(st->clk);
-	if (ret) {
 		dev_err(&pdev->dev,
 			"Could not prepare or enable the clock.\n");
+		ret = PTR_ERR(st->clk);
 		goto error_free_irq;
 	}
 
-	st->adc_clk = devm_clk_get(&pdev->dev, "adc_op_clk");
+	st->adc_clk = devm_clk_get_enabled(&pdev->dev, "adc_op_clk");
 	if (IS_ERR(st->adc_clk)) {
-		dev_err(&pdev->dev, "Failed to get the ADC clock.\n");
-		ret = PTR_ERR(st->adc_clk);
-		goto error_disable_clk;
-	}
-
-	ret = clk_prepare_enable(st->adc_clk);
-	if (ret) {
 		dev_err(&pdev->dev,
 			"Could not prepare or enable the ADC clock.\n");
-		goto error_disable_clk;
+		ret = PTR_ERR(st->adc_clk);
+		goto error_free_irq;
 	}
 
 	/*
@@ -1132,7 +1120,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 	if (!st->startup_time) {
 		dev_err(&pdev->dev, "No startup time available.\n");
 		ret = -EINVAL;
-		goto error_disable_adc_clk;
+		goto error_free_irq;
 	}
 	ticks = (*st->caps->calc_startup_ticks)(st->startup_time, adc_clk_khz);
 
@@ -1160,7 +1148,7 @@ static int at91_adc_probe(struct platform_device *pdev)
 	ret = at91_adc_channel_init(idev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Couldn't initialize the channels.\n");
-		goto error_disable_adc_clk;
+		goto error_free_irq;
 	}
 
 	init_waitqueue_head(&st->wq_data_avail);
@@ -1175,19 +1163,19 @@ static int at91_adc_probe(struct platform_device *pdev)
 		ret = at91_adc_buffer_init(idev);
 		if (ret < 0) {
 			dev_err(&pdev->dev, "Couldn't initialize the buffer.\n");
-			goto error_disable_adc_clk;
+			goto error_free_irq;
 		}
 
 		ret = at91_adc_trigger_init(idev);
 		if (ret < 0) {
 			dev_err(&pdev->dev, "Couldn't setup the triggers.\n");
 			at91_adc_buffer_remove(idev);
-			goto error_disable_adc_clk;
+			goto error_free_irq;
 		}
 	} else {
 		ret = at91_ts_register(idev, pdev);
 		if (ret)
-			goto error_disable_adc_clk;
+			goto error_free_irq;
 
 		at91_ts_hw_init(idev, adc_clk_khz);
 	}
@@ -1207,10 +1195,6 @@ static int at91_adc_probe(struct platform_device *pdev)
 	} else {
 		at91_ts_unregister(st);
 	}
-error_disable_adc_clk:
-	clk_disable_unprepare(st->adc_clk);
-error_disable_clk:
-	clk_disable_unprepare(st->clk);
 error_free_irq:
 	free_irq(st->irq, idev);
 	return ret;
@@ -1228,8 +1212,6 @@ static int at91_adc_remove(struct platform_device *pdev)
 	} else {
 		at91_ts_unregister(st);
 	}
-	clk_disable_unprepare(st->adc_clk);
-	clk_disable_unprepare(st->clk);
 	free_irq(st->irq, idev);
 
 	return 0;
-- 
2.34.1


