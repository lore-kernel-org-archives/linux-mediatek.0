Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68636C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 15:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbxMOf2lav8s/iVbLg90X6uYIrR/Jf7lUt9+WGJZkag=; b=MccEZGcmdfYWoV
	8a/H1qs7xYdUh/aoU05DpF5rZQLmVYwoKnlk1GOf+185AqmSyXbhPRFqS+XK2ITIPGwzQ6oO2Z6fW
	WYZ1fKIkthLlp85X6mf9NM8isWCDdv/cI8eNc5v8k+mOYIYskQtx3stGEFvUbfEDHIw40hpcINvsb
	FvaMTmXe5wNUVWerZPUMEyfZSdH6WHs4rB5hoyfCUzPsEi1QX7wHc9k1MH+oajpfslP7EFUzSDNs/
	/xqhLjGJrdixzT/Y2zKofJyNlVrnPEbG8WjjZ3LIL/dX+ULcM+HvXm/hAErHXlQ6Lqlb++I2ImMt2
	12XSE1oIvzCfyBJtFl5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqzVE-00Elpz-Tm; Tue, 17 May 2022 15:52:52 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqzV3-00EloC-FE; Tue, 17 May 2022 15:52:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 2063A1F44901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652802759;
 bh=VLzWzYuHr/VzEBBJLbkAVVXYd+h4cdCEC+8NQ7kC4JA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TE9QVuqAXjGy+Z0+mzBT9lESF2kymZU/vtdnDdQpa+fEy+Ahnn/7U/Kb0t4Ga9siQ
 qY6K1SAUcEVdkJ6C7N9qWt7RTzVN7Ghop87kTcapeCDNbpCOanJhfjJ263OEU4i4R/
 JVGX9VlCbFERCSFx87F+qD+s+j9c8XbrgfRwMUSQabVlisK67SIxF/EykUlaEAjbMF
 iEpgw8wxJx+pZsaZmiNvrdGjZOf/K/MyXeZVO0dXd8CF8Ea0u9lWeXL9Y9gsulir1T
 /jPuxypQZDjg1aZKFP9H3bHcjFMRhi6qruWysx/WHmXntxuiFa8NACCuPsHTxppIzM
 scv2j6GelbU0w==
Date: Tue, 17 May 2022 11:52:34 -0400
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
Message-ID: <20220517155234.5sa6vd23x2zrltht@notapiano>
References: <20220408104124.31395-1-allen-kh.cheng@mediatek.com>
 <20220408104124.31395-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220408104124.31395-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_085241_894027_DC745CD1 
X-CRM114-Status: GOOD (  17.33  )
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

On Fri, Apr 08, 2022 at 06:41:24PM +0800, Allen-KH Cheng wrote:
> Add vcodec lat and core nodes for mt8192 SoC.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Hi,

With the new mt8192 scp.img firmware merged on linux-firmware [1] and the
mtk-vcodec decoder support for mt8192 merged in the media tree [2], the DT =
nodes
for the decoder added in this patch are the last missing piece to have the
decoder usable on mt8192-based machines.

With this patch applied, I was able to run fluster [3] on
mt8192-asurada-spherion and obtain the following results:

VP8: 59/61
VP9: 249/303
H.264: 92/135

So,

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

[1] https://lore.kernel.org/all/CA+5PVA43SgXKz5EA6RTk74FxiDALy899G1Rvi_aO=
=3Dq9Yd_pCKw@mail.gmail.com/
[2] https://lore.kernel.org/all/875b24355315311db3a0c846be5f553b3d0c7498.ca=
mel@mediatek.com/
[3] https://github.com/fluendo/fluster

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
