Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4662C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 17:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKt4zTBaz9G/5pe6rz46P3HcRJlA73i/0n4xQULRCS8=; b=SoQZDGZTLcfvi+
	MJVhjNIRJ20YFqUUSaspKHefyqgHevAop6VORKSc9GAJeZ01lB7OeJS/sGh2uPuUEjfdHz0/nGLGG
	onvQ12XgH9og+VX+bqUvwpiEAroIM5A4fIcUGB7koEvrWOS1M096hvelBWPHttbuu7Wd2hB4MPxNs
	YC08A2DCKEC5fzGwyeAjPr3WxdqANoygbX64aAuTzgTsDAvZfyNYSc9cf+W4aR1il9avPeYkqFmTX
	hEweZDnyZKH68tKjK6Zf3unKNtJLxT+xsracHuwls9lAd9KttOH2ZZlOupWNvS0q+MmW1OmWelVNk
	gaXIGNULdX/cTxtE0R9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muHOK-004wxN-Uk; Mon, 06 Dec 2021 17:03:05 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muHBT-004rhe-Gn; Mon, 06 Dec 2021 16:49:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id F27CD1F43C35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638809386; bh=qfUFan4m2sFvarO5pNQBYh3y4OdCYl1SaFFzn9XCL5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QArdQ/vQ9AhaRkn3wP4qwOb3LfcuW5xp94Oos5Hyn925UD1t3vxwam9H7Eo4m9qA3
 tDGGKQDHH49frMy7/eM87m9iTeb9/t+KoZRnpyTvdMfu+XhXaKaJV9o67Sz87wsDXA
 mzJwMDBFR3a3yGK1bu2vRVf9X01gnOekMcq6LkCx/rfFgNs3QtWriJ3ZJI5Rb/RdAT
 b3OxEcITGXfZmPanUgaSOR58Br+PW4U4ZnKuJ/HjnVmmU8sX1CIPjiMI59sqt8FYRt
 T+sh6bf9tMpjpUpLEcPANFtw9sFDlrADYpuXyCJPc5KS6R4+VensCUFQUMIbf97SOl
 xHy7o3HTN7lfg==
Date: Mon, 6 Dec 2021 11:49:40 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v1 5/5] arm64: dts: mediatek: Correct I2C clock of MT8192
Message-ID: <20211206164940.qw7mpalg3djmgf5p@notapiano>
References: <20210825011120.30481-1-chun-jie.chen@mediatek.com>
 <20210825011120.30481-6-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210825011120.30481-6-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_084947_879030_A97A58FB 
X-CRM114-Status: GOOD (  11.73  )
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

Hi,

On Wed, Aug 25, 2021 at 09:11:20AM +0800, Chun-Jie Chen wrote:
> update i2c 0 ~ 9 clocks to the real ones.

Same comment from patch 1.

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

> =

> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 30 ++++++++++++++++--------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index db6f4c6dc404..866b04e78690 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -484,7 +484,8 @@
>  			reg =3D <0 0x11cb0000 0 0x1000>,
>  			      <0 0x10217300 0 0x80>;
>  			interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>, <&clk26m>;
> +			clocks =3D <&imp_iic_wrap_e CLK_IMP_IIC_WRAP_E_I2C3>,
> +				 <&infracfg CLK_INFRA_AP_DMA>;
>  			clock-names =3D "main", "dma";
>  			clock-div =3D <1>;
>  			#address-cells =3D <1>;
> @@ -503,7 +504,8 @@
>  			reg =3D <0 0x11d00000 0 0x1000>,
>  			      <0 0x10217600 0 0x180>;
>  			interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>, <&clk26m>;
> +			clocks =3D <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C7>,
> +				 <&infracfg CLK_INFRA_AP_DMA>;
>  			clock-names =3D "main", "dma";
>  			clock-div =3D <1>;
>  			#address-cells =3D <1>;
> @@ -516,7 +518,8 @@
>  			reg =3D <0 0x11d01000 0 0x1000>,
>  			      <0 0x10217780 0 0x180>;
>  			interrupts =3D <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>, <&clk26m>;
> +			clocks =3D <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C8>,
> +				 <&infracfg CLK_INFRA_AP_DMA>;
>  			clock-names =3D "main", "dma";
>  			clock-div =3D <1>;
>  			#address-cells =3D <1>;
> @@ -529,7 +532,8 @@
>  			reg =3D <0 0x11d02000 0 0x1000>,
>  			      <0 0x10217900 0 0x180>;
>  			interrupts =3D <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>, <&clk26m>;
> +			clocks =3D <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C9>,
> +				 <&infracfg CLK_INFRA_AP_DMA>;
>  			clock-names =3D "main", "dma";
>  			clock-div =3D <1>;
>  			#address-cells =3D <1>;
> @@ -548,7 +552,8 @@
>  			reg =3D <0 0x11d20000 0 0x1000>,
>  			      <0 0x10217100 0 0x80>;
>  			interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>, <&clk26m>;
> +			clocks =3D <&imp_iic_wrap_ws CLK_IMP_IIC_WRAP_WS_I2C1>,
> +				 <&infracfg CLK_INFRA_AP_DMA>;
>  			clock-names =3D "main", "dma";
>  			clock-div =3D <1>;
>  			#address-cells =3D <1>;
> @@ -561,7 +566,8 @@
>  			reg =3D <0 0x11d21000 0 0x1000>,
>  			      <0 0x10217180 0 0x180>;
>  			interrupts =3D <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>, <&clk26m>;
> +			clocks =3D <&imp_iic_wrap_ws CLK_IMP_IIC_WRAP_WS_I2C2>,
> +				 <&infracfg CLK_INFRA_AP_DMA>;
>  			clock-names =3D "main", "dma";
>  			clock-div =3D <1>;
>  			#address-cells =3D <1>;
> @@ -574,7 +580,8 @@
>  			reg =3D <0 0x11d22000 0 0x1000>,
>  			      <0 0x10217380 0 0x180>;
>  			interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>, <&clk26m>;
> +			clocks =3D <&imp_iic_wrap_ws CLK_IMP_IIC_WRAP_WS_I2C4>,
> +				 <&infracfg CLK_INFRA_AP_DMA>;
>  			clock-names =3D "main", "dma";
>  			clock-div =3D <1>;
>  			#address-cells =3D <1>;
> @@ -593,7 +600,8 @@
>  			reg =3D <0 0x11e00000 0 0x1000>,
>  			      <0 0x10217500 0 0x80>;
>  			interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>, <&clk26m>;
> +			clocks =3D <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_I2C5>,
> +				 <&infracfg CLK_INFRA_AP_DMA>;
>  			clock-names =3D "main", "dma";
>  			clock-div =3D <1>;
>  			#address-cells =3D <1>;
> @@ -612,7 +620,8 @@
>  			reg =3D <0 0x11f00000 0 0x1000>,
>  			      <0 0x10217080 0 0x80>;
>  			interrupts =3D <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>, <&clk26m>;
> +			clocks =3D <&imp_iic_wrap_n CLK_IMP_IIC_WRAP_N_I2C0>,
> +				 <&infracfg CLK_INFRA_AP_DMA>;
>  			clock-names =3D "main", "dma";
>  			clock-div =3D <1>;
>  			#address-cells =3D <1>;
> @@ -625,7 +634,8 @@
>  			reg =3D <0 0x11f01000 0 0x1000>,
>  			      <0 0x10217580 0 0x80>;
>  			interrupts =3D <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>, <&clk26m>;
> +			clocks =3D <&imp_iic_wrap_n CLK_IMP_IIC_WRAP_N_I2C6>,
> +				 <&infracfg CLK_INFRA_AP_DMA>;
>  			clock-names =3D "main", "dma";
>  			clock-div =3D <1>;
>  			#address-cells =3D <1>;
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
