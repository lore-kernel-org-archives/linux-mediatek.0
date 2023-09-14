Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6114DEDE9A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 11:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mRH6OrUr+z0cZQpLuLGyuJMctqYD163Kr9u2QpwLYcY=; b=MGyaiMQEbbhKIV4I68/Y80mT48
	cvETuhJinfr7Wps9TSkiFUQllSCD3QstDDpN4j9cmGTNRc81P5bPlumyQ4pYJ9sNe1RKKQn8kByvn
	pfYSFWMMo4+RDkGBv0hqIa8WTYr4j2d55JAu2fLtpOi1VpOjq6+kZr5t66k9k6uvsADhKFv6DP12R
	a/iqvtpBgXBCKYqfEjZFfBps6KtqfLOwNef2umW53OZ2tChxeQvDizHqoT+tJhsQXRyFsnJWU/PqY
	5lgC9SPWBeTw1gQfLmnWGM150UQmEhzTda+67iIi2Ba2STlLOGUpv0XKeBevxgCfpi/OtLDRUj5KT
	lnnodtVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgkM3-008DQH-1Y;
	Thu, 14 Sep 2023 11:17:51 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgkM0-008DOH-0n
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Sep 2023 11:17:49 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-502defbb0c3so1450476e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Sep 2023 04:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694690267; x=1695295067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mRH6OrUr+z0cZQpLuLGyuJMctqYD163Kr9u2QpwLYcY=;
        b=salKO42jEG4qRyJMNUxBsVAwvOaxV8rcS3JSOeBrcuAUL9juVnf0SsQ0M5+UVGCVPO
         smp4NYhnmf8RwzUDDKUhxMSbfXTKFGB1CO307gvpH0c3eA6TdADyMQLbnwq2BN3nE++7
         HryTO06HuFZoXuTioEydt5r0q5JXz3kziIgjrYeXSzZYXvS6eeJoghospwfmKONCaf6x
         2LgaMW6dK3K+GvSll89Jf7b+inKRolgPk6DM7/RZcvAapp2F7GRtxQ7qGNPXChHI3swb
         OCetn2UUa1EC9wsOLkywfQ5SHmBsZoBTisjdd4BVCNmlr3+ewr/AmbmnPp6Nn4vvl8TM
         7IIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694690267; x=1695295067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRH6OrUr+z0cZQpLuLGyuJMctqYD163Kr9u2QpwLYcY=;
        b=aAkoLu9FEKbzX2MTCYFmueTYkRfAPzngtKX88XOC9yEs+iLlkHeIhoMHifdh2oCll6
         wJSEA1jwj9OFmX1O07tMAfALOZLj78AbyNKjA4g99Vv/ssgzThl31Qbe1i7mb2H0LZHY
         k3+vIHJUzDqvS+/UyLhjjAD2ZoCqMadzBy/YhXNR96ogo31/mLC3mnxNPmw1mPyYy0u9
         LDB//omqdp5PWPXHYILGDVaWSVUv4zkbBxazzlrxthoqvwbhyfrb18Ha6wVPCYDgYnLc
         Za8wyUXYocxPcVeifGxhigacDlSl6Ild/LLBKC4Iax16WR1VQpNH8atII0lPw5frv6gI
         UHUw==
X-Gm-Message-State: AOJu0Yw2aN69AC5VqAg1Dl9VMi4cl7zkMMt/s3qGtsE5x7K9Ev75quFn
	YC9xQs7k2D14lrYjMGRHHtTH6w==
X-Google-Smtp-Source: AGHT+IG+zvfdRoCHg863MO1oc+o242dOyN3OArQ0YkCJDQaEF6fm8SXbA4YZWUC5fkXlYy9dpmXDxA==
X-Received: by 2002:a19:4316:0:b0:4f8:5cde:a44f with SMTP id q22-20020a194316000000b004f85cdea44fmr4020739lfa.10.1694690266851;
        Thu, 14 Sep 2023 04:17:46 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id q12-20020ac2510c000000b0050092263a20sm236630lfb.6.2023.09.14.04.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 04:17:46 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 07/17] pmdomain: mediatek: Move Kconfig options to the pmdomain subsystem
Date: Thu, 14 Sep 2023 13:17:44 +0200
Message-Id: <20230914111744.586593-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_041748_284264_8E457B5C 
X-CRM114-Status: GOOD (  14.54  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The Kconfig options belongs closer to the corresponding implementations,
hence let's move them from the soc subsystem to the pmdomain subsystem.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: <linux-mediatek@lists.infradead.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/Kconfig          |  1 +
 drivers/pmdomain/mediatek/Kconfig | 29 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/Kconfig      | 23 -----------------------
 3 files changed, 30 insertions(+), 23 deletions(-)
 create mode 100644 drivers/pmdomain/mediatek/Kconfig

diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
index 8a02523b62ce..5929f2d31588 100644
--- a/drivers/pmdomain/Kconfig
+++ b/drivers/pmdomain/Kconfig
@@ -6,5 +6,6 @@ source "drivers/pmdomain/amlogic/Kconfig"
 source "drivers/pmdomain/apple/Kconfig"
 source "drivers/pmdomain/bcm/Kconfig"
 source "drivers/pmdomain/imx/Kconfig"
+source "drivers/pmdomain/mediatek/Kconfig"
 
 endmenu
diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediatek/Kconfig
new file mode 100644
index 000000000000..184011b51615
--- /dev/null
+++ b/drivers/pmdomain/mediatek/Kconfig
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "MediaTek Power Domains"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+
+config MTK_SCPSYS
+	bool "MediaTek SCPSYS Support"
+	default ARCH_MEDIATEK
+	depends on OF
+	select REGMAP
+	select MTK_INFRACFG
+	select PM_GENERIC_DOMAINS if PM
+	help
+	  Say yes here to add support for the MediaTek SCPSYS power domain
+	  driver.
+
+config MTK_SCPSYS_PM_DOMAINS
+	bool "MediaTek SCPSYS generic power domain"
+	default ARCH_MEDIATEK
+	depends on PM
+	select PM_GENERIC_DOMAINS
+	select REGMAP
+	help
+	  Say y here to enable power domain support.
+	  In order to meet high performance and low power requirements, the System
+	  Control Processor System (SCPSYS) has several power management related
+	  tasks in the system.
+
+endmenu
diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index a88cf04fc803..0810b5b0c688 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -49,29 +49,6 @@ config MTK_REGULATOR_COUPLER
 	default ARCH_MEDIATEK
 	depends on REGULATOR
 
-config MTK_SCPSYS
-	bool "MediaTek SCPSYS Support"
-	default ARCH_MEDIATEK
-	depends on OF
-	select REGMAP
-	select MTK_INFRACFG
-	select PM_GENERIC_DOMAINS if PM
-	help
-	  Say yes here to add support for the MediaTek SCPSYS power domain
-	  driver.
-
-config MTK_SCPSYS_PM_DOMAINS
-	bool "MediaTek SCPSYS generic power domain"
-	default ARCH_MEDIATEK
-	depends on PM
-	select PM_GENERIC_DOMAINS
-	select REGMAP
-	help
-	  Say y here to enable power domain support.
-	  In order to meet high performance and low power requirements, the System
-	  Control Processor System (SCPSYS) has several power management related
-	  tasks in the system.
-
 config MTK_MMSYS
 	tristate "MediaTek MMSYS Support"
 	default ARCH_MEDIATEK
-- 
2.34.1


