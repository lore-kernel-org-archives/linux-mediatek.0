Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12966E92FF9
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 08:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JC/Y12EylaACz+3Akf5BGGYFO2wYpjGsyjNaRas0zLQ=; b=Nc73xsEF0iLI0+nYkIziCwqnMG
	5VN2TzjPrl2gJ//hed9qAPwJjhqVIXnmnUGorq/vkIwwyDPwXmG3FZMMAa+zR8ow9eYPLPOR20Vj2
	x3oRKi9bgBeJH593IwMvhaiBxwramRGPy99y12z6oB/4qhQ6RhkVJcuv1zcnuA+rgrS2YV+qdQF6+
	jA9CndS8jn+1Yumuj8Walw3mUqfdsXMDxL0WoOymalF8oTcyQLcnAOGHp2TivuQSOUAE9MuHHDPmr
	T25wGTRAYs2lDcHSkBl6WQVysfnBqgoj3YpUkq4VOVysi9/uSeDjxnUUjEiAzym9EL8WnRAbb3T31
	CzHdGaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qog8t-005HVR-2A;
	Fri, 06 Oct 2023 08:25:03 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qog8n-005HOk-36;
	Fri, 06 Oct 2023 08:25:00 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1qog8g-0002lN-00; Fri, 06 Oct 2023 10:24:50 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E4D8CC0250; Fri,  6 Oct 2023 10:22:14 +0200 (CEST)
Date: Fri, 6 Oct 2023 10:22:14 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mips: dts: ralink: mt7621: define each reset as an item
Message-ID: <ZR/Dtm0wTCa/V26h@alpha.franken.de>
References: <20230917103753.52644-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230917103753.52644-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_012458_145177_790E5239 
X-CRM114-Status: GOOD (  18.14  )
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

On Sun, Sep 17, 2023 at 01:37:53PM +0300, Arınç ÜNAL wrote:
> Each item of the resets property should define a reset. Split the item with
> two resets on the ethernet node into two separate items.
> 
> Sort the items of the clocks property to the same line as a trivial change.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
> index 7caed0d14f11..35a10258f235 100644
> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
> @@ -300,14 +300,13 @@ ethernet: ethernet@1e100000 {
>  		compatible = "mediatek,mt7621-eth";
>  		reg = <0x1e100000 0x10000>;
>  
> -		clocks = <&sysc MT7621_CLK_FE>,
> -			 <&sysc MT7621_CLK_ETH>;
> +		clocks = <&sysc MT7621_CLK_FE>, <&sysc MT7621_CLK_ETH>;
>  		clock-names = "fe", "ethif";
>  
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		resets = <&sysc MT7621_RST_FE &sysc MT7621_RST_ETH>;
> +		resets = <&sysc MT7621_RST_FE>, <&sysc MT7621_RST_ETH>;
>  		reset-names = "fe", "eth";
>  
>  		interrupt-parent = <&gic>;
> -- 
> 2.39.2
> 

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

