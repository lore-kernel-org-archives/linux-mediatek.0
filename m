Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73F8C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 05:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v95bTOMcu4j1Guhfk975NoECArBrxHLTCRsR2lhHPI8=; b=G27LPBczGx+SmZ
	mLsQX1TqQ6K7KK9rtdEmx+SszZpMQBovkfyDnj/Hf3BRbDdNx5q1CmWirVYQQJUTOIuzc4fIBhmAW
	mDFyWjXMHx1PEMrO8miundBl2sV+3ebPaDM9PgE6eqc6BGxZdevupwH8oEf2nHg/YBRczpVIZO2j5
	OBkLC0St8I0D442RuS5lEMAZs1GiRfukKnnX5GuPxZcp8tDBlxMjUidCJDBKE605l2i7pmx8BJ2At
	zztodcOXrvZHoVOIhppXY0FwXQpXgqbrVFrB3gRtUpcAJ/uwO04wRuzBaXxFqPhBYf2T79ne9bqtU
	1lq4utyDv1dsT8ymtfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncgu1-00F2Fs-Gm; Fri, 08 Apr 2022 05:11:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncgs4-00F1B9-Me; Fri, 08 Apr 2022 05:09:23 +0000
X-UUID: 930b50e2a9724e148b08245e316508e9-20220407
X-UUID: 930b50e2a9724e148b08245e316508e9-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1998329964; Thu, 07 Apr 2022 22:09:14 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 21:59:13 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 12:59:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Apr 2022 12:59:11 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Andrew-sh.Cheng
 <andrew-sh.cheng@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: [PATCH V2 07/15] cpufreq: mediatek: Add opp notification for SVS
 support
Date: Fri, 8 Apr 2022 12:59:00 +0800
Message-ID: <20220408045908.21671-8-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_220920_829015_EFF1D547 
X-CRM114-Status: GOOD (  19.25  )
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

The Smart Voltage Scaling (SVS) is a hardware which calculates suitable
SVS bank voltages to OPP voltage table.

When the SVS is enabled, cpufreq should listen to opp notification and do
proper actions when receiving events of disable and voltage adjustment.

Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 90 +++++++++++++++++++++++++++---
 1 file changed, 82 insertions(+), 8 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 472f4de29e5f..1369da62780a 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -41,6 +41,11 @@ struct mtk_cpu_dvfs_info {
 	int intermediate_voltage;
 	bool need_voltage_tracking;
 	int old_vproc;
+	/* Avoid race condition for regulators between notify and policy */
+	struct mutex reg_lock;
+	struct notifier_block opp_nb;
+	int opp_cpu;
+	unsigned long opp_freq;
 };
 
 static LIST_HEAD(dvfs_info_list);
@@ -238,6 +243,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 		return old_vproc;
 	}
 
+	mutex_lock(&info->reg_lock);
 	/*
 	 * If the new voltage or the intermediate voltage is higher than the
 	 * current voltage, scale up voltage first.
@@ -249,7 +255,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 			pr_err("cpu%d: failed to scale up voltage!\n",
 			       policy->cpu);
 			mtk_cpufreq_set_voltage(info, old_vproc);
-			return ret;
+			goto out;
 		}
 	}
 
@@ -259,8 +265,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 		pr_err("cpu%d: failed to re-parent cpu clock!\n",
 		       policy->cpu);
 		mtk_cpufreq_set_voltage(info, old_vproc);
-		WARN_ON(1);
-		return ret;
+		goto out;
 	}
 
 	/* Set the original PLL to target rate. */
@@ -270,7 +275,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 		       policy->cpu);
 		clk_set_parent(cpu_clk, armpll);
 		mtk_cpufreq_set_voltage(info, old_vproc);
-		return ret;
+		goto out;
 	}
 
 	/* Set parent of CPU clock back to the original PLL. */
@@ -279,8 +284,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 		pr_err("cpu%d: failed to re-parent cpu clock!\n",
 		       policy->cpu);
 		mtk_cpufreq_set_voltage(info, inter_vproc);
-		WARN_ON(1);
-		return ret;
+		goto out;
 	}
 
 	/*
@@ -295,15 +299,74 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 			clk_set_parent(cpu_clk, info->inter_clk);
 			clk_set_rate(armpll, old_freq_hz);
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
+					"%s: failed to scale voltage: %d\n",
+					__func__, ret);
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
+					"%s: all opp items are disabled\n",
+					__func__);
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
@@ -392,6 +455,17 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
 	dev_pm_opp_put(opp);
 
+	info->opp_cpu = cpu;
+	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
+	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);
+	if (ret) {
+		dev_warn(cpu_dev, "cpu%d: failed to register opp notifier\n", cpu);
+		goto out_disable_inter_clock;
+	}
+
+	mutex_init(&info->reg_lock);
+	info->opp_freq = clk_get_rate(info->cpu_clk);
+
 	/*
 	 * If SRAM regulator is present, software "voltage tracking" is needed
 	 * for this CPU power domain.
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
