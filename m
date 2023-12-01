Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1F9C46CA0
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 07:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fv3gY0OG29Hmko7SRZlGyxeiJZLZTVl1gELlNf1O6QI=; b=3/hlHC4Js1jjKXoc2IZdQYb6On
	ld3PlE8myNTvcB54KpB76LxVneXBqlDDgOInkhzfOFuAPkpbINFBbjiJmp83s0/0CP7MXEX6YADPf
	RkkFM7DsYNOc51xdazpHtWO/3DdSvcHqwetZqa+QfWoEmsuI7lyqcAhv14+c303o8s/m4RwFMACZV
	g5JcC9L2+5TZxX9O3n/TpoJdS36XDIbn0DVP8BYOOYQFibIJ5FYl4WkXAbrQI/e6p7t1e7bEpNe7Z
	l3EXQ7RGm/VEemMG5CghXAcXQa5AwKO2AOdZjAuAQo0BIZOr58vZSNrTLq+x2XzASEqRMwijrDW4u
	YISXV1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xck-00CqRC-0g;
	Fri, 01 Dec 2023 07:07:42 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xcf-00CqOp-22
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Dec 2023 07:07:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cfd78f8a12so1992895ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Nov 2023 23:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701414456; x=1702019256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv3gY0OG29Hmko7SRZlGyxeiJZLZTVl1gELlNf1O6QI=;
        b=lnY4WEDKbpOQdU2N9E2WVNhQvW1jbwvW5SwG5pKm7XqoEmlXeBhgstLwaq9rW4qf2Z
         xevgYQ3mC0slv7CJRGNmaxYsbgJ7Re7xpNBgpj1mgv3OS6ZdmUlH1GsMtdZN1/mTTPIz
         DFyMIZ5FrHKioqIgwM56mUi5cs4s2hzj4VJ7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701414456; x=1702019256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fv3gY0OG29Hmko7SRZlGyxeiJZLZTVl1gELlNf1O6QI=;
        b=oMHN8POzwzwCHtva9kIgotFKZ34+LhrpUwg6CkwWi7bnih4MylV6JCxSFScsl2yRfw
         pTwW3eN2NkO9tl1yNQD6pFtxGpZYa9i212WMZrjRdHSSGt+pTS0mYKax9EJ2wqMANPgm
         oPIth8SebWegg5xa3MX71hJq8czajpvN3Ha/4G24eEEiasz+f3n27/avHmdvAm5CN0n9
         nBLalwIaxyOYSWIYrlURdSFePHdfIwT+CS/KHsRSuYtr1Gmxe6u/sAQhgaw5RfIDjM8a
         sXtEG56192Pjtbd6KEX0miPCeliFJFiAeqSENsyE3MqJ4A1rQauLDigKoFkU7ladk1HZ
         zm2w==
X-Gm-Message-State: AOJu0YznSP29ud6j0HS2BlB+T6vCFJSwKneBnDKQoCOgkxc1uFNFfLAW
	4Bvi35o1f2FbCHJZl4SvSp+IIg==
X-Google-Smtp-Source: AGHT+IGU5QPtH2edM1KVuNuxK9ROVPIwg82oYbBYOyqx9sA5rI0Wvq4Vrofwgf9REIdqNn+xqNfKPA==
X-Received: by 2002:a17:902:7e8d:b0:1d0:569f:eeb with SMTP id z13-20020a1709027e8d00b001d0569f0eebmr541941pla.7.1701414455639;
        Thu, 30 Nov 2023 23:07:35 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:720a:d435:c253:2402])
        by smtp.gmail.com with ESMTPSA id y10-20020a1709027c8a00b001cfa0c04553sm2558684pll.116.2023.11.30.23.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 23:07:35 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] arm64: dts: mediatek: Add MT8186 Corsola Chromebooks
Date: Fri,  1 Dec 2023 15:07:04 +0800
Message-ID: <20231201070719.1229447-1-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_230737_702430_1D884D54 
X-CRM114-Status: GOOD (  18.81  )
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

This is v2 of the MT8186 Chromebook device tree series.

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
 .../mt8186-corsola-tentacool-sku327683.dts    |   26 +
 .../mt8186-corsola-tentacruel-sku262144.dts   |   44 +
 .../mt8186-corsola-tentacruel-sku262148.dts   |   28 +
 .../boot/dts/mediatek/mt8186-corsola.dtsi     | 1719 +++++++++++++++++
 15 files changed, 2493 insertions(+), 61 deletions(-)
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


