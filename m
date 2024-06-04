Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A155FC27C53
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 15:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCbsUQRemPPlERnM+qfRlyL3+f4soW4QIivO9UM9yqk=; b=bq5qu9YuyzZ9e0NVXCSLTUCY97
	qmQkRk5BrrXX0fCdxtwMUbLjJsd7X/PutbMeKBisjJwzfWzrNbWEwkCK1rT58WHMY/jYYNrXbpcbO
	zxgrQMF6SUpXfyLEU3bkz+PCxLTWURO+L1lxcOUOkitSk48eLAXDXRFOAQRImjOwX9514gL9BnRd+
	Z0FUVBpJacvJ3cA+0xZHfhCJ9HFDgXwInuwCMfSTdnWMDIRnzO7ejeixGLMJza9hvH2NKxu12BwFy
	jlOCvzcgZ0CNSM+AkWVUkFK2s03sRU0v6fmpf0VZu6nJImr900uYnrabRepl1Fn9OU0j9QdvuBRDz
	7EYkMgKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEW5n-00000002use-1vC1;
	Tue, 04 Jun 2024 15:28:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEW5j-00000002ur6-3A4v;
	Tue, 04 Jun 2024 15:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F20A0612E7;
	Tue,  4 Jun 2024 15:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90147C2BBFC;
	Tue,  4 Jun 2024 15:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717514930;
	bh=R1YRD2xWbJ4CKWMqqUw5zYxQzZsVAGnyTTQmzDLurbk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=hUcn6va2iO2Svgq2BjnHS2k7iJpLoBCgeIqURzrr3foQWSsbvm3qFmPoZr5y9cMIw
	 Q3TtZ1s23R3mRAbGvoharsyCtOKLx/WRtOC6mnCK+7cl+hPtXLDVzfOd0Hss44ty7E
	 ExDmlClfc4BRbqd73lIxKA2Ae/NfymL0urM8EreUFyolUMQDHP2X5JhYJ91skDzFaG
	 t4toNFuG9AlRxYCIbi61Zwcw6bkcuysdCRZdptyuRuFuLclBeUCVs2rpuic74ZYTaC
	 M4bHe5uuVSoRgA19XfVWK4RHFdCSld1E4mqvOEwzhZ30bZQ64goqkJAI5caXLk9Bkb
	 v6m4Otf9kYxYQ==
Date: Tue, 04 Jun 2024 10:28:48 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240602104021.387713-1-amadeus@jmu.edu.cn>
References: <20240602104021.387713-1-amadeus@jmu.edu.cn>
Message-Id: <171751454718.785691.9170634580021432127.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: mediatek: Add Bananapi BPI-R3
 mini
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_082851_885289_4CA3034D 
X-CRM114-Status: UNSURE (   9.99  )
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


On Sun, 02 Jun 2024 18:40:20 +0800, Chukun Pan wrote:
> Add compatible for Bananapi BPI-R3 mini Router (Filogic 830).
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
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


New warnings running 'make CHECK_DTBS=y mediatek/mt7986a-bananapi-bpi-r3-mini.dtb' for 20240602104021.387713-1-amadeus@jmu.edu.cn:

arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: ethernet@15100000: mac@0: Unevaluated properties are not allowed ('phy-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: ethernet@15100000: mac@1: Unevaluated properties are not allowed ('phy-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: rfkill: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/rfkill-gpio.yaml#






