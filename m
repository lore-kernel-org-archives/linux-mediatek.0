Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94D4C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oB2x32+8qgozGa7FJVuJY5206p10e/Zosu4ni5zQKc4=; b=qewNlAqXlVefHl
	ghtfZDtdUJ7tx61gPyzE08bVaSQpLc0v7ri760Y6LtB4R/dNHk6acImExrZ1aXClu+l9qhMXDK8bg
	v91aVGGhdDxTUoZrCcFComvWkdzYticW1ZK+J6ueVZ2yplQCWQKro8IjtHYGl+A5GvoSgeef8gQlp
	DcpA+t/iCjdF83XeustHUIujFKVoj8uBGrxofFf3jKAtxIemRTVKdeucyw6DdRP/IbdnH/PbMixG/
	LCRpwd++4/YEPcrw7l9jVzc7Y1nCuz7UjUwNkEENhsPcN8oUAuN58BfZt4qq/OMDz+79blY+0qInJ
	fqY/8pXYWKyAxf31n/5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neevr-001av4-WA; Wed, 13 Apr 2022 15:29:24 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neevg-001aqs-58; Wed, 13 Apr 2022 15:29:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 623F81F45A37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649863748;
 bh=QkuxM+5pnkSA1ICUnAKMrVwzy8WneSmBDiuAOn1jeUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j2P2ES0QUqCA8NlI18oTrBam5MoFphrsbmf+R5RvhI4PZA6bUx1dA6fGxfrwf+jOv
 7381/YQjBg9oODeEmpBqpo9q515hMr/XGKo2aveT750cxgtfyPMEBXSE1nr2GV/uEf
 biVW+X12b/5t8N9cKppfWxYGJnZpY17RQG/3uH3pGgbnCa2a3vsP/ksctA4/cfq8G8
 FK4ewWzrI3bBmVFtZ1feT7weYHHjXrIiGjAc2oBUN+ZNCvB3mIpNunPylDCmUZ2Hw+
 DTEGJnzrwU9Fb83K950oZ+Ry4cx4N9g5si4BKW1FG9PKa5kB3Wy8znVjkp5PXuVHgM
 EiNWtT0Xd7AVg==
Date: Wed, 13 Apr 2022 11:29:03 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
Subject: Re: [PATCH 1/1] arm64: dts: mt8192: Add vcodec lat and core nodes
Message-ID: <20220413152903.3pk3ed5a5lgtiyf4@notapiano>
References: <20220408104124.31395-1-allen-kh.cheng@mediatek.com>
 <20220408104124.31395-2-allen-kh.cheng@mediatek.com>
 <20220412230819.vnbdv6wpsg73eqzi@notapiano>
 <649d747ceddc7fbd3f226f4448874665231ae744.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <649d747ceddc7fbd3f226f4448874665231ae744.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_082912_580084_D08D44B4 
X-CRM114-Status: GOOD (  22.92  )
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

On Wed, Apr 13, 2022 at 03:21:29PM +0800, allen-kh.cheng wrote:
> Hi N=EDcolas,
> =

> On Tue, 2022-04-12 at 19:08 -0400, N=EDcolas F. R. A. Prado wrote:
> > Hi Allen,
> > =

> > On Fri, Apr 08, 2022 at 06:41:24PM +0800, Allen-KH Cheng wrote:
> > > Add vcodec lat and core nodes for mt8192 SoC.
> > > =

> > > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 60
> > > ++++++++++++++++++++++++
> > >  1 file changed, 60 insertions(+)
> > > =

> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > index 18a58239d6f1..c7f4b2fbb315 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > @@ -1120,6 +1120,66 @@
> > >  			power-domains =3D <&spm
> > > MT8192_POWER_DOMAIN_ISP2>;
> > >  		};
> > >  =

