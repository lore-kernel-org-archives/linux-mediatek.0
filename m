Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA681C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 16:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGuG+6XsfM8V1kl2iGK4nC4H4ZA2YiW84M/6unopx8Y=; b=j9BYLXtJSkWDgg
	p6NxXPPyZj3K06jaxngbmCScinyma5yFvFqCZkEXmGrDSjre3UFlVJ4hX5WT7LmopH+1zy6dalSUo
	cYxxNTDtYK6loHdw7vEWq0Nn03+vKk5n2zxYWTMU/TuRy6rg2MdeXdW51Ygr+n/N8TcCyjpseIF8e
	8VMoyUXLF/3QLIc2yWrWoMw/htnSLulKimYxt714euAq5yO1KV6nMziFw4zbrbRYWSbiYlXXxi961
	fC/ldj4XrpQQ322nZw3+7AmrPm3zqP5T9zh1yEn03p3PG086FU1tVSfWR5cG5ezB+1Mzd2THLPRww
	vowNoRc43qN6Dxc5QT8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muH9J-004qe0-P2; Mon, 06 Dec 2021 16:47:33 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muH90-004qWT-If; Mon, 06 Dec 2021 16:47:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 021921F44A9A
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638809233; bh=eySRGQLbNOqYcJFdEtWXKNpdKPAAJqJEFoPWxe6NFEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kG/aqFPaO9FXOBd8S0OrROFiszjPbRsX1/TYXZNyydzGLG4cvxiiMOsApvgabBCuZ
 QotqXTxOCWu1rm4Cuajuqc+iuyy0asath5Trthuh1xyJkfRpxORht3fYUeS/krMXSP
 4IX066p3EI9sLfAD6WsmFQ4HO7X9cWHniJYwYkzxZ4efo4pbmo9h7bcKEMTPD6QIj/
 QC4RA6LUvv1Qpc3mP4WGtaOeewXB4lNT+INj+6iSfyL8Z8PRnRQdwUz+1cXWLjQKEV
 8NW7JfTAPh24h4zOu5bNtWiOjGW+ZGyF8i2aIda/1pbQXmARrX4raSfDsjsbkHzGJ5
 K2SP+BePr2YIg==
Date: Mon, 6 Dec 2021 11:47:07 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v1 3/5] arm64: dts: mediatek: Correct SPI clock of MT8192
Message-ID: <20211206164707.u4tvsmr7fnkzs5tu@notapiano>
References: <20210825011120.30481-1-chun-jie.chen@mediatek.com>
 <20210825011120.30481-4-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210825011120.30481-4-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_084714_904351_47F4DD8F 
X-CRM114-Status: GOOD (  12.73  )
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

On Wed, Aug 25, 2021 at 09:11:18AM +0800, Chun-Jie Chen wrote:
> update uart0 ~ 7 clocks to the real ones.

Same comment from patch 1. But also here you had a typo: should be spi inst=
ead
of uart.

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

> =

> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 48 ++++++++++++------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 31d135e18784..d1c85d3e152b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -355,9 +355,9 @@
>  			#size-cells =3D <0>;
>  			reg =3D <0 0x1100a000 0 0x1000>;
>  			interrupts =3D <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>,
> -				 <&clk26m>,
> -				 <&clk26m>;
> +			clocks =3D <&topckgen CLK_TOP_MAINPLL_D5_D4>,
> +				 <&topckgen CLK_TOP_SPI_SEL>,
> +				 <&infracfg CLK_INFRA_SPI0>;
>  			clock-names =3D "parent-clk", "sel-clk", "spi-clk";
>  			status =3D "disabled";
>  		};
> @@ -369,9 +369,9 @@
>  			#size-cells =3D <0>;
>  			reg =3D <0 0x11010000 0 0x1000>;
>  			interrupts =3D <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>,
> -				 <&clk26m>,
> -				 <&clk26m>;
> +			clocks =3D <&topckgen CLK_TOP_MAINPLL_D5_D4>,
> +				 <&topckgen CLK_TOP_SPI_SEL>,
> +				 <&infracfg CLK_INFRA_SPI1>;
>  			clock-names =3D "parent-clk", "sel-clk", "spi-clk";
>  			status =3D "disabled";
>  		};
> @@ -383,9 +383,9 @@
>  			#size-cells =3D <0>;
>  			reg =3D <0 0x11012000 0 0x1000>;
>  			interrupts =3D <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>,
> -				 <&clk26m>,
> -				 <&clk26m>;
> +			clocks =3D <&topckgen CLK_TOP_MAINPLL_D5_D4>,
> +				 <&topckgen CLK_TOP_SPI_SEL>,
> +				 <&infracfg CLK_INFRA_SPI2>;
>  			clock-names =3D "parent-clk", "sel-clk", "spi-clk";
>  			status =3D "disabled";
>  		};
> @@ -397,9 +397,9 @@
>  			#size-cells =3D <0>;
>  			reg =3D <0 0x11013000 0 0x1000>;
>  			interrupts =3D <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>,
> -				 <&clk26m>,
> -				 <&clk26m>;
> +			clocks =3D <&topckgen CLK_TOP_MAINPLL_D5_D4>,
> +				 <&topckgen CLK_TOP_SPI_SEL>,
> +				 <&infracfg CLK_INFRA_SPI3>;
>  			clock-names =3D "parent-clk", "sel-clk", "spi-clk";
>  			status =3D "disabled";
>  		};
> @@ -411,9 +411,9 @@
>  			#size-cells =3D <0>;
>  			reg =3D <0 0x11018000 0 0x1000>;
>  			interrupts =3D <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>,
> -				 <&clk26m>,
> -				 <&clk26m>;
> +			clocks =3D <&topckgen CLK_TOP_MAINPLL_D5_D4>,
> +				 <&topckgen CLK_TOP_SPI_SEL>,
> +				 <&infracfg CLK_INFRA_SPI4>;
>  			clock-names =3D "parent-clk", "sel-clk", "spi-clk";
>  			status =3D "disabled";
>  		};
> @@ -425,9 +425,9 @@
>  			#size-cells =3D <0>;
>  			reg =3D <0 0x11019000 0 0x1000>;
>  			interrupts =3D <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>,
> -				 <&clk26m>,
> -				 <&clk26m>;
> +			clocks =3D <&topckgen CLK_TOP_MAINPLL_D5_D4>,
> +				 <&topckgen CLK_TOP_SPI_SEL>,
> +				 <&infracfg CLK_INFRA_SPI5>;
>  			clock-names =3D "parent-clk", "sel-clk", "spi-clk";
>  			status =3D "disabled";
>  		};
> @@ -439,9 +439,9 @@
>  			#size-cells =3D <0>;
>  			reg =3D <0 0x1101d000 0 0x1000>;
>  			interrupts =3D <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>,
> -				 <&clk26m>,
> -				 <&clk26m>;
> +			clocks =3D <&topckgen CLK_TOP_MAINPLL_D5_D4>,
> +				 <&topckgen CLK_TOP_SPI_SEL>,
> +				 <&infracfg CLK_INFRA_SPI6>;
>  			clock-names =3D "parent-clk", "sel-clk", "spi-clk";
>  			status =3D "disabled";
>  		};
> @@ -453,9 +453,9 @@
>  			#size-cells =3D <0>;
>  			reg =3D <0 0x1101e000 0 0x1000>;
>  			interrupts =3D <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks =3D <&clk26m>,
> -				 <&clk26m>,
> -				 <&clk26m>;
> +			clocks =3D <&topckgen CLK_TOP_MAINPLL_D5_D4>,
> +				 <&topckgen CLK_TOP_SPI_SEL>,
> +				 <&infracfg CLK_INFRA_SPI7>;
>  			clock-names =3D "parent-clk", "sel-clk", "spi-clk";
>  			status =3D "disabled";
>  		};
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
