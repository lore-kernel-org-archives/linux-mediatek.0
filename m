Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2D6C48BC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFoz+JIm+wOI1jU20aqziiihRvXpUGSavPhSu65tPw0=; b=1fDwjmBI9uHpzZUBihmRIZ4BjB
	MerH9JeKLuNES79WcXN9y3M88IZ/5NEvsFXeMI6i8VAT+RAA64THYQ83QcRzI2TVzbpwYEtjVIMBv
	v9ianb6I1JjKzW87FK6Y4WHByZnoUdJ9TchuqiFgRK1xDxyt9hXbb1HJDylWrkdkq+wUhxtJfAtG5
	yHrX+B+1Q4Xh95aegXIy2YBfINtkndkd1rLb6gsLLbwrmiCtt2ignsLc1NHbmvhbsrn9eSuj0Fy8j
	RkpVeI19nAZkBYx+ZDOTCk4wdegZdncYStgM0EiFm38utd/xY6QVrVhqf7aBMcavbVCipRxpQPvHk
	0QpSPPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjPI-00000000PPT-07Oi;
	Wed, 21 Feb 2024 10:00:52 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjPE-00000000PNw-0jES;
	Wed, 21 Feb 2024 10:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708509646;
	bh=wcF4f8oB66/zilBylgZvCVlgJPjo9n+Rs862VHuPPtE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ibcIOx9khG/HibZOQuADQzzX0BqkCDivppWffmnMYxNslmqkpFm4o7N7PSjEXpZ+G
	 Xkdg1M6DbzGGnluOboEfBBz6dgGonmZt8Vz6i/lpF+UaPao1G5aEhqUTAp5CqpLBFC
	 7ZcopzX8/GZGhqzB3/JNcM/Ti4BS7Giq6lr0tyuK1sQiYXvUNwENPtHCChZn3Z0pDr
	 Y4UCiCgo/6gwEHwz07zjY5tP+23KdmbN3DX/rLDIA8EN4lDzOdo6kj1EIZXPHmy5nm
	 8Jj09w1Yn8pqWutpt+q4W1c5Tkjc3MRHBeHMIejmpoh37n7En5xTC0aMcKkauIjoku
	 kr1ftJPjRQhtg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7292237820C8;
	Wed, 21 Feb 2024 10:00:45 +0000 (UTC)
Message-ID: <770b23ec-7199-4202-888d-6a22b7f4af74@collabora.com>
Date: Wed, 21 Feb 2024 11:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt7981: add pinctrl
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240221073524.20947-1-zajec5@gmail.com>
 <20240221073524.20947-4-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240221073524.20947-4-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_020048_365035_B5F26D49 
X-CRM114-Status: GOOD (  14.13  )
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

Il 21/02/24 08:35, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7981 contains on-SoC PIN controller that is also a GPIO provider.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 37 +++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> index 4feff3d1c5f4..fdd5c22cfc9c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> @@ -86,6 +86,43 @@ pwm@10048000 {
>   			#pwm-cells = <2>;
>   		};
>   
> +		pio: pinctrl@11d00000 {
> +			compatible = "mediatek,mt7981-pinctrl";
> +			reg = <0 0x11d00000 0 0x1000>,
> +			      <0 0x11c00000 0 0x1000>,
> +			      <0 0x11c10000 0 0x1000>,
> +			      <0 0x11d20000 0 0x1000>,
> +			      <0 0x11e00000 0 0x1000>,
> +			      <0 0x11e20000 0 0x1000>,
> +			      <0 0x11f00000 0 0x1000>,
> +			      <0 0x11f10000 0 0x1000>,
> +			      <0 0x1000b000 0 0x1000>;
> +			reg-names = "gpio", "iocfg_rt", "iocfg_rm", "iocfg_rb", "iocfg_lb",
> +				    "iocfg_bl", "iocfg_tm", "iocfg_tl", "eint";
> +			interrupt-controller;
> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&gic>;
> +			gpio-ranges = <&pio 0 0 56>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			#interrupt-cells = <2>;
> +
> +			mdio-pins {
> +				mux {

That's board specific. MDIO and SPI0 pins can be used as GPIO instead of,
respectively, ETH and SPI.

Must go to your board devicetree, not here: please move both.

Cheers,
Angelo

> +					function = "eth";
> +					groups = "smi_mdc_mdio";
> +				};
> +			};
> +
> +			spi0-pins {
> +				mux {
> +					function = "spi";
> +					groups = "spi0", "spi0_wp_hold";
> +				};
> +			};
> +
> +		};
> +
>   		clock-controller@15000000 {
>   			compatible = "mediatek,mt7981-ethsys", "syscon";
>   			reg = <0 0x15000000 0 0x1000>;


