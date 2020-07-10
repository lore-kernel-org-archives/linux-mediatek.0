Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350DFC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 02:31:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB74520725
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 02:31:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bQ+wQR6t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YAbt7ZeH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB74520725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qHAfiQsYpuif7UR8Bqf65SWCkCQ0BUXGJg0Y45UyPOo=; b=bQ+wQR6tznaI5uvcVFEhIi/Lw
	AHkyxqSjY7fNvZwz6Uw/PUY5Za6FKrh+R48z+6/54iRXRkk2ENXek/ORV+yNFTHJeM5O0ubH9Pe4Z
	zJYH2ob+68aei3xmnMmKKK8xsPjxUcQMjCGQXkB1eJ2iicvM3ibY/gksgrzc1CW35eiyC9LsqWq51
	0XnhOuWVD9DOwKSJ/1+0Fe8YJX8A4eB0tyqCcF3aKD2rd5S3cPl6dDXZVdcmlmUGLVdzV+8tf48g6
	DDHJ8YyHRzaG1AXS7VAzg+Tt4TJi6tvfCq89iXO2vqTVBSRQsQrydszwOl4kF2TnhuB3Drc8L1DUq
	HBIF5jlTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtipG-0004Lr-IW; Fri, 10 Jul 2020 02:31:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtip7-0004JE-PW; Fri, 10 Jul 2020 02:31:40 +0000
X-UUID: 65af28328ea4406da44430f337173f28-20200709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2GEVttW1zGnznqMG+clAoEk/kAqj8ThgYiaCSir0Qio=; 
 b=YAbt7ZeHQwXdezRqhAJimFLkN/3q+xGimYigOedKcxqslsqmrGHns22hpyIqmPfmD1+3uJiQ1csNmLjB6TRtpaZMJn6yGsR25iPydCvh6ZmowRxLL7gRRJvMoMMpIx0yWOH8yITZh7Y8pmgw0CjxgH701Y+Fxa1+PUABIorwCCU=;
X-UUID: 65af28328ea4406da44430f337173f28-20200709
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1471940928; Thu, 09 Jul 2020 18:31:28 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 19:31:28 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 10:31:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Jul 2020 10:31:27 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH v7 1/8] PM / devfreq: Add cpu based scaling support to
 passive_governor
Date: Fri, 10 Jul 2020 10:31:17 +0800
Message-ID: <1594348284-14199-2-git-send-email-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
References: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_223138_083207_A13E6480 
X-CRM114-Status: GOOD (  28.52  )
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
Cc: devicetree@vger.kernel.org,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>, srv_heupstream@mediatek.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Saravana
 Kannan <skannan@codeaurora.org>, linux-mediatek@lists.infradead.org,
 Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Saravana Kannan <skannan@codeaurora.org>

Many CPU architectures have caches that can scale independent of the
CPUs. Frequency scaling of the caches is necessary to make sure that the
cache is not a performance bottleneck that leads to poor performance and
power. The same idea applies for RAM/DDR.

To achieve this, this patch adds support for cpu based scaling to the
passive governor. This is accomplished by taking the current frequency
of each CPU frequency domain and then adjust the frequency of the cache
(or any devfreq device) based on the frequency of the CPUs. It listens
to CPU frequency transition notifiers to keep itself up to date on the
current CPU frequency.

To decide the frequency of the device, the governor does one of the
following:
* Derives the optimal devfreq device opp from required-opps property of
  the parent cpu opp_table.

* Scales the device frequency in proportion to the CPU frequency. So, if
  the CPUs are running at their max frequency, the device runs at its
  max frequency. If the CPUs are running at their min frequency, the
  device runs at its min frequency. It is interpolated for frequencies
  in between.

Andrew-sh.Cheng change
dev_pm_opp_xlate_opp to dev_pm_opp_xlate_required_opp devfreq->max_freq
to devfreq->user_min_freq_req.data.freq.qos->min_freq.target_value
for kernel-5.7

