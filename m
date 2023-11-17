Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3387C197A0
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 12:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npsjKK1E4mamKGL3cTGyWHJLzKqW6Cwvf80sD82f9kc=; b=4H/fNVN5TbnWqd2/eM2cXnIP7t
	f7uc6sAVSu4gOOuYtLGDrZR89KJyPzgrfDrYMXZMyeKaYZqo7R4n1rxw9L0zCQcq2bTjIZLPV+Qb/
	86c/o4FbDAQOu1Ktw47v/7zmnwmmM+blJkdYXfXohjC6OODi8XbIzGYp8VCQjqtaa6jReRinpebWD
	uxMdBkEr14CJbcEw+m8T8Xo3QSLTAHckOAsNLUoDB1CrOnZusGL3iMrw54t2MIfHuJhiGD8EjqDLN
	GGsGU97CV2VFsdZhQsWfAzplCPxjfZ5E5PxWco7/e4oHCmZn3Odqjbi8QzcROhCI5i4PXXCcbN45I
	0heKvQOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3xeb-006Vuy-1M;
	Fri, 17 Nov 2023 12:08:57 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3xeX-006Vu0-2Z;
	Fri, 17 Nov 2023 12:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1700222933; x=1731758933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=npsjKK1E4mamKGL3cTGyWHJLzKqW6Cwvf80sD82f9kc=;
  b=OYOgfcmcKajdamTj7A2V8trf3aq6cD8bj/bKduTHfZuSpbtP23yKwURW
   bn4D5mmCZ/b5HXwvL/qNVrvO5k6VMrhbOx9fhIvfASiBu6kymmH+FSkO0
   cUfeXMXnl8VdZxtgztmHQ6pRH45cGSdXgZy8Sq0QsZaT1Qd8AzKK3tK3C
   XLwVjupdnqa4GtDnNch0Xronr1ORfFT6Y5pK6d3oWBPRZCd3pWEorvgO7
   UJfYomT4ThV2RcW8vfFeQaU7QGmmF8nK9y8ultxHh6amXXTHPHnSbg6Dq
   pm+4zy30RfGwtShK5/fyC2MxHJ8eLsexauc0Bzl8HHK5SUXS5V2wkcl8l
   A==;
X-IronPort-AV: E=Sophos;i="6.04,206,1695679200"; 
   d="scan'208";a="34042550"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Nov 2023 13:08:49 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2F5EC28007F;
	Fri, 17 Nov 2023 13:08:49 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, =?ISO-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, linux-mediatek@lists.infradead.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v4 2/6] ARM: dts: ti/omap: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date: Fri, 17 Nov 2023 13:08:53 +0100
Message-ID: <10373360.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230724103914.1779027-3-alexander.stein@ew.tq-group.com>
References: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com> <20230724103914.1779027-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_040854_132380_B6D0C82A 
X-CRM114-Status: GOOD (  14.07  )
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

Hi everybody,

any feedback on this? Patch 3,4 and 6 have already been merged.

Thanks
Alexander

