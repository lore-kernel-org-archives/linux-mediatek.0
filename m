Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B4EC677F1
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 15:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VSnhqLrpT6kDXZFeOhmvYh0g128g6QipzNoayDzA2s=; b=Jcp1Mo3HIkGORtLzpUJTmIEjl3
	hQGBjas+tjcGGHmRCxPzo4jfj0PRIhiA31uQoAK00p091lsxDeQekfB9VYTvY8rxFdGX+whplw3x9
	LXIVsQCiDaTHCDZ4omFUwVYLAypIh6pGRt4hkBxhK7Rbjs2hxUQI8ePBJdbvRVWbyvuTQGwY0QoMR
	06eh6UnNOeX1Y4a2LHYNOETY2bWN1B4epSvR+9j9lOP//Jt6IB9XLBmAErUnKBgKS5drphz4M5frp
	xD4TIAik8oB//N8ea7P9HYFHZ113j1SkM8mKTOiDJTICQbu9IxomXWN3cduEK9NBl6pcsyCZifRbD
	q1d/bPrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFzX0-00Fema-Tp; Thu, 12 Jan 2023 15:30:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFzWi-00FeaO-5C
	for linux-mediatek@lists.infradead.org; Thu, 12 Jan 2023 15:30:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id az7so18455518wrb.5
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jan 2023 07:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VSnhqLrpT6kDXZFeOhmvYh0g128g6QipzNoayDzA2s=;
        b=6M9RLTA5Z33oePTWgAfJnIQq8S7p/3hEE+PdOcvkwXq22q+OfT3/YVb7tx3hEhuBjf
         mDlcfxv3F0qqU0IWUty+rXELBSKB5EcFfqkPdWRyDHetmA5pFUg0RCLO9GDcw4SNecw4
         yw7NcFGG0hG149TqHPat3QuzKPbIei5z7gNdVPNI6d+47K7vka6ZnE+MMCAjhN5wrqfE
         TKpEWj0AHGaqChjvXWbZ4d2AS3DpvgzRHdwepCJwYyPS4b3wuG+wwKuW/YCPeAbQOKIM
         Xtk1BvnTjDLjg/jD77Lx0necyYZH9PZgHdO/P4Mk4G6hrOFR+QOa2upVwNIwMjw+JNWQ
         LwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6VSnhqLrpT6kDXZFeOhmvYh0g128g6QipzNoayDzA2s=;
        b=iXq4K0CnpXJ6P3BOvT6Wnnl9Xg+3OCKcuPOXuLlf3cikdbjQHGmO9XpZ6ac5R8mrQN
         wgBfpaRisN009aqWbVjNobXx6ieSyZ+q41+ca5OFlOFxg9QGougcOW5ZLxoG09JGYv0h
         eTN+ZjFK1m+OAJqrk0n0ii6GVN9tuIABYXXy1zFZr0v+PfplGbfiyC2tZ3Ij/oe/0CF/
         laZ3y96Zpb0nMS6H7JPVVzrndTHJME7ouBPwY0w81yR7G+Ij2pqG17SHS4NMThotR7r1
         SISFlWVkRapHQE/ROulFS0Kbs2ZK/oWgrRG5oS99h7HIr0JlKnKD5NxU8oiYyrgAN27x
         NGWw==
X-Gm-Message-State: AFqh2kqTPNFNIkTqMHEVx404yLCKIjK8fKyvAesATHHnkB6PdWBKFCxe
	T6DXf9TuefvSaNRVsiZAvBkXsg==
X-Google-Smtp-Source: AMrXdXvEoQgI2eXT9O5ckmEyeTqmzS30OebJWKdvsHSO/7lsjVgwwJatA7JXjPKVQLFOhqft2to5qg==
X-Received: by 2002:adf:e6ce:0:b0:293:1089:d6a with SMTP id y14-20020adfe6ce000000b0029310890d6amr29501933wrm.39.1673537393977;
        Thu, 12 Jan 2023 07:29:53 -0800 (PST)
Received: from t480-bl003.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id l24-20020a1ced18000000b003d99da8d30asm26395909wmh.46.2023.01.12.07.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 07:29:53 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH v10 1/6] thermal/drivers/mediatek: Relocate driver to mediatek folder
Date: Thu, 12 Jan 2023 16:28:50 +0100
Message-Id: <20230112152855.216072-2-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112152855.216072-1-bchihi@baylibre.com>
References: <20230112152855.216072-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_073000_284665_623D0592 
X-CRM114-Status: GOOD (  16.70  )
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


