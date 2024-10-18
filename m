Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D9CD30006
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 12:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdVzz3yAtg/fP1vQIKHu7QMT64Vw6aqPNEm/Spjq1DE=; b=Lsz7kDSpXBffFjXzSyZlLq+WcT
	UOHcKtFyLPBGRusnRNp3opl4/dPcUlbPEdxeRKbCKItlEMv4jko7LZbEUCZgHJrSUgrtqLKwwNnfW
	wiZO02RVjep7Cz2Vjifkm8yTIxFRn6Obnd07Ieh2hu8SMjxYyuFckCEqmz3Am2v5E+cxa22EKvBDy
	SkSEriH8OkGUEeYIgmKVo5G1RGh1upr17SyfwDUfKqceszSDy++bCfNfKKu09IQVIKhGUmcQRa1Al
	dNF73HL+In/IeFDhGUICJWg5AzYmdHkuk7ZactEVoGyITs7LksFE+BPzx7pNtaW+9KoeaECiWP7ju
	BRmcuWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1mXJ-00000000oOO-3suS;
	Fri, 18 Oct 2024 12:56:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1mT0-00000000nml-3e0T;
	Fri, 18 Oct 2024 12:52:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1D12CA43FA8;
	Fri, 18 Oct 2024 12:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE018C4CECF;
	Fri, 18 Oct 2024 12:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729255949;
	bh=wcjdS04309JEdjmFyG61jjDT88GK+yM48adeQ4B/XXg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=AWM+De/Gt5ea4aMATDJAyW908HnRRFIiQ2/25JFnrUiC7Adcw6DB9go2SFdCGkfSs
	 S7thuAKMZjbvGUcSx7kVVxPyUyX0w2OppZWnzWIfI7CMZ9se6GEOefnjmHoru00e1s
	 hsArXDoC1B+13wIuE90STwcrEpih+1p0cGDPeoNGQTZ/yOcw0iO4kpRY62sCSlb/Xp
	 Z3nP7p86DSE7se3m+9t842fFuYiHZYsJW9p4k4M3bPAhfGw2rd6Y83MA/TssLz3W55
	 Y7+Ygr9kPvgC/lV5ZQXQ+xLCdQePzULgThzb5MrcQJBE4p2dCgwNUSnY0H1NRmcTE+
	 MJ1nBLKBkSmpQ==
Date: Fri, 18 Oct 2024 07:52:28 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: devicetree@vger.kernel.or, wenst@chromium.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, angelogioacchino.delregno@collabora.com, 
 hsinyi@chromium.org, sean.wang@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20241018091135.17075-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241018091135.17075-1-xiazhengqiao@huaqin.corp-partner.google.com>
Message-Id: <172925540039.17739.8191775806524492819.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: mediatek: Add MT8186 Chinchou
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_055231_077402_07A99B93 
X-CRM114-Status: GOOD (  14.43  )
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


On Fri, 18 Oct 2024 17:11:32 +0800, Zhengqiao Xia wrote:
> This is v2 of the MT8186 Chromebook device tree series to support
> MT8186 chinchou platform. It is based on the "corsola" design.
> It includes chinchou and chinchou360, including LTE, stylus,
> touchscreen combinations.
> 
> Changes in v2:
> - Modify location of "const: google,chinchou-sku17" in mediatek.yaml
> - rename "pin-report" to "pin-report-pins"
> - add "vcc33-supply" and "vcc33-supply"
> - rename "cbj-sleeve-gpio" to "cbj-sleeve-gpios"
> - modify subnode of sound
> - Link to v1: https://lore.kernel.org/all/172900161180.733089.8963543745385219831.robh@kernel.org/
> 
> Zhengqiao Xia (3):
>   dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
>   arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
>   arm64: dts: mediatek: Add exton node for DP bridge
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |  29 ++
>  arch/arm64/boot/dts/mediatek/Makefile         |   3 +
>  .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
>  .../mediatek/mt8186-corsola-chinchou-sku1.dts |  35 ++
>  .../mt8186-corsola-chinchou-sku16.dts         |  29 ++
>  .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 321 ++++++++++++++++++
>  .../boot/dts/mediatek/mt8186-corsola.dtsi     |   6 +
>  7 files changed, 441 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
> 
> --
> 2.17.1
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


New warnings running 'make CHECK_DTBS=y mediatek/mt8186-corsola-chinchou-sku0.dtb mediatek/mt8186-corsola-chinchou-sku1.dtb mediatek/mt8186-corsola-chinchou-sku16.dtb' for 20241018091135.17075-1-xiazhengqiao@huaqin.corp-partner.google.com:

arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: pmic: 'codec' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: pmic: 'codec' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: pmic: 'codec' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#






