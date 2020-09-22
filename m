Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1405AC2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 10:23:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 933A22395C
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 10:23:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kFF+BX5d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="otWeUcTK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 933A22395C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHKeaDWks8MBcTth5IDGD7cJvFMo30p5CDf31QPdDp0=; b=kFF+BX5dwAV/U9eMcjaK+SwPfR
	ZtYLbR6kpzkg/7U/x2DcRVzzn2nn1p/FDvR+RXXKmuC7OBZw8X8m2iGhMoMxXHkYi5PbdhwkF8d3m
	QqGj+ljlAJQsOE+2GbmXqG4hWnd86XxS4ExPA+GrWuQ6AX2BNgcMN4g+V4TmjrrEMsywCixu5G4kJ
	j04xV87kQ0H0MbDQWysQUrem+9VPKJlfzG6mID02Kj84xJ4h+Qhj+5b2euaCyHCCI3lVm+bAbjz6t
	0bBuslgiaJlnooJvkfQD5wbB0wiy98eYvzLsLnEINTnCBibq24dskhJAMEMgNzPdGx8QrEwXavHkL
	nNMNBRtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKfRo-0000kN-7j; Tue, 22 Sep 2020 10:22:56 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKfQ5-000099-Nk; Tue, 22 Sep 2020 10:21:26 +0000
Received: by mail-pg1-x544.google.com with SMTP id l71so11573928pge.4;
 Tue, 22 Sep 2020 03:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sie6Ok4mlr9HWDpV1MC03OrgT3qnjwcXYjtFoY6fZME=;
 b=otWeUcTKx/UNzKWUeg61Z1E3NrT6TBCSkXl028uvXKJgQlGgBuyTzj5hl6sMqm5VfZ
 KdWZ7nKpPZODjsNDVRS5dTwfT39V3q8QVX5WKkTdO4rXPoDowZ4jNdunjSPjXU52xvD5
 sMgHrfwwiT9RilnqQ3J64qwdb0TPkrUej6DbqoQeUx06QevcqsFmftcT+VhMM1v5IiVa
 QagqXSP68aVaxv2rMNccMKn/8RDTMbit7aF3V/Lg8fuGxP3pjPSZqDht1Ah4oPG1N/wQ
 FqJ+z/GfGGnYnQFxLPDF6VrzpBuNOtQ3FWo9jMw74oOfI5O5gqmh9cv8hA7F8mYRz2Tq
 aENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sie6Ok4mlr9HWDpV1MC03OrgT3qnjwcXYjtFoY6fZME=;
 b=Y736/lqq5XP5V/DJEtLysjPDg2Tw74JQAaseN1U6n6RiSGQ155U0wSl55A3h3/SCIw
 T9uofGl2nu6BdC1df23kAuxUWyLVTT6YLwG/UDElw/JvVU6P+f0fbAk9prJ/oB+eAb0w
 TIhU8aoqV3LXOzSqOpN9NZp4EXCIciyhBUjBQjt6mhNf0l2qdbvUKHbX3CD+8ok/uVjd
 E8iRP4bdWDfMf33XecYUsHghIaMRG1nacrK9ScTVGHboEyO8LbMtW6vvrOOJm6cCLz+b
 AQsNT7DTA7AdG/K9H55c7l1g1gZYC5O45PXDH1vFTQVmmtRipSJmiHM8aDijQMI+ybV0
 YG/g==
X-Gm-Message-State: AOAM5339RZ148qiqsl8CpFJiYTOl9h10xfck3QkFoy0jtU43bTTtwtvp
 IlAQmIZ3yqCaJnNvH3jU9CQ=
X-Google-Smtp-Source: ABdhPJwlWzhfwcTkd1VFhdbJOI3bAObjg7ROqG6ZjIFUUt6R2kwuwErRy8IOpI0g2eZOuukSte2leg==
X-Received: by 2002:a65:5881:: with SMTP id d1mr2959406pgu.193.1600770067727; 
 Tue, 22 Sep 2020 03:21:07 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:489:56d9:501b:f524:c013:2733])
 by smtp.gmail.com with ESMTPSA id a15sm14859037pfi.119.2020.09.22.03.21.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 03:21:07 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v5 07/10] mfd: mt6360: Remove handle_post_irq callback function
Date: Tue, 22 Sep 2020 18:20:15 +0800
Message-Id: <1600770019-11585-8-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600770019-11585-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1600770019-11585-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_062114_875899_3D5CDBD8 
X-CRM114-Status: GOOD (  17.15  )
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
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
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
index 81bca7c..ef8257d 100644
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
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
