Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDEAC433E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:08:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0535E20656
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:08:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I1V9/94K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="haiiiWkE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0535E20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kmu893n/cuCNJPjdpijNdBtdhzFyB5/n6UQzCLz3yiw=; b=I1V9/94Kd2G6ZQ7cujDx0hZhA+
	uSCnu2Xmk94btaT2PU+MHfOOywN08gBrMQ3xt5foIGwzGWo29/63eslBYjlVoL+E06jtbAAPAIxcQ
	fCGyn9Hql587To1PxKdJ7WQGI3H5xsodf68ev1vp8i3bHTJZaSHB9Ce9Lm3PYeSrYILtIAnTwF5OR
	ykaYj0inm+3YNCzchheZIHPhIGr1R4ywIDiT910p3tmEg9QNpOrhueD6LrtTAJm56+m1xBWppu2vI
	rdVnnkVPh2xzD9wZTS/nhLHYbPT8JDMs/4WBFF39rGHIjA/P9PISpm5xp77BdLlPr46eXwBHeGGk2
	TLUijiQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyXCx-0002VO-Ne; Thu, 23 Jul 2020 09:08:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyXCr-0002SU-4g; Thu, 23 Jul 2020 09:08:02 +0000
X-UUID: 0390e78477194ee287fb455bbea3ace9-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fQAlYTu7jimnOiNSbIQbC1bv/gLKYWyftON61ys5CAk=; 
 b=haiiiWkEh46x7/2pduaTnU4sQ0cEGeYVZPeBW2Z2GQmnGhXqVERWiCXZ12DRMaITX+sD157uMtKAsC3p4HIAIhJZHDehyqQQV8a8XgN3dsegLSqdXzIDLzvspMoqJRf120freps3csgvibUM60EvwZCFjl/S4BxbQngbys8/Pdc=;
X-UUID: 0390e78477194ee287fb455bbea3ace9-20200723
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1227634361; Thu, 23 Jul 2020 01:07:54 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 02:07:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 17:07:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Jul 2020 17:07:46 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/4] Add basic node support for Mediatek MT8192 SoC 
Date: Thu, 23 Jul 2020 17:07:27 +0800
Message-ID: <20200723090731.4482-1-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_050801_340911_BEC1F63F 
X-CRM114-Status: GOOD (  15.21  )
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


MT8192 is a SoC based on 64bit ARMv8 architecture.
It contains 4 CA55 and 4 CA76 cores.
MT8192 share many HW IP with MT65xx series.
This patchset was tested on MT8192 evaluation board and use correct clock to she
ll.

Based on v5.8-rc1

Crystal Guo (2):
  watchdog: mt8192: add wdt support
  dt-binding: mediatek: mt8192: update mtk-wdt document

Seiya Wang (2):
  arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and
    Makefile
  dt-bindings: serial: Add compatible for Mediatek MT8192
---
This patch depends on
[PATCH 1/3] dt-bindings: pinctrl: mt8192: add pinctrl file
[PATCH 2/3] dt-bindings: pinctrl: mt8192: add binding document
[PATCH v2 3/4] dt-bindings: mediatek: add compatible for MT6873/8192 pwrap
[PATCH v2 1/2] dt-bindings: spi: update bindings for MT8192 SoC
[PATCH 2/4] clk: mediatek: Add dt-bindings for MT8192 clocks
[PATCH 1/4] dt-bindings: ARM: Mediatek: Document bindings for MT8192

Please also accept this patch together with [1][2][3][4][5][6]
to avoid build and dt binding check error.

[1] http://lists.infradead.org/pipermail/linux-mediatek/2020-July/014042.html
[2] http://lists.infradead.org/pipermail/linux-mediatek/2020-July/014043.html
[3] http://lists.infradead.org/pipermail/linux-mediatek/2020-July/014546.html
[4] http://lists.infradead.org/pipermail/linux-mediatek/2020-July/014406.html
[5] http://lists.infradead.org/pipermail/linux-mediatek/2020-July/014450.html
[6] http://lists.infradead.org/pipermail/linux-mediatek/2020-July/014451.html
---
 .../devicetree/bindings/serial/mtk-uart.txt        |   1 +
 .../devicetree/bindings/watchdog/mtk-wdt.txt       |   2 +
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts        |  29 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 663 +++++++++++++++++++++
 drivers/watchdog/mtk_wdt.c                         |   5 +
 6 files changed, 701 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192.dtsi

--
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
