Return-Path: <SRS0=+2Q0=DW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B846EC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 12:25:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E06E22223F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 12:24:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jEGUMoXR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Tz7NR+uQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E06E22223F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LHKQNLFaLDto5R5FP+ZtIIKXd22kYoFxWZN2MB0MTnI=; b=jEGUMoXRmjvA0gqk7tK4L2fni
	G4+p0mDE4+cR8xic8CsG/H2s1VcrjGwanL1CYPxoztlTY1jRS4vQMU4U/Y8issSlO4+6K9aK3onnM
	hmF7Z7r3tYfH70BM/GZdFB+S8y7q6YKEh+whJDIW9IcShF4ZSuFKz1zFZwHxM9Q67pEysmHKnYvGJ
	PX0zyPrlEGbjGFcNtK7aFVwASycZqaplV5TqTPftwcq//XDwOOiPAYknnOQZ3tmIvvalq8S7VPTi6
	OiBldU8ifIY73iagrA8WcjKizbcjg2haGIUpKalkKvKQK/IvpqJ2ZM1sjpGunkJ4784Fn/dY8vjwO
	55RgJHNWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT2JO-0005Nu-Gy; Thu, 15 Oct 2020 12:24:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT2JJ-0005MI-T3; Thu, 15 Oct 2020 12:24:47 +0000
X-UUID: f470d24decdc4eb7a049314145ab0c2f-20201015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=21mTreiQdBYOc+BuUKZApw7GoJYgp/DZH/ohzMH+aOE=; 
 b=Tz7NR+uQbVwVhlVt9q+V5morKv2TdP2wDNuSUDsZ48n0K5Ju+/I18YS/7vF7RCFBZEwUXmgAyC+NoyNk4odZ+vsGTLFG/FDMMmthWSBCA3TfXBUaTZBNafU/YvOWQYdzNnowrV4vnUU1sgbqq2871LPwhfr51RtjuEhBwrUJyiE=;
X-UUID: f470d24decdc4eb7a049314145ab0c2f-20201015
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1813565954; Thu, 15 Oct 2020 04:24:36 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Oct 2020 05:24:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Oct 2020 20:24:33 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Oct 2020 20:24:33 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v2 1/1] cpufreq: mediatek-hw: Register EM power table
Date: Thu, 15 Oct 2020 20:24:27 +0800
Message-ID: <1602764667-29009-2-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1602764667-29009-1-git-send-email-hector.yuan@mediatek.com>
References: <1602764667-29009-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_082446_063280_E05E0025 
X-CRM114-Status: GOOD (  19.01  )
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
Cc: hector.yuan@mediatek.com, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Hector.Yuan" <hector.yuan@mediatek.com>

Register CPU power table to energy model framework

Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq-hw.c |   58 ++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 12 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 8fa12e5..379a5f4 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/cpufreq.h>
+#include <linux/energy_model.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -17,9 +18,10 @@
 #define LUT_ROW_SIZE			0x4
 
 enum {
-	REG_LUT_TABLE,
-	REG_ENABLE,
-	REG_PERF_STATE,
+	REG_FREQ_LUT_TABLE,
+	REG_FREQ_ENABLE,
+	REG_FREQ_PERF_STATE,
+	REG_EM_POWER_TBL,
 
 	REG_ARRAY_SIZE,
 };
