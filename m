Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A7AC47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+yEIkDWXd27J384iJxaiZILUjyaPg4wNWlDWCi49vgk=; b=kAJ/xiy3pdtmUDcTtf9qG36kSN
	eAb7CNRYfSx1POW8nWEn8GEGac2ACeEYM7qLnc3QyDNfTwdUYJ3sGAxy7XpW4nfoB7z4YDK63FrxN
	X8M/Cj4Kt+kiMn3IdhCDLyz2r82HP01y3Ct95mZ/EONqo0C7UAbSglrtjYyRHDnXdgVR9WYbsP3j6
	A8Qji7s8cZczT00whPy41jDe7qPuyfbRLz3+EXzB7cS52JAA61nOqbfxfBS1DbsyRdNr065nlVfrN
	9d3wFMQyseKBO3GO2HNFbkRDChv9Rv3FJJpK0rvqOgDfp7V3OQvIk0tGCtroiRc0lnhFbtMTBpNS7
	MQS1/9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7g-002N8N-35;
	Fri, 12 Jan 2024 09:46:44 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7c-002N5e-1V;
	Fri, 12 Jan 2024 09:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052798;
	bh=HqzPxaHeFCyZfYh2e01L+xQeMw072rSkCaHc++QlYdQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ur+3HXnozCFZCBDVPEloAp4tOGWzuYqHUeQqBNucoBZKkCLYf48oCaxuLKH3FBgl8
	 Tks7oB8WPXocfxErw6gaDvsiwIz57UElYZt+s8J0kvLjNZd2OS1C4AG5WE/TeLrE6C
	 NDhvPKkxTS59bcT0eBH+Pz0mEE8ZreeTQWB8NCkM6/K0Ut9GEANxi6EHPT4P+299v5
	 vsOn661GzfO9RgqONhMM4/VRTR1lMh3b9uNYEKKbGs31cGVb4mBLtPQpGpp1nJUUyz
	 Iq4O196KG+f5HG7KMQnz1iX5YI17yjErN3O3Ieb+75lceTZWAdcIyV9Ow4/QhZMIOn
	 q8r2qIj1Z9xgw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8E8F33781FCF;
	Fri, 12 Jan 2024 09:46:37 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	macpaul.lin@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 00/15] MediaTek: Introduce MT8395 Radxa NIO 12L devicetree
Date: Fri, 12 Jan 2024 10:46:17 +0100
Message-ID: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014640_636132_E7DB81E6 
X-CRM114-Status: GOOD (  13.37  )
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

This series adds a device tree for the Radxa NIO 12L SBC, powered by
the MediaTek Genio 1200 (MT8395).
Not all features of this board are included in this first series but
it's already quite usable, as the eMMC internal storage works and can
be used to boot the system (as much as MicroSD external storage), the
connectivity via ethernet and WiFi (PCI-Express) are working as well.

The two I2C, two SPI and the two UART ports are also ok.

What is missing (and what's next...!):
 - UFS storage is not working yet (but eMMC works)
 - Type-C role switching is not yet implemented, driver is there but
   mt8195.dtsi has no MTU3 yet, needs some research to avoid breaking
   compatibility with MT8195 Chromebooks
 - HDMI Input port: no driver yet
 - HDMI Output (from SoC HDMI IP): no driver yet
 - Audio (sound card driver needs some love)
 - MIPI Camera
 - System LEDs
 - "F15" Button

This series depends on the MT6360 TCPC series at [1].

[1]: https://lore.kernel.org/all/20240112094538.65639-1-angelogioacchino.delregno@collabora.com

Cheers,
Angelo

AngeloGioacchino Del Regno (15):
  dt-bindings: arm64: mediatek: Add MT8395 Radxa NIO 12L board
    compatible
  arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board
  arm64: dts: mediatek: radxa-nio-12l: Enable I2C 2/4/6 busses
  arm64: dts: mediatek: radxa-nio-12l: Add external MT6360 PMIC on I2C6
  arm64: dts: mediatek: radxa-nio-12l: Configure board regulators
  arm64: dts: mediatek: radxa-nio-12l: Add Ethernet controller and
    Xceiver
  arm64: dts: mediatek: radxa-nio-12l: Add MT6360 battery charger
  arm64: dts: mediatek: radxa-nio-12l: Add support for eMMC and MicroSD
  arm64: dts: mediatek: radxa-nio-12l: Enable System Companion Processor
  arm64: dts: mediatek: radxa-nio-12l: Enable PCI-Express 0 for USB HUB
  arm64: dts: mediatek: radxa-nio-12l: Enable the USB XHCI controllers
  arm64: dts: mediatek: radxa-nio-12l: Enable PCI-Express 1 for WiFi
  arm64: dts: mediatek: radxa-nio-12l: Enable SPI1/2 for 40pin header
  arm64: dts: mediatek: radxa-nio-12l: Enable UART1 for 40pin header
  arm64: dts: mediatek: radxa-nio-12l: Enable Panfrost for Mali GPU

 .../devicetree/bindings/arm/mediatek.yaml     |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     | 747 ++++++++++++++++++
 3 files changed, 749 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts

-- 
2.43.0


