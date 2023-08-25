Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C7DC71133
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+v2kcxcFnQVc3axSfx5IzafGqtt/MuaHgDAJguCbHlo=; b=DUgCfUWbWmgfNfvgKPIMmi/GAi
	2nWsjfvrpjWPkscO/PBEjXq1Lz4oI9b2cXUMXQejh1QDlcCKoJ3yJIO47ILe/SUuOgY+ioe0y4/hz
	KapNfhzyleTFGz7aFcqLkc4arQo9cPC6h2U5sow7Ipr7s3hj36mtpu2stPF+iMobomC6rvhvCBxFA
	/0NGXpkLJmW6Ic9OrsBihxKonWV3zXnUZrZMWRP3y62usAbjsM+ngPzCKzB959EObBIZUXv6WhwTE
	I79wLIYCyYe6ACnpzWVGUKW6EiG3fMLxCzCQSJRvgNNisFKo9jiX5iaxNjEXxQ8K9YjCYDkMPD5wL
	MKbBj3fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZUWB-004ws1-1p;
	Fri, 25 Aug 2023 10:58:19 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZUW6-004wlF-0E;
	Fri, 25 Aug 2023 10:58:16 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RXH1L0wWPzVk5Z;
	Fri, 25 Aug 2023 18:55:50 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 25 Aug
 2023 18:58:08 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<Michael.Hennerich@analog.com>, <heiko@sntech.de>,
	<yangyingliang@huawei.com>, <robh@kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 2/4] iio: adc: mt6577_auxadc: Use devm_clk_get_enabled() helper function
Date: Fri, 25 Aug 2023 18:57:44 +0800
Message-ID: <20230825105746.2999548-3-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20230825_035814_338559_73B3AD0D 
X-CRM114-Status: UNSURE (   9.73  )
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

The devm_clk_get_enabled() helper:
    - calls devm_clk_get()
    - calls clk_prepare_enable() and registers what is needed in order to
      call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/iio/adc/mt6577_auxadc.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
index 0e134777bdd2..ea42fd7a8c99 100644
--- a/drivers/iio/adc/mt6577_auxadc.c
+++ b/drivers/iio/adc/mt6577_auxadc.c
@@ -270,23 +270,16 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
 		return PTR_ERR(adc_dev->reg_base);
 	}
 
-	adc_dev->adc_clk = devm_clk_get(&pdev->dev, "main");
+	adc_dev->adc_clk = devm_clk_get_enabled(&pdev->dev, "main");
 	if (IS_ERR(adc_dev->adc_clk)) {
-		dev_err(&pdev->dev, "failed to get auxadc clock\n");
-		return PTR_ERR(adc_dev->adc_clk);
-	}
-
-	ret = clk_prepare_enable(adc_dev->adc_clk);
-	if (ret) {
 		dev_err(&pdev->dev, "failed to enable auxadc clock\n");
-		return ret;
+		return PTR_ERR(adc_dev->adc_clk);
 	}
 
 	adc_clk_rate = clk_get_rate(adc_dev->adc_clk);
 	if (!adc_clk_rate) {
-		ret = -EINVAL;
 		dev_err(&pdev->dev, "null clock rate\n");
-		goto err_disable_clk;
+		return -EINVAL;
 	}
 
 	adc_dev->dev_comp = device_get_match_data(&pdev->dev);
@@ -310,8 +303,6 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
 err_power_off:
 	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
 			      0, MT6577_AUXADC_PDN_EN);
-err_disable_clk:
-	clk_disable_unprepare(adc_dev->adc_clk);
 	return ret;
 }
 
@@ -325,8 +316,6 @@ static int mt6577_auxadc_remove(struct platform_device *pdev)
 	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
 			      0, MT6577_AUXADC_PDN_EN);
 
-	clk_disable_unprepare(adc_dev->adc_clk);
-
 	return 0;
 }
 
-- 
2.34.1


