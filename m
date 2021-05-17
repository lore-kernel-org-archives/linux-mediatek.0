Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78231C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:36:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1FE161285
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1FE161285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=os2+jHC/PEUITOyj6RTeM29ywrLnNLy12k0f180bnas=; b=eJQf5vqTqCm91Y6gcGyGd0l7+
	f8LIS6vCuaM7KyIpVbJtOmqMNv/e1qL1WV1OkzYfP98VzaxhOg0f4zQyHCfeIdI7pPo8Q8CrUPjGP
	a9A3S1s48LA6Q4YOLT9+29yHw7v+mbUuIg81ku8tG1D+u3ORauwevfA7Hj9rBnT8N+3KkY2IEtvvY
	FWFsXQ6eFeD1NffGD0ogQQtUopfEAh04yR++FyTbxDE4nKn4eebXaY/sQRh7+/tm9Y5FKH3JDHy2y
	1syrQPIX8Y3Jk5TKjzKDu0WKEUSaErdjLLG8J78hYulbAZ+LVQZKtFgXGqPumRePtsZdX20jUCFc3
	Vy/6OEJYg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lih9v-00FfzG-Vv; Mon, 17 May 2021 17:36:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7i-00FfCX-0m; Mon, 17 May 2021 17:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=U2LUwkBCn/UHUIUpN0tGBxlVhEOoLXnQJ9JqYqN767U=; b=IJ5QJmCcrYhJzB7J0qX5uWtrYF
 wb48m6z+9Wa7U5XaKJeNp51GR1C5Yw4riigvBX5Wlyx2zeUQvcQLA54Zp9DL/XN/9/2fXzSD5Q9dF
 71tXpTfVvfOGjjsI2nTMsQbv3bAeRPr3iHptg8Kfq+PNM3BJJvf+xH1Q+VhM2eNQXF9956tdeAuvX
 UwUk/Buj+3YEyZk9zZslxmxUlKPK3IwwJiU0mzOT89TKV57oxNIL/OZq2VI4qsgTaWvZn6qtsyKpg
 UQe7V3VtjqAEF5nN2A3p9zgzT6dXJuKM+F0kUPCqnF94Yi3AftDoHkmwSez2gQSU/7oWan0hXxLsh
 bBAiQorw==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7f-00E1Lu-HX; Mon, 17 May 2021 17:33:44 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 b9-20020a17090a9909b029015cf9effaeaso2834pjp.5; 
 Mon, 17 May 2021 10:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U2LUwkBCn/UHUIUpN0tGBxlVhEOoLXnQJ9JqYqN767U=;
 b=ZFpepfFWH2fZl4tzbb4HErLNIDjmb5y/QqZ3WH9HmqjFiryAPKNEAOhBHLgqGRBqw+
 fRm1jK8HXdqzhX0Qm07SGqKlUfwQTp1LHDXolhvChHtIrTMp/B3swomJ9BVDS0SFkWUY
 5A5JYHrM3aNeNBIfNVCFnBDVizFf6bJJuTnm1rh6GYubxRFlzLVhIvNaLoKZkF2A6YFJ
 0Lx+1JfPQbZNg2paBUdzyz7bkqEPljrYDUvX5Pvds778aVUBYbuPzDNR2/XaMLCPo4Ti
 +jobzZq75u5L4/Gcb+72nl9F8oUnNbaXTuwgKqI7t2XDysSHmSrvMkLExIxcT6i5jHEx
 LPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U2LUwkBCn/UHUIUpN0tGBxlVhEOoLXnQJ9JqYqN767U=;
 b=My51Rz24Zyaz9GrDkq/hKcgxKw5v+kuTq8auLXj+rG8njpxncrhsXY8R3H+KEweJFg
 AiZgn+wbY7oXqiDE7RjyLUTeKdtLC1pkHN52VucjnrczbU1NFCI9DEsG79sQLSvW7zib
 wa7FmJphA7RtXa6ymrrRfhws0gE9BOOOAogqnItFh+yov6ZTw7KwQ8ZHK7yGhTkS2Z+8
 tx2A2VNi8Lhibd2vo/XjxLqKmooUSJ8PR13z6hbNkK1YpSI+bYt+Rz2aMqWx54XLEZEJ
 uxcaoSSBiPKVNXyYNnYttufcV6YLEOmpD6jzo4eGmtxVwac1T/JANccafEjQhuNLp96U
 Xkkw==
