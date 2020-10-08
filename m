Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3167BC43467
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 12:14:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A551F217BA
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 12:13:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AknirvYq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GyW6TsgX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A551F217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gelp9o54bJ8lQvuW+9DRjR9zn1xXslDUQaS/h53cAOU=; b=AknirvYqEVhQVNWRNPLFd9l23
	f8wb8cTH4An6uqoZFJc0DGQ86hJRrj15+nnf3mrpA71UQzkAihLBmX3yp30zm5CKJKg4wrYXT1HZO
	wFNEcU/N2cWIazwZF5K86tGeu0+qyf0NxrLHqfA1BHmb5aH6kJl9rSoLJZlZ7fZ8LV6VNbySBWt/5
	rZ5NZFMnzh1lwDWtFnKF6YAS09yhc3TErUwlZcOp2WyGac7Q9+XoC9TOJVmY+T+h6Uxn/EUZd9Skh
	9dG94Oov8OSPoh26miYg/0Ii8N9R9yyxYXlblOmLhHi2ilHI2KHJ4Flb1n48WSoCuAuTM6sha9w80
	tLUImu9VQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQUnt-0000hp-N3; Thu, 08 Oct 2020 12:13:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQUnr-0000gk-2v; Thu, 08 Oct 2020 12:13:48 +0000
X-UUID: e8d4c3cb10724323b9826bc3f9a33beb-20201008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3MSsqoh1JwjXfyI5saR12zhZgmKR4OSbtoJozpp9kpc=; 
 b=GyW6TsgXr4WBE4vWeF+mAqjVdhuazzUYat8H/qp6KuEzZYFBCYYUap7mQ5X+pTz9GIL8CuhQAmIQUhvDzPXe1m4USxq4O/LYsGUxJG2QExK0mcxHfM0nTVD/s2l44q6IsLDmtXXTqP7LOD+p10xnRz7fjeD7owvOnh/mH7PF05Y=;
X-UUID: e8d4c3cb10724323b9826bc3f9a33beb-20201008
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1409110451; Thu, 08 Oct 2020 04:13:39 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 05:13:37 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 20:13:34 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 8 Oct 2020 20:13:34 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v1 1/1] cpufreq: mediatek-hw: Register EM power table
Date: Thu, 8 Oct 2020 20:13:24 +0800
Message-ID: <1602159204-13756-2-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1602159204-13756-1-git-send-email-hector.yuan@mediatek.com>
References: <1602159204-13756-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F6F2F17101A6B232DE0515C059CB03673413A6D7CCAE1BF62441835C41AF8EBC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_081347_256207_12DB2774 
X-CRM114-Status: GOOD (  18.82  )
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
 drivers/cpufreq/mediatek-cpufreq-hw.c |   50 +++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 8fa12e5..3808ea0 100644
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
+				     unsigned long *KHz, int cpu)
+{
+	struct cpufreq_mtk *c = mtk_freq_domain_map[cpu];
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
@@ -64,6 +87,7 @@ static unsigned int mtk_cpufreq_hw_get(unsigned int cpu)
 static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 {
 	struct cpufreq_mtk *c;
+	struct em_data_callback em_cb = EM_DATA_CB(mtk_cpufreq_get_cpu_power);
 
 	c = mtk_freq_domain_map[policy->cpu];
 	if (!c) {
@@ -77,7 +101,8 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	policy->driver_data = c;
 
 	/* HW should be in enabled state to proceed now */
-	writel_relaxed(0x1, c->reg_bases[REG_ENABLE]);
+	writel_relaxed(0x1, c->reg_bases[REG_FREQ_ENABLE]);
+	em_register_perf_domain(policy->cpus, c->nr_opp, &em_cb);
 
 	return 0;
 }
@@ -93,7 +118,7 @@ static int mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 	}
 
 	/* HW should be in paused state now */
-	writel_relaxed(0x0, c->reg_bases[REG_ENABLE]);
+	writel_relaxed(0x0, c->reg_bases[REG_FREQ_ENABLE]);
 
 	return 0;
 }
@@ -122,7 +147,7 @@ static int mtk_cpu_create_freq_table(struct platform_device *pdev,
 	if (!c->table)
 		return -ENOMEM;
 
-	base_table = c->reg_bases[REG_LUT_TABLE];
+	base_table = c->reg_bases[REG_FREQ_LUT_TABLE];
 
 	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
 		data = readl_relaxed(base_table + (i * LUT_ROW_SIZE));
@@ -140,6 +165,7 @@ static int mtk_cpu_create_freq_table(struct platform_device *pdev,
 	}
 
 	c->table[i].frequency = CPUFREQ_TABLE_END;
+	c->nr_opp = i;
 
 	return 0;
 }
@@ -192,7 +218,7 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
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
