Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047A2CD5859
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jan 2026 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iQr3KVTGbZ+a0oho3eiiNWE84mLXPCs5uNigUOmrpk=; b=KYYkBDg4blYRNA3xgYfcq15wMI
	N5puMEMCuWcxUXt+v/ag1AqmFm+8IHnwhzTgjKE1ROKf+LQ+V9irfmf9ZRGaztaxlqOUaZVAmPSFG
	ZLE0uiqaZaJebZWZ+/5ySsABqcq+PU2FtK3XtGN6EmCUY7+Z9yNAi9BWF7gXmv7Hb1w1F1y5LLYg2
	BOIByCBAIKGG46x1IqM+mK94P5Ogw2ZXIk43yJfcY82ATWzo1xhVnlziix22S2E3M91oOPEWty7Wx
	mIST8gbfyRsEgyuTGMVV+2HvXKrd+DU7NV6y5PZA4HeMAg2tKkl0fKow77wyUr5Hv9s8mk2wK3S9f
	qFt4Zx5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTW-0000000EnJ5-2Z0f;
	Wed, 07 Jan 2026 11:13:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTF-0000000En3o-29Ty;
	Wed, 07 Jan 2026 11:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767784372;
	bh=KEl6VXaH5GaPyPm8B+ONRZ953OMOyjnBD8o99+iDwnE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pyOBANxTkxPwHA++c1/eZN6f3byeZRKPPIQbfMf1RklJxr8AJnNTn9vmRRBSzIaRg
	 KrHO0e56963egBGD7gY/cEUZU5j4KTJAFQfxHtp+E3+FwKcwZQIVbG+GyHP0rlPjoL
	 UUOiXtBAf18csBRGIbkjwheX7nlw98sAZjSMA/nlRGAtLJXbJAm3OTd4uj2sbxq+8V
	 VrVevD/swdawyhBJSa01aEA5pr9WSW0WKf1zC6Ja5gA2K4Hh2k54OoXXsvUEdRzq6d
	 tT6is6C0PIKAfn+4FUx6pQ3FGIQMDWQ6hGfCuiAZqmR52w/ERKF2KOLJyz1nMh8zD/
	 we/sQMgIjhO8w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E92C17E1514;
	Wed,  7 Jan 2026 12:12:51 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Sjoerd Simons <sjoerd@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-phy@lists.infradead.org, netdev@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251223-openwrt-one-network-v5-0-7d1864ea3ad5@collabora.com>
References: <20251223-openwrt-one-network-v5-0-7d1864ea3ad5@collabora.com>
Subject: Re: (subset) [PATCH v5 0/8] arm64: dts: mediatek: Add Openwrt One
 AP functionality
Message-Id: <176778437158.39195.9861331852088399033.b4-ty@collabora.com>
Date: Wed, 07 Jan 2026 12:12:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_031257_717427_39A8A89D 
X-CRM114-Status: UNSURE (   9.30  )
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

On Tue, 23 Dec 2025 13:37:50 +0100, Sjoerd Simons wrote:
> Significant changes in V5:
>   * Rebase against linux v6.19-rc2, dropping merged patches
>   * Drop note about disable pci_aspm in cover letter, not required anymore
> Significant changes in V4:
>   * Drop patches that were picked up
>   * Improve mediatek,net dt bindings:
>     - Move back to V2 version (widening global constraint, constraining
>       per compatible)
>     - Ensure all compatibles are constraint in the amount of WEDs (2 for
>       everything apart from mt7981). Specifically adding constraints for
>       mediatek,mt7622-eth and ralink,rt5350-eth
> Significant changes in V3:
>   * Drop patches that were picked up
>   * Re-order patches so changes that don't require dt binding changes
>     come first (Requested by Angelo)
>   * Specify drive power directly rather then using MTK_DRIVE_...
>   * Simply mediatek,net binding changes to avoid accidental changes to
>     other compatibles then mediatek,mt7981-eth
> Significant changes in V2:
>   * https://lore.kernel.org/lkml/20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com/
>   * Only introduce labels in mt7981b.dtsi when required
>   * Switch Airoha EN8811H phy irq to level rather then edge triggered
>   * Move uart0 pinctrl from board dts to soc dtsi
>   * Only overwrite constraints with non-default values in MT7981 bindings
>   * Make SPI NOR nvmem cell labels more meaningfull
>   * Seperate fixing and disable-by-default for the mt7981 in seperate
>     patches
> 
> [...]

Applied to v6.19-next/dts64, thanks!

[2/8] arm64: dts: mediatek: mt7981b: Add PCIe and USB support
      commit: b82833f94f48047b5bf34077d55545ebc67b26a6
[3/8] arm64: dts: mediatek: mt7981b-openwrt-one: Enable PCIe and USB
      commit: 39838919ff0e4ce036c733b62e6e3afb23523484
[4/8] arm64: dts: mediatek: mt7981b: Add Ethernet and WiFi offload support
      commit: 8b5883ab03eb6f35362b94985d81ff6bf999e1f2
[5/8] arm64: dts: mediatek: mt7981b-openwrt-one: Enable Ethernet
      commit: dd8be279b0c229fadb794b452c1172661e4b122a
[6/8] arm64: dts: mediatek: mt7981b: Disable wifi by default
      commit: a6a0280c9f4fb5869d78148320403e703ce86c12
[7/8] arm64: dts: mediatek: mt7981b: Add wifi memory region
      commit: 973a626e940989b58b8b2623ce0d45aa19773c73
[8/8] arm64: dts: mediatek: mt7981b-openwrt-one: Enable wifi
      commit: 7c6088a69fab4f6a2f5552ac61cc480f832f74ba

Cheers,
Angelo



