Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553A7C43214
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 07:46:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21A5960FC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 07:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21A5960FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UmaENsmmZJJ82qNaeEsANDBujJdbzKNxd7whfdF8rvA=; b=Qt+ikkvfQn1qsH
	Gu2jAwM9H0lPj6SYG/fdKtvvOQFhxVQt6NOt9kQC8Fwmxmm1RGJMno3Fn5NgAxanfakFWTTCrzP8V
	E94ckQVRz/gs9UHEs7qDtfAO+B0coNffqOtR7xuHoqixpfiE4EnjynSkF89vhOU1BAQmxM4Ere49v
	ZsUhtcN14VJo+nIF7/odH0MfCKXkN3/l2B0TiPH84KZaTiF8BZ4Oqj6DQZaLYt45Vhz0aFHEWfIQ0
	hpbtJa1CZIPKYkLfuzqn+537y0nwAjDDF5crB5aJvyoozZcqE3F92R8lBsCmj4epM5ipZp3vtLKpE
	ey6kHs0NlSSbWEClEYcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFtnm-001MkX-Fs; Tue, 17 Aug 2021 07:46:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFtnU-001Mgg-Rd; Tue, 17 Aug 2021 07:46:14 +0000
X-UUID: 05ad235293084a12bc5a3ea905cead2e-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=yZiNKr85gv3Al46dzSGpP67+IGp2Nl0HG4vWdADLDT8=; 
 b=aMYdETGMnwF7qZ0EtYYiNh4evmy2KhOSU3W7BKPYQWtsdzSebkcPL3qI1rnHVzUwRHIPSYaS04A+D7Oo+mQ1vS57A04JAkaw1E6wl4o+gSd/WngGl4J4CWVhbZYkYStBGPwbRGFenrS14rZQ/nQvudgNjYDVD52gWfb7XnCQkMA=;
X-UUID: 05ad235293084a12bc5a3ea905cead2e-20210817
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1470941397; Tue, 17 Aug 2021 00:46:05 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 00:46:03 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 17 Aug 2021 15:46:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 17 Aug 2021 15:46:01 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Matt Mackall <mpm@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 Fabien Parent <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
 <linux-clk@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [v2,00/12] Add basic SoC support for mediatek mt7986
Date: Tue, 17 Aug 2021 15:45:45 +0800
Message-ID: <20210817074557.30953-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_004610_339204_8F00B4A5 
X-CRM114-Status: GOOD (  12.17  )
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

This patch adds basic SoC support for Mediatek's new 4-core SoC,
MT7986, which is mainly for wifi-router application.

---
v2: updated mt7986 clock releated IDs, dt-binding, and driver
    updated mt7986 clock releated dt-binding and driver
    updated device tree of mt7986a and mt7986b

Sam Shih (12):
  dt-bindings: clock: mediatek: document clk bindings for mediatek
    mt7986 SoC
  clk: mediatek: add mt7986 clock IDs
  clk: mediatek: add mt7986 clock support
  pinctrl: mediatek: moore: check if pin_desc is valid before use
  dt-bindings: pinctrl: update bindings for MT7986 SoC
  pinctrl: mediatek: add support for MT7986 SoC
  dt-bindings: arm64: dts: mediatek: Add mt7986 series
  dt-bindings: rng: mediatek: add mt7986 to mtk rng binding
  dt-bindings: serial: Add compatible for Mediatek MT7986
  dt-bindings: watchdog: Add compatible for Mediatek MT7986
  arm64: dts: mediatek: add mt7986a support
  arm64: dts: mediatek: add mt7986b support

 .../devicetree/bindings/arm/mediatek.yaml     |    8 +
 .../arm/mediatek/mediatek,apmixedsys.txt      |    1 +
 .../bindings/arm/mediatek/mediatek,ethsys.txt |    1 +
 .../arm/mediatek/mediatek,infracfg.txt        |    1 +
 .../arm/mediatek/mediatek,sgmiisys.txt        |    2 +
 .../arm/mediatek/mediatek,topckgen.txt        |    1 +
 .../bindings/pinctrl/pinctrl-mt7622.txt       |  170 +++
 .../devicetree/bindings/rng/mtk-rng.yaml      |    1 +
 .../devicetree/bindings/serial/mtk-uart.txt   |    1 +
 .../devicetree/bindings/watchdog/mtk-wdt.txt  |    1 +
 arch/arm64/boot/dts/mediatek/Makefile         |    2 +
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  |   49 +
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  227 +++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |   21 +
 arch/arm64/boot/dts/mediatek/mt7986b.dtsi     |  236 ++++
 drivers/clk/mediatek/Kconfig                  |   17 +
 drivers/clk/mediatek/Makefile                 |    4 +
 drivers/clk/mediatek/clk-mt7986-apmixed.c     |   78 ++
 drivers/clk/mediatek/clk-mt7986-eth.c         |  132 ++
 drivers/clk/mediatek/clk-mt7986-infracfg.c    |  198 +++
 drivers/clk/mediatek/clk-mt7986-topckgen.c    |  319 +++++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-moore.c      |   18 +
 drivers/pinctrl/mediatek/pinctrl-mt7986.c     | 1217 +++++++++++++++++
 include/dt-bindings/clock/mt7986-clk.h        |  169 +++
 26 files changed, 2882 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b.dtsi
 create mode 100644 drivers/clk/mediatek/clk-mt7986-apmixed.c
 create mode 100644 drivers/clk/mediatek/clk-mt7986-eth.c
 create mode 100644 drivers/clk/mediatek/clk-mt7986-infracfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt7986-topckgen.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7986.c
 create mode 100644 include/dt-bindings/clock/mt7986-clk.h

-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
