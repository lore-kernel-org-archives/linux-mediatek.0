Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF25C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 13:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbG1VUJ5DCdqW4qKVLb28pqzoz5xr35SQ4g7vLEm4Sc=; b=eKxRO8gZq7O2q+Sw3Z8DMP31f2
	J88MjAeSGhWEHL4PkyJZWs1BKG51oZ7SPQQUddbfIf3+5tbwAdd+OMAArCF8J2UOnCrT5va5deDnC
	2T0d9CbUZ6OVuBI5QcX0m1bHrDiYFJ6h88bQsGFGYlvCZ+9c0Ocqie5TG8T8cmZOW/MHli7D36Aoh
	ye7ztF6vYY+c1nVyXqU37xTh3YbgWSMzQ68/OF2q71Cjkh0CA6Rrc8M8p8zpmRUqPIttUmT9Tm1pD
	+m2eKBaOC/lCSblJy1+rKx5W4wRjGh4tROyYCs5zsxIKuo9+PPN/NcUfew2yKF+QzdyVOGf+4BONT
	9kgZat9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJBf-003vLy-4m; Tue, 24 Jan 2023 13:18:07 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJAu-003v3U-24
	for linux-mediatek@lists.infradead.org; Tue, 24 Jan 2023 13:17:25 +0000
Received: by mail-wr1-x42c.google.com with SMTP id y1so9353191wru.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jan 2023 05:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbG1VUJ5DCdqW4qKVLb28pqzoz5xr35SQ4g7vLEm4Sc=;
        b=HsOffWvbDcnd8huZicXYTVp9PMK8+3GkWV2bBS5qYnTquiZs31oZwtOKNKAy/6glna
         8o+xXHmjVyzolHN/kgsLTeYTbuBjNaLlCSgPpYUvtTSIWVfhW1namk40gwYLUobxKjW9
         UfvUBp9efU2T9WYYTOfNZWmR1+NtEmvuCCWiHgUuBe+c1Q3SWHLBlsydRY30F+gJsYi8
         I5QWwyEW71KvhVNTkQL866BNUy/40BEszqzOoqctwLUx0gbhlO4j71Nt13RJcGVBlx03
         +ctMyO32o8ihiZtw7LAl5UKYG4vteM3kvHye6waXxNjfcPO3rBQ4yq+XlfJJGZf76QEd
         IAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbG1VUJ5DCdqW4qKVLb28pqzoz5xr35SQ4g7vLEm4Sc=;
        b=Va7bvZM8NMM9FOuq8haRvjrC5v2oIxRThEOK3GYpHdeTgQ0AO6eGTZ/8mcl5VXfBZy
         CEGiniEkn5gkcbB4rozR+tpQf6S54+3WjRylEkMZAcwt1Hg4XE9gmAU5TRVSR42ZR3Bu
         TZ+nd6ftN8DeCAg3qiquqVk0UpIYej8F8zdo98FaAMBK96nr8djgHZYF91AKqDtMTYql
         +GTlKI9mvpX2DOP3jZOZMt8nROUON71uaqYvAqdkb5ygqCPswus50LpdYtxci++y4auQ
         SVIxXYdZvOUzF/8v20yZ2Chjx85LwJmoZHnc+V6LPSP1jZ1IuNhylkWe4BmqPdYpQdTm
         mrmQ==
X-Gm-Message-State: AO0yUKWwUPKdC4SLR5QgWUruW7lK5Cc8xxShVd7hm3bVuaBgQ1NIYzWE
	fDPe5IPTrfW8x2vl2jKazUGv8A==
X-Google-Smtp-Source: AK7set+vEkto6LwyUQvRQPih1O8ez4C6gcSMIx1VwLi+U88x8djEiit6DYvHKH0C0Knqxm0WgdJCbQ==
X-Received: by 2002:a05:6000:5:b0:2bf:ae2f:c6ff with SMTP id h5-20020a056000000500b002bfae2fc6ffmr2466799wrx.31.1674566238435;
        Tue, 24 Jan 2023 05:17:18 -0800 (PST)
