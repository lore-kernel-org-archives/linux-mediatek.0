Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B611BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kq1bpqBvyuO48FA7ct2v8KQEm40ul5KqmNEfQMDKto0=; b=R6Fv9CAWwuV8tE
	5mdx5Qw6mG6dW9GUv86v7vqwYPDkf84eLBz6E3s0rmlFVKM9al8N3VCheda5qMpi9ZTNXmbSkb4I7
	mXAFPPqTpUmxrfCbUkTNjQmA8D4O6nG1MYhz3SFVkKlSuY3LRLOxlHuSJ4D1jeTFL4r92nSe3iIxw
	igchDyut0tS2swKnXpZOr4qFDXwlI4JyZaoPp4jXCRBbWICoF9mx/ELxzUyc5oz5dr93DuE6Dbxma
	fvOlRhDlxu1STzCJ4ZR9uEbkkF2VU/AiNrIYOHcDqIleeLofKl/XF7uIbDtxiNnUb+5yI4nwqqLSj
	/zxvl4Lwo0i2mP9HPPYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhoMq-00H8Xu-J7; Fri, 22 Apr 2022 08:10:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhoFe-00H5DN-G1; Fri, 22 Apr 2022 08:02:52 +0000
X-UUID: 88810bdd5aec48d58f31c681c13de5f2-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:4d77efa4-f8d1-459b-84a9-39335631578d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:90a997f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 88810bdd5aec48d58f31c681c13de5f2-20220422
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1423343566; Fri, 22 Apr 2022 01:02:45 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 00:52:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 15:52:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 15:52:45 +0800
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
Subject: [PATCH V4 05/14] cpufreq: mediatek: Add opp notification support
Date: Fri, 22 Apr 2022 15:52:30 +0800
Message-ID: <20220422075239.16437-6-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_010250_599986_F8726047 
X-CRM114-Status: GOOD (  18.05  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 92 +++++++++++++++++++++++++++---
 1 file changed, 84 insertions(+), 8 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 1688cf68849c..37c02785a01f 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -41,6 +41,11 @@ struct mtk_cpu_dvfs_info {
 	int intermediate_voltage;
 	bool need_voltage_tracking;
 	int pre_vproc;
+	/* Avoid race condition for regulators between notify and policy */
+	struct mutex reg_lock;
+	struct notifier_block opp_nb;
+	unsigned int opp_cpu;
+	unsigned long opp_freq;
 };
 
 static LIST_HEAD(dvfs_info_list);
@@ -221,6 +226,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 
 	pre_freq_hz = clk_get_rate(cpu_clk);
 
+	mutex_lock(&info->reg_lock);
+
 	if (unlikely(info->pre_vproc <= 0))
 		pre_vproc = regulator_get_voltage(info->proc_reg);
 	else
@@ -253,7 +260,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 			dev_err(cpu_dev,
 				"cpu%d: failed to scale up voltage!\n", policy->cpu);
 			mtk_cpufreq_set_voltage(info, pre_vproc);
-			return ret;
+			goto out;
 		}
 	}
 
@@ -263,8 +270,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 		dev_err(cpu_dev,
 			"cpu%d: failed to re-parent cpu clock!\n", policy->cpu);
 		mtk_cpufreq_set_voltage(info, pre_vproc);
-		WARN_ON(1);
-		return ret;
+		goto out;
 	}
 
 	/* Set the original PLL to target rate. */
@@ -274,7 +280,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 			"cpu%d: failed to scale cpu clock rate!\n", policy->cpu);
 		clk_set_parent(cpu_clk, armpll);
 		mtk_cpufreq_set_voltage(info, pre_vproc);
-		return ret;
+		goto out;
 	}
 
 	/* Set parent of CPU clock back to the original PLL. */
@@ -283,8 +289,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 		dev_err(cpu_dev,
 			"cpu%d: failed to re-parent cpu clock!\n", policy->cpu);
 		mtk_cpufreq_set_voltage(info, inter_vproc);
-		WARN_ON(1);
-		return ret;
+		goto out;
 	}
 
 	/*
@@ -299,15 +304,72 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
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
@@ -396,6 +458,17 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
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
@@ -451,6 +524,9 @@ static void mtk_cpu_dvfs_info_release(struct mtk_cpu_dvfs_info *info)
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
