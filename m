Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63A6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 14:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+vTVF5SdHXlvqRyY3nxv867K1R/sDzEEvR5kQulD3oI=; b=FekTmYjw8hXCXY3OjRQYtzE8qy
	evQRaEwmaJ1OB+QY6rRdCGZLmk5yenEzsXQfDb+1ZZ1kWSbmX7GWGKau0/6U7u6qDLyMO4nU5UAkj
	yAGK8xbC+QZQ9A3x4PpPLufRTQnSr7IfvR7h821VUMAQanM5RECCSyT/P6nCfjcquqV53Gl2le0iG
	A56WtMb9ESEkitbiczxgX+Rxw3CmZbnIVDhmaiGk/+M6uZ0m3pwy6d0NNZsfkS6e8uNVUmFsP+5r/
	0PwLXX6zLooZOAP+rwls+zFZEOVHPa0i17BoHCWmIq8pKjLQs1G57Er9CIEx2kZuc9cbDXvLEtMni
	CxoEnz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o41oM-00B37y-L0; Wed, 22 Jun 2022 14:58:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o41o9-00B2xz-0z; Wed, 22 Jun 2022 14:58:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F33213D5;
	Wed, 22 Jun 2022 07:58:11 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.57.38.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6B7AC3F792;
	Wed, 22 Jun 2022 07:58:08 -0700 (PDT)
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
Subject: [PATCH 0/4] Energy Model power in micro-Watts and SCMI v3.1 alignment
Date: Wed, 22 Jun 2022 15:57:58 +0100
Message-Id: <20220622145802.13032-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_075817_147573_206E08DC 
X-CRM114-Status: UNSURE (   6.81  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

This is a patch set which changes Energy Model power values scale to
micro-Watts. It also upgrades the SCMI performance layer + scmi-cpufreq
driver to leverage the SCMI v3.1 spec and process micro-Watts power values
coming from FW. The higher precision in EM power field solves an issue
of a rounding error, which then can be misinterpreted as 'inefficient OPP'.
An example rounding issue calculation is present in patch 1/4 description.

Regards,
Lukasz Luba

Lukasz Luba (4):
  PM: EM: convert power field to micro-Watts precision and align drivers
  Documentation: EM: Switch to micro-Watts scale
  firmware: arm_scmi: Get detailed power scale from perf
  cpufreq: scmi: Support the power scale in micro-Watts in SCMI v3.1

 Documentation/power/energy-model.rst  | 14 +++---
 drivers/cpufreq/mediatek-cpufreq-hw.c |  7 +--
 drivers/cpufreq/scmi-cpufreq.c        | 15 ++++++-
 drivers/firmware/arm_scmi/perf.c      | 18 +++++---
 drivers/opp/of.c                      | 15 ++++---
 drivers/powercap/dtpm_cpu.c           |  5 +--
 drivers/thermal/cpufreq_cooling.c     | 13 +++++-
 drivers/thermal/devfreq_cooling.c     | 19 ++++++--
 include/linux/energy_model.h          | 63 ++++++++++++++++++++-------
 include/linux/scmi_protocol.h         |  8 +++-
 kernel/power/energy_model.c           | 31 ++++++++-----
 11 files changed, 146 insertions(+), 62 deletions(-)

-- 
2.17.1


