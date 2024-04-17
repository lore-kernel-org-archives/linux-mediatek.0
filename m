Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F634C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 23:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXeaIqHgrQqvoS7w1DDDiuOy+AYJG35Jgluc3WBXL9E=; b=Ay1Q3KoQtNxts0AmCWxME5UAXQ
	fT9FJHG9FR4scbSUUIs2YkCic7MeCGIiXiOMR9n8egBCNJ1aGKAVee7VmzW7F973Dfhk3Auij0UXG
	8JR1TOzq9YXdTAX1ongizKeQkHYXzdwhuNO9prgv+zIHDNjKQe37POzeuopja0GGhrdYyVL7beAEN
	8SsJUMvtLRBMPWBhreXzDJSwr9k1cPvNY6XWMTwG7FKTh5kt+SdUI+04NUNXQvEqATx5oI2ORXmbM
	hegoDGrPqABRjWZ1gDd9pTILrVcv9eEI6BjVYi2J408H/2JtPu1CaN5sm6fYpbo09aUVzphspZByd
	Yzg/GHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxElF-00000000JFS-042C;
	Wed, 17 Apr 2024 23:32:17 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxElC-00000000JEQ-1pCk
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 23:32:15 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-518f8a69f82so267536e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 16:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713396731; x=1714001531; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXeaIqHgrQqvoS7w1DDDiuOy+AYJG35Jgluc3WBXL9E=;
        b=jif1IXAcSlWNCz7yspz4uHohHOebJmTKPL62hvycZPFb6n3ua/iK1w9RWRsIK8Xyi6
         YwEt9To1lugmdZ1QQ/K3GBV//5G8xG+q971hAHk2L0qEfr+AwjFVxNVzeKq861ZwBKo5
         CADPDMhXbiJ0EhYp1LAIwLmEAS3+/SjD81qRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713396731; x=1714001531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXeaIqHgrQqvoS7w1DDDiuOy+AYJG35Jgluc3WBXL9E=;
        b=LwEkyJSuMABGomLbH8Mg1F+NNYs/fMe2rt5NTfjtMxHqRx1uasanzbZsa3RVmxEpwk
         KAYBna1T0njzz0zytCrJ3XtDEwBaqvy+Kxp/iN/yXm39yxpqgSt4ipRs5nKH96dPCV/H
         dCE2oT7QoPAwp6NqFG3eBTJPsc6HBbuX0v+6CW8X8eVsIofm5lLMa/RuCgfk98Ez9Z1s
         yLVTW4Ih2tDf9X/Qhi0P04LYDio9GkAdB97Myx9u/8LgH+QuCUJFabI1QXXnVp2P7QsY
         K02KnCiQJ1EhS9wi6xAIDDjf/3sXeGTMPP4uIPTtJMcurcsHJGa9SzejfZQIPbz7mwb4
         kRYA==
X-Forwarded-Encrypted: i=1; AJvYcCX/C+wNPXEeJbrOiPij6q9a/awhGfj78BJSzLeLhTsiSytpfHh36OrdZyxt0QQp6+BYU29v7wUEUQHqJVyUHHn7axTyVIPDtwz524RJ6O1GRcnv
X-Gm-Message-State: AOJu0Yyz4F6kDEtRXVxAjTz8WGYkEW07KIRO3W7+qt2/tl/m3heCzQ4A
	U7bxpjBXJok7kvz7f8R7j+GaP89zQJjtKCVJwmhRsCoGkrvZZgVvoBYYnZTVZxJzEAs3FDaPwuN
	virj45SBI5xGal3sQC7EuqKqh5ckl+3xkbizE
X-Google-Smtp-Source: AGHT+IEdA30trqC2FAaLVap4ZQxvHXDW+eQ/qMYNrW1mInC1+qlsTt9tjJAxb0ZRkJ6pUgTOzXndvJ5C7T1s5nX8MgU=
X-Received: by 2002:ac2:5b4f:0:b0:519:17b6:f20 with SMTP id
 i15-20020ac25b4f000000b0051917b60f20mr445676lfp.6.1713396730437; Wed, 17 Apr
 2024 16:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240412073046.1192744-1-wenst@chromium.org> <20240412073046.1192744-2-wenst@chromium.org>
 <CAGp9Lzp=MKNYc70ZeGCAEgWfFVPOAOZQQ86BXukk+EQQM_C+OA@mail.gmail.com>
