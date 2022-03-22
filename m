Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D41C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 14:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OzAfKESOTg2X01Hu/foXivDHsNpeSAvnr8csSjJNo9U=; b=veiXGfyV6cq90D
	UDkTcrx408oLvj+Opm5CasKIVfeo0jE07fdeMNYo+J2YUVAGzCd+KiqH4PLPJINUvt3DhPkqbQTKS
	8afrGBLWgp+dF/+m4Wd9htpB07YMpfAGANRQv6dpDERCZ5cAqHqr57eo0O8Cuww9qoz18vx9K4ZWd
	1xveBkRQ8sEpk3JsTMuN2WIYvg/6CGgGAdfBxOfYDyiavis+jaGBSR5cVLhroChBgHzSmX2nSziWA
	B5ZYLY3j/tOF9iqMEXO7n2w/fFEuAU7+UQcKgklruVy4RWO7Fpo4BpGHbmfCuqD+1lNqPtEikMHuq
	2v3Mb2SryAReHA6OJLZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWfbO-00BFin-D5; Tue, 22 Mar 2022 14:35:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWfbB-00BFe3-OV; Tue, 22 Mar 2022 14:35:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 4A85D1F44168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647959700;
 bh=aNbxXQ/SWTcyB0DYx3I3/ERMzeu2JAiNEzh7tn5j4wE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PH97x9fGWNjR9ZafBX72qdRbmIzVwKx9irbMtnG21KzUrfNSFcVwxferoJpZSZ/z5
 OJ4DP+GIVHNY1x2JNg94ne1kWTU8mnmhCFLO6jRqyxGycTQjZSXNb3nM1EmQVszbkj
 a0DVTFrmX0Tce65fW25rRtLIDu32/ansGYY8memvI0SlPcHaQm+t4XZow1sNE8bFmb
 51kqueaI3W2fN/k2MRCuB+w0fR2WXNPkxJC6TYSk7yGUMtQuDhfpFCoEXHEaPgCTfU
 fKb2lI5FVxWKaj40ZIKS9mrjAAc7a1US64tzPIEngTqXyNKFXz115hyfjuhCAWU5tV
 kCJVWVquz2dsA==
Date: Tue, 22 Mar 2022 10:34:55 -0400
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
Subject: Re: [PATCH v4 12/22] arm64: dts: mt8192: Add mmc device nodes
Message-ID: <20220322143455.fbaavvhf3uh5otbn@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-13-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318144534.17996-13-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_073501_966324_BE62D87E 
X-CRM114-Status: GOOD (  13.98  )
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

On Fri, Mar 18, 2022 at 10:45:24PM +0800, Allen-KH Cheng wrote:
> Add mmc nodes for mt8192 SoC.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 34 +++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 4 deletions(-)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 6220d6962f58..2648f2847993 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1150,10 +1150,36 @@
>  			#clock-cells =3D <1>;
>  		};
>  =

> -		msdc: clock-controller@11f60000 {
> -			compatible =3D "mediatek,mt8192-msdc";
> -			reg =3D <0 0x11f60000 0 0x1000>;
> -			#clock-cells =3D <1>;
> +		mmc0: mmc@11f60000 {
> +			compatible =3D "mediatek,mt8192-mmc", "mediatek,mt8183-mmc";
> +			reg =3D <0 0x11f60000 0 0x1000>, <0 0x11f50000 0 0x1000>;
> +			interrupts =3D <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&topckgen CLK_TOP_MSDC50_0_SEL>,
> +				 <&msdc_top CLK_MSDC_TOP_H_MST_0P>,
> +				 <&msdc_top CLK_MSDC_TOP_SRC_0P>,
> +				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
> +				 <&msdc_top CLK_MSDC_TOP_P_MSDC0>,
> +				 <&msdc_top CLK_MSDC_TOP_AXI>,
> +				 <&msdc_top CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
> +			clock-names =3D "source", "hclk", "source_cg", "sys_cg",
> +				      "pclk_cg", "axi_cg", "ahb_cg";
> +			status =3D "disabled";
> +		};
> +
> +		mmc1: mmc@11f70000 {
> +			compatible =3D "mediatek,mt8192-mmc", "mediatek,mt8183-mmc";
> +			reg =3D <0 0x11f70000 0 0x1000>, <0 0x11c70000 0 0x1000>;
> +			interrupts =3D <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&topckgen CLK_TOP_MSDC30_1_SEL>,
> +				 <&msdc_top CLK_MSDC_TOP_H_MST_1P>,
> +				 <&msdc_top CLK_MSDC_TOP_SRC_1P>,
> +				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
> +				 <&msdc_top CLK_MSDC_TOP_P_MSDC1>,
> +				 <&msdc_top CLK_MSDC_TOP_AXI>,
> +				 <&msdc_top CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
> +			clock-names =3D "source", "hclk", "source_cg", "sys_cg",
> +				      "pclk_cg", "axi_cg", "ahb_cg";
> +			status =3D "disabled";
>  		};
>  =

>  		mfgcfg: clock-controller@13fbf000 {
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
