Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3835CC5517A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 08:19:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7FC320878
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 08:19:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ckcQqIPq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QutFhI46"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7FC320878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=irNaHt1C2TE9z34uPmj3A+N6759r6aDqlzF24RJfcLU=; b=ckcQqIPqVxk8iyIXhLkAY1TyOk
	JBA43yBhALj0N1dWD5mbutd1Dbzclb5UUhkxQxgkcoNkBpBHCckUBcaqOVtd8oNhOdTxRPsTubAuw
	3yQQ74Y5YjoylWZqlfQnm+K6ESTaPS9pACcO38d4xKqH8gUSg9XT/50ngfgmTdFHztBanSSZu+Elb
	VtM6gswByQCt551xmoQ+mmPqNx6mPvpw5jFoElMEfE1fhxhvO09IfKp/Y7r2tbWdn0O/atR5mPGsE
	YMshz6Q/IIkOs9b8WhpERUZnf0kiOcBjy9OkrqxSR6nAwW4T4grL8AKgaqCti5/pm1vVDTgICaL9Y
	5dfjquDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWxiv-0006jc-OA; Mon, 26 Oct 2020 08:19:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWxir-0006go-6E; Mon, 26 Oct 2020 08:19:23 +0000
X-UUID: 17ed2ade880f478d88b2e191f1cdd6a3-20201026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=VsODDh3KIxQlll6BhtrmRw5xCTw49FcPfdwVLthSeUg=; 
 b=QutFhI46hKHUwJ3nWbZgj0AcPcA3xqRX6fIBF81+VUs1eikJVvu0KuqAwPYttFHctZdAuCtrx9vzjQCAKi4zC+SpWqvtV1YjJWzcjT0eGu5Yw//Wvodl132x5Unm7PP70hWw/SX8xeh09E8aFBSDNcO1LznyDrNk3oGWpyBo6Kc=;
X-UUID: 17ed2ade880f478d88b2e191f1cdd6a3-20201026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 352759058; Mon, 26 Oct 2020 00:19:17 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Oct 2020 01:19:15 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Oct 2020 16:19:13 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 26 Oct 2020 16:19:13 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 "Maxime Ripard" <mripard@kernel.org>, Santosh Shilimkar
 <ssantosh@kernel.org>, "Amit Kucheria" <amit.kucheria@linaro.org>, Stephen
 Boyd <sboyd@kernel.org>, "Ulf Hansson" <ulf.hansson@linaro.org>, Dave Gerlach
 <d-gerlach@ti.com>, "Florian Fainelli" <f.fainelli@gmail.com>, Robin Murphy
 <robin.murphy@arm.com>, "Lorenzo Pieralisi" <lorenzo.pieralisi@arm.com>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v8] cpufreq: mediatek-hw: Add support for Mediatek cpufreq HW
 driver
Date: Mon, 26 Oct 2020 16:19:06 +0800
Message-ID: <1603700349-5922-1-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_041921_462439_6CDDA513 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: hector.yuan@mediatek.com, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The CPUfreq HW present in some Mediatek chipsets offloads the steps necessary for changing the frequency of CPUs. 
The driver implements the cpufreq driver interface for this hardware engine. 
This patch depends on MT6779 DTS patch[1] submitted by Hanks Chen.

From v7 to v8, there are three more patches based on patchset[2].
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

[1] https://lkml.org/lkml/2020/8/4/1094
[2] https://lkml.org/lkml/2020/9/23/384


Hector.Yuan (3):
  cpufreq: mediatek-hw: Add support for CPUFREQ HW
  dt-bindings: arm: cpus: Document 'mediatek,freq-domain' property
  dt-bindings: cpufreq: add bindings for MediaTek cpufreq HW

 Documentation/devicetree/bindings/arm/cpus.yaml    |    6 +
 .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  113 +++++++
 drivers/cpufreq/Kconfig.arm                        |   12 +
 drivers/cpufreq/Makefile                           |    1 +
 drivers/cpufreq/mediatek-cpufreq-hw.c              |  343 ++++++++++++++++++++
 5 files changed, 475 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
 create mode 100644 drivers/cpufreq/mediatek-cpufreq-hw.c
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