In-Reply-To: <CAGp9Lzp=MKNYc70ZeGCAEgWfFVPOAOZQQ86BXukk+EQQM_C+OA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 17 Apr 2024 16:31:59 -0700
Message-ID: <CAGXv+5FeRwYm7x+fYS9KPXW-0tQ-zSuk5nU6AZ-=yU07wXnJ9w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
To: Sean Wang <sean.wang@kernel.org>
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
X-CRM114-CacheID: sfid-20240417_163214_562474_C4BCDC1E 
X-CRM114-Status: GOOD (  39.29  )
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

On Wed, Apr 17, 2024 at 4:04=E2=80=AFPM Sean Wang <sean.wang@kernel.org> wr=
ote:
>
> Hi Chen-Yu,
>
> On Fri, Apr 12, 2024 at 12:31=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > The MediaTek MT7921S is a WiFi/Bluetooth combo chip that works over
> > SDIO. WiFi and Bluetooth are separate SDIO functions within the chip.
> > While the Bluetooth SDIO function is fully discoverable, the chip has
> > a pin that can reset just the Bluetooth core, as opposed to the full
> > chip. This should be described in the device tree.
> >
> > Add a device tree binding for the Bluetooth SDIO function of the MT7921=
S
> > specifically to document the reset line. This binding is based on the M=
MC
> > controller binding, which specifies one device node per SDIO function.
> >
> > Cc: Sean Wang <sean.wang@mediatek.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v2:
> > - Expand description and commit message to clearly state that WiFi and
> >   Bluetooth are separate SDIO functions, and that each function should
> >   be a separate device node, as specified by the MMC binding.
> > - Change 'additionalProperties' to 'unevaluatedProperties'
> > - Add missing separating new line
> > - s/ot/to/
> >
> > Angelo's reviewed-by was not picked up due to the above changes.
> >
> > Changes since v1:
> > - Reworded descriptions
> > - Moved binding maintainer section before description
> > - Added missing reference to bluetooth-controller.yaml
> > - Added missing GPIO header to example
> > ---
> >  .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 55 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/bluetooth/med=
iatek,mt7921s-bluetooth.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,m=
t7921s-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/med=
iatek,mt7921s-bluetooth.yaml
> > new file mode 100644
> > index 000000000000..67ff7caad599
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-=
bluetooth.yaml
> > @@ -0,0 +1,55 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7921s-blue=
tooth.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT7921S Bluetooth
> > +
> > +maintainers:
> > +  - Sean Wang <sean.wang@mediatek.com>
> > +
> > +description:
> > +  MT7921S is an SDIO-attached dual-radio WiFi+Bluetooth Combo chip; ea=
ch
> > +  function is its own SDIO function on a shared SDIO interface. The ch=
ip
> > +  has two dedicated reset lines, one for each function core.
> > +  This binding only covers the Bluetooth SDIO function, with one devic=
e
> > +  node describing only this SDIO function.
> > +
> > +allOf:
> > +  - $ref: bluetooth-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt7921s-bluetooth
> > +
> > +  reg:
> > +    const: 2
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      An active-low reset line for the Bluetooth core; on typical M.2
> > +      key E modules this is the W_DISABLE2# pin.
> > +
>
> Thanks for adding the new setup for the MT7921S devices. They look good t=
o me.
> Sometimes, the MT7921S might be set up to wake up the host when it's
> asleep using a sideband signal.
> This might need an extra pin called "wakeup" to make it happen. Can
> you help add this pin to the settings in the same update, or should I
> do it later?

I suggest you send a patch on top of this one? I'm not sure if you
would model it as a GPIO or interrupt. And there doesn't seem to be
any code in the driver expecting it.


ChenYu

> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
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
> > index 88981d9f3958..218bc2a21207 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13818,6 +13818,7 @@ M:      Sean Wang <sean.wang@mediatek.com>
> >  L:     linux-bluetooth@vger.kernel.org
> >  L:     linux-mediatek@lists.infradead.org (moderated for non-subscribe=
rs)
> >  S:     Maintained
> > +F:     Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921=
s-bluetooth.yaml
> >  F:     Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
> >  F:     drivers/bluetooth/btmtkuart.c
> >
> > --
> > 2.44.0.683.g7961c838ac-goog
> >
> >

