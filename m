Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DB1C5475B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68xRTvKgjMMxWFNhVx7F2wdVk1GhEhfuGHUI1YvmBVo=; b=HElPmlrInKKraQsS/7pl6jl/eu
	bPLd9/anokltIRsCGp3Pl04hdaQ7qI8imMJK398I7mBgmp5P75QEYkqN8oIdRse3kwZywTf5vbu85
	2BTHuzcHLZ26d9IsKIVOkx081ABGXRRAqgBrk2ySxBwmxMIwSioKE92DDF2dQ4tX+pFgkSqCy1NoS
	YkBuv7vgkaNVklB93OTSEu2tLGfzYfkuziy5a+7iFbEmP7eHSeMlKpwJo83vcCBuLhifrEaxUdGzE
	rXTQM38XC24CUUigJfevUd4EAxSFLgPkfyadi8GwNGTEj1bfRkcX0X8hm/i3YKxVZw9WzZILz+GS0
	RR5h3cIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjfOI-00000001YR1-2RLK;
	Mon, 11 Mar 2024 13:08:30 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjfOC-00000001YOs-20Yj;
	Mon, 11 Mar 2024 13:08:27 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rjfO2-0001be-00; Mon, 11 Mar 2024 14:08:14 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0B6CEC066F; Mon, 11 Mar 2024 14:04:44 +0100 (CET)
Date: Mon, 11 Mar 2024 14:04:44 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] mips: dts: ralink: mt7621: add cell count properties
 to usb
Message-ID: <Ze8BbC5i94jbote1@alpha.franken.de>
References: <20240308161130.12228-1-justin.swartz@risingedge.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308161130.12228-1-justin.swartz@risingedge.co.za>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_060825_280312_A3DF9842 
X-CRM114-Status: GOOD (  17.81  )
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

On Fri, Mar 08, 2024 at 06:11:30PM +0200, Justin Swartz wrote:
> Add default #address-cells and #size-cells properties to the
> usb node, which should be suitable for hubs and devices without
> explicitly declared interface nodes, as:
> 
>    "#address-cells":
>      description: should be 1 for hub nodes with device nodes,
>        should be 2 for device nodes with interface nodes.
>      enum: [1, 2]
> 
>    "#size-cells":
>      const: 0
> 
> -- from Documentation/devicetree/bindings/usb/usb-device.yaml
> 
> Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---
> v2 -> v3: Patch revision commentary removed from commit message
>           as instructed by Sergio Paracuellos.
> 
> v1 -> v2: Reorder the properties according to
>           Documentation/devicetree/bindings/dts-coding-style.rst
> 
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
> index 02e1f2491..6e95e6f19 100644
> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
> @@ -307,6 +307,9 @@ usb: usb@1e1c0000 {
>  		       0x1e1d0700 0x0100>;
>  		reg-names = "mac", "ippc";
>  
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>  		clocks = <&sysc MT7621_CLK_XTAL>;
>  		clock-names = "sys_ck";
>  
> -- 

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

