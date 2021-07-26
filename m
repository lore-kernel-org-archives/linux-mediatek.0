Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF9CC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 07:17:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D39560F49
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 07:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D39560F49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CTtOX2DNNk6QVUrOxKSs1t0YiiB8K4LGGhWUGGtzhU8=; b=sXUx+8eOlfCILC
	6YUqZdbBteLWHcRzYAoro7A96WwWQOGfYyyrw5bjhD6vSI0uSfyeIA+ZPsfJV4kzOrA4GGruadtan
	exXSAH6q7PW542jSAAasAYtybov7zYvvX5B2aC1QxcZtYaumNc5IxRNYYEjrPehroxxAd/kMv0mDo
	U5bLizbcszznbCqjFg2+YRWLNfe0CGi9m2IYZRytRoA+BUhLJFz1PoFnDuGzSKwkEqyuE9l4ONK64
	TUKTg4bQ4odOZLLcdydOxFtUHaeka1DqwiDeuwo2AbV0kx/qQKqpOxHuIWsYRU0zOkfvl8Fyo8ri9
	wx8/wq8X7/0UYVHZqflg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7urI-009roC-AM; Mon, 26 Jul 2021 07:17:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7urF-009rmf-C1; Mon, 26 Jul 2021 07:17:02 +0000
X-UUID: 4eba025065a94d9db3a19c21ca6c061c-20210726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=w11oKhoWloc9C0ctZvEcbjaB+ZvPir80GCX0qVEfzKc=; 
 b=S9CEe/ZeGkolGUuCjCDtPNPuCKjYnCvTns+gF0WJ6CBOgKREOm1BA1QFrJdCHlVWh+rE5hdc010A3eC3hY4cJ/qRmP99omOfnF0ZxBjuX++SCJCvMIe5quRNlQUxLoGk0aaqqQ8wc5+ullGGoUeFR0FRF1CXBWRobJP2PwkQVzI=;
X-UUID: 4eba025065a94d9db3a19c21ca6c061c-20210726
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 470881804; Mon, 26 Jul 2021 00:16:56 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 00:16:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 15:16:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 26 Jul 2021 15:16:52 +0800
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
Subject: [PATCH 00/12] Add basic SoC support for mediatek mt7986
Date: Mon, 26 Jul 2021 15:14:27 +0800
Message-ID: <20210726071439.14248-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_001701_460308_B060EEE3 
X-CRM114-Status: GOOD (  12.32  )
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

Sam Shih (12):
  dt-bindings: clock: mediatek: document clk bindings for mediatek
    mt7986 SoC
  clk: mediatek: add mt7986 clock IDs
  clk: mediatek: add mt7986 clock support
  pinctrl: mediatek: moore: use pin number in mtk_pin_desc instead of
    array index
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
 .../arm/mediatek/mediatek,infracfg.txt        |    2 +
 .../arm/mediatek/mediatek,sgmiisys.txt        |    2 +
 .../arm/mediatek/mediatek,topckgen.txt        |    1 +
 .../bindings/pinctrl/pinctrl-mt7622.txt       |  284 +++
 .../devicetree/bindings/rng/mtk-rng.yaml      |    1 +
 .../devicetree/bindings/serial/mtk-uart.txt   |    1 +
 .../devicetree/bindings/watchdog/mtk-wdt.txt  |    1 +
 arch/arm64/boot/dts/mediatek/Makefile         |    2 +
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  |   49 +
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  235 +++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |   21 +
 arch/arm64/boot/dts/mediatek/mt7986b.dtsi     |  235 +++
 drivers/clk/mediatek/Kconfig                  |   17 +
 drivers/clk/mediatek/Makefile                 |    2 +
 drivers/clk/mediatek/clk-mt7986-eth.c         |  132 ++
 drivers/clk/mediatek/clk-mt7986.c             |  610 ++++++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-moore.c      |   61 +
 drivers/pinctrl/mediatek/pinctrl-mt7986.c     | 1640 +++++++++++++++++
 include/dt-bindings/clock/mt7986-clk.h        |  244 +++
 24 files changed, 3558 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b.dtsi
 create mode 100644 drivers/clk/mediatek/clk-mt7986-eth.c
 create mode 100644 drivers/clk/mediatek/clk-mt7986.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7986.c
 create mode 100644 include/dt-bindings/clock/mt7986-clk.h

-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
