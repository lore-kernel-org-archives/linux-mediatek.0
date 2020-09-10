Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B16C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 17:58:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5081220C09
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 17:58:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xem9fE93";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1/dJz17P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5081220C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cIasdaggiI83tt+a/SHw41ngeomCjkM6dO3VHF5FFfc=; b=xem9fE930X5YvZSHxFC1GziaL+
	siLxAX2kOgtoNKetPvxKXFLcPBejFjAxrJDvrjmnFfS0I2jjCNRQGyj3OgmFmhPWqyQqpGm5biCqR
	XqCMlvwG+ABpe+NmqeEo7sPnNYUkFJ/hRRYRD5RolRPxhIu/+KRh6nhH60hWa/aEO7th+sRzfxvco
	6E5prgCMRfkveM1ZFAwOeJpQfXsQXvL77cjnlLEXWvoRO6bpTUql44j2G6YhtQK6BKPZXBiFYEuZ0
	8hpMV3aPyhRT6GQESqWtD/QUOZOI7Z1L8Ee3sMZ0M3+R7vjI3txxuTEfHGPeh/WseEoV5DfUmMrdq
	OhtcTNLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGQpV-0002Hb-0d; Thu, 10 Sep 2020 17:57:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGQpQ-0002Gt-Sw; Thu, 10 Sep 2020 17:57:49 +0000
Received: from localhost.localdomain (unknown [194.230.155.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3808820BED;
 Thu, 10 Sep 2020 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599760667;
 bh=muQ6zjVn/mf+iXsfCUdXzl3dZG6B8J8l8bbNbkMxaHs=;
 h=From:To:Cc:Subject:Date:From;
 b=1/dJz17PLrZMeRIjQd6sFEAce0o7eu4K+r0dL+zosiqq0luiYlHoWB51FielsPqaO
 Wa3TSJxOyAyZi6SExx28ze23dGlUmJasReiKbjSU4S7it/I5rb2rMggP0mkbcOPGUV
 cSry5a/sdkrgJlogKXiGfjplhGDzzPpiCOwVMjVI=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Tero Kristo <t-kristo@ti.com>,
 Nishanth Menon <nm@ti.com>, Michal Simek <michal.simek@xilinx.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 00/15] ARM: dts: / gpio: Add dtschema for NXP PCA953x and
 correct dts
Date: Thu, 10 Sep 2020 19:57:18 +0200
Message-Id: <20200910175733.11046-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_135749_099885_9409198B 
X-CRM114-Status: GOOD (  15.66  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Changes since v1:
1. Patch 1: Use additionalProperties, Add wakeup-source, Add hogs, Extend example with hogs.
2. New patches: 3, 4, 5, 6, 7, 9, 10, 12, 14 and 15.

The patches could be picked up independently if dtschema makes sense.
The fixes for pins make sense anyway, regardless of dtschema.

Best regards,
Krzysztof


Krzysztof Kozlowski (15):
  dt-bindings: gpio: convert bindings for NXP PCA953x family to dtschema
  dt-bindings: gpio: convert bindings for Maxim MAX732x family to
    dtschema
  arm64: dts: mediatek: fix tca6416 reset GPIOs in pumpkin
  arm64: dts: mediatek: align GPIO hog names with dtschema
  arm64: dts: renesas: align GPIO hog names with dtschema
  arm64: dts: ti: align GPIO hog names with dtschema
  arm64: dts: xilinx: align GPIO hog names with dtschema
  ARM: dts: am335x: lxm: fix PCA9539 GPIO expander properties
  ARM: dts: am335x: t335: align GPIO hog names with dtschema
  ARM: dts: am3874: iceboard: fix GPIO expander reset GPIOs
  ARM: dts: aspeed: fix PCA95xx GPIO expander properties on Portwell
  ARM: dts: aspeed: align GPIO hog names with dtschema
  ARM: dts: dove: fix PCA95xx GPIO expander properties on A510
  ARM: dts: armada: align GPIO hog names with dtschema
  ARM: dts: imx6q: align GPIO hog names with dtschema

 .../devicetree/bindings/gpio/gpio-max732x.txt |  58 -----
 .../devicetree/bindings/gpio/gpio-pca953x.txt |  90 -------
 .../bindings/gpio/gpio-pca95xx.yaml           | 234 ++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |   4 -
 arch/arm/boot/dts/am335x-lxm.dts              |   4 +
 arch/arm/boot/dts/am335x-sbc-t335.dts         |   4 +-
 arch/arm/boot/dts/am3874-iceboard.dts         |   8 +-
 arch/arm/boot/dts/armada-388-clearfog.dts     |   4 +-
 arch/arm/boot/dts/armada-388-clearfog.dtsi    |  10 +-
 arch/arm/boot/dts/armada-388-helios4.dts      |   6 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |   2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts   |  16 +-
 .../boot/dts/aspeed-bmc-portwell-neptune.dts  |   2 +
 arch/arm/boot/dts/dove-sbc-a510.dts           |   1 +
 arch/arm/boot/dts/imx6q-b450v3.dts            |  14 +-
 arch/arm/boot/dts/imx6q-b650v3.dts            |  12 +-
 arch/arm/boot/dts/imx6q-b850v3.dts            |   4 +-
 arch/arm/boot/dts/imx6q-bx50v3.dtsi           |  12 +-
 .../boot/dts/mediatek/pumpkin-common.dtsi     |  28 +--
 .../boot/dts/renesas/r8a77951-salvator-xs.dts |   2 +-
 .../boot/dts/renesas/r8a77965-salvator-xs.dts |   2 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |  14 +-
 .../dts/ti/k3-j721e-common-proc-board.dts     |   4 +-
 .../boot/dts/xilinx/zynqmp-zcu102-revA.dts    |   8 +-
 24 files changed, 316 insertions(+), 227 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max732x.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
