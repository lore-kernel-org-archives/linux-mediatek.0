Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15553C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AqLD/SWv99EhrBPhTbqZdind1SX2unTisq6v0c7VF2A=; b=H1br5p5qFW16Lu
	LEd9yWY+08uXsrYHMygskgblS7Pj8UnpQ5ZCLeCliXubGO3bODL+KHz/mG44vmjIXzVCNrSJJo4gn
	lcEbzlEEHH2cHks33mQ0FnZcCSlicIUleOUcAr7X6VZ0pzZkK1i7Fxu+j0lXQ0xnV+crSOPMXjloN
	lwuEcpkGRPuqDLkPziyb/rh/5P6HAX7EAZBzF3zwvVOOCuExWh8RSmLKTmnIo7QUSSn4Ktj5fX0Hj
	Mv2VtHxZGwKyIC2Wm+vYz7DrSxrDu4YdHUOeuhTDXkGddPa2xgGYPADAc2OQ3CBHqhcUEEAZsYBSt
	41B8RSUiuhEjfsD4ARZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3O5-00EbdN-Ju; Fri, 18 Feb 2022 13:33:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2o0-00ELet-QL; Fri, 18 Feb 2022 12:56:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A1FB71F46910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188971;
 bh=Mb736QL1fjTwcEAkdjQx5DGuJ2KdhFkGPZlMm4ES0yA=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=SGMpegoqcbFxYkLIcbIDP0EGh4RS5VW7NALMp7RRNnhKdeF4M1DVmqO6YfdhVsylt
 892VCMrAikWy9DhKY3SqzQOiOrha44E2/FsEyHAti5XfVJrETmIbM6p7nZaEsjQMFg
 wCCoV/+fucwN7Z0AgfVgXNewhcz4YIcmoJ2bf5XcpfhH2E5oE55V5qi4nk8gI59r8r
 /isKlLz2zOSCbjBYlLkWeWVYngHGhBh/ovbRuRKm6nuHBaeRS/zKQJ3AekYtwKUHFk
 umtFehN/9BtY578NLWPkfmnBSgUnjKsR8eRPTd8x4T4NU6V1lkCwEpraohyaOFKNpR
 1PLnD1kf+WAMA==
Message-ID: <985167a1-cd44-4735-c86a-59cd60d31d1a@collabora.com>
Date: Fri, 18 Feb 2022 13:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 17/23] arm64: dts: mt8192: Add vcodec lat and core nodes
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-18-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-18-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045613_034643_D4935D4C 
X-CRM114-Status: GOOD (  12.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> Add vcodec lat and core nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 58 ++++++++++++++++++++++++
>   1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 936aa788664f..543a80252ce5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1291,6 +1291,64 @@
>   			power-domains = <&spm MT8192_POWER_DOMAIN_ISP2>;
>   		};
>   
> +		vcodec_dec: vcodec_dec@16000000 {
> +			compatible = "mediatek,mt8192-vcodec-dec";
> +			reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
> +			mediatek,scp = <&scp>;
> +			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> +		};
> +
> +		vcodec_lat: vcodec_lat@0x16010000 {
> +			compatible = "mediatek,mtk-vcodec-lat";
> +			reg = <0 0x16010000 0 0x800>;		/* VDEC_MISC */
> +			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> +			iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> +				<&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> +				<&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,

Please fix indentation!

			iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,

				 <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,

				 <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,

... etc.

> +				<&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> +				<&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> +				<&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> +				<&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> +				<&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> +			clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +				 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> +				 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> +				 <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> +				 <&topckgen CLK_TOP_MAINPLL_D4>;
> +			clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat", "vdec-vdec",
> +				      "vdec-top";
> +			assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> +		};
> +
> +		vcodec_core: vcodec_core@0x16025000 {
> +			compatible = "mediatek,mtk-vcodec-core";
> +			reg = <0 0x16025000 0 0x1000>;		/* VDEC_CORE_MISC */
> +			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> +			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
> +				<&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
> +				<&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,

ditto.

> +				<&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> +				<&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> +				<&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> +				<&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
> +				<&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
> +				<&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
> +				<&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> +				<&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> +			clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +				 <&vdecsys CLK_VDEC_VDEC>,
> +				 <&vdecsys CLK_VDEC_LAT>,
> +				 <&vdecsys CLK_VDEC_LARB1>,
> +				 <&topckgen CLK_TOP_MAINPLL_D4>;
> +			clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat", "vdec-vdec",
> +				      "vdec-top";
> +			assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> +		};
> +
>   		larb5: larb@1600d000 {
>   			compatible = "mediatek,mt8192-smi-larb";
>   			reg = <0 0x1600d000 0 0x1000>;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
