Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B4EC433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 11:41:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B852664F8D
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 11:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B852664F8D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FZ9MYtiFtxxBBLLRp4shaBl+OIdK4lt3V23d+vWzvVw=; b=HBTJrY1yKxu4j24eX0gbJZ1i+p
	BuARBSG3V85Z/E0dk6mUvQlDAuDFaQzqMk0xzafDSQloGZX7P9GCG3UE4ahHGwYp9q7Dj+2qGGXDP
	sYCzdF2Caw3VKaAWXHjhl6qk3BQOxP2vk0eE2Uk4cEo+eY76T1JVe1Cf7G4h+xz2MwNNP3GFrJVU+
	H/v7GvB7ckf4UXMGuJrkbVgjaAT36gBJQ5DAnhh5xzryrh82IZinMwtbVflf0mI2TShFLf8rt0RxL
	lfxqpYUdQo/YhJzzYwudouiUZgQs2QrJs2JptQkh1dVzQFVygztFHsKZfm8YpfbyO7022lpcDLOYI
	oR+O/TNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKgAZ-00BJUQ-J2; Fri, 12 Mar 2021 11:41:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKgA6-00BJOP-9R; Fri, 12 Mar 2021 11:41:02 +0000
X-UUID: 21f0e966a9134404a14f745af7e8df0a-20210312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=j/8/IlD7hJF0skmtBMmiLsgcuBT24Ncg6o260a31fAo=; 
 b=EgDchGXbloJZcPH3ETc1Z+QmrvpvyHgFAJqoCSdogzTodX3oO4qbIvjDY5MSVU6MVx6iigY3eXMCZOmHibH81lLAzK/UEx1IlGvDXQu3FVfMCbSvbFp4TyrA6GUCAgfDoF12mN4rzifWY9ZjDGE7Mo9abAHmzyi3FtdHJfEtenI=;
X-UUID: 21f0e966a9134404a14f745af7e8df0a-20210312
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 37061408; Fri, 12 Mar 2021 03:40:51 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 03:40:49 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 19:40:42 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 12 Mar 2021 19:40:42 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <wsd_upstream@mediatek.com>, <hector.yuan@mediatek.com>
Subject: [PATCH v11] cpufreq: mediatek-hw: Add support for Mediatek cpufreq HW
 driver
Date: Fri, 12 Mar 2021 19:40:33 +0800
Message-ID: <1615549235-27700-1-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_114059_160160_D263DBD8 
X-CRM114-Status: GOOD (  14.26  )
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

From v8 to v9, there are three more modifications.
1. Based on patchset[1], align binding with scmi for performance domain.
2. Add the CPUFREQ fast switch function support and define DVFS latency.
3. Based on patchser[2], add energy model API parameter for mW.

From v7 to v8, there are three more patches based on patchset v8[3].
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

[1]  https://lore.kernel.org/lkml/20201116181356.804590-1-sudeep.holla@arm.com/
[2]  https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=c250d50fe2ce627ca9805d9c8ac11cbbf922a4a6
[3]  https://lkml.org/lkml/2020/9/23/384


Hector.Yuan (2):
  cpufreq: mediatek-hw: Add support for CPUFREQ HW
  dt-bindings: cpufreq: add bindings for MediaTek cpufreq HW

 .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  127 +++++++
 drivers/cpufreq/Kconfig.arm                        |   12 +
 drivers/cpufreq/Makefile                           |    1 +
 drivers/cpufreq/mediatek-cpufreq-hw.c              |  370 ++++++++++++++++++++
 4 files changed, 510 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
 create mode 100644 drivers/cpufreq/mediatek-cpufreq-hw.c
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
