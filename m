Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14525C55178
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:35:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BBB521527
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:35:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OEHbLjpS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZxR2oj8z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BBB521527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eG6fXK/h76yXSYtzWwt1eudhoJDDOAY+BJSHM53Rwm0=; b=OEHbLjpS8xcXTBODsQcqV2Hfe
	eg7AntP9zW3aqzutcTNobLmVSCPValyfI9UHP9wk5/xLa1/shoy8IPmSg7e1MvMOjOdfxSS8Y6+Gl
	PqWVFsKbvyEXeDhlRpTya/QWh4oSkZU0u9Vsq+B/ESjqb8Fdxh48k/8JtlEYQYTpdrgrN5tIxTxTt
	eRRv/KTWEOvUn1Fe7TCsfPgcxWEkmXB8MEaMvYwvWD21Ro9V0zSmIGKTq0R+rvvTGJGISTN5aeHvQ
	WAdsNIKrN3ody5EOUXtqxJTReQjyK8mCxGDwEvmeNnK7zrKBsDlA9h6Uhp10qsX+A5PmeZ35A3gB3
	QENkywJkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVsXX-0001lj-S8; Fri, 23 Oct 2020 08:35:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVsXR-0001if-A4; Fri, 23 Oct 2020 08:35:06 +0000
X-UUID: c5731e94f0574299a646e78b04578e24-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rCMbXAuODNB8y7MkCaQc2mt7ayxf9TpGQeinPyFrbEU=; 
 b=ZxR2oj8zOX5nEMZ/vlqBLfka6izTXJCF/+gZ1n5VVRsvC7mkTUv+sPSftB5H3ByyVildlxl5/PnQAt/Bjyd97ojh6Tjxh57AwIiz7BqHC6xBBGP/APpMXUImeJDud7bTn/40002WsK0YUnVRJz+1U5duTHXuLv2GaGaqI67KoJk=;
X-UUID: c5731e94f0574299a646e78b04578e24-20201023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1082972577; Fri, 23 Oct 2020 00:35:02 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 01:25:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 16:24:59 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 23 Oct 2020 16:24:59 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
 "Santosh Shilimkar" <ssantosh@kernel.org>, Amit Kucheria
 <amit.kucheria@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>, "Dave Gerlach" <d-gerlach@ti.com>, Florian Fainelli
 <f.fainelli@gmail.com>, "Robin Murphy" <robin.murphy@arm.com>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 4/6] cpufreq: mediatek-hw: register EM power table
Date: Fri, 23 Oct 2020 16:24:51 +0800
Message-ID: <1603441493-18554-5-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
References: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1492DA2F4D89FE5D46D7253A3B77EFCEF5EC965C4A22111D57C163518DC29DF22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_043505_543331_E0FC3602 
X-CRM114-Status: GOOD (  19.86  )
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

Register energy model table for EAS and thermal cooling device usage

Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq-hw.c |   58 ++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 12 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 74449da..241d93f 100644
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
@@ -191,7 +225,7 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
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
