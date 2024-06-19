Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93C5C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 10:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1B+vh92HbFrVNtKWJ9ORt1BBbyvYtbZSof2EVzTwmxM=; b=h25XI0rclLKRpu5oatg/ilSP/u
	hxbfJAh4dGsXo5lgHu0be/fPUwD/q19e13esTa14eVJ3ifglu1aHLiHh0oNbsG4hXYVitQ02LN28V
	pSlJeZCyQL2R0HgHRv4sO/QxZ2ppLz4se2fpCmAw6PyPFMgKKZyV4+B1oQphPmZn1ODOMa/1bLXvj
	9p0aBCME6L7Bi9duUYF5EQptWHMGNxixPlloONRjqkdsQCzUNSap7BpjVTMWqMNrkjuutwYxB9pyH
	Im6gPAaBlwa+jTkdNty3EMJSe25m3PRjekiCGpQh0ySm/BPq0GFbH7zMgQYKrF3KUuiayiTzTpnRR
	iO0bpF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsr2-00000000qWg-2GEY;
	Wed, 19 Jun 2024 10:47:52 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsqr-00000000qTS-06pE;
	Wed, 19 Jun 2024 10:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718794059;
	bh=s5naf1uttC3SK4CM5eDhQozogAI6TwHH9teO5TqANBA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T4mY5J0kWd9rWAuUygLrHgEwAvT+rBy5VzRpjzulnY1JnSwLd4y1yGT8QDq/sNbfU
	 BCLi1J9wgtKK353wEwEbhwtdUuRyoOhm92U1DpNxDSGRWbJJDeO3jD33qIsJKw7urk
	 fbcNFGkIwxDqZaiOW8U2Lj4iXJJLXwK+bUJUYNvTVfHoT9sTA2JfIy9PwdvPRGmos8
	 TxrmI5ClLetGkAAD1dVPJUa62ao8rdSg37awRUD5w/ugslTyegss3NBaQng+cTN5IA
	 oGJ04vUHIs7i04HjjOO2FmEjdP5OTYXAuSYPDjPWRr0KLr3KYUegH7IRzTcSq5XpGJ
	 SDkvSKRTe4fCQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 10A5B37821C3;
	Wed, 19 Jun 2024 10:47:38 +0000 (UTC)
Message-ID: <6ab278ab-b8ed-405c-8f37-fc28610eac4e@collabora.com>
Date: Wed, 19 Jun 2024 12:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/15] arm64: dts: mediatek: add display blocks support
 for the MT8365 SoC
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
 <20231023-display-support-v4-14-ed82eb168fb1@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v4-14-ed82eb168fb1@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_034746_347675_C03F7811 
X-CRM114-Status: GOOD (  17.95  )
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

Il 23/05/24 14:49, Alexandre Mergnat ha scritto:
> - Add aliases for each display components to help display drivers.
> - Add the Display Pulse Width Modulation (DISP_PWM) to provide PWM signals
>    for the LED driver of mobile LCM.
> - Add the MIPI Display Serial Interface (DSI) PHY support. (up to 4-lane
>    output)
> - Add the display mutex support.
> - Add the following display component support:
>    - OVL0 (Overlay)
>    - RDMA0 (Data Path Read DMA)
>    - Color0
>    - CCorr0 (Color Correction)
>    - AAL0 (Adaptive Ambient Light)
>    - GAMMA0
>    - Dither0
>    - DSI0 (Display Serial Interface)
>    - RDMA1 (Data Path Read DMA)
>    - DPI0 (Display Parallel Interface)
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 336 +++++++++++++++++++++++++++++++
>   1 file changed, 336 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index 24581f7410aa..9f88645141d6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -8,6 +8,7 @@
>   #include <dt-bindings/clock/mediatek,mt8365-clk.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
>   #include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/power/mediatek,mt8365-power.h>
>   

..snip..

> +
> +		rdma1: rdma@14016000 {
> +			compatible = "mediatek,mt8365-disp-rdma", "mediatek,mt8183-disp-rdma";
> +			reg = <0 0x14016000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_MM_DISP_RDMA1>;
> +			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
> +			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
> +			mediatek,rdma-fifo-size = <2048>;
> +			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0>;

Hey Alex,

only one nit here - trying to get the formatting consistent between devicetrees for
all MediaTek SoCs.

VDOSYS/MMSYS:
			port {
				#address-cells = <1>;
				#size-cells = <0>;

				vdosys0_ep_main: endpoint@0 {
					reg = <0>;
					remote-endpoint = <&ovl0_in>;
				};
			};

RDMA/OVL/other components:

			ports {
				#address-cells = <1>;
				#size-cells = <0>;

				port@0 {
					reg = <0>;

					rdma0_in: endpoint {
						remote-endpoint = <&ovl0_out>;
					};
				};

Can you please follow the style that I've shown up there for all of the ports
nodes and resend the devicetree commits?

P.S.: This is a paste from the MT8195 devicetree that I'll send soon, probably
tomorrow or something along those lines.

After which, the devicetree looks ok to me.

Thanks,
Angelo



