Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4DFC54E4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 08:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvYyviEms1rXP6dVf4nZblrYyR95ODOJu6d+v6unsNw=; b=gmDEGghUrMDwL9bGNRj4lpGLYG
	l2MhWcHKPjsBTGt3Baqdc7uckHxvwI5FWgk9LUBvfpU0VKurAH3scBdUHE3d5pd/dIgr/pPp3WuVt
	DFiKKQG5TbYmY4wA8CSVtV+g6lqYOo5P+AhSofPt/yPF8+yFVif/oQ5GpmF1w4e/eOsZo+z9hXQ0C
	4TZpnpXjMxHEWFlhck8T9sVOWR5WYxVDAIq12C4aNsEr6keMC1B6xNDZy33UO9ga0L4NW4Oa5uZgQ
	QIe/PrB99GRn6Je89WnrWuehJyVZBXDFfCAQdSLxr1ZsWvo9FBdOR5rleFTvmKq8xrSoxi37OrW0u
	liqGfhjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVqC-00000008OA1-2Oga;
	Fri, 08 Mar 2024 08:44:32 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVq9-00000008O7n-0cWJ;
	Fri, 08 Mar 2024 08:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709887467;
	bh=B7LQlsTP8n7h7BoltSXzPKTfWSgRJiLpFX0/sEPwOfA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jc+M824nUahP8KaBVrM5zRu5925hP6lIzzPi9RvYdAN4ZFGx9IuYsUdbEWnHfhNs4
	 y9hSpl1tXJtpmYJpU9NT5yp73X/ME3on1IV3XeTm6B/nFHVU693lXJI4u46UFfAj6/
	 Kpuc5/jlSQx9D5CdTXBHyqdBFDgbzRCBd9sVbvb7Z5QeSZPx0RC3GO49TLhZ4Xe6Ks
	 FZmsTzSz90xrSazCH46Xhmb9Hu7Ttutt3LpgrNt7Q6La+/SWMSVOoGjqkftFjEjLYV
	 giFDm+rC8kokq1qLuBsaX9jZ+XMpoUzqI7OK/8nMqrqpl0MDiAEV+WldQ/P4u0V5u+
	 Ih0a6OXos1bHg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DC7A437813CA;
	Fri,  8 Mar 2024 08:44:26 +0000 (UTC)
Message-ID: <221bb898-a98f-4a2d-9301-84a3baefbbc7@collabora.com>
Date: Fri, 8 Mar 2024 09:44:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mips: dts: ralink: mt7621: add serial1 and serial2
 nodes
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <CAMhs-H_eUKm7C40oCzuKwwEMZAcOJ-g4MghAfkGAmxRM0AXPUw@mail.gmail.com>
 <20240307190408.23443-1-justin.swartz@risingedge.co.za>
 <20240307190408.23443-3-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240307190408.23443-3-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_004429_354217_60A2A6DE 
X-CRM114-Status: GOOD (  13.31  )
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

Il 07/03/24 20:04, Justin Swartz ha scritto:
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

As already commented on patch [1/3], pin muxing is board specific. Please remove.

Also, is there any reason why you can't simply use the `interrupts-extended`
property instead of interrupt-parent and interrupts?

Regards,
Angelo


