Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38720C636D3
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 18:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IXicstjHuwguT8Fh/WIHS8GXjy088LWoEqhgeDrK+bQ=; b=FKqcMOCP7hRGPs
	cUzx24W+2PHNWgqdzrkUlgptcerZxgkmswIGtqEFhTlxEgm00KgRyz0YTs/bnVFUQNFIZ25FlCnQl
	fcI+Fxh2qLBrBAWiW12XAjeUafJEG/F8B3fBWpf0NWZ7M2qe3WS+oexYjrVRxsrGFFdBykmlB80de
	M1TG4pWiTs1YUSYl+NpeXEEhl3TDYzBLkLmNjEIyfi/5Xi+43Q5ZHoW69lKXXDGlrHmB2hWPerM9T
	IQ3bfRimhcVIefCSVuUR/po1McFjDWOhTxU7fBzy9sZ9DZ2TwN3y49uehXCf+Hx6lmcKgdLkobg1i
	jWHWKcqSsmtXzIQUVSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPpUU-00GfBc-E0; Wed, 08 Feb 2023 18:48:22 +0000
Received: from sender4-pp-f115.zoho.com ([136.143.188.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPpUK-00Gf9q-Fy; Wed, 08 Feb 2023 18:48:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1675882086; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Yb7SIoAqSyVUCaZACfI9Atv9XBR1dP0/ab5pS/fg/Y5Clw2zjBWaOoLwX8IY3Ltm1B/Z+bS7A0Mp/uG47u6AI0HzNoJ2571J52TQ9sJw7gSZQ2JrgdHyY5GeREKn7sJ+TvnMiCrCaPjD1IggkoAXzKnvvpPmXXD0NXWh6nuU5PQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1675882086; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=IXicstjHuwguT8Fh/WIHS8GXjy088LWoEqhgeDrK+bQ=; 
	b=Kh7Kbga0w3wD1oYT+NldEN3IN/Rhhar+dTEcs9K/DrWrecnpxbB33b7qfuig5MKp9P71gkXFVZ7VXsjdVZFeeuR3WBKnGtmdIMQ+1pNoVLhzlxMUzdC/OK9O0MBoehSSbv/vudFzv8QGJGArphM7spOuBM3H8kLWvM/De1nBP2Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1675882086;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IXicstjHuwguT8Fh/WIHS8GXjy088LWoEqhgeDrK+bQ=;
	b=D7/BKwpBl6tH8oZ+dAgUFg8F/WEMSoy+7CXWhofQUay7oK8xHFWtxmY5RH8QJYTd
	nNIhhL7Uttbc8Ah8gOYXKZOVThWPP9+72CWqUEkTqgyl0tIkyLmLkqQzUGvoWnfLyj0
	dyG7VnROanuPJYSt38VeYnE3sskeXV0tXR+lKkGg=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1675882083870532.6421856450785; Wed, 8 Feb 2023 10:48:03 -0800 (PST)
Message-ID: <81ecea6c-210d-867d-7e96-25783c5e3d1d@arinc9.com>
Date: Wed, 8 Feb 2023 21:47:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/5] arm: dts: mt7623: mux phy0 on Bananapi BPI-R2
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230201185656.17164-1-arinc.unal@arinc9.com>
 <20230201185656.17164-5-arinc.unal@arinc9.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230201185656.17164-5-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_104812_607349_CEEC1219 
X-CRM114-Status: GOOD (  16.02  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

OK, hold this patch series, I'm going to send v3 soon with enabling both 
CPU ports to support changing the DSA master. We've got developments on 
the MediaTek ethernet driver and MT7530 DSA subdriver that surpassed my 
expectations.

Arınç

On 1.02.2023 21:56, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Mux the MT7530 switch's phy0 to gmac5 which is wired to the SoC's gmac1.
> This achieves 2 Gbps total bandwidth to the CPU using the second RGMII.
> 
> With this, the interface name to access phy0 changes from wan to eth1.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>   arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> index dc9b4f99eb8b..64700253fd35 100644
> --- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> @@ -182,6 +182,12 @@ fixed-link {
>   	};
>   };
>   
> +&gmac1 {
> +	status = "okay";
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy0>;
> +};
> +
>   &eth {
>   	status = "okay";
>   
> @@ -189,6 +195,10 @@ mdio-bus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> +		ethphy0: ethernet-phy@0 {
> +			reg = <0>;
> +		};
> +
>   		switch@1f {
>   			compatible = "mediatek,mt7530";
>   			reg = <0x1f>;
> @@ -200,11 +210,6 @@ ports {
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> -				port@0 {
> -					reg = <0>;
> -					label = "wan";
> -				};
> -
>   				port@1 {
>   					reg = <1>;
>   					label = "lan0";