Am Montag, 24. Juli 2023, 12:39:09 CET schrieb Alexander Stein:
> Use id-gpios and vbus-gpios instead.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm/boot/dts/ti/omap/am571x-idk.dts          | 4 ++--
>  arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts | 2 +-
>  arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi  | 4 ++--
>  arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi    | 4 ++--
>  arch/arm/boot/dts/ti/omap/dra71-evm.dts           | 4 ++--
>  arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi   | 4 ++--
>  arch/arm/boot/dts/ti/omap/dra76-evm.dts           | 4 ++--
>  7 files changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/ti/omap/am571x-idk.dts
> b/arch/arm/boot/dts/ti/omap/am571x-idk.dts index 48425020281a..322cf79d22=
e9
> 100644
> --- a/arch/arm/boot/dts/ti/omap/am571x-idk.dts
> +++ b/arch/arm/boot/dts/ti/omap/am571x-idk.dts
> @@ -168,8 +168,8 @@ blue3-led {
>  };
>=20
>  &extcon_usb2 {
> -	id-gpio =3D <&gpio5 7 GPIO_ACTIVE_HIGH>;
> -	vbus-gpio =3D <&gpio7 22 GPIO_ACTIVE_HIGH>;
> +	id-gpios =3D <&gpio5 7 GPIO_ACTIVE_HIGH>;
> +	vbus-gpios =3D <&gpio7 22 GPIO_ACTIVE_HIGH>;
>  };
>=20
>  &sn65hvs882 {
> diff --git a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
> b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts index
> 149cfafb90bf..c5272302eb11 100644
> --- a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
> +++ b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
> @@ -197,7 +197,7 @@ brcmf_pwrseq: brcmf_pwrseq {
>  	extcon_usb1: extcon_usb1 {
>  		compatible =3D "linux,extcon-usb-gpio";
>  		ti,enable-id-detection;
> -		id-gpio =3D <&gpio3 13 GPIO_ACTIVE_HIGH>;
> +		id-gpios =3D <&gpio3 13 GPIO_ACTIVE_HIGH>;
>  	};
>  };
>=20
> diff --git a/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi
> b/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi index
> 1d66278c3a72..3fca84819dc0 100644
> --- a/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi
> @@ -169,8 +169,8 @@ blue3-led {
>  };
>=20
>  &extcon_usb2 {
> -	id-gpio =3D <&gpio3 16 GPIO_ACTIVE_HIGH>;
> -	vbus-gpio =3D <&gpio3 26 GPIO_ACTIVE_HIGH>;
> +	id-gpios =3D <&gpio3 16 GPIO_ACTIVE_HIGH>;
> +	vbus-gpios =3D <&gpio3 26 GPIO_ACTIVE_HIGH>;
>  };
>=20
>  &sn65hvs882 {
> diff --git a/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi
> b/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi index
> 4cdffd6db740..ed5199d7acd8 100644
> --- a/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi
> @@ -15,12 +15,12 @@ chosen {
>=20
>  	extcon_usb1: extcon_usb1 {
>  		compatible =3D "linux,extcon-usb-gpio";
> -		id-gpio =3D <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
> +		id-gpios =3D <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
>  	};
>=20
>  	extcon_usb2: extcon_usb2 {
>  		compatible =3D "linux,extcon-usb-gpio";
> -		id-gpio =3D <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
> +		id-gpios =3D <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
>  	};
>=20
>  	sound0: sound0 {
> diff --git a/arch/arm/boot/dts/ti/omap/dra71-evm.dts
> b/arch/arm/boot/dts/ti/omap/dra71-evm.dts index a64364443031..f747ac56eb92
> 100644
> --- a/arch/arm/boot/dts/ti/omap/dra71-evm.dts
> +++ b/arch/arm/boot/dts/ti/omap/dra71-evm.dts
> @@ -293,11 +293,11 @@ &hdmi {
>  };
>=20
>  &extcon_usb1 {
> -	vbus-gpio =3D <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
> +	vbus-gpios =3D <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
>  };
>=20
>  &extcon_usb2 {
> -	vbus-gpio =3D <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
> +	vbus-gpios =3D <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
>  };
>=20
>  &ipu2 {
> diff --git a/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi
> b/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi index
> 31ab0c60ca75..f8151c61488e 100644
> --- a/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi
> @@ -96,12 +96,12 @@ evm_3v3_sd: fixedregulator-sd {
>=20
>  	extcon_usb1: extcon_usb1 {
>  		compatible =3D "linux,extcon-usb-gpio";
> -		id-gpio =3D <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
> +		id-gpios =3D <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
>  	};
>=20
>  	extcon_usb2: extcon_usb2 {
>  		compatible =3D "linux,extcon-usb-gpio";
> -		id-gpio =3D <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
> +		id-gpios =3D <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
>  	};
>=20
>  	hdmi0: connector {
> diff --git a/arch/arm/boot/dts/ti/omap/dra76-evm.dts
> b/arch/arm/boot/dts/ti/omap/dra76-evm.dts index 57868ac60d29..cf9c3d35b049
> 100644
> --- a/arch/arm/boot/dts/ti/omap/dra76-evm.dts
> +++ b/arch/arm/boot/dts/ti/omap/dra76-evm.dts
> @@ -533,11 +533,11 @@ &pcie1_ep {
>  };
>=20
>  &extcon_usb1 {
> -	vbus-gpio =3D <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
> +	vbus-gpios =3D <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
>  };
>=20
>  &extcon_usb2 {
> -	vbus-gpio =3D <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
> +	vbus-gpios =3D <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
>  };
>=20
>  &m_can0 {


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



