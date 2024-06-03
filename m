Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0ACC25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 07:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6hjTvmn9BTjBM6NU/G5VjqSTE5y2rlA457oZ5XzkYI=; b=Pxl9su/IIW5WHR2uXbjRkZ9Ake
	R03tz6q4bD6Smtpf7sAq78QELnHQ8L783XbLlPXOC8aAtoPOf2L1hF9zpagnftV9dOQdmtDAyySVw
	EIOSqq4t7cXhNlS9QU7g+8qncjy+mExcrLe1/oBcm7C7fkySFUMytsqBijL5q0ChmMOfkRAQlEMRB
	U7ZzZNPO66vDBV5vy7fcEBQ6Ktvv7c+QyXyU+JGcRvHwjPJWqF4P0IxUwvNIGtRaqWhY3VrNp18am
	pkag0EGjWwH/T//niZ/ivek7Ykx7qET3KoROcwt34BFcvDjxRQabZDhwdvhkaY/IJSW98DaDT/6F5
	Hw9v57xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2GP-0000000Fuyl-3Klm;
	Mon, 03 Jun 2024 07:37:53 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2GI-0000000FurF-0GMg;
	Mon, 03 Jun 2024 07:37:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717400263;
	bh=0ZTbWXDKccVB2JD3rAJmUufRXjsYP9Y1lA2ybBWy5hc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vDafQGTRrQv6ATZesjM0KMXd1XK648fVSi8sOaUgtu3AKw0HQaMGnVwcu8tzZKtBO
	 POXBI7awfIrAYPMHcLYdyIn0e3ZS0wAz0opSTjp4tvOEqEUKKDDeh99jU74fZiUIBt
	 fnPQWf1NhfFaVuw150JKOcQ8aOKbbBJfh2ualS038jCzm2cL8R7rE6TXGps33Guo2Q
	 l/QRcL9vBGU1+XydKcWlQs6lmfoEH8veficATxuzt9XjZZpWPGYw8e/flMsyilZVKJ
	 qxrTLzdcnixqvibuhLwfokY4C7vGGrU2wx11tZdU0d+jp0A/N56eTWJZ4bJSmoyQF7
	 hvy0qcdSHMSxw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 025D937821DB;
	Mon,  3 Jun 2024 07:37:42 +0000 (UTC)
Message-ID: <703cfd0b-5d16-4888-bcc5-5742ee16fd29@collabora.com>
Date: Mon, 3 Jun 2024 09:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt7988: add I2C controllers
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240405125549.11972-1-zajec5@gmail.com>
 <20240405125549.11972-2-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240405125549.11972-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_003746_280526_F461603B 
X-CRM114-Status: GOOD (  12.91  )
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

Il 05/04/24 14:55, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7988 has three on-SoC I2C controllers that are the same hardware
> blocks as already noticed on MT7981 chipsets.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 45 +++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index 27098f724b7a..b4dc81881cc7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -124,6 +124,51 @@ pwm@10048000 {
>   			status = "disabled";
>   		};
>   
> +		i2c@11003000 {
> +			compatible = "mediatek,mt7981-i2c";
> +			reg = <0 0x11003000 0 0x1000>,
> +			      <0 0x10217080 0 0x80>;
> +			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
> +				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
> +			clock-names = "main", "dma";
> +			clock-div = <1>;
> +			clock-frequency = <100000>;

As commented on 7981, please remove clock-div/frequency from SoC wide DTs.

Cheers,
Angelo



