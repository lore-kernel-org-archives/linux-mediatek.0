Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE53E95A91
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BGDZ5iuInPSGGOQdj+ARhU721cI6klKpiNOn02gG0lk=; b=i88IRSJyuzoV0+0QCxINEfzqYw
	9wzLm4PARZEyIeZsYQufxS0w5wphw3I9SXsIW7D7SPxmJlLUoq0RSJ7gVcTcImuHGu4vX4VXZduah
	+eyQEEowrhDpqpbRb591Hy7Nnl5n3NMkv0/PXgEdvAU1XwclqTWtUOJlF43pMNYNJBlts1yLywRS8
	ANp2Ov8ehQ+OKeix7ejHrUBQA8t0Ama4dvboBn/7oI0g6Bxt7m2j9vmk7kW/Oaj/q8W5u5eRVjc48
	VelCrs2VgMj2H0P+hAGIR/1VuXBDdDrk0r+NumwaCMT5/gqIJ7a1Pp4NcYDQ1jYQTkJNPPeQXGvN6
	2cciAXOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpsg4-00B7Nm-2r;
	Mon, 09 Oct 2023 16:00:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpsg1-00B7Mk-1E
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Oct 2023 16:00:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpsfe-0001Rk-Q1; Mon, 09 Oct 2023 17:59:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpsfa-000S2K-V4; Mon, 09 Oct 2023 17:59:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpsfa-00COV8-LE; Mon, 09 Oct 2023 17:59:46 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: SOF: Convert to platform remove callback returning void
Date: Mon,  9 Oct 2023 17:59:45 +0200
Message-Id: <20231009155945.285537-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7396; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Q9/KBGD+XGVZ0UZsC4DJ45wfffx2bZ/WHlvP7GfhKsU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlJCNwgmfg7er1IvTbmxgvFe1UXFCkSABq/yQt5 SWpzUZa53aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSQjcAAKCRCPgPtYfRL+ TiZ1CACvkN8puqg2dfVv6uRqViQE84eMKq/yYGa6ecR04VSh9DsFufeHc1LxyZwTCrBq7Lc+YtL GjoEwr8MZRE5aLd4YiTyK+8PfFUk1apFbKkhKO4ciNkeKIav2Yd6rLFBhpLpY5QjdG02yf25yY5 1gPOKjHaCyZdYtn5wXj5GdQnzSO/RKMYDuGUrLY9kHBg5I7bfeqlpMtqqvSf+IRUFzEt6dSTpHX t8sU9DK1DXcz8Mx/QnatAaCARZpojdfzfdomGCCpPSvrBfCpG6BpyJ93R0o+O3oyKsZp/HRDeep GCcQjaidvDIelehrT6NSEwtNju2zjsJtEvtocQ9EmW/gw5Zo
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_090013_579787_7EACFDFF 
X-CRM114-Status: GOOD (  18.10  )
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

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

