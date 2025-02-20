Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47373C021B3
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2025 21:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUzv4m3xKcTNSATo1fo6o69BwuJYqEL42lkK01WWfJo=; b=B6PX8zzR1xdPpm+hqht4FeTCOf
	2HKKGzLj/Luslm/LHtu2BDPjGqgGNZzBVC36P4G3p0QP60rMKMhnhVEAnlvvH2footITyNt5eu+TT
	gLBzs6G5izWTEnCjDLS17IAXA9iAnP3gR3/Ozl+SJM9OAjMQ9KXJjwKMgc+lXXMLyi9LuNxM6fbAR
	JEX1CkH98vi9DdWiLlsjVIFpv96jBN6MNHHeKuC17yU8OlqUvzFH5JvcMrFedTzG6gHPygl/T/l1A
	nRbGentwha5AK2lBQ/s85GMckYdhjN6/Un3dA8zhio4hFIpGHEdZj0iKjn2uY/BGfTaSgv8L33RVy
	GWhd135w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlE9d-00000002y9a-2DdH;
	Thu, 20 Feb 2025 21:32:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlE6e-00000002xAA-3SKB;
	Thu, 20 Feb 2025 21:29:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 194145C5BF1;
	Thu, 20 Feb 2025 21:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD27FC4CED1;
	Thu, 20 Feb 2025 21:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740086956;
	bh=gnBLsDZltrPeBxgUu4aUGcp7+4oRWM3WMYmqT+zK4Do=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QvPYGtJcR7Jf2rmHtsFW7x1ACCYjOVVt7am9OK9mMkWRfRl8WPnTrg4UkeuiHuFNu
	 zMjB7Q8ZAsdj6ob8BntZO1SCScthUg4EIGcEiNcch7NQrQXS0OFdcenVQe9wqE2IFu
	 f+8svNdijLWBD3onEZUiiknhFgFVPFtZNlVaxztdptDZFhl+QlWwh0VyegC40Zc4Mx
	 NbOIn3XOdxUMynf7wdE7riVv89r55/bdTzCm0z0DWFhcO3ti3+A1CR+TpQVLdRf8oz
	 jmdbOOOde+sTlTx7RC95ennaqLH9070SK2oTtqmXxzRqcVO5+GEN1kJlIe1FMZBTsj
	 weuMeC3eQpJrQ==
Date: Thu, 20 Feb 2025 15:29:14 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, matthias.bgg@gmail.com, pablo.sun@mediatek.com, 
 kernel@collabora.com, chunfeng.yun@mediatek.com, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250220105514.43107-1-angelogioacchino.delregno@collabora.com>
References: <20250220105514.43107-1-angelogioacchino.delregno@collabora.com>
Message-Id: <174008661614.4046678.816016771322742801.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] MediaTek MT8188 MTU3 USB and Genio 510/700
 TypeC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_132916_974330_1016CBF0 
X-CRM114-Status: GOOD (  12.67  )
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


On Thu, 20 Feb 2025 11:55:11 +0100, AngeloGioacchino Del Regno wrote:
> This series adds MTU3 nodes to the MT8188 base devicetree, fixes the
> Geralt Chromebooks to use it, and adds support for all of the USB
> ports, including TypeC Power Delivery, Alternate Modes, etc, found
> on the MediaTek Genio 510 and Genio 700 Evaluation Kits.
> 
> This also adds the missing SuperSpeed port to the mtk-xhci binding.
> 
> AngeloGioacchino Del Regno (3):
>   dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP
>   arm64: dts: mediatek: mt8188: Add MTU3 nodes and correctly describe
>     USB
>   arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX
> 
>  .../bindings/usb/mediatek,mtk-xhci.yaml       |   4 +
>  .../boot/dts/mediatek/mt8188-geralt.dtsi      |  18 +++
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 121 +++++++++-----
>  .../dts/mediatek/mt8390-genio-common.dtsi     | 151 +++++++++++++++++-
>  4 files changed, 251 insertions(+), 43 deletions(-)
> 
> --
> 2.48.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250220105514.43107-1-angelogioacchino.delregno@collabora.com:

arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: rt1715@4e: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/richtek,rt1711h.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: jpeg-decoder@1a040000: iommus: [[137, 685], [137, 686], [137, 690], [137, 691], [137, 692], [137, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: rt1715@4e: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/richtek,rt1711h.yaml#
arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: jpeg-decoder@1a040000: iommus: [[139, 685], [139, 686], [139, 690], [139, 691], [139, 692], [139, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#






