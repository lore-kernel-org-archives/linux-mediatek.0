Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF6CC43219
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 20:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7ri+htSF1P5bVisobf5HS4MdsM5ik2OY7xTYbnpObo=; b=mJ4NERHcP5SdAa
	Ow/wGzF2ulOOJaiTyOyLNcGUxeSKTKYRlg9BARMhGbDzGDsC7Qo/tLhxK2sZxNJsBaeWzJvp1HYee
	5bqjRLuOSAwaCR0ZgoM0lDYJgMCx1dnWDhp1wTHBvqZwnk39IAgdCBMkvp3xcq0DOK9tmKiN2pwFq
	UhXzD30FIlhh12/rsxKqNmSfriWB+3XB4bHsy0VWKQoSoj9ZURKMO4jWMH8Ad0DJKxWDXK3ToFBMU
	r5tu9V7T0DzxLxitpNa0/48AlPnilbe7OltjGf6kKYibW3ynpSo41HdToiCc7jh6I0EvXAjxgYqeX
	rOUwp211QBBaACE31Qwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWktV-00C4b2-EH; Tue, 22 Mar 2022 20:14:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWktJ-00C4ZZ-5U; Tue, 22 Mar 2022 20:14:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 5AD151F42EBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647980041;
 bh=CHw7sZCuJpAli88yUDsSE7+L4DPTITJnekKWt6hXu+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h0xFVdRqaYEq/WG30NJ6ZSA+WJpaI1VAtF463Z9pVkqndqm6IJ7czLjyD8i8NfZWh
 CoMhVRHRlBaWkm20jGRYkIlJOqabo8/PYnzmbEcHqPY4M2HWHY7F0543offvVfKsHp
 FjkuM+dLOg/4Xy/fZQQGyRjRzsAB7fGxiGyZvPqRVzj5P/C1nQyisKy0DRtpBdenA3
 uIVI6C9LlDFJzLEz4jGJHcl751IHsHRVvNoG+YIg9d8lSpa7NsPfOsREeaS+7eJr3Z
 lpMB1UcrLPNEHWdZcC2JY2/PtDI0G5tDhKt2GJjWxS7J+iIrcQH53Zj8iCoWwzti0l
 ooijqNv5T82AA==
Date: Tue, 22 Mar 2022 16:13:57 -0400
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
Subject: Re: [PATCH v4 20/22] arm64: dts: mt8192: Add dsi node
Message-ID: <20220322201357.ykxi4h7l3rkp6z3s@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-21-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318144534.17996-21-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_131405_410947_B78884F4 
X-CRM114-Status: GOOD (  13.56  )
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

On Fri, Mar 18, 2022 at 10:45:32PM +0800, Allen-KH Cheng wrote:
> Add dsi ndoe for mt8192 SoC.

Minor typo: ndoe -> node.

> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 59183fb6c80b..08e0dd2483d1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/power/mt8192-power.h>
> +#include <dt-bindings/reset/mt8192-resets.h>
>  #include <dt-bindings/reset/ti-syscon.h>
>  =

>  / {
> @@ -1203,6 +1204,7 @@
>  			compatible =3D "mediatek,mt8192-mmsys", "syscon";
>  			reg =3D <0 0x14000000 0 0x1000>;
>  			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
>  		};
>  =

>  		mutex: mutex@14001000 {
> @@ -1327,6 +1329,20 @@
>  			clocks =3D <&mmsys CLK_MM_DISP_DITHER0>;
>  		};
>  =

> +		dsi0: dsi@14010000 {
> +			compatible =3D "mediatek,mt8183-dsi";
> +			reg =3D <0 0x14010000 0 0x1000>;
> +			interrupts =3D <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&mmsys CLK_MM_DSI0>,
> +				 <&mmsys CLK_MM_DSI_DSI0>,
> +				 <&mipi_tx0>;
> +			clock-names =3D "engine", "digital", "hs";
> +			resets =3D <&mmsys MT8192_MMSYS_SW0_RST_B_DISP_DSI0>;
> +			phys =3D <&mipi_tx0>;
> +			phy-names =3D "dphy";
> +			status =3D "disabled";
> +		};
> +
>  		ovl_2l2: ovl@14014000 {
>  			compatible =3D "mediatek,mt8192-disp-ovl-2l";
>  			reg =3D <0 0x14014000 0 0x1000>;
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
