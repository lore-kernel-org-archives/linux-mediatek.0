Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A138C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 13:12:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC81B20707
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 13:12:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HJcl9KbC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LY6kPxmD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC81B20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1GB2F7uiWiTSzny58drGKYmvAXRT3o/e2RC1jRhCza0=; b=HJcl9KbCsJ66wDA8cUgaWDgfNv
	soMZC/tUf79dMDM9MIkaF+/y5huDIwxooZ6ijSQdC5705U66FgXBcYSoZZZrTuRx/8KkG4fcZVnuP
	GWMqYAf4oZ4sAtdoE7QsDXFpuA6QJRNWJPBj/72w4UCO//U58J4CRNsZ897nAvKw6gXdgvPl8gfoE
	BfhRRxYG8MZr5G/VArK34IlW7YhHrZ07uXTf+mYQv4ywcIvqOvxwwxvLNokDTMM9fHjF+cGVmJZXN
	np16jRZNwy7koVMWl8ZdDX9R+5YZpLFW7Y7CR2yijQlR+CbRoC/umQdNM+RJidR2FKdedWijJdpI0
	e7N5fTlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAvDl-0003mX-IH; Wed, 26 Aug 2020 13:12:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAvDi-0003lH-WB; Wed, 26 Aug 2020 13:12:08 +0000
X-UUID: e6dd90521a784413a6d445227cdfad22-20200826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=TlrhuKUtXiamr2icTWX8cnBDNHjfUgMUC7MJFBSZR/U=; 
 b=LY6kPxmDI5LECnmrqiRv7RFP1xT0UHbSrbXgT14oAVhi5Am7hGwnKhq7ztPwzY1/1Ts5QTIJoPovIS2AkbCBAbkN506R+hS+OtIhvggreJ3IPZQ8yEatCmSeuEzDXliVLqc4pkeesEQbkWAMZ2badhlum8pUDlDVbxlCVGEpylI=;
X-UUID: e6dd90521a784413a6d445227cdfad22-20200826
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1990353904; Wed, 26 Aug 2020 05:12:03 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 06:02:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 21:01:55 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Aug 2020 21:01:55 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Anson Huang <Anson.Huang@nxp.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Olof Johansson <olof@lixom.net>
Subject: [PATCH v3] cpufreq: mediatek-hw: Add support for Mediatek cpufreq HW
 driver
Date: Wed, 26 Aug 2020 21:01:51 +0800
Message-ID: <1598446913-24325-1-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 02D1B9AEDA205CDA5DD0E93B3C8A86442BE58BD603423B503BCF813E15882B482000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_091207_274280_FE620204 
X-CRM114-Status: GOOD (  13.52  )
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

This patch depends on the MT6799 DTS patch submitted by Hanks Chen
 https://lkml.org/lkml/2020/8/4/1094


Hector.Yuan (2):
  cpufreq: mediatek-hw: Add support for Mediatek cpufreq HW driver
  dt-bindings: cpufreq: add bindings for MediaTek cpufreq HW

 .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  141 +++++++++
 drivers/cpufreq/Kconfig.arm                        |   12 +
 drivers/cpufreq/Makefile                           |    1 +
 drivers/cpufreq/mediatek-cpufreq-hw.c              |  305 ++++++++++++++++++++
 4 files changed, 459 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
 create mode 100644 drivers/cpufreq/mediatek-cpufreq-hw.c
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
