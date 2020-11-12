Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8D8C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:41:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 378F720674
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:41:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZLqI/r3M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFnKmgf9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 378F720674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3LBE0jTONZbeP5AwL/KWRCbtGlXM4Oygh99Mt86fPw=; b=ZLqI/r3MHGw10CW3n2gXHCOx+j
	+qjPyCXrDIZtSWKwjv7KYcBGk3W/XkQPhxmu32y89AXuRXMjQj1rJYbxlvakFXyFjP/FMAJ3dUqYb
	p7RhA2a8vEwrPvhAxTHIi3OAjjhS5xAw66B6hgESGEnusS/3WPygwgmeIBnmZk3DKnShJX9jYpq04
	rYsMXdjJF8LVKVaM+633lqgVleuwjMqBbyP5jmVvTW2y9+R+fKEmA+56ecs7L1WBqR5rjxZCn5xwj
	SMLQM8UESZ0fUF5a99HEHquEDl4MUZql1U5RYn2qK2nGyYBXmRhAf8hf4wyggYNzbTy63cdu9oo08
	KU3wbIHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdA2l-0004zS-Ug; Thu, 12 Nov 2020 10:41:32 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdA1l-0004Vh-2s; Thu, 12 Nov 2020 10:40:31 +0000
Received: by mail-pg1-x542.google.com with SMTP id 62so3807519pgg.12;
 Thu, 12 Nov 2020 02:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kmywJl/aDPZ8Djl80CkqitFsv9eXGzrnwpaDbuS6TqE=;
 b=gFnKmgf9WUj00cMS+ML1cOc8wfX/uSoWwl1npaDaGB6/w+bJYpQP1GEExHFxBYRDJ8
 OUyKEZM5MUYTMTwv+15zMTr8NU0oQHME5hLX35qcv26dpNxM2s76dJ+cBolAZPk2V7V5
 mSO1NggUJYQEj//BvIc8FT6AojXPCk9o3ChwYPsSabc/ULf22J98clVnbSHg4OqudJjy
 nT6E1jmPwjsEAZ6Yz73F9P/1qyKE4KjsP3lbi7uvZhlaovqG1TVbfewNoKSgz9voL7Oi
 RVR09eP9lub18BeeiWg5tPinH75FKrnngj4Vi8aKIwCIVzZ0FFA5AVfAIADg8f77SQaE
 qWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kmywJl/aDPZ8Djl80CkqitFsv9eXGzrnwpaDbuS6TqE=;
 b=rh803tEiJrl19weWNEL2MDAqSoGFXbiGUXKwueowHW21xYH3mOv6eQrsgcDz3pX2EL
 RJtYDCNkAP7UUAcSk6Q4z7FN3w2DuSbaaN08mi4Mjy6KSKuuruh/T1KXOJDpAe1oyuql
 eJKvUQtX4h+zeCGFywypgOkAxGWbLUPo/9fVOzZVs6GpaPNtNfjw9Ll8Ent5wrHwW2R9
 sRZpEYaaHiMVAY2scRYwngvBxXczm7QYHggMo0W+2FSttodEooU04c5WcapkRXk+TyuK
 K78cH1pYtlFUHWXfpusd6t8F0U89B8ofQEunYPGUvpAMi3QklBgLdlNFi3jiHa3NEPf6
 clZQ==
X-Gm-Message-State: AOAM530IaIMyeKi+JGGf+CW+5/vf41+jx9MBT1m57kXqGZ9Su0KNgIMd
 VNoHSmuGwRSGrkZdKmDZaIbWjIfJmC4=
X-Google-Smtp-Source: ABdhPJzHWAVZ7MtKk3Zd+ft3me+B7GAg6xgzuPfUReSTRxvMIosr7MrbrA96N1FpTrBABqHgcEzG2w==
X-Received: by 2002:a63:d70b:: with SMTP id d11mr24597790pgg.94.1605177626791; 
 Thu, 12 Nov 2020 02:40:26 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:47a:a27:cf8e:7817:51df:a883])
 by smtp.gmail.com with ESMTPSA id
 mp16sm6414094pjb.13.2020.11.12.02.40.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Nov 2020 02:40:26 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v7 06/11] mfd: mt6360: Rename mt6360_pmu by mt6360
