Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F547C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 11:48:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E96796140C
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 11:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E96796140C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztImBwIJtx0NMSJPk7QkoH6UqFjwmUgkVT3+AJgESN0=; b=wk9lWBRPHeOP5j
	ni1pXWwZxa5SJJ58CSC8n5X1PW76a2RkJH5fwRN8WOBcpj4vN1SyFYOrl+QS++6llxqyE7gvyeEhh
	Z1GUREPNIge2eXHyDvZDeLuEGMSLhuV+EA3YJskEnITWoHs7V67H7HBV09S0Cs+8bFtT2JpfvtoXN
	SMCyzGrVcsivsFZFkux+bF2Mm1ig3ovL8ePbE72uJXH5wRU7j4MxVXFVEDzA8O/NjIdQvAodd8Qle
	PzhFS0P/8UB/wMYwZgY0AYPy2z118uuIOkmVjqPjPVTtqCT7+XNrtWmDFCCfZw9WIFuqPrEapYq3N
	JVc9VDl4z4DdcHiOahtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltqVC-00A7rH-Fq; Thu, 17 Jun 2021 11:48:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltqV9-00A7n2-64; Thu, 17 Jun 2021 11:48:04 +0000
X-UUID: ff374239b71f43eb87b455e5490737ed-20210617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Aj7xIrVQ3Sh0gssxkYupJqn9EjDMb1u2kCizAO9U3Vs=; 
 b=ePYeaQ3Vzist/Z7zfhxqmcOm978ByboAGK3GnsRnMhkV8kP0Z52rvs4VEjkppQ7HavDTuVJKP4pmxF6jNNqAVlrlE+JyLzEUIMOQ88/MFdjhL61IhthUVcrF0Ao1V1QX9oACf9TDfk28FewfAemtM31mAeooktUyJyCiOB4dVv4=;
X-UUID: ff374239b71f43eb87b455e5490737ed-20210617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ben.tseng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2012058785; Thu, 17 Jun 2021 04:47:58 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 04:47:10 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 19:47:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 19:47:09 +0800
From: Ben Tseng <ben.tseng@mediatek.com>
To: Fan Chen <fan.chen@mediatek.com>, Zhang Rui <rui.zhang@intel.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
CC: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Michael Kao
 <michael.kao@mediatek.com>, Michael Kao <michael.kao@mediatek.comi>, "Ben
 Tseng" <ben.tseng@mediatek.com>
Subject: [PATCH v5 1/3] thermal: mediatek: Relocate driver to mediatek folder
Date: Thu, 17 Jun 2021 19:47:05 +0800
Message-ID: <20210617114707.10618-2-ben.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210617114707.10618-1-ben.tseng@mediatek.com>
References: <20210617114707.10618-1-ben.tseng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_044803_344980_0C560383 
X-CRM114-Status: GOOD (  18.27  )
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

Signed-off-by: Michael Kao <michael.kao@mediatek.comi>
Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
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
index d7f44deab5b1..7a4ba50ba97d 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -401,16 +401,10 @@ config DA9062_THERMAL
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
index 82fc3e616e54..9729a2b08991 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -54,7 +54,7 @@ obj-y				+= st/
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
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
