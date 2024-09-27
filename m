Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135FDCDD1B2
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5q8lye3sImNzA8HGtAE/geFugUgS7KxAiLNTOztMH0=; b=si5tLAScw7ZqLJcWSXG2mGT248
	K1blGgQ4MxqKBdC6ZHDeLU7w/MbVKNlWEikaUz3TzPvQBGaeO+/KO5T61GyXzXSjPzQEyhsN7yw07
	5ux3GV279NnGzgKG0euFdZEvasI/SSjIRxBDlhhDEVatyXe0vOG2VjtVBDKyte5/tOcuyhwzlnsOX
	xnbfKHVp91xhp5q5sUHBFo0xh/iD9+4P81aJdfgFkgDD7cGUCz7An5iz8z7RnF8bB6f9CHE6vFb2p
	ZxiBx4AAbCzeL3LmX5SxBifpyhMjS/iHaTq6Yhguk4xyZtVbJpRoJekETP7WXPuKwP41MIEIEhmpZ
	7mPLlBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suBro-0000000BS2o-2aUl;
	Fri, 27 Sep 2024 14:22:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suBqX-0000000BRif-44lr;
	Fri, 27 Sep 2024 14:21:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8FE9F5C5B25;
	Fri, 27 Sep 2024 14:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66ABC4CEC6;
	Fri, 27 Sep 2024 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727446883;
	bh=MQCJio1o77mchlYd/XFuHcHd2OVanumMwrSdzUpdioA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Bn9EoIotTteh0sAYXulCgZX0lkH8BIrJWaNWHzVT4/UbJJbd1UQ38//9acT0QYXBZ
	 wG8DNmASoKuTtK8CP0IP8D7GlFGdBy23Vrsk5OGdJPhPpRTIjNBxujDX4LL/IgMpDC
	 unN18ZGeQzc0PEwNaOEjzRfU4t0r6rQlDocU38qjMiDblBTWoTBqV2Qhl/h5NY2WES
	 ZvxQJ2vTpXfmTetZoeU+dQbELJW/oj3jUaMqtbuaRy55AkINly9sLrJbjNbqUTAh/L
	 Lmh9wm8kMrrCONP8eE+Sr827zAoW0PAUoQoZ5eI2P60+cONS3djW/mM42Y4D53VGCI
	 AvzL1/HHk4YEw==
Date: Fri, 27 Sep 2024 09:21:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?q?Albert_Jakie=C5=82a?= <jakiela@google.com>
Cc: conor+dt@kernel.org, matthias.bgg@gmail.com, sean.wang@mediatek.com, 
 rafal@milecki.pl, krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 hsinyi@chromium.org, nfraprado@collabora.com, wenst@chromium.org, 
 angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240927122940.4190949-1-jakiela@google.com>
References: <20240927122940.4190949-1-jakiela@google.com>
Message-Id: <172744667757.3625970.10650745782102063964.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add MT8186
 Chinchou/Chinchou360 Chromebooks
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_072128_466196_C37C8CEB 
X-CRM114-Status: GOOD (  11.17  )
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


On Fri, 27 Sep 2024 12:29:39 +0000, Albert Jakieła wrote:
> Add entries for MT8186 based Chinchou/Chinchou360 Chromebooks.
> These two are clamshell or convertible with touchscreen, stylus
> and extra buttons.
> 
> Signed-off-by: Albert Jakieła <jakiela@google.com>
> ---
> 
> Changes since v1:
> - PATCH 1/2: Delete sku2147483647
> - Link to v1: https://lore.kernel.org/all/20240925080353.2362879-1-jakiela@google.com/
> 
> ---
>  .../devicetree/bindings/arm/mediatek.yaml     | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
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


New warnings running 'make CHECK_DTBS=y mediatek/mt8186-corsola-chinchou-sku0.dtb mediatek/mt8186-corsola-chinchou-sku1.dtb mediatek/mt8186-corsola-chinchou-sku16.dtb' for 20240927122940.4190949-1-jakiela@google.com:

arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
	['google,chinchou-sku0', 'google,chinchou-sku2', 'google,chinchou-sku4', 'google,chinchou-sku5', 'google,chinchou', 'mediatek,mt8186'] is too long
	['google,chinchou-sku0', 'google,chinchou-sku2', 'google,chinchou-sku4', 'google,chinchou-sku5', 'google,chinchou', 'mediatek,mt8186'] is too short
	'google,chinchou-sku0' is not one of ['mediatek,mt2701-evb']
	'google,chinchou-sku0' is not one of ['mediatek,mt2712-evb']
	'google,chinchou-sku0' is not one of ['mediatek,mt6580-evbp1']
	'google,chinchou-sku0' is not one of ['prestigio,pmt5008-3g']
	'google,chinchou-sku0' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
	'google,chinchou-sku0' is not one of ['mediatek,mt6592-evb']
	'google,chinchou-sku0' is not one of ['mediatek,mt6755-evb']
	'google,chinchou-sku0' is not one of ['mediatek,mt6765-evb']
	'google,chinchou-sku0' is not one of ['mediatek,mt6779-evb']
	'google,chinchou-sku0' is not one of ['mediatek,mt6795-evb', 'sony,xperia-m5']
	'google,chinchou-sku0' is not one of ['archermind,mt6797-x20-dev', 'mediatek,mt6797-evb']
	'google,chinchou-sku0' is not one of ['bananapi,bpi-r64', 'mediatek,mt7622-rfb1']
	'google,chinchou-sku0' is not one of ['mediatek,mt7623a-rfb-emmc', 'mediatek,mt7623a-rfb-nand', 'mediatek,mt7623n-rfb-emmc', 'bananapi,bpi-r2']
	'google,chinchou-sku0' is not one of ['mediatek,mt7629-rfb']
	'google,chinchou-sku0' is not one of ['cudy,wr3000-v1', 'openwrt,one', 'xiaomi,ax3000t']
	'google,chinchou-sku0' is not one of ['acelink,ew-7886cax', 'bananapi,bpi-r3', 'bananapi,bpi-r3mini', 'mediatek,mt7986a-rfb']
	'google,chinchou-sku0' is not one of ['mediatek,mt7986b-rfb']
	'google,chinchou-sku0' is not one of ['bananapi,bpi-r4']
	'google,chinchou-sku0' is not one of ['mediatek,mt8127-moose']
	'google,chinchou-sku0' is not one of ['mediatek,mt8135-evbp1']
	'google,chinchou-sku0' is not one of ['mediatek,mt8167-pumpkin']
	'google,elm-rev8' was expected
	'google,hana-rev6' was expected
	'google,hana-rev7' was expected
	'google,chinchou-sku0' is not one of ['mediatek,mt8173-evb']
	'google,burnet' was expected
	'google,cozmo' was expected
	'google,damu' was expected
	'google,chinchou-sku0' is not one of ['google,fennel-sku0', 'google,fennel-sku1', 'google,fennel-sku2', 'google,fennel-sku6', 'google,fennel-sku7']
	'google,chinchou-sku0' is not one of ['google,juniper-sku16', 'google,juniper-sku17']
	'google,kakadu-rev3' was expected
	'google,kakadu-rev3-sku22' was expected
	'google,kappa' was expected
	'google,chinchou-sku0' is not one of ['google,katsu-sku32', 'google,katsu-sku38']
	'google,chinchou-sku0' is not one of ['google,kodama-sku16', 'google,kodama-sku272', 'google,kodama-sku288', 'google,kodama-sku32']
	'google,chinchou-sku0' is not one of ['google,krane-sku0', 'google,krane-sku176']
	'google,chinchou-sku0' is not one of ['google,makomo-sku0', 'google,makomo-sku1']
	'google,chinchou-sku0' is not one of ['google,pico-sku1', 'google,pico-sku2']
	'google,chinchou-sku0' is not one of ['google,willow-sku0', 'google,willow-sku1']
	'google,chinchou-sku0' is not one of ['mediatek,mt8183-evb']
	'google,chinchou-sku0' is not one of ['mediatek,mt8183-pumpkin']
	'google,chinchou-sku16' was expected
	'google,steelix-sku393219' was expected
	'google,steelix-sku393220' was expected
	'google,steelix-sku393221' was expected
	'google,steelix-sku196609' was expected
	'google,chinchou-sku0' is not one of ['google,steelix-sku131072', 'google,steelix-sku131073']
	'google,tentacruel-sku262147' was expected
	'google,tentacruel-sku262151' was expected
	'google,tentacruel-sku327681' was expected
	'google,tentacruel-sku327683' was expected
	'google,chinchou-sku0' is not one of ['google,voltorb-sku589824', 'google,voltorb-sku589825']
	'google,chinchou-sku0' is not one of ['mediatek,mt8186-evb']
	'google,chinchou-sku0' is not one of ['mediatek,mt8188-evb']
	'google,hayato-rev1' was expected
	'google,hayato-rev5-sku2' was expected
	'google,spherion-rev3' was expected
	'google,spherion-rev4' was expected
	'google,chinchou-sku0' is not one of ['mediatek,mt8192-evb']
	'google,chinchou-sku0' is not one of ['google,tomato-rev2', 'google,tomato-rev1']
	'google,tomato-rev4' was expected
	'google,dojo-sku7' was expected
	'google,chinchou-sku0' is not one of ['mediatek,mt8195-demo', 'mediatek,mt8195-evb']
	'google,chinchou-sku0' is not one of ['mediatek,mt8365-evk']
	'google,chinchou-sku0' is not one of ['mediatek,mt8390-evk']
	'google,chinchou-sku0' is not one of ['kontron,3-5-sbc-i1200', 'mediatek,mt8395-evk', 'radxa,nio-12l']
	'google,chinchou-sku0' is not one of ['mediatek,mt8516-pumpkin']
	'mediatek,mt2701' was expected
	'mediatek,mt2712' was expected
	'mediatek,mt6580' was expected
	'mediatek,mt6582' was expected
	'mediatek,mt6589' was expected
	'mediatek,mt6592' was expected
	'mediatek,mt6755' was expected
	'mediatek,mt6765' was expected
	'mediatek,mt6779' was expected
	'mediatek,mt6795' was expected
	'mediatek,mt6797' was expected
	'mediatek,mt7622' was expected
	'mediatek,mt7623' was expected
	'mediatek,mt7629' was expected
	'mediatek,mt7981b' was expected
	'mediatek,mt7986a' was expected
	'mediatek,mt7986b' was expected
	'mediatek,mt7988a' was expected
	'mediatek,mt8127' was expected
	'mediatek,mt8135' was expected
	'mediatek,mt8167' was expected
	'google,elm-rev7' was expected
	'google,hana-rev5' was expected
	'mediatek,mt8173' was expected
	'mediatek,mt8183' was expected
	'google,fennel' was expected
	'google,juniper' was expected
	'google,kakadu-rev2' was expected
	'google,kakadu-rev2-sku22' was expected
	'google,katsu' was expected
	'google,kodama' was expected
	'google,krane' was expected
	'google,makomo' was expected
	'google,pico' was expected
	'google,willow' was expected
	'google,chinchou-sku18' was expected
	'google,chinchou-sku1' was expected
	'google,steelix-sku393216' was expected
	'google,steelix-sku393217' was expected
	'google,steelix-sku393218' was expected
	'google,steelix-sku196608' was expected
	'google,steelix' was expected
	'google,tentacruel-sku262146' was expected
	'google,tentacruel-sku262150' was expected
	'google,tentacruel' was expected
	'google,voltorb' was expected
	'mediatek,mt8186' was expected
	'mediatek,mt8188' was expected
	'google,hayato' was expected
	'google,hayato-sku2' was expected
	'google,spherion-rev2' was expected
	'google,spherion' was expected
	'mediatek,mt8192' was expected
	'google,tomato' was expected
	'google,tomato-rev3' was expected
	'google,dojo-sku5' was expected
	'mediatek,mt8195' was expected
	'mediatek,mt8365' was expected
	'mediatek,mt8390' was expected
	'mediatek,mt8395' was expected
	'mediatek,mt8516' was expected
	'google,elm-rev6' was expected
	'google,hana-rev4' was expected
	'google,kakadu' was expected
	'google,chinchou-sku19' was expected
	'google,chinchou-sku2' was expected
	'google,tentacruel-sku262145' was expected
	'google,tentacruel-sku262149' was expected
	'google,spherion-rev1' was expected
	'google,dojo-sku3' was expected
	'google,elm-rev5' was expected
	'google,hana-rev3' was expected
	'google,chinchou-sku21' was expected
	'google,chinchou-sku3' was expected
	'google,tentacruel-sku262144' was expected
	'google,tentacruel-sku262148' was expected
	'google,spherion-rev0' was expected
	'google,dojo-sku1' was expected
	'google,elm-rev4' was expected
	'google,hana' was expected
	'google,chinchou-sku4' was expected
	'google,dojo' was expected
	'google,elm-rev3' was expected
	'google,chinchou-sku5' was expected
	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
	['google,chinchou-sku1', 'google,chinchou-sku17', 'google,chinchou-sku3', 'google,chinchou-sku6', 'google,chinchou-sku7', 'google,chinchou-sku20', 'google,chinchou-sku22', 'google,chinchou-sku23', 'mediatek,mt8186'] is too long
	['google,chinchou-sku1', 'google,chinchou-sku17', 'google,chinchou-sku3', 'google,chinchou-sku6', 'google,chinchou-sku7', 'google,chinchou-sku20', 'google,chinchou-sku22', 'google,chinchou-sku23', 'mediatek,mt8186'] is too short
	'google,chinchou-sku1' is not one of ['mediatek,mt2701-evb']
	'google,chinchou-sku1' is not one of ['mediatek,mt2712-evb']
	'google,chinchou-sku1' is not one of ['mediatek,mt6580-evbp1']
	'google,chinchou-sku1' is not one of ['prestigio,pmt5008-3g']
	'google,chinchou-sku1' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
	'google,chinchou-sku1' is not one of ['mediatek,mt6592-evb']
	'google,chinchou-sku1' is not one of ['mediatek,mt6755-evb']
	'google,chinchou-sku1' is not one of ['mediatek,mt6765-evb']
	'google,chinchou-sku1' is not one of ['mediatek,mt6779-evb']
	'google,chinchou-sku1' is not one of ['mediatek,mt6795-evb', 'sony,xperia-m5']
	'google,chinchou-sku1' is not one of ['archermind,mt6797-x20-dev', 'mediatek,mt6797-evb']
	'google,chinchou-sku1' is not one of ['bananapi,bpi-r64', 'mediatek,mt7622-rfb1']
	'google,chinchou-sku1' is not one of ['mediatek,mt7623a-rfb-emmc', 'mediatek,mt7623a-rfb-nand', 'mediatek,mt7623n-rfb-emmc', 'bananapi,bpi-r2']
	'google,chinchou-sku1' is not one of ['mediatek,mt7629-rfb']
	'google,chinchou-sku1' is not one of ['cudy,wr3000-v1', 'openwrt,one', 'xiaomi,ax3000t']
	'google,chinchou-sku1' is not one of ['acelink,ew-7886cax', 'bananapi,bpi-r3', 'bananapi,bpi-r3mini', 'mediatek,mt7986a-rfb']
	'google,chinchou-sku1' is not one of ['mediatek,mt7986b-rfb']
	'google,chinchou-sku1' is not one of ['bananapi,bpi-r4']
	'google,chinchou-sku1' is not one of ['mediatek,mt8127-moose']
	'google,chinchou-sku1' is not one of ['mediatek,mt8135-evbp1']
	'google,chinchou-sku1' is not one of ['mediatek,mt8167-pumpkin']
	'google,elm-rev8' was expected
	'google,hana-rev6' was expected
	'google,hana-rev7' was expected
	'google,chinchou-sku1' is not one of ['mediatek,mt8173-evb']
	'google,burnet' was expected
	'google,cozmo' was expected
	'google,damu' was expected
	'google,chinchou-sku1' is not one of ['google,fennel-sku0', 'google,fennel-sku1', 'google,fennel-sku2', 'google,fennel-sku6', 'google,fennel-sku7']
	'google,chinchou-sku1' is not one of ['google,juniper-sku16', 'google,juniper-sku17']
	'google,kakadu-rev3' was expected
	'google,kakadu-rev3-sku22' was expected
	'google,kappa' was expected
	'google,chinchou-sku1' is not one of ['google,katsu-sku32', 'google,katsu-sku38']
	'google,chinchou-sku1' is not one of ['google,kodama-sku16', 'google,kodama-sku272', 'google,kodama-sku288', 'google,kodama-sku32']
	'google,chinchou-sku1' is not one of ['google,krane-sku0', 'google,krane-sku176']
	'google,chinchou-sku1' is not one of ['google,makomo-sku0', 'google,makomo-sku1']
	'google,chinchou-sku1' is not one of ['google,pico-sku1', 'google,pico-sku2']
	'google,chinchou-sku1' is not one of ['google,willow-sku0', 'google,willow-sku1']
	'google,chinchou-sku1' is not one of ['mediatek,mt8183-evb']
	'google,chinchou-sku1' is not one of ['mediatek,mt8183-pumpkin']
	'google,chinchou-sku16' was expected
	'google,chinchou-sku0' was expected
	'google,steelix-sku393219' was expected
	'google,steelix-sku393220' was expected
	'google,steelix-sku393221' was expected
	'google,steelix-sku196609' was expected
	'google,chinchou-sku1' is not one of ['google,steelix-sku131072', 'google,steelix-sku131073']
	'google,tentacruel-sku262147' was expected
	'google,tentacruel-sku262151' was expected
	'google,tentacruel-sku327681' was expected
	'google,tentacruel-sku327683' was expected
	'google,chinchou-sku1' is not one of ['google,voltorb-sku589824', 'google,voltorb-sku589825']
	'google,chinchou-sku1' is not one of ['mediatek,mt8186-evb']
	'google,chinchou-sku1' is not one of ['mediatek,mt8188-evb']
	'google,hayato-rev1' was expected
	'google,hayato-rev5-sku2' was expected
	'google,spherion-rev3' was expected
	'google,spherion-rev4' was expected
	'google,chinchou-sku1' is not one of ['mediatek,mt8192-evb']
	'google,chinchou-sku1' is not one of ['google,tomato-rev2', 'google,tomato-rev1']
	'google,tomato-rev4' was expected
	'google,dojo-sku7' was expected
	'google,chinchou-sku1' is not one of ['mediatek,mt8195-demo', 'mediatek,mt8195-evb']
	'google,chinchou-sku1' is not one of ['mediatek,mt8365-evk']
	'google,chinchou-sku1' is not one of ['mediatek,mt8390-evk']
	'google,chinchou-sku1' is not one of ['kontron,3-5-sbc-i1200', 'mediatek,mt8395-evk', 'radxa,nio-12l']
	'google,chinchou-sku1' is not one of ['mediatek,mt8516-pumpkin']
	'mediatek,mt2701' was expected
	'mediatek,mt2712' was expected
	'mediatek,mt6580' was expected
	'mediatek,mt6582' was expected
	'mediatek,mt6589' was expected
	'mediatek,mt6592' was expected
	'mediatek,mt6755' was expected
	'mediatek,mt6765' was expected
	'mediatek,mt6779' was expected
	'mediatek,mt6795' was expected
	'mediatek,mt6797' was expected
	'mediatek,mt7622' was expected
	'mediatek,mt7623' was expected
	'mediatek,mt7629' was expected
	'mediatek,mt7981b' was expected
	'mediatek,mt7986a' was expected
	'mediatek,mt7986b' was expected
	'mediatek,mt7988a' was expected
	'mediatek,mt8127' was expected
	'mediatek,mt8135' was expected
	'mediatek,mt8167' was expected
	'google,elm-rev7' was expected
	'google,hana-rev5' was expected
	'mediatek,mt8173' was expected
	'mediatek,mt8183' was expected
	'google,fennel' was expected
	'google,juniper' was expected
	'google,kakadu-rev2' was expected
	'google,kakadu-rev2-sku22' was expected
	'google,katsu' was expected
	'google,kodama' was expected
	'google,krane' was expected
	'google,makomo' was expected
	'google,pico' was expected
	'google,willow' was expected
	'google,chinchou-sku18' was expected
	'google,chinchou-sku1' was expected
	'google,steelix-sku393216' was expected
	'google,steelix-sku393217' was expected
	'google,steelix-sku393218' was expected
	'google,steelix-sku196608' was expected
	'google,steelix' was expected
	'google,tentacruel-sku262146' was expected
	'google,tentacruel-sku262150' was expected
	'google,tentacruel' was expected
	'google,voltorb' was expected
	'mediatek,mt8186' was expected
	'mediatek,mt8188' was expected
	'google,hayato' was expected
	'google,hayato-sku2' was expected
	'google,spherion-rev2' was expected
	'google,spherion' was expected
	'mediatek,mt8192' was expected
	'google,tomato' was expected
	'google,tomato-rev3' was expected
	'google,dojo-sku5' was expected
	'mediatek,mt8195' was expected
	'mediatek,mt8365' was expected
	'mediatek,mt8390' was expected
	'mediatek,mt8395' was expected
	'mediatek,mt8516' was expected
	'google,elm-rev6' was expected
	'google,hana-rev4' was expected
	'google,kakadu' was expected
	'google,chinchou-sku19' was expected
	'google,chinchou-sku2' was expected
	'google,tentacruel-sku262145' was expected
	'google,tentacruel-sku262149' was expected
	'google,spherion-rev1' was expected
	'google,dojo-sku3' was expected
	'google,elm-rev5' was expected
	'google,hana-rev3' was expected
	'google,chinchou-sku21' was expected
	'google,chinchou-sku3' was expected
	'google,tentacruel-sku262144' was expected
	'google,tentacruel-sku262148' was expected
	'google,spherion-rev0' was expected
	'google,dojo-sku1' was expected
	'google,elm-rev4' was expected
	'google,hana' was expected
	'google,chinchou-sku4' was expected
	'google,dojo' was expected
	'google,elm-rev3' was expected
	'google,chinchou-sku5' was expected
	'google,elm' was expected
	'google,chinchou-sku6' was expected
	'google,chinchou-sku7' was expected
	'google,chinchou-sku17' was expected
	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /: failed to match any schema with compatible: ['google,chinchou-sku1', 'google,chinchou-sku17', 'google,chinchou-sku3', 'google,chinchou-sku6', 'google,chinchou-sku7', 'google,chinchou-sku20', 'google,chinchou-sku22', 'google,chinchou-sku23', 'mediatek,mt8186']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: pinctrl@10005000: 'pin-report' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8186-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: pinctrl@10005000: 'pin-report' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8186-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: pinctrl@10005000: 'pin-report' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8186-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: anx7625@58: 'ports' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: anx7625@58: 'ports' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: touchscreen@41: 'vcc33-supply' is a required property
	from schema $id: http://devicetree.org/schemas/input/ilitek,ili2901.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: trackpad@15: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: trackpad@15: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: dp-bridge@5c: 'extcon' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: dp-bridge@5c: 'extcon' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: rt5650@1a: 'cpvdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5645.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: rt5650@1a: Unevaluated properties are not allowed ('cbj-sleeve-gpio' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5645.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: rt5650@1a: 'cpvdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5645.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: rt5650@1a: Unevaluated properties are not allowed ('cbj-sleeve-gpio' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5645.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: anx7625@58: 'ports' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: anx7625@58: '#address-cells', '#size-cells', 'panel_flags', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: touchscreen@41: 'vcc33-supply' is a required property
	from schema $id: http://devicetree.org/schemas/input/ilitek,ili2901.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: trackpad@15: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: dp-bridge@5c: 'extcon' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: rt5650@1a: 'cpvdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5645.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: rt5650@1a: Unevaluated properties are not allowed ('cbj-sleeve-gpio' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5645.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: thermal-zones: 'cpu-ntc', 'pmic-ntc' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: thermal-zones: 'cpu-ntc', 'pmic-ntc' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: regulator-pp1800-tchscr-report-disable: Unevaluated properties are not allowed ('enable-active-low' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: thermal-zones: 'cpu-ntc', 'pmic-ntc' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: regulator-pp1800-tchscr-report-disable: Unevaluated properties are not allowed ('enable-active-low' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: regulator-pp1800-tchscr-report-disable: Unevaluated properties are not allowed ('enable-active-low' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#






