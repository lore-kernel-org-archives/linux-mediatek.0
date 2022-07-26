Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635B0C19F28
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 13:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRSOiGoOrC3t6wEy50JVXbhAW+sBGO47FPfpEcofjB8=; b=uvgdET4XEdDd6WjwMICFxxKlIR
	QO6gVOkFWeRO9R3Vg5tHouu60MY2IeQdmqNPAUM3Am+iRPj63L3eLK/w4At05DpUHF7y/6JirQjI9
	JixAR9Ks0ILGd0A58fhO31n6sydE4+lkA9pLPtTaMC7RlaNgFebgPQVbDvfjEYC5uXQ5wE9TqjYJ2
	RvguFf+7+A8UbbAsf3K0vjAvNrOmplb72ppppiUML8rWP1AqCc0JcVMnUcvgEF+y75bn1OkKYSnta
	O4+cuw05VlJ/aIl0EiAGDG9/FmTIq8gazO9As4Gz+QAo2j/Aq0E0o6Ue9+M+/dDlvCjlxFZcUFtbM
	RUyRJzOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGL1x-00HYa4-7L; Tue, 26 Jul 2022 13:55:25 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGL1s-00HYTs-8T
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 13:55:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id r132-20020a1c448a000000b003a34ac64bdfso56954wma.1
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 06:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dRSOiGoOrC3t6wEy50JVXbhAW+sBGO47FPfpEcofjB8=;
        b=Q+lQXfSdOYweTtKJzxbiF6vBOxH9h8OdLAHXNf/n0nG6zsCHE8AIpH+/efmpIfnSRc
         Pb5WdypcpBZ0VfseNJOCz0myvzz0WKHSKRRcoqBOFOBq5i52ipO0k9/3pxvi+IQz0VrO
         o+9cd6Vn18+wEWbiluJSex6r/LS/g08vtVCxyAAEupZ3hFGT2vkq4G2mNkugcwK+qF/K
         I59oL2bZApaGz0jb724KWJihbYPcW1O2rfbp/Qu9jezJSuKlTXOrWnri+jBOwmjCW3ez
         FMJTJdXozKK+IlM/hsHcqwmnOt3jEt6F29jaq05vpEaxSKzbPLiYAkeEReFg1fzDhoTC
         xNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dRSOiGoOrC3t6wEy50JVXbhAW+sBGO47FPfpEcofjB8=;
        b=Fu6XX1m5qdw/nyhyD5xr91KA5hZh1NltT7SU8BMXg7LasdhPOenziUuvqeCG4FgW+n
         Bw3MdOtJ3TDGQtDpYygdqWs04td89m1Hj3a6yGcL7bdMEWzKWly44dtkvYW3BkBs4GyV
         YzspDdiwBnbXEsZx/CZPpx8l+fsSB1Am3Zgscjp5sygsMO9XBD7CFmCZywflqPSx4mwp
         d0g6zt+nWFj7uGWlCl36tjqOMQjX6ry/K83EjNNiAcow3bXrfcbb7o9lW3GKctVO9UnL
         fk3kyrSRoNNNee6EA/S5YPLOchYN1fkqevCNQPkdwkuw3L6LMZY8LCTUDCpwd6zdrMwx
         Th1w==
X-Gm-Message-State: AJIora/nBX/F4gj+bhZn+DYAL5tbKdFqN0SLlbuEYmX+5ZLGVPOXlvze
	Q5YvwRhGdXQCQdcih9xn37NJQw==
X-Google-Smtp-Source: AGRyM1sZyxeaEgHhGQ13XRG2/v6xEMkLueksUGhv81nQ0+a33FhA+AF4RlQf1XcXAmF6X3BM1I5mRA==
X-Received: by 2002:a05:600c:3c91:b0:3a3:5230:1a6d with SMTP id bg17-20020a05600c3c9100b003a352301a6dmr8742885wmb.11.1658843717838;
        Tue, 26 Jul 2022 06:55:17 -0700 (PDT)
