Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAE5C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 02:41:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 284F320663
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 02:41:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ewqDPg1l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NhlFdZnf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 284F320663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XqFMh9mO90fFFohxLfSLUGUek3rD6hOEdjYQe7aoX4w=; b=ewqDPg1l8JZyoZfjBbxugIfRX
	LpNuEPBxNSTpIWZc6D5xf9tUuuqQ4rBh36kmdqu9sQ+z2iETdBpOLqOnqmYGJtgDvu/vPDQ0xqzO4
	gHKjJolAgZJbbrVcvCPiBy0ZK7xfjZ3GiMkQzK9gQNgrtAmpUzPYUPZarLXFlQWCYr+882ilw9r+b
	MYKgdBZbZVrzYp42KMXfhXpuw1DAjcnveEysOdoeT4Hqo1+NOWS4Vhx2mmiSEgRjwQ8IkYB1T9xl+
	Ua/AupPav0GBGUGDkOE5XhfHY516Awu0vKag9rPNcw/97CgHLh8gquCpiL6MdwnCoI4Fql2aB7R04
	A0CZHBJgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtiyu-0005n0-UY; Fri, 10 Jul 2020 02:41:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtiyl-0005hh-Tb; Fri, 10 Jul 2020 02:41:37 +0000
X-UUID: 4f9674854c7043e99ae519319c61b649-20200709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SQ5lm2YOuV2RX/xZP2u6BydkBdXxecT/kGtJnann5hE=; 
 b=NhlFdZnfZBzEV7w94Oq9Kv+jo45PrYW8cQq+825tLii2r9r75YNpAOu0CO47yJ7f4yQmZeTejyux4yTXDJmZ6veRMuDTqLEOFkZ/QpYKHg1wcvW9QwNC5KXP4rCDVjmJ/7Kdmyfvy8SoLJgNfi55rKCuFxekJ78azID7aMqvkRQ=;
X-UUID: 4f9674854c7043e99ae519319c61b649-20200709
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 389662892; Thu, 09 Jul 2020 18:41:27 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 19:31:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 10:31:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Jul 2020 10:31:34 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH v7 6/8] cpufreq: mediatek: add opp notification for SVS support
Date: Fri, 10 Jul 2020 10:31:22 +0800
Message-ID: <1594348284-14199-7-git-send-email-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
References: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_224136_173623_DD2D37C6 
X-CRM114-Status: GOOD (  20.49  )
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
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>

cpufreq should listen opp notification and do proper actions
when receiving disable and voltage adjustment events,
which are triggered when SVS is enabled.

Change-Id: Icf7807fdebc312dfcea4c98487fe4f79a08459ce
Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 89 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 4b479c110cc9..71395ab87ac7 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -42,6 +42,11 @@ struct mtk_cpu_dvfs_info {
 	struct list_head list_head;
 	int intermediate_voltage;
 	bool need_voltage_tracking;
+	struct mutex lock; /* avoid notify and policy race condition */
+	struct notifier_block opp_nb;
+	int opp_cpu;
+	unsigned long opp_freq;
+	int old_vproc;
 };
 
 static LIST_HEAD(dvfs_info_list);
@@ -192,11 +197,16 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 
 static int mtk_cpufreq_set_voltage(struct mtk_cpu_dvfs_info *info, int vproc)
 {
+	int ret;
+
 	if (info->need_voltage_tracking)
-		return mtk_cpufreq_voltage_tracking(info, vproc);
+		ret = mtk_cpufreq_voltage_tracking(info, vproc);
 	else
-		return regulator_set_voltage(info->proc_reg, vproc,
-					     vproc + VOLT_TOL);
+		ret = regulator_set_voltage(info->proc_reg, vproc,
+					    MAX_VOLT_LIMIT);
+	if (!ret)
+		info->old_vproc = vproc;
+	return ret;
 }
 
 static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
@@ -214,7 +224,9 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	inter_vproc = info->intermediate_voltage;
 
 	old_freq_hz = clk_get_rate(cpu_clk);
