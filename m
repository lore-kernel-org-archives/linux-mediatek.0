Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BBBC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 21:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9L1oqEaSWaJUmAjBNRQVudFNZYlhGo8W2i9QloczFZg=; b=U9/p3acj8rFdcs
	P8uNzv4kuWZmk0oD6IUSAb2v1ApXin7u3I/rJrEF8U1CvDJuKuRUV9OAEAMFA9LkjjP50hH33EHbn
	vVbPcRLWS3hkTmfgmAoaYFn11blN3mCwSjTnZwcXVoTxuZoGpbY2jMsBTJE77GV37rDwCMsZrgSer
	/5ItVIyB1bAhhT7pjILB6v6SwQcswV7x8ft3WnOfcy9cky3lS/ych35STbosre98HQubAy2xxsqLr
	n+D0a2nlWUpANFT1BQLuWHIVQ8Zv8731Yel5+K5O/VbCWPqJ1RYBtnpTMhjl+nvQ2LWd2TkETvLu6
	LICYzrRd2czq3+QLQojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWmW4-00CH8t-Tf; Tue, 22 Mar 2022 21:58:12 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWmVs-00CH5o-Pm; Tue, 22 Mar 2022 21:58:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 3A0281F43FFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647986279;
 bh=I0arKn0E7vN63I4XgUWTYnGY2tJfYbzJ7u22hHlqdDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VsElHnMT+C8u3vo7bEekufFYeVPA3WFbn8uJ7uEwX5zTyvAfnKvP8pET4CbmF9xqP
 D1PxKgrCJG68lzmgEMGyc3swAkukTZmnjPvAXxEOoFep6ecSKq2VjKsUVUgCQF0/mm
 g2FXPiUePLi8uVnGqWFE7nzNlWVzClFXrbhRA9MwXyA8GwUfrJW81L18mPqM2wUqpj
 /h8G4wcFiDkRp9zyF5GIOtqEjW7/J1jPEterRCWpsN6W9Bw4dTUl5021ji1EEjuMX2
 cWFdboVCpxGkZHXt6zRcdBn2tT/LqoXQhPAPRZNrdakXsr/WQ/TQ3XQ5xY/SsWBf08
 3YLGry8aa0FJg==
Date: Tue, 22 Mar 2022 17:57:54 -0400
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
Subject: Re: [PATCH v4 08/22] arm64: dts: mt8192: Add infracfg_rst node
Message-ID: <20220322215754.j2hzutm775hvr25n@notapiano>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-9-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318144534.17996-9-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_145800_999178_507659F4 
X-CRM114-Status: GOOD (  17.60  )
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

please see my comment below.

On Fri, Mar 18, 2022 at 10:45:20PM +0800, Allen-KH Cheng wrote:
> Add infracfg_rst node for mt8192 SoC.
>  - Add simple-mfd to allow probing the ti,syscon-reset node.
> =

> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 40cf6dacca3e..82de1af3f6aa 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/power/mt8192-power.h>
> +#include <dt-bindings/reset/ti-syscon.h>
>  =

>  / {
>  	compatible =3D "mediatek,mt8192";
> @@ -267,10 +268,23 @@
>  			#clock-cells =3D <1>;
>  		};
>  =

> -		infracfg: syscon@10001000 {
> -			compatible =3D "mediatek,mt8192-infracfg", "syscon";
> +		infracfg: infracfg@10001000 {
> +			compatible =3D "mediatek,mt8192-infracfg", "syscon", "simple-mfd";
>  			reg =3D <0 0x10001000 0 0x1000>;
>  			#clock-cells =3D <1>;
> +
> +			infracfg_rst: reset-controller {
> +				compatible =3D "ti,syscon-reset";
> +				#reset-cells =3D <1>;
> +
> +				ti,reset-bits =3D <
> +					0x120 0 0x124 0 0 0	(ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 0:=
 lvts_ap */
> +					0x730 12 0x734 12 0 0	(ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* =
1: lvts_mcu */
> +					0x140 15 0x144 15 0 0	(ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* =
2: pcie phy */
> +					0x730 1 0x734 1 0 0	(ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 3:=
 pcie top */
> +					0x150 5 0x154 5 0 0	(ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 4:=
 svs */
> +				>;

If you see [1], Rob has previously said that there shouldn't be new users o=
f the
ti,reset-bits property. I suggest doing like proposed on [2]: moving these =
bit
definitions to the reset-ti-syscon driver, and have them selected through t=
he
compatible. You'd need to add a mt8192 specific compatible here too for tha=
t.

[1] https://lore.kernel.org/all/CAL_JsqJq6gqoXtvG1U7UDsOQpz7oMLMunZHq2njN6n=
vPr8PZMA@mail.gmail.com/
[2] https://lore.kernel.org/all/CAATdQgA5pKhjOf5gxo+h7cs7kCts3DeKGU5axeX2t+=
OaJFHyBg@mail.gmail.com/

Thanks,
N=EDcolas

> +			};
>  		};
>  =

>  		pericfg: syscon@10003000 {
> -- =

> 2.18.0
> =

> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
