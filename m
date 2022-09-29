Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E44CC04A95
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 07:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TNaR/+pz7Hg0YfceN1LSKGgvcAeNNA3RzZ4ATYe1Ozg=; b=BIfbjDD1C9UELcIDxpRRx/8PWX
	ruV+9kYKaQGVt0qQEQZHhuIYjavuXot6AShNstLFiCEB8dv7maZTy2wqgErOMqifgQhCLD49+JQ+o
	5tB8M8DTLgeRNcXC1L+2bZBkLXJDDu/ImTbWG3g4g96Pdphn2620okFxRtoJzTd3skUYvMGtuVhCE
	xnPYR4DgcL2QhLcyL0XRIFDtgxgERorGvictO+Ra20KA2R0umJwd+QIr9iDJZ7nPFdQC6ZMo5m1kY
	UzHpBeZKu7A9vLH9PJ7IMJTYjwU7bJe24L4IjyDuvnhIrtGWeeQLILQjYGLwWtuQ51jvtlF3LgA/a
	l6iY33kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odoG2-001eTk-Rc; Thu, 29 Sep 2022 07:46:58 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odoFz-001eSM-Nh
	for linux-mediatek@lists.infradead.org; Thu, 29 Sep 2022 07:46:57 +0000
Received: by mail-pl1-x636.google.com with SMTP id f23so582984plr.6
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Sep 2022 00:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date;
        bh=TNaR/+pz7Hg0YfceN1LSKGgvcAeNNA3RzZ4ATYe1Ozg=;
        b=cktwDTaa5g3oaNOGR/nLpIpNTgybXYwMT/BIF8F9RBN7xBYniG+zkLkajmmn1HCC+J
         M7vlGWeQ1+sqGp5kVs5MPMWfYCmgQAYrEgdTwv4aHvT2v6D4vEFEbsYH75vt/YvAcnw4
         la03fyCdjgfsHK6/Et/e23zknbkR9Z7CCNgz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=TNaR/+pz7Hg0YfceN1LSKGgvcAeNNA3RzZ4ATYe1Ozg=;
        b=kB0Y96TT64MKqBnTvp7f3RFzZfSxS61Z3ahy6NPd0O/7nVpu7IA6BZDO6zfbeMRTNJ
         9f3guZmiRb1suLnl5e8401oJScTwBq5ixVEGeCrsHe8FVu3y3GsMcR6bVhiEdDkB8eVY
         FCS3BDBKl7B1TfYaDNfCvCQWwDlhAUNnYBFxWvK3rJq+uvbWcVZLgYiZ011EsiQXWYvV
         PM7pd5OFg5MrqOH2aCZ5ORny0X1lhG7jhpKkihtDa1hF2aWzzv8VyzVH9mMe8O0ip88g
         0bWCXMtStUV0Ihf0jOuqUW5D1dMF3YtUV4HOLYCo3hISskGzDvbP4seXGXR4zI6xN1k1
         6YLA==
X-Gm-Message-State: ACrzQf3OgNz3X8Omr9W1YhfrcPo+jBOfE3uoM3OOMxqB1qcLxpMazU8U
	ZUIUn2qOYGd8m91bzpCBr028wQ==
X-Google-Smtp-Source: AMsMyM7sKhjEa98Ymh0uWoFFOv/jllvMlkdfLEAffc4nUBHzT8N5D0LGfhDRNCxIobBHr/t4Kp1JCA==
X-Received: by 2002:a17:902:6b41:b0:178:a475:6641 with SMTP id g1-20020a1709026b4100b00178a4756641mr2205346plt.120.1664437611030;
        Thu, 29 Sep 2022 00:46:51 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:13a9:39f3:3979:b1d6])
        by smtp.gmail.com with ESMTPSA id a18-20020a634d12000000b0043c7996f7f0sm4923659pgb.58.2022.09.29.00.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 00:46:50 -0700 (PDT)
Date: Thu, 29 Sep 2022 15:46:47 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Miles Chen <miles.chen@mediatek.com>
Subject: [GIT PULL] MediaTek Clock Changes for 6.1
Message-ID: <YzVNZzp6+S7ePIRr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_004655_830316_EA5A8A88 
X-CRM114-Status: GOOD (  13.97  )
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

