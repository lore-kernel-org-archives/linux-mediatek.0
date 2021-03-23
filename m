Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A9BC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 12:14:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CFA86197F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 12:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CFA86197F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KeQ9XaihfGxJt9LSgvC47QQfH1z84Ai3sfLoesoMWVo=; b=CTQAO7CyQq1V702a8yUyLgzNHF
	2u2dts/qCvGKAepxPtoi3/NihZG/YNh2rSE9woo/Velrh4aO9XlrXG5xnT+VbQ0HjO+zist52QDMc
	kCSrlwtozQ9/pwLCF2HRSWpVDNNR+4tGqfN3wy5KJpT1GIYgLFZ5Jth9MfRRw6fz0UHvz8HG5lmCn
	uNU8iEiHkRsyb2DZxojzhGJnFaIM4BlrQ+MmCx4IrmO04MHqh4iuufX3JykWaYqqzjzKjjZI3gjup
	MboLTr5hr8aUkSwk2nriF5fyzf4cqQCpmEGLfeYAyzeA3+yi3ThmIurLXEC45QlK3HDpPLlzzRoIJ
	T/XPIGzQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOfvG-00EvUu-Au; Tue, 23 Mar 2021 12:14:10 +0000
Received: from m12-18.163.com ([220.181.12.18])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOfuu-00EvLk-AJ; Tue, 23 Mar 2021 12:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=lgZGWNC1XXMn4nx0vh
 8cvzgDTRGH3nQjn8q/SECMFxQ=; b=l21sSqHrFcI92KgXb3FiJIhPxG8tySDgMI
 jELP5BNdqoaM50IMdpfUYy9Cz1bhccutW0YRvU3ty/5/w2TUy8Xs+2GNtHCq7ZDH
 4XdVNhAo2LilUuCVxso5DKtPQHErmDC0qntT85iVV0jIrRkLu96I1mK/AFDqVN94
 zRJdErZyU=
Received: from bf-rmnj-02.ccdomain.com (unknown [218.94.48.178])
 by smtp14 (Coremail) with SMTP id EsCowABnbuYp21lgAtAYaQ--.41742S2;
 Tue, 23 Mar 2021 20:12:31 +0800 (CST)
From: Jian Dong <dj0227@163.com>
To: matthias.bgg@gmail.com,
	agross@kernel.org,
	bjorn.andersson@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 huyue2@yulong.com, Jian Dong <dongjian@yulong.com>
Subject: [PATCH] regulator: Use IRQF_ONESHOT
Date: Tue, 23 Mar 2021 20:12:18 +0800
Message-Id: <1616501538-120724-1-git-send-email-dj0227@163.com>
X-Mailer: git-send-email 1.9.1
X-CM-TRANSID: EsCowABnbuYp21lgAtAYaQ--.41742S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF13Kw1Duw18GFyktw18Zrb_yoW5Zr1fpF
 4DZF97Cr40yFW8Xr43G34Iya45X3WjkasrA3yxJws3ZF1Fv3Zrtr1DArW5CF1rXrWkJw1a
 yrWqvw18GF18ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwjjgUUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: dgmqjjqx6rljoofrz/xtbB0g9e3VUMa88jEQAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_121349_766847_06C9C0FC 
X-CRM114-Status: GOOD (  12.15  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jian Dong <dongjian@yulong.com>

Fixes coccicheck error:

drivers/regulator/mt6360-regulator.c:388:8-33: ERROR:
drivers/regulator/pca9450-regulator.c:781:7-32: ERROR:
drivers/regulator/slg51000-regulator.c:480:8-33: ERROR:
drivers/regulator/qcom-labibb-regulator.c:364:8-33: ERROR:
Threaded IRQ with no primary handler requested without IRQF_ONESHOT

Signed-off-by: Jian Dong <dongjian@yulong.com>
---
 drivers/regulator/mt6360-regulator.c      | 4 ++--
 drivers/regulator/pca9450-regulator.c     | 2 +-
 drivers/regulator/qcom-labibb-regulator.c | 3 ++-
 drivers/regulator/slg51000-regulator.c    | 4 ++--
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/mt6360-regulator.c b/drivers/regulator/mt6360-regulator.c
index 15308ee..947350d 100644
--- a/drivers/regulator/mt6360-regulator.c
+++ b/drivers/regulator/mt6360-regulator.c
@@ -385,8 +385,8 @@ static int mt6360_regulator_irq_register(struct platform_device *pdev,
 			return irq;
 		}
 
-		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, irq_desc->handler, 0,
-						irq_desc->name, rdev);
+		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, irq_desc->handler,
+					IRQF_ONESHOT, irq_desc->name, rdev);
 		if (ret) {
 			dev_err(&pdev->dev, "Fail to request %s irq\n", irq_desc->name);
 			return ret;
diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index 2f7ee21..d4bc1c3 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -780,7 +780,7 @@ static int pca9450_i2c_probe(struct i2c_client *i2c,
 
 	ret = devm_request_threaded_irq(pca9450->dev, pca9450->irq, NULL,
 					pca9450_irq_handler,
-					(IRQF_TRIGGER_FALLING | IRQF_ONESHOT),
+					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 					"pca9450-irq", pca9450);
 	if (ret != 0) {
 		dev_err(pca9450->dev, "Failed to request IRQ: %d\n",
diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index de25e32..cac5fd5 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -362,7 +362,8 @@ static int qcom_labibb_set_ocp(struct regulator_dev *rdev)
 		return ret;
 
 	return devm_request_threaded_irq(vreg->dev, vreg->ocp_irq, NULL,
-					 qcom_labibb_ocp_isr, irq_flags,
+					 qcom_labibb_ocp_isr,
+					 irq_flags | IRQF_ONESHOT,
 					 ocp_irq_name, vreg);
 }
 
diff --git a/drivers/regulator/slg51000-regulator.c b/drivers/regulator/slg51000-regulator.c
index 75a941f..3f310ab 100644
--- a/drivers/regulator/slg51000-regulator.c
+++ b/drivers/regulator/slg51000-regulator.c
@@ -479,8 +479,8 @@ static int slg51000_i2c_probe(struct i2c_client *client)
 	if (chip->chip_irq) {
 		ret = devm_request_threaded_irq(dev, chip->chip_irq, NULL,
 						slg51000_irq_handler,
-						(IRQF_TRIGGER_HIGH |
-						IRQF_ONESHOT),
+						IRQF_TRIGGER_HIGH |
+						IRQF_ONESHOT,
 						"slg51000-irq", chip);
 		if (ret != 0) {
 			dev_err(dev, "Failed to request IRQ: %d\n",
-- 
1.9.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
