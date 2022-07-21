Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FFBC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 14:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7uP0lqcFKHoyb6FOnlR0lj5nrt4YucmBtU0AlTcOL2g=; b=babMIXinjMJL8ReaH3Ga1dri9q
	WFm1mhJ0xd9Ib6Nmc5necFSswHagKOCt/BViuwqRiOJqDhUYfTG5BBfReY/50mt/89UjBwUBgQ9t0
	Hrw3fCzsY8zQijMHYAikwuhWi3TrKoWpnE04teO8LG7503GBiGhJqsSOf/eEZGXsasgpIpd6OtmuO
	c1pHlKibMmCiI4FFDpffQmdAsxfstvbtWRhJeMXrfdGbRJ49BaI8P9ceZfWdKs1w8bDNQ35sBHbLo
	h5a8tAKqGA3Wzh5fthRT8j8Fere1UvDnLr1uRa1ifG/wWpnk+U4QnUeyQ5nmiFtCx1K1XYSX8xCiT
	NL81DUtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXYm-008PCt-Px; Thu, 21 Jul 2022 14:53:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXVY-008KqQ-Gc; Thu, 21 Jul 2022 14:50:35 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1FD1E6601AAA;
	Thu, 21 Jul 2022 15:50:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658415028;
	bh=wGbwT5jBrPv2vLl+3BSZalWhnDZWaPGXrP0f6gHkLT8=;
	h=From:To:Cc:Subject:Date:From;
	b=ImqwbHwSMz6hDczFLt/n1zmq30miovI+4MkYwIX5Ixa4vo/ZYATMe5GACXaV1WmxE
	 ZBBZOQYRtWJjjUn9JnREj/TiXUw56G77KfV6Dy8AHLss1E08QoBQ8wUt+BKbxt0dDH
	 f1zw4SQvIhFGdbkJw0dTQnSep2Tgx9hIVRyiXXimmpxkMVvmvqulnnus5Ds9LYbWcH
	 C9D/Karn04H7A6T0j1DHveSABt0pErytC36nUMkS/L5rEJ2aZz0AYmQ5N0nDCUw0D/
	 tH/F4MCp0h7ORhPJD8bE/JG+giIDe9l06e8mSBQZtxg3HA6KPHuJmMAJx5pRq035RS
	 toz57VEHXnMew==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/8] MT8195 Acer Tomato - devicetrees Part 2
Date: Thu, 21 Jul 2022 16:50:09 +0200
Message-Id: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_075032_715354_6479C7D8 
X-CRM114-Status: UNSURE (   9.65  )
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

This series enables more functionality on the MT8195 Tomato Chromebooks,
bringing it to an almost usable state.

With this series, the device is able to boot from the MicroSD card
and is able to communicate with the EC for various functions,
including the enablement of the Chromebook's keyboard, battery
charging, fuel gauge and other standard ChromeOS EC functionality.

This also enables the Audio DSP, codec and sound card and adds support
for the regulators found on the SPMI bus.

What's missing (coming in the next part)?

* Format:    feature  (location)
*
* MediaTek vcodec enc/dec (mt8195.dtsi only)
* PCI-Express WiFi card (mt8195 and mt8195-cherry)
* VDOSYS1 (mt8195.dtsi and mediatek-drm/mmsys drivers)
* DP/eDP outputs for external/internal display (mt8195 and mt8195-cherry)
* LVTS Thermal Sensors (mt8195.dtsi, driver is missing)
* GPU support (comes later, clocks implementation is in the works)


### NOTE: ###

This series depends on MediaTek's MT8195 new device nodes [1] series

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?submitter=196333


Changes in v2:
 - Fixed *huge* mistake on patch [8/8] (truly sorry!!!)

AngeloGioacchino Del Regno (8):
  arm64: dts: mediatek: cherry: Enable the System Companion Processor
  arm64: dts: mediatek: cherry: Wire up the ChromeOS EC and GSC
  arm64: dts: mediatek: cherry: Add keyboard mapping for the top row
  arm64: dts: mediatek: cherry: Enable secondary SD/MMC controller
  arm64: dts: mediatek: cherry: Enable Elantech eKTH3000 i2c trackpad
  arm64: dts: mediatek: cherry: Enable DSP, audio codec and sound card
  arm64: dts: mediatek: cherry: Enable keyboard PWM backlight
  arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus

 .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |  10 +
 .../dts/mediatek/mt8195-cherry-tomato-r2.dts  |  10 +
 .../dts/mediatek/mt8195-cherry-tomato-r3.dts  |  10 +
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 403 ++++++++++++++++++
 4 files changed, 433 insertions(+)

-- 
2.35.1


