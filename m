Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1C6C05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 03:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KsrGjpYeGgbFX0wvZow9V9bnjmlSN/YD7YmCRUR4epQ=; b=X4wb2PxjhYANTARZZX4fLfA2dC
	5TM1c+RL9CB13uI+rIlZBnnZ0A/Vc0zmjIlXeLTdZJWeo/B95yn1jaCwB4aKRGEp3Iz/CFA6/gpE6
	VL6L+g/H8ek/oUUl7PVfBHS7wbcvBBG5dm1oMGrrMKI9IfNfu8IWzOWaDjqQsJJJvhp9Vb4iSQFcK
	mHLEO0yQzGvMZ4JUGhVCQ7M1aPX5muGgQIiOa27F3yguQJV/8EbFDTEDCo60sruZ7Z1tRXbmTasow
	OI7eXCMAWvdW1kQbt6UQz5paqfebF0jbjRjfp2BGS5H7yP6wYmOO8r3GEkTjV9Xg+JtJP2eI2vEVw
	WAjtItng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKt15-009WH1-IE; Thu, 26 Jan 2023 03:33:35 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKt11-009WGX-Gh; Thu, 26 Jan 2023 03:33:34 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pKt0w-0004Dw-1Y;
	Thu, 26 Jan 2023 04:33:26 +0100
Date: Thu, 26 Jan 2023 03:33:19 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH v5 0/3] add support for clocks on MT7981 SoC
Message-ID: <cover.1674703830.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_193331_570932_579D6D5E 
X-CRM114-Status: GOOD (  13.67  )
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

The MediaTek MT7981 SoC is quite similar to its big sibling, the
MT7986. Hence most drivers can be reused and not much is missing the
get also this SoC working on mainline Linux.

Start with a cleaned-up version of the clock drivers, based on what can
also be found in MediaTek's SDK[1].

Upon request of AngeloGioacchino Del Regno this series has been rebased
and adapted to be applied on top of the pending series
"MediaTek clocks cleanups and improvements"[2]

The complete tree used for testing (with still some to-be-cleaned-up
changes, esp. for the Ethernet driver) can be found on Github[3].

[1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/target/linux/mediatek/files-5.4/drivers/clk/mediatek/clk-mt7981.c
[2]: https://patchwork.kernel.org/project/linux-clk/list/?series=714057
[3]: https://github.com/dangowrt/linux

Changes since v4:
 * add compatible string also for 'mediatek,apmixedsys', 'mediatek,ethsys' as
   well as 'mediatek,sgmiisys' bindings

Changes since v3:
 * fixed typos in commit descriptions

Changes since v2:
 * rebase on top of next-20230120 with v4 of AngeloGioacchino's series[2]
 * fix titles of dt-bindings commits (this time for real)
 * convert clk-mt7981-infracfg to use mtk_clk_simple_probe
 * make use of PLL_AO flag in clk-mt7981-apmixed
 * convert clk-mt7981-ethsys into platform driver, also using the generic
   probe function, allow building as module

Changes since v1:
 * rebase and adapt on top of [2]
 * split-off addition of dt-bindings header, fix filename
 * changed commit title as requested

Daniel Golle (3):
  dt-bindings: clock: Add compatibles for MT7981
  dt-bindings: clock: mediatek: add mt7981 clock IDs
  clk: mediatek: add MT7981 clock support

 .../bindings/arm/mediatek/mediatek,ethsys.txt |   1 +
 .../arm/mediatek/mediatek,infracfg.yaml       |   1 +
 .../arm/mediatek/mediatek,sgmiisys.txt        |   2 +
 .../bindings/clock/mediatek,apmixedsys.yaml   |   1 +
 .../bindings/clock/mediatek,topckgen.yaml     |   1 +
 drivers/clk/mediatek/Kconfig                  |  17 +
 drivers/clk/mediatek/Makefile                 |   4 +
 drivers/clk/mediatek/clk-mt7981-apmixed.c     | 102 +++++
 drivers/clk/mediatek/clk-mt7981-eth.c         | 117 +++++
 drivers/clk/mediatek/clk-mt7981-infracfg.c    | 207 +++++++++
 drivers/clk/mediatek/clk-mt7981-topckgen.c    | 422 ++++++++++++++++++
 .../dt-bindings/clock/mediatek,mt7981-clk.h   | 215 +++++++++
 12 files changed, 1090 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt7981-apmixed.c
 create mode 100644 drivers/clk/mediatek/clk-mt7981-eth.c
 create mode 100644 drivers/clk/mediatek/clk-mt7981-infracfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt7981-topckgen.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt7981-clk.h


base-commit: 9fbee811e479aca2f3523787cae1f46553141b40
-- 
2.39.1


