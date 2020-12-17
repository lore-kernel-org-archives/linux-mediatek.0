Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E43C4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 08:34:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6EE236F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 08:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A6EE236F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Teb9Y0UCn0g4bkZJn7UQrKAT92JEP1ssiTQYVnlj4Qk=; b=LwGkWHmlQlI+tVACbaPiGcYsKP
	q4oDrWCo0eBysevzM8w2KLqCqGiA4C2dhI4u3G2t6loQsK+1Mq2F48zn9EEnCpoPU11QA+iZ1u5R9
	XEB1esZSeHmXE1XMiAhNIySR1C1jp9D1jTMzvggG0zWCLhqYbpWZAbSS2UJF/tus9UJ/BLErWcI3W
	5h2QZQDrCSJO8x5zHa8U0AbyonET1lVW70paJvW3t3ePmHc6R4Vlmvje2+5dbIm3f321eyd+Niq1z
	vJ0ekDasWCjAR/UlY3os52qUxFLH38cvqBi2tTdXmB0FzGU7LtpR36x/XDxG1nrubC0J7iTrRNig+
	loNXz8uQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpok3-0004CR-K5; Thu, 17 Dec 2020 08:34:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpok2-0004Bz-64
 for linux-mediatek@lists.infradead.org; Thu, 17 Dec 2020 08:34:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id q75so4915856wme.2
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Dec 2020 00:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S/cF24D4J6cwZf31EM96gFXc7xDWWLJL3b20a73K+Mk=;
 b=jbRLwFboY615xgwu29uVtZxijSNHCHMkFkl+dfhrnrQR4hK+xrrHbXI35Zn59D/Qw8
 Z8PIvv0Knb85w8ZSUDBElGmBRJfWfmLYgslaTPzlFM4vhVT21NG2od4lvM9XTKqoplIq
 HOZ5/fVkqOfZRBEJloaAQlcEZKXOBbY9STZwe0m6AbNQFTNSpSR07VAGo4zhyJIDUz3Y
 diqKeVaiYekK1x4C9isGLeFycUpFILhKX7SqISQ7pV1lHfWEVY150WqKTzEDnsexr0wA
 AgF4dPz4hGQ0s//weQKqWihjqqIYTPEl2SngQ3zZtXzM7Bp4WWn0MLyRG1KRulThW14F
 20fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S/cF24D4J6cwZf31EM96gFXc7xDWWLJL3b20a73K+Mk=;
 b=cF0Sp+wWZIo66FoEsvGJT8hBBG9qI/AuAotm1w/v8U4msgcOFXTYw93xSzRymIOfTm
 d/Gp0OcyqzSwDmhiv0+6BQPoNU2E1xrZLy7wSl4fpvhuTWcgDHgrm2oBtLiV2T6ugg/x
 RqYfmZi8rLQzrZKA7Uz5SFeKgUr5BYW5abWQE1A6B6xC2uHxVIjnbIpF6FufTjaL71Ew
 ONlov+4EQ/uAwFEWgmfM0EO/4V1ndXK+0cbgqiq2h3POphwHXcL6OuRHqY+cmyhf3VUY
 L904irVP/3FF+jmU8l4Nd+y9C1mWGLxDtTDCPrp41c7wkszgV5owDGH0NgSIRKLTdUCG
 LT2w==
X-Gm-Message-State: AOAM533NKTiEFG0xPeECw1KzeHoxLyRfNMw6j8YxRkv99enhw/JvxKev
 Ryf6gxgaGnNgY32dxdNB8mt8FA==
X-Google-Smtp-Source: ABdhPJxvUdE/0aYj/DoCgrKUtfPlErQ8D2icT9fnVxgwxcjpTUEm2L25byl0nlyrDC3iKQgrL9ueEg==
X-Received: by 2002:a05:600c:2042:: with SMTP id
 p2mr7504535wmg.152.1608194069003; 
 Thu, 17 Dec 2020 00:34:29 -0800 (PST)
Received: from dell.default ([91.110.221.200])
 by smtp.gmail.com with ESMTPSA id b19sm6573309wmj.37.2020.12.17.00.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 00:34:28 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 1/1] mfd: Standardise MFD_CELL_* helper names
