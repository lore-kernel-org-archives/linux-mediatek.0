Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CF5C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 14:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcdDLP5CFc9/c/iP4j9q7UH3Fd5aXWdcqE7c1fBuwWY=; b=kDHU6Lx+NbEkI3YHirGhCd38yg
	FMEq8EXyrJTSEfMRyoz6OoN5JwlMBDcTw4mjXLDXhchHvHNrpiKHhWF8MgDxIlQI6XW+rtssQe42Z
	q+ItcgtBqfWoaeMncgoi6WdxvHJ64Yy7Yn/gvhMu1Bf9ye0w2KRCGvsYCpmPVyOx6Pvox2ZROadVe
	P3voys4cHA+Psw1aq/ZRSTzGHIoLBG2hcb52VHOKIHtUn44tQgv+/bp2uLtyETcMNlshwCr9q4hv1
	U9nQb3bgi2chqDV4nsdWEF6xrpf760R7au2/ZOibWT+k0EbNQxI+9TxUZwH3Y1n9SsEmvWahX7F+9
	FaiaxOpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o41pG-00B3f6-QD; Wed, 22 Jun 2022 14:59:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o41oG-00B33l-RI; Wed, 22 Jun 2022 14:58:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D25EC1477;
	Wed, 22 Jun 2022 07:58:23 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.57.38.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E21DD3F792;
	Wed, 22 Jun 2022 07:58:20 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: daniel.lezcano@linaro.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	viresh.kumar@linaro.org,
	rafael@kernel.org,
	dietmar.eggemann@arm.com,
	nm@ti.com,
	sboyd@kernel.org,
	sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] cpufreq: scmi: Support the power scale in micro-Watts in SCMI v3.1
Date: Wed, 22 Jun 2022 15:58:02 +0100
Message-Id: <20220622145802.13032-5-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220622145802.13032-1-lukasz.luba@arm.com>
References: <20220622145802.13032-1-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_075824_964087_8EB64B1D 
X-CRM114-Status: GOOD (  11.98  )
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

The SCMI v3.1 adds support for power values in micro-Watts. They are not
always in milli-Watts anymore (ignoring the bogo-Watts). Thus, the power
must be converted conditionally before sending to Energy Model. Add the
logic which handles the needed checks and conversions.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 drivers/cpufreq/scmi-cpufreq.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index bfd35583d653..513a071845c2 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -100,7 +100,7 @@ static int __maybe_unused
 scmi_get_cpu_power(struct device *cpu_dev, unsigned long *power,
 		   unsigned long *KHz)
 {
-	bool power_scale_mw = perf_ops->power_scale_mw_get(ph);
+	enum scmi_power_scale power_scale = perf_ops->power_scale_get(ph);
 	unsigned long Hz;
 	int ret, domain;
 
@@ -114,8 +114,8 @@ scmi_get_cpu_power(struct device *cpu_dev, unsigned long *power,
 	if (ret)
 		return ret;
 
-	/* Provide bigger resolution power to the Energy Model */
-	if (power_scale_mw)
+	/* Convert the power to uW if it is mW (ignore bogoW) */
+	if (power_scale == SCMI_POWER_MILLIWATTS)
 		*power *= MICROWATT_PER_MILLIWATT;
 
 	/* The EM framework specifies the frequency in KHz. */
@@ -255,8 +255,9 @@ static int scmi_cpufreq_exit(struct cpufreq_policy *policy)
 static void scmi_cpufreq_register_em(struct cpufreq_policy *policy)
 {
 	struct em_data_callback em_cb = EM_DATA_CB(scmi_get_cpu_power);
-	bool power_scale_mw = perf_ops->power_scale_mw_get(ph);
+	enum scmi_power_scale power_scale = perf_ops->power_scale_get(ph);
 	struct scmi_data *priv = policy->driver_data;
+	bool em_power_scale = false;
 
 	/*
 	 * This callback will be called for each policy, but we don't need to
@@ -268,9 +269,13 @@ static void scmi_cpufreq_register_em(struct cpufreq_policy *policy)
 	if (!priv->nr_opp)
 		return;
 
+	if (power_scale == SCMI_POWER_MILLIWATTS
+	    || power_scale == SCMI_POWER_MICROWATTS)
+		em_power_scale = true;
+
 	em_dev_register_perf_domain(get_cpu_device(policy->cpu), priv->nr_opp,
 				    &em_cb, priv->opp_shared_cpus,
-				    power_scale_mw);
+				    em_power_scale);
 }
 
 static struct cpufreq_driver scmi_cpufreq_driver = {
-- 
2.17.1


