Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E14CEE6447
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 09:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Os6bv0Dt3LeB6u/HS9K4uZVY2Yt4IFbSegYd0tcLec=; b=KPNjlhGEW0j5bf5MP9dtxMdpUc
	JOr2wQAfSVbbLjRog/4M8+lzd2fYx1pXoiqks58qNmldev1g0ixR+GPQB/x4KJvZNjVnYzueg3Ep5
	y5swXe5FFGKRVVXqrgkhOJct/uYYje6a1C/DNmvyS6RqK4STO1ODleWJomnreexIu2hbvacyi4gpl
	QaMfd5OHsxDj7Qo71IiIIw1JeMljHtZseGIypP43ZEZiVqRLr+SGnIQwOO/W7z793wZsRWS7GJZU5
	LzmdaIrH5Z98JWLJGpSTaqF1AoQ9H9R9ow/r/QyOpAjyLscEAOmGtk6YDRTiYyawd10BEtpM39tqa
	cyK2SpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh50z-00AFqq-2J;
	Fri, 15 Sep 2023 09:21:29 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh50u-00AFid-1I
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Sep 2023 09:21:26 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bfb17435e4so30271791fa.0
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Sep 2023 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694769682; x=1695374482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Os6bv0Dt3LeB6u/HS9K4uZVY2Yt4IFbSegYd0tcLec=;
        b=BaQKvhzhUm87R+Lf5hOJXIG+KfRhbnMmQY+S2wMW0vyfF9/+97n33vBDo/DaP/v6RP
         N1jbCjopAG9Q/+IPXSw7BWj2age7f6fVSoAYjH/HQE3sphBvJCnR6k1nDftYaXM8AAjM
         9MpkHHaQiSA/pix9R6YUM1u/E8mu4X1NlFWQ+do/NwwkYDv2Dy/dm6jwSC5AYi9isP8h
         Mbyr9zcF7LlKKW0p/WQCFzRAiGEl/nK/Ti9pQCC/oRX5v9qpJL6sCWHa2l9QxjThGSRp
         nDV0DN6iIaPnOIoHCepuCNg/izp9X6gZgjLf52uhEMVMeD2/m3TKxYbHTad1ItaVTQ9g
         1CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694769682; x=1695374482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Os6bv0Dt3LeB6u/HS9K4uZVY2Yt4IFbSegYd0tcLec=;
        b=kCAgmajN3HAkENZwjQvQSDF8VZJiN0ymees2XlD/RG+73ACfEPzG5auhnvFGu8gTkb
         xC49IGgYcUVYZwP8oVtrQlFX3moF4ANatQOZQRLaxy4OKcMeUnr7wN1b5mSqYYnq0IyL
         Ud0ffb4MsdsZZhgD3GRq3V3lHY5D9e0byvDVKYewOBvIVgHoO+gC9bqUd4s2p+lsVwRJ
         rvVd2HvnAaGuR3KG+RRbqK553+Fz/A9u77kozAb6q4e3+rjX30YApbe4zQQSBCjFWKCL
         SPJZm6yUIy1CdWNBOT0TpUUsuqVjqnXn0yEYre/2hcohVUmS1mRhxdkPw6TIBmkn+mbA
         2lPw==
X-Gm-Message-State: AOJu0YwS+6L/OdXQ6Z20UdPf9VAQ2n82xyLVdacgW7Fp5yBvRYF41Mbh
	6boJORhY64XzERcxcyhAwUS2Pw==
X-Google-Smtp-Source: AGHT+IE/zpxUF1uu6BoDONyVpbXJeKhY3xFLEPlW57X6jw1Xtx2VwUTkRcH+jl50/wFagGsRc7Grsg==
X-Received: by 2002:a2e:b001:0:b0:2bc:ee89:6976 with SMTP id y1-20020a2eb001000000b002bcee896976mr1063977ljk.24.1694769682154;
        Fri, 15 Sep 2023 02:21:22 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id p8-20020a2e7408000000b002b9ec22d9fasm639376ljc.29.2023.09.15.02.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 02:21:21 -0700 (PDT)
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
Subject: [PATCH v2 07/17] pmdomain: mediatek: Move Kconfig options to the pmdomain subsystem
Date: Fri, 15 Sep 2023 11:19:53 +0200
Message-Id: <20230915092003.658361-8-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915092003.658361-1-ulf.hansson@linaro.org>
References: <20230915092003.658361-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_022124_505887_64138EE5 
X-CRM114-Status: GOOD (  15.32  )
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
index e2c85f20a0c3..b1d9dc7d71e3 100644
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
index 000000000000..21305c4f17fe
--- /dev/null
+++ b/drivers/pmdomain/mediatek/Kconfig
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "MediaTek PM Domains"
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