The SOF platform drivers all use either sof_of_remove() or
sof_acpi_remove() which both return zero unconditionally. Change these
functions to return void and the drivers to use .remove_new(). There is
no semantical change.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/sof/imx/imx8.c               | 2 +-
 sound/soc/sof/imx/imx8m.c              | 2 +-
 sound/soc/sof/imx/imx8ulp.c            | 2 +-
 sound/soc/sof/intel/bdw.c              | 2 +-
 sound/soc/sof/intel/byt.c              | 2 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 sound/soc/sof/sof-acpi-dev.c           | 4 +---
 sound/soc/sof/sof-acpi-dev.h           | 2 +-
 sound/soc/sof/sof-of-dev.c             | 4 +---
 sound/soc/sof/sof-of-dev.h             | 2 +-
 11 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 2844d9a8040a..5f81d562f9a4 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -650,7 +650,7 @@ MODULE_DEVICE_TABLE(of, sof_of_imx8_ids);
 /* DT driver definition */
 static struct platform_driver snd_sof_of_imx8_driver = {
 	.probe = sof_of_probe,
-	.remove = sof_of_remove,
+	.remove_new = sof_of_remove,
 	.driver = {
 		.name = "sof-audio-of-imx8",
 		.pm = &sof_of_pm,
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 1243f8a6141e..1573eecca781 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -495,7 +495,7 @@ MODULE_DEVICE_TABLE(of, sof_of_imx8m_ids);
 /* DT driver definition */
 static struct platform_driver snd_sof_of_imx8m_driver = {
 	.probe = sof_of_probe,
-	.remove = sof_of_remove,
+	.remove_new = sof_of_remove,
 	.driver = {
 		.name = "sof-audio-of-imx8m",
 		.pm = &sof_of_pm,
diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
index 4a562c9856e9..3c26eba19cf9 100644
--- a/sound/soc/sof/imx/imx8ulp.c
+++ b/sound/soc/sof/imx/imx8ulp.c
@@ -502,7 +502,7 @@ MODULE_DEVICE_TABLE(of, sof_of_imx8ulp_ids);
 /* DT driver definition */
 static struct platform_driver snd_sof_of_imx8ulp_driver = {
 	.probe = sof_of_probe,
-	.remove = sof_of_remove,
+	.remove_new = sof_of_remove,
 	.driver = {
 		.name = "sof-audio-of-imx8ulp",
 		.pm = &sof_of_pm,
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 812a49b1d3f4..2b8fa5fba17b 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -684,7 +684,7 @@ static int sof_broadwell_probe(struct platform_device *pdev)
 /* acpi_driver definition */
 static struct platform_driver snd_sof_acpi_intel_bdw_driver = {
 	.probe = sof_broadwell_probe,
-	.remove = sof_acpi_remove,
+	.remove_new = sof_acpi_remove,
 	.driver = {
 		.name = "sof-audio-acpi-intel-bdw",
 		.pm = &sof_acpi_pm,
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index faf223b38360..f62065f974e9 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -467,7 +467,7 @@ static int sof_baytrail_probe(struct platform_device *pdev)
 /* acpi_driver definition */
 static struct platform_driver snd_sof_acpi_intel_byt_driver = {
 	.probe = sof_baytrail_probe,
-	.remove = sof_acpi_remove,
+	.remove_new = sof_acpi_remove,
 	.driver = {
 		.name = "sof-audio-acpi-intel-byt",
 		.pm = &sof_acpi_pm,
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index f587edf9e0a7..35d4b7125448 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -707,7 +707,7 @@ MODULE_DEVICE_TABLE(of, sof_of_mt8186_ids);
 /* DT driver definition */
 static struct platform_driver snd_sof_of_mt8186_driver = {
 	.probe = sof_of_probe,
-	.remove = sof_of_remove,
+	.remove_new = sof_of_remove,
 	.shutdown = sof_of_shutdown,
 	.driver = {
 	.name = "sof-audio-of-mt8186",
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 7d6a568556ea..1d0d9289293a 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -660,7 +660,7 @@ MODULE_DEVICE_TABLE(of, sof_of_mt8195_ids);
 /* DT driver definition */
 static struct platform_driver snd_sof_of_mt8195_driver = {
 	.probe = sof_of_probe,
-	.remove = sof_of_remove,
+	.remove_new = sof_of_remove,
 	.shutdown = sof_of_shutdown,
 	.driver = {
 	.name = "sof-audio-of-mt8195",
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 1b04dcb33293..3fec5c1f41d4 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -97,7 +97,7 @@ int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc
 }
 EXPORT_SYMBOL_NS(sof_acpi_probe, SND_SOC_SOF_ACPI_DEV);
 
-int sof_acpi_remove(struct platform_device *pdev)
+void sof_acpi_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 
@@ -106,8 +106,6 @@ int sof_acpi_remove(struct platform_device *pdev)
 
 	/* call sof helper for DSP hardware remove */
 	snd_sof_device_remove(dev);
-
-	return 0;
 }
 EXPORT_SYMBOL_NS(sof_acpi_remove, SND_SOC_SOF_ACPI_DEV);
 
diff --git a/sound/soc/sof/sof-acpi-dev.h b/sound/soc/sof/sof-acpi-dev.h
index 5c2b558d2ace..9bf8f75ceaae 100644
--- a/sound/soc/sof/sof-acpi-dev.h
+++ b/sound/soc/sof/sof-acpi-dev.h
@@ -11,6 +11,6 @@
 
 extern const struct dev_pm_ops sof_acpi_pm;
 int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc);
-int sof_acpi_remove(struct platform_device *pdev);
+void sof_acpi_remove(struct platform_device *pdev);
 
 #endif
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 53faeccedd4f..7fe9e4a261fd 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -84,14 +84,12 @@ int sof_of_probe(struct platform_device *pdev)
 }
 EXPORT_SYMBOL(sof_of_probe);
 
-int sof_of_remove(struct platform_device *pdev)
+void sof_of_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 
 	/* call sof helper for DSP hardware remove */
 	snd_sof_device_remove(&pdev->dev);
-
-	return 0;
 }
 EXPORT_SYMBOL(sof_of_remove);
 
diff --git a/sound/soc/sof/sof-of-dev.h b/sound/soc/sof/sof-of-dev.h
index 2948b3a0d9fe..b6cc70595f3b 100644
--- a/sound/soc/sof/sof-of-dev.h
+++ b/sound/soc/sof/sof-of-dev.h
@@ -19,7 +19,7 @@ struct snd_sof_of_mach {
 extern const struct dev_pm_ops sof_of_pm;
 
 int sof_of_probe(struct platform_device *pdev);
-int sof_of_remove(struct platform_device *pdev);
+void sof_of_remove(struct platform_device *pdev);
 void sof_of_shutdown(struct platform_device *pdev);
 
 #endif

base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.40.1


