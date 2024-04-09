Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A02CD129A
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 13:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3BhuXuYVntFrTKTe9DyFGQcqwlbU4aEjRYx4t/i40o=; b=HuYeImPEmpj+cv8k23zlSgs68W
	iI9FqYYuJaO/r5ITlLa5BG/EQAFkTB21fSxEWuIXzbREx7YvbHijF32+5N/m4WbhK7qJzgkoG++tf
	2/p887ZtLyYup3nGSSRAE0qODdKgwcn/EZFve6Db9ZLiOawfSRT+YrTJDUKp05mFIKyyUZQDKMbWN
	KJwrewEM89OfKXg+BDdnHWkppXNbEGed+xNlB9wxM/euxwUZ41jtVSnCOgUFF6X8q9eAI/3r/C9QE
	w8ETls/zA4edkBqeroejsSTnIbkWVgR7CSzVbq6Dvu0W+AX5OchzQUso3Y3Nt/xUfS93yO0VYCw5m
	1nWMlO+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBh7-00000002B14-41bt;
	Tue, 09 Apr 2024 13:39:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBgo-00000002AmG-1Pyk;
	Tue, 09 Apr 2024 13:39:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1AF261729;
	Tue,  9 Apr 2024 13:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F34C43399;
	Tue,  9 Apr 2024 13:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712669945;
	bh=7hrNrvhSRHtyZ6X1D6pysKCJsCiJsdLaYXC8yh0wAUM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=HEOHTdUfT40MII2SsTPC3kxPREzZm2W/lVyEe9od6xbqeWv+E+CnLbDZ4XpYgcJvS
	 NGI8fSoLiC6wAKLnSlvi2QosYG5cKatT8ATrPC+Gxnl5uWX8ov14lzpj+X4GqfNh9U
	 RUtx+AYrx9o7CTLirh6h10eh+hJRy9k3aU2iPezhwGymSkIyL6oTIT543hHDjbC1q9
	 jMo4X+2mUz8rvpXKXGTei/TMySmwQJxzli35BeyfxLwgA5fF6S1Sio9ZupIHzUeufa
	 xW3V5AqNVXfLZk7+xw+fILjgw+zgISok7gWaUSEW1IGzOKJkYq6E4Zj0g+ZnCZlYd0
	 DN4xtgiXsi4qQ==
Date: Tue, 09 Apr 2024 08:39:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, matthias.bgg@gmail.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240409114211.310462-1-angelogioacchino.delregno@collabora.com>
References: <20240409114211.310462-1-angelogioacchino.delregno@collabora.com>
Message-Id: <171266958557.1032651.3727332046208008120.robh@kernel.org>
Subject: Re: [PATCH 0/5] Radxa NIO-12L: Supplies for CPU/GPU and
 improvements
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_063907_259564_98CB359B 
X-CRM114-Status: GOOD (  13.46  )
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


On Tue, 09 Apr 2024 13:42:06 +0200, AngeloGioacchino Del Regno wrote:
> This series performs various improvements and enables PHYs and USB Role
> Switching for proper PM support and to stop relying on the bootloader's
> pre-boot configuration.
> USB Role Switching doesn't include Alternate Modes yet, as this needs
> some more work.
> 
> As for the regulator nodes, those were not probing correctly, producing
> unability to resume after PM suspend.
> 
> AngeloGioacchino Del Regno (5):
>   arm64: dts: mediatek: mt8395-nio-12l: Fix MT6360 regulator nodes names
>   arm64: dts: medaitek: mt8395-nio-12l: Set i2c6 pins to bias-disable
>   arm64: dts: mediatek: mt8395-nio-12l: Define RSEL in microamperes
>   arm64: dts: mediatek: mt8395-nio-12l: Enable PHYs and USB role switch
>   arm64: dts: mediatek: mt8395-nio-12l: Add power supplies for CPU/GPU
>     scaling
> 
>  .../dts/mediatek/mt8395-radxa-nio-12l.dts     | 106 ++++++++++++++++--
>  1 file changed, 94 insertions(+), 12 deletions(-)
> 
> --
> 2.44.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y mediatek/mt8395-radxa-nio-12l.dtb' for 20240409114211.310462-1-angelogioacchino.delregno@collabora.com:

arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: soc: jpgdec-master: {'compatible': ['mediatek,mt8195-jpgdec'], 'power-domains': [[47, 24]], 'iommus': [[137, 621], [137, 622], [137, 626], [137, 627], [137, 628], [137, 629]], '#address-cells': [[2]], '#size-cells': [[2]], 'ranges': True, 'jpgdec@1a040000': {'compatible': ['mediatek,mt8195-jpgdec-hw'], 'reg': [[0, 436469760, 0, 65536]], 'iommus': [[137, 621], [137, 622], [137, 626], [137, 627], [137, 628], [137, 629]], 'interrupts': [[0, 343, 4, 0]], 'clocks': [[38, 3]], 'clock-names': ['jpgdec'], 'power-domains': [[47, 23]]}, 'jpgdec@1a050000': {'compatible': ['mediatek,mt8195-jpgdec-hw'], 'reg': [[0, 436535296, 0, 65536]], 'iommus': [[137, 621], [137, 622], [137, 626], [137, 627], [137, 628], [137, 629]], 'interrupts': [[0, 344, 4, 0]], 'clocks': [[38, 4]], 'clock-names': ['jpgdec'], 'power-domains': [[47, 24]]}, 'jpgdec@1b040000': {'compatible': ['mediatek,mt8195-jpgdec-hw'], 'reg': [[0, 453246976, 0, 65536]], 'iommus': [[119,
  653], [119, 654], [119, 658], [119, 659], [119, 660], [119, 661]], 'interrupts': [[0, 348, 4, 0]], 'clocks': [[32, 3]], 'clock-names': ['jpgdec'], 'power-domains': [[47, 25]]}} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: soc: jpgenc-master: {'compatible': ['mediatek,mt8195-jpgenc'], 'power-domains': [[47, 27]], 'iommus': [[119, 647], [119, 648], [119, 649], [119, 652]], '#address-cells': [[2]], '#size-cells': [[2]], 'ranges': True, 'jpgenc@1a030000': {'compatible': ['mediatek,mt8195-jpgenc-hw'], 'reg': [[0, 436404224, 0, 65536]], 'iommus': [[137, 615], [137, 616], [137, 617], [137, 620]], 'interrupts': [[0, 342, 4, 0]], 'clocks': [[38, 2]], 'clock-names': ['jpgenc'], 'power-domains': [[47, 26]]}, 'jpgenc@1b030000': {'compatible': ['mediatek,mt8195-jpgenc-hw'], 'reg': [[0, 453181440, 0, 65536]], 'iommus': [[119, 647], [119, 648], [119, 649], [119, 652]], 'interrupts': [[0, 347, 4, 0]], 'clocks': [[32, 2]], 'clock-names': ['jpgenc'], 'power-domains': [[47, 27]]}} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic@34: charger: 'usb-otg-vbus' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: charger: 'usb-otg-vbus' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/supply/mt6360_charger.yaml#
arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: regulator: 'BUCK1', 'BUCK2', 'LDO1', 'LDO2', 'LDO3', 'LDO5', 'LDO6', 'LDO7' do not match any of the regexes: '^buck[12]$', '^ldo[123567]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/regulator/mt6360-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: display@14f06000: clocks: [[34, 14], [34, 43], [34, 44]] is too long
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#