The following changes since commit 3cc53c57d0d54b7fc307879443d555c95b466510:

  clk: mediatek: mt8195: Add reset idx for USB/PCIe T-PHY (2022-08-31 18:16:45 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git tags/mtk-clk-for-6.1

for you to fetch changes up to 99f3a5e851e9a1d82d73c4f396c6dbf123413c16:

  clk: mediatek: mt8192: deduplicate parent clock lists (2022-09-29 12:27:33 +0800)

----------------------------------------------------------------
MediaTek clk driver changes for 6.1

A lot of clean up work, as well as new drivers and new functions

- New clock drivers for MediaTek Helio X10 MT6795
- Add missing DPI1_HDMI clock in MT8195 VDOSYS1
- Clock driver changes to support GPU DVFS on MT8183, MT8192, MT8195
  - Fix GPU clock topology on MT8195
  - Propogate rate changes from GPU clock gate up the tree
  - Clock mux notifiers for GPU-related PLLs
- Conversion of more "simple" drivers to mtk_clk_simple_probe()
- Hook up mtk_clk_simple_remove() for "simple" MT8192 clock drivers
- Fixes to previous |struct clk| to |struct clk_hw| conversion
- Shrink MT8192 clock driver by deduplicating clock parent lists

----------------------------------------------------------------
AngeloGioacchino Del Regno (14):
      dt-bindings: mediatek: Document MT6795 system controllers bindings
      dt-bindings: clock: Add MediaTek Helio X10 MT6795 clock bindings
      dt-bindings: reset: Add bindings for MT6795 Helio X10 reset controllers
      dt-bindings: clock: mediatek: Add clock driver bindings for MT6795
      clk: mediatek: clk-apmixed: Remove unneeded __init annotation
      clk: mediatek: Export required symbols to compile clk drivers as module
      clk: mediatek: clk-apmixed: Add helper function to unregister ref2usb_tx
      clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers
      clk: mediatek: clk-mt8195-mfg: Reparent mfg_bg3d and propagate rate changes
      clk: mediatek: clk-mt8195-topckgen: Register mfg_ck_fast_ref as generic mux
      clk: mediatek: clk-mt8195-topckgen: Add GPU clock mux notifier
      clk: mediatek: clk-mt8195-topckgen: Drop univplls from mfg mux parents
      clk: mediatek: clk-mt8192-mfg: Propagate rate changes to parent
      clk: mediatek: clk-mt8192: Add clock mux notifier for mfg_pll_sel

Chen-Yu Tsai (6):
      clk: mediatek: mt8183: mfgcfg: Propagate rate changes to parent
      clk: mediatek: mux: add clk notifier functions
      clk: mediatek: mt8183: Add clk mux notifier for MFG mux
      clk: mediatek: fix unregister function in mtk_clk_register_dividers cleanup
      clk: mediatek: Migrate remaining clk_unregister_*() to clk_hw_unregister_*()
      clk: mediatek: mt8192: deduplicate parent clock lists

Miles Chen (7):
      clk: mediatek: mt2701: use mtk_clk_simple_probe to simplify driver
      clk: mediatek: mt2712: use mtk_clk_simple_probe to simplify driver
      clk: mediatek: mt6765: use mtk_clk_simple_probe to simplify driver
      clk: mediatek: mt6779: use mtk_clk_simple_probe to simplify driver
      clk: mediatek: mt6797: use mtk_clk_simple_probe to simplify driver
      clk: mediatek: mt8183: use mtk_clk_simple_probe to simplify driver
      clk: mediatek: mt8192: add mtk_clk_simple_remove

Pablo Sun (2):
      dt-bindings: clk: mediatek: Add MT8195 DPI clocks
      clk: mediatek: add VDOSYS1 clock

Yassine Oudjana (2):
      clk: mediatek: gate: Export mtk_clk_register_gates_with_dev
      clk: mediatek: Use mtk_clk_register_gates_with_dev in simple probe

 .../bindings/arm/mediatek/mediatek,infracfg.yaml   |   2 +
 .../bindings/arm/mediatek/mediatek,mmsys.yaml      |   1 +
 .../bindings/arm/mediatek/mediatek,pericfg.yaml    |   1 +
 .../bindings/clock/mediatek,apmixedsys.yaml        |   1 +
 .../bindings/clock/mediatek,mt6795-clock.yaml      |  66 +++
 .../bindings/clock/mediatek,mt6795-sys-clock.yaml  |  54 ++
 .../bindings/clock/mediatek,topckgen.yaml          |   1 +
 drivers/clk/mediatek/Kconfig                       |  37 ++
 drivers/clk/mediatek/Makefile                      |   6 +
 drivers/clk/mediatek/clk-apmixed.c                 |  12 +-
 drivers/clk/mediatek/clk-cpumux.c                  |   2 +
 drivers/clk/mediatek/clk-gate.c                    |   1 +
 drivers/clk/mediatek/clk-mt2701-bdp.c              |  36 +-
 drivers/clk/mediatek/clk-mt2701-img.c              |  36 +-
 drivers/clk/mediatek/clk-mt2701-vdec.c             |  36 +-
 drivers/clk/mediatek/clk-mt2712-bdp.c              |  34 +-
 drivers/clk/mediatek/clk-mt2712-img.c              |  34 +-
 drivers/clk/mediatek/clk-mt2712-jpgdec.c           |  34 +-
 drivers/clk/mediatek/clk-mt2712-mfg.c              |  34 +-
 drivers/clk/mediatek/clk-mt2712-vdec.c             |  34 +-
 drivers/clk/mediatek/clk-mt2712-venc.c             |  34 +-
 drivers/clk/mediatek/clk-mt6765-audio.c            |  34 +-
 drivers/clk/mediatek/clk-mt6765-cam.c              |  33 +-
 drivers/clk/mediatek/clk-mt6765-img.c              |  33 +-
 drivers/clk/mediatek/clk-mt6765-mipi0a.c           |  34 +-
 drivers/clk/mediatek/clk-mt6765-mm.c               |  33 +-
 drivers/clk/mediatek/clk-mt6765-vcodec.c           |  34 +-
 drivers/clk/mediatek/clk-mt6779-aud.c              |  29 +-
 drivers/clk/mediatek/clk-mt6779-cam.c              |  29 +-
 drivers/clk/mediatek/clk-mt6779-img.c              |  29 +-
 drivers/clk/mediatek/clk-mt6779-ipe.c              |  29 +-
 drivers/clk/mediatek/clk-mt6779-mfg.c              |  27 +-
 drivers/clk/mediatek/clk-mt6779-vdec.c             |  29 +-
 drivers/clk/mediatek/clk-mt6779-venc.c             |  29 +-
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c       | 157 ++++++
 drivers/clk/mediatek/clk-mt6795-infracfg.c         | 151 +++++
 drivers/clk/mediatek/clk-mt6795-mfg.c              |  50 ++
 drivers/clk/mediatek/clk-mt6795-mm.c               | 132 +++++
 drivers/clk/mediatek/clk-mt6795-pericfg.c          | 160 ++++++
 drivers/clk/mediatek/clk-mt6795-topckgen.c         | 610 +++++++++++++++++++++
 drivers/clk/mediatek/clk-mt6795-vdecsys.c          |  55 ++
 drivers/clk/mediatek/clk-mt6795-vencsys.c          |  50 ++
 drivers/clk/mediatek/clk-mt6797-img.c              |  36 +-
 drivers/clk/mediatek/clk-mt6797-vdec.c             |  36 +-
 drivers/clk/mediatek/clk-mt6797-venc.c             |  36 +-
 drivers/clk/mediatek/clk-mt8183-cam.c              |  27 +-
 drivers/clk/mediatek/clk-mt8183-img.c              |  27 +-
 drivers/clk/mediatek/clk-mt8183-ipu0.c             |  27 +-
 drivers/clk/mediatek/clk-mt8183-ipu1.c             |  27 +-
 drivers/clk/mediatek/clk-mt8183-ipu_adl.c          |  27 +-
 drivers/clk/mediatek/clk-mt8183-ipu_conn.c         |  27 +-
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c           |  35 +-
 drivers/clk/mediatek/clk-mt8183-vdec.c             |  27 +-
 drivers/clk/mediatek/clk-mt8183-venc.c             |  27 +-
 drivers/clk/mediatek/clk-mt8183.c                  |  28 +
 drivers/clk/mediatek/clk-mt8192-cam.c              |   1 +
 drivers/clk/mediatek/clk-mt8192-img.c              |   1 +
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c     |   1 +
 drivers/clk/mediatek/clk-mt8192-ipe.c              |   1 +
 drivers/clk/mediatek/clk-mt8192-mdp.c              |   1 +
 drivers/clk/mediatek/clk-mt8192-mfg.c              |   7 +-
 drivers/clk/mediatek/clk-mt8192-msdc.c             |   1 +
 drivers/clk/mediatek/clk-mt8192-scp_adsp.c         |   1 +
 drivers/clk/mediatek/clk-mt8192-vdec.c             |   1 +
 drivers/clk/mediatek/clk-mt8192-venc.c             |   1 +
 drivers/clk/mediatek/clk-mt8192.c                  | 234 ++------
 drivers/clk/mediatek/clk-mt8195-mfg.c              |   6 +-
 drivers/clk/mediatek/clk-mt8195-topckgen.c         |  46 +-
 drivers/clk/mediatek/clk-mt8195-vdo1.c             |  11 +
 drivers/clk/mediatek/clk-mtk.c                     |  17 +-
 drivers/clk/mediatek/clk-mtk.h                     |   1 +
 drivers/clk/mediatek/clk-mux.c                     |  38 ++
 drivers/clk/mediatek/clk-mux.h                     |  15 +
 drivers/clk/mediatek/reset.c                       |   1 +
 include/dt-bindings/clock/mediatek,mt6795-clk.h    | 275 ++++++++++
 include/dt-bindings/clock/mt8195-clk.h             |   4 +-
 include/dt-bindings/reset/mediatek,mt6795-resets.h |  53 ++
 77 files changed, 2509 insertions(+), 858 deletions(-)
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

