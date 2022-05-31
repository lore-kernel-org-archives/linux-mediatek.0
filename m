Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE0FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 12:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uFb0eACK1mR708Rb7lfRSBNjqIUdRGV/Bbob0YK5dAw=; b=1HjnUvkJyBYWuV
	X8kw2mWqT/wRsasdNHsmOgmdFOtCYox2ALehZZSessIplu33j/TyU4ShtToJYNUpUN6byvLuFjiZe
	4Dgoyl1L9MUb/FYCXApN+1z35f+GjN/qwWTbyh2Y9iy1au5A4zIAjDQDFLgN0AuUniTdt1R8EBgpO
	lsiQhKZ1U7WrCSMBxkPQ7DhFRAUlqhFoqo+KoQ9SIKROwxBjtXLcZEH17rk231g7aeOwTntJRV1x8
	+eQ4VTQkZLsec7ntZcx0WCKZYLOZHFSeJOo+VzGqZrpVdyiO1bZ18yDdwaW+vjWL2oXDbYuFOe/V6
	23ht8x67pnS0RUW5J1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1LR-00ArcC-VH; Tue, 31 May 2022 12:51:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1KO-00Ar61-IZ
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 12:50:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id y24so7957959wmq.5
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 05:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vH18YmztAddzvuuGm66+CYpM63IW/TSQJt/1O1NxYf8=;
        b=mvAUlLlgWq3s1GHJmM8Ti0FVDe+xL07OqxPOiHqygKOx9iLzqVbGNbUBaMqIS75F/n
         ZtrI0pWp+siR+HrEjQH6BEZtH4t7MN19kVaMbsXjlQ2eEHr5cXg5QiJ+89r/+1Eontwo
         ISwF+uIYnlCrUYEzfoUzLYcZpsjIaY1mY70FWxtDMaKzFNm28MFj4DkD1JjojSIvA7bq
         YGy+vyamBVpY4v09jx8MlCfT+EZW+abjXtr9pNa+rujp1wxUqhqin3NJazrx/+p0G6UG
         7Ekx8GidumaYatHriMFCyKVOH5val5StsB/9oASu6zKg68B72/5DpzQzAStVI+jLoaIf
         DjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vH18YmztAddzvuuGm66+CYpM63IW/TSQJt/1O1NxYf8=;
        b=6EaWX7wZN803SWPjHUha7+4ucDYL3fcTlsugGrEhKCWjau7mgVIDuOnp1rLX/sL54n
         QLkuD/hlIJ9oRChPJZUUUcFIMUT0NXY63MFYPyN2Mn3eoTAgksRw78dp6Tgvp3X5Hu8/
         7Sj5SSZMG/UwBR0KeBRzhcO0mrtsqxUs0kTsn8FydiumCCoS00ddZ1gHXl7OILL+dnKb
         KD5Ywrm2aeVX9AcU3KYPmejdLyFmKXFtC5682+sh38shdJ63r6PQqMBiZOrmq6G8bKoS
         GfmZSlcZX4ZYaOyOVRnEqOJ7uJ6OfIeT04LTxkws9PzGDaANoSZ016HVtQXPnWIhbXaU
         2qqg==
X-Gm-Message-State: AOAM531+cTpNz8FSSDF2xBjPeELDZAIvTG+wx8eQ3E+HGwJPl+2HlYsB
	GkhKh9avjp7+D1uY9XsaRjZjDA==
X-Google-Smtp-Source: ABdhPJwQ38QgkJzAFctHWeekZJuWWVLy/1P/trpuL3oru//3qDkhF0gce5Krlfm/5Z6spoPXwHobJA==
X-Received: by 2002:a05:600c:34d1:b0:397:4c0d:598a with SMTP id d17-20020a05600c34d100b003974c0d598amr23295563wmq.36.1654001424541;
        Tue, 31 May 2022 05:50:24 -0700 (PDT)
Received: from helium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id i13-20020adfaacd000000b0020fc40d006bsm11475019wrc.17.2022.05.31.05.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 05:50:23 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] mfd: mt6358-irq: add MT6357 PMIC support
Date: Tue, 31 May 2022 14:49:57 +0200
Message-Id: <20220531124959.202787-6-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531124959.202787-1-fparent@baylibre.com>
References: <20220531124959.202787-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_055028_734031_154A2C48 
X-CRM114-Status: GOOD (  11.68  )
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

Add MT6357 PMIC IRQ support.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/mfd/mt6358-irq.c        | 24 ++++++++++++++++++++++++
 include/linux/mfd/mt6397/core.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
index ea5e452510eb..389756436af6 100644
--- a/drivers/mfd/mt6358-irq.c
+++ b/drivers/mfd/mt6358-irq.c
@@ -3,6 +3,8 @@
 // Copyright (c) 2020 MediaTek Inc.
 
 #include <linux/interrupt.h>
+#include <linux/mfd/mt6357/core.h>
+#include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/core.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/core.h>
@@ -17,6 +19,17 @@
 
 #define MTK_PMIC_REG_WIDTH 16
 
+static const struct irq_top_t mt6357_ints[] = {
+	MT6357_TOP_GEN(BUCK),
+	MT6357_TOP_GEN(LDO),
+	MT6357_TOP_GEN(PSC),
+	MT6357_TOP_GEN(SCK),
+	MT6357_TOP_GEN(BM),
+	MT6357_TOP_GEN(HK),
+	MT6357_TOP_GEN(AUD),
+	MT6357_TOP_GEN(MISC),
+};
+
 static const struct irq_top_t mt6358_ints[] = {
 	MT6358_TOP_GEN(BUCK),
 	MT6358_TOP_GEN(LDO),
@@ -39,6 +52,13 @@ static const struct irq_top_t mt6359_ints[] = {
 	MT6359_TOP_GEN(MISC),
 };
 
+static struct pmic_irq_data mt6357_irqd = {
+	.num_top = ARRAY_SIZE(mt6357_ints),
+	.num_pmic_irqs = MT6357_IRQ_NR,
+	.top_int_status_reg = MT6357_TOP_INT_STATUS0,
+	.pmic_ints = mt6357_ints,
+};
+
 static struct pmic_irq_data mt6358_irqd = {
 	.num_top = ARRAY_SIZE(mt6358_ints),
 	.num_pmic_irqs = MT6358_IRQ_NR,
@@ -211,6 +231,10 @@ int mt6358_irq_init(struct mt6397_chip *chip)
 	struct pmic_irq_data *irqd;
 
 	switch (chip->chip_id) {
+	case MT6357_CHIP_ID:
+		chip->irq_data = &mt6357_irqd;
+		break;
+
 	case MT6358_CHIP_ID:
 	case MT6366_CHIP_ID:
 		chip->irq_data = &mt6358_irqd;
diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
index 1cf78726503b..3fecaffe5019 100644
--- a/include/linux/mfd/mt6397/core.h
+++ b/include/linux/mfd/mt6397/core.h
@@ -12,6 +12,7 @@
 
 enum chip_id {
 	MT6323_CHIP_ID = 0x23,
+	MT6357_CHIP_ID = 0x57,
 	MT6358_CHIP_ID = 0x58,
 	MT6359_CHIP_ID = 0x59,
 	MT6366_CHIP_ID = 0x66,
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
