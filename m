Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC4BC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 07:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bge2NsWaP1PCK5N2lEEcdP8KQPbkNN4BrtJVYelQYhM=; b=UlnGSMTS+h12S5ZP+rDewhyHzo
	u2gSqsjJi5J9+2jZ+BuRdrA9yOSf4uHg8z+pTi5vPhA0sheDvGtKNCLWSLSKMWE+3Wp/SfjQ4BupF
	xMMPt0e1RO31pTs1HYsjnThbINp9j4hZgNC4MD5szgNGEivbhhvQIOS0CtzZLuhkPAHu6Yy+jN1x/
	LERhJDtB/3BL49NC30wtpPCOcWMMNuCZwsUhi3PcGU+a+AufGBmnWaMF8FWTZCB4pd48l2EZeexL+
	zyLmVyfPjhsp6U3TEooivwOC4iKt9Dcut6JLnrx9xQaKNbqS1+lqr+CoMBufA/EoWlBHuN2qA5UVT
	UV+kd7og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9LlX-00EUAU-6O; Thu, 07 Jul 2022 07:17:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9LkF-00ETdx-5m; Thu, 07 Jul 2022 07:16:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21360113E;
	Thu,  7 Jul 2022 00:16:13 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.57.11.194])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DFAC73F70D;
	Thu,  7 Jul 2022 00:16:09 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: daniel.lezcano@linaro.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	viresh.kumar@linaro.org,
	rafael@kernel.org,
	dietmar.eggemann@arm.com,
	nm@ti.com,
	sboyd@kernel.org,
	sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] Documentation: EM: Switch to micro-Watts scale
Date: Thu,  7 Jul 2022 08:15:53 +0100
Message-Id: <20220707071555.10085-3-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220707071555.10085-1-lukasz.luba@arm.com>
References: <20220707071555.10085-1-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_001615_371388_DC6FF347 
X-CRM114-Status: GOOD (  15.58  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The EM now uses the micro-Watts scale for the power values. Update
related documentation to reflect that fact.

Fix also a problematic sentence in the doc "to:" which triggers test
scripts complaining about wrong email address.

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 Documentation/power/energy-model.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/power/energy-model.rst b/Documentation/power/energy-model.rst
index feb257b7f350..ef341be2882b 100644
--- a/Documentation/power/energy-model.rst
+++ b/Documentation/power/energy-model.rst
@@ -20,20 +20,20 @@ possible source of information on its own, the EM framework intervenes as an
 abstraction layer which standardizes the format of power cost tables in the
 kernel, hence enabling to avoid redundant work.
 
-The power values might be expressed in milli-Watts or in an 'abstract scale'.
+The power values might be expressed in micro-Watts or in an 'abstract scale'.
 Multiple subsystems might use the EM and it is up to the system integrator to
 check that the requirements for the power value scale types are met. An example
 can be found in the Energy-Aware Scheduler documentation
 Documentation/scheduler/sched-energy.rst. For some subsystems like thermal or
 powercap power values expressed in an 'abstract scale' might cause issues.
 These subsystems are more interested in estimation of power used in the past,
-thus the real milli-Watts might be needed. An example of these requirements can
+thus the real micro-Watts might be needed. An example of these requirements can
 be found in the Intelligent Power Allocation in
 Documentation/driver-api/thermal/power_allocator.rst.
 Kernel subsystems might implement automatic detection to check whether EM
 registered devices have inconsistent scale (based on EM internal flag).
 Important thing to keep in mind is that when the power values are expressed in
-an 'abstract scale' deriving real energy in milli-Joules would not be possible.
+an 'abstract scale' deriving real energy in micro-Joules would not be possible.
 
 The figure below depicts an example of drivers (Arm-specific here, but the
 approach is applicable to any architecture) providing power costs to the EM
@@ -98,7 +98,7 @@ Drivers are expected to register performance domains into the EM framework by
 calling the following API::
 
   int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
-		struct em_data_callback *cb, cpumask_t *cpus, bool milliwatts);
+		struct em_data_callback *cb, cpumask_t *cpus, bool microwatts);
 
 Drivers must provide a callback function returning <frequency, power> tuples
 for each performance state. The callback function provided by the driver is free
@@ -106,10 +106,10 @@ to fetch data from any relevant location (DT, firmware, ...), and by any mean
 deemed necessary. Only for CPU devices, drivers must specify the CPUs of the
 performance domains using cpumask. For other devices than CPUs the last
 argument must be set to NULL.
-The last argument 'milliwatts' is important to set with correct value. Kernel
+The last argument 'microwatts' is important to set with correct value. Kernel
 subsystems which use EM might rely on this flag to check if all EM devices use
 the same scale. If there are different scales, these subsystems might decide
-to: return warning/error, stop working or panic.
+to return warning/error, stop working or panic.
 See Section 3. for an example of driver implementing this
 callback, or Section 2.4 for further documentation on this API
 
@@ -137,7 +137,7 @@ The .get_cost() allows to provide the 'cost' values which reflect the
 efficiency of the CPUs. This would allow to provide EAS information which
 has different relation than what would be forced by the EM internal
 formulas calculating 'cost' values. To register an EM for such platform, the
-driver must set the flag 'milliwatts' to 0, provide .get_power() callback
+driver must set the flag 'microwatts' to 0, provide .get_power() callback
 and provide .get_cost() callback. The EM framework would handle such platform
 properly during registration. A flag EM_PERF_DOMAIN_ARTIFICIAL is set for such
 platform. Special care should be taken by other frameworks which are using EM
-- 
2.17.1