> > > +		vcodec_dec: vcodec-dec@16000000 {
> > > +			compatible =3D "mediatek,mt8192-vcodec-dec";
> > > +			reg =3D <0 0x16000000 0 0x1000>;
> > > +			mediatek,scp =3D <&scp>;
> > > +			iommus =3D <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> > > +			dma-ranges =3D <0x1 0x0 0x0 0x40000000 0x0
> > > 0xfff00000>;
> > > +			#address-cells =3D <2>;
> > > +			#size-cells =3D <2>;
> > =

> > The dt-binding says address-cells and size-cells should be 1. Then
> > most of the
> > extra 0s can be dropped from ranges and the children's regs.
> > =

> > Other than that,
> > =

> > Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> > =

> > Thanks,
> > N=EDcolas
> > =

> =

> I have checked the description in mediatek,vcodec-subdev-decoder.yaml
> =

> address-cells and size-cells are two after the below commit is merged.
> =

> media: mediatek,vcodec: Fix addressing cell sizes
> linux/kernel/git/next/linux-next.git
> commit/id=3Da50e431bbc6fc5768ed26be5fab5b149b7b8b1fe

Hi Allen,

yes, you're right. I missed that commit, sorry. This patch is perfectly fine
as it is then.

Thanks,
N=EDcolas

> =

> Correct me if I got this wrong.
> =

> Thanks,
> Allen
> =

> > > +			ranges =3D <0 0 0 0x16000000 0 0x26000>;
> > > +
> > > +			vcodec_lat: vcodec-lat@10000 {
> > > +				compatible =3D "mediatek,mtk-vcodec-lat";
> > > +				reg =3D <0x0 0x10000 0 0x800>;
> > > +				interrupts =3D <GIC_SPI 426
> > > IRQ_TYPE_LEVEL_HIGH 0>;
> > > +				iommus =3D <&iommu0
> > > M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> > > +				clocks =3D <&topckgen CLK_TOP_VDEC_SEL>,
> > > +					 <&vdecsys_soc
> > > CLK_VDEC_SOC_VDEC>,
> > > +					 <&vdecsys_soc
> > > CLK_VDEC_SOC_LAT>,
> > > +					 <&vdecsys_soc
> > > CLK_VDEC_SOC_LARB1>,
> > > +					 <&topckgen
> > > CLK_TOP_MAINPLL_D4>;
> > > +				clock-names =3D "sel", "soc-vdec", "soc-
> > > lat", "vdec", "top";
> > > +				assigned-clocks =3D <&topckgen
> > > CLK_TOP_VDEC_SEL>;
> > > +				assigned-clock-parents =3D <&topckgen
> > > CLK_TOP_MAINPLL_D4>;
> > > +				power-domains =3D <&spm
> > > MT8192_POWER_DOMAIN_VDEC>;
> > > +			};
> > > +
> > > +			vcodec_core: vcodec-core@25000 {
> > > +				compatible =3D "mediatek,mtk-vcodec-
> > > core";
> > > +				reg =3D <0 0x25000 0 0x1000>;
> > > +				interrupts =3D <GIC_SPI 425
> > > IRQ_TYPE_LEVEL_HIGH 0>;
> > > +				iommus =3D <&iommu0
> > > M4U_PORT_L4_VDEC_MC_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L4_VDEC_UFO_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L4_VDEC_PP_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L4_VDEC_TILE_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L4_VDEC_VLD_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L4_VDEC_VLD2_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> > > +					 <&iommu0
> > > M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> > > +				clocks =3D <&topckgen CLK_TOP_VDEC_SEL>,
> > > +					 <&vdecsys CLK_VDEC_VDEC>,
> > > +					 <&vdecsys CLK_VDEC_LAT>,
> > > +					 <&vdecsys CLK_VDEC_LARB1>,
> > > +					 <&topckgen
> > > CLK_TOP_MAINPLL_D4>;
> > > +				clock-names =3D "sel", "soc-vdec", "soc-
> > > lat", "vdec", "top";
> > > +				assigned-clocks =3D <&topckgen
> > > CLK_TOP_VDEC_SEL>;
> > > +				assigned-clock-parents =3D <&topckgen
> > > CLK_TOP_MAINPLL_D4>;
> > > +				power-domains =3D <&spm
> > > MT8192_POWER_DOMAIN_VDEC2>;
> > > +			};
> > > +		};
> > > +
> > >  		larb5: larb@1600d000 {
> > >  			compatible =3D "mediatek,mt8192-smi-larb";
> > >  			reg =3D <0 0x1600d000 0 0x1000>;
> > > -- =

> > > 2.18.0
> > > =

> > > =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
