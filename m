Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB8AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 14:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2cL0nTPuR5xQuL10qHBuhsUjQPi941uGHc5xe/DYXc=; b=r4u3TkkU317wgsFohZd9RPqZZc
	LfwruUjoczdVTJRFukJr4yD1tfgmMitlPV4mIivDik8xIOcm8MLvosAkxzLI+lePgC7pnUqXjZTAB
	RUaIvSkhqUwsRiGBn5rb+TUPROBM9CjHM2iyecuZLWKTFL6pg/Y2s1KAXov3XEH7rb58EbgvM1o2Z
	kIKoXWTe7LCofvvosVS6U1dXD7A/VyC4ADLrCziJ9fp/fv8fRtpGW/clqECkYCJzzZEaqThmAvBV6
	VG6PUD+B06w+b6IfJGKK52FGh+w1OGXq/UbEoGFBpa4OJgwzrx0kPK3PwYb1VYsLmhCqRtcfiySle
	1ziSAR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow257-004K6Q-Rl; Fri, 18 Nov 2022 14:11:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow24v-004JyS-Ah; Fri, 18 Nov 2022 14:10:51 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AAFAA6602A3B;
	Fri, 18 Nov 2022 14:10:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668780645;
	bh=pRPLysf0FJETMjuGSkgqfys84EBTLQ8RPJqmeUpzLus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPDjIVrjv+RcBBumuWkCUzkAJKbmtQJSvAVRHQJDzBuEhgWdBss5qhwg/aj+UO+uT
	 jSy2KjzAuFvp77R98uQBiVXDGgC2TZ1EpWn0IoMIreoHlxO001spqMe8+IfhKaUHNT
	 HVzPV5uhKpFFZoncWs6Oo2i//qZszII2CKvzuoLNfHzK7cWc41qhL2/VoXFuXkQKM7
	 fqcXar9iztIYLbcddpGHfR0CkUBKCmFnSviQIfbdDoT/T4a/jtJsGfuFz2rB517LrQ
	 A4YWZEA6qlRb6YMqvbh0JDQQjYXgMa/Zo6Ke6I22b29XITeMFDtajeRSVztdKa7f65
	 lHteVNz0/JSzg==
Date: Fri, 18 Nov 2022 09:10:39 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 2/2] arm64: dts: mt8192: Add vcodec lat and core nodes
Message-ID: <20221118141039.y2ap7dzdp26ih2la@notapiano>
References: <20220930112237.14411-1-allen-kh.cheng@mediatek.com>
 <20220930112237.14411-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220930112237.14411-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_061049_740883_79327EEA 
X-CRM114-Status: GOOD (  17.91  )
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

On Fri, Sep 30, 2022 at 07:22:37PM +0800, Allen-KH Cheng wrote:
> Add vcodec lat and core nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 60 ++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 6b20376191a7..92a20f87468b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1449,6 +1449,66 @@
>  			power-domains = <&spm MT8192_POWER_DOMAIN_ISP2>;
>  		};
>  
> +		vcodec_dec: video-codec@16000000 {
> +			compatible = "mediatek,mt8192-vcodec-dec";
> +			reg = <0 0x16000000 0 0x1000>;
> +			mediatek,scp = <&scp>;
> +			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> +			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;

Hi,

since commit 951d48855d86 ("of: Make of_dma_get_range() work on bus nodes") [1]
was merged this no longer works as is. Running the fluster codec tests results
in IOMMU faults:

	[  386.233976] mtk-iommu 1401d000.m4u: fault type=0x280 iova=0x1fcdc0000 pa=0x0 master=0x500041c(larb=4 port=7) layer=0 read
	[  386.250666] mtk_vdec_worker(),241: [MTK_V4L2][ERROR]  <===[138], src_buf[0] sz=0x298 pts=0 vdec_if_decode() ret=1 res_chg=0===>

The issue is that the DMA configuration supplied by dma-ranges is now looked for
in the parent node, so the vcodec_dec node no longer gets the configuration it
expected.

That said, given that the node already uses the IOMMU for the address
translations (iommus property), there shouldn't even be a dma-ranges property.
Indeed simply removing the dma-ranges property from this node fixes the issue
and gets the decoder working again.

Thanks,
Nícolas

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f1ad5338a4d57fe1fe6475003acb8c70bf9d1bdf

> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges = <0 0 0 0x16000000 0 0x26000>;
> +
> +			video-codec-lat@10000 {
> +				compatible = "mediatek,mtk-vcodec-lat";
> +				reg = <0x0 0x10000 0 0x800>;
> +				interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> +				iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> +				clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +					 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> +					 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> +					 <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> +					 <&topckgen CLK_TOP_MAINPLL_D4>;
> +				clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
> +				assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +				assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +				power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
> +			};
> +
> +			video-codec-core@25000 {
> +				compatible = "mediatek,mtk-vcodec-core";
> +				reg = <0 0x25000 0 0x1000>;
> +				interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> +				iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> +					 <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> +				clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> +					 <&vdecsys CLK_VDEC_VDEC>,
> +					 <&vdecsys CLK_VDEC_LAT>,
> +					 <&vdecsys CLK_VDEC_LARB1>,
> +					 <&topckgen CLK_TOP_MAINPLL_D4>;
> +				clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
> +				assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> +				assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
> +				power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
> +			};
> +		};
> +

