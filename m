Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC2DC3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFLVB8HdF8dNTAoPRJXzl3MWq25JNQkttRQ8C6QzyVg=; b=XpvKSiJWYHzc83diZpsQs2PQco
	m7yskptdXZnYlbAtlFI46le888u7kwU/ETUAgJlNEI+rRfv35xU3bRQ+cie1ZM9Qjcqzoy/Xu7Ll0
	HeyrGq0C2wo1S3sA5EPF4dS44X7Nipczz6dFJqvUBZuGVGinWWarKPFmEU6MJH73fCVYl7zjJfUwL
	nQSVQqoZBg4ZF0HX4u7ZCLfenYqO+l8q1195D0M69YFveJZa0sdHAcGSp+YfINhYf5qLmnZZut0le
	Mm7T+S8gpQwhbsfKv1jinwgi+r5fw/dowLjrbgqVbi93Nnhdb/FomSgpSH+NFzalLVpv39eyrq/1l
	keQ0C4RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYS0C-0000000Bol6-1h8b;
	Mon, 29 Jul 2024 15:09:32 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRza-0000000BoZu-1wwg;
	Mon, 29 Jul 2024 15:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722265733;
	bh=aAbjuBpvIUGViH+nWkjTxRXW47KgMyjW6ht1VbHNVVo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K0d48MAFOsPJPuZxzUKierWTMxK6/6DD+ZV1qG1R++MQ9J2Ri0x7CqK2zaZSXRYdP
	 ablxsWAO3YD2/HNTwWbNeP4uBlQrzfEEJKgLAHGQpFtP4pJCIvWb2/42Ggg72+9HV8
	 ufdZ2cq0F2w5DHdukuqPRQhRxkmLmqkZCm/Rk/j3pYUGADab7p0anbLZ2PyFLoU6qc
	 K36kvascrBDl6QZGiFDt8jpjGjMZsFRrQc4SQ9S8n4z7f7ry9RHutm1hUxYOnhxwzH
	 WHStHbIV/LDFj1BLy4DFGuQmzA2xirXlS3zm55YKkADa0IZRpzLZPNtfvOuP8oxan9
	 tWvEaQllSt2Mg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 603D63780C11;
	Mon, 29 Jul 2024 15:08:50 +0000 (UTC)
Message-ID: <f2e4d8a1-f683-415d-853f-b55abdb8c27c@collabora.com>
Date: Mon, 29 Jul 2024 17:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: mediatek: mt8365: Add support for
 camera
To: Julien Stephan <jstephan@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-5-c374c9e0c672@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-5-c374c9e0c672@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_080854_736947_B0385E6D 
X-CRM114-Status: GOOD (  15.44  )
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

Il 29/07/24 16:48, Julien Stephan ha scritto:
> Add base support for cameras for mt8365 platforms. This requires nodes
> for the sensor interface, camsv, and CSI receivers.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 125 +++++++++++++++++++++++++++++++
>   1 file changed, 125 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index 24581f7410aa..cabdb51f4041 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -10,6 +10,7 @@
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/power/mediatek,mt8365-power.h>
> +#include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
>   
>   / {
>   	compatible = "mediatek,mt8365";
> @@ -703,6 +704,23 @@ ethernet: ethernet@112a0000 {
>   			status = "disabled";
>   		};
>   
> +		mipi_csi0: mipi-csi0@11c10000 {

Names must be generic. This is mipi-csi-phy@xyz or csi-phy@xyz as it looks
like it's not the entire CSI interface but just its PHY. Am I wrong?

> +			compatible = "mediatek,mt8365-csi-rx";
> +			reg = <0 0x11c10000 0 0x2000>;
> +			status = "disabled";
> +			num-lanes = <4>;
> +			#phy-cells = <1>;
> +		};
> +
> +		mipi_csi1: mipi-csi1@11c12000 {

Same for this one.

> +			compatible = "mediatek,mt8365-csi-rx";
> +			reg = <0 0x11c12000 0 0x2000>;
> +			phy-type = <PHY_TYPE_DPHY>;

...so the secondary CSIPHY only supports DPHY, while the first one supports either
C or D?

> +			status = "disabled";
> +			num-lanes = <4>;
> +			#phy-cells = <0>;

...and then, it's confusing, one CSI has got one PHY cell, one has got two?

> +		};
> +
>   		u3phy: t-phy@11cc0000 {
>   			compatible = "mediatek,mt8365-tphy", "mediatek,generic-tphy-v2";
>   			#address-cells = <1>;
> @@ -773,6 +791,113 @@ larb2: larb@15001000 {
>   			mediatek,larb-id = <2>;
>   		};
>   
> +		seninf: seninf@15040000 {
> +			compatible = "mediatek,mt8365-seninf";
> +			reg = <0 0x15040000 0 0x6000>;
> +			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&camsys CLK_CAM_SENIF>,
> +				 <&topckgen CLK_TOP_SENIF_SEL>;
> +			clock-names = "camsys", "top_mux";
> +
> +			power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
> +
> +			phys = <&mipi_csi0 PHY_TYPE_DPHY>, <&mipi_csi1>;
> +			phy-names = "csi0", "csi1";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +				};
> +

Empty ports, why?

Regards,
Angelo



