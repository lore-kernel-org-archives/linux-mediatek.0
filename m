Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D57C433E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 11:05:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0C502076A
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 11:05:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kDgKAtl4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X90Ag/Zr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0C502076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOzNNIdmcra6nLEafw6K5OQALhtlOcvAowj1GrUK6dE=; b=kDgKAtl4dre0cYfsYDKf1r0HHQ
	bCgsSwaCfkK0DJTHq8E8oKO+NNsRgy0/aBhLoZqSrxWZCcAJgc1dE2EfznxjhPpEjPmZ91FhjX0AX
	snc4QUoiHgFBELTA0UguIEMj4tAztDvYXsOleszB3HDuwMwaar2fhPfoq2CMRyp5jggWVmeVCvbSZ
	4uPHOfQfJBVbfeDNRu3I67Vpwn/Hp6MpPjRaA0CGCWYGVmuCWjYYh+tks7pPMlg/Kww1gB2s45POe
	cb7/8oHGOzz3T4jS9fa6Yb4OdMYDE0VmB9CtI1D6MAHFVGh101KEDEgUJyntvqH5QtivuXhdcxr84
	Bbm3cQ1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwOB1-0006lg-Pw; Fri, 17 Jul 2020 11:05:15 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwOA5-0006HR-B6; Fri, 17 Jul 2020 11:04:18 +0000
Received: by mail-pj1-x1043.google.com with SMTP id cv18so4009830pjb.1;
 Fri, 17 Jul 2020 04:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8q3qeFMAWbIYQ7xRyH7Euf8991pkoYLmr2o7k6CVxR8=;
 b=X90Ag/ZrG6HB2jVtCllueYeYFJg5VyhTJRIKR15eiGjw/VrhhxCwJvejfPCrL+nofE
 wryixuQTRXd+Ty0yyoo9PppLBWgautiGgISHQPlzPrpWJf6RmOMlVypdZDosw+pqDBt2
 3HDVLA4I/aCVLMh5MoCkQZoIakVwov4/8u9FemOGHPfJTHCq4k9XfUJv55jeuppCI+PR
 1jvLfVQl+vOXHC+gAwYUdVdlabAoR5O2qsKmJRHZTVYlx9PHkyeHJcN2F3s5tUA6itBb
 RYipxtMbvJsPR4WJWnpoeXXW6IYxZjBOoAEK1gMjOoxaQT1EhWKFm3tPFRfTkSHqr+5v
 O2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8q3qeFMAWbIYQ7xRyH7Euf8991pkoYLmr2o7k6CVxR8=;
 b=baP6+lRaq7q9S4Nt7M5gszD2uHYCMbUsho2MMqbU2ShqmOK7w6LKEXEuJaxKccnsgi
 gaQE4gG9l+SCIZkDjX1GhBLvKQds5fTrKWsooY2xOTcGu00tmh9/FkVu72/i9v9EWqet
 hXzfEzcNXqmLLA7fEgyy5+UPN6FN28sT72uC1Vs+sL6DDFs9OZBchEzl3tob+aGEqYik
 zITjTkCdRLZ0VQnVjuRnf8/rG5OPx+0WYghTY1dDSLACkZhflLTpa6zRpEoI9aGQVhTg
 iFanlBf/1odtnwBz3FDjhDjFPK+dtyay7VOMKn5OCb2iTEfOabtAIBFm61PH1ktDgXd/
 gN+g==
X-Gm-Message-State: AOAM531JcWlVukWuGlk3r91r1qjilsXltLRxdthkDXj/QLmwT7h/0R33
 vnCnNjiKVXPrmXlBnDxYai0=
X-Google-Smtp-Source: ABdhPJyNPNBFaM262FKdU40DHClkOBfbeAFTcMhPqYWWPdXyPn1lPVFUq9sqgcX4jI9CiyXW6YkfsA==
X-Received: by 2002:a17:902:7d8b:: with SMTP id
 a11mr7198807plm.72.1594983855217; 
 Fri, 17 Jul 2020 04:04:15 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:469:ae36:984e:c073:9d0b:7c09])
 by smtp.gmail.com with ESMTPSA id o26sm7619183pfp.219.2020.07.17.04.04.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Jul 2020 04:04:14 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 7/9] mfd: mt6360: Remove handle_post_irq callback function
Date: Fri, 17 Jul 2020 19:03:29 +0800
Message-Id: <1594983811-25908-8-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_070417_449688_D6B27150 
X-CRM114-Status: GOOD (  14.35  )
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

Remove handle_post_irq which is used to retrigger irq.
Set irq level low trigger in dtsi to keep irq always be handled.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 drivers/mfd/mt6360-core.c  | 16 +++-------------
 include/linux/mfd/mt6360.h |  2 +-
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 5dfc13e..5a68228 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -208,15 +208,8 @@ static const struct regmap_irq mt6360_irqs[] =  {
 	REGMAP_IRQ_REG_LINE(MT6360_LDO7_PGB_EVT, 8),
 };
 
-static int mt6360_pmu_handle_post_irq(void *irq_drv_data)
-{
-	struct mt6360_data *data = irq_drv_data;
-
-	return regmap_update_bits(data->regmap,
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
@@ -339,10 +331,8 @@ static int mt6360_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	mt6360_irq_chip.irq_drv_data = data;
 	ret = devm_regmap_add_irq_chip(&client->dev, data->regmap, client->irq,
-				       IRQF_TRIGGER_FALLING, 0,
-				       &mt6360_irq_chip, &data->irq_data);
+				       0, 0, &mt6360_irq_chip, &data->irq_data);
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
