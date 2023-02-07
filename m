Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5846BC636D3
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 20:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oe1ET85sw+6iyiWj6il4jOsM14oRZMZXm0sdC6a0k50=; b=eToC4RhbFoVUIaORAL36Co+bvw
	3pikYNxpy0M6VJCaaTjdlFCL10z0SA2OzBYRDKz8UWbz8IE4W4iwSRuOqw6/gV6Vs/R1QrXXO1Wst
	6M2crag7+J47Sn94Q0kPXh84wm1PTa4LeAQrQbtXkpLT1/+hA4Ln/iafh7YVLRCgEtwPMPC4Pmc3N
	JnchP0hP0UYBCxhYexXt2+jAckfcLZcd19+FUI0hJyDldrpqta/fVAEC5r5bwPLQZk5CjNjCzhH4Q
	0aLDkO+/qmYyVniE+7FYMgh4Or72Ff8pcC+Icgu2DGbmo4hCV6Oy056HphrapEsX4jf0Aa14jaWLg
	yN34qkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPU8A-00DGg7-1r; Tue, 07 Feb 2023 19:59:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPU88-00DGfq-L1
	for linux-mediatek@bombadil.infradead.org; Tue, 07 Feb 2023 19:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=oe1ET85sw+6iyiWj6il4jOsM14oRZMZXm0sdC6a0k50=; b=Nw42AJJzb6L3mlfFDcqf8p+uhc
	f7PH5rt/jBSBXD5SfTcfz57+dK3UG2oqdhe6VI9vlqCTGPM4B/qczis+c/3GF3IHIMrzuwG3XLwg/
	Gh5gVvVAy8TjrnUjz5nD8V6SQ+GD5cpCX1AC9O0PqnwMXwoKSc3KNqo8bKfJqe+YaxEzSfiWNos5x
	WAAlkjh8hDEB8jXwTVJGgYWyIV+fiCxDkP799JUxiMiPfv8E04zGiOWMZMQQqv1taEvrXAlexa6p5
	lXCA+AEtl8JffEwTa5+NDCEHhFq6JR+8jgwUUhy6pyvC+Je+fXINhJt3G8y1CRUusael1cXQ5/bOq
	+CaFyK0w==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pPU7R-0070ea-2b
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Feb 2023 19:59:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPU7i-0004LR-Tg; Tue, 07 Feb 2023 20:59:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPU7f-003M0p-NY; Tue, 07 Feb 2023 20:59:24 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPU7f-001f6l-GJ; Tue, 07 Feb 2023 20:59:23 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	iresh Kumar <viresh.kumar@linaro.org>
Cc: Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Kevin Hilman <khilman@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH] cpufreq: Make cpufreq_unregister_driver() return void
Date: Tue,  7 Feb 2023 20:59:09 +0100
Message-Id: <20230207195909.474953-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5250; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=JTPX5wQArjFokwps66B5mHzGddYcN7+nEQY+JlShuOM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj4q2KUQySq9hxhg8uj4r2ZPhCEmnFf9Ja7bJMi+Kv NbPJafSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY+KtigAKCRDB/BR4rcrsCXgeB/ 4qnB4YPMS3Lsxa/9NngHxXLycsrs4OdKxs3OEGavkqm9iGIYZvZx5N7v8fky+3JDCzMWm9aGO+VLK/ mXxXnTifr+ia/DyX7ByY7JlIGojKHnEybDdFj0DSgC8SuUuBwrT35E+SwGFAlricUaXU5tEMQG3Dvb stX8T8uCfhsGShZRpqZ2ks42bRHDeZZx1KcV9HhnVdloWxtK3NLHTcwIbNtsffSeZ+rcohZRKeGMNX ndAiCXTETKFq8w+hSYw7rt5266cymIVGf7z53jYVaxCpw2+PaFXvptsyuOfSAlNhiOgWx2b13T/alD mjryrmnrzwDhe4hIWktqRbqt8FhqYl
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_195909_912405_0BFC3E0C 
X-CRM114-Status: GOOD (  17.86  )
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

All but a few drivers ignore the return value of
cpufreq_unregister_driver(). Those few that don't only call it after
cpufreq_register_driver() succeeded, in which case the call doesn't
fail.

Make the function return no value and add a WARN_ON for the case that
the function is called in an invalid situation (i.e. without a previous
successful call to cpufreq_register_driver()).

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/cpufreq/brcmstb-avs-cpufreq.c | 5 +----
 drivers/cpufreq/cpufreq.c             | 8 +++-----
 drivers/cpufreq/davinci-cpufreq.c     | 4 +++-
 drivers/cpufreq/mediatek-cpufreq-hw.c | 4 +++-
 drivers/cpufreq/omap-cpufreq.c        | 4 +++-
 drivers/cpufreq/qcom-cpufreq-hw.c     | 4 +++-
 include/linux/cpufreq.h               | 2 +-
 7 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/cpufreq/brcmstb-avs-cpufreq.c b/drivers/cpufreq/brcmstb-avs-cpufreq.c