Received: from Balsam-ThinkPad-T480.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d13-20020adf9c8d000000b0021e4c3b2967sm15244670wre.65.2022.07.26.06.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 06:55:17 -0700 (PDT)
From: Balsam CHIHI <bchihi@baylibre.com>
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
Subject: [PATCH v8 1/6] thermal: mediatek: Relocate driver to mediatek folder
Date: Tue, 26 Jul 2022 15:55:01 +0200
Message-Id: <20220726135506.485108-2-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726135506.485108-1-bchihi@baylibre.com>
References: <20220726135506.485108-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_065520_330821_14788958 
X-CRM114-Status: GOOD (  16.25  )
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

Add Mediatek proprietary folder to upstream more thermal zone and cooler
drivers. Relocate the original thermal controller driver to it and rename
as soc_temp.c to show its purpose more clearly.

Signed-off-by: Michael Kao <michael.kao@mediatek.com>
Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 drivers/thermal/Kconfig                       | 14 ++++-------
 drivers/thermal/Makefile                      |  2 +-
 drivers/thermal/mediatek/Kconfig              | 23 +++++++++++++++++++
 drivers/thermal/mediatek/Makefile             |  1 +
 .../{mtk_thermal.c => mediatek/soc_temp.c}    |  0
 5 files changed, 29 insertions(+), 11 deletions(-)
 create mode 100644 drivers/thermal/mediatek/Kconfig
 create mode 100644 drivers/thermal/mediatek/Makefile
 rename drivers/thermal/{mtk_thermal.c => mediatek/soc_temp.c} (100%)

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
index def8e1a0399c..3c00e864ad55 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -55,7 +55,7 @@ obj-y				+= st/
 obj-$(CONFIG_QCOM_TSENS)	+= qcom/
 obj-y				+= tegra/
 obj-$(CONFIG_HISI_THERMAL)     += hisi_thermal.o
-obj-$(CONFIG_MTK_THERMAL)	+= mtk_thermal.o
+obj-$(CONFIG_MTK_THERMAL)	+= mediatek/
 obj-$(CONFIG_GENERIC_ADC_THERMAL)	+= thermal-generic-adc.o
 obj-$(CONFIG_UNIPHIER_THERMAL)	+= uniphier_thermal.o
 obj-$(CONFIG_AMLOGIC_THERMAL)     += amlogic_thermal.o
diff --git a/drivers/thermal/mediatek/Kconfig b/drivers/thermal/mediatek/Kconfig
new file mode 100644
index 000000000000..9c41e9079fc3
--- /dev/null
+++ b/drivers/thermal/mediatek/Kconfig
@@ -0,0 +1,23 @@
+config MTK_THERMAL
+	tristate "MediaTek thermal drivers"
+	depends on THERMAL_OF
+	help
+		This is the option for MediaTek thermal software
+		solutions. Please enable corresponding options to
+		get temperature information from thermal sensors or
+		turn on throttle mechaisms for thermal mitigation.
+
+if MTK_THERMAL
+
+config MTK_SOC_THERMAL
+	tristate "Temperature sensor driver for MediaTek SoCs"
+	depends on HAS_IOMEM
+	depends on NVMEM
+	depends on RESET_CONTROLLER
+	help
+		Enable this option if you want to get SoC temperature
+		information for MediaTek platforms. This driver
+		configures thermal controllers to collect temperature
+		via AUXADC interface.
+
+endif
diff --git a/drivers/thermal/mediatek/Makefile b/drivers/thermal/mediatek/Makefile
new file mode 100644
index 000000000000..4b4cb04a358f
--- /dev/null
+++ b/drivers/thermal/mediatek/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_MTK_SOC_THERMAL)		+= soc_temp.o
diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mediatek/soc_temp.c
similarity index 100%
rename from drivers/thermal/mtk_thermal.c
rename to drivers/thermal/mediatek/soc_temp.c
-- 
2.34.1