-	old_vproc = regulator_get_voltage(info->proc_reg);
+	old_vproc = info->old_vproc;
+	if (old_vproc == 0)
+		old_vproc = regulator_get_voltage(info->proc_reg);
 	if (old_vproc < 0) {
 		pr_err("%s: invalid Vproc value: %d\n", __func__, old_vproc);
 		return old_vproc;
@@ -231,6 +243,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	vproc = dev_pm_opp_get_voltage(opp);
 	dev_pm_opp_put(opp);
 
+	mutex_lock(&info->lock);
 	/*
 	 * If the new voltage or the intermediate voltage is higher than the
 	 * current voltage, scale up voltage first.
@@ -242,6 +255,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 			pr_err("cpu%d: failed to scale up voltage!\n",
 			       policy->cpu);
 			mtk_cpufreq_set_voltage(info, old_vproc);
+			mutex_unlock(&info->lock);
 			return ret;
 		}
 	}
@@ -253,6 +267,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 		       policy->cpu);
 		mtk_cpufreq_set_voltage(info, old_vproc);
 		WARN_ON(1);
+		mutex_unlock(&info->lock);
 		return ret;
 	}
 
@@ -263,6 +278,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 		       policy->cpu);
 		clk_set_parent(cpu_clk, armpll);
 		mtk_cpufreq_set_voltage(info, old_vproc);
+		mutex_unlock(&info->lock);
 		return ret;
 	}
 
@@ -273,6 +289,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 		       policy->cpu);
 		mtk_cpufreq_set_voltage(info, inter_vproc);
 		WARN_ON(1);
+		mutex_unlock(&info->lock);
 		return ret;
 	}
 
@@ -288,15 +305,69 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 			clk_set_parent(cpu_clk, info->inter_clk);
 			clk_set_rate(armpll, old_freq_hz);
 			clk_set_parent(cpu_clk, armpll);
+			mutex_unlock(&info->lock);
 			return ret;
 		}
 	}
 
+	info->opp_freq = freq_hz;
+	mutex_unlock(&info->lock);
+
 	return 0;
 }
 
 #define DYNAMIC_POWER "dynamic-power-coefficient"
 
+static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
+				    unsigned long event, void *data)
+{
+	struct dev_pm_opp *opp = data;
+	struct dev_pm_opp *new_opp;
+	struct mtk_cpu_dvfs_info *info;
+	unsigned long freq, volt;
+	struct cpufreq_policy *policy;
+	int ret = 0;
+
+	info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
+
+	if (event == OPP_EVENT_ADJUST_VOLTAGE) {
+		freq = dev_pm_opp_get_freq(opp);
+
+		mutex_lock(&info->lock);
+		if (info->opp_freq == freq) {
+			volt = dev_pm_opp_get_voltage(opp);
+			ret = mtk_cpufreq_set_voltage(info, volt);
+			if (ret)
+				dev_err(info->cpu_dev, "failed to scale voltage: %d\n",
+					ret);
+		}
+		mutex_unlock(&info->lock);
+	} else if (event == OPP_EVENT_DISABLE) {
+		freq = dev_pm_opp_get_freq(opp);
+		/* case of current opp item is disabled */
+		if (info->opp_freq == freq) {
+			freq = 1;
+			new_opp = dev_pm_opp_find_freq_ceil(info->cpu_dev,
+							    &freq);
+			if (!IS_ERR(new_opp)) {
+				dev_pm_opp_put(new_opp);
+				policy = cpufreq_cpu_get(info->opp_cpu);
+				if (policy) {
+					cpufreq_driver_target(policy,
+						freq / 1000,
+						CPUFREQ_RELATION_L);
+					cpufreq_cpu_put(policy);
+				}
+			} else {
+				pr_err("%s: all opp items are disabled\n",
+				       __func__);
+			}
+		}
+	}
+
+	return notifier_from_errno(ret);
+}
+
 static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 {
 	struct device *cpu_dev;
@@ -392,11 +463,21 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
 	dev_pm_opp_put(opp);
 
+	info->opp_cpu = cpu;
+	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
+	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);
+	if (ret) {
+		pr_warn("cannot register opp notification\n");
+		goto out_disable_inter_clock;
+	}
+
+	mutex_init(&info->lock);
 	info->cpu_dev = cpu_dev;
 	info->proc_reg = proc_reg;
 	info->sram_reg = IS_ERR(sram_reg) ? NULL : sram_reg;
 	info->cpu_clk = cpu_clk;
 	info->inter_clk = inter_clk;
+	info->opp_freq = clk_get_rate(cpu_clk);
 
 	/*
 	 * If SRAM regulator is present, software "voltage tracking" is needed
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
