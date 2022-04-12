Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7154C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 23:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUwHN6XTXVMVHnNxS0XmWirsbuOtI2V5omRfrVMy6qA=; b=Yj5lwfdqDrlD4X
	Z3tWG1JEz8hbKrUZQNG88EvIOZUphQgkaSqcpDW0WhMs6o/QaE2vSjMUSzxVpVU0caWjikvsv9+Wn
	n7W09ZlJx3oaUwC7izOBYi5LsNtwlAuJCVOZlhBX9pFwtnkuN5O4Bo9KPNZHcOvV3UItf4AJUq1bl
	Cnf/WXgYnPqS68Bksxa48PdmBGgOpBvnEG84kZ49PDxAWi/pSSnBV0teOnOgGqnYLqUMZ6QffOMY+
	GJrCNya66ehC+LM1w4PQ83K3r/u/ieZJYzNogkU09FlvkdTowY6LHw+IRoVGdMpTfWIjhki8BbRR5
	foDOCpuuIteUUmvgDOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nePcp-00G1L9-Hv; Tue, 12 Apr 2022 23:08:43 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nePce-00G1KG-U6; Tue, 12 Apr 2022 23:08:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 92CA01F44C84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649804905;
 bh=BIhBahY5mK+O0aUB2G5eR+qvBV8h9i6YuuZcILddZFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hc82udoKR5hMf/MlAxnnn39fVT6v+Tps0+g2G7EqF18ANs67qzMx8NOvlqI9tvdl4
 Mf5pQZ4p7xZsicA0tZ5jBq2UprhTpGu8lWn2xl6DE11vqsbSB32sNwRxfzySqRJlE0
 l4+8rSyDjs3lHpXcEg5WHiyYvfFGej6WOqpV4jxaN4KxqbLVyWayIe/HzDjWYfdYwc
 Fd9h4UEITFxvCGjKWwTZvnh0WYJwrxSxKhVEfiQ1GKo1plj6M4DDmqH5Abw2LOkF6s
 rQEJO/VnzEwlTdhuIX0Ul1AqW0E+fD9060qnT3KiJ2tX/xPrmNXl/zz5rVWVLT9CnR
 dDUkTrzg1M9wg==
Date: Tue, 12 Apr 2022 19:08:19 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
Subject: Re: [PATCH 1/1] arm64: dts: mt8192: Add vcodec lat and core nodes
Message-ID: <20220412230819.vnbdv6wpsg73eqzi@notapiano>
References: <20220408104124.31395-1-allen-kh.cheng@mediatek.com>
 <20220408104124.31395-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220408104124.31395-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_160833_221170_2F0C8FA7 
X-CRM114-Status: GOOD (  14.93  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Allen,

On Fri, Apr 08, 2022 at 06:41:24PM +0800, Allen-KH Cheng wrote:
> Add vcodec lat and core nodes for mt8192 SoC.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 60 ++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 18a58239d6f1..c7f4b2fbb315 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1120,6 +1120,66 @@
>  			power-domains =3D <&spm MT8192_POWER_DOMAIN_ISP2>;
>  		};
>  =

> +		vcodec_dec: vcodec-dec@16000000 {
> +			compatible =3D "mediatek,mt8192-vcodec-dec";
> +			reg =3D <0 0x16000000 0 0x1000>;
> +			mediatek,scp =3D <&scp>;
> +			iommus =3D <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> +			dma-ranges =3D <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;

The dt-binding says address-cells and size-cells should be 1. Then most of =
the
extra 0s can be dropped from ranges and the children's regs.

Other than that,

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

> +			ranges =3D <0 0 0 0x16000000 0 0x26000>;
> +
> +			vcodec_lat: vcodec-lat@10000 {
> +				compatible =3D "mediatek,mtk-vcodec-lat";
> +				reg =3D <0x0 0x10000 0 0x800>;
> +				interrupts =3D <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
> +				iommus =3D <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> +					 <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> +				clocks =3D <&topckgen CLK_TOP_VDEC_SEL>,
> +					 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> +					 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> +					 <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> +					 <&topckgen CLK_TOP_MAINPLL_D4>;
> +				clock-names =3D "sel", "soc-vdec", "soc-lat", "vdec", "top";
> +				assigned-clocks =3D <&topckgen CLK_TOP_VDEC_SEL>;
> +				assigned-clock-parents =3D <&topckgen CLK_TOP_MAINPLL_D4>;
> +				power-domains =3D <&spm MT8192_POWER_DOMAIN_VDEC>;
> +			};
> +
> +			vcodec_core: vcodec-core@25000 {
> +				compatible =3D "mediatek,mtk-vcodec-core";
> +				reg =3D <0 0x25000 0 0x1000>;
> +				interrupts =3D <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
> +				iommus =3D <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
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
> +				clocks =3D <&topckgen CLK_TOP_VDEC_SEL>,
> +					 <&vdecsys CLK_VDEC_VDEC>,
> +					 <&vdecsys CLK_VDEC_LAT>,
> +					 <&vdecsys CLK_VDEC_LARB1>,
> +					 <&topckgen CLK_TOP_MAINPLL_D4>;
> +				clock-names =3D "sel", "soc-vdec", "soc-lat", "vdec", "top";
> +				assigned-clocks =3D <&topckgen CLK_TOP_VDEC_SEL>;
> +				assigned-clock-parents =3D <&topckgen CLK_TOP_MAINPLL_D4>;
> +				power-domains =3D <&spm MT8192_POWER_DOMAIN_VDEC2>;
> +			};
> +		};
> +
>  		larb5: larb@1600d000 {
>  			compatible =3D "mediatek,mt8192-smi-larb";
>  			reg =3D <0 0x1600d000 0 0x1000>;
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
