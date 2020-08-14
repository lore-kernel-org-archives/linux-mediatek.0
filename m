Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B0EC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 06:06:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E2BC20708
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 06:06:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1o2Wn2VY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="b7qRrf6d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E2BC20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RHGYAxVcU46ln8Oap1SKcUyqJv6UA1ff78Ge75qZ1pc=; b=1o2Wn2VY5JgvcKeGch2biAw2uo
	gYMoSvnDaKzwxG1tzK9lSlh4Dfw4F65wdRyWOCiNdZlzdhS+b+8ElpAK46UrMgGp7vd0UfJJzTK7/
	LJB4Gw8W9VJjjQKizAKZbNgakLn+DGr/5uqqks8xaNeyBY1c8JV92nN81STlDBaHLIyPiDgu5LG/L
	FhPH/Iz1TKOIQddVCuC32NVLUP456Xpy4b2HLhdVIe5yPAtiuGSddLpcfnJ0pgyphoz1lIk4mGRzB
	z9lY1OZlmSm+om5veTd0Y4WTxZwGAFRUODRBCLrW0MPiF4nFCD37UmELXjau661TFv1qqZC6XL4SV
	IeBNTMXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6SrT-0000bI-1e; Fri, 14 Aug 2020 06:06:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6SrM-0000Za-Q8; Fri, 14 Aug 2020 06:06:38 +0000
X-UUID: afef28c9fdf242babdb9ad482c194805-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=59u+JK0JHUadSuGfbkt82SozCQVQXwbTzzJ5U+21lKY=; 
 b=b7qRrf6doMFvguwYoB3rgJY1yAhvikPhtOE0xs7ZRb4VPu3qRq1c9tXuhXo5rLtiJaLSkkXVgorG8AxG0cy/RbcsjZ0VMtslrPOFJ97z1yJaLxujmDZ64+zT7jrCAp0i2wq/YSDxHAjMPvvSXFEKqwTumf+6YEWVoUKzRluHLis=;
X-UUID: afef28c9fdf242babdb9ad482c194805-20200813
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1080830691; Thu, 13 Aug 2020 22:05:10 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 23:05:11 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 14:05:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 14 Aug 2020 14:05:06 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 0/4] Add basic node support for Mediatek MT8192 SoC 
Date: Fri, 14 Aug 2020 14:04:51 +0800
Message-ID: <20200814060454.32200-1-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_020636_997385_D77008CD 
X-CRM114-Status: GOOD (  18.23  )
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

Change in v4:
1. Remove scpsys, spmi and apu nodes
2. Add i2c nodes
3. Update watchdog binding
4. Update dependency list

Change in v3:
Fix typo in binding document of timer

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
[PATCH v2 1/3] dt-bindings: pinctrl: mt8192: add pinctrl file
[PATCH v2 2/3] dt-bindings: pinctrl: mt8192: add binding document
[PATCH v2 3/4] dt-bindings: mediatek: add compatible for MT6873/8192 pwrap
[PATCH v2 1/2] dt-bindings: spi: update bindings for MT8192 SoC
[PATCH 2/4] clk: mediatek: Add dt-bindings for MT8192 clocks
[PATCH v2 1/5] dt-bindings: ARM: Mediatek: Document bindings for MT8192
[v4,3/5] dt-binding: mediatek: mt8192: update mtk-wdt document

Please also accept this patch together with [1][2][3][4][5][6]
to avoid build and dt binding check error.

[1] http://lists.infradead.org/pipermail/linux-mediatek/2020-August/015002.html
[2] http://lists.infradead.org/pipermail/linux-mediatek/2020-August/015005.html
[3] http://lists.infradead.org/pipermail/linux-mediatek/2020-July/014546.html
[4] http://lists.infradead.org/pipermail/linux-mediatek/2020-July/014406.html
[5] http://lists.infradead.org/pipermail/linux-mediatek/2020-July/014450.html
[6] http://lists.infradead.org/pipermail/linux-mediatek/2020-July/014898.html
[7] http://lists.infradead.org/pipermail/linux-mediatek/2020-August/015046.html
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
