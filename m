Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12CEC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 11:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tr1BGfvOdCFJAiclb6uFKnVAgjiCUpeqYneiTpw8bsE=; b=MvVQFnZeSko0XVPHejaMAfb0i1
	1lBA/v98AszZR77GwWUGf7gl5BNFWt1tG+3w7GdxxzrbZmwkx8xqPlLpHNxR4KdKA7oyMR0t+xDGy
	0Yris5aiTJ726mZye/uyl9Gb+Qpqr+U3fXXLxBQKewxWOnvxEPf932nYmoNVK4kUtM1xW+76zL309
	UnRPeCwc1Z7C2VZPZfy3Cr4RsK901/3/AvVdBc3AJwiAUDzPLButbEHeWKa6KT1+FgCAcQtVJXsj4
	gTTXcb/xcHvX5ImO/Yj6FudVc50kNj9Pp5aZu2yimDvjXphqmJW7FgOpEQ6hak5YF65ZlFH4XGAep
	hgbVxbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Iv8-0089jX-1i;
	Wed, 29 Nov 2023 11:39:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Iv5-0089i5-0m;
	Wed, 29 Nov 2023 11:39:56 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AF7B6601F02;
	Wed, 29 Nov 2023 11:39:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701257990;
	bh=pH7RUt8IOckoGEbgFhlgxvz/PFthiMUJhJu0F2NKeDc=;
	h=From:To:Cc:Subject:Date:From;
	b=LwBrUqrTal0pEiuZjGMjnfife8jV2A1ujAWw4c9i5/FoPZKvHIgdqZwUlM0TigTyi
	 2BPTvpZMEowzUf41yz9vWTKBkcO5HwfrbrJJ5EmLd33RXtG7Gx3GbPp8ipL7nnVqco
	 L8VUtzsi2mMSOwZ7hNMfsk97wcE/qPMG+FIGfGLF8yvdjlW91iqhXtDrM/aSLCVNO9
	 1oVftWZyEczGVbDaWSoRrI6UGE2eWJ7NShcV2NPaMu6P1ZR309n2LJtmGT69ckC6af
	 fsT0mKxIalFZpNHanWQuD4xxZMNp4dpxnFSwa5UY7/K0IE03CCCsm5uNMizR+oJtTf
	 AoNW+VnVmtc/g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT PULL] MediaTek ARM64 Device Tree fixes for v6.7
Date: Wed, 29 Nov 2023 12:39:05 +0100
Message-ID: <20231129113905.134732-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_033955_433321_922F9ACB 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts64-fixes-for-6.7

for you to fetch changes up to 5943b8f7449df9881b273db07bdde1e7120dccf0:

  arm64: dts: mediatek: cherry: Fix interrupt cells for MT6360 on I2C7 (2023-11-29 10:37:53 +0100)

----------------------------------------------------------------
MediaTek ARM64 DeviceTree fixes for v6.7

Fixes for various MediaTek SoCs, including

MT7986: - eMMC HS400 mode failures
        - Cooling trips for emergency system shutdown
        - BPI-R3 machine SFP power limit and active cooling

MT8173: - EVB device tree unit_address_vs_reg warning

MT8183: - unit_address_vs_reg and simple_bus_reg warnings
        - Kukui device tree nodes naming consistency and
          adhering to bindings
        - Jacuzzi device tree unnecessary cells removed as
          those were producing avoid_unnecessary_addr_size

MT8186: - Power domains faults due to incorrect clocks
        - GPU speed bin nvmem cell name was wrong, producing
          issues with interpreting the speedbin with GPU OPPs

MT8195: - Local Arbiter (and whole system) ability to suspend
        - Cherry device tree interrupts_property warning

...and another unit_address_vs_reg warning on MT7622.

----------------------------------------------------------------
AngeloGioacchino Del Regno (7):
      arm64: dts: mediatek: mt8195: Fix PM suspend/resume with venc clocks
      arm64: dts: mediatek: mt8183: Fix unit address for scp reserved memory
      arm64: dts: mediatek: mt8183-evb: Fix unit_address_vs_reg warning on ntc
      arm64: dts: mediatek: mt8173-evb: Fix regulator-fixed node names
      arm64: dts: mediatek: mt8183: Move thermal-zones to the root node
      arm64: dts: mediatek: mt8186: Change gpu speedbin nvmem cell name
      arm64: dts: mediatek: cherry: Fix interrupt cells for MT6360 on I2C7

Eric Woudstra (1):
      arm64: dts: mt7986: fix emmc hs400 mode without uboot initialization

Eugen Hristev (3):
      arm64: dts: mediatek: mt8186: fix clock names for power domains
      arm64: dts: mediatek: mt7622: fix memory node warning check
      arm64: dts: mediatek: mt8183-kukui-jacuzzi: fix dsi unnecessary cells properties

Frank Wunderlich (2):
      arm64: dts: mt7986: define 3W max power to both SFP on BPI-R3
      arm64: dts: mt7986: change cooling trips

Hsin-Yi Wang (1):
      arm64: dts: mt8183: kukui: Fix underscores in node names

 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts |   2 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             |   2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts |  12 ++--
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi                |  24 ++++++--
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts              |   4 +-
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts              |   4 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi   |   8 ++-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi           |  96 +++++++++++++++----------------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                 | 242 +++++++++++++++++++++++++++++++++++++++----------------------------------------
 arch/arm64/boot/dts/mediatek/mt8186.dtsi                 |  44 +++++++++------
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi          |   2 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                 |   6 +-
 12 files changed, 241 insertions(+), 205 deletions(-)