X-Gm-Message-State: AOAM53390lsIDqCJ88+AHgrdqPluHxWf6xCJ0FdqznhX1Ra4FKk5ow1i
 sxE12odMsn3LSYEPhNDGWWg=
X-Google-Smtp-Source: ABdhPJzUNr0X9l/F4LvvQbKVAhQ5hjETNBMVetzvzKHHW1R09teIr6XxNrTxkvngFOCY0PqtC//9OA==
X-Received: by 2002:a17:90a:5649:: with SMTP id d9mr243681pji.98.1621272823176; 
 Mon, 17 May 2021 10:33:43 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:47e:c24d:6c72:a52:2c8:7df1])
 by smtp.gmail.com with ESMTPSA id
 c12sm10358296pfr.154.2021.05.17.10.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:33:42 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com
Subject: [PATCH v8 07/10] mfd: mt6360: Remove handle_post_irq callback function
Date: Tue, 18 May 2021 01:33:11 +0800
Message-Id: <20210517173314.140912-8-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
References: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_103343_603267_E2F33B4C 
X-CRM114-Status: GOOD (  14.17  )
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

Remove handle_post_irq which is used to retrigger IRQ.
Set IRQ level low trigger in dtsi to keep IRQ always be handled.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6360-core.c  | 17 ++++-------------
 include/linux/mfd/mt6360.h |  2 +-
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index a1d74bb302cd..50a170065a98 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -209,15 +209,8 @@ static const struct regmap_irq mt6360_irqs[] =  {
 	REGMAP_IRQ_REG_LINE(MT6360_LDO7_PGB_EVT, 8),
 };
 
-static int mt6360_pmu_handle_post_irq(void *irq_drv_data)
-{
-	struct mt6360_ddata *ddata = irq_drv_data;
-
-	return regmap_update_bits(ddata->regmap,
-		MT6360_PMU_IRQ_SET, MT6360_IRQ_RETRIG, MT6360_IRQ_RETRIG);
-}
-
-static struct regmap_irq_chip mt6360_irq_chip = {
+static const struct regmap_irq_chip mt6360_irq_chip = {
+	.name = "mt6360_irqs",
 	.irqs = mt6360_irqs,
 	.num_irqs = ARRAY_SIZE(mt6360_irqs),
 	.num_regs = MT6360_PMU_IRQ_REGNUM,
@@ -226,7 +219,6 @@ static struct regmap_irq_chip mt6360_irq_chip = {
 	.ack_base = MT6360_PMU_CHG_IRQ1,
 	.init_ack_masked = true,
 	.use_ack = true,
-	.handle_post_irq = mt6360_pmu_handle_post_irq,
 };
 
 static const struct regmap_config mt6360_pmu_regmap_config = {
@@ -339,10 +331,9 @@ static int mt6360_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	mt6360_irq_chip.irq_drv_data = ddata;
 	ret = devm_regmap_add_irq_chip(&client->dev, ddata->regmap, client->irq,
-				       IRQF_TRIGGER_FALLING, 0,
-				       &mt6360_irq_chip, &ddata->irq_data);
+				       0, 0, &mt6360_irq_chip,
+				       &ddata->irq_data);
 	if (ret) {
 		dev_err(&client->dev, "Failed to add Regmap IRQ Chip\n");
 		return ret;
diff --git a/include/linux/mfd/mt6360.h b/include/linux/mfd/mt6360.h
index 81bca7c2ad4d..ef8257dffe3f 100644
--- a/include/linux/mfd/mt6360.h
+++ b/include/linux/mfd/mt6360.h
@@ -230,7 +230,7 @@ struct mt6360_ddata {
 #define MT6360_PMU_MAXREG			MT6360_PMU_LDO_MASK2
 
 /* MT6360_PMU_IRQ_SET */
-#define MT6360_PMU_IRQ_REGNUM	(MT6360_PMU_LDO_IRQ2 - MT6360_PMU_CHG_IRQ1 + 1)
+#define MT6360_PMU_IRQ_REGNUM	16
 #define MT6360_IRQ_RETRIG	BIT(2)
 
 #define CHIP_VEN_MASK				0xF0
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
