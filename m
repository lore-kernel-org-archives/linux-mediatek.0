Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE89C55178
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:10:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1695120735
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:10:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j1HT1D0Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjYXv/C0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1695120735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzNkaQ5W9IxgtPPUaAsVgOnpk1xcRGLsyVDMmexeNCU=; b=j1HT1D0ZNCpcYn0OMmhp8enQJI
	jaVW9jR2Tu1Ih+HOaPb9ZFDGzoSkt3NctP/s9mN+lmL+bZR6wsUStSQBbR324OFAfsMjcA1+K/fng
	glfTvQOgkMmd0J9a/L2DXllvw4OnlmX5kXWaa95y5bg+/pMGpxWYcaQEmY7sBM8jiJRCXsukt6mGh
	e4jpTr94D9BR05UzLbESOeGUen3bqdfOR588RgOMO359eXOzsMd+swClzQhyI30aY0THaY7zIFaYo
	oVE6MZ65nSvY1t0dvH50pSKH2B4Oc/lbUBgngE8CFrWUWf2/2GFRRa2KdfNhqoMzVlg/hrO5e2hhO
	zHKVlQNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kayxJ-0000ss-MD; Fri, 06 Nov 2020 10:26:53 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaywX-0000Po-F7; Fri, 06 Nov 2020 10:26:06 +0000
Received: by mail-pg1-x542.google.com with SMTP id i26so603156pgl.5;
 Fri, 06 Nov 2020 02:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0+hwdde/9osqDF4pD01phKptpQ7KgGy01PbwrfMbdCM=;
 b=NjYXv/C0HRerNGBwOZWOLTV8zHvOAsU7BGKV1aOnjVXydCW1Bam7ZdptMj5e1L+R/z
 9+dwK9e1N5/Qp+AAMlg16LOZWAjT17nNbVZ72nEpau1Hj73VNVDnI5Hu1xUjby4ZRrN5
 U/Ja5PfPCmT+3hhTqM+9OrlCwR/NzsTEzzD/y3IqgOSMS9QOKZLHDi5+fCPpn/pLMN1m
 v+lu72nWmHO92wFeFO2J7m1/XN8dptiDI2rmpAAAJVK3DNwDbSHXkZ4lKukKGYmJcrc4
 2+b/eOmMCR7WNCmROhMBZ/ffJDQUWk6SJ+NtLxwhPBjdRyU0oyH/QLljaRJV7KfmMYzh
 YCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0+hwdde/9osqDF4pD01phKptpQ7KgGy01PbwrfMbdCM=;
 b=bwJmXgBUbzHduSJqFI9EuINoyPFuntn7N1ssFKtisl4wV+a/eAq1QWMtUpOdNWhdBO
 idWeNmkA7rcBeyXyzwbncfgqLX3oyprx1uKElLIMtVo3E9O8eNaqhfLbjhA1J+OPmmHk
 64ZOKFW3nz+RoXOwHbPIb8ckpDfGM0V5qtHV79NL+8PfUVFshLiVz5ARZGx7f+TvpDpw
 rrWV0LI63x172l7SF9om2E4BADy28b2DHBVQbxMnXqABX8vT6LRS1JlBbH4B+AJPKZQ6
 zZ1gsQ+Fj+jWx2aJYDHgTLQgC8fo5MOKLOYn3FyNeUexbqpbeSK6k6Zc3RLZYeurwV1z
 TfyQ==
X-Gm-Message-State: AOAM531Y9+3T1ntliw9d8rcWpO6Db1Kdk4dF3f8D5ZJ5bR3FW/MY5rRZ
 VBeBnKMIax7bOYEHeWVGFy1nXeAVKP8=
X-Google-Smtp-Source: ABdhPJzhoRGHO5//mkhfPegiTNw7dFDkiQtKRmqRds7nu6UIfTPPy7YmyGeksDXcozZCHkh0RmCXBA==
X-Received: by 2002:a65:6283:: with SMTP id f3mr1184440pgv.254.1604658363727; 
 Fri, 06 Nov 2020 02:26:03 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:57a:6823:8ab3:4b5d:4c53:f39b])
 by smtp.gmail.com with ESMTPSA id g3sm1260633pgl.55.2020.11.06.02.26.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Nov 2020 02:26:03 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v6 05/11] mfd: mt6360: Rename mt6360_pmu_data by mt6360_ddata
Date: Fri,  6 Nov 2020 17:53:46 +0800
Message-Id: <1604656432-10215-6-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_052605_609399_92CF0FBA 
X-CRM114-Status: GOOD (  17.98  )
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

