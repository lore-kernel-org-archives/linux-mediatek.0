Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22156C55178
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:35:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A59CE22253
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:35:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v8E6Rfo/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cXdsTago"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A59CE22253
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XwdMqOmcmx1DAOBA+LlPxhLaXUO+BI3PlXMJvDxsQyE=; b=v8E6Rfo/VO0GmVGLg6zNuBMF1
	tnMlcE05ikEzwpZOuXize3KPyd2TIBZsdXBwSHNbolcx0ZpFLcLKxMx7aXulboOgwzfyNTFHV+ngj
	UugARh5zNpQynUS3KiFT2t+7oyscgF/1NAuqKizVeUvak6yanrEs9ZhKOrV5Dpax5GTQYYHHckcJx
	xZRxSibzmB2aA5fhoOHfQwAosSxFA7P+DTP/ASxH1DHwLlxDhAvZKuNf5mtKnZOVEBBF7kgpViXiE
	AX/Oyp77tcAqVSPHpxdBzUvR0QhTS8gFhfzeBn8QAmUA0z0Nf6otT2qEUZGAchlJVNbHGh2SHjwmm
	bGKNbyFUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVsXj-0001r5-PV; Fri, 23 Oct 2020 08:35:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVsXT-0001id-HR; Fri, 23 Oct 2020 08:35:09 +0000
X-UUID: bcf0ca36fbea4c5bb15f1c7a38242e72-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jUKvU/HzCuL2PPK0da8gu19V+NdKcPP0gYDYa+SwXrM=; 
 b=cXdsTagocYteyw1rA2GymNELY/goEo9kDLxqRAQrJznube8V7CaYnMEk+VqLxNMy7uS3gCCYxgePyrf+m8KQKTZNoiaQxYGJHkmDQ52Oa8gBP4ST0R7iJ8v3p+9HCqHXUllf7hJcmo+6J6CiReln5ItfxzhxTmQ6tnETO1bHFS0=;
X-UUID: bcf0ca36fbea4c5bb15f1c7a38242e72-20201023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 128534925; Fri, 23 Oct 2020 00:35:03 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 01:25:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
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
Subject: [PATCH v1 5/6] cpufreq: mediatek-hw: Add SVS CPU initialization
Date: Fri, 23 Oct 2020 16:24:52 +0800
Message-ID: <1603441493-18554-6-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
References: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_043507_887406_0F58A5F3 
X-CRM114-Status: GOOD (  17.59  )
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

Use pm_qos to block cpu-idle state for SVS initializing.
CPUs must be in power on state when doing SVS.
Add polling ack while coufreq hw is ready.(SVS init done)

Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq-hw.c |   32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 241d93f..15fba20 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -7,20 +7,27 @@
 #include <linux/cpufreq.h>
 #include <linux/energy_model.h>
 #include <linux/init.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
+#include <linux/pm_qos.h>
 #include <linux/slab.h>
 
 #define LUT_MAX_ENTRIES			32U
 #define LUT_FREQ			GENMASK(11, 0)
 #define LUT_ROW_SIZE			0x4
+#define CPUFREQ_HW_STATUS		BIT(0)
+#define SVS_HW_STATUS			BIT(1)
+#define POLL_USEC			1000
+#define TIMEOUT_USEC			300000
 
 enum {
 	REG_FREQ_LUT_TABLE,
 	REG_FREQ_ENABLE,
 	REG_FREQ_PERF_STATE,
+	REG_FREQ_HW_STATE,
 	REG_EM_POWER_TBL,
 
 	REG_ARRAY_SIZE,
@@ -37,6 +44,7 @@ struct cpufreq_mtk {
 	[REG_FREQ_LUT_TABLE]	= 0x0,
 	[REG_FREQ_ENABLE]	= 0x84,
 	[REG_FREQ_PERF_STATE]	= 0x88,
+	[REG_FREQ_HW_STATE]	= 0x8c,
 	[REG_EM_POWER_TBL]	= 0x3D0,
 };
 
@@ -89,6 +97,12 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	struct cpufreq_mtk *c;
 	struct device *cpu_dev;
 	struct em_data_callback em_cb = EM_DATA_CB(mtk_cpufreq_get_cpu_power);
+	struct pm_qos_request *qos_request;
+	int sig, pwr_hw = CPUFREQ_HW_STATUS | SVS_HW_STATUS;
+
+	qos_request = kzalloc(sizeof(*qos_request), GFP_KERNEL);
+	if (!qos_request)
+		return -ENOMEM;
 
 	cpu_dev = get_cpu_device(policy->cpu);
 	if (!cpu_dev) {
@@ -107,11 +121,29 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	policy->freq_table = c->table;
 	policy->driver_data = c;
 
+	/* Let CPUs leave idle-off state for SVS CPU initializing */
+	cpu_latency_qos_add_request(qos_request, 0);
+
 	/* HW should be in enabled state to proceed now */
 	writel_relaxed(0x1, c->reg_bases[REG_FREQ_ENABLE]);
 
+	if (readl_poll_timeout(c->reg_bases[REG_FREQ_HW_STATE], sig,
+			       (sig & pwr_hw) == pwr_hw, POLL_USEC,
+			       TIMEOUT_USEC)) {
+		if (!(sig & CPUFREQ_HW_STATUS)) {
+			pr_info("cpufreq hardware of CPU%d is not enabled\n",
+				policy->cpu);
+			return -ENODEV;
+		}
+
+		pr_info("SVS of CPU%d is not enabled\n", policy->cpu);
+	}
+
 	em_dev_register_perf_domain(cpu_dev, c->nr_opp, &em_cb, policy->cpus);
 
+	cpu_latency_qos_remove_request(qos_request);
+	kfree(qos_request);
+
 	return 0;
 }
 
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
