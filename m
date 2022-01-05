Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00587C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jan 2022 02:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DD43mwXcTBxNISUzHH1kO+3LI9G5cREWq7x1hqdHA+Q=; b=iXdfcHhAaWOlEY
	s8hnop1e+pXtzAqw/njMz9HPIQILKqQZvB7YBYuZypeWohc6nYz+D57qNoR0U3om4iKkrY14Gfjv/
	mRfjz/VX8/YISCsYSsXk9jUoOUTKqCu2k4ZXesntzuFa713f0D6QsRDBrdXfkRCDeh6cCnsx78q8o
	8mT99pEM9n4JOjXkRJH8Dy9pXZsAhw6GiGtoTsY3rDnu1TEqybz+A+fY72yehdF2Y0SmdRBUocJvD
	p4fBvhgHPYfuGr4igQhgG7E7EOA3VVHi4AHPNzponLMkQHrSB1dDHeU1WNxL+1qkeVR372gDOjmME
	hYQIeWmBNDs7qUmCXH2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4w1d-00DJQO-FW; Wed, 05 Jan 2022 02:27:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4w1X-00DJP7-9G; Wed, 05 Jan 2022 02:27:38 +0000
X-UUID: a45b685c5c574f798473b01bd6be76c5-20220104
X-UUID: a45b685c5c574f798473b01bd6be76c5-20220104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1749947132; Tue, 04 Jan 2022 19:27:31 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Jan 2022 18:27:30 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 5 Jan 2022 10:27:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 5 Jan 2022 10:27:27 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
CC: <hsinyi@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-iio@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v2 0/7] Add basic node support for Mediatek MT8186 SoC
Date: Wed, 5 Jan 2022 10:27:19 +0800
Message-ID: <20220105022726.2458-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_182735_356095_0084B5E7 
X-CRM114-Status: GOOD (  12.76  )
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

From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

MT8186 is a SoC based on 64bit ARMv8 architecture.
It contains 6 CA55 and 2 CA78 cores.
MT8186 share many HW IP with MT65xx series.

This patchset was tested on MT8186 evaluation board to shell.

Based on v5.16-rc8

changes since v1:
 - add dt-bindings: arm: Add compatible for Mediatek MT8186

Allen-KH Cheng (7):
  dt-bindings: timer: Add compatible for Mediatek MT8186
  dt-bindings: serial: Add compatible for Mediatek MT8186
  dt-bindings: watchdog: Add compatible for Mediatek MT8186
  dt-bindings: mmc: Add compatible for Mediatek MT8186
  dt-bindings: phy: Add compatible for Mediatek MT8186
  dt-bindings: arm: Add compatible for Mediatek MT8186
  arm64: dts: Add Mediatek SoC MT8186 dts and evaluation board and
    Makefile

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../devicetree/bindings/mmc/mtk-sd.yaml       |   3 +
 .../bindings/phy/mediatek,tphy.yaml           |   1 +
 .../devicetree/bindings/serial/mtk-uart.txt   |   1 +
 .../bindings/timer/mediatek,mtk-timer.txt     |   1 +
 .../devicetree/bindings/watchdog/mtk-wdt.txt  |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8186-evb.dts   |  24 ++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 352 ++++++++++++++++++
 9 files changed, 388 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186.dtsi

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
