Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15810C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 12:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Isp/Dwhm2QvR+hgeovNChkMn2VkpyODUOdDhM663gcY=; b=qlw7LqbVl77oxHYWtsV3ZyeCic
	Wg0pBm5PQHWvacBMlpxBPkGYh2CEFPOQ2EDFsg5fx3aW/Htyj1GbzosjAGJwTYZuT83au3pLqo9pw
	G5MZdKHzKNVFGlPQVqU6mRt22L6A1GoVVfn70QooedT0YgsQmFHYC7CvBcQNG1ahkHGd6DMQk8+lk
	OcEb50nyj4mplneGmfYNJ0iS4AX5v6dNp8CFaY5qz0z00CR7yckQpZT27pHtZUdmHTgTotdVqVxDO
	XUdEDlE7Hjf/StKsq74t9N6Jk7z0BuYSkRn3KYahtDcK+OV02Q4XCbzNa43vmctVHzrgyNyyvVH5i
	qepMz73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Kjt-00BswA-B8; Thu, 22 Dec 2022 12:31:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K4b-00BX9O-4E; Thu, 22 Dec 2022 11:49:19 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E15C26602C6F;
	Thu, 22 Dec 2022 11:49:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671709755;
	bh=gRuxMXdNb3YdnArJGNrVzy/+fNO0scR2SKCD4jo+Pkg=;
	h=From:To:Cc:Subject:Date:From;
	b=KzESMOe95yU11aoiQES07lof1ztvb09NwpPBZMsFiVUM3H9WpU0uGBSXY97Vzh6MZ
	 qtal9oPtQJ/tjoSVoZy24ksj/tXorQ+bGFBjVOhhXSEZlEREWlNjWB+ol66tMuekfM
	 P/B3vyy797BaBFbk6u/gi44cSE7USEKD++PmVReurIBHjsBEo2LeC1SbWraUuuhWvN
	 BpwVvlEKHwlhpSoIhLKuSewVjBFjNKOBLnrdITVC22DtOJyvjIYeD26NzC+kFcbslk
	 GgavAHPvJJ7/TK7K1vuYA/+633hRZf1XkkfJHKaUZxzqezNyTH/D+m9nrZD29n2dFQ
	 OYw1unNXS/Cdw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	fparent@baylibre.com,
	chun-jie.chen@mediatek.com,
	sam.shih@mediatek.com,
	y.oudjana@protonmail.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	ryder.lee@kernel.org,
	daniel@makrotopia.org,
	jose.exposito89@gmail.com,
	yangyingliang@huawei.com,
	pablo.sun@mediatek.com,
	msp@baylibre.com,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 00/25] MediaTek clocks cleanups and improvements
Date: Thu, 22 Dec 2022 12:48:32 +0100
Message-Id: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034917_470131_80525049 
X-CRM114-Status: GOOD (  13.94  )
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

This series performs cleanups and improvements on MediaTek clock
drivers, greatly reducing code duplication (hence also reducing
kernel size).

There would be a lot to say about it, but summarizing:

* Propagates struct device where possible in order to introduce the
  possibility of using Runtime PM on clock drivers as needed,
  possibly enhancing reliability of some platforms (obviously, this
  will do nothing unless power-domains are added to devicetree);

* Cleans up some duplicated clock(s) registration attempt(s): on
  some platforms the 26M fixed factor clock is registered early,
  but then upon platform_driver probe, an attempt to re-register
  that clock was performed;

* Removes some early clock registration where possible, moving
  everything to platform_driver clock probe;

* Breaks down the big MT8173 clock driver in multiple ones, as it's
  already done with the others, cleans it up and adds possibility
  possibility to compile non-boot-critical clock drivers (for 8173)
  as modules;

* Extends the common mtk_clk_simple_probe() function to be able to
  register multiple MediaTek clock types;

* Removes duplicated [...]_probe functions from multiple MediaTek SoC
  clock drivers, migrating almost everything to the common functions
  mtk_clk_simple_probe();

* Adds a .remove() callback, pointing to the common mtk_clk_simple_remove()
  function to all clock drivers that were migrated to the common probe;

* Some more spare cleanups here and there.

