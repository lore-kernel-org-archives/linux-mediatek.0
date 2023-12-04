Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA1BC10DC3
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OSbK53fPx2M4UyMXuvtFTsva3e/34kZVsYfj7kI8Z58=; b=KJWkRCVubXBupOkvb+z4S6hoK9
	CyArrlnYtB+Di19ZsXdiGk0Tmk0csYCKb4zNJaEzKwYlRf4hQjyoPubQwyVHmOFRnt7njXixOScXB
	QaBXEOufoDkvLNqjcQfJQi8RWqsczJZPAsbPcDlq1YrWCbT+BVPLUUoopsHkE65ncxfR2A6ret35e
	S3WawHEL6YoiBThqp59QlsbaqF0J+sjfMQPKNE/3NDoRrmqFV2tewOmUPvyRme6wFSWetxx+nrRQ7
	XRyHZNuHXx5TIBpElRKGf5omW+VVqyN/OsYK32Uj9PQ/SOFtcVL+/6/Ehh6zrJDR8KiXBgitsrecu
	FmDGYuag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4X2-003IGL-1C;
	Mon, 04 Dec 2023 08:42:24 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4Wy-003IEa-1t
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 08:42:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d04d286bc0so13334685ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 00:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701679339; x=1702284139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OSbK53fPx2M4UyMXuvtFTsva3e/34kZVsYfj7kI8Z58=;
        b=isRIE5YSN+fymHOztc+Eviulojt6xv75gAwBYD7t1eBEAJ37U64oqAuaVB1dL+DRzy
         2uUV4iuhQZK4/E/3Er2JoVIndZMOYyyzr51psDidtE1PJcXUzBtzVcMEPMGvdmSZuFHK
         r/K9lIszcvcvWQowLm1aVdEqLRnLzt1oSroIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701679339; x=1702284139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSbK53fPx2M4UyMXuvtFTsva3e/34kZVsYfj7kI8Z58=;
        b=V3MXmXOZl3IBuKrf6mBwplBaIdMULAKfpoTlwPHit3QWFT1f2iJP9+G/aBVxU6j37h
         1mEtnXJ70J0ibLyToyJ78M8ke9skFJZl3Kfh8BUrM9CdlYFDLSTypj4j2/SuYPemoBUZ
         YM/gjPTdCg6WRsJWcMhs7nwIte4/4UWIqdGvfVUenMQcD6YA4VsMLn1svQSB1QanH4dm
         jdYWtM8yItAMh8nNKi0WTPY5mvrBhzFhlS3YnqirYQ0kvRJR7zr73PHShphHsc2IYXj/
         mq2B2cTIMQC2VV16o0/b2ezNkBK09KYzQWj2w1ZpzlQK6ctEPhPU1V+0Yhlg/8CFbYFP
         q8yQ==
X-Gm-Message-State: AOJu0YzvuDFOP4o8DwEfmMPTU1XbeBekF9hOBBbm8Vxc/BrTbtAp1arI
	iB0zdgcU/ijBZD3wGktXZY0yug==
X-Google-Smtp-Source: AGHT+IEzVGnUikV9DvhGxehq6PF1bfD6d4j4pJfg9i7SaJCT64jWxu68Zg68dKkcqVU+YFXPf2qBDA==
X-Received: by 2002:a17:902:7c8a:b0:1cf:fe32:632f with SMTP id y10-20020a1709027c8a00b001cffe32632fmr1320665pll.22.1701679338791;
        Mon, 04 Dec 2023 00:42:18 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6084:72e2:9ac2:f115])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709028a8e00b001cfc3f73927sm7871795plo.9.2023.12.04.00.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 00:42:18 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] arm64: dts: mediatek: Add MT8186 Corsola Chromebooks
Date: Mon,  4 Dec 2023 16:40:02 +0800
Message-ID: <20231204084012.2281292-1-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_004220_627172_FB3346B3 
X-CRM114-Status: GOOD (  19.31  )
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

Hi everyone,

This is v3 of the MT8186 Chromebook device tree series.

Changes since v2:
- Picked up Conor's ack
- Renamed remaining "touchpad" nodes to "trackpad"
- Dropped pinctrl from tentacruel/tentacool second source trackpad

