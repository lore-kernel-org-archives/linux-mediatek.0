Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFEFC83F17
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Aug 2023 03:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdJcGwug2POMglPP94woL6q8symMmtSaW/oqnHvM0KU=; b=XGXsCHELsbAbmiLnWl5oeyrrgK
	62e18U5E9L3UWsMzhSVsVi3eSxRMfaPF3KuwARXOpa40T5XaWHGPc8ya52wgP1aYlaZWitavPGqkZ
	tw5QBWFeKg9Of1645+sVA4JB7EqJH8hSpsyShASrr8MWENRXNzOJVdyuzAzyosgPNL6xqbpegcUW1
	BlR0qyxVZ9era70YKCUfHqH3hR19QfNaYZc7h/GRgdUiPgGn84IX9kx5A7ZYXFl68eiiu5mW/FobU
	uRPgftlio6rH6jRfPpGwww/QPpy/+DtoXhA5vYjeg92DbEuPCUq7fQPRFjjE3YfYmabSueOi1d6aT
	AuQGtfkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZkNk-006OUQ-1n;
	Sat, 26 Aug 2023 03:54:40 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZkNX-006OSa-1G;
	Sat, 26 Aug 2023 03:54:29 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RXjXv0kBczJrp1;
	Sat, 26 Aug 2023 11:51:11 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Sat, 26 Aug
 2023 11:54:18 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <linux-iio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 1/2] iio: adc: mt6577_auxadc: Simplify with dev_err_probe()
Date: Sat, 26 Aug 2023 11:54:01 +0800
Message-ID: <20230826035402.3512033-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230826035402.3512033-1-ruanjinjie@huawei.com>
References: <20230826035402.3512033-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_205427_623446_5F8DAF43 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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

Use the dev_err_probe() helper to simplify error handling during probe.
This also handle scenario, when EDEFER is returned and useless error
is printed.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Jonathan Cameron <jic23@kernel.org>
---
 drivers/iio/adc/mt6577_auxadc.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
index ea42fd7a8c99..935cf560e238 100644
--- a/drivers/iio/adc/mt6577_auxadc.c
+++ b/drivers/iio/adc/mt6577_auxadc.c
@@ -265,22 +265,18 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
 	indio_dev->num_channels = ARRAY_SIZE(mt6577_auxadc_iio_channels);
 
 	adc_dev->reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(adc_dev->reg_base)) {
-		dev_err(&pdev->dev, "failed to get auxadc base address\n");
-		return PTR_ERR(adc_dev->reg_base);
-	}
+	if (IS_ERR(adc_dev->reg_base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(adc_dev->reg_base),
+				     "failed to get auxadc base address\n");
 
 	adc_dev->adc_clk = devm_clk_get_enabled(&pdev->dev, "main");
-	if (IS_ERR(adc_dev->adc_clk)) {
-		dev_err(&pdev->dev, "failed to enable auxadc clock\n");
-		return PTR_ERR(adc_dev->adc_clk);
-	}
+	if (IS_ERR(adc_dev->adc_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(adc_dev->adc_clk),
+				     "failed to enable auxadc clock\n");
 
 	adc_clk_rate = clk_get_rate(adc_dev->adc_clk);
-	if (!adc_clk_rate) {
-		dev_err(&pdev->dev, "null clock rate\n");
-		return -EINVAL;
-	}
+	if (!adc_clk_rate)
+		return dev_err_probe(&pdev->dev, -EINVAL, "null clock rate\n");
 
 	adc_dev->dev_comp = device_get_match_data(&pdev->dev);
 
-- 
2.34.1