@@ -27,23 +29,44 @@ enum {
 struct cpufreq_mtk {
 	struct cpufreq_frequency_table *table;
 	void __iomem *reg_bases[REG_ARRAY_SIZE];
+	int nr_opp;
 	cpumask_t related_cpus;
 };
 
 static const u16 cpufreq_mtk_offsets[REG_ARRAY_SIZE] = {
-	[REG_LUT_TABLE]		= 0x0,
-	[REG_ENABLE]		= 0x84,
-	[REG_PERF_STATE]	= 0x88,
+	[REG_FREQ_LUT_TABLE]	= 0x0,
+	[REG_FREQ_ENABLE]	= 0x84,
+	[REG_FREQ_PERF_STATE]	= 0x88,
+	[REG_EM_POWER_TBL]	= 0x3D0,
 };
 
 static struct cpufreq_mtk *mtk_freq_domain_map[NR_CPUS];
 
+static int mtk_cpufreq_get_cpu_power(unsigned long *mW,
+				     unsigned long *KHz, struct device *cpu_dev)
+{
+	struct cpufreq_mtk *c = mtk_freq_domain_map[cpu_dev->id];
+	int i;
+
+	for (i = 0; i < c->nr_opp; i++) {
+		if (c->table[i].frequency < *KHz)
+			break;
+	}
+	i--;
+
+	*KHz = c->table[i].frequency;
+	*mW = readl_relaxed(c->reg_bases[REG_EM_POWER_TBL] +
+			    i * LUT_ROW_SIZE) / 1000;
+
+	return 0;
+}
+
 static int mtk_cpufreq_hw_target_index(struct cpufreq_policy *policy,
 				       unsigned int index)
 {
 	struct cpufreq_mtk *c = policy->driver_data;
 
-	writel_relaxed(index, c->reg_bases[REG_PERF_STATE]);
+	writel_relaxed(index, c->reg_bases[REG_FREQ_PERF_STATE]);
 
 	return 0;
 }
@@ -55,7 +78,7 @@ static unsigned int mtk_cpufreq_hw_get(unsigned int cpu)
 
 	c = mtk_freq_domain_map[cpu];
 
-	index = readl_relaxed(c->reg_bases[REG_PERF_STATE]);
+	index = readl_relaxed(c->reg_bases[REG_FREQ_PERF_STATE]);
 	index = min(index, LUT_MAX_ENTRIES - 1);
 
 	return c->table[index].frequency;
@@ -64,6 +87,14 @@ static unsigned int mtk_cpufreq_hw_get(unsigned int cpu)
 static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 {
 	struct cpufreq_mtk *c;
+	struct device *cpu_dev;
+	struct em_data_callback em_cb = EM_DATA_CB(mtk_cpufreq_get_cpu_power);
+
+	cpu_dev = get_cpu_device(policy->cpu);
+	if (!cpu_dev) {
+		pr_err("failed to get cpu%d device\n", policy->cpu);
+		return -ENODEV;
+	}
 
 	c = mtk_freq_domain_map[policy->cpu];
 	if (!c) {
@@ -77,7 +108,9 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	policy->driver_data = c;
 
 	/* HW should be in enabled state to proceed now */
-	writel_relaxed(0x1, c->reg_bases[REG_ENABLE]);
+	writel_relaxed(0x1, c->reg_bases[REG_FREQ_ENABLE]);
+
+	em_dev_register_perf_domain(cpu_dev, c->nr_opp, &em_cb, policy->cpus);
 
 	return 0;
 }
@@ -93,7 +126,7 @@ static int mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 	}
 
 	/* HW should be in paused state now */
-	writel_relaxed(0x0, c->reg_bases[REG_ENABLE]);
+	writel_relaxed(0x0, c->reg_bases[REG_FREQ_ENABLE]);
 
 	return 0;
 }
@@ -122,7 +155,7 @@ static int mtk_cpu_create_freq_table(struct platform_device *pdev,
 	if (!c->table)
 		return -ENOMEM;
 
-	base_table = c->reg_bases[REG_LUT_TABLE];
+	base_table = c->reg_bases[REG_FREQ_LUT_TABLE];
 
 	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
 		data = readl_relaxed(base_table + (i * LUT_ROW_SIZE));
@@ -140,6 +173,7 @@ static int mtk_cpu_create_freq_table(struct platform_device *pdev,
 	}
 
 	c->table[i].frequency = CPUFREQ_TABLE_END;
+	c->nr_opp = i;
 
 	return 0;
 }
@@ -192,7 +226,7 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	for (i = REG_LUT_TABLE; i < REG_ARRAY_SIZE; i++)
+	for (i = REG_FREQ_LUT_TABLE; i < REG_ARRAY_SIZE; i++)
 		c->reg_bases[i] = base + offsets[i];
 
 	ret = mtk_get_related_cpus(index, c);
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