Change-Id: I5a55c423823b2c93f38dc2b2cbdd88eeef2e74fd
Signed-off-by: Saravana Kannan <skannan@codeaurora.org>
[Sibi: Integrated cpu-freqmap governor into passive_governor]
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 drivers/devfreq/Kconfig            |   2 +
 drivers/devfreq/governor_passive.c | 332 +++++++++++++++++++++++++++++++++++--
 include/linux/devfreq.h            |  29 +++-
 3 files changed, 343 insertions(+), 20 deletions(-)

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index 37dc40d1fcfb..42b1286e98e6 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -73,6 +73,8 @@ config DEVFREQ_GOV_PASSIVE
 	  device. This governor does not change the frequency by itself
 	  through sysfs entries. The passive governor recommends that
 	  devfreq device uses the OPP table to get the frequency/voltage.
+	  Alternatively the governor can also be chosen to scale based on
+	  the online CPUs current frequency.
 
 comment "DEVFREQ Drivers"
 
diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
index 2d67d6c12dce..b9ee3a8504cd 100644
--- a/drivers/devfreq/governor_passive.c
+++ b/drivers/devfreq/governor_passive.c
@@ -8,11 +8,103 @@
  */
 
 #include <linux/module.h>
+#include <linux/cpu.h>
+#include <linux/cpufreq.h>
+#include <linux/cpumask.h>
 #include <linux/device.h>
 #include <linux/devfreq.h>
+#include <linux/slab.h>
 #include "governor.h"
 
