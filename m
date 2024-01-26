Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90356C47DDB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 08:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LE7g+mEs4EmMyt4VHboAWdRj+3LgbdJ4gLhc76izr6g=; b=b4FJrruDB1dBMkujRsMhMMtZ5q
	HOmcUj5VKjfdsoE0pYVGddXov62ebSh2STnP2Wxzfbz3VgPcrHUBIK1J+rX7Afw+arPH5O434NGZx
	qQNcrsxxLB6gR36WT+5eF40E8e8PEWy5NK2pAcwItMbF+PPponZ5aHZby93VIQZAROI+JGpTCZFPL
	QitRoOk9XQjLUJV+dxfmKZIv9qxqHGLfrDDQynYgNKWIzLyxzLO/wREatwtlipSEh9ou0+VrIsc9j
	jWmAzm5G29qG4Er3A0N/GY5ojNwPhVGs1jXIcmgnAZWhK1ndsmtRB/BMrXhw8z/2xnqh3LzpVb1OS
	wRtPjEUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTHj9-00000003Se6-175O;
	Fri, 26 Jan 2024 08:38:19 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTHj5-00000003Sbp-1985
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 08:38:17 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d746ce7d13so2283765ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jan 2024 00:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706258293; x=1706863093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LE7g+mEs4EmMyt4VHboAWdRj+3LgbdJ4gLhc76izr6g=;
        b=WB6cO9N14ut/18w+b/YXydXGZ1TCzepJzR+ALvNBxipmHmHtoOpeocDgmae7HAxbD4
         FFxRyxJmGAEM/xsYQQUKL2bdcCHLDtY9+QB8r+zqVzbuwZx2Vhnbtpp+MFH2csMl7YYU
         0W8RlqYJKOmpdeKHdpFppAbvqvduEV+2wlupw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706258293; x=1706863093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LE7g+mEs4EmMyt4VHboAWdRj+3LgbdJ4gLhc76izr6g=;
        b=R1T0YTEevRnVC1x3t2Z0969zUhrprPnNkUVGk9vlzh5ye+kIlfvQto8tq7y3vjGFd7
         Lb32IBv0GrLX2RI7yu5+ZMt2AdfXKi4mPDd6O4mrEaSoM5/owh5BWVgWasK/X1wVRW7e
         a5iGbMA2lO0VMj24ulV0g/0co3V16BlFcnYsiM/7JRPcMB28+gB2qdtnPV1y6vXvuGog
         1k+27ItahLkgGkyIwkHR9bLt3DV/983qMaCjTanWiirypWIIwfTEnbjoV4ipL4+shKFF
         lkM93KYQvuc4zCWlBVvZoufaYuGcI1V5kL3umr1MNB5xt9DWHw8ZPerjutK33leGuJp+
         fHOw==
X-Gm-Message-State: AOJu0Yywoyr4e/fXZyjFjiwG9++ZofFN4KkC3tQmBnirkGiaiX34ziIt
	zLbs/jRHcGyBz67OfCUGL/omUp6gMaArv36WRVUBF9thmHxQWUfovvGEJvEvGbG9k1DvVC9bsxY
	=
X-Google-Smtp-Source: AGHT+IH9479eT9ZV5ZGeD7MxCUFXOVWUme3HzZZg1vKYs/E2JQ6acszehvT1G36Pz3F285bmX/WI+g==
X-Received: by 2002:a17:902:7805:b0:1d7:6f15:7869 with SMTP id p5-20020a170902780500b001d76f157869mr1122776pll.73.1706258293199;
        Fri, 26 Jan 2024 00:38:13 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2614:bbbd:8db2:1f54])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902a9c200b001d6ff1795aesm589529plr.8.2024.01.26.00.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 00:38:12 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/9] arm64: dts: mediatek: Add MT8186 Corsola Chromebooks
Date: Fri, 26 Jan 2024 16:37:49 +0800
Message-ID: <20240126083802.2728610-1-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_003815_582679_BEBFB766 
X-CRM114-Status: GOOD (  20.79  )
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

This is v5 of the MT8186 Chromebook device tree series. This series also
depends on MT7921S Bluetooth [1] and IT6505 audio [2] bindings.

Changes since v4:
- Rebase and fit in mt8188-evb in board DT binding
- Change "touchpad" to "trackpad" in descriptions and commit logs
- Drop #address-cells and #size-cells from it6505 and usb_host1 nodes
- Drop "ports" nodes from type-c nodes
- Fix pinmux node names
- Split anx7625 reset and power-en pins into separate pinmux nodes

Not changed: "/delete-node/ trackpad@15" is still present. See patch 6
footer.

Changes since v3:
- Collected reviewed-by from Angelo
- Reorder some properties to conform better to the newly proposed DT
  style guidelines
- Drop unused labels
- Rename bt-sco node name to bt-sco-codec
- Drop i2s*-share properties from afe node
- Drop aud_gpio_tdm_{on,off} pinctrl nodes
- Replace interrupts with interrupts-extended in tpm node
- Enable adsp device

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

[1] https://lore.kernel.org/all/20240126063500.2684087-1-wenst@chromium.org/
[2] https://lore.kernel.org/all/20240126073511.2708574-1-wenst@chromium.org/


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

 .../devicetree/bindings/arm/mediatek.yaml     |  188 +-
 arch/arm64/boot/dts/mediatek/Makefile         |   10 +
 .../dts/mediatek/mt8186-corsola-krabby.dtsi   |  129 ++
 .../mt8186-corsola-magneton-sku393216.dts     |   39 +
 .../mt8186-corsola-magneton-sku393217.dts     |   39 +
 .../mt8186-corsola-magneton-sku393218.dts     |   26 +
 .../mt8186-corsola-rusty-sku196608.dts        |   26 +
 .../mt8186-corsola-steelix-sku131072.dts      |   18 +
 .../mt8186-corsola-steelix-sku131073.dts      |   18 +
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |  199 ++
 .../mt8186-corsola-tentacool-sku327681.dts    |   57 +
 .../mt8186-corsola-tentacool-sku327683.dts    |   24 +
 .../mt8186-corsola-tentacruel-sku262144.dts   |   44 +
 .../mt8186-corsola-tentacruel-sku262148.dts   |   26 +
 .../boot/dts/mediatek/mt8186-corsola.dtsi     | 1681 +++++++++++++++++
 15 files changed, 2459 insertions(+), 65 deletions(-)
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
2.43.0.429.g432eaa2c6b-goog


