Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3114AC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jjhwb3N70ms/j1i4bo7QKbXNHaIJIzIejW0oNyuj4bg=; b=OeQFCWFWJZ11ZHQjV3la7Qpf2Y
	tZ6Nx5vb30ZmY2wMONd8raXBsVEyGqJzebUp1nhvJBs38v1rOMst0aHrhBQvXcKDkzdCRQwcD/veY
	4Axl3lHN8yvC+sPxYQdJxyTcbwx2UBfwAN/ulr07/5bQp+MoRX/4rdUMZ/cpuvkX1HrcewOsUr4GB
	pHPjjk29SVu291YurkN6H8oU/NX0T+SKBizaSsHcrOhAR14IpQ67mNzYW2ETfQBpO8e4yrgeHglVK
	y5ba5LE1Q1eZYZJ4AR4vGtOTZd8dMfFbYPtAiVhNaDb05TUxt8qdrW5MN8iyo5T6zufkGLSuhcUzI
	2AV9BVkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAZ4D-006G6o-I9; Wed, 28 Dec 2022 16:14:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAZ3z-006FyI-5R; Wed, 28 Dec 2022 16:13:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Jjhwb3N70ms/j1i4bo7QKbXNHaIJIzIejW0oNyuj4bg=; b=q3zHczMspDGI0BcJTxyCVqPWKl
	15mJ+UvJgN7C/+aXofFshb7hlNJz/wBhhP82ReDZOmUJytZMts8SR+vvemM/GEqgaW+TC0j5UhZpR
	dp1k1N1afxlz7eJ7DbQPdY0pVFalZthdOHpH5M+iMKTq/bV1ExA4UJXZ/fPOW0qMxBfY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pAZ3k-000e6S-LX; Wed, 28 Dec 2022 17:13:40 +0100
Date: Wed, 28 Dec 2022 17:13:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Biao Huang <biao.huang@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	macpaul.lin@mediatek.com
Subject: Re: [PATCH v6 2/2] arm64: dts: mt8195: Add Ethernet controller
Message-ID: <Y6xrNAyvJhP22RdF@lunn.ch>
References: <20221228063331.10756-1-biao.huang@mediatek.com>
 <20221228063331.10756-3-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228063331.10756-3-biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_081355_240693_90D9767C 
X-CRM114-Status: UNSURE (   9.89  )
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

> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> @@ -258,6 +258,66 @@ &mt6359_vsram_others_ldo_reg {
>  };
>  
> +&eth {
> +	phy-mode ="rgmii-id";
> +	phy-handle = <&ethernet_phy0>;
> +	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
> +	snps,reset-delays-us = <0 10000 10000>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&eth_default_pins>;
> +	pinctrl-1 = <&eth_sleep_pins>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;

The mdio bus master is a property of the SoC, not the board. So i
would expect it be in the .dtsi file.

> +		ethernet_phy0: ethernet-phy@1 {
> +			compatible = "ethernet-phy-id001c.c916";
> +			reg = <0x1>;
> +		};

Is the PHY integrated into the SoC, or on the board?

You also don't need the compatible, if the PHY correctly implements
the ID registers.

   Andrew

