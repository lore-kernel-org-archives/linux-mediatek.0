Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96AFC43217
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 17:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GOiHBfmaA8z/8lz5HmFRwUhuxBOZwEnbSHtvAmKlLks=; b=yv6v7X31r8CSekd9clEGWbtOXv
	xTWUVH46cLwZXIjLPgO6zAEn2gZoOBBjN45CO6ecG0Ly8tRsi19yBsQlsaQgmKkkZI+YwXS4oCUB3
	a9ZL6GJfNGmjfZku/7HfI1Iki1pGNTGbj4WP72mvQLapgKh4syjEHDPMUOL02ihn27SYSuSUjvbqv
	YnD24KzDZgXuK3oFbcC/rK78yWDSC3IpRRvYEZXyzBzGbkO+Aesa0av7gtZfszwghUDaTVWL2tHt6
	1DcF8i1oc85/Io5LIau+g5QYuRNgbyLY9tKhF6K+wJf8BuPKiWAOvWm3ciTPdbgdKI7/VWD1ES7do
	5oMEDCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8RQ-00FRv8-Is; Wed, 05 Oct 2022 17:44:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og8RO-00FRuC-6n; Wed, 05 Oct 2022 17:44:19 +0000
Received: by mail-wr1-x429.google.com with SMTP id u10so26898076wrq.2;
        Wed, 05 Oct 2022 10:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=GOiHBfmaA8z/8lz5HmFRwUhuxBOZwEnbSHtvAmKlLks=;
        b=f41LOjaowwAFIOKK1Wtv2Lc0LAIPKpAIhKiF6Vssrb6pni0YVqAU0fw+N0lvbGDTcs
         MT8Kh6FYoKq77cx5YjBl4tcSiNjSDLoDwD22O73C4mmwzzVYxPzLApO4TnUm5sJg2clk
         4SwYXCdbBiUgxLg8W3Z8lA1/S5iMk6/iXjm1WJuv42mjnFQGNnyqLqMrPIOK+KJm2b3a
         WIlnX4YcpyW/bk0Tiv396NcEgjNMJy5enbP8zrjab43rxe9KvhHyBexwBN8QGV3AL6t3
         WhjjUtPOV0WU+bcnKg593+K7qi/eST9i4G+vZvuq01z8CHiu63EWS+lSNPCQYBUXsXZQ
         laYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=GOiHBfmaA8z/8lz5HmFRwUhuxBOZwEnbSHtvAmKlLks=;
        b=TDLDI3c9XZxxHqRpHytBrE5bXwMyGKvfsogyKf6/DyylG/Ske7X5zXuGDaGPbkoYrJ
         jpYBTSO6aiD15vsdVe7ezGW5YkG8xYs2qlEDvuUEIcd293aQKpJ2HFWO3yQjwVQ4LSJU
         VyfD5P/9MmEC62mBrCeC1SABr1rAIUc2003gNWaprUfgSS/KNpILkadCaTg6IGjC8AtU
         SePDQofK29oSPIavSZUkLpW5dEZeqAhXiEJLGl9yl8LXTEbyVFEH2YEJl+ONn6WMK9wN
         AlrWWUlYtpza1uJp6MOswdTrO8z8jss8xekqPHZ2nzbaMdZ5BJ6QTnriT7b52dO2SCCk
         YGbg==
X-Gm-Message-State: ACrzQf0NGYScAJJyRG+VMup6Sq4BPLKXu2d90j7lKhA41KoQ7Iz/zUba
	FaclSeMLUSq1Cgfmz6hlW9I=
X-Google-Smtp-Source: AMsMyM5bTE3xFGk/IM9bs4NZT8IrIpQ2ces6QmIwgSu4k1Rv98OaCFr32CXpgGtu2UAnI/s2XX0Jsw==
X-Received: by 2002:adf:d1e3:0:b0:22a:b9e2:8841 with SMTP id g3-20020adfd1e3000000b0022ab9e28841mr549084wrd.184.1664991853975;
        Wed, 05 Oct 2022 10:44:13 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id c6-20020a5d4146000000b0022a403954c3sm16075491wrq.42.2022.10.05.10.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:44:13 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/10] MediaTek pinctrl DT binding cleanup and MT6735 pinctrl support
Date: Wed,  5 Oct 2022 20:43:33 +0300
Message-Id: <20221005174343.24240-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_104418_271489_CB9890A9 
X-CRM114-Status: GOOD (  16.58  )
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

This series adds a driver for the pin controller found on the MediaTek MT6735
and MT6735M SoCs. The two differ in the last 6 physical pins, which are used
for MSDC2 on MT6735 but don't exist on MT6735M (since MSDC2 doesn't exist on it
to begin with). In preparation to document DT bindings for this pin controller,
the existing documents for MT67xx SoCs are combined into one in order to
eliminate duplicate property definitions and standardize pin configuration node
names. Necessary cleanup is done along the way.

Changes since v1:
 - Combine other documents into existing mediatek,mt6779-pinctrl.yaml
   instead of creating a new document with wild card in its name.
 - Split first patch into smaller patches focused on specific changes.
 - Remove syscon compatible from MT6779 DT to avoid a check error.
 - Fix interrupt count for MT6795.

Yassine Oudjana (10):
  arm64: dts: mediatek: mt6779: Remove syscon compatible from pin
    controller
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve description
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Make gpio-ranges
    optional
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6797
  dt-bindings: pinctrl: mediatek,pinctrl-mt6795: Fix interrupt count
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
  arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT
    bindings
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin
    controller
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6735 pin
    controller bindings
  pinctrl: mediatek: Add MT6735 pinctrl driver

 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  247 +-
 .../pinctrl/mediatek,mt6797-pinctrl.yaml      |  176 -
 .../pinctrl/mediatek,pinctrl-mt6795.yaml      |  224 -
 MAINTAINERS                                   |   10 +-
 arch/arm64/boot/dts/mediatek/mt6779.dtsi      |    2 +-
 arch/arm64/boot/dts/mediatek/mt6797.dtsi      |   20 +-
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  584 +++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
 10 files changed, 4809 insertions(+), 454 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h

-- 
2.38.0


