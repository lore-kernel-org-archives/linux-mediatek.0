Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52592C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 15:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTkY6Z+Bj7YNGjQITa/f/2VLSchWwUACN0DrkCvhd14=; b=ePbMbr7z0Td/8f
	19s3fdpPBPe8JU1OdxCf4UKDpqhhBxQBfCG4lTk1IwAse2+iXoQDbQrm/s0WejCIJDbgbS/W0MlSx
	9Tgck0zpNqf9+54Rn+evpeJnGMN4X/oC4Ivb+yNdwS4VyDzGdXQvxX6YRBct/5ArW1KFuMzqC5o6f
	p3Fn0lPXholHki8+RsnJVlOc6tmctJ2pW5J76zHTjWV1eBrVer9xfbJ+PLWl3SVAtQNRjrih/eK0a
	Iwky/ukj1HVNsFB+SgRangmpp8oMHXy38k6HBNTWpdGgrqBkYfW6W9mwX6VOV1dmDCXUdHSqlJLvv
	Jy7jWbwZ1pQtdFpUYYRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntWSO-008Rmq-MS; Tue, 24 May 2022 15:28:24 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntWS8-008Rdj-0Z
 for linux-mediatek@lists.infradead.org; Tue, 24 May 2022 15:28:09 +0000
Received: by mail-wr1-x42c.google.com with SMTP id p10so7596671wrg.12
 for <linux-mediatek@lists.infradead.org>; Tue, 24 May 2022 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MuJUprVkec1LhN6o7SGN7yS6FtU75T+9Wd1DOyeL8ik=;
 b=cXViV63iRSsMqW3XAi/zQKnSpJARlA/rf5fRH6+kSetZovEs5U2oYe2hHvprEFaZFr
 vHgoIQ2/m6pWstO2paqiiTVf1lazwwki/PMZiHiAwFraMXiFSjb7z18b4hFHGOr7faY4
 qMQSahJsZlMtKLt4yxdownjKXhfxRs+b9tCxfa8ZTK4/ODqqAbnDW9GZ5YfaRk72rN9D
 Nkv+lT52o+aTj/2yun+3xAdvR4DxtZfe4ohuen7ZrwxA18kX4hmEp3EoKKt4DjMpC68e
 aLvca5iCRNTTJThD/PeYwqHLB0fAdmQi1qkDsDsw2RxTN11aY0cC3/ugEnClljCb4ZZF
 XJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MuJUprVkec1LhN6o7SGN7yS6FtU75T+9Wd1DOyeL8ik=;
 b=M6Zj+tu7kvZ52W9vxFLEaIj9qdJJfTSECRA/JL8P3GeB05AQoFUbWssx4t62t+qFom
 AGVSKSEZyWLM1pQbciE56RZfuJ8beskOKMLwl0rQ9Z7+ajRUv1LO4liXow6csBWspFFn
 OVs5cwDCReZ0KJb1ftAFZ7X4gCXvv+aUk31blRawcDXF2/Fj/RbT5u0CJNMM0NGAjkct
 x0IQrVCLwaoiWWq+BA9OjRJeGXiINEkLuSKq36ZHuVqj7jaCAT8fvDZVahs5ynHs381x
 J0IS21rY5ZOUin8udz10XqoD6K8BsPpMYrzwvTR5AtTKpHPEDiee7mjR6UrAED4+pT/t
 FmwQ==
X-Gm-Message-State: AOAM533bEw+fqfDABMPsNLhrIsMZg9lh1ZjSqbhYV10OFTmqFjs2AA/L
 3Ta+jmaCB4gN15U+lbOsqnyWhQ==
X-Google-Smtp-Source: ABdhPJwGvaG1N+rlSqIUh/89AyIZlqskmxR/ikdhIJdjlbxerIP+U4FECFmabv4sskd0a2Nbk5lnWQ==
X-Received: by 2002:a05:6000:178d:b0:20f:e7da:6a21 with SMTP id
 e13-20020a056000178d00b0020fe7da6a21mr6657054wrg.689.1653406084354; 
 Tue, 24 May 2022 08:28:04 -0700 (PDT)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c1c9800b003974027722csm2703693wms.47.2022.05.24.08.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:28:03 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
 amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 Michael Kao <michael.kao@mediatek.com>, Ben Tseng <ben.tseng@mediatek.com>
Subject: [PATCH v7 1/6] thermal: mediatek: Relocate driver to mediatek folder
Date: Tue, 24 May 2022 17:25:48 +0200
Message-Id: <20220524152552.246193-2-abailon@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220524152552.246193-1-abailon@baylibre.com>
References: <20220524152552.246193-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_082808_105116_CBF235A5 
X-CRM114-Status: GOOD (  15.87  )
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

From: Michael Kao <michael.kao@mediatek.com>

Add Mediatek proprietary folder to upstream more thermal zone and cooler
drivers. Relocate the original thermal controller driver to it and rename
as soc_temp.c to show its purpose more clearly.

Signed-off-by: Michael Kao <michael.kao@mediatek.com>
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
