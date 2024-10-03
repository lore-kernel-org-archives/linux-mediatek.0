Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93C5CF856E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 08:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frHaN26S6j1vJ6qoXYeSLR46HBhnEYVNkUJphNTWVAE=; b=bEXFDDTfVnoUcw1ZE0JH17WD+H
	5n4IDPxFTIWRmfLRKr+Rw7bkfTIZr70WKF5516BCBGlMJ7IzLDhrCKu8O+rqXAtxGp3bzxwIbyf4a
	UgKjwCUVSUAd0+DCEIMyMtrxtedOEprEOB+yQq0LJX0BC/0nMNKkfgyoVWNjiDOvNF2fLd0RTOeYT
	RxeDDt28/zmrhRLlWwSYS1LqSFtmS23m1SsbGyrb5uHO6RArJrGMGeEUT9iUv8ZziQbrt/TZSQ9kx
	14uW7jGe/VOM1Ayuz6idNKb07+XiJuJLToxUvSb+Vl8LpAXjorVDnw1UYcEqqWh1NuLnHI+AVrpNp
	D4ncN6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swHLE-00000008acg-2NEs;
	Thu, 03 Oct 2024 08:37:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swHJx-00000008aOO-2N2J;
	Thu, 03 Oct 2024 08:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727944583;
	bh=pt043Ff6H8qxgHmvl/WZhdH/nIcm8g4J984M1fzICQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q/NqSKn51hsQfi2q3BwO6Lp83zdwze86CQnYOcKsrDfnMnchywKZRNGEmkOnuJZh2
	 mFb5Ouizs2prsCxLVI3eOR4YRbOlTUb/FaJ2t2F12bD8ow69VrgWNHny81HhpopGOS
	 eth2FOQa/0rcB2zaIkzOAlR7rY0ppSkg2usWCskaQhCMIqIcGy13xdBROCb6G/Nfpe
	 r+zJRTEXIHgWy5YnvT5g6SswhWnZV2duV8ffZvKZ1c0uif+QIRwF6PYKmQhsaqsnDo
	 pI1Vqz4Fems5+AhwjnmzA/YwpTcTNvihXfuLocrZaHDah7cZM6Ikuk8jZUWONd2ciQ
	 TrX9BAQiJ25uA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4C7617E10B5;
	Thu,  3 Oct 2024 10:36:22 +0200 (CEST)
Message-ID: <d3052eb4-bfcb-4ee2-9b4b-a4845238c765@collabora.com>
Date: Thu, 3 Oct 2024 10:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] arm64: dts: mediatek: mt8188: Add MIPI DSI nodes
To: Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20241003070139.1461472-1-fshao@chromium.org>
 <20241003070139.1461472-4-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241003070139.1461472-4-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_013625_816648_B1666317 
X-CRM114-Status: GOOD (  13.10  )
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

Il 03/10/24 08:59, Fei Shao ha scritto:
> Add MIPI DSI and the associated PHY node to support DSI panels.
> Individual board device tree should enable the nodes as needed.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
> (no changes since v1)
> 
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 26 ++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index 23101d316c4e..719d2409a7db 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -1839,6 +1839,16 @@ pcieport: pcie-phy@0 {
>   			};
>   		};
>   
> +		mipi_tx_phy: dsi-phy@11c80000 {

There are two DSI PHYs, one at 0x11c80000 and one at 0x11c90000

> +			compatible = "mediatek,mt8188-mipi-tx", "mediatek,mt8183-mipi-tx";
> +			reg = <0 0x11c80000 0 0x1000>;
> +			clocks = <&clk26m>;
> +			clock-output-names = "mipi_tx0_pll";
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>   		i2c1: i2c@11e00000 {
>   			compatible = "mediatek,mt8188-i2c";
>   			reg = <0 0x11e00000 0 0x1000>,
> @@ -2224,10 +2234,26 @@ larb19: smi@1a010000 {
>   			mediatek,smi = <&vdo_smi_common>;
>   		};
>   
> +		disp_dsi: dsi@1c008000 {

And there are two DSIs, one at 0x1c008000 and one at 0x1c012000

Cheers,
Angelo



