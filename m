Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC70FC636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 13:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hs0D/uL734o+xZJ1+R+eowXhinuSgJTcIA+zKAafmzQ=; b=U+OqTwotyupL0kDd1p0qFJLrsK
	11vxcoNxFZUIcnIXbE6geWWMSFQ2eL+zFOZ+6W0AP/DD3QT6WrpHcO0heRqjkAv5w5EGxgC3kCX31
	YZicco8XkAepV6+W4XyVcilYS5q8X93kkAB8pUc1ez09YVTeIe8pZq16sUCn2dp58kNAD5QRI3SM1
	gPUqIv/R6EciaoKb1oiQRaMcXngYl0l5lpbKW8cQyCCTarJq5XZ3z4jmd9Tm29dppU1vJzmIGLJNn
	Z4Y90avemdB9hIGT5cLWYXJ/oZqGLDTLVj3lUt1Um/Rwf4rS3WwVtcOo0Pc4AINLYwiAg8zFTd1Tn
	BKeovECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPNjz-00CD5r-Ey; Tue, 07 Feb 2023 13:10:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPNjZ-00CCu1-D3
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 13:10:10 +0000
Received: by mail-wm1-x333.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso13151812wms.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 05:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hs0D/uL734o+xZJ1+R+eowXhinuSgJTcIA+zKAafmzQ=;
        b=ERG5E/37F6FKQsGTyQsxN9KcFtI0nFxQLC3D7yR48cKsyBip781TV32hE8UwbMuZu4
         cWQtyMfBPXflRE/x9iSNK1/SE/3iD0SKINAClMeo7DhJ6rGOJ40b2QN69SFoDH3s1dml
         2dB0pMvB5A5LI5C13oXVSErxPCmadVkE5HG0bJc0aCTYQrsfaS5jDzJxKmBJ1EdhuetU
         KlqUqkjw8GEswd9CpfgwFaJWMaZJTzXHFJgOQincd7LdfhebfMnrlKRybg9d+8DcBVBm
         k1Smv2U6p9tZbkizAv97ZlgnwwD30MUEwg2LnGyIzAZH2Vs6jcPHCzjfmACQR5koRzS0
         94Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hs0D/uL734o+xZJ1+R+eowXhinuSgJTcIA+zKAafmzQ=;
        b=xu+/LJWqJLsTJD2laTXMx89XTBFzJYe7JUIh4SJDEpDe6rjqPL7ywHQLDNtQURdKhT
         kzxJl7acPG0N9CSIIQA0G0FDObf7UFqP1JjeAg8+VATzvEiAMfL2VtCW3Caafs5xn8RC
         3hNQJ7dvlt7STM4NjhDZlqtpyFzmIDt8KJ5yhKiKAm+uuWjEFe3adr5/F5/8PXrZnFWT
         /LPqhRDmkg1PJ46cRRv0ZlNC8XNrqs7ChirIpSKAg62AheV7WzWEsQiZzuC4zLrPbcJa
         3/nJ6QZaxVLxjRl3iWre3eQgohy8OPZ9zsZY5A6ML+cnG5RIKWlD8RsEnbMe/dxh1CBr
         5Dcg==
X-Gm-Message-State: AO0yUKW0JfdW3OJE1f5XixyILUPBzhH8YKbMpRNz1RUB3ku5LP2YV8SS
	iWHKeT6DCPRHqhQ0Spbbd0B//Q==
X-Google-Smtp-Source: AK7set+VqjfHILD76dsrZPIh515FQCoP7zav5wehXlO/DGG3kLRpXd3uhj+9P7NS2nhBhIRqSLcLkg==
X-Received: by 2002:a05:600c:2a08:b0:3db:1d7e:c429 with SMTP id w8-20020a05600c2a0800b003db1d7ec429mr2979363wme.40.1675775401698;
        Tue, 07 Feb 2023 05:10:01 -0800 (PST)
Received: from t480-bl003.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id g24-20020a7bc4d8000000b003df30c94850sm17987385wmk.25.2023.02.07.05.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 05:10:01 -0800 (PST)
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
Subject: [PATCH v13 1/6] thermal: drivers: mediatek: Relocate driver to mediatek folder
Date: Tue,  7 Feb 2023 14:09:53 +0100
Message-Id: <20230207130958.608305-2-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207130958.608305-1-bchihi@baylibre.com>
References: <20230207130958.608305-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_051005_514898_3E9836EA 
X-CRM114-Status: GOOD (  16.61  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
index e052dae614eb..d35f63daca3b 100644
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
index 2506c6c8ca83..766ce38ff4f3 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -55,7 +55,7 @@ obj-y				+= st/
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
index 8440692e3890..b4ef57fa9183 100644
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