index 4153150e20db..ffea6402189d 100644
--- a/drivers/cpufreq/brcmstb-avs-cpufreq.c
+++ b/drivers/cpufreq/brcmstb-avs-cpufreq.c
@@ -751,10 +751,7 @@ static int brcm_avs_cpufreq_probe(struct platform_device *pdev)
 
 static int brcm_avs_cpufreq_remove(struct platform_device *pdev)
 {
-	int ret;
-
-	ret = cpufreq_unregister_driver(&brcm_avs_driver);
-	WARN_ON(ret);
+	cpufreq_unregister_driver(&brcm_avs_driver);
 
 	brcm_avs_prepare_uninit(pdev);
 
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 7e56a42750ea..85a0bea2dbf1 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -2904,12 +2904,12 @@ EXPORT_SYMBOL_GPL(cpufreq_register_driver);
  * Returns zero if successful, and -EINVAL if the cpufreq_driver is
  * currently not initialised.
  */
-int cpufreq_unregister_driver(struct cpufreq_driver *driver)
+void cpufreq_unregister_driver(struct cpufreq_driver *driver)
 {
 	unsigned long flags;
 
-	if (!cpufreq_driver || (driver != cpufreq_driver))
-		return -EINVAL;
+	if (WARN_ON(!cpufreq_driver || (driver != cpufreq_driver)))
+		return;
 
 	pr_debug("unregistering driver %s\n", driver->name);
 
@@ -2926,8 +2926,6 @@ int cpufreq_unregister_driver(struct cpufreq_driver *driver)
 
 	write_unlock_irqrestore(&cpufreq_driver_lock, flags);
 	cpus_read_unlock();
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(cpufreq_unregister_driver);
 
diff --git a/drivers/cpufreq/davinci-cpufreq.c b/drivers/cpufreq/davinci-cpufreq.c
index 9e97f60f8199..2d23015e2abd 100644
--- a/drivers/cpufreq/davinci-cpufreq.c
+++ b/drivers/cpufreq/davinci-cpufreq.c
@@ -138,7 +138,9 @@ static int __exit davinci_cpufreq_remove(struct platform_device *pdev)
 	if (cpufreq.asyncclk)
 		clk_put(cpufreq.asyncclk);
 
-	return cpufreq_unregister_driver(&davinci_driver);
+	cpufreq_unregister_driver(&davinci_driver);
+
+	return 0;
 }
 
 static struct platform_driver davinci_cpufreq_driver = {
diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index f80339779084..f21a9e3df53d 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -317,7 +317,9 @@ static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
 
 static int mtk_cpufreq_hw_driver_remove(struct platform_device *pdev)
 {
-	return cpufreq_unregister_driver(&cpufreq_mtk_hw_driver);
+	cpufreq_unregister_driver(&cpufreq_mtk_hw_driver);
+
+	return 0;
 }
 
 static const struct of_device_id mtk_cpufreq_hw_match[] = {
diff --git a/drivers/cpufreq/omap-cpufreq.c b/drivers/cpufreq/omap-cpufreq.c
index 1b50df06c6bc..81649a1969b6 100644
--- a/drivers/cpufreq/omap-cpufreq.c
+++ b/drivers/cpufreq/omap-cpufreq.c
@@ -184,7 +184,9 @@ static int omap_cpufreq_probe(struct platform_device *pdev)
 
 static int omap_cpufreq_remove(struct platform_device *pdev)
 {
-	return cpufreq_unregister_driver(&omap_driver);
+	cpufreq_unregister_driver(&omap_driver);
+
+	return 0;
 }
 
 static struct platform_driver omap_cpufreq_platdrv = {
diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 9505a812d6a1..8a1b140884af 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -766,7 +766,9 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
 
 static int qcom_cpufreq_hw_driver_remove(struct platform_device *pdev)
 {
-	return cpufreq_unregister_driver(&cpufreq_qcom_hw_driver);
+	cpufreq_unregister_driver(&cpufreq_qcom_hw_driver);
+
+	return 0;
 }
 
 static struct platform_driver qcom_cpufreq_hw_driver = {
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 6a94a6eaad27..65623233ab2f 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -448,7 +448,7 @@ struct cpufreq_driver {
 #define CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING	BIT(6)
 
 int cpufreq_register_driver(struct cpufreq_driver *driver_data);
-int cpufreq_unregister_driver(struct cpufreq_driver *driver_data);
+void cpufreq_unregister_driver(struct cpufreq_driver *driver_data);
 
 bool cpufreq_driver_test_flags(u16 flags);
 const char *cpufreq_get_current_driver(void);

base-commit: 05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a
-- 
2.39.0