Rename mt6360_pmu_data by mt6360_ddata because of including
not only PMU part, but also entire MT6360 IC.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6360-core.c  | 44 ++++++++++++++++++++++----------------------
 include/linux/mfd/mt6360.h |  2 +-
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 5119e51..332eb5d 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -210,9 +210,9 @@ static const struct regmap_irq mt6360_pmu_irqs[] =  {
 
 static int mt6360_pmu_handle_post_irq(void *irq_drv_data)
 {
-	struct mt6360_pmu_data *mpd = irq_drv_data;
+	struct mt6360_ddata *ddata = irq_drv_data;
 
-	return regmap_update_bits(mpd->regmap,
+	return regmap_update_bits(ddata->regmap,
 		MT6360_PMU_IRQ_SET, MT6360_IRQ_RETRIG, MT6360_IRQ_RETRIG);
 }
 
@@ -310,61 +310,61 @@ static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
 
 static int mt6360_pmu_probe(struct i2c_client *client)
 {
-	struct mt6360_pmu_data *mpd;
+	struct mt6360_ddata *ddata;
 	unsigned int reg_data;
 	int i, ret;
 
-	mpd = devm_kzalloc(&client->dev, sizeof(*mpd), GFP_KERNEL);
-	if (!mpd)
+	ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
 		return -ENOMEM;
 
-	mpd->dev = &client->dev;
-	i2c_set_clientdata(client, mpd);
+	ddata->dev = &client->dev;
+	i2c_set_clientdata(client, ddata);
 
-	mpd->regmap = devm_regmap_init_i2c(client, &mt6360_pmu_regmap_config);
-	if (IS_ERR(mpd->regmap)) {
+	ddata->regmap = devm_regmap_init_i2c(client, &mt6360_pmu_regmap_config);
+	if (IS_ERR(ddata->regmap)) {
 		dev_err(&client->dev, "Failed to register regmap\n");
-		return PTR_ERR(mpd->regmap);
+		return PTR_ERR(ddata->regmap);
 	}
 
-	ret = regmap_read(mpd->regmap, MT6360_PMU_DEV_INFO, &reg_data);
+	ret = regmap_read(ddata->regmap, MT6360_PMU_DEV_INFO, &reg_data);
 	if (ret) {
 		dev_err(&client->dev, "Device not found\n");
 		return ret;
 	}
 
-	mpd->chip_rev = reg_data & CHIP_REV_MASK;
-	if (mpd->chip_rev != CHIP_VEN_MT6360) {
+	ddata->chip_rev = reg_data & CHIP_REV_MASK;
+	if (ddata->chip_rev != CHIP_VEN_MT6360) {
 		dev_err(&client->dev, "Device not supported\n");
 		return -ENODEV;
 	}
 
-	mt6360_pmu_irq_chip.irq_drv_data = mpd;
-	ret = devm_regmap_add_irq_chip(&client->dev, mpd->regmap, client->irq,
+	mt6360_pmu_irq_chip.irq_drv_data = ddata;
+	ret = devm_regmap_add_irq_chip(&client->dev, ddata->regmap, client->irq,
 				       IRQF_TRIGGER_FALLING, 0,
-				       &mt6360_pmu_irq_chip, &mpd->irq_data);
+				       &mt6360_pmu_irq_chip, &ddata->irq_data);
 	if (ret) {
 		dev_err(&client->dev, "Failed to add Regmap IRQ Chip\n");
 		return ret;
 	}
 
-	mpd->i2c[0] = client;
+	ddata->i2c[0] = client;
 	for (i = 1; i < MT6360_SLAVE_MAX; i++) {
-		mpd->i2c[i] = devm_i2c_new_dummy_device(&client->dev,
+		ddata->i2c[i] = devm_i2c_new_dummy_device(&client->dev,
 							client->adapter,
 							mt6360_slave_addr[i]);
-		if (IS_ERR(mpd->i2c[i])) {
+		if (IS_ERR(ddata->i2c[i])) {
 			dev_err(&client->dev,
 				"Failed to get new dummy I2C device for address 0x%x",
 				mt6360_slave_addr[i]);
-			return PTR_ERR(mpd->i2c[i]);
+			return PTR_ERR(ddata->i2c[i]);
 		}
-		i2c_set_clientdata(mpd->i2c[i], mpd);
+		i2c_set_clientdata(ddata->i2c[i], ddata);
 	}
 
 	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
 				   mt6360_devs, ARRAY_SIZE(mt6360_devs), NULL,
-				   0, regmap_irq_get_domain(mpd->irq_data));
+				   0, regmap_irq_get_domain(ddata->irq_data));
 	if (ret) {
 		dev_err(&client->dev,
 			"Failed to register subordinate devices\n");
diff --git a/include/linux/mfd/mt6360.h b/include/linux/mfd/mt6360.h
index 72edf13..81bca7c 100644
--- a/include/linux/mfd/mt6360.h
+++ b/include/linux/mfd/mt6360.h
@@ -21,7 +21,7 @@ enum {
 #define MT6360_LDO_SLAVEID	0x64
 #define MT6360_TCPC_SLAVEID	0x4E
 
-struct mt6360_pmu_data {
+struct mt6360_ddata {
 	struct i2c_client *i2c[MT6360_SLAVE_MAX];
 	struct device *dev;
 	struct regmap *regmap;
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
