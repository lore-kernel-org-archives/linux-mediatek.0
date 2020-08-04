Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B41C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:34:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 909342177B
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:34:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nh3QYvsh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qmZcb0Am"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 909342177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwlleo0Ey4d/wTQnyntFD0v+jLsM5ZqPwLKp5ldM98M=; b=nh3QYvsh875L6ZLytB/m2K0nTu
	TLy6HyZ2P/hNSafaN6cuo9MB4D92naoGrs4cgH+9WVX6gHxRwsjC0x2JJPcgaPCpTNDAp6knU+Z+m
	iTa3cyxjX78IQJfo+tIFhCjpKsZGzcxqAqRlAprtunROZi6GIoT2+Go6oXD2A8oRumGvZNH0fNNOI
	n148eOT8/b3yC+V6qcYmktFV0l56oAG4cH2T/tsD8W9h3P8pX+d/YFtu4lbNntz6x88YRlXxA+9Xd
	0Ev79stm3+ughaOsEbwmxZAn1BpQgvMdpXYZbpoLhssDhGGxobs4mOzEAUxPjHIveGdv3i3UpAsDm
	v+UuKBHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2ztI-0000QA-93; Tue, 04 Aug 2020 16:34:16 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2zsc-0008M5-1a; Tue, 04 Aug 2020 16:33:35 +0000
Received: by mail-pj1-x1044.google.com with SMTP id e4so2515050pjd.0;
 Tue, 04 Aug 2020 09:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=grYjB3bY1LamRvNCUCtAo+X888pdbkIk5YYwGBwcowM=;
 b=qmZcb0Ama9epFwO2zMvDdHAwnOQBNe6r9ylGehgzoogzAbqGVAoGNj7hCdtU8OEMYj
 qb7ZOvNqNaZ8dTWhVHzK/8CJEdvhhnw84e8+dHd9G1VlNCYPRu6eXMDpW0JEL/WQ8RQ+
 bUG+DF1l9xx7EcM68Sk6JdEg1RJxcHLeDqBBG21wqpgQGW8HgbSc+ZJgjtd7eeintcjs
 ybyRktCUSm4pvk4qbBYeWUMpx/N0Fje+GoqrUxiEHGhQ35f5z2iSSLoR8x0cbQd+BqnB
 ZfupiqD+Zmf60oFXnbD7UYdJDzFrk2z2+AYlD+x5dZeYHQzgD2dL3A9EWP1WPHXxFNEy
 UJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=grYjB3bY1LamRvNCUCtAo+X888pdbkIk5YYwGBwcowM=;
 b=NLa27VWnCaVBIRxx0CQR0otZpWHIDGYKy2uUB32UbqBj1SKxhM/swOnY27XKqxuuVg
 qLLw2iixKRbyVMz0GHoQWLI8D4N0PU86XHRlRczXdlFH9HL9FeOiSHV3W4vpFBudgPKc
 yKkRe+BqmrFOWzVFfgZe6Cp8Eu15G/X7EIJkoGtIREvjlf0ApJZJXNbHj2gPEHx07aN2
 cG8jrQ1jFDPRKM5HqoeYNo22rGSka4L5cHHqgfZ9GYg2UgYm8YlSUxuIj0Ib+uL6fl4f
 Dmt19ZxP1183yav1rgPuyJF0ZR03glMUGH2M40daYv6Sh+HXV9v2DhnOyLXxgclYwWtp
 Rv0g==
X-Gm-Message-State: AOAM530prR61i0/MDs7kjzQxZCkpiicob7m2lSih5Hu23R7itLAdfvVo
 3NwEBIYek4yYEs9bctVy2BHzNX+O
X-Google-Smtp-Source: ABdhPJyV7sZ1cObVMUHEG1WB2iDkjjlTo02Be2rFobYUkhCGd4Ud2pEVsyBmeRV5CJyg1hWBid20WQ==
X-Received: by 2002:a17:90a:ba05:: with SMTP id
 s5mr4915328pjr.132.1596558811835; 
 Tue, 04 Aug 2020 09:33:31 -0700 (PDT)
Received: from localhost.localdomain ([123.110.251.138])
 by smtp.gmail.com with ESMTPSA id m16sm657253pjz.47.2020.08.04.09.33.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 09:33:31 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com,
	rafael@kernel.org
Subject: [PATCH 7/9] mfd: mt6360: Remove handle_post_irq callback function
Date: Wed,  5 Aug 2020 00:33:00 +0800
Message-Id: <1596558782-3415-9-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_123334_205125_35CBEAFA 
X-CRM114-Status: GOOD (  16.96  )
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
Cc: gene_chen@richtek.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
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