Date: Thu, 17 Dec 2020 08:34:20 +0000
Message-Id: <20201217083420.411569-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_033430_323873_9C8EDEAB 
X-CRM114-Status: GOOD (  10.89  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Gene Chen <gene_chen@richtek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Start all helpers with "MFD_CELL_".

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Gene Chen <gene_chen@richtek.com>
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/ab8500-core.c  | 42 +++++++++++++++++++-------------------
 drivers/mfd/db8500-prcmu.c |  6 +++---
 drivers/mfd/mt6360-core.c  | 12 +++++------
 include/linux/mfd/core.h   |  6 +++---
 4 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index a3bac9da8cbbc..ba8da061af0ef 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -610,52 +610,52 @@ int ab8500_suspend(struct ab8500 *ab8500)
 }
 
 static const struct mfd_cell ab8500_bm_devs[] = {
-	OF_MFD_CELL("ab8500-charger", NULL, &ab8500_bm_data,
+	MFD_CELL_OF("ab8500-charger", NULL, &ab8500_bm_data,
 		    sizeof(ab8500_bm_data), 0, "stericsson,ab8500-charger"),
-	OF_MFD_CELL("ab8500-btemp", NULL, &ab8500_bm_data,
+	MFD_CELL_OF("ab8500-btemp", NULL, &ab8500_bm_data,
 		    sizeof(ab8500_bm_data), 0, "stericsson,ab8500-btemp"),
-	OF_MFD_CELL("ab8500-fg", NULL, &ab8500_bm_data,
+	MFD_CELL_OF("ab8500-fg", NULL, &ab8500_bm_data,
 		    sizeof(ab8500_bm_data), 0, "stericsson,ab8500-fg"),
-	OF_MFD_CELL("ab8500-chargalg", NULL, &ab8500_bm_data,
+	MFD_CELL_OF("ab8500-chargalg", NULL, &ab8500_bm_data,
 		    sizeof(ab8500_bm_data), 0, "stericsson,ab8500-chargalg"),
 };
 
 static const struct mfd_cell ab8500_devs[] = {
 #ifdef CONFIG_DEBUG_FS
-	OF_MFD_CELL("ab8500-debug",
+	MFD_CELL_OF("ab8500-debug",
 		    NULL, NULL, 0, 0, "stericsson,ab8500-debug"),
 #endif
-	OF_MFD_CELL("ab8500-sysctrl",
+	MFD_CELL_OF("ab8500-sysctrl",
 		    NULL, NULL, 0, 0, "stericsson,ab8500-sysctrl"),
-	OF_MFD_CELL("ab8500-ext-regulator",
+	MFD_CELL_OF("ab8500-ext-regulator",
 		    NULL, NULL, 0, 0, "stericsson,ab8500-ext-regulator"),
-	OF_MFD_CELL("ab8500-regulator",
+	MFD_CELL_OF("ab8500-regulator",
 		    NULL, NULL, 0, 0, "stericsson,ab8500-regulator"),
-	OF_MFD_CELL("ab8500-clk",
+	MFD_CELL_OF("ab8500-clk",
 		    NULL, NULL, 0, 0, "stericsson,ab8500-clk"),
-	OF_MFD_CELL("ab8500-gpadc",
+	MFD_CELL_OF("ab8500-gpadc",
 		    NULL, NULL, 0, 0, "stericsson,ab8500-gpadc"),
-	OF_MFD_CELL("ab8500-rtc",
+	MFD_CELL_OF("ab8500-rtc",
 		    NULL, NULL, 0, 0, "stericsson,ab8500-rtc"),
-	OF_MFD_CELL("ab8500-acc-det",
+	MFD_CELL_OF("ab8500-acc-det",
 		    NULL, NULL, 0, 0, "stericsson,ab8500-acc-det"),
-	OF_MFD_CELL("ab8500-poweron-key",
+	MFD_CELL_OF("ab8500-poweron-key",
 		    NULL, NULL, 0, 0, "stericsson,ab8500-poweron-key"),
-	OF_MFD_CELL("ab8500-pwm",
+	MFD_CELL_OF("ab8500-pwm",
 		    NULL, NULL, 0, 1, "stericsson,ab8500-pwm"),
-	OF_MFD_CELL("ab8500-pwm",
+	MFD_CELL_OF("ab8500-pwm",
 		    NULL, NULL, 0, 2, "stericsson,ab8500-pwm"),
-	OF_MFD_CELL("ab8500-pwm",
+	MFD_CELL_OF("ab8500-pwm",
 		    NULL, NULL, 0, 3, "stericsson,ab8500-pwm"),
-	OF_MFD_CELL("ab8500-denc",
+	MFD_CELL_OF("ab8500-denc",
 		    NULL, NULL, 0, 0, "stericsson,ab8500-denc"),
-	OF_MFD_CELL("pinctrl-ab8500",
+	MFD_CELL_OF("pinctrl-ab8500",
 		    NULL, NULL, 0, 0, "stericsson,ab8500-gpio"),
-	OF_MFD_CELL("abx500-temp",
+	MFD_CELL_OF("abx500-temp",
 		    NULL, NULL, 0, 0, "stericsson,abx500-temp"),
-	OF_MFD_CELL("ab8500-usb",
+	MFD_CELL_OF("ab8500-usb",
 		    NULL, NULL, 0, 0, "stericsson,ab8500-usb"),
-	OF_MFD_CELL("ab8500-codec",
+	MFD_CELL_OF("ab8500-codec",
 		    NULL, NULL, 0, 0, "stericsson,ab8500-codec"),
 };
 
diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index a5983d515db03..167faac9b75bf 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -2954,12 +2954,12 @@ static const struct mfd_cell common_prcmu_devs[] = {
 };
 
 static const struct mfd_cell db8500_prcmu_devs[] = {
-	OF_MFD_CELL("db8500-prcmu-regulators", NULL,
+	MFD_CELL_OF("db8500-prcmu-regulators", NULL,
 		    &db8500_regulators, sizeof(db8500_regulators), 0,
 		    "stericsson,db8500-prcmu-regulator"),
-	OF_MFD_CELL("cpuidle-dbx500",
+	MFD_CELL_OF("cpuidle-dbx500",
 		    NULL, NULL, 0, 0, "stericsson,cpuidle-dbx500"),
-	OF_MFD_CELL("db8500-thermal",
+	MFD_CELL_OF("db8500-thermal",
 		    NULL, NULL, 0, 0, "stericsson,db8500-thermal"),
 };
 
diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 4661c1b29a726..480722acf706b 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -292,17 +292,17 @@ static const struct resource mt6360_ldo_resources[] = {
 };
 
 static const struct mfd_cell mt6360_devs[] = {
-	OF_MFD_CELL("mt6360_adc", mt6360_adc_resources,
+	MFD_CELL_OF("mt6360_adc", mt6360_adc_resources,
 		    NULL, 0, 0, "mediatek,mt6360_adc"),
-	OF_MFD_CELL("mt6360_chg", mt6360_chg_resources,
+	MFD_CELL_OF("mt6360_chg", mt6360_chg_resources,
 		    NULL, 0, 0, "mediatek,mt6360_chg"),
-	OF_MFD_CELL("mt6360_led", mt6360_led_resources,
+	MFD_CELL_OF("mt6360_led", mt6360_led_resources,
 		    NULL, 0, 0, "mediatek,mt6360_led"),
-	OF_MFD_CELL("mt6360_pmic", mt6360_pmic_resources,
+	MFD_CELL_OF("mt6360_pmic", mt6360_pmic_resources,
 		    NULL, 0, 0, "mediatek,mt6360_pmic"),
-	OF_MFD_CELL("mt6360_ldo", mt6360_ldo_resources,
+	MFD_CELL_OF("mt6360_ldo", mt6360_ldo_resources,
 		    NULL, 0, 0, "mediatek,mt6360_ldo"),
-	OF_MFD_CELL("mt6360_tcpc", NULL,
+	MFD_CELL_OF("mt6360_tcpc", NULL,
 		    NULL, 0, 0, "mediatek,mt6360_tcpc"),
 };
 
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index 4b35baa14d308..2009c4b936d9d 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -28,13 +28,13 @@
 		.id = (_id),						\
 	}
 
-#define OF_MFD_CELL_REG(_name, _res, _pdata, _pdsize, _id, _compat, _of_reg) \
+#define MFD_CELL_OF_REG(_name, _res, _pdata, _pdsize, _id, _compat, _of_reg) \
 	MFD_CELL_ALL(_name, _res, _pdata, _pdsize, _id, _compat, _of_reg, true, NULL)
 
-#define OF_MFD_CELL(_name, _res, _pdata, _pdsize, _id, _compat) \
+#define MFD_CELL_OF(_name, _res, _pdata, _pdsize, _id, _compat) \
 	MFD_CELL_ALL(_name, _res, _pdata, _pdsize, _id, _compat, 0, false, NULL)
 
-#define ACPI_MFD_CELL(_name, _res, _pdata, _pdsize, _id, _match) \
+#define MFD_CELL_ACPI(_name, _res, _pdata, _pdsize, _id, _match) \
 	MFD_CELL_ALL(_name, _res, _pdata, _pdsize, _id, NULL, 0, false, _match)
 
 #define MFD_CELL_BASIC(_name, _res, _pdata, _pdsize, _id) \
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