Changes since v1:
- Reorder SKU numbers in descending order.
- Fixed pinconfig node names
- Moved pinctrl-* properties after interrupts-*
- Switched to interrupts-extended for external components
- Marked ADSP as explicitly disabled, with a comment explaining that it
  stalls the system
- Renamed "touchpad" to "trackpad"
- Dropped bogus "no-laneswap" property from it6505 node
- Moved "realtek,jd-src" property to after all the regulator supplies
- Switched to macros for MT6366 regulator "regulator-allowed-modes"
- Renamed "vgpu" regulator name to allow coupling, with a comment
  containing the name used in the design
- Renamed "cr50" node name to "tpm"
- Moved trackpad_pins reference up to i2c2; workaround for second source
  component resource sharing.
- Fix copyright year
- Fixed touchscreen supply name
- Mark missing components as disabled instead of deleting the node
- Dropped reset-gpios from touchscreen nodes
- Drop status = "okay", which is the default


This series adds device trees for the various MT8186 Chromebooks that
were initially released. These are the Tentacruel / Tentacool devices
released by ASUS, and the Steelix / Rusty / Magneton devices released
by Lenovo. The device trees are taken from the downstream ChromeOS v5.15
kernel, ported to mainline and cleaned up.

Corsola is the Google codename given to the MT8186 platform. This
platform has two reference designs, Krabby and Kingler. Kingler was not
used in any actual product, and is therefor not included. Steelix is
an alternative design put forward and is effectively a mix-and-match of
the two reference designs.

Most of the core design is shared between the variants. The differences
are on which external components, such as the display bridges, are used.

Patch 1 cleans up the current list of MediaTek boards. The entries are
reordered by SoC model first, then by board name.

Patch 2 through 5 add DT binding entries for the Tentacruel/Tentacool,
Steelix, Rusty, and Magneton Chromebooks.

Patch 6 through 9 add board device tree files for these devices. Patch 6
also adds the corsola dtsi file for the commonalities between the designs,
as well as a dtsi file for the krabby reference design.

Currently external display support is missing. Audio is not working, as
enabling the audio DSP causes my test systems to hang.

Please have a look and test if possible.


Regards
ChenYu

Chen-Yu Tsai (9):
  dt-bindings: arm: mediatek: Sort entries by SoC then board compatibles
  dt-bindings: arm: mediatek: Add MT8186 Tentacruel / Tentacool
    Chromebooks
  dt-bindings: arm: mediatek: Add MT8186 Steelix Chromebook
  dt-bindings: arm: mediatek: Add MT8186 Rusty Chromebook
  dt-bindings: arm: mediatek: Add MT8186 Magneton Chromebooks
  arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel /
    Tentacool
  arm64: dts: mediatek: Introduce MT8186 Steelix
  arm64: dts: mediatek: Add MT8186 Steelix platform based Rusty
  arm64: dts: mediatek: Add MT8186 Magneton Chromebooks

 .../devicetree/bindings/arm/mediatek.yaml     |  180 +-
 arch/arm64/boot/dts/mediatek/Makefile         |   10 +
 .../dts/mediatek/mt8186-corsola-krabby.dtsi   |  129 ++
 .../mt8186-corsola-magneton-sku393216.dts     |   39 +
 .../mt8186-corsola-magneton-sku393217.dts     |   39 +
 .../mt8186-corsola-magneton-sku393218.dts     |   26 +
 .../mt8186-corsola-rusty-sku196608.dts        |   26 +
 .../mt8186-corsola-steelix-sku131072.dts      |   18 +
 .../mt8186-corsola-steelix-sku131073.dts      |   18 +
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |  195 ++
 .../mt8186-corsola-tentacool-sku327681.dts    |   57 +
 .../mt8186-corsola-tentacool-sku327683.dts    |   24 +
 .../mt8186-corsola-tentacruel-sku262144.dts   |   44 +
 .../mt8186-corsola-tentacruel-sku262148.dts   |   26 +
 .../boot/dts/mediatek/mt8186-corsola.dtsi     | 1719 +++++++++++++++++
 15 files changed, 2489 insertions(+), 61 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi

-- 
2.43.0.rc2.451.g8631bc7472-goog


