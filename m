Return-Path: <SRS0=5sS2=5D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09D8C5ACD7
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 11:46:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C1C420776
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 11:46:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dEBGFfNF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C1C420776
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qQV55UuKbbyu3nkoJQgTggP5iRb6rqW3j9JElW7+cDY=; b=dEB
	GFfNF5Fufuv/mN3l95O96OQsj06r/HyUEOdr8LxzJx8mgts6eaphF9WFs2y+NdsNeH9CHjjb+8Qsx
	8/owYDn/vBRk/Px/nc6Yqxa/mMPpfmIGcF8W6Qgb6CT+MEXmzl+0QQbmxZSNa4QdUq/lpUdrtpz9w
	C0t+qwPWVL7z9z9UodziYf5bL93YX3GChvHLZ8199wvrLx1Tt9AambMamTpCX8HVaz5NXTMscQHDW
	H0/2QzsCwOzKG6r8xo1J+mYV57MwK320MIfYvnj9J6f9a0ItfotrBoEFt49qdjHt7RwA2S74BnTK3
	6VxgQXHbJiPoLwzbj0E9CeeY35QwbBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEX9X-0002Ib-0z; Wed, 18 Mar 2020 11:46:27 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEX9T-0002Hq-2I; Wed, 18 Mar 2020 11:46:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABDB81FB;
 Wed, 18 Mar 2020 04:46:21 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.37.12.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04D633F534;
 Wed, 18 Mar 2020 04:46:09 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v5 0/5] Add support for devices in the Energy Model
Date: Wed, 18 Mar 2020 11:45:43 +0000
Message-Id: <20200318114548.19916-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_044623_198704_75C7C7A7 
X-CRM114-Status: GOOD (  19.08  )
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
 bsegall@google.com, festevam@gmail.com, Morten.Rasmussen@arm.com,
 robh@kernel.org, amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, daniel.lezcano@linaro.org,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de,
 rui.zhang@intel.com, alyssa.rosenzweig@collabora.com, orjan.eide@arm.com,
 daniel@ffwll.ch, b.zolnierkie@samsung.com, s.hauer@pengutronix.de,
 rostedt@goodmis.org, matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com,
 airlied@linux.ie, javi.merino@arm.com, tomeu.vizoso@collabora.com,
 qperret@google.com, sboyd@kernel.org, mka@chromium.org, rdunlap@infradead.org,
 rjw@rjwysocki.net, agross@kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, patrick.bellasi@matbug.net, shawnguo@kernel.org,
 lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

This patch set introduces support for devices in the Energy Model (EM)
framework. It will unify the power model for thermal subsystem and make it
simpler. The 1st patch refactors EM framework and adds support for devices.
The 2nd patch changes dev_pm_opp_of_register_em() in OPP/OF which now should
take as an argument struct device pointer. It touches a few trees
(OMAP, NXP, Mediatek) updating their CPUfreq drivers to the new interface.
Patch 4/5 changes thermal devfreq cooling removing old code for calculating
local power table. It simplifies the code and uses EM for requested power
calculation. Last patch 5/5 adds EM to Panfrost driver.

The patch set is based on linux-next tag next-20200317. I have decided to add
a pending patch developed by Matthias [5]. It introduces PM QoS limits in
devfreq cooling, to not break the build test. When it lands into
thermal/linux-next and then in linux-next, I'll drop it from this series.

Changes:
v5:
- devfreq cooling: rebased on top of pending patch introducing PM QoS limits
- devfreq cooling: added Matthias's patch to make this series build check pass
- devfreq cooling: removed OPP disable code and switched to PM QoS
- devfreq cooling: since thermal code always used a pointer to devfreq_dev_status,
  switched to work on a local copy and avoid potential race when either busy_time or
  total_time could change in the background
- devfreq cooling: added _normalize_load() and handle all scenarios when
  busy_time and total_time could have odd values (even raw counters)
- Energy Model patch 2/4: removed prints from cpufreq drivers and added print inside
  dev_pm_opp_of_register_em()
- update patch 2/4 description to better reflect upcoming changes
- collected ACK from Quentin for patch 1/4 and Reviewed-by from Steven for 4/4
v4 [4]:
- devfreq cooling: added two new registration functions, which will take care
  of registering EM for the device and simplify drivers code
  (suggested by Robin and Rob)
