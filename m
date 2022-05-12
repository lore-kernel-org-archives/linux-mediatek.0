Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EA0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 12:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LCDEtrbbpZdYNIuFJuNyom7rZbYv1LqEzbz0mER6JS0=; b=AhwoUeUy2nDoiv
	BIztdsRNdrW5mxsm/UNKNLVxeLF9JwsKxmDKBEMu105t6v2C6vbgpby+K8IYFZ48XWO7Qia/3bVH0
	GybUpslVBURoT3OFVH/QivzAJODeBGt3UZ6D2RmSkK6++Qi1svNOkvjUHizPkk2KW+hK5Zhl+C9yn
	LjeA7jkwghQS6oWuvztH+5mc+QWRnbjN0UuKsxRSe9X5Q0USaqW8bIR/UgIa3k55bPkWDZ7lSIZsw
	O7UHM4+KWVvrkeKtGDEclGlvpOSERsxo3VoSpX/ipDbhPFEyW8BmQIzE++52R6NDUcb+LwmiLDzGO
	VqZ9/FwJn0BSX8FQBpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np7sI-00BmWj-0j; Thu, 12 May 2022 12:24:58 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np7s1-00BmIg-VT
 for linux-mediatek@lists.infradead.org; Thu, 12 May 2022 12:24:43 +0000
Received: by mail-wr1-x433.google.com with SMTP id k2so7036031wrd.5
 for <linux-mediatek@lists.infradead.org>; Thu, 12 May 2022 05:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HfH019+cT0njZgEoB5v4us8H/Co27KMCU86/mPoLRqg=;
 b=A7TMJCxmk4lkEBYyfuuMZ5/cY5FebO7K8BkFV3Er9WuM1U2jurjR0UE9SnNbacNFlA
 vXe6CyqK5xafOBbYPM6wWQ3ch4xeaMAQR+4MZ1AB0vkYdOdTq+RngYD+JqfrsP/nzHJl
 ZVsDSKx0VaAKb696NNVvGQU/J9LIZizmnigESNEON8zuHSJGbf9BxxYIKoNu9a0MX3wn
 9flx1OgMgaooNRHbhFXWKg7LX3HfHQRkPAs4sZ6xETG5kI0LAxbFNSDv3ykm5nTfDBGL
 fZmsHZIdLC/LJCq4aEQ6BMtiHSnhVgB9w9aLAqAI93C+8Uh87Q+bkkek+PBqrGjYh7Uj
 QioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HfH019+cT0njZgEoB5v4us8H/Co27KMCU86/mPoLRqg=;
 b=P1jIECYHWYBSLzMMfY2tUokWqDjIHbx6L2lnoSo3IIjYDCd8xuyVWeryr/embDiZYf
 wlsWzDr1SD39Eqs3cVfTvjHojs6Un9i1GwgWLL9N0uQblx1jiZOKVKfIpVjVvIEzqi2V
 6PDz5uAJf0H9MchJDgvDHh3IrX4s2Tgt96wvosnwOfcKSBzbiMVcbU9aBpqmPJ/xYJvk
 uC+VrpI+qcHspR3cweyAkFjAinObhZRuqDfGh6q27J96urG4l6Is2+hi+o4KAJxQwJqB
 8slkoZ+S0OqWfqsC8NSBlTttInfRWDtFGkXXlgDcGCk99dpGTVOE8k4xbNkDJOXEOdH5
 EJ0A==
X-Gm-Message-State: AOAM531ScZ3i9LYHTr2NwA0uP1lJUu2qOiOs0HbAx5+dcHTL6ENKc3lc
 BcuFxisZzeHL+r7PyTrfO0LSww==
X-Google-Smtp-Source: ABdhPJxWFKFcvfIhGck12vzg6QdmKoi3QsdXBypkekPwJfM4MQvTVlUyQyX9WZNJ3Uv1LPsj0I9o/A==
X-Received: by 2002:a5d:6183:0:b0:20a:db51:f21a with SMTP id
 j3-20020a5d6183000000b0020adb51f21amr27404955wru.127.1652358278336; 
 Thu, 12 May 2022 05:24:38 -0700 (PDT)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a7bc156000000b003942a244f30sm3047819wmi.9.2022.05.12.05.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 05:24:38 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: robh+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Subject: [PATCH v6 1/7] thermal: mediatek: Relocate driver to mediatek folder
Date: Thu, 12 May 2022 14:24:27 +0200
Message-Id: <20220512122433.1399802-2-abailon@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512122433.1399802-1-abailon@baylibre.com>
References: <20220512122433.1399802-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_052442_080315_40F31B6E 
X-CRM114-Status: GOOD (  15.98  )
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
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org,
 khilman@baylibre.com, linux-pm@vger.kernel.org, amitk@kernel.org,
 linux-kernel@vger.kernel.org, michael.kao@mediatek.com,
 ethan.chang@mediatek.com, linux-mediatek@lists.infradead.org,
 Michael Kao <michael.kao@mediatek.comi>, rui.zhang@intel.com,
 ben.tseng@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Michael Kao <michael.kao@mediatek.com>

Add Mediatek proprietary folder to upstream more thermal zone and cooler
drivers. Relocate the original thermal controller driver to it and rename
as soc_temp.c to show its purpose more clearly.

Signed-off-by: Michael Kao <michael.kao@mediatek.comi>
Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
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
index e37691e0bf20..8669d7278055 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -410,16 +410,10 @@ config DA9062_THERMAL
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
index f0c36a1530d5..9ade39bdb525 100644
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
index 000000000000..0351e73170b7
--- /dev/null
+++ b/drivers/thermal/mediatek/Kconfig
@@ -0,0 +1,23 @@
+config MTK_THERMAL
+	tristate "Mediatek thermal drivers"
+	depends on THERMAL_OF
+	help
+	  This is the option for Mediatek thermal software
+	  solutions. Please enable corresponding options to
+	  get temperature information from thermal sensors or
+	  turn on throttle mechaisms for thermal mitigation.
+
+if MTK_THERMAL
+
+config MTK_SOC_THERMAL
+	tristate "Temperature sensor driver for mediatek SoCs"
+	depends on HAS_IOMEM
+	depends on NVMEM
+	depends on RESET_CONTROLLER
+	help
+	  Enable this option if you want to get SoC temperature
+	  information for Mediatek platforms. This driver
+	  configures thermal controllers to collect temperature
+	  via AUXADC interface.
+
+endif
diff --git a/drivers/thermal/mediatek/Makefile b/drivers/thermal/mediatek/Makefile
new file mode 100644
index 000000000000..f75313ddce5e
--- /dev/null
+++ b/drivers/thermal/mediatek/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_MTK_SOC_THERMAL)	+= soc_temp.o
diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mediatek/soc_temp.c
similarity index 100%
rename from drivers/thermal/mtk_thermal.c
rename to drivers/thermal/mediatek/soc_temp.c
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