Date: Thu, 12 Nov 2020 18:39:53 +0800
Message-Id: <1605177598-23501-7-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_054030_584972_E35C6ABC 
X-CRM114-Status: GOOD (  15.71  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Rename mt6360_pmu by mt6360, because of including
not only PMU part, but also entire MT6360 IC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6360-core.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 332eb5d..f75122b 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -119,7 +119,7 @@
 #define MT6360_LDO6_PGB_EVT		126
 #define MT6360_LDO7_PGB_EVT		127
 
-static const struct regmap_irq mt6360_pmu_irqs[] =  {
+static const struct regmap_irq mt6360_irqs[] =  {
 	REGMAP_IRQ_REG_LINE(MT6360_CHG_TREG_EVT, 8),
 	REGMAP_IRQ_REG_LINE(MT6360_CHG_AICR_EVT, 8),
 	REGMAP_IRQ_REG_LINE(MT6360_CHG_MIVR_EVT, 8),
@@ -216,9 +216,9 @@ static int mt6360_pmu_handle_post_irq(void *irq_drv_data)
 		MT6360_PMU_IRQ_SET, MT6360_IRQ_RETRIG, MT6360_IRQ_RETRIG);
 }
 
-static struct regmap_irq_chip mt6360_pmu_irq_chip = {
-	.irqs = mt6360_pmu_irqs,
-	.num_irqs = ARRAY_SIZE(mt6360_pmu_irqs),
+static struct regmap_irq_chip mt6360_irq_chip = {
+	.irqs = mt6360_irqs,
+	.num_irqs = ARRAY_SIZE(mt6360_irqs),
 	.num_regs = MT6360_PMU_IRQ_REGNUM,
 	.mask_base = MT6360_PMU_CHG_MASK1,
 	.status_base = MT6360_PMU_CHG_IRQ1,
@@ -308,7 +308,7 @@ static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
 	MT6360_TCPC_SLAVEID,
 };
 
-static int mt6360_pmu_probe(struct i2c_client *client)
+static int mt6360_probe(struct i2c_client *client)
 {
 	struct mt6360_ddata *ddata;
 	unsigned int reg_data;
@@ -339,10 +339,10 @@ static int mt6360_pmu_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	mt6360_pmu_irq_chip.irq_drv_data = ddata;
+	mt6360_irq_chip.irq_drv_data = ddata;
 	ret = devm_regmap_add_irq_chip(&client->dev, ddata->regmap, client->irq,
 				       IRQF_TRIGGER_FALLING, 0,
-				       &mt6360_pmu_irq_chip, &ddata->irq_data);
+				       &mt6360_irq_chip, &ddata->irq_data);
 	if (ret) {
 		dev_err(&client->dev, "Failed to add Regmap IRQ Chip\n");
 		return ret;
@@ -374,7 +374,7 @@ static int mt6360_pmu_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused mt6360_pmu_suspend(struct device *dev)
+static int __maybe_unused mt6360_suspend(struct device *dev)
 {
 	struct i2c_client *i2c = to_i2c_client(dev);
 
@@ -384,7 +384,7 @@ static int __maybe_unused mt6360_pmu_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mt6360_pmu_resume(struct device *dev)
+static int __maybe_unused mt6360_resume(struct device *dev)
 {
 
 	struct i2c_client *i2c = to_i2c_client(dev);
@@ -395,25 +395,24 @@ static int __maybe_unused mt6360_pmu_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mt6360_pmu_pm_ops,
-			 mt6360_pmu_suspend, mt6360_pmu_resume);
+static SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
-static const struct of_device_id __maybe_unused mt6360_pmu_of_id[] = {
-	{ .compatible = "mediatek,mt6360_pmu", },
+static const struct of_device_id __maybe_unused mt6360_of_id[] = {
+	{ .compatible = "mediatek,mt6360", },
 	{},
 };
-MODULE_DEVICE_TABLE(of, mt6360_pmu_of_id);
+MODULE_DEVICE_TABLE(of, mt6360_of_id);
 
-static struct i2c_driver mt6360_pmu_driver = {
+static struct i2c_driver mt6360_driver = {
 	.driver = {
-		.name = "mt6360_pmu",
-		.pm = &mt6360_pmu_pm_ops,
-		.of_match_table = of_match_ptr(mt6360_pmu_of_id),
+		.name = "mt6360",
+		.pm = &mt6360_pm_ops,
+		.of_match_table = of_match_ptr(mt6360_of_id),
 	},
-	.probe_new = mt6360_pmu_probe,
+	.probe_new = mt6360_probe,
 };
-module_i2c_driver(mt6360_pmu_driver);
+module_i2c_driver(mt6360_driver);
 
 MODULE_AUTHOR("Gene Chen <gene_chen@richtek.com>");
-MODULE_DESCRIPTION("MT6360 PMU I2C Driver");
+MODULE_DESCRIPTION("MT6360 I2C Driver");
 MODULE_LICENSE("GPL v2");
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
