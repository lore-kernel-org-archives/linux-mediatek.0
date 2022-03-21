Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE0CC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 09:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=304HoQ6OK0LLPzH6L+mVXdEGRAULadVH/mfDaBgq2XI=; b=K4QZeKLNJISp6y
	zZMdLT999GcWsgorXNXAjOPsaleSdkWb7W+UfpxiRtaBnniV9FO5yx5JGq1qytNb1LuH+tGY+S5Qf
	SlyzAiS0iyscBAEp6/vM9Y1ViMCvMKDglo8Bd1O/QVvO4dssFJfsEZUdqWI+iKaOmn+ujfLhHR+Gp
	RSfrX3Eu4TZq03ZzOlf0Kn9ftmJpEISnJ/NgkZuyTjUbIWeN7aqezADsnJGVYufH0/rlHPxxk3AL5
	2iTIOAR/UykvJCqLyyhFPJjm98s62bPTriJ/aDjP4Gfg1NUICSpnq6U3l45ixcQi2OTd1Jis/ZR3J
	EP4/FZdXOrEFQQHRtS6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWEny-007Eox-QX; Mon, 21 Mar 2022 09:58:26 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWEnS-007Eaa-7K; Mon, 21 Mar 2022 09:57:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 544A6143D;
 Mon, 21 Mar 2022 02:57:53 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.57.22.222])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7479C3F766;
 Mon, 21 Mar 2022 02:57:50 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org
Cc: lukasz.luba@arm.com, dietmar.eggemann@arm.com, Pierre.Gondois@arm.com,
 ionela.voinescu@arm.com, viresh.kumar@linaro.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, mka@chromium.org,
 nm@ti.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
Subject: [RESEND][PATCH 2/8] PM: EM: Add artificial EM flag
Date: Mon, 21 Mar 2022 09:57:23 +0000
Message-Id: <20220321095729.20655-3-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220321095729.20655-1-lukasz.luba@arm.com>
References: <20220321095729.20655-1-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_025754_342032_9C81759A 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Pierre Gondois <Pierre.Gondois@arm.com>

The Energy Model (EM) can be used on platforms which are missing real
power information. Those platforms would implement .get_cost() which
populates needed values for the Energy Aware Scheduler (EAS). The EAS
doesn't use 'power' fields from EM, but other frameworks might use them.
Thus, to avoid miss-usage of this specific type of EM, introduce a new
flags which can be checked by other frameworks.

Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 include/linux/energy_model.h | 5 +++++
 kernel/power/energy_model.c  | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index 0a3a5663177b..92e82a322859 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -67,11 +67,16 @@ struct em_perf_domain {
  *
  *  EM_PERF_DOMAIN_SKIP_INEFFICIENCIES: Skip inefficient states when estimating
  *  energy consumption.
+ *
+ *  EM_PERF_DOMAIN_ARTIFICIAL: The power values are artificial and might be
+ *  created by platform missing real power information
  */
 #define EM_PERF_DOMAIN_MILLIWATTS BIT(0)
 #define EM_PERF_DOMAIN_SKIP_INEFFICIENCIES BIT(1)
+#define EM_PERF_DOMAIN_ARTIFICIAL BIT(2)
 
 #define em_span_cpus(em) (to_cpumask((em)->cpus))
+#define em_is_artificial(em) ((em)->flags & EM_PERF_DOMAIN_ARTIFICIAL)
 
 #ifdef CONFIG_ENERGY_MODEL
 #define EM_MAX_POWER 0xFFFF
diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index 0153b0ca7b23..6ecee99af842 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -384,6 +384,8 @@ int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
 
 	if (milliwatts)
 		dev->em_pd->flags |= EM_PERF_DOMAIN_MILLIWATTS;
+	else if (cb->get_cost)
+		dev->em_pd->flags |= EM_PERF_DOMAIN_ARTIFICIAL;
 
 	em_cpufreq_update_efficiencies(dev);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
