Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE57DC83F19
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Aug 2023 03:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIitH6KcY5JTqC4KhHMU3WnjHRUsX9d2Xfg8BSHYwOg=; b=BlAC8u1euaVV2uhQyMeJ9xsLcr
	Fch/XgjospykX/rUjp/gwuhmcaGyXKKZDVhJPwc/t01XUOf8ji6ctsrw5rHPOTHGcLk4NNc4+wEDG
	e1q+m76hXaj/LhI6E20IeIySHHJ51J3D6EXczu9x+VMeBA0UjhuopMzYLwwCYLtz1hn1xXC86djrb
	spVSb7MwOpdBRtATjvvRhoomqPM/kNLfG7c1sK8x+iFcnlYLN9qMOf4UUYyACEz7BYHHc0x7+P9CP
	r2uFldfAYpTEv0mCXJId2GjmRfPmfGTBDIsPVhtW5e8sxXGd02RldR+yi8isGU0uS2IrOiIIA/1kw
	ZjhN9iLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZkNl-006OUt-1A;
	Sat, 26 Aug 2023 03:54:41 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZkNX-006OSb-1G;
	Sat, 26 Aug 2023 03:54:30 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RXjXw1Ml6zJrp3;
	Sat, 26 Aug 2023 11:51:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Sat, 26 Aug
 2023 11:54:19 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <linux-iio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 2/2] iio: adc: mt6577_auxadc: Simplify with device managed function
Date: Sat, 26 Aug 2023 11:54:02 +0800
Message-ID: <20230826035402.3512033-3-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20230825_205427_779257_080D886D 
X-CRM114-Status: GOOD (  13.66  )
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

Add a device managed hook, via devm_add_action_or_reset() and
mt6577_power_off(), to power off on device detach.

Replace iio_device_register() by devm_iio_device_register() and remove
the mt6577_auxadc_remove() function used to unregister the device and
power off the device.

Remove platform_set_drvdata() from the probe function, since
platform_get_drvdata() is not used anymore.

Remove mt6577_auxadc_mod_reg() call from the probe function error path.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Jonathan Cameron <jic23@kernel.org>
---
 drivers/iio/adc/mt6577_auxadc.c | 40 +++++++++++++--------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
index 935cf560e238..c8f7bfa59146 100644
--- a/drivers/iio/adc/mt6577_auxadc.c
+++ b/drivers/iio/adc/mt6577_auxadc.c
@@ -246,6 +246,14 @@ static int mt6577_auxadc_suspend(struct device *dev)
 	return 0;
 }
 
+static void mt6577_power_off(void *data)
+{
+	struct mt6577_auxadc_device *adc_dev = data;
+
+	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
+			      0, MT6577_AUXADC_PDN_EN);
+}
+
 static int mt6577_auxadc_probe(struct platform_device *pdev)
 {
 	struct mt6577_auxadc_device *adc_dev;
@@ -286,31 +294,14 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
 			      MT6577_AUXADC_PDN_EN, 0);
 	mdelay(MT6577_AUXADC_POWER_READY_MS);
 
-	platform_set_drvdata(pdev, indio_dev);
-
-	ret = iio_device_register(indio_dev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to register iio device\n");
-		goto err_power_off;
-	}
-
-	return 0;
+	ret = devm_add_action_or_reset(&pdev->dev, mt6577_power_off, adc_dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to add action to managed power off: %d\n", ret);
 
-err_power_off:
-	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
-			      0, MT6577_AUXADC_PDN_EN);
-	return ret;
-}
-
-static int mt6577_auxadc_remove(struct platform_device *pdev)
-{
-	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
-	struct mt6577_auxadc_device *adc_dev = iio_priv(indio_dev);
-
-	iio_device_unregister(indio_dev);
-
-	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
-			      0, MT6577_AUXADC_PDN_EN);
+	ret = devm_iio_device_register(&pdev->dev, indio_dev);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to register iio device\n");
 
 	return 0;
 }
@@ -337,7 +328,6 @@ static struct platform_driver mt6577_auxadc_driver = {
 		.pm = pm_sleep_ptr(&mt6577_auxadc_pm_ops),
 	},
 	.probe	= mt6577_auxadc_probe,
-	.remove	= mt6577_auxadc_remove,
 };
 module_platform_driver(mt6577_auxadc_driver);
 
-- 
2.34.1