Received: from t480-bl003.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id a5-20020adfeec5000000b002bfb5ebf8cfsm49427wrp.21.2023.01.24.05.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 05:17:18 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH v11 1/6] thermal/drivers/mediatek: Relocate driver to mediatek folder
Date: Tue, 24 Jan 2023 14:17:12 +0100
Message-Id: <20230124131717.128660-2-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124131717.128660-1-bchihi@baylibre.com>
References: <20230124131717.128660-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_051720_354338_AB618543 
X-CRM114-Status: GOOD (  16.90  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

Add MediaTek proprietary folder to upstream more thermal zone and cooler
drivers, relocate the original thermal controller driver to it, and rename it
as "auxadc_thermal.c" to show its purpose more clearly.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 drivers/thermal/Kconfig                       | 14 ++++---------
 drivers/thermal/Makefile                      |  2 +-
 drivers/thermal/mediatek/Kconfig              | 21 +++++++++++++++++++
 drivers/thermal/mediatek/Makefile             |  1 +
 .../auxadc_thermal.c}                         |  2 +-
 5 files changed, 28 insertions(+), 12 deletions(-)
 create mode 100644 drivers/thermal/mediatek/Kconfig
 create mode 100644 drivers/thermal/mediatek/Makefile
 rename drivers/thermal/{mtk_thermal.c => mediatek/auxadc_thermal.c} (99%)

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index eaeb2b2ee6e9..4cd7ab707315 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -416,16 +416,10 @@ config DA9062_THERMAL
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
index 60f0dfa9aae2..1c460d189bd7 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -56,7 +56,7 @@ obj-y				+= st/
 obj-y				+= qcom/
 obj-y				+= tegra/
 obj-$(CONFIG_HISI_THERMAL)     += hisi_thermal.o
-obj-$(CONFIG_MTK_THERMAL)	+= mtk_thermal.o
+obj-y				+= mediatek/
 obj-$(CONFIG_GENERIC_ADC_THERMAL)	+= thermal-generic-adc.o
 obj-$(CONFIG_UNIPHIER_THERMAL)	+= uniphier_thermal.o
 obj-$(CONFIG_AMLOGIC_THERMAL)     += amlogic_thermal.o
diff --git a/drivers/thermal/mediatek/Kconfig b/drivers/thermal/mediatek/Kconfig
new file mode 100644
index 000000000000..7558a847d4e9
--- /dev/null
+++ b/drivers/thermal/mediatek/Kconfig
@@ -0,0 +1,21 @@
+config MTK_THERMAL
+	tristate "MediaTek thermal drivers"
+	depends on THERMAL_OF
+	help
+	  This is the option for MediaTek thermal software solutions.
+	  Please enable corresponding options to get temperature
+	  information from thermal sensors or turn on throttle
+	  mechaisms for thermal mitigation.
+
+if MTK_THERMAL
+
+config MTK_SOC_THERMAL
+	tristate "AUXADC temperature sensor driver for MediaTek SoCs"
+	depends on HAS_IOMEM
+	help
+	  Enable this option if you want to get SoC temperature
+	  information for MediaTek platforms.
+	  This driver configures thermal controllers to collect
+	  temperature via AUXADC interface.
+
+endif
diff --git a/drivers/thermal/mediatek/Makefile b/drivers/thermal/mediatek/Makefile
new file mode 100644
index 000000000000..53e86e30b26f
--- /dev/null
+++ b/drivers/thermal/mediatek/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_MTK_SOC_THERMAL)	+= auxadc_thermal.o
diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
similarity index 99%
rename from drivers/thermal/mtk_thermal.c
rename to drivers/thermal/mediatek/auxadc_thermal.c
index 9a8b107900e9..90ae6b5c530e 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -23,7 +23,7 @@
 #include <linux/reset.h>
 #include <linux/types.h>
 
-#include "thermal_hwmon.h"
+#include "../thermal_hwmon.h"
 
 /* AUXADC Registers */
 #define AUXADC_CON1_SET_V	0x008
-- 
2.34.1


