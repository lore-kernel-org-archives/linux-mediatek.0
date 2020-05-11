Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6641C47255
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 11:22:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3A6720722
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 11:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JXU9NURp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3A6720722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0rdpJaHLEZzEnynephqyrVLF7ZWAgv007LwiCu41Pns=; b=JXU9NURpJzwiA6S+1LuNGmoAik
	lc07lv7mo8m2iqLa6dsbuUnNiLp98HG78BYsR/6YuvEDwwK0Dmd8vzItTpesX8uJon7mXHE3SPVBv
	ZeRePYHAcnHPK1oya0VW+frJDolzVW4ugbJNDliDl2/YX86p0wyzbcRozLiAGXuXV9n/wCNXFnlGE
	IkUGKRcIfV8DEK3dJ0qJYITE1AEGqffG9/Q/tJYyheDfWWGV8WmHYeeOWWfI8Zd0lfLm71m2/AWft
	vw7USruWuNCrnqZyaYblJyYGdJ5x8yQm/5EzoIhPF3diAo1edO3epsA0UuQPORa17dY66fVPcNaKL
	YBcu4wPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY6WD-00015n-Md; Mon, 11 May 2020 11:22:45 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY6UD-0007XN-K4; Mon, 11 May 2020 11:20:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08D6E101E;
 Mon, 11 May 2020 04:20:40 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.37.12.83])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0CF6B3F305;
 Mon, 11 May 2020 04:20:29 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v7 06/15] PM / EM: change name of em_pd_energy to em_cpu_energy
Date: Mon, 11 May 2020 12:19:03 +0100
Message-Id: <20200511111912.3001-7-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511111912.3001-1-lukasz.luba@arm.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_042041_756669_71FE5552 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, festevam@gmail.com, mka@chromium.org, robh@kernel.org,
 amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, daniel.lezcano@linaro.org,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de,
 rui.zhang@intel.com, alyssa.rosenzweig@collabora.com, orjan.eide@arm.com,
 daniel@ffwll.ch, b.zolnierkie@samsung.com, s.hauer@pengutronix.de,
 rostedt@goodmis.org, matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com,
 airlied@linux.ie, tomeu.vizoso@collabora.com, qperret@google.com,
 sboyd@kernel.org, rdunlap@infradead.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org, lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Energy Model framework supports now other devices than CPUs. Refactor some
of the functions in order to prevent wrong usage. The old function
em_pd_energy has to generic name. It must not be used without proper
cpumask pointer, which is possible only for CPU devices. Thus, rename it
and add proper description to warn of potential wrong usage for other
devices.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 include/linux/energy_model.h | 11 ++++++++---
 kernel/sched/fair.c          |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index 6b56ae6c6a89..c92e3ee15245 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -82,15 +82,20 @@ int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
 void em_dev_unregister_perf_domain(struct device *dev);
 
 /**
- * em_pd_energy() - Estimates the energy consumed by the CPUs of a perf. domain
+ * em_cpu_energy() - Estimates the energy consumed by the CPUs of a
+		performance domain
  * @pd		: performance domain for which energy has to be estimated
  * @max_util	: highest utilization among CPUs of the domain
  * @sum_util	: sum of the utilization of all CPUs in the domain
  *
+ * This function must be used only for CPU devices. There is no validation,
+ * i.e. if the EM is a CPU type and has cpumask allocated. It is called from
+ * the scheduler code quite frequently and that is why there is not checks.
+ *
  * Return: the sum of the energy consumed by the CPUs of the domain assuming
  * a capacity state satisfying the max utilization of the domain.
  */
-static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
+static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
 				unsigned long max_util, unsigned long sum_util)
 {
 	unsigned long freq, scale_cpu;
@@ -195,7 +200,7 @@ static inline struct em_perf_domain *em_pd_get(struct device *dev)
 {
 	return NULL;
 }
-static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
+static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
 			unsigned long max_util, unsigned long sum_util)
 {
 	return 0;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b3bb4d6e49c3..7700e97af52f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6468,7 +6468,7 @@ compute_energy(struct task_struct *p, int dst_cpu, struct perf_domain *pd)
 		max_util = max(max_util, cpu_util);
 	}
 
-	return em_pd_energy(pd->em_pd, max_util, sum_util);
+	return em_cpu_energy(pd->em_pd, max_util, sum_util);
 }
 
 /*
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
