Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4955C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 10:50:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85AFE2078D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 10:50:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WdUIckZT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmVT48my"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85AFE2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwlleo0Ey4d/wTQnyntFD0v+jLsM5ZqPwLKp5ldM98M=; b=WdUIckZTbDo7xX+oUqpCjGe185
	WEqMF1GVIn9Qwe7MgMGR5ot81pv/crBxLkAx0EAvPmWIXPL8OBHWNxHb3yAsg0FcBvF8aIWsoPG76
	TFe9+ori3r/8kExbruQaKS/hlaDduOvaiWTD4VYUWzOPDoxBrCrIqW3x8Fh4tpGsIN0N5DaMEia35
	A6w3l7Ah0V+7JZbARtheI4T/KYR7qyi8WLZLxVQfKgR8o/jCog9/GtOQWYIVgbeFmrHJ+bX8mS79G
	BiV71TbpIQKbtUffPY1wvSu4E2QWo1ZmtB7aHIPjnwaQu60dNxU4k25n9uLYKDZ6oFBHtojKPbgzT
	RMlo1wfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7ciF-0002LD-PL; Mon, 17 Aug 2020 10:49:59 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7chM-0001fw-Qr; Mon, 17 Aug 2020 10:49:05 +0000
Received: by mail-pl1-x642.google.com with SMTP id k13so7295267plk.13;
 Mon, 17 Aug 2020 03:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=grYjB3bY1LamRvNCUCtAo+X888pdbkIk5YYwGBwcowM=;
 b=bmVT48myI/uGhC3gktcfp8c3XLHZeGBOwhUqpVaP7XOfrW+VaA5IafFfxxnlCg8a6m
 mFIrkJO/2dPlzoxuyVxRZQ5wU7owQPrQBM2qqX9ulS2NAyxeITOxMXpCquAOMJEafeuZ
 ZL3thqXuGMNmnAAJ64STCuaVZJ71I/7v5UNM4emhQZDD0Qn6Cb9tmSQTcxwdvd0CDwRk
 cTUg6qFmja2hPVA1hBP9GsRl5GBrmVJOrGm9MdY89Tnbu1kGaFtTVZ26ROZax+f5n8G6
 w0v6qlClRbsEGmXjvboR3EzCvcfeaT+yFAa9PpaK9CfPyTBVYrkQPDj156BLcj7TENwO
 auaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=grYjB3bY1LamRvNCUCtAo+X888pdbkIk5YYwGBwcowM=;
 b=qdq648CDuOION/3NDhOyn6sz6cnk9OfjXeG7IYGDX5GaLruEl2jRbY5qT4kC4sVUYD
 YEOimvDJfMFrJm08OoVbGbqu9yXlwuR3D6THpJJ0MRK/zwRj3R9PLbr6R4feVg39e4nj
 Bo98xlLtW65qa5aWbWI7oAG1lbncDn8Dbk7HYacxbFTNowkjYKrQZiEqKXcM4zCHxtH3
 VxPggJPZ9ZxKd2kL+uTWEnvbIGLJP+mD97BE27ZcJgLDRew2I7cLBUsG/CueMeKbkxkX
 c9aDZLkWFPSb/mW1I4aw1QLOMSyeYD6MLztcBFZ0fApFTCoXufoqtVVsSgqu7beyU66W
 pgFQ==
X-Gm-Message-State: AOAM532m8j/0aUUimql8thVFX92OBWhumfyCA+3Awwzkb38szZcMUvM6
 cXnu4h1qs3LHFFunqyUROHDo7ZiT0Ak=
X-Google-Smtp-Source: ABdhPJyAWYdBqhYobjrmUBOPSDqBRSjjFV633+0fDxoUXeF+8aaJ/sxschQFaS7osarzkz5QIZ6OOA==
X-Received: by 2002:a17:90b:2083:: with SMTP id
 hb3mr11850188pjb.234.1597661340941; 
 Mon, 17 Aug 2020 03:49:00 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:577:c217:67e6:a40c:a3bf:1945])
 by smtp.gmail.com with ESMTPSA id k12sm16976528pjp.38.2020.08.17.03.48.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Aug 2020 03:49:00 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v4 7/9] mfd: mt6360: Remove handle_post_irq callback function
Date: Mon, 17 Aug 2020 18:47:55 +0800
Message-Id: <1597661277-27862-8-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_064904_954052_C18B64BF 
X-CRM114-Status: GOOD (  17.41  )
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

Remove handle_post_irq which is used to retrigger IRQ.
Set IRQ level low trigger in dtsi to keep IRQ always be handled.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6360-core.c  | 17 ++++-------------
 include/linux/mfd/mt6360.h |  2 +-
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index f75122b..2356d99 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -208,15 +208,8 @@ static const struct regmap_irq mt6360_irqs[] =  {
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
@@ -225,7 +218,6 @@ static struct regmap_irq_chip mt6360_irq_chip = {
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
index fbe106c..da0fb5c 100644
--- a/include/linux/mfd/mt6360.h
+++ b/include/linux/mfd/mt6360.h
@@ -230,7 +230,7 @@ struct mt6360_data {
 #define MT6360_PMU_MAXREG			MT6360_PMU_LDO_MASK2
 
 /* MT6360_PMU_IRQ_SET */
-#define MT6360_PMU_IRQ_REGNUM	(MT6360_PMU_LDO_IRQ2 - MT6360_PMU_CHG_IRQ1 + 1)
+#define MT6360_PMU_IRQ_REGNUM	16
 #define MT6360_IRQ_RETRIG	BIT(2)
 
 #define CHIP_VEN_MASK				0xF0
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
