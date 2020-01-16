Return-Path: <SRS0=rC0f=3F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE551C33CB1
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 15:21:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF8732073A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 15:21:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h4IGFksk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF8732073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZXoAVrF2kiJ+mPcC9sVJk8IyS3qHB8+lIW6hSq+xjCw=; b=h4I
	GFkskjczwR+e+Kz81iCTJXOIsVmO0seJ9pftw9LlSnHHh94f3gk6dvoWYnSNTT4QhUhJyhhSNX1Ec
	PfKCmkU7O5aqDAkmkcV6lDmeDnmILRhQnEk02lOyYQw1xEpGCb+rGd1i7pdSYpF/JqTbVJY2X1ZUW
	TWNdkY1l25dE09vBXAsAE43HmsBXeSiCk+71R/9FBtcbIBjRsrPOrrSBnpHVF9JpccLvHkCbdHXdn
	XS2e/TlGNZWwYIkWC03o39eZPV1JPDBLRV8Rm9sywZ5cJSFfTQkvffUVcRZMR247oh5/gv7CRZzJd
	3mFkDseFOAOrNaJBWWz/Y+i36t1ThCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is6xR-0000Ng-Rl; Thu, 16 Jan 2020 15:21:17 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is6xE-0000ES-10; Thu, 16 Jan 2020 15:21:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2136F1396;
 Thu, 16 Jan 2020 07:21:00 -0800 (PST)
Received: from e123648.arm.com (unknown [10.37.12.156])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E3AB3F68E;
 Thu, 16 Jan 2020 07:20:48 -0800 (PST)
From: lukasz.luba@arm.com
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH 0/4] Add support for devices in the Energy Model
Date: Thu, 16 Jan 2020 15:20:28 +0000
Message-Id: <20200116152032.11301-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_072104_109058_8F201B46 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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
 viresh.kumar@linaro.org, bjorn.andersson@linaro.org, bsegall@google.com,
 festevam@gmail.com, Morten.Rasmussen@arm.com, robh@kernel.org,
 amit.kucheria@verdurent.com, vincent.guittot@linaro.org, khilman@kernel.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, mgorman@suse.de, rui.zhang@intel.com,
 alyssa.rosenzweig@collabora.com, daniel@ffwll.ch, b.zolnierkie@samsung.com,
 s.hauer@pengutronix.de, rostedt@goodmis.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, Dietmar.Eggemann@arm.com, airlied@linux.ie,
 javi.merino@arm.com, tomeu.vizoso@collabora.com, qperret@google.com,
 sboyd@kernel.org, shawnguo@kernel.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 ionela.voinescu@arm.com, lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lukasz Luba <lukasz.luba@arm.com>

Hi all,

This patch set introduces support for devices in the Energy Model (EM) framework.
It will unify the power model for thermal subsystem and make it simpler.
The 1st patch refactors EM framework and adds support for devices. The 2nd patch
changes dev_pm_opp_of_register_em() in OPP/OF which now should take as an
argument struct device pointer. It touches a few trees (OMAP, NXP, mediatek) updating
their CPUfreq drivers to the new interface.
Patch 3 changes thermal devfreq cooling removing old code for calculating local power
table. It simplifies the code and uses EM for requested power calculation.
Last patch 4 is based on 'drm-misc-next' and adds EM to Panfrost driver.

The patch set is based on v5.5-rc6 tag (excluding last patch).

Regards,
Lukasz Luba

Lukasz Luba (4):
  PM / EM: and devices to Energy Model
  OPP: change parameter to device pointer in dev_pm_opp_of_register_em()
  thermal: devfreq_cooling: Refactor code and switch to use Energy Model
  drm/panfrost: Register to the Energy Model with devfreq device

 Documentation/power/energy-model.rst        |  67 ++--
 drivers/cpufreq/cpufreq-dt.c                |   2 +-
 drivers/cpufreq/imx6q-cpufreq.c             |   2 +-
 drivers/cpufreq/mediatek-cpufreq.c          |   2 +-
 drivers/cpufreq/omap-cpufreq.c              |   2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c           |   2 +-
 drivers/cpufreq/scmi-cpufreq.c              |  11 +-
 drivers/cpufreq/scpi-cpufreq.c              |   2 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c |   3 +
 drivers/opp/of.c                            |  43 +--
 drivers/thermal/cpu_cooling.c               |  10 +-
 drivers/thermal/devfreq_cooling.c           | 397 +++++++------------
 include/linux/devfreq_cooling.h             |  17 -
 include/linux/energy_model.h                | 108 ++++--
 include/linux/pm_opp.h                      |  13 +-
 include/trace/events/thermal.h              |  19 +-
 kernel/power/energy_model.c                 | 406 ++++++++++++++++----
 kernel/sched/sched.h                        |   2 +-
 kernel/sched/topology.c                     |   4 +-
 19 files changed, 631 insertions(+), 481 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
