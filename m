Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA198C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 12:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbvK0vbcj2dlur1G4GYdQfKYvi6plRhkQX5fG0/6XaA=; b=hHw1XB7tMvtgGsvq4LmcOMCQD+
	5YKr9W1JCvWfi+L1lKHFDRst5dviehhBuPjyo5kxoBmm/Z+/6nzoPFy6ARpLGgJ3HwghY35tkwI+0
	2f+v14keVunhfiM+QXL6djizyLpR/0INzlycOYdJu7fY2PUSva91rEYbcuyda5M7z5724GRL/Rank
	sqsurxnj3TClq4BcPMm+IDgk0XUrnJaUgXRIIffAun/pVYgx9SFMm400EbyjEJIishTjDWAuGbjKG
	G5ayBSKXLxyAWDiVcTO55nVaMqy6jN6qZ6YejT7AgjPH37Hg4whDCkXeIctrLdQy8eGHmN/Ch4mqs
	+8TDXX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7n4-000v3e-St; Wed, 18 Jan 2023 12:43:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7kP-000tp4-6J; Wed, 18 Jan 2023 12:41:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A50DA6602E0B;
	Wed, 18 Jan 2023 12:40:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674045655;
	bh=+loW/XVzSr0xbOK3szJGLSNgt77x/7ltGgyJxfGL0Dg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lwg4co7MNW1JwE74DkaEE6ExU6hkaR3ExFGYuucN3sCUcKLmIp/UM73u3ickeVvn1
	 5EXe6WN6+PtIsV+oWvqpMc905xTdpKfu3DLpuNhuXAXxwjrjWExk2OinrAUn6wYS4T
	 fahWz4jcYoQUd8xgkSp2btTY/27JvHxMdd+sG3N6P/qbdtcqfChnCYSJaKLywzPlpl
	 gVJ4aYoskD5qSK63XTQjd/+5N/U3tbVTc1YT7bL/mpxL7i1bVkso+nhG2PBqAfCy7F
	 7SXMMlJRKd9bucWAWMvmfTiHdnlHm7TUmBjo3XRvqLGjAK2xbkCABWe5+3brWtOJBF
	 R4nIxrtcU81DA==
Message-ID: <4da35cf7-5c8b-1086-36aa-760d20774c7c@collabora.com>
Date: Wed, 18 Jan 2023 13:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/9] arm64: dts: mediatek: mt8186: Add MTU3 nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
 <20230118091829.755-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230118091829.755-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_044057_425110_2A1B804E 
X-CRM114-Status: GOOD (  15.07  )
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

Il 18/01/23 10:18, Allen-KH Cheng ha scritto:
> Add MTU3 nodes for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 75 ++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index c0a3afd55eaf..3d88480913eb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -908,6 +908,43 @@
>   			status = "disabled";
>   		};
>   
> +		ssusb0: usb@11201000 {
> +			compatible = "mediatek,mt8186-mtu3",
> +				     "mediatek,mtu3";

78 columns; compatibles fit in one line.

> +			reg = <0 0x11201000 0 0x2dff>,
> +			      <0 0x11203e00 0 0x0100>;

80 cols; regs fit in one line.

> +			reg-names = "mac", "ippc";
> +			clocks = <&topckgen CLK_TOP_USB_TOP>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_HCLK>,
> +				 <&infracfg_ao CLK_INFRA_AO_ICUSB>;
> +			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck";
> +			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port0 PHY_TYPE_USB2>;
> +			power-domains = <&spm MT8186_POWER_DOMAIN_SSUSB>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			usb_host0: usb@11200000 {
> +				compatible = "mediatek,mt8186-xhci",
> +					     "mediatek,mtk-xhci";

90 cols; fits in one line.

...same comments for ssusb1 :-)

> +				reg = <0 0x11200000 0 0x1000>;
> +				reg-names = "mac";
> +				clocks = <&topckgen CLK_TOP_USB_TOP>,
> +					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>,
> +					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_HCLK>,
> +					 <&infracfg_ao CLK_INFRA_AO_ICUSB>,
> +					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_XHCI>;
> +				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
> +				interrupts = <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH 0>;
> +				mediatek,syscon-wakeup = <&pericfg 0x420 2>;
> +				wakeup-source;
> +				status = "disabled";
> +			};
> +		};
> +
>   		mmc0: mmc@11230000 {
>   			compatible = "mediatek,mt8186-mmc",
>   				     "mediatek,mt8183-mmc";
> @@ -939,6 +976,44 @@
>   			status = "disabled";
>   		};
>   
> +		ssusb1: usb@11281000 {
> +			compatible = "mediatek,mt8186-mtu3",
> +				     "mediatek,mtu3";
> +			reg = <0 0x11281000 0 0x2dff>,
> +			      <0 0x11283e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_SYS>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_REF>,
> +				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_HCLK>,
> +				 <&clk26m>;
> +			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck";
> +			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port1 PHY_TYPE_USB2>,
> +			       <&u3port1 PHY_TYPE_USB3>;

phys fit in one line.

Regards,
Angelo

