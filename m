Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46EBC83F1A
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKZuVo1x3WVcFRPnJ5ggYzR7g+jUxHa+8DnHO2wrFg8=; b=StkFy+wWW8LAa96BhIRB1Rr5Ar
	+9wPKofsuW0mNPFWDSf74BTNa74DZR8XWYwCjiO+3bLAXUisek7YnfJj151cGMvtnk2q9nRlxk/Rx
	cr0amkrWVF7q8jI4J9N58Sbx6dsrunVr8NjDtuyR6mGTqflh0z1lwLmReaCJ0LHhnO12zYvFDcPI8
	+d1RB+rOKabT/Q7LXLI7i9LivtiJrK2ptbLynzYaCq4l12+9N+owuKxyt8oKFFwyN8yJLTeL5df/c
	nf2aMeh+2prFOZ9EM5yZN+cmo7bkKYunc05W/7UuV3uokJ3X+JuMK4BPEzpWGQaIpQIkqr0btRJuY
	n5ld8Ajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueG4G-000000033HP-1vzX;
	Tue, 22 Jul 2025 16:42:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFgp-00000002znR-3v09;
	Tue, 22 Jul 2025 16:18:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 794DB5C5B25;
	Tue, 22 Jul 2025 16:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20BEC4CEF6;
	Tue, 22 Jul 2025 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753201083;
	bh=J7LJKNLbK+TTtGd8sXeIJEYAW4as9aUTUYlUL2/0OC0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QlLjGUb1YgvAIYoDUCiYMGLxQbpz6UDUXOWYw3CPUxyORWw8DmtKQK6+Z3KCUBmsG
	 f5RHHFDZ09akPXY09QopF/YQQN0Wt4Yh1ZwCQtB6bnxxWC94SiSJFzAhUpX3hM5F5/
	 rJnH6gSqvEExmsR1Ufb6PAZU4KpRf/PnlT9p9LDlSEx4WXNinnSKw3itneLpJk+DEI
	 1izwOYnuJtVSxf5lZyP1n2J92x/br2XO94EU/jppUqIHf5TJ0WecPLbauqUw/NlDG0
	 hYX+/Wdtgwhbm60JNr5Itfdla9qF84Uc/+ARrRBEfzd07uQL3NG66bFD35m3raJn8x
	 rXJOjsR2i8Erg==
Date: Tue, 22 Jul 2025 11:18:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Bear Wang <bear.wang@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul@gmail.com>, Will Deacon <will@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Pablo Sun <pablo.sun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Ramax Lo <ramax.lo@mediatek.com>, 
 MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20250722085811.2062790-1-macpaul.lin@mediatek.com>
References: <20250722085811.2062790-1-macpaul.lin@mediatek.com>
Message-Id: <175320094841.3955034.3637479900814229901.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm64: mediatek: add
 mt8395-evk-ufs board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_091804_063034_0BBA3B9F 
X-CRM114-Status: GOOD (  15.30  )
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


