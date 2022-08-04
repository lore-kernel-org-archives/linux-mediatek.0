Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EC3C25B08
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQK3oz9qbEyhSdrl3bVOwNcv3E2dhXu4IVGnclR+410=; b=i2MrXzPy8hgMCRHadyeAQYr7d9
	BUW424sXlDZYTtCSKry2jgoWBwYR2zTzKHLc5u8754Tr3feap+zNydRiDiHP7ryGsFPgS1ZAcTO6b
	n92rVLBjniC4EGQ9wORGvRDGp0iPs8tp7KAH8jOSU71umyAo7PgtxAC0pI0Z4kE9NE3clhZKQHJnx
	WJN5SccYCo8BidDLOzXu+aS883jusW5Du0bSyn2FcOu+/Pm0oIlfieny2xWfqxMP5L/lIMijmD7pA
	ttRWlQrokQ6Q3E65yL8t/WV0OPfwCPa1QEWnIm0Jgx0TJHD7SojONeRsEsAydqCfo+pFeDsYQc28n
	sNHL2Qaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJacF-006AkH-Ix; Thu, 04 Aug 2022 13:10:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJabw-006AWi-Fe
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 13:10:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id h34-20020a05600c49a200b003a5165eae0fso150796wmp.4
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Aug 2022 06:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qQK3oz9qbEyhSdrl3bVOwNcv3E2dhXu4IVGnclR+410=;
        b=vr2V+/907iDdlnruy3oQToaR/XfzjPvf1I8r6njjhSb5We2JXBTFSpXjdhgdhuNfIQ
         N6tVvfvbwormefx89zs9dso8FCwkmNIrVtuB7VcJE6msdYBZU77/6XDdKGeMSR24Ojfy
         b68X2iJtRHY0/FXzxwb7gVrvSm8ZGqAstptPsUlBWVnKCyufHMMDHVYFqfnRyc3CiNa6
         yNleYhuM22fRPZf+6wl8eCBgKF+TOF7sLztPbBzwmMoYU1BjTLALh2RAIrl5ylhBiasi
         RHaK1gwfDFm3QBWJDHVlAi72fFMinOga3boV8oOh8/AaLcZ0X/2+S4dQH5Voj5HM652n
         jwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qQK3oz9qbEyhSdrl3bVOwNcv3E2dhXu4IVGnclR+410=;
        b=TkU1s0nRYGcUJv2ZZi5C21qfcT9Q/CHZgDbjLHwN8cc3rL4ebCLrwLAnNyY85TksUw
         VfOiw6sDiKUrNZ3B6RjraqxCUf3mwbjR+a/cBBE4MTMzHehNiFGJY3E3kmJ+RD9Hfxa2
         Gfd0bZepciKVPx5v847ZbLmkFvD3AUlk5v6tjn1sdceRGZTgjKdPvqUFpG4DeRXv5OUF
         90y9SHMECekTMlm7X528fGkF6qQY0akN5Pfbg50+PU/G/T5EvHb7Z78kJu2491cXlUNC
         rzzOJz/6BRsgnWAFiUhkiLyYwhOvYx11A0y2X6hZoGntmFVwQt2pUvkQymNyC0oP/KuB
         wEpQ==
X-Gm-Message-State: ACgBeo1acgvnEPFoLRFpnJw+ScjUR9C4RquJ1AbX0YTevgP/IYoLX0oe
	DJGmhg6FyFsw9SROOhwHsW643Q==
X-Google-Smtp-Source: AA6agR6o7r2+kCKEC0XaLuFu+G6WZijNXigrC6QeFtwmE/pCSyLppgMu1drtiApXCtiavm4n36GGGQ==
X-Received: by 2002:a05:600c:503:b0:3a3:29ec:cd0 with SMTP id i3-20020a05600c050300b003a329ec0cd0mr6067777wmc.63.1659618597960;
        Thu, 04 Aug 2022 06:09:57 -0700 (PDT)
Received: from Balsam-ThinkPad-T480.. (235.163.185.81.rev.sfr.net. [81.185.163.235])
        by smtp.gmail.com with ESMTPSA id o15-20020adfcf0f000000b0021d6a520ce9sm1156817wrj.47.2022.08.04.06.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 06:09:57 -0700 (PDT)
From: bchihi@baylibre.com
To: rafael@kernel.org,
	rui.zhang@intel.com,
	daniel.lezcano@linaro.org,
	amitk@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	mka@chromium.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	james.lo@mediatek.com,
	fan.chen@mediatek.com,
	louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com,
	abailon@baylibre.com
Subject: [PATCH v8.1, 1/7] thermal: mediatek: Relocate driver to mediatek folder
Date: Thu,  4 Aug 2022 15:09:06 +0200
Message-Id: <20220804130912.676043-2-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220804130912.676043-1-bchihi@baylibre.com>
References: <20220804130912.676043-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_061000_547757_A9C57592 
X-CRM114-Status: GOOD (  17.07  )
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

