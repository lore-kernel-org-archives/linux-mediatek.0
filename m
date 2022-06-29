Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506EFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 12:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iQcXa53I0pJ3ryK7/vaPBiZ+2Jc6JA2rkXPfiRnx8WI=; b=YEzsshhTlsWwaR0vh3aRCJDanG
	HmuKiZIijooNVTD3z+nA1LcssmUfP4w5uyct+hL8olEcS9LMmLMl8tzzkUmk5Kn1Bc2LPiKb5gkky
	UuUqX9B9LCm4+bKgIHteYWnm/DEXyyM+9FqCdCoGqBZcW8LY/cAoKAsQ8Mj6o8gM8qdwyWDQ+7Psr
	lwutCw3tQu3B322DSP4DKQdUtP2FVtWgaspnVBEj6V64PgB9QkRploxPNiqGt+R50h4vwC78f9KWW
	mEvZKyzdqh7whPv+L4K/uPnwrsFmzHXs08uYWhjxiLxvxmdntKuUaPsrgecSKBIfyHlGar8EBTC/C
	vsX3CWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6WqN-00Bpag-5c; Wed, 29 Jun 2022 12:30:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6VTK-00BEiD-5i; Wed, 29 Jun 2022 11:03:04 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0CAD56601907;
	Wed, 29 Jun 2022 12:02:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656500580;
	bh=HKLzsIjVGUOq/0tp28EdDcaBcv8Ni0uizeP7YdZdPHk=;
	h=From:To:Cc:Subject:Date:From;
	b=AXBa6NRRL4c1Lhny7bhGJOhoG4KbvXTIAxsSP0vATRaPHsiFXvgZ/tB2Xh6oOZFJ0
	 0zZ2XNX6MS+r5H8z1/SRI/vZi1mZMtfG1Zeflh76XLQBP7nTI+lDWlCPoUnZGPRDTa
	 pjia+BFu2OgRWTHKS8OrsdbuwkBhuEYQMu+y9IKhSmS81ifgfXUdHaPv9ZAhk14eFN
	 VWbJqyZIXZyIPHMK20hL78SLWrlQCblKnKZ6lWa0WKKKRuRMt5vOZVSj662l038Gc+
	 8QrIRq4vtZlCx4xqK9OgvMQGaQh2bDxJWy3pi7QrjhMBGGvoSI950mHQoTKQc/sMRs
	 72AKgg/ScRK9g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	y.oudjana@protonmail.com,
	angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	ck.hu@mediatek.com,
	fparent@baylibre.com,
	rex-bc.chen@mediatek.com,
	tinghan.shen@mediatek.com,
	chun-jie.chen@mediatek.com,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	miles.chen@mediatek.com,
	sam.shih@mediatek.com,
	wenst@chromium.org,
	bgolaszewski@baylibre.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	kernel@collabora.com
Subject: [PATCH v5 0/7] MediaTek Helio X10 MT6795 - Clock drivers
Date: Wed, 29 Jun 2022 13:02:47 +0200
Message-Id: <20220629110254.184213-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_040302_546422_921EF469 
X-CRM114-Status: GOOD (  11.40  )
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

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This (very big) series introduces system clock, multimedia clock drivers
(including resets) for this SoC.

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

This series depends on, and can be merged on top of:
[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=640122
[2]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=637849

Changes in v5:
 - Renamed clock/reset header filenames to add vendor prefix
 - Removed quotes for $id, $schema in commit [4/7]

Changes in v4:
 - Removed unnecessary examples for clock controllers in commit [4/7]
 - Fixed one instance of 88 columns line wrap in commit [4/7]

Changes in v3:
 - Fixed typo in commit [4/7]

Changes in v2:
 - Fixed yaml clock bindings as per Rob's review
 - Added ability to compile all MT6795 clock drivers as modules
 - Added commits to export some symbols, required to compile as module
AngeloGioacchino Del Regno (7):
  dt-bindings: mediatek: Document MT6795 system controllers bindings
  dt-bindings: clock: Add MediaTek Helio X10 MT6795 clock bindings
  dt-bindings: reset: Add bindings for MT6795 Helio X10 reset
    controllers
  dt-bindings: clock: mediatek: Add clock driver bindings for MT6795
  clk: mediatek: clk-apmixed: Remove unneeded __init annotation
  clk: mediatek: Export required symbols to compile clk drivers as
    module
  clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers

 .../arm/mediatek/mediatek,infracfg.yaml       |   2 +
 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   1 +
 .../arm/mediatek/mediatek,pericfg.yaml        |   1 +
 .../bindings/clock/mediatek,apmixedsys.yaml   |   1 +
 .../bindings/clock/mediatek,mt6795-clock.yaml |  66 ++
 .../clock/mediatek,mt6795-sys-clock.yaml      |  54 ++
 .../bindings/clock/mediatek,topckgen.yaml     |   1 +
 drivers/clk/mediatek/Kconfig                  |  37 ++
 drivers/clk/mediatek/Makefile                 |   6 +
 drivers/clk/mediatek/clk-apmixed.c            |   3 +-
 drivers/clk/mediatek/clk-cpumux.c             |   2 +
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c  | 157 +++++
 drivers/clk/mediatek/clk-mt6795-infracfg.c    | 148 +++++
 drivers/clk/mediatek/clk-mt6795-mfg.c         |  50 ++
 drivers/clk/mediatek/clk-mt6795-mm.c          | 106 +++
 drivers/clk/mediatek/clk-mt6795-pericfg.c     | 160 +++++
 drivers/clk/mediatek/clk-mt6795-topckgen.c    | 610 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt6795-vdecsys.c     |  55 ++
 drivers/clk/mediatek/clk-mt6795-vencsys.c     |  50 ++
 drivers/clk/mediatek/clk-mtk.c                |   2 +
 drivers/clk/mediatek/reset.c                  |   1 +
 .../dt-bindings/clock/mediatek,mt6795-clk.h   | 275 ++++++++
 .../reset/mediatek,mt6795-resets.h            |  50 ++
 23 files changed, 1837 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt6795-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6795-infracfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6795-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6795-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt6795-pericfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6795-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt6795-vdecsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6795-vencsys.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt6795-clk.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6795-resets.h

-- 
2.35.1


