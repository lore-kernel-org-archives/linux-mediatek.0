Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D36EE7716A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2024 09:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2pqbbdVHCcH3VANkw0WgRiMAw/2BcvXvAUXBdVOTo8Y=; b=1PwZRxlACheyNe
	eC3+ROipAKM0AgX9yiy9U7HOjv6uSlmfcEyEJR832W++SxlFRfTbse+ce7cMPkt+R88WFV7svc+DS
	8BCcXIyOa6NpUpf2QKvzOWLpvGw69KT+4dft+d0NzztSL70gwoDmNV4d7dePoZCq1RWCKktTHxA1k
	+ap7CaBlaM125T0VmLZigSu2ecpoRvZIRL5Z9javGGiuC5WOoCkQe9EfBLK1uArvThD9m29G+6tDs
	Bo7EfpsA4pODB47lzBR7xIVp0v/oJigcwABKCuSrYnMkt9g7pX4N5UfZlXjp76ouPbJPFJD/x7yh+
	xrdHT/oC1WjHNMPHJz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTSI-0000000Coti-0yJn;
	Tue, 17 Dec 2024 09:01:26 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTLu-0000000Cn2J-2HF2;
	Tue, 17 Dec 2024 08:54:51 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 256DD604CC;
	Tue, 17 Dec 2024 08:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734425685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2pqbbdVHCcH3VANkw0WgRiMAw/2BcvXvAUXBdVOTo8Y=;
	b=n/L3xXmQKhLKYpcTbcJzXYze9sUI5wba602cFxDR6wWF9/oLQwE8LtHnzdqQPkml14Tx9M
	BiaHg/NlwqKyHr+k316IV4aWhEJ4MccLHpdn/tlAbJNMZxnCalnj7QPszX27OkUf369TAQ
	o775fjdMpk1M3EQrcSWe+q/J4doqJR4=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 14A511003B7;
	Tue, 17 Dec 2024 08:54:44 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v7 0/5] Add pinctrl support for mt7988
Date: Tue, 17 Dec 2024 09:54:25 +0100
Message-ID: <20241217085435.9586-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 9c7aa8e6-e3a5-43a8-993f-ab4d197c3c29
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_005450_739178_6CA9146D 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This series adds pinctrl driver, dt-bindings and dts node for pinctrl
on mediatek mt7988 SoC.

changes in v7:
- add const for pins and mtk_pin_soc as suggested by Christophe JAILLET in v5
- left angelos RB because of minor change (hope this is right)

changes in v6:
- some fixes to binding
- changed title and fixed typo in bpi-r4 patch
- added RB's

changes in v5:
- rebased to 6.13-rc1
- moved dt nodes with mutliple options to BPI-R4 board
- changes suggested by angelo in v4
- changed example in binding and dt node to not using const MTK_DRIVE_8mA

changes in v4:
- fixed fixed string binding error

changes in v3:
- rebase on rafals dts patches
- update binding to have mux subnode as fixed string and conf with optional suffix

changes in v2:
  binding:
  - drop gpio-cells description
  - move ref in mux subnode up
  - order uart-functions alphanumeric and fix typo
  dts:
  - fix indentation of reg-values

Daniel Golle (2):
  pinctrl: mediatek: add support for MTK_PULL_PD_TYPE
  pinctrl: mediatek: add MT7988 pinctrl driver

Frank Wunderlich (3):
  dt-bindings: pinctrl: add binding for MT7988 SoC
  arm64: dts: mediatek: mt7988: Add pinctrl support
  arm64: dts: mediatek: mt7988a-bpi-r4: Add pinctrl subnodes for bpi-r4

 .../pinctrl/mediatek,mt7988-pinctrl.yaml      |  575 ++++++
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  189 ++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |   54 +
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt7988.c     | 1556 +++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   73 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |    1 +
 8 files changed, 2445 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7988.c

-- 
2.43.0


