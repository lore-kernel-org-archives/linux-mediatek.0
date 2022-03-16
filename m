Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D00C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 23:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=304HoQ6OK0LLPzH6L+mVXdEGRAULadVH/mfDaBgq2XI=; b=rX/tPINutAKfnH
	BBXS2uiRybfbSehquhgmMaHTZUH3oUG3VZLYm4evBMmwI1SnCu3FUZNtvS7RGqOsh1UYYgEVQEGNf
	XrcbmaF3sIqK+9JdINqgPr4eAHptzkWzxRksl5TyxTbKt9rkevOZNJWcl7TzrHNupv//JrcJ81CkS
	Me4BDHSm/NNC7M4GVwhcvxoHEilpaAxwHrzcJ0kwngV2NegBNG2xGyBLjywxPfVnvceC3DXw12rNx
	K50UwHrqGCwzneGtkN2WDhink4KZGCKW/JYTfTqY1xlt5YSm0APMYTatLIOV0m9vyjtOXjeHpchg0
	xD2S4crcYqA9kilVyoaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUdRw-00EWDX-8e; Wed, 16 Mar 2022 23:53:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUdRO-00EVwO-6G; Wed, 16 Mar 2022 23:52:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAB86152B;
 Wed, 16 Mar 2022 16:52:29 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.57.19.225])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C9B813F766;
 Wed, 16 Mar 2022 16:52:26 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org
Cc: lukasz.luba@arm.com, dietmar.eggemann@arm.com, Pierre.Gondois@arm.com,
 ionela.voinescu@arm.com, viresh.kumar@linaro.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, mka@chromium.org,
 nm@ti.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
Subject: [[PATCH 2/8] PM: EM: Add artificial EM flag
Date: Wed, 16 Mar 2022 23:52:05 +0000
Message-Id: <20220316235211.29370-3-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220316235211.29370-1-lukasz.luba@arm.com>
References: <20220316235211.29370-1-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_165230_305857_504BB292 
X-CRM114-Status: UNSURE (   9.94  )
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
