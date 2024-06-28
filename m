Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CD9C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 09:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXcyRDCaJB09jaDRAMlmuxE97++8Tda7l+ochk/FMPA=; b=fsik2rTE/4ILDL97NItFK3obZn
	sVv2gEZTCTKP7n+jKWZxEzpJEZx/0jIePw8uChWvv72LvpeyuDoxBfB0bLBEdiZiSIxS2kiN7p6OO
	6Ccuzm9gwPQJ0a3Yrw0P4JSYkrGVokf7SCtN11Qg3ZuFQiSp7KLd/bwqYuC4MZkPoQhdi2hqbjE3g
	90cJ5oJG+JA6YAJGNm6Mhhexvrzcpt8g8eJAuW/friEFtUnJrtk4RvfJzxo4shZD8mgXjSxDd4ftz
	z6Oak0giVgSolpUSp9HD1JNbgoFS0J2BTC+KQt/RG5BHrJfN5Qgcktn3JtmH719TUQoQy/a4kOXQF
	0ZNiiqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7hF-0000000DEGb-2lMI;
	Fri, 28 Jun 2024 09:15:09 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7h4-0000000DEEX-2PlW;
	Fri, 28 Jun 2024 09:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1719566098; x=1751102098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EXcyRDCaJB09jaDRAMlmuxE97++8Tda7l+ochk/FMPA=;
  b=EfBaznNeLM5Fuiw3Dy+zRoUYs1vT9nsxfTV//VBrDtPSuDW461JjVY1z
   J5t6HBPNpv62OPxUJ0i6LvRvnQi8AONYXE404Xt47gDdaT4XUkrYqPhaB
   1xO63bS1npDdk+5x6bSeeaBPILCuZLKGeS098sgXX5UZvNHbj1z1LU8u6
   v/8Yckbw0MSkIwrJNGZYD76E3vzLD5bbad/w9YQZdy6Pov3qoZooy8kqh
   H9K8QMMNfMIzuCm1Mshj0ViWsM7OAymYEUouCoC5Ua/KPiqJuSr0/WoGM
   qBjHt9kIsrkYy4AfMc453dU277DbNp5QY25PnbQQBZC/mUZwFsbajtqf2
   A==;
X-CSE-ConnectionGUID: 3uHoSeWRTF6jY+THVhd5ww==
X-CSE-MsgGUID: R/DCuKDpQwCPgAWWYmfvcQ==
X-IronPort-AV: E=Sophos;i="6.09,168,1716242400"; 
   d="scan'208";a="37642892"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Jun 2024 11:14:53 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 281B216440A;
	Fri, 28 Jun 2024 11:14:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1719566089;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EXcyRDCaJB09jaDRAMlmuxE97++8Tda7l+ochk/FMPA=;
	b=pSoL9liWiY3aHHTf9XtmJ6S+AMLi3vi7rXkZ/u9KMRWcOYzaWUyjxXUSIjSjp4taiGSHrJ
	kaV1bxOnFYEnc9S16x8pQ/NZtPWQQBff+5m2FFgH8bzKmaD1TcdFrYwOAU0/2eQ7/efVQO
	bfr4m9cY14zXDLARV3ByXgzFI7F4oXOXltFzHklLOEZ4LldtpnKct0sGXSqiMf6m/xfhZe
	joOEmJX7is5RUx5Hxu5WjXwL/7mOfdQ1Yvo3tUCLM3gWmCGbLcSbK1WAPrkXNGxfbtGue6
	Ot8jNBoS4MBvmO6YzQrDd0l5e3xPp78cXy8vP0xNTYB9t+8E9AAe7+WYEjmEoA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 1/2] dt-bindings: extcon-usb-gpio: convert to DT schema format
Date: Fri, 28 Jun 2024 11:14:49 +0200
Message-ID: <2550039.Sgy9Pd6rRy@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240215093214.796821-2-alexander.stein@ew.tq-group.com>
References: <20240215093214.796821-1-alexander.stein@ew.tq-group.com> <20240215093214.796821-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_021459_124661_8580EAC4 
X-CRM114-Status: GOOD (  21.10  )
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

Am Donnerstag, 15. Februar 2024, 10:32:13 CEST schrieb Alexander Stein:
> Convert the binding to DT schema format. Change the GPIO properties to new
> naming convention using -gpios as well.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Patch 2 has been applied as 5b6df373ec95cf051264f655be0dbe1d6caa173c
Who is going to pick this?

Thanks
Alexander

> ---
>  .../bindings/extcon/extcon-usb-gpio.txt       | 21 --------
>  .../bindings/extcon/extcon-usb-gpio.yaml      | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/extcon/extcon-usb-g=
pio.txt
>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-usb-g=
pio.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt=
 b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> deleted file mode 100644
> index dfc14f71e81fb..0000000000000
> --- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -USB GPIO Extcon device
> -
> -This is a virtual device used to generate USB cable states from the USB =
ID pin
> -connected to a GPIO pin.
> -
> -Required properties:
> -- compatible: Should be "linux,extcon-usb-gpio"
> -
> -Either one of id-gpio or vbus-gpio must be present. Both can be present =
as well.
> -- id-gpio: gpio for USB ID pin. See gpio binding.
> -- vbus-gpio: gpio for USB VBUS pin.
> -
> -Example: Examples of extcon-usb-gpio node in dra7-evm.dts as listed belo=
w:
> -	extcon_usb1 {
> -		compatible =3D "linux,extcon-usb-gpio";
> -		id-gpio =3D <&gpio6 1 GPIO_ACTIVE_HIGH>;
> -	}
> -
> -	&omap_dwc3_1 {
> -		extcon =3D <&extcon_usb1>;
> -	};
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yam=
l b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml
> new file mode 100644
> index 0000000000000..136f865b87816
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/extcon/extcon-usb-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: USB GPIO Extcon device
> +
> +maintainers:
> +  - Alexander Stein <alexander.stein@ew.tq-group.com>
> +
> +description:
> +  This is a virtual device used to generate USB cable states from the
> +  USB ID pin connected to a GPIO pin.
> +  Deprecated, use USB connector node instead.
> +
> +deprecated: true
> +
> +properties:
> +  compatible:
> +    const: linux,extcon-usb-gpio
> +
> +  id-gpios:
> +    description: An input gpio for USB ID pin.
> +    maxItems: 1
> +
> +  vbus-gpios:
> +    description: An input gpio for USB VBus pin, used to detect presence=
 of
> +      VBUS 5V.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +
> +anyOf:
> +  - required:
> +      - id-gpios
> +  - required:
> +      - vbus-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    extcon-usb1 {
> +      compatible =3D "linux,extcon-usb-gpio";
> +      id-gpios =3D <&gpio6 1 GPIO_ACTIVE_HIGH>;
> +      vbus-gpios =3D <&gpio6 2 GPIO_ACTIVE_HIGH>;
> +    };
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



