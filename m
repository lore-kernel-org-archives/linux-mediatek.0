Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBB9C004D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 01:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xamGaGtvB9HqMjf06LUEihHT8uFAAGyusdxNzjapV4w=; b=cuJCUBh2fMVK3Y20Q+sntFUBxs
	5Al28gX+6n6ToFs1+JBRKMWCliu83ZqddwxQBe4tU97s+tON6n0bTvBRwMnP+5H3eI+vcTxyRQRf7
	DS1nRs0lYk5qEGc0VgsQfstGyQ5qd9II3DtKojclq1yVLpQyb7jbO1DN4aRbOw8a341DtEqFc5EJs
	gjh+IGBT5jau+FCKdSTCaODzSRx/jDBSIcUXRJv/EzzoPnx13TrVhIN7il2/e6ZwCinIIkujlw+TP
	7tiDPpm9DQJkanZwYBCos6n+84VHVJBZY2S1Gpd2ag5Dm9LOHKJl1ZXr2A2QwVeBD4MiJgpavXBEN
	J46eYZAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIg9Q-007teX-6U; Fri, 20 Jan 2023 01:25:04 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIg9M-007tbm-39
	for linux-mediatek@lists.infradead.org; Fri, 20 Jan 2023 01:25:02 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pIg98-0005vY-1m;
	Fri, 20 Jan 2023 02:24:48 +0100
Date: Fri, 20 Jan 2023 01:24:36 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-armkernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Jianhui Zhao <zhaojh329@gmail.com>
Subject: [PATCH 0/3 v2] add support for clocks on MT7981 SoC
Message-ID: <cover.1674152610.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_172500_199702_BC550CDC 
X-CRM114-Status: GOOD (  11.27  )
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

Changes since v1:
 * rebase and adapt on top of [2]
 * split-off addition of dt-bindings header, fix filename
 * changed commit title as requested

[1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/target/linux/mediatek/files-5.4/drivers/clk/mediatek/clk-mt7981.c
[2]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711734

Daniel Golle (3):
  dt-bindings: clk: Add apmixedsys/topckgen compatibles for MT7981
  dt-bindings: clk: mediatek: add mt7981 clock IDs
  clk: mediatek: add MT7981 clock support

 .../bindings/clock/mediatek,apmixedsys.yaml   |   1 +
 .../bindings/clock/mediatek,topckgen.yaml     |   1 +
 drivers/clk/mediatek/Kconfig                  |  17 +
 drivers/clk/mediatek/Makefile                 |   4 +
 drivers/clk/mediatek/clk-mt7981-apmixed.c     | 103 +++++
 drivers/clk/mediatek/clk-mt7981-eth.c         | 138 ++++++
 drivers/clk/mediatek/clk-mt7981-infracfg.c    | 236 ++++++++++
 drivers/clk/mediatek/clk-mt7981-topckgen.c    | 423 ++++++++++++++++++
 .../dt-bindings/clock/mediatek,mt7981-clk.h   | 215 +++++++++
 9 files changed, 1138 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt7981-apmixed.c
 create mode 100644 drivers/clk/mediatek/clk-mt7981-eth.c
 create mode 100644 drivers/clk/mediatek/clk-mt7981-infracfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt7981-topckgen.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt7981-clk.h

-- 
2.39.1


