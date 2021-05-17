Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044EDC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:35:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DE5761263
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DE5761263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KPiSd/KZ87s+RZ4nJnPgiFDtJOw/+CK6xAXdFajnDGc=; b=Z+bnBQigdqnrhaEzYqmCZb5XV
	Ijh20yasa0hIhgkWcze4Uay5xtGUGu4v2FALipvqUaoW0R25QJ8+Ed53ehdvCxKWpOeMUF/bQZ2U4
	TSk3X1vBg9hPQBhgDeQ4yTkwLgQIwkV7Vc+fZ0fc/Km4R/zA0xFIroVOkj1jnH/1u4GqqzBAllJJ0
	t5uasR1UhJiFtvOYJ7LjOnjja8pjZzjZWB+OZ7x1aWN51aaimGxIVVv1OqsP7yCfIt5/oOkgN9Ygp
	JXzrgrbKjaPpl86dAd3nK9XrYwBmngmlpr5g3t3Nhsgym8jeTeDGzeN3qQKl7p9TrEhKQrAIQQ7W0
	TyfpHJl/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lih97-00Ffaq-VK; Mon, 17 May 2021 17:35:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7c-00FfBd-6o; Mon, 17 May 2021 17:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=0qfc/4x5NUlqMKF6YV5bXi/lMGhfFwLsCdX8LnCxHAU=; b=nugEQW9guHz8rbbx+1efD9/kBR
 9wK8I56/n1F22ob0GfCiJnYstL/698bJRYKuiV9xH6VWHKCarbuF9x9xIbyAz8cLtIdcstWRoyxSx
 SKAm2Knr7ri42xfyeGerIiyDNtS8Ua2UDzccg5m6pBYlvVjJJRSdxx5dovrXf7BanMrk+Kwfx21lK
 FZtJMQ0vL8fRFZxu8h0aaI0ytDVeYDd2Fo/pgGrZ3wAJ+ytGekLrAnYQdUwJtseNvOUMg/EJ0ZzoX
 LaYgtayCObJ97hudUZPCvXPVhMBs9bjB4X7OEmwWqnBbf0a7v9jaAQak1fTpONaf4a+oFz/gGJu6w
 zpPOBSzg==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7Z-00E1Kq-Hg; Mon, 17 May 2021 17:33:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id b21so3589405plz.0;
 Mon, 17 May 2021 10:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0qfc/4x5NUlqMKF6YV5bXi/lMGhfFwLsCdX8LnCxHAU=;
 b=iX+ssj3xwZLEAW+CObvf35JxI7MqutPNzS4sjwIoFtE0WYnrSJxDeyxw6EqzhvNI7C
 NqJVlMPTrLUrXfWLyQBNPcUgtUVFGrGJ3hUky4g4oiF0lIsrrMtgnMM5E/wc1oyO+Wbb
 ayKPujkKNdg5132uZTb+LlMw6BZQBV0lqDQgCVHEbWqyeNQqfRh+OkL/hcAXcMa9JxRz
 UmVGc+w2SIDkA/52zV7cyiExYvg631+OTBzCOKV3dWZEfOudNMkYfCR65s201MY5XEYz
 esfdgM9EhSYmot1PCaFWuv2JVGQyBAY+K7ODnNuzc7adocHaZii6GM7wk32GlMRubfUd
 9Z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0qfc/4x5NUlqMKF6YV5bXi/lMGhfFwLsCdX8LnCxHAU=;
 b=awm5+QF425VbntL9EWHRHDu/UXqWfg2klUKPbI/FcxXvKoWD/70RRL6nz+ANDOggRs
 RJ0q5X0Fxv/KKPKviV6t37XBz9nG03NYQlm4lQipTy8o/SGyWK07kLsTxn5PQLf9+ilN
 NFCdK96inSGgeDuORY9ZKXvk7jTJ90MM6FInpxQlg4vKzboHxWiKbTN0QY3XQg0BdeXc
 hO4dGHSWi+cvCyL/NiaEQHihUvJthfM9IUmsDrWmoLckeyTKJzSgz5yITooQTMDWZs2q
 /vJQ66aiBqqaulGx5EIUGl4d3eDl5W8MsX6RKHhwPdT4PnO1qYk0/MX5qajPFO75bCWo
 G0Mg==
X-Gm-Message-State: AOAM532VAJGDDqFoeff2ZwHqFuF44WgcGdqrpR43XPU9rB5SHdtRaT4H
 bA743Yezg4Ce9Sk9T66b/ZY=
X-Google-Smtp-Source: ABdhPJwm5NzIiZyyDDJzX7EMmWURFlbn6tp+cx0QVoBLPJSCbM4AiMEuRdEU2G3mWdQJE9LnV7S+SQ==
X-Received: by 2002:a17:90b:1e43:: with SMTP id
 pi3mr563730pjb.51.1621272817037; 
 Mon, 17 May 2021 10:33:37 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:47e:c24d:6c72:a52:2c8:7df1])
 by smtp.gmail.com with ESMTPSA id
 c12sm10358296pfr.154.2021.05.17.10.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:33:36 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com
Subject: [PATCH v8 05/10] mfd: mt6360: Rename mt6360_pmu_data by mt6360_ddata
Date: Tue, 18 May 2021 01:33:09 +0800
Message-Id: <20210517173314.140912-6-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
References: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_103337_609522_BEF3DAB5 
X-CRM114-Status: GOOD (  15.73  )
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
 drivers/mfd/mt6360-core.c  | 44 +++++++++++++++++++-------------------
 include/linux/mfd/mt6360.h |  2 +-
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 3553c7045829..6428160ef19d 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -211,9 +211,9 @@ static const struct regmap_irq mt6360_pmu_irqs[] =  {
 
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
index 72edf1352229..81bca7c2ad4d 100644
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
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