From: Michael Kao <michael.kao@mediatek.com>

Add MediaTek proprietary folder to upstream more thermal zone and cooler
drivers, relocate the original thermal controller driver to it, and rename it
as "mtxxxx_thermal.c" to show its purpose more clearly.

Signed-off-by: Michael Kao <michael.kao@mediatek.com>
Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 drivers/thermal/Kconfig                       | 14 ++++-------
 drivers/thermal/Makefile                      |  2 +-
 drivers/thermal/mediatek/Kconfig              | 23 +++++++++++++++++++
 drivers/thermal/mediatek/Makefile             |  1 +
 .../mtxxxx_thermal.c}                         |  2 +-
 5 files changed, 30 insertions(+), 12 deletions(-)
 create mode 100644 drivers/thermal/mediatek/Kconfig
 create mode 100644 drivers/thermal/mediatek/Makefile
 rename drivers/thermal/{mtk_thermal.c => mediatek/mtxxxx_thermal.c} (99%)

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index 0e5cc948373c..ecba8d6e313b 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -412,16 +412,10 @@ config DA9062_THERMAL
 	  zone.
 	  Compatible with the DA9062 and DA9061 PMICs.
 
-config MTK_THERMAL
-	tristate "Temperature sensor driver for mediatek SoCs"
-	depends on ARCH_MEDIATEK || COMPILE_TEST
-	depends on HAS_IOMEM
-	depends on NVMEM || NVMEM=n
-	depends on RESET_CONTROLLER
-	default y
-	help
-	  Enable this option if you want to have support for thermal management
-	  controller present in Mediatek SoCs
+menu "Mediatek thermal drivers"
+depends on ARCH_MEDIATEK || COMPILE_TEST
+source "drivers/thermal/mediatek/Kconfig"
+endmenu
 
 config AMLOGIC_THERMAL
 	tristate "Amlogic Thermal Support"
diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
index def8e1a0399c..f7daeb8056c4 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -55,7 +55,7 @@ obj-y				+= st/
 obj-$(CONFIG_QCOM_TSENS)	+= qcom/
 obj-y				+= tegra/
 obj-$(CONFIG_HISI_THERMAL)     += hisi_thermal.o
-obj-$(CONFIG_MTK_THERMAL)	+= mtk_thermal.o
+obj-y				+= mediatek/
 obj-$(CONFIG_GENERIC_ADC_THERMAL)	+= thermal-generic-adc.o
 obj-$(CONFIG_UNIPHIER_THERMAL)	+= uniphier_thermal.o
 obj-$(CONFIG_AMLOGIC_THERMAL)     += amlogic_thermal.o
diff --git a/drivers/thermal/mediatek/Kconfig b/drivers/thermal/mediatek/Kconfig
new file mode 100644
index 000000000000..592c849b9fed
--- /dev/null
+++ b/drivers/thermal/mediatek/Kconfig
@@ -0,0 +1,23 @@
+config MTK_THERMAL
+	tristate "MediaTek thermal drivers"
+	depends on THERMAL_OF
+	help
+	  This is the option for MediaTek thermal software
+	  solutions. Please enable corresponding options to
+	  get temperature information from thermal sensors or
+	  turn on throttle mechaisms for thermal mitigation.
+
+if MTK_THERMAL
+
+config MTK_SOC_THERMAL
+	tristate "Temperature sensor driver for MediaTek SoCs"
+	depends on HAS_IOMEM
+	depends on NVMEM
+	depends on RESET_CONTROLLER
+	help
+	  Enable this option if you want to get SoC temperature
+	  information for MediaTek platforms. This driver
+	  configures thermal controllers to collect temperature
+	  via AUXADC interface.
+
+endif
diff --git a/drivers/thermal/mediatek/Makefile b/drivers/thermal/mediatek/Makefile
new file mode 100644
index 000000000000..c2b9a166fbef
--- /dev/null
+++ b/drivers/thermal/mediatek/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_MTK_SOC_THERMAL)		+= mtxxxx_thermal.o
diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mediatek/mtxxxx_thermal.c
similarity index 99%
rename from drivers/thermal/mtk_thermal.c
rename to drivers/thermal/mediatek/mtxxxx_thermal.c
index ede94eadddda..60924f8f98e9 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mediatek/mtxxxx_thermal.c
@@ -23,7 +23,7 @@
 #include <linux/reset.h>
 #include <linux/types.h>
 
-#include "thermal_hwmon.h"
+#include "../thermal_hwmon.h"
 
 /* AUXADC Registers */
 #define AUXADC_CON1_SET_V	0x008
-- 
2.34.1


