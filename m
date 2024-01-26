Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05767C47258
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 03:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WyUC6MmB08/BiaNWVTf9K2ZnTvIR5FpF1Gb9asD+uw=; b=hrZPT0SSCZXRbb7E8MRBUO5u8y
	7d/nlJbfnSmnXYaakvK4zNRCWyJmeTEz3PZ1AT/4rRg5okGXaYdrR3oSIPd+F2nKQ30TS5X9dMxQe
	XAqDdVJpUNxD9uaBhUvEeQM6IJmL0vdgDKxd1bjmHQT3GV+G2ohvYQAnyejmkJBm4cEH7MMhfddLq
	Yx0nk20sHrAssJvZmvzvuOGw6LlafUyDM31ax1mlkEu5+oCUBbBJhQUaEUO8gaOqTum6ZPMwmhpum
	WJnWNgGibovNc43k31iZa5n6Ko417nI+qgQpRz1P+GSIxXLOSnYVW2BI47wiQMY/A82vFZtlk1bUK
	sstsZLMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTCrZ-00000002xzw-2gaf;
	Fri, 26 Jan 2024 03:26:41 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTCrW-00000002xz9-2MJx
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 03:26:39 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2cf2b218c62so29851321fa.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jan 2024 19:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706239596; x=1706844396; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WyUC6MmB08/BiaNWVTf9K2ZnTvIR5FpF1Gb9asD+uw=;
        b=bOJ6Xr0YcNV3hSfhGMQMoVIW107O8zHq3gt+3Wf0WOJefM6ec/rJbVFybKAgq7ISQU
         7vWoCCkJt9ZA+hqMOFG5FOMY2TNBvBgoTsSJTugPFX9zdziaI55VRQCJCBlh10f2oN0g
         eMlJEXsNycY1obTqGRO4YQJpfduAo5HEt2Xw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706239596; x=1706844396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WyUC6MmB08/BiaNWVTf9K2ZnTvIR5FpF1Gb9asD+uw=;
        b=MYXvDHnzNv4Hen8szZcUcemWrk6excHxsAkijbkbspDud79NE+H+BjX0h+tw1/KwUd
         fkl1JFbsz72T1V2oINVJP8iuz5doflySYBaiBGRhexJ+26P4xdD5akOn516M3ji4S7cd
         CiM6w+6N0lLjbdIR4UeDLQREVghEYSnWUYUx7WVSq3nBhv8utZIJe2xjom6oALf3LKT6
         J5eNetgoCTDBNEGOe7ouveMDvXj7wGGbuqpwPtoByXNHzUiSpQx1xZeggwyG/5aw7Zl/
         I2BqeyfnB0ZcDa1wmCnMIQt3/kmO8Rdz8giF/c6crG8UD4uQDjeXfErqvCmBIjAPl0vO
         fnpg==
X-Gm-Message-State: AOJu0YwSA9e9FJ90I+FnckGwokxzUn8zlLH/S+KgYuyX6esUmpbxwwN2
	ViQ9AbiCcDCrhf+IXzVUWW7Cp2O1kVX8NiWbmu88ipf0EZaEHIMyjQF26d7+2eqn4OPdgoIsEf0
	aEfh5W1aLsk90k5kp8Udo6CZ/MIBoINh9Civ2
X-Google-Smtp-Source: AGHT+IEDjNQzwVaWPwAv+h5mtaVgEfszPvfXWHkJHOd/8GLlNf7ga0naC1J+rIBTXRI404s6h2BKMm+4EmCTd7dMJ8I=
X-Received: by 2002:a05:651c:b1f:b0:2cc:a569:48d with SMTP id
 b31-20020a05651c0b1f00b002cca569048dmr210919ljr.44.1706239596392; Thu, 25 Jan
 2024 19:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20240125095240.2308340-1-wenst@chromium.org> <20240125095240.2308340-2-wenst@chromium.org>
 <68249675-4081-48d9-abbb-1b2e49894fae@collabora.com>
