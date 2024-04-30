Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA062C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 11:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DN6EOn0nHO058DqHAbUZCNNlvPgyZbdAvPp0bMrcSSc=; b=QHlgeain8M9gGoIc74fS1yfQCD
	w6RK4QE8xvOZTOAHdmfN7oTl6jGISzMbr+LJzOAlFc3cxkEDgRXTQyaVLKl26sLMj5fxAOGNMmlkh
	na3nzMxO9uc5BSdRM4XA+2YdZPnCHzVfRi1paN+T+lN79TQu5/RayU9iqS7r/gQA8GsQB2tn2Zc87
	rhvjj5CbhaJlBjuKslG7/N6YX/T1CUYg8gCwvQMh2KJ5F0zdEbbVBUk8ndz1lRYOtYba46MGGMFSz
	jNS4dd+zCshOmEIQsQoWooSbumHp+Z134lu9s7W1W++99ijXPtMXie/heSsQH4Z4kBAm0JukwYk+b
	MAsS5aiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1loD-00000006CHh-1Ofg;
	Tue, 30 Apr 2024 11:38:05 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lo8-00000006CGn-38xM;
	Tue, 30 Apr 2024 11:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714477079;
	bh=bA1WxVrJk25c+e9bSKCDAL9FCffjUV+I91lWTDNHdl8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HGaqpM8+UgVOyyq+djiiTAPm50lD41UxG07NSSdJy9ZqrNbIN82CCDf5gCz5+Tk8q
	 VkUvY2ePspF/u0gqirTQDlHgosnXB0Xbaqo0CFzLG4gMMRchSllVbImKZzHATdA2Qr
	 0GzISpc1hvhSZWye+liF3Ni71UIKRj74VVOeYJ/2JSOEt1FaXiccNmwa/9dhK3gydH
	 FXubUujbEq30BAAs+7mO//bI8ofSJF8kihagNi4WlXvLDaNxb6hBD+f+oS2Nu+/UTR
	 9/goMLxCI4gPgX8q1qB1YAPU31lxrEIvrH9AVpzlXCGaGdd3Zy5i8Oxk/gqlv1D37A
	 fLaH1+ySFvKZw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E31E637813C4;
	Tue, 30 Apr 2024 11:37:58 +0000 (UTC)
Message-ID: <9471af68-b210-4112-a82f-1a9570feeb40@collabora.com>
Date: Tue, 30 Apr 2024 13:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7981: add efuse block
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240430112932.20475-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240430112932.20475-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_043801_011292_E7912531 
X-CRM114-Status: GOOD (  14.46  )
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

Il 30/04/24 13:29, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7981 (Filogic 820) is a low cost version of MT7986 (Filogic 830) and
> has efuse compatible with the later one.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> index 2d7f91196e64..a5ea168c8fa7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> @@ -133,6 +133,13 @@ pio: pinctrl@11d00000 {
>   			#interrupt-cells = <2>;
>   		};
>   
> +		efuse@11f20000 {
> +			compatible = "mediatek,mt7986-efuse", "mediatek,efuse";

I'll be honest here - I've been tempted to do "that" way too many times... :-P

..but no, you have to add a "mediatek,mt7981-efuse" compatible to the binding and
use that instead of the 7986 one (and I'm sure you understand the reasons too...)

Cheers,
Angelo

> +			reg = <0 0x11f20000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>   		clock-controller@15000000 {
>   			compatible = "mediatek,mt7981-ethsys", "syscon";
>   			reg = <0 0x15000000 0 0x1000>;



