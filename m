Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEBAC30653
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 20:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bsME3C7Vr7+mXe6LCLwvVlRdoJqCu5kuUY6joBwriJI=; b=PzG1UCm/u5hHXqcfM90ibMId69
	UopEkUQAYQbpL95qzOY/fjJBpYOLdgRw68nUO3Qjdx4T27ytRuCJRJPF5iKUFffPW7lXjVxsuXs32
	eTA8ubE8r53TJTttjhNICc1VUrISym3XTeD1rxpL5B9FR1SL3ofQ9zNla8QS/TbAtCO3Ob1gTAap0
	R9w9RRvL4eyKQWBrtsxH5W8VYdz3bqhWwsXzawK4AGaD/ZHm5CI9KauNUZUB2PZIJUq01V82Yr4t/
	xv26jnC/GeZ8k1eMVGDuowL+FRyR7JNxOVVNpfcxgEm4HUZ/Aq9H72pM0MZtKmjbdMziCvOkNCuG2
	VGFYs8Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMZBl-00000008CDO-3uQx;
	Wed, 26 Jun 2024 20:24:21 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMZBi-00000008CCk-207p;
	Wed, 26 Jun 2024 20:24:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3672aec418cso654964f8f.0;
        Wed, 26 Jun 2024 13:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719433456; x=1720038256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bsME3C7Vr7+mXe6LCLwvVlRdoJqCu5kuUY6joBwriJI=;
        b=A0DSbDZt0V6EAqb89+bp7p/kxgdIe4+ph71PGGipFxWUXMR6awHWkDhlgRww3pS80u
         upO/TgmSGiN7gchR8jqdxm4/vTSSxQDwDJN2Qc2haE4YOCLwRXKKPVLn1e1iUIDtXXTa
         doPEfT3ayXTV+DJIMQMDrFKxGBgkdAYn4G+U/iSWdfa4ReNmlt5KUuk/wC1ilWQp0nAz
         7QzuDJAiT9a/tluDpycpJ+a8ZtE2S6ps7uXUnnDlz8X8YxJ+JWwOsvN2W3MeOGy5IJyi
         eDIDH1e+wQx1qN6fBhZErolII+zcDNuv+YgezahJrwRclVZoenAfOXEPsO7DRxrzlcXy
         MQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719433456; x=1720038256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsME3C7Vr7+mXe6LCLwvVlRdoJqCu5kuUY6joBwriJI=;
        b=P7DFWXqQyHssyzMZgNcILCsyCblkOiYY8Jp0V5zWEGHxrYxiO483kqIvtCKVguNRAs
         P0a9NYX/KHsE1LS1akVxwGkSMPx0dyX397zNh6cek/n3Xmxe2Kd1Ui05M1Ws1eIvh1+5
         5pc9omdE+Dipac5mYm/pal8uJpGq56LypXw1RLxklO14IbyoGcYxI2d4dI68Pcag+LIt
         rSTH3uGKrltzkCICm3vsDdlWhKPAn15XhcI0cYDgIsFjZt0FcXCK7J945arhsd6JVLwO
         bRZ7uwFBUS1B1Qpd64WHGkTDYPFNzfB8MU6/S3PfJAF4u+TpvQk6EuUY8R7bDWbRL+XT
         zIyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpTFJkSVfHi04g3K8ffTMjZTu0q/1fMQa7g49poR9CFUdu/4O+Dc4+WMI2NJ2Q8YfCXiqzPyBxwe+2axqsiAmufyP3FzMa8V2xk/7Ze4t8b2x6NaukX2VONaOa03VJZkTNxBlZTk8pvmpS/GiDxBoTO1NMt1/deYU=
X-Gm-Message-State: AOJu0YzST9GiwX06IssepmmCvR97mghsDl/QAaloDL3pr9nmOrs2ttm+
	8u+ISiFLyeXyrLdYYTvV3XPVwV3dq9vmq5wF9ptBRm0M9eOe46Jb
X-Google-Smtp-Source: AGHT+IFuEDZNAkJbslUvjSwHyMCpevFNCq8h7B05L4Zk905GkK9klbDhtBZcPP7vaQBfe1NKER+rsA==
X-Received: by 2002:a5d:5f49:0:b0:366:f84b:a9eb with SMTP id ffacd0b85a97d-366f84bac02mr6284099f8f.32.1719433455917;
        Wed, 26 Jun 2024 13:24:15 -0700 (PDT)
Received: from localhost.localdomain ([105.235.128.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f8268sm16630315f8f.79.2024.06.26.13.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 13:24:15 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Golle <daniel@makrotopia.org>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/2] MediaTek MT6735 main clock and reset drivers
Date: Wed, 26 Jun 2024 21:24:03 +0100
Message-ID: <20240626202406.846961-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_132418_625971_7B33186C 
X-CRM114-Status: GOOD (  18.16  )
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

These patches are part of a larger effort to support the MT6735 SoC family in
mainline Linux. More patches (unsent or sent and pending review or revision) can
be found here[1].

This series adds support for the main clock and reset controllers on the
Mediatek MT6735 SoC:
- apmixedsys (global PLLs)
- topckgen (global divisors and muxes)
- infracfg (gates and resets for infrastructure blocks)
- pericfg (gates and resets for peripherals)

MT6735 has other more specialized clock/reset controllers, support for which is
not included in this series:
- mfgcfg (GPU)
- imgsys (camera)
- mmsys (display)
- vdecsys (video decoder)
- vencsys (video encoder)
- audsys (audio)

Changes since v3:
- Squash DT binding patches.
- Use mtk_clk_simple_probe/mtk_clk_simple_remove for topckgen.
- Add MODULE_DEVICE_TABLE in all drivers.
Changes since v2:
- Add "CLK_" prefix to infracfg and pericfg clock definitions to avoid possible
  clashes with reset bindings.
- Replace "_RST" suffix with "RST_" prefix to maintain consistency with clock
  bindings.
- Use macros to define clocks.
- Abandon mtk_clk_simple_probe/mtk_clk_simple_remove in favor of custom
  functions in apmixedsys and topckgen drivers for the time being. 
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

Yassine Oudjana (2):
  dt-bindings: clock: Add MediaTek MT6735 clock and reset bindings
  clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset
    drivers

 .../arm/mediatek/mediatek,infracfg.yaml       |   8 +-
 .../arm/mediatek/mediatek,pericfg.yaml        |   1 +
 .../bindings/clock/mediatek,apmixedsys.yaml   |   4 +-
 .../bindings/clock/mediatek,topckgen.yaml     |   4 +-
 MAINTAINERS                                   |  16 +
 drivers/clk/mediatek/Kconfig                  |   9 +
 drivers/clk/mediatek/Makefile                 |   1 +
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c  | 138 ++++++
 drivers/clk/mediatek/clk-mt6735-infracfg.c    |  79 ++++
 drivers/clk/mediatek/clk-mt6735-pericfg.c     |  92 ++++
 drivers/clk/mediatek/clk-mt6735-topckgen.c    | 394 ++++++++++++++++++
 .../clock/mediatek,mt6735-apmixedsys.h        |  16 +
 .../clock/mediatek,mt6735-infracfg.h          |  25 ++
 .../clock/mediatek,mt6735-pericfg.h           |  37 ++
 .../clock/mediatek,mt6735-topckgen.h          |  79 ++++
 .../reset/mediatek,mt6735-infracfg.h          |  31 ++
 .../reset/mediatek,mt6735-pericfg.h           |  31 ++
 17 files changed, 960 insertions(+), 5 deletions(-)
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
2.45.1


