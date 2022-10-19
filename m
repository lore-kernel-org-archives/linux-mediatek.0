Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DABBC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 08:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlGQKoY6uVNH2OXWDqyiC4rk8HRSkwe+2QQSYk8BP1c=; b=dRH784+ZexKFtSjk935C7MgAzI
	c2B4f5WDGFL8/F7nltGYm/tq5zBZYS7+GtD2mI3fs0qsSXcG24uO33mEzyyqfTxozFEUS6a9QHO7b
	um1HmQSVVu6Ih4Eo84QTueVS96tSGd4DYjkpSZt01Etwi9soWy/lKlE+4RgNAhc+Hc++wPsv9VcRj
	c3zFNTp0sUOvcX5PSVS9svzk0VCz9dB4loU1Id3doZJb68giIczEfHZQk+X6LHVn1RYToz0Om7Eh1
	bEtcnv/pTzCg6R9uAtJOxU2PSxgttwwfIEkRCH6f5IFvC/w+xqFB7DJc2OhjGc1rR3SYARfEE9qXK
	tDMYV4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol4ru-00H07n-AV; Wed, 19 Oct 2022 08:56:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol4ri-00H002-DR; Wed, 19 Oct 2022 08:55:56 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 754E166015ED;
	Wed, 19 Oct 2022 09:55:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666169753;
	bh=qCUZKYlUvnwloHXmaClS+rjs+8bWGqFAUjftTWAGEx0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LjE9o1GkblbjvaNm++jLYcGI4z/7vIBJEIcY9dQ++qrF+YgZSueMSbMEgippcC9Mw
	 pLlEtU7beTPzMCPEZ6cNp3+GeTyHcDiUkUs37Tmd6FG6BeuD1bl1mMHh+54tbwUy27
	 9y07KjbsIHu3KFQVGQBU5ATCPRLarQwbSAsOF8yOynbMqANFjGrVTAo4MSnbhNQs0v
	 K5gNaAJ2l5wNOKPA09IVlZK15+UtGaJXSPWSkIJpUFQzJoqBI/GLNiiSx6hDMH5Psm
	 4sp+lykeNyXJ/ZVIO9mrnvEVWhHmy0rqXMUZF3viHi8tHPL3KQdeCq1lYLQpLTmb03
	 uhmwv4ph4+UnQ==
Message-ID: <c30fbc60-bcdf-71f5-0db7-bd9bb27ddd37@collabora.com>
Date: Wed, 19 Oct 2022 10:55:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 2/3] arm64: dts: mt8195: Add pcie and pcie phy nodes
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221017070858.13902-1-tinghan.shen@mediatek.com>
 <20221017070858.13902-3-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221017070858.13902-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_015554_666781_315FE9BE 
X-CRM114-Status: GOOD (  15.29  )
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

Il 17/10/22 09:08, Tinghan Shen ha scritto:
> Add pcie and pcie phy nodes for mt8195.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 143 +++++++++++++++++++++++
>   1 file changed, 143 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index d03f0c2b8233..903e92d6156f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1182,6 +1182,104 @@
>   			status = "disabled";
>   		};
>   
> +		pcie0: pcie@112f0000 {
> +			compatible = "mediatek,mt8195-pcie",
> +				     "mediatek,mt8192-pcie";

..snip..

> +
> +			phys = <&pciephy>;
> +			phy-names = "pcie-phy";
> +
> +			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_MAC_P0>;

You're missing the resets:

			resets = <&infracfg_ao MT8195_INFRA_RST2_PCIE_P0_SWRST>;
			reset-names = "mac";

> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 7>;

..snip..

> +		};
> +
> +		pcie1: pcie@112f8000 {
> +			compatible = "mediatek,mt8195-pcie",
> +				     "mediatek,mt8192-pcie";

..snip..

> +			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_MAC_P1>;

Here too:
			resets = <&infracfg_ao MT8195_INFRA_RST2_USBSIF_P1_SWRST>,
				 <&infracfg_ao MT8195_INFRA_RST2_PCIE_P1_SWRST>;
			reset-names = "phy", "mac";

> +
> +			#interrupt-cells = <1>;

..snip..

> @@ -1241,6 +1339,34 @@
>   				reg = <0x189 0x2>;
>   				bits = <7 5>;
>   			};
> +			pciephy_rx_ln1: pciephy-rx-ln1@190 {
> +				reg = <0x190 0x1>;
> +				bits = <0 4>;
> +			};
> +			pciephy_tx_ln1_nmos: pciephy-tx-ln1-nmos@190 {

Please run dtbs_check and try to build the kernel before pushing commits upstream.
This will give you a not-so-nice warning and that shall not happen.

You can solve it by naming these nodes like:
pciephy-rx-ln1@190,1
pciephy-tx-ln1-nmos@190,2

...etc

Regards,
Angelo


