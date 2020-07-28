Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB78C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 13:52:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE017206D4
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 13:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GljSBTJV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="C/JTuydP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE017206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9tt+CDJq2tsAKzaY/h+tT7axWedVFEwKoAAf8v7p1P8=; b=GljSBTJVhO3T+ZvTPOGHKqavwW
	UN9XlHfPM6ZtQf5Ap8vBt7fzXw6Yv2BBTjInzOwnFLuC9JaCVh6UOB0oW7LyoL4s6PxOPP10KC3Pe
	tnRkwon0wVLLOoFdJRsj77bSRgktwUUh3kDQx4/x17VHuNCGznDEj+jSDRNtazg7zS/eGsdTOGQYN
	peTxjyCpSqbXWiwH+lXolKMRhY3HQaI/3up3Zw/QWJEDncR+wnV6twtXsZkW6ctsdLL5rGwb99eBN
	Sf2vhCQ1Fq90VzgLU2HSy54w2wsHriscw/gNn6ew1xj5YmGGWnevufavLrPDryUiUr725WD6plwSO
	XQRGOxZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0Q1n-0003Ax-6Q; Tue, 28 Jul 2020 13:52:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Q1h-00039F-6E; Tue, 28 Jul 2020 13:52:18 +0000
X-UUID: d57f6895334c4e2bb7b61e9a9a1936c6-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=bjEJpsQTJche0VDVAIsDUpUZ2H8kXX1SWDr+bc6c22E=; 
 b=C/JTuydPqc8OTm+wqMr8yWkrHBEHrVvgtTCbNE+CdlsrSvPbycH3R4PTDd71rm7vYwVa7ZJYcl0RfROF3vWVwey2DHT6+kEgTqfVRzj4fx+IqhWTuuxdifoUjNWCKT6LlpTc7wOWJKRIaVZzJhgwvjH4PnRH2NMMvYayzbcE/Ag=;
X-UUID: d57f6895334c4e2bb7b61e9a9a1936c6-20200728
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1048594359; Tue, 28 Jul 2020 05:52:06 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 06:42:08 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 21:42:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Jul 2020 21:42:06 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 0/3] Add basic node support for Mediatek MT8192 SoC 
Date: Tue, 28 Jul 2020 21:41:46 +0800
Message-ID: <20200728134149.19758-1-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_095217_436544_869DE3E2 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Change in v2:
1. Remove mt8192-power.h from mt8192.dtsi which is not used yet
2. Add timer binding document and device tree node in mt8192.dtsi
3. Remove watchdog driver modification

Seiya Wang (3):
  arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and
    Makefile
  dt-bindings: serial: Add compatible for Mediatek MT8192
  dt-bindings: timer: Add compatible for Mediatek MT8192
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
 .../bindings/timer/mediatek,mtk-timer.txt          |   1 +
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts        |  29 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 671 +++++++++++++++++++++
 5 files changed, 703 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192.dtsi

--
2.14.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
