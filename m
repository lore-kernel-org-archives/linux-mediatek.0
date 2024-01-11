Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AFCC4707B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 08:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGc4eEfkH6XXJdwFpid+7Ry79gYdSJ1JR4m7E24WfDQ=; b=ZRkhOz63mzUqLuEwG/i9KdObT/
	XphewtDDEjTN6FZA7nMtAGsrjE8hJH0vIFApIIZ50tx16igUn3QsqbNOWKUbRaL6ABPLHoiYsjaxW
	VCZAtIyYeGuZ3fYKYW8y6oi5OEdZFcpkzHfa5tv/2Z2QgXXIzpgF8mu7IeEtq4fG2j+gLtIHbOeIA
	U5lBT38Th/Fx/LX5QrZM1qWnBc94+9gIWzlYAbAF4IX6e2VV8GHHAr9I8/nh/X/qEum5dlZzHAUvx
	e8mavu4Ef4AqprFCRpMk1miDYq2ZUcxtFMuM//gSUoR/TgWr0kHQbcXWPSqVYX9wGu7GGKNIz6g0l
	L5qiCE4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqUg-00GXFZ-0D;
	Thu, 11 Jan 2024 08:32:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqUc-00GXET-1F;
	Thu, 11 Jan 2024 08:32:51 +0000
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7509EC85;
	Thu, 11 Jan 2024 09:31:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1704961903;
	bh=ceQsDzx9kmf/zRBGPdmkZuFW/ytCU3PmUX8H/digl28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KaF6d0HgOgcGH5ytchcHR12iaXtbe9jS/8O7JFfKq56ECJLgqHOMeT+x7+klEOV6w
	 k2L2sKF6iMPG1hTMKE57TxRwoEjcl4NMzoLaLCdsgTHNsU97S6JhvB0fKVHW5HzMaE
	 9L05waBXzHRRISrXXwIvUmqavUeChgPbWEMEXJNw=
Date: Thu, 11 Jan 2024 10:32:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Louis Kuo <louis.kuo@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: mediatek: mt8365: Add support for
 camera
Message-ID: <20240111083255.GC30988@pendragon.ideasonboard.com>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-6-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240110141443.364655-6-jstephan@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_003250_586067_FE01ACEC 
X-CRM114-Status: GOOD (  20.25  )
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

Hi Julien,

Thank you for the patch.

On Wed, Jan 10, 2024 at 03:14:42PM +0100, Julien Stephan wrote:
> Add base support for cameras for mt8365 platforms. This requires nodes
> for the sensor interface, camsv, and CSI receivers.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi | 128 +++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index 24581f7410aa..9059b2f83b83 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/power/mediatek,mt8365-power.h>
> +#include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
>  
>  / {
>  	compatible = "mediatek,mt8365";
> @@ -703,6 +704,133 @@ ethernet: ethernet@112a0000 {
>  			status = "disabled";
>  		};
>  
> +		camsv1: camsv@15050000 {
> +			compatible = "mediatek,mt8365-camsv";
> +			reg = <0 0x15050000 0 0x0040>,
> +			      <0 0x15050208 0 0x0020>,
> +			      <0 0x15050400 0 0x0100>;
> +			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&camsys CLK_CAM>,
> +				 <&camsys CLK_CAMTG>,
> +				 <&camsys CLK_CAMSV0>;
> +			clock-names = "cam", "camtg", "camsv";
> +			iommus = <&iommu M4U_PORT_CAM_IMGO>;
> +			mediatek,larb = <&larb2>;
> +			power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {
> +					reg = <0>;
> +					camsv1_endpoint: endpoint {
> +						remote-endpoint =
> +							<&seninf_camsv1_endpoint>;

I think you can keep this on a single line. Same below.

> +					};
> +				};
> +			};
> +		};
> +
> +		camsv2: camsv@15050800 {
> +			compatible = "mediatek,mt8365-camsv";
> +			reg = <0 0x15050800 0 0x0040>,
> +			      <0 0x15050228 0 0x0020>,
> +			      <0 0x15050C00 0 0x0100>;

Lower-case hex constants.

> +			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&camsys CLK_CAM>,
> +				 <&camsys CLK_CAMTG>,
> +				 <&camsys CLK_CAMSV1>;
> +			clock-names = "cam", "camtg", "camsv";
> +			iommus = <&iommu M4U_PORT_CAM_IMGO>;
> +

Nitpicking, camsv doesn't have a blank line here. I'm fine either way,
but please do the same for both nodes.

> +			mediatek,larb = <&larb2>;
> +			power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {
> +					reg = <0>;
> +					camsv2_endpoint: endpoint {
> +						remote-endpoint =
> +							<&seninf_camsv2_endpoint>;
> +					};
> +				};
> +			};
> +		};
> +
> +		seninf: seninf@15040000 {

This should go before the two camsv instances to keep nodes sorted by
address. The camsv1, camsv2 and seninf nodes need to be moved further
down for the same reason.

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
> +				port@4 {
> +					reg = <4>;
> +					seninf_camsv1_endpoint: endpoint {
> +						remote-endpoint =
> +							<&camsv1_endpoint>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +					seninf_camsv2_endpoint: endpoint {
> +						remote-endpoint =
> +							<&camsv2_endpoint>;
> +					};
> +				};
> +			};
> +		};
> +
> +		mipi_csi0: mipi-csi0@11c10000 {
> +			compatible = "mediatek,mt8365-csi-rx";
> +			reg = <0 0x11C10000 0 0x2000>;

Lower-case hex constants.

> +			status = "disabled";
> +			num-lanes = <4>;
> +			#phy-cells = <1>;
> +		};
> +
> +		mipi_csi1: mipi-csi1@11c12000 {
> +			compatible = "mediatek,mt8365-csi-rx";
> +			reg = <0 0x11C12000 0 0x2000>;

Lower-case hex constants.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			phy-type = <PHY_TYPE_DPHY>;
> +			status = "disabled";
> +			num-lanes = <4>;
> +			#phy-cells = <0>;
> +		};
> +
>  		u3phy: t-phy@11cc0000 {
>  			compatible = "mediatek,mt8365-tphy", "mediatek,generic-tphy-v2";
>  			#address-cells = <1>;

-- 
Regards,

Laurent Pinchart

