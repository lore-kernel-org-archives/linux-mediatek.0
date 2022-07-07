Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA08C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 07:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y/FphGmoIau/ZwsGIGJmq1DdG5/tT4MmMxQhds1VRMk=; b=eKJIo261iUvB018lsS+F5818Nr
	nOZJGB8i34BIsGPtJRCAMBSkMd5IlTWFX9kriRUxCTiiEB7bNFTCcqcKCPxB0JqRRQm7ed2706rGI
	d3kLASLIzRKpDP71KWsiDL+1suw0bc94YCrGkXMyucoQam4Enf00uFfgSp89TjqNsVt0o8A2vI27n
	oK47zA7zOSI1QCVXrQVv8ABuLbEgDIP89XLYnApFT7b+mxVbTxfoxi5u9PIcuXFyM1F0xdp001f9R
	+4eyjRhx3OuI3CaXI/nayiPfrJowBO9btuY4vNmXKfBYKDcD0Mn8ZvDbomigb3LascIkxOJjO5edO
	EwqGBj5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Lka-00ETm4-3s; Thu, 07 Jul 2022 07:16:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Lk9-00ETbY-HN; Thu, 07 Jul 2022 07:16:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FAB0D6E;
	Thu,  7 Jul 2022 00:16:06 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.57.11.194])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E5C73F70D;
	Thu,  7 Jul 2022 00:16:02 -0700 (PDT)
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
Subject: [PATCH v2 0/4] Energy Model power in micro-Watts and SCMI v3.1 alignment
Date: Thu,  7 Jul 2022 08:15:51 +0100
Message-Id: <20220707071555.10085-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_001609_676806_2390A635 
X-CRM114-Status: UNSURE (   7.62  )
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

Changes:
v2
- simplified 32bit checks for max number of CPUs preventing energy
  estimation overflow
- added Reviewed-by and ACKs
v1 [1]

Regards,
Lukasz Luba

[1] https://lore.kernel.org/lkml/20220622145802.13032-1-lukasz.luba@arm.com/

Lukasz Luba (4):
  PM: EM: convert power field to micro-Watts precision and align drivers
  Documentation: EM: Switch to micro-Watts scale
  firmware: arm_scmi: Get detailed power scale from perf
  cpufreq: scmi: Support the power scale in micro-Watts in SCMI v3.1

 Documentation/power/energy-model.rst  | 14 +++----
 drivers/cpufreq/mediatek-cpufreq-hw.c |  7 ++--
 drivers/cpufreq/scmi-cpufreq.c        | 15 +++++++-
 drivers/firmware/arm_scmi/perf.c      | 18 +++++----
 drivers/opp/of.c                      | 15 ++++----
 drivers/powercap/dtpm_cpu.c           |  5 +--
 drivers/thermal/cpufreq_cooling.c     | 13 ++++++-
 drivers/thermal/devfreq_cooling.c     | 19 ++++++++--
 include/linux/energy_model.h          | 54 +++++++++++++++++++--------
 include/linux/scmi_protocol.h         |  8 +++-
 kernel/power/energy_model.c           | 24 ++++++++----
 11 files changed, 132 insertions(+), 60 deletions(-)

-- 
2.17.1


