Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53507C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 23:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wlslEh4pXygO66UqzMe50GHWjCHG3QTBDGLC866I5g=; b=o7iBxL0Jy/FR6k
	H9c7PvZXuiMK++McElcLtKul2BF9lgg0qYyPq6/oPMYp4ZtDV6+5SYn+qn/xt7uP3XuCYprJBGP0p
	50kfLexTMfT3No5RLJ4Z4kE4mNjCcSstLSdt8+RPOy093Yyy0hwn/sPpK089INRJaP73sER7z9avT
	RKGZurULZ6QVj9wUWug+TzdIKUP3pEq5QAdiaCFZ2ZmhBPf/8wxTXCkVi47CudTq/l1sZF0/xX6Cw
	U29Ngv4hMe/b8ixPBxes2tkH2F/WYOicHQaqYIq85FJyj7ShwZ+YaOY1aM7GMPF5nF3LOCvalhfYT
	px2wXbD2HZd27XU7yR6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUdT9-00EWyk-0k; Wed, 16 Mar 2022 23:54:19 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUdRf-00EW4G-E7; Wed, 16 Mar 2022 23:52:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A108F1476;
 Wed, 16 Mar 2022 16:52:45 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.57.19.225])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BF9C83F766;
 Wed, 16 Mar 2022 16:52:42 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org
Cc: lukasz.luba@arm.com, dietmar.eggemann@arm.com, Pierre.Gondois@arm.com,
 ionela.voinescu@arm.com, viresh.kumar@linaro.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, mka@chromium.org,
 nm@ti.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
Subject: [[PATCH 7/8] thermal: cooling: Check Energy Model type in
 cpufreq_cooling and devfreq_cooling
Date: Wed, 16 Mar 2022 23:52:10 +0000
Message-Id: <20220316235211.29370-8-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220316235211.29370-1-lukasz.luba@arm.com>
References: <20220316235211.29370-1-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_165247_550554_2D0D3F0F 
X-CRM114-Status: GOOD (  15.05  )
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

The Energy Model can now be artificial, which means the power values
are mathematically generated to leverage EAS while not expected to be on
an uniform scale with other devices providing power information. If this
EM type is in use, the thermal governor IPA should not be allowed to
operate, since the relation between cooling devices is not properly
defined. Thus, it might be possible that big GPU has lower power values
than a Little CPU. To mitigate a misbehaviour of the thermal control
algorithm, simply do not register the cooling device as IPA's power
actor.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 drivers/thermal/cpufreq_cooling.c | 2 +-
 drivers/thermal/devfreq_cooling.c | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index 0bfb8eebd126..b8151d95a806 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -328,7 +328,7 @@ static inline bool em_is_sane(struct cpufreq_cooling_device *cpufreq_cdev,
 	struct cpufreq_policy *policy;
 	unsigned int nr_levels;
 
-	if (!em)
+	if (!em || em_is_artificial(em))
 		return false;
 
 	policy = cpufreq_cdev->policy;
diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index 4310cb342a9f..b04dcbbf721a 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -358,6 +358,7 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 	struct thermal_cooling_device *cdev;
 	struct device *dev = df->dev.parent;
 	struct devfreq_cooling_device *dfc;
+	struct em_perf_domain *em;
 	char *name;
 	int err, num_opps;
 
@@ -367,8 +368,9 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 
 	dfc->devfreq = df;
 
-	dfc->em_pd = em_pd_get(dev);
-	if (dfc->em_pd) {
+	em = em_pd_get(dev);
+	if (em && !em_is_artificial(em)) {
+		dfc->em_pd = em;
 		devfreq_cooling_ops.get_requested_power =
 			devfreq_cooling_get_requested_power;
 		devfreq_cooling_ops.state2power = devfreq_cooling_state2power;
@@ -379,7 +381,7 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 		num_opps = em_pd_nr_perf_states(dfc->em_pd);
 	} else {
 		/* Backward compatibility for drivers which do not use IPA */
-		dev_dbg(dev, "missing EM for cooling device\n");
+		dev_dbg(dev, "missing proper EM for cooling device\n");
 
 		num_opps = dev_pm_opp_get_opp_count(dev);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
