Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7B2C64EC7
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Feb 2023 09:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kpSiX+Ch3K3DG82dTWHs1KrCJ7bKDMWnHZOHhDvLqjE=; b=1qa+Gtxrb4nNJirEfXeM6iIDhZ
	UKtQOEmsG55w3iSGqRAcTj565L7TLjuLQSM56WPDAOQX4JbdGad84vgG4ZXqZ+lKVcVXI4VxsJ/dW
	4c1IzPn2IoI2KFurl+diVlJrLdx1db3xe+FnCPaoRK0+auNZPBdnkPZmaNAIOZnAIkC2kA9yeM57l
	K77YCCx12kR8WxAgVqtXFM+VFPv1v8iK4FuHzAbtakARkgiHOGkNRfODCt2dRhsO6PbjzIL6x6Iu2
	aLnxW+n4cL2Y9osKsKQ7DyRNdNUUQmsKv3o6dy1hZqJ9xbWN6l97xZ61TIb/MgidartFnXz9VZzaY
	uABQgDdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVr6g-005NaH-FJ; Sat, 25 Feb 2023 09:44:42 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVr6d-005NZG-1B; Sat, 25 Feb 2023 09:44:40 +0000
Received: by mail-ed1-x532.google.com with SMTP id h16so6635100edz.10;
        Sat, 25 Feb 2023 01:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kpSiX+Ch3K3DG82dTWHs1KrCJ7bKDMWnHZOHhDvLqjE=;
        b=L8yNZMz2lUKp55CoI/P5ILvkS07Fd+3ffcxzVOi7k2wQgdjPIbOqMl79YnFcjuLqUb
         2advNios1Y+qXq0iKJL2R2ynHOAc8cL0YlOJreg6FyUCBfLWzL3PiJH4+JccOu2la0ha
         0ItIJ+hjw0a+v0U2X5K3aw32QBmB9+Yh8EuDZCOrpcdkgMXzXCjEhOWKu908Mby5XoGB
         nF1GtsEC+twxPGL4nRBDsam9nIuanLMFdtIx6ddcTXNmapQvbcTOJFsCw5f8Y/v5i+/0
         7HJTUMObiMSDaEtF4MMprseEyvybXfSFE7Srad9474H51uNZmRI3Bo4BA4QyMAHq639z
         jtqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpSiX+Ch3K3DG82dTWHs1KrCJ7bKDMWnHZOHhDvLqjE=;
        b=efc5l+hO6eatHVihOTJgTP1RUAaWlMNIuJ/tJQFoybiit1typ9aKGqsptOL84ovlMO
         GEfQXFL1fJG5/PhmeQwTjGO0/qKQj8W9UopH/0FsycWKrALVNeyDIqGrLmGdr0Bzlcu9
         KhUgOi7BBjZLXmktnbcESAeRq2BYnSCw3cr7MKqfpeh0qoSvLcswqZVyNPQQAGB33p9x
         rfBiBVc2xDstErDU/jUDKCd1WL39NUqrhDk45NXZUAkAbNoFSiZsGIusUCMeByjasdmb
         fBFOMjLRgYcHLna+9hUGomjbZi8CathG1X6NjcLTFJWzwXKxm08kCxqmfPzuDICWJ4kl
         dU4Q==
X-Gm-Message-State: AO0yUKUdr6IiS5Ojnc1N31Ue+y8wuG5fmiMa3BtCfachHpulPMRATxiw
	z4Nn5rErjqJnLrql9XvDQKc=
X-Google-Smtp-Source: AK7set9+Xgh0cE06K4X3mgz9u24bqVJ4GpTOEj1fhk9LgxQm94r3LHbSBgyuUTyyO09qQbCb4lPHJQ==
X-Received: by 2002:a17:906:1747:b0:8b1:3d15:1e2c with SMTP id d7-20020a170906174700b008b13d151e2cmr24479933eje.9.1677318276056;
        Sat, 25 Feb 2023 01:44:36 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id va13-20020a17090711cd00b008b23b22b062sm653649ejb.114.2023.02.25.01.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 01:44:35 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/4] MediaTek MT6735 main clock and reset drivers