- Energy Model: changed unregistering code, added kref to track usage, added
  code freeing tables, added helper function
- added return value to function dev_pm_opp_of_register_em() and updated
  CPUFreq drivers code, added debug prints in case of failure
- updated comments in devfreq cooling removing statement that only
  simple_ondemand devfreq governor is supported to work with power extentions
- fixed spelling in the documentation (reported by Randy)
v3 [3]:
- added back the cpumask 'cpus' in the em_perf_domain due potential cache misses
- removed _is_cpu_em() since there is no need for it
- changed function name from em_pd_energy() to em_cpu_energy(), which is
  optimized for usage from the scheduler making some assumptions and not
  validating arguments to speed-up, there is a comment stressing that it should
  be used only for CPUs em_perf_domain
- changed em_get_pd() to em_pd_get() which is now aligned with em_cpu_get()
  naming
- Energy Model: add code which checks if the EM is already registered for the
  devfreq device
- extended comment in em_cpu_get() describing the need for this function
- fixed build warning reported on x86 by kbuild test robot in devfreq_cooling.c
- updated documentation in the energy-model.rst
- changed print messages from 'energy_model' to 'EM'
- changed dev_warn to dev_dbg, should calm down test scripts in case the
  platform has OPPs less efficient in the OPP table (some of them are there for
  cooling reasons, we shouldn't warn in this case, debug info is enough)
v2 [2]:
- changed EM API em_register_perf_domain() adding cpumask_t pointer
  as last argument (which was discussed with Dietmar and Quentin)
- removed dependency on PM_OPP, thanks to the cpumask_t argument
- removed enum em_type and em->type dependent code
- em_get_pd() can handle CPU device as well as devfreq device
- updated EM documentation
- in devfreq cooling added code which prevents from race condition with
  devfreq governors which are trying to use OPPs while thermal is in the middle
  of disabling them.
- in devfreq cooling added code which updates state of the devfreq device to
  avoid working on stale data when governor has not updated it for a long time
- in devfreq cooling added backward compatibility frequency table for drivers
  which did not provide EM
- added Steven's Reviewed-by to trace code in thermal
- added another CPUFreq driver which needs to be updated to the new API

The v1 can be found here [1].

Regards,
Lukasz Luba

[1] https://lkml.org/lkml/2020/1/16/619
[2] https://lkml.org/lkml/2020/2/6/377
[3] https://lkml.org/lkml/2020/2/21/1910
[4] https://lkml.org/lkml/2020/3/9/471
[5] https://patchwork.kernel.org/patch/11435217/

Lukasz Luba (4):
  PM / EM: add devices to Energy Model
  OPP: refactor dev_pm_opp_of_register_em() and update related drivers
  thermal: devfreq_cooling: Refactor code and switch to use Energy Model
  drm/panfrost: Register devfreq cooling and attempt to add Energy Model

Matthias Kaehlcke (1):
  thermal: devfreq_cooling: Use PM QoS to set frequency limits

 Documentation/power/energy-model.rst        | 133 ++---
 Documentation/scheduler/sched-energy.rst    |   2 +-
 drivers/cpufreq/cpufreq-dt.c                |   2 +-
 drivers/cpufreq/imx6q-cpufreq.c             |   2 +-
 drivers/cpufreq/mediatek-cpufreq.c          |   2 +-
 drivers/cpufreq/omap-cpufreq.c              |   2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c           |   2 +-
 drivers/cpufreq/scmi-cpufreq.c              |  13 +-
 drivers/cpufreq/scpi-cpufreq.c              |   2 +-
 drivers/cpufreq/vexpress-spc-cpufreq.c      |   2 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c |   2 +-
 drivers/opp/of.c                            |  76 +--
 drivers/thermal/cpufreq_cooling.c           |  12 +-
 drivers/thermal/devfreq_cooling.c           | 536 ++++++++++----------
 include/linux/devfreq_cooling.h             |  39 +-
 include/linux/energy_model.h                | 111 ++--
 include/linux/pm_opp.h                      |  15 +-
 include/trace/events/thermal.h              |  19 +-
 kernel/power/energy_model.c                 | 465 +++++++++++++----
 kernel/sched/fair.c                         |   2 +-
 kernel/sched/topology.c                     |   4 +-
 21 files changed, 901 insertions(+), 542 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
