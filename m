Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26352C47DDF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 03:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yyUGF5rIxxEr8wGxy6mzO1hK1BzZ2gmE5L9TwgfgxA=; b=nFnBRGutY3HgosqmjEyF9CLW0l
	Y/PPXPNYikFD1ZtSwJWb7BvTi1Vu2EfWClFsqdv2/Jl5wVbKaXzES/KKNAY6+V6RA22ibojqftocU
	VnPoXYniEJ0CW1dQfEw8XoILtPYZKz/jiIeXWzE6dWNscCf008wJnO45Dkjbn0H0I3QU81ekxweZm
	2HtI7Sm/fHrLW6zGQDwBNU4GRgNr04Na6j1IiwzE4aQ7hfoABTf7RK5nyShHMXZ2MBmAB6k/s2f45
	ZZQyvUXTOTPS2n2KRx5IpP00KvNZYoBR/V9lJUk8Kdg5j+x3NhIvXcmGKXWRK9aMmpvM3e2guHkH3
	EQChWkFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUIUE-0000000B8tD-2s5D;
	Mon, 29 Jan 2024 03:39:06 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUIUB-0000000B8sN-0XUh
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jan 2024 03:39:04 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-510322d5363so1655752e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 28 Jan 2024 19:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706499540; x=1707104340; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yyUGF5rIxxEr8wGxy6mzO1hK1BzZ2gmE5L9TwgfgxA=;
        b=hq3OffyAf/JynMxV49AL2/dH0PkR+ytxcGIiwfB6KrC/OJ0vPV2YmcaxPyiTVvM9JZ
         p5kcdMh1CxPEQk8Tc4hrZrEhEMnZHB9d6VSnsOtWXcYtELahd1muaz0RwjfAGT69A/i7
         CIRjbHKt3Jt0ORhr9wPsOF/FrhOXePryyepeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706499540; x=1707104340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yyUGF5rIxxEr8wGxy6mzO1hK1BzZ2gmE5L9TwgfgxA=;
        b=abCJINIAfeneW/cWz8vNN7PMW9MPE1+bj2SEUYczKRAH7MotTYt5/D6DPTB+dQzY6Y
         hUQ/A+Kz7H1tdmu3CZwdz7AskmESFmqYtGo8oyrhu0YeERZL6jOY8UsypfNykT8isw/C
         jS1lFudVayBjf7TU0y0lTUJlPFsW+lIcxGiD2IONIu80kIKG/U/uPuR+PIoXaNFyirJx
         xpLg/X2yZIE5aKlgh/L7FpvoiA1ioZ+8GGTK62UWa7mvGEjOr7QWz04tZ/bOOh3wMCRa
         vk8qB6mc8JEB1aU6e5N+kgQGjxmmnAX5HadX5rZVtg2IqnD3gfPUBgWR+1ZEbWd93U7E
         NrhA==
X-Gm-Message-State: AOJu0YziNnLifAMi6Q+NtUp6yrzaadaRGNRDQ/TZy5pWjac2qUD74/bU
	Iw2GhNzY34AXlwT3vlnLjSzaznpPXCEwHF2B/b8+maVhVYnmJbfo6kr923dPACTaEOliinD99lb
	VQ/w9lCjZkMt0PoS8F9E4aZps24fey/XJZFlm
X-Google-Smtp-Source: AGHT+IEXgMUgHt38rJa9lkZWY3kg2sc8NUxr6P4rZVQj9hDCI16H5nC2o9tzHW8pEEyFHfhwuR4GhhyhIWVA70eTXH0=
X-Received: by 2002:a05:6512:280e:b0:50e:b25e:94d8 with SMTP id
 cf14-20020a056512280e00b0050eb25e94d8mr3488177lfb.41.1706499540469; Sun, 28
 Jan 2024 19:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20240126063500.2684087-1-wenst@chromium.org> <20240126063500.2684087-2-wenst@chromium.org>
 <74b9f249-fcb4-4338-bf7b-8477de6c935c@linaro.org>
In-Reply-To: <74b9f249-fcb4-4338-bf7b-8477de6c935c@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 29 Jan 2024 11:38:49 +0800
Message-ID: <CAGXv+5Hu+KsTBd1JtnKcaE3qUzPhHbunoVaH2++yfNopHtFf4g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
X-CRM114-CacheID: sfid-20240128_193903_251236_E76DCB9D 
X-CRM114-Status: GOOD (  28.46  )
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

On Fri, Jan 26, 2024 at 6:40=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/01/2024 07:34, Chen-Yu Tsai wrote:
> > The MediaTek MT7921S is a WiFi/Bluetooth combo chip that works over
> > SDIO. While the Bluetooth function is fully discoverable, the chip
> > has a pin that can reset just the Bluetooth side, as opposed to the
> > full chip. This needs to be described in the device tree.
> >
> > Add a device tree binding for MT7921S Bluetooth over SDIO specifically
> > ot document the reset line.
>
> s/ot/to/
>
> >
> > Cc: Sean Wang <sean.wang@mediatek.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Reworded descriptions
> > - Moved binding maintainer section before description
> > - Added missing reference to bluetooth-controller.yaml
> > - Added missing GPIO header to example
> >
> >  .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 53 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/bluetooth/med=
iatek,mt7921s-bluetooth.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,m=
t7921s-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/med=
iatek,mt7921s-bluetooth.yaml
> > new file mode 100644
> > index 000000000000..ff11c95c816c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-=
bluetooth.yaml
> > @@ -0,0 +1,53 @@
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
> > +  This binding only covers the Bluetooth part of the chip.
> > +
> > +allOf:
> > +  - $ref: bluetooth-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt7921s-bluetooth
>
> Can it be also WiFi on separate bus? How many device nodes do you need
> for this device?

For the "S" variant, WiFi is also on SDIO. For the other two variants,
"U" and "E", WiFi goes over USB and PCIe respectively. On both those
variants, Bluetooth can either go over USB or UART. That is what I
gathered from the pinouts. There are a dozen GPIO pins which don't
have detailed descriptions though. If you want a comprehensive
binding of the whole chip and all its variants, I suggest we ask
MediaTek to provide it instead. My goal with the binding is to document
existing usage and allow me to upstream new device trees.

For now we only need the Bluetooth node. The WiFi part is perfectly
detectable, and the driver doesn't seem to need the WiFi reset pin.
The Bluetooth driver only uses its reset pin to reset a hung controller.

> Missing blank line.

Will fix.

> > +  reg:
> > +    const: 2
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      An active-low reset line for the Bluetooth core; on typical M.2
> > +      key E modules this is the W_DISABLE2# pin.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
>
> Instead 'unevaluatedProperties: false'

Will fix.


Thanks
ChenYu

