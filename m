Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C4DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 23:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/Hsrv3oYCQu9avI9f3SrTotQrLNdecGPQq/Av4PIif0=; b=IssTfIUz8cgFLb
	FvnQElqZX27I7C0XxMJGIWnadmJ0IHKYNDdZf691OAxqnuDsGjvtEXcdQjPSVnQ9c7U9qxiNXWrZl
	WaigKmMoe4PZAGtPOrnWyCCKjMfSO4c+tlCAjZG0/pqHFH9BgNw9CxGKd3mRuSm5MBGfOw2f/zx+S
	6mv86BAY7oDa153Eig/RmvLWBPe/brBAAoxtOAj6Hun4+GQmeykpsepQZVQ8azEflgkQS8Cqx3ZOc
	mj+LhVLE7zHSX38L/11/yckdhC2PAa5LX4NPh7TP/8klLFI9gr670N1BxBn/5zwmcr/P1wY4ZBSMK
	0FVEYnE4MncPyoIi231A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUdRZ-00EW0y-4e; Wed, 16 Mar 2022 23:52:41 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUdRM-00EVvb-QX; Wed, 16 Mar 2022 23:52:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DA3F1476;
 Wed, 16 Mar 2022 16:52:23 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.57.19.225])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 61BC43F766;
 Wed, 16 Mar 2022 16:52:20 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org
Cc: lukasz.luba@arm.com, dietmar.eggemann@arm.com, Pierre.Gondois@arm.com,
 ionela.voinescu@arm.com, viresh.kumar@linaro.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, mka@chromium.org,
 nm@ti.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
Subject: [0/8] Introduce support for artificial Energy Model
Date: Wed, 16 Mar 2022 23:52:03 +0000
Message-Id: <20220316235211.29370-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_165228_954308_AC72C579 
X-CRM114-Status: GOOD (  12.64  )
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

Hi all,

This patch set adds new callback and support for artificial Energy Model (EM).
The new EMs have artificially generated performance states.
Such EMs can be created from lean information sources, such
as the relative energy efficiency between CPUs. The ACPI based
platforms provide this information
(ACPI 6.4, s5.2.12.14 'GIC CPU Interface (GICC) Structure'
'Processor Power efficiency Class' field).

Artificial EMs might require to directly provide the 'cost' of
the generated performance state. This patch set adds a new callback
.get_cost() for this. The EM framework does not force any model
or formula, it's up to the platform code.

Artificial EMs aim to leverage the Energy Aware Scheduler
(EAS). Other frameworks relying on performance states
information (i.e. IPA/DTPM) must be informed of the
EM type and might be prevented from using it. This patch
sets also does this by introducing a new flag:
EM_PERF_DOMAIN_ARTIFICIAL.

The patch set is based on current linux-next, where some
changes to OPP & EM are queuing.

The patch set also contains (patch 7/8 and patch 8/8) logic which prevents
two EM's client frameworks from using this new EM type. Some other approach,
using 'milli-watts', has been proposed and discussed, but refused [1].
This new flag is more precised and should not leave space for
wrong interpretation.

Shortly after this patch set you will see a patch set implementing the
platform code and registering this new EM.

Regards,
Lukasz Luba

[1] https://lore.kernel.org/linux-pm/20220207073036.14901-1-lukasz.luba@arm.com/

Lukasz Luba (7):
  PM: EM: Add .get_cost() callback
  PM: EM: Use the new .get_cost() callback while registering EM
  PM: EM: Change the order of arguments in the .active_power() callback
  PM: EM: Remove old debugfs files and print all 'flags'
  Documentation: EM: Add artificial EM registration description
  thermal: cooling: Check Energy Model type in cpufreq_cooling and
    devfreq_cooling
  powercap: DTPM: Check for Energy Model type

Pierre Gondois (1):
  PM: EM: Add artificial EM flag

 Documentation/power/energy-model.rst  | 24 +++++++++-
 drivers/cpufreq/mediatek-cpufreq-hw.c |  4 +-
 drivers/cpufreq/scmi-cpufreq.c        |  4 +-
 drivers/opp/of.c                      |  6 +--
 drivers/powercap/dtpm_cpu.c           |  2 +-
 drivers/thermal/cpufreq_cooling.c     |  2 +-
 drivers/thermal/devfreq_cooling.c     |  8 ++--
 include/linux/energy_model.h          | 35 +++++++++++++--
 kernel/power/energy_model.c           | 63 +++++++++++++++------------
 9 files changed, 101 insertions(+), 47 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
