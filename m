Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9CCC433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:35:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 014F7619B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 014F7619B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VqP6B4k5uJgldrdTxXiqQktmcOXeSjXPqDLNXEktA/w=; b=nfimYxIGh9EwFFsLTcJC6WM1t
	wp287xCaFmNlEQlBbW7x+3hn6LP/IKVmJ/hC8TvePm2+I0iz8ScnmAq8ByEC2yyw2Rf1CXFj6n0Bq
	UYijWMZAiinIMEkDFBOKrFKywiFxPwoMcQ7AnmmjisLwpf7W+tkCl+WaNeO/GROrfnojYt1fkXHXt
	e4l8YA9aqE7gV4Kf6jWsjwUE8efvmWM/Lg0bsbwQijPNg3lnyVhJwbeZHDZ+a2r5kPrHpfyfn4ATv
	58WN1W/4iltcXzKEJs0eBd/Co+fhCaa5sH+z4gZO9shEvQKwSUTo1n2u6B6dqeLNKwTeweX60jC/r
	f9HcRGc0Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOfJK-00EifI-W5; Tue, 23 Mar 2021 11:34:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOfIf-00EiXn-G2; Tue, 23 Mar 2021 11:34:21 +0000
X-UUID: cba994c067cc40a990f72ca24941cace-20210323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RAzNMthpVXXI5GzQpK62zzoFdjQQHDPeue45u6qpYYM=; 
 b=czEcGq0Iw19M0SnlhYD5mGxKwFMUypmcVbBI4sQIpkU5Dbzhsuielk87JOUTbiI4Ia4igWBXXW83vMfwMsxEFX5lQ0/kDJGR7zURIhKEBop8fUeN0F426Vtzyt5puRdTbtXDNH6XPa5YJ2nadSkxvw9WJbZxZSicHloYWS8FrGw=;
X-UUID: cba994c067cc40a990f72ca24941cace-20210323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1405580138; Tue, 23 Mar 2021 03:34:06 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 04:34:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 19:34:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 23 Mar 2021 19:34:04 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>, "Saravana
 Kannan" <skannan@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>,
 Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
Subject: [PATCH V8 1/8] PM / devfreq: Add cpu based scaling support to
 passive_governor
Date: Tue, 23 Mar 2021 19:33:54 +0800
Message-ID: <1616499241-4906-2-git-send-email-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1616499241-4906-1-git-send-email-andrew-sh.cheng@mediatek.com>
References: <1616499241-4906-1-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_113417_972894_5CB5F216 
X-CRM114-Status: GOOD (  30.05  )
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
after kernel-5.7
Don't return -EINVAL in devfreq_passive_event_handler()
since it doesn't handle DEVFREQ_GOV_SUSPEND DEVFREQ_GOV_RESUME cases.

Signed-off-by: Saravana Kannan <skannan@codeaurora.org>
[Sibi: Integrated cpu-freqmap governor into passive_governor]
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 drivers/devfreq/Kconfig            |   2 +
 drivers/devfreq/governor_passive.c | 329 +++++++++++++++++++++++++++++++++++--
 include/linux/devfreq.h            |  29 +++-
 3 files changed, 342 insertions(+), 18 deletions(-)

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index 00704efe6398..f56132b0ae64 100644
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
index b094132bd20b..9cc57b083839 100644
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
@@ -23,14 +115,6 @@ static int devfreq_passive_get_target_freq(struct devfreq *devfreq,
 	int i, count;
 
 	/*
-	 * If the devfreq device with passive governor has the specific method
-	 * to determine the next frequency, should use the get_target_freq()
-	 * of struct devfreq_passive_data.
-	 */
-	if (p_data->get_target_freq)
-		return p_data->get_target_freq(devfreq, freq);
-
-	/*
 	 * If the parent and passive devfreq device uses the OPP table,
 	 * get the next frequency by using the OPP table.
 	 */
@@ -98,6 +182,37 @@ static int devfreq_passive_get_target_freq(struct devfreq *devfreq,
 	return 0;
 }
 
+static int devfreq_passive_get_target_freq(struct devfreq *devfreq,
+					   unsigned long *freq)
+{
+	struct devfreq_passive_data *p_data =
+		(struct devfreq_passive_data *)devfreq->data;
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
 static int devfreq_passive_notifier_call(struct notifier_block *nb,
 				unsigned long event, void *ptr)
 {
@@ -130,16 +245,200 @@ static int devfreq_passive_notifier_call(struct notifier_block *nb,
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
@@ -147,13 +446,11 @@ static int devfreq_passive_event_handler(struct devfreq *devfreq,
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
 		break;
diff --git a/include/linux/devfreq.h b/include/linux/devfreq.h
index 26ea0850be9b..e0093b7c805c 100644
--- a/include/linux/devfreq.h
+++ b/include/linux/devfreq.h
@@ -280,6 +280,25 @@ struct devfreq_simple_ondemand_data {
 
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
@@ -290,13 +309,15 @@ struct devfreq_simple_ondemand_data {
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
@@ -305,9 +326,13 @@ struct devfreq_passive_data {
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
