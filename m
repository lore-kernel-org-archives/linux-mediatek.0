Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7F5CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 13:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkpRqvYIptS41FJZZh9bbzuAxAcWat/L4eB8HgDVxRA=; b=5HBTV6DEQ0NUkBW/wHrslIu39C
	OKJJcFh0S/eusJtg/dTw3XARbbhBWU9QVqAINQUhYlwAgvci5temfmAD2GjmRFfAfXS8ZjJUC8+Zy
	tEum724yzRaFeV4wA8GMZ+okrW3DGAdxeTM12EIVvLMEN/m0HG2199gCfQ79HV73fPElBAtplq6Xb
	TD8GJoo47FvA4mApNB/I2T7EbWsalS1GiJfW2kiQkw9b9zBt5bTxtiduksdRgBxDVFl3a2JH+CUYo
	kJ53R3zqtDWbzd8Z2mg1V/MFIVVVH4TwG487IjYTh+0Ug4RuIkCY/KqGUk7PIInqvzkBotY2UGevL
	JQAr3oFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBgs-00000002Aon-1p50;
	Tue, 09 Apr 2024 13:39:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBgc-00000002AeB-07kL;
	Tue, 09 Apr 2024 13:38:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 775026175F;
	Tue,  9 Apr 2024 13:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1831BC43394;
	Tue,  9 Apr 2024 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712669933;
	bh=MaNTo1TwypdMImDfu267HMVrFoa2Gv937RWDn+H7NYE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=NlG8/J28axE58KEH46XEcDmHy3yMO8Dh1UdJPlygPKqW10vSd5kumTqY8W2XHP8dY
	 k+XykDNyWpMmpkgR6bDATlazXoIXqKQHcsJzKVGoM9c8dFOcdUdXiwfVDyEEwumR3t
	 rGq218oUsf6/aYQjZQUJPKeRLUfssSxxRHab5F/YxzFkLD3U2l2z0h3fQAlariJesb
	 xgEj1zS5j/hY1ABgOLLLXKWZUzsFd8AzsvTw+1jOKD3p+uMVL8gmU/pF8zxeovg9/C
	 BVdYN4U5oLfeIsSry7VforNoEaqK6NuwLqqgCy+ihxoqLWgbnlczyICyq56dB/Gbqz
	 joEzMVXL89tWw==
Date: Tue, 09 Apr 2024 08:38:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20240408100040.25997-1-zajec5@gmail.com>
References: <20240408100040.25997-1-zajec5@gmail.com>
Message-Id: <171266958436.1032546.17539975560250001591.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7622: fix "emmc" pinctrl mux
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_063854_476370_7192385A 
X-CRM114-Status: GOOD (  11.97  )
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


On Mon, 08 Apr 2024 12:00:40 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Value "emmc_rst" is a group name and should be part of the "groups"
> property.
> 
> This fixes:
> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: pinctrl@10211000: emmc-pins-default:mux:function: ['emmc', 'emmc_rst'] is too long
>         from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000: emmc-pins-default:mux:function: ['emmc', 'emmc_rst'] is too long
>         from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
> 
> Fixes: 3725ba3f5574 ("arm64: dts: mt7622: add pinctrl related device nodes")
> Fixes: 0b6286dd96c0 ("arm64: dts: mt7622: add bananapi BPI-R64 board")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
>  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
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


New warnings running 'make CHECK_DTBS=y mediatek/mt7622-bananapi-bpi-r64.dtb mediatek/mt7622-rfb1.dtb' for 20240408100040.25997-1-zajec5@gmail.com:

arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: pinctrl@10211000: emmc-pins-default:mux:groups: ['emmc', 'emmc_rst'] is too long
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000: emmc-pins-default:mux:groups: ['emmc', 'emmc_rst'] is too long
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#






