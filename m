Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28EBC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 11:05:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DC242070E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 11:05:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fydE6XcK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fH10izZg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DC242070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DP87OscCZn07uKKEw/hmtXHEnT0uuAoA86ULwd8LN6k=; b=fydE6XcKLdh/i7uWFHds1s41a/
	OeryDAvP7+Y7zOg3vPP+78HX3eis5ly5yCByNzeoMewhANgaX0UMcqgWkKadv5HYzKR1GwdC/FkZL
	vl3woPlSQtgioBJu1Tubzhl0tA5b5j9hFAP0Lx+BVTCb34LLtevvPzkUG7A1GCX4aCXC78T1ZFXPe
	Bhj8rxbLS/129Bx3yB61/WMfhJg9uQ0Wm7dG/Rgi2n5NUxVnlcNDSGK7CTx0fAkE5FC7ZTC1JWhof
	UnCVthrehIWg6EZzOJEckRA3jkRJ4fJvYVYVf5eZQ9o1TniGPg/POIXAA2UbrjTUFyUMkj9N/yZPT
	0CFXvUVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwOB1-0006lI-7D; Fri, 17 Jul 2020 11:05:15 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwOA2-0006Gd-Eg; Fri, 17 Jul 2020 11:04:16 +0000
Received: by mail-pf1-x443.google.com with SMTP id z3so5219827pfn.12;
 Fri, 17 Jul 2020 04:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZC8CEf+EoFs0JuZ28beB4kGU25SlgcLSyiI/XkWI7vI=;
 b=fH10izZg3UjDvv/gNh2pT+vpiH779ojMfu/U44y84PK6/bi82epZHVivyZjkh4ycO2
 ygTIa0sbnsLHJ9qnE/vBzS6GoPFCWqR9+QGej5EROc08BDcm2XOBljbBqMk8P0QD62+3
 rN1+XaapSLi7IZoyMXL3zN5fXwXrzH49x3pgv6OAa20vLg5OIlHTBv8bvJcj1z7d+aDC
 AcUtHNPJIPR6ugObvmhepBaL7z0D0PzUzS+Yqg0PWm3A406KHGqXsx0+y4+1bXQwEvbX
 Brlb3ajgSDMkhFidc2Nc68ImqawZ8RZBUSpVW2E2HJTO4S6nP21kykxURYwdueeHPJUd
 fxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZC8CEf+EoFs0JuZ28beB4kGU25SlgcLSyiI/XkWI7vI=;
 b=i1APz3SIDWxuk9vQIF+jbwAnVXcYAa3HjEKvPCgMEiuShtqsdYGagSjRuyMK93H42F
 sbJjxO5IZ/d+kZ/nR/yZqtG5J8+lQMqqiqDHhAQgzPrE4HBLTeAYSy/PJYLDuaJyMUbe
 h/pf43P772k/PJG+Vi/2HL/9ZhI6OLE1NqWwXCGaAJ1QDnP03JHyQP3HygbG3lzDWRXM
 UO+c6YXK7KsaFIQFgKOKiKmmgOqu3jSeIOXqZ/rx6WmaeSlpiVOY6LkKruOo7/5bRoso
 P0oD/6pUe1DR/o4cGkNZcNKuj5oMENnJHFftmscPGGoDk28To8jJcrxl0mA5dlR5UeiQ
 RVoQ==
X-Gm-Message-State: AOAM5324gYqp8o75J0hVv+zSoclARcUNUUjJXlq5Wo8YwpaNRKuitErT
 oIze4YE7Ujb2g5FgryxH5og=
X-Google-Smtp-Source: ABdhPJz9NU6fjpXPM0iOXDH11noDSJVravEXE/247fNVBM3MwNWhnXafc6nHM2mnOWG0wUM7a0hC1w==
X-Received: by 2002:a63:6d48:: with SMTP id i69mr8195450pgc.354.1594983852703; 
 Fri, 17 Jul 2020 04:04:12 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:469:ae36:984e:c073:9d0b:7c09])
 by smtp.gmail.com with ESMTPSA id o26sm7619183pfp.219.2020.07.17.04.04.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Jul 2020 04:04:12 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 6/9] mfd: mt6360: Rename mt6360_pmu by mt6360
Date: Fri, 17 Jul 2020 19:03:28 +0800
Message-Id: <1594983811-25908-7-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_070415_806035_3D421473 
X-CRM114-Status: GOOD (  13.14  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
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
---
 drivers/mfd/mt6360-core.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 62bae1a..5dfc13e 100644
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
 	struct mt6360_data *data;
 	unsigned int reg_data;
@@ -339,10 +339,10 @@ static int mt6360_pmu_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	mt6360_pmu_irq_chip.irq_drv_data = data;
+	mt6360_irq_chip.irq_drv_data = data;
 	ret = devm_regmap_add_irq_chip(&client->dev, data->regmap, client->irq,
 				       IRQF_TRIGGER_FALLING, 0,
-				       &mt6360_pmu_irq_chip, &data->irq_data);
+				       &mt6360_irq_chip, &data->irq_data);
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