Date: Sat, 25 Feb 2023 12:42:42 +0300
Message-Id: <20230225094246.261697-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_014439_120300_D90B4BCB 
X-CRM114-Status: GOOD (  18.71  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

These patches are part of a larger effort to support the MT6735 SoC family in mainline
Linux. More patches (unsent or sent and pending review or revision) can be found here[1].

This series adds support for the main clock and reset controllers on the
Mediatek MT6735 SoC:
- apmixedsys (global PLLs)
- topckgen (global divisors and muxes)
- infracfg (gates and resets for internal components)
- pericfg (gates and resets for peripherals)

MT6735 has other more specialized clock/reset controllers, support for which is
not included in this series:
- mfgcfg (GPU)
- imgsys (camera)
- mmsys (display)
- vdecsys (video decoder)
- vencsys (video encoder)
- audsys (audio)

Changes since v2:
- Add "CLK_" prefix to infracfg and pericfg clock definitions to avoid possible
  clashes with reset bindings.
- Replace "_RST" suffix with "RST_" prefix to maintain consistency with clock bindings.
- Use macros to define clocks.
- Abandon mtk_clk_simple_probe/mtk_clk_simple_remove in favor of custom functions in apmixedsys
  and topckgen drivers for the time being. 
- Capitalize T in MediaTek in MODULE_DESCRIPTION.
Changes since v1:
- Rebase on some pending patches.
- Move common clock improvements to a separate series.
- Use mtk_clk_simple_probe/remove after making them support several clock types
  in said series.
- Combine all 4 drivers into one patch, and use one Kconfig symbol for all
  following a conversation seen on a different series[2].
- Correct APLL2 registers in apmixedsys driver (were offset backwards by 0x4).
- Make irtx clock name lower case to match the other clocks.

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging
[2] https://lore.kernel.org/linux-mediatek/CAGXv+5H4gF5GXzfk8mjkG4Kry8uCs1CQbKoViBuc9LC+XdHH=A@mail.gmail.com/

Yassine Oudjana (4):
  dt-bindings: clock: Add MediaTek MT6735 clock bindings
  dt-bindings: reset: Add MediaTek MT6735 reset bindings
  dt-bindings: arm: mediatek: Add MT6735 clock controller compatibles
  clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset
    drivers

 .../arm/mediatek/mediatek,infracfg.yaml       |   8 +-
 .../arm/mediatek/mediatek,pericfg.yaml        |   1 +
 .../bindings/clock/mediatek,apmixedsys.yaml   |   4 +-
 .../bindings/clock/mediatek,topckgen.yaml     |   4 +-
 MAINTAINERS                                   |  16 +
 drivers/clk/mediatek/Kconfig                  |   9 +
 drivers/clk/mediatek/Makefile                 |   1 +
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c  | 139 ++++++
 drivers/clk/mediatek/clk-mt6735-infracfg.c    |  78 +++
 drivers/clk/mediatek/clk-mt6735-pericfg.c     |  91 ++++
 drivers/clk/mediatek/clk-mt6735-topckgen.c    | 450 ++++++++++++++++++
 .../clock/mediatek,mt6735-apmixedsys.h        |  16 +
 .../clock/mediatek,mt6735-infracfg.h          |  25 +
 .../clock/mediatek,mt6735-pericfg.h           |  37 ++
 .../clock/mediatek,mt6735-topckgen.h          |  79 +++
 .../reset/mediatek,mt6735-infracfg.h          |  31 ++
 .../reset/mediatek,mt6735-pericfg.h           |  31 ++
 17 files changed, 1015 insertions(+), 5 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt6735-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-infracfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-pericfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-topckgen.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-infracfg.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-pericfg.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-topckgen.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-infracfg.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-pericfg.h

-- 
2.39.2