All of this was manually tested on various Chromebooks (with different MTK
SoCs) and no regression was detected.

Cheers!

AngeloGioacchino Del Regno (25):
  clk: mediatek: mt8192: Correctly unregister and free clocks on failure
  clk: mediatek: mt8192: Propagate struct device for gate clocks
  clk: mediatek: clk-gate: Propagate struct device with
    mtk_clk_register_gates()
  clk: mediatek: cpumux: Propagate struct device where possible
  clk: mediatek: clk-mtk: Propagate struct device for composites
  clk: mediatek: clk-mux: Propagate struct device for mtk-mux
  clk: mediatek: clk-mtk: Add dummy clock ops
  dt-bindings: clock: mt8173: Add dummy clock ID
  clk: mediatek: mt8173: Migrate to platform driver and common probe
  clk: mediatek: mt8173: Remove mtk_clk_enable_critical()
  clk: mediatek: mt8173: Break down clock drivers and allow module build
  dt-bindings: clock: mt2701/mt6779: Add dummy clock with ID 0
  clk: mediatek: Switch to mtk_clk_simple_probe() where possible
  clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
  clk: mediatek: mt8173: Migrate pericfg/topckgen to
    mtk_clk_simple_probe()
  clk: mediatek: clk-mt8192: Move CLK_TOP_CSW_F26M_D2 in top_divs
  clk: mediatek: mt8192: Join top_adj_divs and top_muxes
  clk: mediatek: mt8186: Join top_adj_div and top_muxes
  clk: mediatek: clk-mt8183: Join top_aud_muxes and top_aud_divs
  clk: mediatek: clk-mtk: Register MFG notifier in
    mtk_clk_simple_probe()
  clk: mediatek: clk-mt8192: Migrate topckgen to mtk_clk_simple_probe()
  clk: mediatek: clk-mt8186-topckgen: Migrate to mtk_clk_simple_probe()
  clk: mediatek: clk-mt6795-topckgen: Migrate to mtk_clk_simple_probe()
  clk: mediatek: clk-mt7986-topckgen: Properly keep some clocks enabled
  clk: mediatek: clk-mt7986-topckgen: Migrate to mtk_clk_simple_probe()

 drivers/clk/mediatek/Kconfig                 |   30 +-
 drivers/clk/mediatek/Makefile                |    6 +-
 drivers/clk/mediatek/clk-cpumux.c            |    9 +-
 drivers/clk/mediatek/clk-cpumux.h            |    3 +-
 drivers/clk/mediatek/clk-gate.c              |   16 +-
 drivers/clk/mediatek/clk-gate.h              |    8 +-
 drivers/clk/mediatek/clk-mt2701-aud.c        |   26 +-
 drivers/clk/mediatek/clk-mt2701-eth.c        |   34 +-
 drivers/clk/mediatek/clk-mt2701-g3d.c        |   56 +-
 drivers/clk/mediatek/clk-mt2701-hif.c        |   36 +-
 drivers/clk/mediatek/clk-mt2701-mm.c         |    2 +-
 drivers/clk/mediatek/clk-mt2701.c            |   12 +-
 drivers/clk/mediatek/clk-mt2712-mm.c         |    2 +-
 drivers/clk/mediatek/clk-mt2712.c            |   89 +-
 drivers/clk/mediatek/clk-mt6765.c            |    8 +-
 drivers/clk/mediatek/clk-mt6779-mm.c         |    2 +-
 drivers/clk/mediatek/clk-mt6779.c            |   50 +-
 drivers/clk/mediatek/clk-mt6795-infracfg.c   |    6 +-
 drivers/clk/mediatek/clk-mt6795-mm.c         |    3 +-
 drivers/clk/mediatek/clk-mt6795-pericfg.c    |    5 +-
 drivers/clk/mediatek/clk-mt6795-topckgen.c   |   84 +-
 drivers/clk/mediatek/clk-mt6797-mm.c         |    2 +-
 drivers/clk/mediatek/clk-mt6797.c            |    4 +-
 drivers/clk/mediatek/clk-mt7622-aud.c        |   49 +-
 drivers/clk/mediatek/clk-mt7622-eth.c        |   82 +-
 drivers/clk/mediatek/clk-mt7622-hif.c        |   85 +-
 drivers/clk/mediatek/clk-mt7622.c            |   16 +-
 drivers/clk/mediatek/clk-mt7629-eth.c        |    5 +-
 drivers/clk/mediatek/clk-mt7629-hif.c        |   85 +-
 drivers/clk/mediatek/clk-mt7629.c            |   12 +-
 drivers/clk/mediatek/clk-mt7986-eth.c        |    6 +-
 drivers/clk/mediatek/clk-mt7986-infracfg.c   |    4 +-
 drivers/clk/mediatek/clk-mt7986-topckgen.c   |   98 +-
 drivers/clk/mediatek/clk-mt8135.c            |    8 +-
 drivers/clk/mediatek/clk-mt8167-aud.c        |    2 +-
 drivers/clk/mediatek/clk-mt8167-img.c        |    2 +-
 drivers/clk/mediatek/clk-mt8167-mfgcfg.c     |    2 +-
 drivers/clk/mediatek/clk-mt8167-mm.c         |    2 +-
 drivers/clk/mediatek/clk-mt8167-vdec.c       |    3 +-
 drivers/clk/mediatek/clk-mt8167.c            |    6 +-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c |  157 +++
 drivers/clk/mediatek/clk-mt8173-img.c        |   55 +
 drivers/clk/mediatek/clk-mt8173-infracfg.c   |  154 +++
 drivers/clk/mediatek/clk-mt8173-mm.c         |    2 +-
 drivers/clk/mediatek/clk-mt8173-pericfg.c    |  122 ++
 drivers/clk/mediatek/clk-mt8173-topckgen.c   |  653 ++++++++++
 drivers/clk/mediatek/clk-mt8173-vdecsys.c    |   57 +
 drivers/clk/mediatek/clk-mt8173-vencsys.c    |   64 +
 drivers/clk/mediatek/clk-mt8173.c            | 1125 ------------------
 drivers/clk/mediatek/clk-mt8183-audio.c      |   19 +-
 drivers/clk/mediatek/clk-mt8183-mm.c         |    2 +-
 drivers/clk/mediatek/clk-mt8183.c            |  119 +-
 drivers/clk/mediatek/clk-mt8186-mcu.c        |    2 +-
 drivers/clk/mediatek/clk-mt8186-mm.c         |    3 +-
 drivers/clk/mediatek/clk-mt8186-topckgen.c   |  112 +-
 drivers/clk/mediatek/clk-mt8192-aud.c        |   24 +-
 drivers/clk/mediatek/clk-mt8192-mm.c         |    3 +-
 drivers/clk/mediatek/clk-mt8192.c            |  183 +--
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c |    3 +-
 drivers/clk/mediatek/clk-mt8195-topckgen.c   |    7 +-
 drivers/clk/mediatek/clk-mt8195-vdo0.c       |    3 +-
 drivers/clk/mediatek/clk-mt8195-vdo1.c       |    3 +-
 drivers/clk/mediatek/clk-mt8365-mm.c         |    5 +-
 drivers/clk/mediatek/clk-mt8365.c            |    9 +-
 drivers/clk/mediatek/clk-mt8516-aud.c        |    2 +-
 drivers/clk/mediatek/clk-mt8516.c            |    6 +-
 drivers/clk/mediatek/clk-mtk.c               |  133 ++-
 drivers/clk/mediatek/clk-mtk.h               |   33 +-
 drivers/clk/mediatek/clk-mux.c               |    9 +-
 drivers/clk/mediatek/clk-mux.h               |    3 +-
 include/dt-bindings/clock/mt2701-clk.h       |    3 +
 include/dt-bindings/clock/mt6779-clk.h       |    3 +
 include/dt-bindings/clock/mt8173-clk.h       |    3 +
 73 files changed, 1920 insertions(+), 2121 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8173-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8173-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt8173-infracfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8173-pericfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8173-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt8173-vdecsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8173-vencsys.c
 delete mode 100644 drivers/clk/mediatek/clk-mt8173.c

-- 
2.39.0


