Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A074C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 08:40:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B14360FD7
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 08:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B14360FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fu18Svpz3kzHCDP7HZfEgG86i7/UHjdH9z3mUZmr9Kc=; b=ByDS+Vii26JxEU
	RIU8EMqQyNc8XYUd+1twfc8bb9DKfdh6Qxp0QItgiArLxMvfFpT61G7UWQ/1zLfrE+F19B4mhQYQ+
	l84SyLm7MkzHl+t3BOA3OiD7YBGkiJ45Je8iWrV96VFNMBdlw0nQ7ihCrKfoQ12s62/OLCU23LIXY
	ZE+zJs2VOJlL6PJf420rFlfuN/v7KxOfeSHBzwciLS999H2m2XtucW5JtSFLOpM7FGlbkza3bxaao
	gt7sMHspHx0H3FUgY7G9TNdH2LXWb58lEe+A6L3BGw+M5a1b27QPU2S8CIX/FpfgXFvPkCoph+i+6
	eOpX5t0p40sELnYTIupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM4jy-00BISb-B9; Fri, 03 Sep 2021 08:40:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM4jZ-00BIOo-9o; Fri, 03 Sep 2021 08:39:40 +0000
X-UUID: f8ff2859a94746a9bb14abca1a6b5f66-20210903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=PPALdlDZjaJAFITkZGvUM9xrvrrEBCr7v8vnUOyfhf0=; 
 b=eSKXROh1idG+W3wC/Q73u+K9n4hjC+/VTuXtB02WzM0MSnGL2m8f1B/YO1YM6MmWPbMkN8fFDkkQyTSSkY54LGtAxcdz8oUDyVxYZNjYJOdonwOWT0gYjznRGT+t4D6AHrdr1Rucfx/e2AXl8EhpIwc37YU9xqVzkIkQ810fVGo=;
X-UUID: f8ff2859a94746a9bb14abca1a6b5f66-20210903
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 501443900; Fri, 03 Sep 2021 01:39:34 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Sep 2021 01:39:29 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Sep 2021 16:39:27 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 3 Sep 2021 16:39:27 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, "Rob
 Herring" <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>,
 <hector.yuan@mediatek.com>
Subject: [PATCH v15] cpufreq: mediatek-hw: Add support for Mediatek cpufreq HW
 driver
Date: Fri, 3 Sep 2021 16:39:21 +0800
Message-ID: <1630658364-6192-1-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_013938_798774_33DBD6B2 
X-CRM114-Status: GOOD (  15.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The CPUfreq HW present in some Mediatek chipsets offloads the steps necessary for changing the frequency of CPUs. 
The driver implements the cpufreq driver interface for this hardware engine. 

From v14 to v15, there are three modifications.
1. Move platform data from per-policy to probe
2. Update energy model register to callback function

From v13 to v14, there are three modifications.
1. Replace cpu domain map to policy driver data 
2. Remove dummy performance-domain parsing
3. Separate modification in cpufreq.h to another patch

From v12 to v13, there are two modifications.
1. Move related_cpus function to common place, so all performance-domain cpufreq driver can refer.
2. Make cpu resource init to each policy rather than per-cpu

From v11 to v12, there are two modifications.
1. Based on patchset[1], align binding with scmi for performance domain(latest version).
2. Shrink binding example wording. 

From v8 to v9, there are three more modifications.
1. Based on patchset[2], align binding with scmi for performance domain.
2. Add the CPUFREQ fast switch function support and define DVFS latency.
3. Based on patchser[3], add energy model API parameter for mW.

From v7 to v8, there are three more patches based on patchset v8[4].
This patchset is about to register power table to Energy model for EAS and thermal usage.
1. EM CPU power table
- Register energy model table for EAS and thermal cooling device usage.
- Read the coresponding LUT for power table.
2. SVS initialization
- The SVS(Smart Voltage Scaling) engine is a hardware which is
  used to calculate optimized voltage values for CPU power domain.
  DVFS driver could apply those optimized voltage values to reduce power consumption.
- Driver will polling if HW engine is done for SVS initialization.
  After that, driver will read power table and register it to EAS.
- CPUs must be in power on state when doing SVS. Use pm_qos to block cpu-idle state for SVS initializing.
3. Cooling device flag
- Add cooling device flag for thermal
[1]  https://lore.kernel.org/linux-devicetree/20210517155458.1016707-1-sudeep.holla@arm.com/
[2]  https://lore.kernel.org/lkml/20201116181356.804590-1-sudeep.holla@arm.com/
[3]  https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=c250d50fe2ce627ca9805d9c8ac11cbbf922a4a6
[4]  https://lkml.org/lkml/2020/9/23/384


Hector.Yuan (3):
  dt-bindings: cpufreq: add bindings for MediaTek cpufreq HW
  cpufreq: Add of_perf_domain_get_sharing_cpumask
  cpufreq: mediatek-hw: Add support for CPUFREQ HW

 .../bindings/cpufreq/cpufreq-mediatek-hw.yaml |  70 ++++
 drivers/cpufreq/Kconfig.arm                   |  12 +
 drivers/cpufreq/Makefile                      |   1 +
 drivers/cpufreq/mediatek-cpufreq-hw.c         | 340 ++++++++++++++++++
 include/linux/cpufreq.h                       |  46 ++-
 5 files changed, 468 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
 create mode 100644 drivers/cpufreq/mediatek-cpufreq-hw.c
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
