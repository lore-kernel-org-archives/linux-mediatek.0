Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D757AC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 01:31:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7A402078E
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 01:31:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i9+Mb4bC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hk3pby0t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7A402078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BgbhVig1tnueRCY7oMYcRLI9CpWBq+Z192utFNWGqmw=; b=i9+Mb4bCjGHeaEOt/bng0hyFF7
	OSjUlz0KfgaNe7UdGlu1gA2amfFxqoSrDl7i+eXZ0CgZEv4fMi1S90c0J8hwjqlC1AOZtRpxqvoYK
	7WQqIaGz6Hcl4nbNRESF3Sd1k1XLIuAV0kUjkCdLVzCZJZicwEA/2AUlTRBFMbQV+WVS00tOxuB0d
	qXQvJp4cdNuKtFOBtp/Xuu35YVcA4IOYY2TtkcFaWXmenbL1Iu+cpWgmDiuHibd4h92ubangtaSf2
	7TaEz7GxL8YKU+5IPmfun27unTGVyeBZ6/FRe4AeBTtLxnw2fu5vMzlYDFmxP0cHdv5jRr3flIYb9
	YdFHTC6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0awP-0008UW-Pu; Wed, 29 Jul 2020 01:31:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0awK-0008Td-I9; Wed, 29 Jul 2020 01:31:30 +0000
X-UUID: 67accefac1c44e5ebee1ab737f97ad2b-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/9UU7kgDikfzGReMi+cNjBDucNreiMt14wXF0POFEPc=; 
 b=hk3pby0t1UupVi2xTAawsbGC7QnDNNsbDTUTkU2/0IXNitMK79AkHtlJwF9U68jfxVhwF1wSpV84hpLrcrEkTHlYtqsfxIa79so90wZmwMdn9B5LHavL1TiOUe4i/RUL9UGm3HaJeqBmByz/Sj+P1wZOSwybItz3YJviUs3PuxA=;
X-UUID: 67accefac1c44e5ebee1ab737f97ad2b-20200728
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 758949875; Tue, 28 Jul 2020 17:31:21 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 18:31:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 09:31:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 29 Jul 2020 09:31:17 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v3 0/3] Add basic node support for Mediatek MT8192 SoC 
Date: Wed, 29 Jul 2020 09:30:57 +0800
Message-ID: <20200729013100.19539-1-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_213129_348036_0A36FF82 
X-CRM114-Status: GOOD (  19.22  )
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
