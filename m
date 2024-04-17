Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786BFC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 23:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3nALF7xfi7qfd5dxoI7I/++GJkXkbRNfvKUuZr7RRc=; b=r7aorh/GsvkXZusinFRkMKNrT3
	Oladpv1uTMiZgSKQ4Zkbt7kUHEUgtqMKlCuXrQCIHVDWtVEqjkn4zD844jzAhWNZGGJMdXOWmd5tX
	lRJhRhgESm6YfnXoZOYEQ1R90He/AY3zaI+2Konp5uUBeHJZ97uPtLfS3g52qjQjAtcicCtIRDr5+
	s47L7EOI6QeNDG1w1c0atITAUNdfFMCieCeDoHmjwC48BXFZw21gKcY+vJdheE1yqmP4/vqmboyoK
	ztrYx2Luyx64LvvobnVT83qdLXkYVdEHP8SOFzj9fR1TP3qZ5U+eEGOgOvUZAIP9J0KH4QcFEKmBw
	O4ABBTng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxEub-00000000Kvr-3LTk;
	Wed, 17 Apr 2024 23:41:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxEuX-00000000KvJ-3jhJ;
	Wed, 17 Apr 2024 23:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C8326144A;
	Wed, 17 Apr 2024 23:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7C7C2BD11;
	Wed, 17 Apr 2024 23:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713397312;
	bh=Nfp4Bt/UB3lYOjUFF0rfs/aN8U0aosIdPb074abhs2o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ebHDLHww1sRu0/F4b2uaU6+v4ZNFQlqOEV5l5dHioS9xgrLfSAh/eVxz8a6AmGTcS
	 8sQ069W4VNHVEItjcYazb+m6p2mLxHyjRSuU/fsX5GCr5tMcUnVWhpmb7RAddtbmJr
	 q/KkvTy52wBOq7mNs24PM2PCBd1y8DxKIJXmXhOj2/W1f32qgWnxORCTEj3XFChIDU
	 kvnTh3MQpCj6zD4uCZIkhEgXJeyZCzIuLQo6Pl/HGxTr2A0vGMNHJoIkkIIzCwfkoR
	 ChI/5SoIXiflj+wCDHcjfl/nY0HTRfFlNkJyYylq5531zV4sO8MT1eNgs8I0bobfpX
	 C+NkyTW909qEg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56e37034cebso54124a12.0;
        Wed, 17 Apr 2024 16:41:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWe3K18/A1TccUf2H2ccVx/j1TabkuKEbWcG0v27dChsi97Lq8r4IM4ZFNc5EbSSGiF69tpHoKRSTRhbSSbfk5rukmYceLfFhZdGcyv4Rz8zLX2jafXZHsQIPy8WsH9PDOMMHVIyMJz8ihofyCmHnh/AnP/C4Z2II=
X-Gm-Message-State: AOJu0YwH/Q9IgpHYfUtwAC05y+xRKUv04xH3JteRVggzWgVYe4FE28HE
	tduXQcTBGr/FUGvP7tVV7cwcM+GKofx6JgVPivsdHX5HaQndWarv51cbXl3eNvtAOEWf08BPuRm
	WwZceMhQghiQbhXnKsaDTE4FMeVo=
X-Google-Smtp-Source: AGHT+IF4viARxx3GZxQCpGS5aZWzP8rCaswrtzXJWmo/s4eeUGc8cWg9XndNIL6tihZSuLbHwQq+1pEMz/4p7hGte/k=
X-Received: by 2002:a17:906:cd0f:b0:a55:144a:adc2 with SMTP id
 oz15-20020a170906cd0f00b00a55144aadc2mr473106ejb.6.1713397311258; Wed, 17 Apr
 2024 16:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240412073046.1192744-1-wenst@chromium.org> <20240412073046.1192744-2-wenst@chromium.org>
 <CAGp9Lzp=MKNYc70ZeGCAEgWfFVPOAOZQQ86BXukk+EQQM_C+OA@mail.gmail.com> <CAGXv+5FeRwYm7x+fYS9KPXW-0tQ-zSuk5nU6AZ-=yU07wXnJ9w@mail.gmail.com>
In-Reply-To: <CAGXv+5FeRwYm7x+fYS9KPXW-0tQ-zSuk5nU6AZ-=yU07wXnJ9w@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 17 Apr 2024 16:41:39 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzrm6GDdm61FZR60aqmnSVg7k1+NJ=UfNwr6x8Y5RUwOKA@mail.gmail.com>
Message-ID: <CAGp9Lzrm6GDdm61FZR60aqmnSVg7k1+NJ=UfNwr6x8Y5RUwOKA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_164154_051380_16F6623D 
X-CRM114-Status: GOOD (  42.16  )
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

