Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D533C2BBC7
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 08:43:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 237EE2087E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 08:43:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rLj36z3A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 237EE2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3hduFxpJw9KXotlZTHHFBh+rIlIH/qlh6zZm0hmgaBY=; b=rLj36z3AgCKhch1eqbwCkMVstH
	iRc56KN0j7b57hccU3IX81ikh4f/seXDFyieJ6PI3p8s7ozg+/3nd7YMonBW15YNaNhU7TnyipdlI
	g9RcL7Vke26D5FfHutJqD51y/K0evCvs3HMskJOSARThY/y/HzmM+c44vmoJiLkob3O08SOEpKnqY
	V/xVQDZuOxZKbCuorzV1N/3Fp4GgwTPXSobc0qjn0iypgcqKZ260yOcExIUTBLiSUcuMTW2ALc1gW
	wViMyFLIHGGW7+ypgn2MsH6WAcjGVtyFBxL+hb2dx19UgXmDnK5ajwTBPhLNx1+3Y2RLRzlS+Ceh3
	AFQQCbzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMpGB-00054V-Ak; Fri, 10 Apr 2020 08:43:35 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMpFT-0004Sf-9I; Fri, 10 Apr 2020 08:42:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F63D1063;
 Fri, 10 Apr 2020 01:42:50 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.37.12.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DD1D83F68F;
 Fri, 10 Apr 2020 01:42:39 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v6 02/10] PM / EM: introduce em_dev_register_perf_domain
 function
Date: Fri, 10 Apr 2020 09:42:02 +0100
Message-Id: <20200410084210.24932-3-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200410084210.24932-1-lukasz.luba@arm.com>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_014251_423321_7686A055 
X-CRM114-Status: GOOD (  16.60  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, festevam@gmail.com, mka@chromium.org, robh@kernel.org,
 amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, daniel.lezcano@linaro.org,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de,
 rui.zhang@intel.com, alyssa.rosenzweig@collabora.com, orjan.eide@arm.com,
 daniel@ffwll.ch, b.zolnierkie@samsung.com, s.hauer@pengutronix.de,
 rostedt@goodmis.org, matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com,
 airlied@linux.ie, tomeu.vizoso@collabora.com, qperret@google.com,
 sboyd@kernel.org, rdunlap@infradead.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org, lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add now function in the Energy Model framework which is going to support
new devices. This function will help in transition and make it smoother.
For now it still checks if the cpumask is a valid pointer, which will be
removed later when the new structures and infrastructure will be ready.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 include/linux/energy_model.h | 13 ++++++++++--
 kernel/power/energy_model.c  | 40 ++++++++++++++++++++++++++++++------
 2 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index fe336a9eb5d4..7c048df98447 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_ENERGY_MODEL_H
 #define _LINUX_ENERGY_MODEL_H
 #include <linux/cpumask.h>
+#include <linux/device.h>
 #include <linux/jump_label.h>
 #include <linux/kobject.h>
 #include <linux/rcupdate.h>
@@ -42,7 +43,7 @@ struct em_perf_domain {
 #define em_span_cpus(em) (to_cpumask((em)->cpus))
 
 #ifdef CONFIG_ENERGY_MODEL
-#define EM_CPU_MAX_POWER 0xFFFF
+#define EM_MAX_POWER 0xFFFF
 
 struct em_data_callback {
 	/**
@@ -59,7 +60,7 @@ struct em_data_callback {
 	 * and frequency.
 	 *
 	 * The power is the one of a single CPU in the domain, expressed in
-	 * milli-watts. It is expected to fit in the [0, EM_CPU_MAX_POWER]
+	 * milli-watts. It is expected to fit in the [0, EM_MAX_POWER]
 	 * range.
 	 *
 	 * Return 0 on success.
@@ -71,6 +72,8 @@ struct em_data_callback {
 struct em_perf_domain *em_cpu_get(int cpu);
 int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
 						struct em_data_callback *cb);
+int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
+				struct em_data_callback *cb, cpumask_t *span);
 
 /**
  * em_pd_energy() - Estimates the energy consumed by the CPUs of a perf. domain
@@ -174,6 +177,12 @@ static inline int em_register_perf_domain(cpumask_t *span,
 {
 	return -EINVAL;
 }
+static inline
+int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
+				struct em_data_callback *cb, cpumask_t *span)
+{
+	return -EINVAL;
+}
 static inline struct em_perf_domain *em_cpu_get(int cpu)
 {
 	return NULL;
diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index 9892d548a0fa..875b163e54ab 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -125,7 +125,7 @@ static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
 		 * The power returned by active_state() is expected to be
 		 * positive, in milli-watts and to fit into 16 bits.
 		 */
-		if (!power || power > EM_CPU_MAX_POWER) {
+		if (!power || power > EM_MAX_POWER) {
 			pr_err("pd%d: invalid power: %lu\n", cpu, power);
 			goto free_ps_table;
 		}
@@ -183,10 +183,13 @@ struct em_perf_domain *em_cpu_get(int cpu)
 EXPORT_SYMBOL_GPL(em_cpu_get);
 
 /**
- * em_register_perf_domain() - Register the Energy Model of a performance domain
- * @span	: Mask of CPUs in the performance domain
+ * em_dev_register_perf_domain() - Register the Energy Model (EM) for a device
+ * @dev		: Device for which the EM is to register
  * @nr_states	: Number of performance states to register
  * @cb		: Callback functions providing the data of the Energy Model
+ * @span	: Pointer to cpumask_t, which in case of a CPU device is
+ *		obligatory. It can be taken from i.e. 'policy->cpus'. For other
+ *		type of devices this should be set to NULL.
  *
  * Create Energy Model tables for a performance domain using the callbacks
  * defined in cb.
@@ -196,14 +199,14 @@ EXPORT_SYMBOL_GPL(em_cpu_get);
  *
  * Return 0 on success
  */
-int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
-						struct em_data_callback *cb)
+int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
+				struct em_data_callback *cb, cpumask_t *span)
 {
 	unsigned long cap, prev_cap = 0;
 	struct em_perf_domain *pd;
 	int cpu, ret = 0;
 
-	if (!span || !nr_states || !cb)
+	if (!dev || !span || !nr_states || !cb)
 		return -EINVAL;
 
 	/*
@@ -255,4 +258,29 @@ int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(em_dev_register_perf_domain);
+
+/**
+ * em_register_perf_domain() - Register the Energy Model of a performance domain
+ * @span	: Mask of CPUs in the performance domain
+ * @nr_states	: Number of capacity states to register
+ * @cb		: Callback functions providing the data of the Energy Model
+ *
+ * Create Energy Model tables for a performance domain using the callbacks
+ * defined in cb.
+ *
+ * If multiple clients register the same performance domain, all but the first
+ * registration will be ignored.
+ *
+ * Return 0 on success
+ */
+int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
+						struct em_data_callback *cb)
+{
+	struct device *cpu_dev;
+
+	cpu_dev = get_cpu_device(cpumask_first(span));
+
+	return em_dev_register_perf_domain(cpu_dev, nr_states, cb, span);
+}
 EXPORT_SYMBOL_GPL(em_register_perf_domain);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
