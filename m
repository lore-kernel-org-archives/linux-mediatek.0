Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697BDC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 10:50:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34AFD2078D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 10:50:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rK/5WF/f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WF0M9K4q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34AFD2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdYD7c75ANpvM8Z56J9O8PdRWktBl7Va2gAB1gdADDQ=; b=rK/5WF/fbbdjslNkxzd8T8e6l/
	paEIQ2/Ubceh/UmV5woDsPiNbXTna6QpfUVVoNGKi7+jnp5YfpywLkXwSW7frZYLopU38UB8ScLnl
	b77V9ijAx8Bfq/xZsFmLgxK2j2+XXDMWFAEbsYVwyvqREh9xSoWpEf1WQjCKBmJkq39VKy6kAvKo2
	lvfhMyyl7HnGX/wdNCGTMdc9ZEBYooM7KZgqYGQso+obTPwgPhA+9zGXZKfcVYeeXWYyUVj9pnV6W
	iwd4Cf3ZfV0E0FALj5rW9rAX/eXnv+Wt3eGrd3HfLqdS9AfxrJ+w1XhVXNfHVmXqTctg7pHJO+Vwa
	GOR5F07w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7ciH-0002MP-K1; Mon, 17 Aug 2020 10:50:01 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7chN-0001hI-JD; Mon, 17 Aug 2020 10:49:06 +0000
Received: by mail-pl1-x641.google.com with SMTP id y6so7321367plt.3;
 Mon, 17 Aug 2020 03:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sPIOzSYU2pA/shBWLkg3uMxU0iGcVrzwOJmIFEIBLoQ=;
 b=WF0M9K4qZfloylecr5h6eHHhbZo4v4jnG3xWzd31FIRUdUPiqziOo30YtVMKjdVbnO
 WLm5UgWvlu/Cq4lQOx7z55R/76JyjUrlA+OuKLmnkpSSf5DgdqZNiDnLYEf+FbLVjcDu
 m+TuUEk2aIA2hKBtGsq/ICSaeAd6D9x1XwVzLpdbiXHLfAPpM6xbFyuwM0EggAIWFyUy
 aM0Vi6lGYnpQvbKsJ89330vL4etCKZMzQvNTtzuQmW2gRpm9WdVomF2vQlPt54OGBeEu
 ysqEfPUO/owx2GGru54j9vQmxmhY8bFbWxqIipvO3hFoGU8V2zrxBAdv8tZ9Fu/UtOJe
 1Hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sPIOzSYU2pA/shBWLkg3uMxU0iGcVrzwOJmIFEIBLoQ=;
 b=gmV/NSi4hjHZTMfBCAxtYimob+kzKT0xN42Y1adPfMdvZQi5NKwm3SW2dk1l6CEOcP
 HdmoKdnaM2/zHlDR5zq5iBY0D9eVlZsHQvrguzh9SQs+lUAR607cVAW8694rfdrSfURc
 4JORexWzuFPhY4t0Q4Usxq6wQZMCoi/PT0Bt0J9/3e94k7POYTYmmrtDyyq6adbfm1iV
 PeBoe2+IbIP2sjRAjqPV/GkxwH2MSMyu56wBteT4krNq0kxSCPC1KVP64uO5h2kpTLAx
 HMMEsj2zP33TcKekagObGcn+9Bq1QHo3WoFOhegyzhWqtY7IKnCsDT0vvYBPZTYP3Iy/
 1VOw==
X-Gm-Message-State: AOAM532MmcP6KvVwNI7zGeUdkQIvp2nYrIduoxWraxUcQacj3fJ3j7wz
 7bCtpouwLzrOheyVCXS3mE4=
X-Google-Smtp-Source: ABdhPJwtU3+vPwn4tJgwJGNCbeJrX/lil8Kf0xZjAqRHrBlfpf+NRXRx7MGUcORPHLo8sfS+7s1Bdg==
X-Received: by 2002:a17:90a:cb08:: with SMTP id
 z8mr12003882pjt.41.1597661343516; 
 Mon, 17 Aug 2020 03:49:03 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:577:c217:67e6:a40c:a3bf:1945])
 by smtp.gmail.com with ESMTPSA id k12sm16976528pjp.38.2020.08.17.03.49.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Aug 2020 03:49:03 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v4 8/9] mfd: mt6360: Fix flow which is used to check ic exist
Date: Mon, 17 Aug 2020 18:47:56 +0800
Message-Id: <1597661277-27862-9-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_064905_697299_66B62B90 
X-CRM114-Status: GOOD (  16.13  )
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

Fix flow which is used to check ic exist.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 drivers/mfd/mt6360-core.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 2356d99..677c974 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -293,6 +293,25 @@ static const struct mfd_cell mt6360_devs[] = {
 		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
 };
 
+static int mt6360_check_vendor_info(struct mt6360_ddata *ddata)
+{
+	u32 info;
+	int ret;
+
+	ret = regmap_read(ddata->regmap, MT6360_PMU_DEV_INFO, &info);
+	if (ret < 0)
+		return ret;
+
+	if ((info & CHIP_VEN_MASK) != CHIP_VEN_MT6360) {
+		dev_err(&client->dev, "Device not supported\n");
+		return -ENODEV;
+	}
+
+	ddata->chip_rev = info & CHIP_REV_MASK;
+
+	return 0;
+}
+
 static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
 	MT6360_PMU_SLAVEID,
 	MT6360_PMIC_SLAVEID,
@@ -303,7 +322,6 @@ static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
 static int mt6360_probe(struct i2c_client *client)
 {
 	struct mt6360_ddata *ddata;
-	unsigned int reg_data;
 	int i, ret;
 
 	ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
@@ -319,17 +337,9 @@ static int mt6360_probe(struct i2c_client *client)
 		return PTR_ERR(ddata->regmap);
 	}
 
-	ret = regmap_read(ddata->regmap, MT6360_PMU_DEV_INFO, &reg_data);
-	if (ret) {
-		dev_err(&client->dev, "Device not found\n");
+	ret = mt6360_check_vendor_info(ddata);
+	if (ret)
 		return ret;
-	}
-
-	ddata->chip_rev = reg_data & CHIP_REV_MASK;
-	if (ddata->chip_rev != CHIP_VEN_MT6360) {
-		dev_err(&client->dev, "Device not supported\n");
-		return -ENODEV;
-	}
 
 	ret = devm_regmap_add_irq_chip(&client->dev, ddata->regmap, client->irq,
 				       0, 0, &mt6360_irq_chip,
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
