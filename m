Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F587C54E4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 13:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAEC4Dub2/B8+gKqX6uXa9E3HnjRHGOxZ7CagoI5Uzs=; b=4aNVgi1PBf3M2B60cSTpn+tHOQ
	x672mlpbowcreQap2Sn4ClC1SfSv6JNm5cZ/KtrrNEJJxYozDqLy23eWb3ylxCLpuZv0DLhaNImJy
	jnrrC7U+OaTViII5H3FdJJmfX1mqu0tb6UyM580J61Kb884R5QCPq9glCaq+ZCIhzGz4bdNvEZw/+
	jh4f5QOK5vTnoymmEabkDTulh/keD97eEoDMPUid/QseKocLUC2Ji3Em3VP4pmthfC5qJ0uIGzFg4
	Sb/zYi8dhLrtqz0a1RGY+e/DUp2Bwbe/q1ZWEGYzPgQZu9HwuPmdc39TBFkSBgCybM2GJFm9lB3+G
	5f+ghwKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riacz-00000009NQn-0iIt;
	Fri, 08 Mar 2024 13:51:13 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riacw-00000009NPZ-0HUc;
	Fri, 08 Mar 2024 13:51:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 727CC6000F;
	Fri,  8 Mar 2024 13:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1709905866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OAEC4Dub2/B8+gKqX6uXa9E3HnjRHGOxZ7CagoI5Uzs=;
	b=ERDSAHkKO3hIThuHgHrC1TNON12OSbX3ZEEoP0YMdqGSFwSOmUv/5xDozhBEaZ4ezlWbBM
	q7X8K1p83AZtR9NXCDbsftrs3KkdFI3W8VhIhP8Wk02iKgTt/qOMDIfBEt8jS+eALkuaFZ
	2D9rTxaW133tA7ij30sSXF3E87bT4OfbgPNG0u62eYcZ5clSPtKMZCl+7br7ouh2pj6Y7e
	Kkyjks4O+oUk+ciPhuA/VcWKQACi+ENxpZrTNunstFCL8MiHe0xGhU8AIRsp2BLvWU9GQa
	mFRKUgIOhfS2+Hsw25eecPkmEQBN8mtsPGWx9J4T8mtgVxDMztnWpOOdVnNr+Q==
Message-ID: <55f6ee5c-84af-4976-a66c-63800f733f8f@arinc9.com>
Date: Fri, 8 Mar 2024 16:50:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mips: dts: ralink: mt7621: add serial1 and serial2
 nodes
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <CAMhs-H_eUKm7C40oCzuKwwEMZAcOJ-g4MghAfkGAmxRM0AXPUw@mail.gmail.com>
 <20240307190408.23443-1-justin.swartz@risingedge.co.za>
 <20240307190408.23443-3-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240307190408.23443-3-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_055110_359120_2F1C2EFD 
X-CRM114-Status: GOOD (  11.82  )
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

On 7.03.2024 22:04, Justin Swartz wrote:
> Add serial1 and serial2 nodes to define the existence of
> the MT7621's second and third UARTs.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---
>   arch/mips/boot/dts/ralink/mt7621.dtsi | 28 +++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
> index 3ad4e2343..5a89f0b8c 100644
> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
> @@ -124,6 +124,34 @@ serial0: serial@c00 {
>   			pinctrl-0 = <&uart1_pins>;
>   		};
>   
> +		serial1: serial@d00 {
> +			compatible = "ns16550a";
> +			reg = <0xd00 0x100>;
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
> +			clocks = <&sysc MT7621_CLK_UART2>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SHARED 27 IRQ_TYPE_LEVEL_HIGH>;
> +			no-loopback-test;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&uart2_pins>;
> +			status = "disabled";
> +		};

I would group this:

		serial1: serial@d00 {
			compatible = "ns16550a";
			reg = <0xd00 0x100>;

			reg-io-width = <4>;
			reg-shift = <2>;

			clocks = <&sysc MT7621_CLK_UART2>;

			interrupt-parent = <&gic>;
			interrupts = <GIC_SHARED 27 IRQ_TYPE_LEVEL_HIGH>;

			no-loopback-test;

			pinctrl-names = "default";
			pinctrl-0 = <&uart2_pins>;

			status = "disabled";
		};

Same goes for patch 2.

Arınç