In-Reply-To: <68249675-4081-48d9-abbb-1b2e49894fae@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 26 Jan 2024 11:26:25 +0800
Message-ID: <CAGXv+5GG+Ko4nZKCvpQ2TnjeHDKWi5qS_SWAgLcrZ6fn_ySiug@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_192638_630164_FCC52B99 
X-CRM114-Status: GOOD (  29.40  )
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

On Thu, Jan 25, 2024 at 7:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 25/01/24 10:52, Chen-Yu Tsai ha scritto:
> > The MediaTek MT7921S is a WiFi/Bluetooth combo chip that works over
> > SDIO. While the Bluetooth function is fully discoverable, the chip
> > has a pin that can reset just the Bluetooth side, as opposed to the
> > full chip. This needs to be described in the device tree.
> >
> > Add a device tree binding for MT7921S Bluetooth over SDIO specifically
> > ot document the reset line.
> >
> > Cc: Sean Wang <sean.wang@mediatek.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 49 ++++++++++++++++++=
+
> >   MAINTAINERS                                   |  1 +
> >   2 files changed, 50 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/net/bluetooth/me=
diatek,mt7921s-bluetooth.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,m=
t7921s-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/med=
iatek,mt7921s-bluetooth.yaml
> > new file mode 100644
> > index 000000000000..bbe240e7cc40
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-=
bluetooth.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7921s-blue=
tooth.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT7921S Bluetooth
> > +
>
> title:
>
> maintainers:
>
> description:
>
> ... and then, you missed
>
> allOf:
>    - $ref: bluetooth-controller.yaml#

(facepalm)

> Everything else looks good.
>
> Cheers,
> Angelo
>
> > +description:
>
> MT7921S is a (dual?) SDIO-attached dual-radio WiFi+Bluetooth combo chip;
> this chip has two dedicated reset lines, one of which is used to reset
> the Bluetooth core.
> The WiFi part of this chip is described in ....where? :-)

The function itself is fully probable and the implementation doesn't make
use of the WiFi's reset line, so I don't see any reason to describe it?
I don't actually know what the reset line does in the chip hardware.
This patch is just described what is already used.

> > +  This binding describes the Bluetooth side of the SDIO-attached MT792=
1S
> > +  WiFi+Bluetooth combo chips. These chips are dual-radio chips support=
ing
> > +  WiFi and Bluetooth. Bluetooth works over SDIO just like WiFi. Blueto=
oth
> > +  has its own reset line, separate from WiFi, which can be used to res=
et
> > +  the Bluetooth core.
> > +
> > +maintainers:
> > +  - Sean Wang <sean.wang@mediatek.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt7921s-bluetooth
> > +  reg:
> > +    const: 2
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: A GPIO line connected to the Bluetooth subsystem rese=
t line.
> > +      Typically the W_DISABLE2# pin on M.2 E-key modules. If present t=
his
> > +      shall be flagged as active low.
>
> description:
>    An active-low reset line connected for the Bluetooth core;

connected to?

>    on typical M.2 Key-E modules this is the W_DISABLE2# pin.

Otherwise this looks better. Thanks.


ChenYu

> Cheers,
> Angelo
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    mmc {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        bluetooth@2 {
> > +            compatible =3D "mediatek,mt7921s-bluetooth";
> > +            reg =3D <2>;
> > +            reset-gpios =3D <&pio 8 GPIO_ACTIVE_LOW>;
> > +        };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b64a64ca7916..662957146852 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13657,6 +13657,7 @@ M:    Sean Wang <sean.wang@mediatek.com>
> >   L:  linux-bluetooth@vger.kernel.org
> >   L:  linux-mediatek@lists.infradead.org (moderated for non-subscribers=
)
> >   S:  Maintained
> > +F:   Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-=
bluetooth.yaml
> >   F:  Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
> >   F:  drivers/bluetooth/btmtkuart.c
> >
>