Hi Chen-Yu,

okay, we will add it once we have implemented it in the driver. thanks
for adding the dt-binding.

     Sean

On Wed, Apr 17, 2024 at 4:32=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Wed, Apr 17, 2024 at 4:04=E2=80=AFPM Sean Wang <sean.wang@kernel.org> =
wrote:
> >
> > Hi Chen-Yu,
> >
> > On Fri, Apr 12, 2024 at 12:31=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.o=
rg> wrote:
> > >
> > > The MediaTek MT7921S is a WiFi/Bluetooth combo chip that works over
> > > SDIO. WiFi and Bluetooth are separate SDIO functions within the chip.
> > > While the Bluetooth SDIO function is fully discoverable, the chip has
> > > a pin that can reset just the Bluetooth core, as opposed to the full
> > > chip. This should be described in the device tree.
> > >
> > > Add a device tree binding for the Bluetooth SDIO function of the MT79=
21S
> > > specifically to document the reset line. This binding is based on the=
 MMC
> > > controller binding, which specifies one device node per SDIO function=
.
> > >
> > > Cc: Sean Wang <sean.wang@mediatek.com>
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > > Changes since v2:
> > > - Expand description and commit message to clearly state that WiFi an=
d
> > >   Bluetooth are separate SDIO functions, and that each function shoul=
d
> > >   be a separate device node, as specified by the MMC binding.
> > > - Change 'additionalProperties' to 'unevaluatedProperties'
> > > - Add missing separating new line
> > > - s/ot/to/
> > >
> > > Angelo's reviewed-by was not picked up due to the above changes.
> > >
> > > Changes since v1:
> > > - Reworded descriptions
> > > - Moved binding maintainer section before description
> > > - Added missing reference to bluetooth-controller.yaml
> > > - Added missing GPIO header to example
> > > ---
> > >  .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 55 +++++++++++++++++=
++
> > >  MAINTAINERS                                   |  1 +
> > >  2 files changed, 56 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/net/bluetooth/m=
ediatek,mt7921s-bluetooth.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek=
,mt7921s-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/m=
ediatek,mt7921s-bluetooth.yaml
> > > new file mode 100644
> > > index 000000000000..67ff7caad599
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921=
s-bluetooth.yaml
> > > @@ -0,0 +1,55 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7921s-bl=
uetooth.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: MediaTek MT7921S Bluetooth
> > > +
> > > +maintainers:
> > > +  - Sean Wang <sean.wang@mediatek.com>
> > > +
> > > +description:
> > > +  MT7921S is an SDIO-attached dual-radio WiFi+Bluetooth Combo chip; =
each
> > > +  function is its own SDIO function on a shared SDIO interface. The =
chip
> > > +  has two dedicated reset lines, one for each function core.
> > > +  This binding only covers the Bluetooth SDIO function, with one dev=
ice
> > > +  node describing only this SDIO function.
> > > +
> > > +allOf:
> > > +  - $ref: bluetooth-controller.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mediatek,mt7921s-bluetooth
> > > +
> > > +  reg:
> > > +    const: 2
> > > +
> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +    description:
> > > +      An active-low reset line for the Bluetooth core; on typical M.=
2
> > > +      key E modules this is the W_DISABLE2# pin.
> > > +
> >
> > Thanks for adding the new setup for the MT7921S devices. They look good=
 to me.
> > Sometimes, the MT7921S might be set up to wake up the host when it's
> > asleep using a sideband signal.
> > This might need an extra pin called "wakeup" to make it happen. Can
> > you help add this pin to the settings in the same update, or should I
> > do it later?
>
> I suggest you send a patch on top of this one? I'm not sure if you
> would model it as a GPIO or interrupt. And there doesn't seem to be
> any code in the driver expecting it.
>
>
> ChenYu
>
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    mmc {
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        bluetooth@2 {
> > > +            compatible =3D "mediatek,mt7921s-bluetooth";
> > > +            reg =3D <2>;
> > > +            reset-gpios =3D <&pio 8 GPIO_ACTIVE_LOW>;
> > > +        };
> > > +    };
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 88981d9f3958..218bc2a21207 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -13818,6 +13818,7 @@ M:      Sean Wang <sean.wang@mediatek.com>
> > >  L:     linux-bluetooth@vger.kernel.org
> > >  L:     linux-mediatek@lists.infradead.org (moderated for non-subscri=
bers)
> > >  S:     Maintained
> > > +F:     Documentation/devicetree/bindings/net/bluetooth/mediatek,mt79=
21s-bluetooth.yaml
> > >  F:     Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
> > >  F:     drivers/bluetooth/btmtkuart.c
> > >
> > > --
> > > 2.44.0.683.g7961c838ac-goog
> > >
> > >

