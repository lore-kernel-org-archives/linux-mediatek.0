Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397A6C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 06:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6LIBq774n96eVxdlvC8+mU8PUZ0X1Yo9UT0ZJHOcZGc=; b=BdJ9C2ps4NC8ZI
	dT4A7uZc+Amyt1mLKRs3Iwl0lZZH7S2gQyMKVIwRvPQ8oAoAnirVwTgGlCBvxB7eECIwSCkc1kJ1h
	FGQfzvM3cUuWJRmn+OhnZeSlKQYKuwpG0L7jXqlLZimMnZySZUL35+ucrdUD/WTQD3P8vxlKV3vIE
	LfLsnI0AThpaqIMfQW7blGn5W6VjmkNrlN4ySDOVy7Gw0Zws8AMrxYsd+hGlhP0DpeL1RiUMuyT0m
	Z9RQ+8K4WwUlOdA6w9W0b3wH9yeSsGjcjh1/7Mg8ykw99ZtVxS60l3WvDB3lNGzqInKhTJAmjSPZV
	zfKSPY/m+xsZ8OmbrRdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfF25-008pfF-PA; Fri, 15 Apr 2022 06:02:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfEzS-008nta-Mn; Fri, 15 Apr 2022 05:59:33 +0000
X-UUID: 6ed733f950694ddaa1f539c5872f7138-20220414
X-UUID: 6ed733f950694ddaa1f539c5872f7138-20220414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 369706219; Thu, 14 Apr 2022 22:59:22 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 22:59:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 15 Apr 2022 13:59:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 15 Apr 2022 13:59:18 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Andrew-sh.Cheng
 <andrew-sh.cheng@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: [PATCH V3 05/15] cpufreq: mediatek: Add opp notification support
Date: Fri, 15 Apr 2022 13:59:06 +0800
Message-ID: <20220415055916.28350-6-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_225930_844924_13315930 
X-CRM114-Status: GOOD (  17.25  )
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

From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>

From this opp notifier, cpufreq should listen to opp notification and do
proper actions when receiving events of disable and voltage adjustment.

One of the user for this opp notifier is MediaTek SVS.
The MediaTek Smart Voltage Scaling (SVS) is a hardware which calculates
suitable SVS bank voltages to OPP voltage table.

Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 93 +++++++++++++++++++++++++++---
 1 file changed, 85 insertions(+), 8 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index fa8b193bf27b..221f249f8d21 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -41,6 +41,11 @@ struct mtk_cpu_dvfs_info {
 	int intermediate_voltage;
 	bool need_voltage_tracking;
 	int pre_vproc;
+	/* Avoid race condition for regulators between notify and policy */
+	struct mutex reg_lock;
+	struct notifier_block opp_nb;
+	int opp_cpu;
+	unsigned long opp_freq;
 };
 
 static LIST_HEAD(dvfs_info_list);
@@ -220,6 +225,9 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	inter_vproc = info->intermediate_voltage;
 
 	pre_freq_hz = clk_get_rate(cpu_clk);
+
+	mutex_lock(&info->reg_lock);
+
 	pre_vproc = info->pre_vproc;
 	if (pre_vproc <= 0)
 		pre_vproc = regulator_get_voltage(info->proc_reg);
@@ -250,7 +258,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 			dev_err(cpu_dev,
 				"cpu%d: failed to scale up voltage!\n", policy->cpu);
 			mtk_cpufreq_set_voltage(info, pre_vproc);
-			return ret;
+			goto out;
 		}
 	}
 
@@ -260,8 +268,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 		dev_err(cpu_dev,
 			"cpu%d: failed to re-parent cpu clock!\n", policy->cpu);
 		mtk_cpufreq_set_voltage(info, pre_vproc);
-		WARN_ON(1);
-		return ret;
+		goto out;
 	}
 
 	/* Set the original PLL to target rate. */
@@ -271,7 +278,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 			"cpu%d: failed to scale cpu clock rate!\n", policy->cpu);
 		clk_set_parent(cpu_clk, armpll);
 		mtk_cpufreq_set_voltage(info, pre_vproc);
-		return ret;
+		goto out;
 	}
 
 	/* Set parent of CPU clock back to the original PLL. */
@@ -280,8 +287,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 		dev_err(cpu_dev,
 			"cpu%d: failed to re-parent cpu clock!\n", policy->cpu);
 		mtk_cpufreq_set_voltage(info, inter_vproc);
-		WARN_ON(1);
-		return ret;
+		goto out;
 	}
 
 	/*
@@ -296,15 +302,72 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 			clk_set_parent(cpu_clk, info->inter_clk);
 			clk_set_rate(armpll, pre_freq_hz);
 			clk_set_parent(cpu_clk, armpll);
-			return ret;
+			goto out;
 		}
 	}
 
-	return 0;
+	info->opp_freq = freq_hz;
+
+out:
+	mutex_unlock(&info->reg_lock);
+
+	return ret;
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
+		mutex_lock(&info->reg_lock);
+		if (info->opp_freq == freq) {
+			volt = dev_pm_opp_get_voltage(opp);
+			ret = mtk_cpufreq_set_voltage(info, volt);
+			if (ret)
+				dev_err(info->cpu_dev,
+					"failed to scale voltage: %d\n", ret);
+		}
+		mutex_unlock(&info->reg_lock);
+	} else if (event == OPP_EVENT_DISABLE) {
+		freq = dev_pm_opp_get_freq(opp);
+
+		/* case of current opp item is disabled */
+		if (info->opp_freq == freq) {
+			freq = 1;
+			new_opp = dev_pm_opp_find_freq_ceil(info->cpu_dev,
+							    &freq);
+			if (IS_ERR(new_opp)) {
+				dev_err(info->cpu_dev,
+					"all opp items are disabled\n");
+				ret = PTR_ERR(new_opp);
+				return notifier_from_errno(ret);
+			}
+
+			dev_pm_opp_put(new_opp);
+			policy = cpufreq_cpu_get(info->opp_cpu);
+			if (policy) {
+				cpufreq_driver_target(policy, freq / 1000,
+						      CPUFREQ_RELATION_L);
+				cpufreq_cpu_put(policy);
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
@@ -393,6 +456,17 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
 	dev_pm_opp_put(opp);
 
+	info->opp_cpu = cpu;
+	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
+	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);
+	if (ret) {
+		dev_err(cpu_dev, "cpu%d: failed to register opp notifier\n", cpu);
+		goto out_disable_inter_clock;
+	}
+
+	mutex_init(&info->reg_lock);
+	info->opp_freq = clk_get_rate(info->cpu_clk);
+
 	/*
 	 * If SRAM regulator is present, software "voltage tracking" is needed
 	 * for this CPU power domain.
@@ -448,6 +522,9 @@ static void mtk_cpu_dvfs_info_release(struct mtk_cpu_dvfs_info *info)
 	}
 
 	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
+
+	if (!IS_ERR_OR_NULL(info->cpu_dev))
+		dev_pm_opp_unregister_notifier(info->cpu_dev, &info->opp_nb);
 }
 
 static int mtk_cpufreq_init(struct cpufreq_policy *policy)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
