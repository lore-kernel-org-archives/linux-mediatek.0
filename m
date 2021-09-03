Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEE2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 08:49:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73FAC60FE6
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 08:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73FAC60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IdI4CVR22ORO357Xp3ljTT15RSAF/X2eN8Nbw5cDoY=; b=zV4wVeZni4DbQT
	GSldx/lmhUn+6KK9gHqDAJaPCRdsx1n8ehdQkhJ7nNtgyGynU0h+Ht5IRsP8JkzsesiF/nrTkuNlW
	58eJvC8Mc3WEJShuDYUNkfyafCNc3ZUWmuC6fOd0NrW9EQq4bvK8vNS78h9IhZ2rKwuRF4Q/a9tAI
	SwuRoHewYnJLeMNxnNCsQkg0IDmCsir54/fXZWRnE0iEQEo5kjjuQMv/nMM/q42yWKcqwYJvi4W0z
	aCHr+xGTlIuCCDpuWBhib7im//F9ten4Lr6V+rk2NqoHXj4jz5TB8yLbXKaK9cOqdQyFze/QhLDsq
	1fuTgLA1rA9fPtFyGjxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM4t3-00BJtB-5z; Fri, 03 Sep 2021 08:49:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM4sp-00BJr3-Pb; Fri, 03 Sep 2021 08:49:13 +0000
X-UUID: f93982d4618d4686a3d6043b00c1374a-20210903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=sya6xpq6ZJpjn5T5u1cwe9TPrg6rqlnS3S7q6BYAwf4=; 
 b=FhFghE4DHJD2I4HgoTioW4cxlqWF9LKhHnC9fdSQkZhpn43A/8BHChbNJOAYVfHSjvx2RxBgHWtw4VjRK6VCxIuXMKHwetq7qOPN/GlcMhaRyys+FsORHHqGPIyt4PjI9m7zVRL+w5f5UCQqNlUmy3POMi4zsEI4F16ULz5iP+M=;
X-UUID: f93982d4618d4686a3d6043b00c1374a-20210903
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1980038702; Fri, 03 Sep 2021 01:49:08 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Sep 2021 01:39:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Sep 2021 16:39:30 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 3 Sep 2021 16:39:30 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, "Rob
 Herring" <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>,
 <hector.yuan@mediatek.com>
Subject: [PATCH v15 2/3] cpufreq: Add of_perf_domain_get_sharing_cpumask
Date: Fri, 3 Sep 2021 16:39:23 +0800
Message-ID: <1630658364-6192-3-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1630658364-6192-1-git-send-email-hector.yuan@mediatek.com>
References: <1630658364-6192-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_014911_886919_4D617B7D 
X-CRM114-Status: GOOD (  13.67  )
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

From: "Hector.Yuan" <hector.yuan@mediatek.com>

Add of_perf_domain_get_sharing_cpumask function to group cpu
to specific performance domain.

Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
---
 include/linux/cpufreq.h |   46 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 9fd7194..0246144 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -13,6 +13,8 @@
 #include <linux/completion.h>
 #include <linux/kobject.h>
 #include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/pm_qos.h>
 #include <linux/spinlock.h>
 #include <linux/sysfs.h>
@@ -995,6 +997,43 @@ static inline int cpufreq_table_count_valid_entries(const struct cpufreq_policy
 
 	return count;
 }
+
+static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_name,
+						     const char *cell_name, struct cpumask *cpumask)
+{
+	struct device_node *cpu_np;
+	struct of_phandle_args args;
+	int target_idx;
+	int cpu, ret;
+
+	cpu_np = of_cpu_device_node_get(pcpu);
+	of_parse_phandle_with_args(cpu_np, list_name,
+				   cell_name, 0, &args);
+	of_node_put(cpu_np);
+	target_idx = args.args[0];
+
+	for_each_possible_cpu(cpu) {
+		if (cpu == pcpu)
+			continue;
+
+		cpu_np = of_cpu_device_node_get(cpu);
+		if (!cpu_np)
+			continue;
+
+		ret = of_parse_phandle_with_args(cpu_np, list_name,
+						 cell_name, 0,
+						 &args);
+
+		of_node_put(cpu_np);
+		if (ret < 0)
+			continue;
+
+		if (target_idx == args.args[0])
+			cpumask_set_cpu(cpu, cpumask);
+	}
+
+	return target_idx;
+}
 #else
 static inline int cpufreq_boost_trigger_state(int state)
 {
@@ -1014,6 +1053,12 @@ static inline bool policy_has_boost_freq(struct cpufreq_policy *policy)
 {
 	return false;
 }
+
+static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_name,
+						     const char *cell_name, struct cpumask *cpumask)
+{
+	return -EOPNOTSUPP;
+}
 #endif
 
 #if defined(CONFIG_ENERGY_MODEL) && defined(CONFIG_CPU_FREQ_GOV_SCHEDUTIL)
@@ -1035,7 +1080,6 @@ void arch_set_freq_scale(const struct cpumask *cpus,
 {
 }
 #endif
-
 /* the following are really really optional */
 extern struct freq_attr cpufreq_freq_attr_scaling_available_freqs;
 extern struct freq_attr cpufreq_freq_attr_scaling_boost_freqs;
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
