Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064B1C27C76
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 00:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2/D8cXmXNcAHljXU4dF+Qk+/JOcqsI8AMwgFVMFoz3c=; b=RAj5I+VJ/jNIHeZmv3wZBMOk7j
	e5PnB9TpNIKxf4LEg2Ffg1zC/wsLaqOQsBQ3WM3DvS1O48vPMOzxWJ0cooRj7zelNvH8JxUp1oOs8
	9eiYz/BCPUnjTrRODVya0bsEONJj2yY0R38FplMzkEDxw035l7bdZKnKV33lfntxZI+SJ4/GyMXdk
	G6YZR70BT1eYTWsbQuaiGa4LjtCzKrD62pnoi69x3Ojqum+3Fu9+bchX9hjZDIMQb37UuGSCcAOhS
	hbazmN2dwqqL+eiFrjwiXXq8QKhMKjVt3zEFpsjoE4CpYnvYuRBRdxW81HEGuQdiNdIXiUViSxZsi
	bya8zzVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKqDT-009D42-7e; Thu, 26 Jan 2023 00:34:11 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKqDP-009D25-AZ; Thu, 26 Jan 2023 00:34:10 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pKqDJ-000393-1D;
	Thu, 26 Jan 2023 01:34:01 +0100
Date: Thu, 26 Jan 2023 00:33:54 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Jianhui Zhao <zhaojh329@gmail.com>
Subject: [PATCH v2 0/2] add pinctrl driver for MT7981 SoC
Message-ID: <cover.1674693008.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_163407_381638_BC1D4972 
X-CRM114-Status: GOOD (  11.65  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MediaTek MT7981 SoC is the smaller sibbling of the MT7986 SoC.
While MT7986 is already fully supported in vanilla Linux, only few things
are missing to support also MT7981.

Add pinctrl driver including devicetree bindings for MediaTek MT7981
which together with the added clock drivers[1] completes support for the
most basic features of this SoC.

A complete work-in-progress tree based on linux-next for testing is
available via Github[2]:

[1]: https://patchwork.kernel.org/project/linux-clk/list/?series=714497
[2]: https://github.com/dangowrt/linux

Changes since v1:
 * cleaned up YAML bindings according to comments of Rob Herring
 * sync with pinctrl-mt7986.c to get pu/pd bias working

Daniel Golle (2):
  dt-bindings: pinctrl: add bindings for MT7981 SoC
  pinctrl: add mt7981 pinctrl driver

 .../pinctrl/mediatek,mt7981-pinctrl.yaml      |  475 ++++++++
 drivers/pinctrl/mediatek/Kconfig              |    5 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt7981.c     | 1048 +++++++++++++++++
 4 files changed, 1529 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7981-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7981.c


base-commit: 9fbee811e479aca2f3523787cae1f46553141b40
-- 
2.39.1


