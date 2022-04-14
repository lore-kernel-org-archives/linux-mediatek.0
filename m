Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FB2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 21:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SLz1lMM+5wnPImhugYkbLFq3vnsax4u4YYyLA0GRzk=; b=ITby+5oTGLUnj1
	gV0/8ztjepchFPGJtOg/HG+eGAuDeAS0Fu904oFsf0WHekS8nLweyP8c1YySDAb2LpC2DhiKY9yeR
	kTHdvI5PC/DStFlSVfs5/ozYAS7wWJRz3CoSWzDLGD81ouTZuCtfILBlhI6W4xt8I0GC4mj2VlQ+w
	gOO9Z4hYxXUfaxQoi4+9gGA6nqzr13skqyWa3WwNpSQn2StDDrO+4HIzkb5n9xN0SFGlptzQBun/r
	5De4y+sFxd6ore/toCks6kerdl5p1PZLLxVogfPrD8JP0tvFJWU0E0IugmsnZsuSBcuAhbFeDiLJD
	i2xxPBUF5xVwFunHZKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf6s0-007KvM-NN; Thu, 14 Apr 2022 21:19:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf6rp-007KrA-AZ; Thu, 14 Apr 2022 21:19:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 154A21F47CE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649971140;
 bh=2xKknOtDpSR8eQDaiaIyagDa3TimNCOxCV05QM9h4w4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GGsh8woUuFVu9AByGubOp4z01sVpeiC5ATFwD3L5+80wsbyGo9tpii4Btn190Ebzv
 2GPkMFbNnHvjbsYOMSOKEG2n4Fm4Tc86Y1u0kvXPRuLGcyd6SUg/k8fGngKGJJEc81
 y/GE3JTd6QrkuZRVLX/RjMCmR9H9pf9HuxY1VDb9BaXMUDzUavxbXp7Pc58Yj1sz/Y
 x3UK4OJ/HFXulBdjHewAJfPJiJSrXIiWWrUGZ+tcX7o+7eSzBJ356XO4K7aCVjwwd6
 YljzroGf/EjaE/QxQt3cXTEtU5wP2vlXYGoOuvdpG1owipTanYuqW4zl27y9aQfEkZ
 YmpQOIxAeEA9w==
Date: Thu, 14 Apr 2022 17:18:55 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: mt8192: Add mmc device nodes
Message-ID: <20220414211855.5crksjgvar3ugayq@notapiano>
References: <20220407113703.26423-1-allen-kh.cheng@mediatek.com>
 <20220407113703.26423-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220407113703.26423-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_141905_538018_F259F231 
X-CRM114-Status: GOOD (  15.73  )
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

On Thu, Apr 07, 2022 at 07:37:03PM +0800, Allen-KH Cheng wrote:
> In mt8192 SoC, mmc driver dose not use the MSDC module to control
> clock. It will read/write register to enable/disable clock. Also
> there is no other device of mt8192 using MSDC controller.
> =

> We add mmc nodes for mt8192 SoC and remove the clock-controller in
> dts for avoid a duplicate unit-address(11f60000) warning.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 34 +++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 4 deletions(-)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index a6da7b04b9d4..18a58239d6f1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -985,10 +985,36 @@
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