-static int devfreq_passive_get_target_freq(struct devfreq *devfreq,
+struct devfreq_cpu_state {
+	unsigned int curr_freq;
+	unsigned int min_freq;
+	unsigned int max_freq;
+	unsigned int first_cpu;
+	struct device *cpu_dev;
+	struct opp_table *opp_table;
+};
+
+static unsigned long xlate_cpufreq_to_devfreq(struct devfreq_passive_data *data,
+					      unsigned int cpu)
+{
+	unsigned int cpu_min_freq, cpu_max_freq, cpu_curr_freq_khz, cpu_percent;
+	unsigned long dev_min_freq, dev_max_freq, dev_max_state;
+
+	struct devfreq_cpu_state *cpu_state = data->cpu_state[cpu];
+	struct devfreq *devfreq = (struct devfreq *)data->this;
+	unsigned long *dev_freq_table = devfreq->profile->freq_table;
+	struct dev_pm_opp *opp = NULL, *p_opp = NULL;
+	unsigned long cpu_curr_freq, freq;
+
+	if (!cpu_state || cpu_state->first_cpu != cpu ||
+	    !cpu_state->opp_table || !devfreq->opp_table)
+		return 0;
+
+	cpu_curr_freq = cpu_state->curr_freq * 1000;
+	p_opp = devfreq_recommended_opp(cpu_state->cpu_dev, &cpu_curr_freq, 0);
+	if (IS_ERR(p_opp))
+		return 0;
+
+	opp = dev_pm_opp_xlate_required_opp(cpu_state->opp_table,
+					    devfreq->opp_table, p_opp);
+	dev_pm_opp_put(p_opp);
+
+	if (!IS_ERR(opp)) {
+		freq = dev_pm_opp_get_freq(opp);
+		dev_pm_opp_put(opp);
+		goto out;
+	}
+
+	/* Use Interpolation if required opps is not available */
+	cpu_min_freq = cpu_state->min_freq;
+	cpu_max_freq = cpu_state->max_freq;
+	cpu_curr_freq_khz = cpu_state->curr_freq;
+
+	if (dev_freq_table) {
+		/* Get minimum frequency according to sorting order */
+		dev_max_state = dev_freq_table[devfreq->profile->max_state - 1];
+		if (dev_freq_table[0] < dev_max_state) {
+			dev_min_freq = dev_freq_table[0];
+			dev_max_freq = dev_max_state;
+		} else {
+			dev_min_freq = dev_max_state;
+			dev_max_freq = dev_freq_table[0];
+		}
+	} else {
+		dev_min_freq = dev_pm_qos_read_value(devfreq->dev.parent,
+						     DEV_PM_QOS_MIN_FREQUENCY);
+		dev_max_freq = dev_pm_qos_read_value(devfreq->dev.parent,
+						     DEV_PM_QOS_MAX_FREQUENCY);
+
+		if (dev_max_freq <= dev_min_freq)
+			return 0;
+	}
+	cpu_percent = ((cpu_curr_freq_khz - cpu_min_freq) * 100) / cpu_max_freq - cpu_min_freq;
+	freq = dev_min_freq + mult_frac(dev_max_freq - dev_min_freq, cpu_percent, 100);
+
+out:
+	return freq;
+}
+
+static int get_target_freq_with_cpufreq(struct devfreq *devfreq,
+					unsigned long *freq)
+{
+	struct devfreq_passive_data *p_data =
+				(struct devfreq_passive_data *)devfreq->data;
+	unsigned int cpu;
+	unsigned long target_freq = 0;
+
+	for_each_online_cpu(cpu)
+		target_freq = max(target_freq,
+				  xlate_cpufreq_to_devfreq(p_data, cpu));
+
+	*freq = target_freq;
+
+	return 0;
+}
+
+static int get_target_freq_with_devfreq(struct devfreq *devfreq,
 					unsigned long *freq)
 {
 	struct devfreq_passive_data *p_data
@@ -23,16 +115,6 @@ static int devfreq_passive_get_target_freq(struct devfreq *devfreq,
 	int i, count, ret = 0;
 
 	/*
-	 * If the devfreq device with passive governor has the specific method
-	 * to determine the next frequency, should use the get_target_freq()
-	 * of struct devfreq_passive_data.
-	 */
-	if (p_data->get_target_freq) {
-		ret = p_data->get_target_freq(devfreq, freq);
-		goto out;
-	}
-
-	/*
 	 * If the parent and passive devfreq device uses the OPP table,
 	 * get the next frequency by using the OPP table.
 	 */
@@ -102,6 +184,37 @@ static int devfreq_passive_get_target_freq(struct devfreq *devfreq,
 	return ret;
 }
 
+static int devfreq_passive_get_target_freq(struct devfreq *devfreq,
+					   unsigned long *freq)
+{
+	struct devfreq_passive_data *p_data =
+				(struct devfreq_passive_data *)devfreq->data;
+	int ret;
+
+	/*
+	 * If the devfreq device with passive governor has the specific method
+	 * to determine the next frequency, should use the get_target_freq()
+	 * of struct devfreq_passive_data.
+	 */
+	if (p_data->get_target_freq)
+		return p_data->get_target_freq(devfreq, freq);
+
+	switch (p_data->parent_type) {
+	case DEVFREQ_PARENT_DEV:
+		ret = get_target_freq_with_devfreq(devfreq, freq);
+		break;
+	case CPUFREQ_PARENT_DEV:
+		ret = get_target_freq_with_cpufreq(devfreq, freq);
+		break;
+	default:
+		ret = -EINVAL;
+		dev_err(&devfreq->dev, "Invalid parent type\n");
+		break;
+	}
+
+	return ret;
+}
+
 static int update_devfreq_passive(struct devfreq *devfreq, unsigned long freq)
 {
 	int ret;
@@ -156,16 +269,200 @@ static int devfreq_passive_notifier_call(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
+static int cpufreq_passive_notifier_call(struct notifier_block *nb,
+					 unsigned long event, void *ptr)
+{
+	struct devfreq_passive_data *data =
+			container_of(nb, struct devfreq_passive_data, nb);
+	struct devfreq *devfreq = (struct devfreq *)data->this;
+	struct devfreq_cpu_state *cpu_state;
+	struct cpufreq_freqs *cpu_freq = ptr;
+	unsigned int curr_freq;
+	int ret;
+
+	if (event != CPUFREQ_POSTCHANGE || !cpu_freq ||
+	    !data->cpu_state[cpu_freq->policy->cpu])
+		return 0;
+
+	cpu_state = data->cpu_state[cpu_freq->policy->cpu];
+	if (cpu_state->curr_freq == cpu_freq->new)
+		return 0;
+
+	/* Backup current freq and pre-update cpu state freq*/
+	curr_freq = cpu_state->curr_freq;
+	cpu_state->curr_freq = cpu_freq->new;
+
+	mutex_lock(&devfreq->lock);
+	ret = update_devfreq(devfreq);
+	mutex_unlock(&devfreq->lock);
+	if (ret) {
+		cpu_state->curr_freq = curr_freq;
+		dev_err(&devfreq->dev, "Couldn't update the frequency.\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int cpufreq_passive_register(struct devfreq_passive_data **p_data)
+{
+	struct devfreq_passive_data *data = *p_data;
+	struct devfreq *devfreq = (struct devfreq *)data->this;
+	struct device *dev = devfreq->dev.parent;
+	struct opp_table *opp_table = NULL;
+	struct devfreq_cpu_state *cpu_state;
+	struct cpufreq_policy *policy;
+	struct device *cpu_dev;
+	unsigned int cpu;
+	int ret;
+
+	get_online_cpus();
+
+	data->nb.notifier_call = cpufreq_passive_notifier_call;
+	ret = cpufreq_register_notifier(&data->nb,
+					CPUFREQ_TRANSITION_NOTIFIER);
+	if (ret) {
+		dev_err(dev, "Couldn't register cpufreq notifier.\n");
+		data->nb.notifier_call = NULL;
+		goto out;
+	}
+
+	/* Populate devfreq_cpu_state */
+	for_each_online_cpu(cpu) {
+		if (data->cpu_state[cpu])
+			continue;
+
+		policy = cpufreq_cpu_get(cpu);
+		if (!policy) {
+			ret = -EINVAL;
+			goto out;
+		} else if (PTR_ERR(policy) == -EPROBE_DEFER) {
+			ret = -EPROBE_DEFER;
+			goto out;
+		} else if (IS_ERR(policy)) {
+			ret = PTR_ERR(policy);
+			dev_err(dev, "Couldn't get the cpufreq_poliy.\n");
+			goto out;
+		}
+
+		cpu_state = kzalloc(sizeof(*cpu_state), GFP_KERNEL);
+		if (!cpu_state) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		cpu_dev = get_cpu_device(cpu);
+		if (!cpu_dev) {
+			dev_err(dev, "Couldn't get cpu device.\n");
+			ret = -ENODEV;
+			goto out;
+		}
+
+		opp_table = dev_pm_opp_get_opp_table(cpu_dev);
+		if (IS_ERR(devfreq->opp_table)) {
+			ret = PTR_ERR(opp_table);
+			goto out;
+		}
+
+		cpu_state->cpu_dev = cpu_dev;
+		cpu_state->opp_table = opp_table;
+		cpu_state->first_cpu = cpumask_first(policy->related_cpus);
+		cpu_state->curr_freq = policy->cur;
+		cpu_state->min_freq = policy->cpuinfo.min_freq;
+		cpu_state->max_freq = policy->cpuinfo.max_freq;
+		data->cpu_state[cpu] = cpu_state;
+
+		cpufreq_cpu_put(policy);
+	}
+
+out:
+	put_online_cpus();
+	if (ret)
+		return ret;
+
+	/* Update devfreq */
+	mutex_lock(&devfreq->lock);
+	ret = update_devfreq(devfreq);
+	mutex_unlock(&devfreq->lock);
+	if (ret)
+		dev_err(dev, "Couldn't update the frequency.\n");
+
+	return ret;
+}
+
+static int cpufreq_passive_unregister(struct devfreq_passive_data **p_data)
+{
+	struct devfreq_passive_data *data = *p_data;
+	struct devfreq_cpu_state *cpu_state;
+	int cpu;
+
+	if (data->nb.notifier_call)
+		cpufreq_unregister_notifier(&data->nb,
+					    CPUFREQ_TRANSITION_NOTIFIER);
+
+	for_each_possible_cpu(cpu) {
+		cpu_state = data->cpu_state[cpu];
+		if (cpu_state) {
+			if (cpu_state->opp_table)
+				dev_pm_opp_put_opp_table(cpu_state->opp_table);
+			kfree(cpu_state);
+			cpu_state = NULL;
+		}
+	}
+
+	return 0;
+}
+
+int register_parent_dev_notifier(struct devfreq_passive_data **p_data)
+{
+	struct notifier_block *nb = &(*p_data)->nb;
+	int ret = 0;
+
+	switch ((*p_data)->parent_type) {
+	case DEVFREQ_PARENT_DEV:
+		nb->notifier_call = devfreq_passive_notifier_call;
+		ret = devfreq_register_notifier((struct devfreq *)(*p_data)->parent, nb,
+						DEVFREQ_TRANSITION_NOTIFIER);
+		break;
+	case CPUFREQ_PARENT_DEV:
+		ret = cpufreq_passive_register(p_data);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+int unregister_parent_dev_notifier(struct devfreq_passive_data **p_data)
+{
+	int ret = 0;
+
+	switch ((*p_data)->parent_type) {
+	case DEVFREQ_PARENT_DEV:
+		WARN_ON(devfreq_unregister_notifier((struct devfreq *)(*p_data)->parent,
+						    &(*p_data)->nb,
+						    DEVFREQ_TRANSITION_NOTIFIER));
+		break;
+	case CPUFREQ_PARENT_DEV:
+		cpufreq_passive_unregister(p_data);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
 static int devfreq_passive_event_handler(struct devfreq *devfreq,
 				unsigned int event, void *data)
 {
 	struct devfreq_passive_data *p_data
 			= (struct devfreq_passive_data *)devfreq->data;
 	struct devfreq *parent = (struct devfreq *)p_data->parent;
-	struct notifier_block *nb = &p_data->nb;
 	int ret = 0;
 
-	if (!parent)
+	if (p_data->parent_type == DEVFREQ_PARENT_DEV && !parent)
 		return -EPROBE_DEFER;
 
 	switch (event) {
@@ -173,15 +470,14 @@ static int devfreq_passive_event_handler(struct devfreq *devfreq,
 		if (!p_data->this)
 			p_data->this = devfreq;
 
-		nb->notifier_call = devfreq_passive_notifier_call;
-		ret = devfreq_register_notifier(parent, nb,
-					DEVFREQ_TRANSITION_NOTIFIER);
+		ret = register_parent_dev_notifier(&p_data);
 		break;
+
 	case DEVFREQ_GOV_STOP:
-		WARN_ON(devfreq_unregister_notifier(parent, nb,
-					DEVFREQ_TRANSITION_NOTIFIER));
+		ret = unregister_parent_dev_notifier(&p_data);
 		break;
 	default:
+		ret = -EINVAL;
 		break;
 	}
 
diff --git a/include/linux/devfreq.h b/include/linux/devfreq.h
index a4b19d593151..7e5cf2b60902 100644
--- a/include/linux/devfreq.h
+++ b/include/linux/devfreq.h
@@ -278,6 +278,25 @@ struct devfreq_simple_ondemand_data {
 
 #if IS_ENABLED(CONFIG_DEVFREQ_GOV_PASSIVE)
 /**
+ * struct devfreq_cpu_state - holds the per-cpu state
+ * @freq:	the current frequency of the cpu.
+ * @min_freq:	the min frequency of the cpu.
+ * @max_freq:	the max frequency of the cpu.
+ * @first_cpu:	the cpumask of the first cpu of a policy.
+ * @dev:	reference to cpu device.
+ * @opp_table:	reference to cpu opp table.
+ *
+ * This structure stores the required cpu_state of a cpu.
+ * This is auto-populated by the governor.
+ */
+struct devfreq_cpu_state;
+
+enum devfreq_parent_dev_type {
+	DEVFREQ_PARENT_DEV,
+	CPUFREQ_PARENT_DEV,
+};
+
+/**
  * struct devfreq_passive_data - ``void *data`` fed to struct devfreq
  *	and devfreq_add_device
  * @parent:	the devfreq instance of parent device.
@@ -288,13 +307,15 @@ struct devfreq_simple_ondemand_data {
  *			using governors except for passive governor.
  *			If the devfreq device has the specific method to decide
  *			the next frequency, should use this callback.
+ * @parent_type:	parent type of the device
  * @this:	the devfreq instance of own device.
  * @nb:		the notifier block for DEVFREQ_TRANSITION_NOTIFIER list
+ * @cpu_state:		the state min/max/current frequency of all online cpu's
  *
  * The devfreq_passive_data have to set the devfreq instance of parent
  * device with governors except for the passive governor. But, don't need to
- * initialize the 'this' and 'nb' field because the devfreq core will handle
- * them.
+ * initialize the 'this', 'nb' and 'cpu_state' field because the devfreq core
+ * will handle them.
  */
 struct devfreq_passive_data {
 	/* Should set the devfreq instance of parent device */
@@ -303,9 +324,13 @@ struct devfreq_passive_data {
 	/* Optional callback to decide the next frequency of passvice device */
 	int (*get_target_freq)(struct devfreq *this, unsigned long *freq);
 
+	/* Should set the type of parent device */
+	enum devfreq_parent_dev_type parent_type;
+
 	/* For passive governor's internal use. Don't need to set them */
 	struct devfreq *this;
 	struct notifier_block nb;
+	struct devfreq_cpu_state *cpu_state[NR_CPUS];
 };
 #endif
 
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
