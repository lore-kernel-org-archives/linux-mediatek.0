Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47970C0018C
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 07:49:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C16D022DD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 07:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C16D022DD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bva2K2UIL32xqnKoc6fPA7yReb7PAFZ08s9vJnGoG60=; b=zlO8rSm4BFTESuOBLUAedLqB1o
	sMtN8+xQDl0VpeSIpLCV4tfjPDIj6zPBluBkynmpCX0/iw6Io/HRK+ZuxSpzCIZ2K404uJj8VVXhG
	Bea7ZXNyGLa1U4fIuiYZ6Ivh9jDIULC0Fh44MGxvo+P5AbaFPlk+7Ooucz97iueG/NPErGtj0JeUW
	aDIiIq5hS9nTqCbrgT6PYRaK8AmN/jdoAs/KQCoD9Cl3EVQgBSx8yI16VCFM6iEpwbwrtzidKBa7L
	5zHG0+vMTAjdd1NdCk+9KUg2XctIKL/gz/c6WcT3nxH79cWpxAj6TvLU6Kz/VeauU8qL7MxGzqJed
	g2eWifUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knGh6-0001Yx-26; Thu, 10 Dec 2020 07:48:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knGgy-0001Wi-Mp; Thu, 10 Dec 2020 07:48:50 +0000
X-UUID: a11c3e9704444204a084a5ac53d7f089-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=p5w9kJ9ZHmDWJlYjHPz75YekEL+QkPh6KDNWcIv8C+w=; 
 b=TMoCukoE75qIXc7gor02LvHsTJqs2qizYXexKam1CubDznYAfRseQJWXk/rTIinbJOMc47r1SaJc1AsY5OWi7ynf4ZQO6Yw3S3W00vLVxBBz6QYMV9OjmL8mqHhulx/oRQn+hHihbBXeJDFPB6l0VBC+lF/rUGEzCJKjxiqw4Wk=;
X-UUID: a11c3e9704444204a084a5ac53d7f089-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1194835722; Wed, 09 Dec 2020 23:48:42 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 23:48:40 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 15:48:38 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 10 Dec 2020 15:48:38 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9] cpufreq: mediatek-hw: Add support for Mediatek cpufreq HW
 driver
Date: Thu, 10 Dec 2020 15:48:34 +0800
Message-ID: <1607586516-6547-1-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_024848_899721_BAA85BCA 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: hector.yuan@mediatek.com, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The CPUfreq HW present in some Mediatek chipsets offloads the steps necessary for changing the frequency of CPUs. 
The driver implements the cpufreq driver interface for this hardware engine. 
This patch depends on MT6779 DTS patchset[1] submitted by Hanks Chen.

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

[1]  https://lkml.org/lkml/2020/8/4/1094
[2]  https://lore.kernel.org/lkml/20201116181356.804590-1-sudeep.holla@arm.com/
[3]  https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=c250d50fe2ce627ca9805d9c8ac11cbbf922a4a6
[4]  https://lkml.org/lkml/2020/9/23/384


Hector.Yuan (2):
  cpufreq: mediatek-hw: Add support for CPUFREQ HW
  dt-bindings: cpufreq: add bindings for MediaTek cpufreq HW

 .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  112 ++++++
 drivers/cpufreq/Kconfig.arm                        |   12 +
 drivers/cpufreq/Makefile                           |    1 +
 drivers/cpufreq/mediatek-cpufreq-hw.c              |  370 ++++++++++++++++++++
 4 files changed, 495 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
 create mode 100644 drivers/cpufreq/mediatek-cpufreq-hw.c
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