On Tue, 22 Jul 2025 16:58:08 +0800, Macpaul Lin wrote:
> Add a compatible string for the MediaTek mt8395-evk-ufs board.
> This board is the origin Genio 1200 EVK already mounted two main storages,
> one is eMMC, and the other is UFS. The system automatically prioritizes
> between eMMC and UFS via BROM detection, so user could not use both storage
> types simultaneously. As a result, mt8395-evk-ufs must be treated as a
> separate board.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> Changes for v2:
>  - No change.
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250722 (best guess, 3/4 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250722085811.2062790-1-macpaul.lin@mediatek.com:

Error: arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts:17.1-8 Label or path ufshci not found
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/mediatek] Error 2
make[2]: Target 'arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1478: mediatek/mt8395-genio-1200-evk-ufs.dtb] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'mediatek/mt8183-pumpkin.dtb' not remade because of errors.
make: Target 'mediatek/mt6797-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-kodama-sku16.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-fennel14.dtb' not remade because of errors.
make: Target 'mediatek/mt8395-genio-1200-evk.dtb' not remade because of errors.
make: Target 'mediatek/mt7986a-bananapi-bpi-r3.dtb' not remade because of errors.
make: Target 'mediatek/mt8173-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt7986b-rfb.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-tentacruel-sku262144.dtb' not remade because of errors.
make: Target 'mediatek/mt8195-cherry-tomato-r2.dtb' not remade because of errors.
make: Target 'mediatek/mt7981b-openwrt-one.dtb' not remade because of errors.
make: Target 'mediatek/mt8173-elm.dtb' not remade because of errors.
make: Target 'mediatek/mt7622-rfb1.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-damu.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-tentacool-sku327681.dtb' not remade because of errors.
make: Target 'mediatek/mt6779-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku4.dtb' not remade because of errors.
make: Target 'mediatek/mt8173-elm-hana-rev7.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-starmie-sku1.dtb' not remade because of errors.
make: Target 'mediatek/mt8370-genio-510-evk.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-voltorb.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-kenzo.dtb' not remade because of errors.
make: Target 'mediatek/mt2712-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8395-genio-1200-evk-ufs.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-tentacool-sku327683.dtb' not remade because of errors.
make: Target 'mediatek/mt7981b-cudy-wr3000-v1.dtb' not remade because of errors.
make: Target 'mediatek/mt8192-asurada-hayato-r1.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-ponyta-sku0.dtb' not remade because of errors.
make: Target 'mediatek/mt8390-genio-700-evk.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb' not remade because of errors.
make: Target 'mediatek/mt8395-kontron-3-5-sbc-i1200.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-pico6.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku1.dtb' not remade because of errors.
make: Target 'mediatek/mt8195-demo.dtb' not remade because of errors.
make: Target 'mediatek/mt8173-elm-hana.dtb' not remade because of errors.
make: Target 'mediatek/mt6755-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-chinchou-sku16.dtb' not remade because of errors.
make: Target 'mediatek/mt8192-asurada-spherion-r0.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-chinchou-sku0.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-kodama-sku32.dtb' not remade because of errors.
make: Target 'mediatek/mt7622-bananapi-bpi-r64.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-chinchou-sku1.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-magneton-sku393218.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku7.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-magneton-sku393216.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku3.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb' not remade because of errors.
make: Target 'mediatek/mt6797-x20-dev.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-cozmo.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-krane-sku0.dtb' not remade because of errors.
make: Target 'mediatek/mt8365-evk.dtb' not remade because of errors.
make: Target 'mediatek/mt8195-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8395-radxa-nio-12l.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-steelix-sku131073.dtb' not remade because of errors.
make: Target 'mediatek/mt7988a-bananapi-bpi-r4.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-starmie-sku0.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-burnet.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku6.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-ponyta-sku1.dtb' not remade because of errors.
make: Target 'mediatek/mt7986a-acelink-ew-7886cax.dtb' not remade because of errors.
make: Target 'mediatek/mt8516-pumpkin.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-kakadu-sku22.dtb' not remade because of errors.
make: Target 'mediatek/mt7986a-rfb.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-kodama-sku288.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-krane-sku176.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku0.dtb' not remade because of errors.
make: Target 'mediatek/mt6795-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-tentacruel-sku262148.dtb' not remade because of errors.
make: Target 'mediatek/mt8167-pumpkin.dtb' not remade because of errors.
make: Target 'mediatek/mt7981b-xiaomi-ax3000t.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku2.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-steelix-sku131072.dtb' not remade because of errors.
make: Target 'mediatek/mt8195-cherry-dojo-r1.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-kappa.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-kakadu.dtb' not remade because of errors.
make: Target 'mediatek/mt7986a-bananapi-bpi-r3-mini.dtb' not remade because of errors.
make: Target 'mediatek/mt6795-sony-xperia-m5.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-magneton-sku393217.dtb' not remade because of errors.
make: Target 'mediatek/mt8192-evb.dtb' not remade because of errors.
make: Target 'mediatek/mt8195-cherry-tomato-r3.dtb' not remade because of errors.
make: Target 'mediatek/mt8195-cherry-tomato-r1.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-katsu-sku32.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-katsu-sku38.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-squirtle.dtb' not remade because of errors.
make: Target 'mediatek/mt8188-geralt-ciri-sku5.dtb' not remade because of errors.
make: Target 'mediatek/mt8186-corsola-rusty-sku196608.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-jacuzzi-pico.dtb' not remade because of errors.
make: Target 'mediatek/mt8183-kukui-kodama-sku272.dtb' not remade because of errors.






