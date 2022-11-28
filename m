Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F46C43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 14:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zygFH3C0HCyE/GmLBlI4erRi5TTs6QvY4G7d/Jx5gtk=; b=1PfytSxfuj4awIizCwHjRSQOQA
	86xEjW5JveGc3b4OIrYXBc31JBLmUgsNtpbM/00BD7OQxtjZZWYrZy8pD29vxeYeMB5zuXDFSoaCr
	jiIu70xUaIItf+DcTHQCJZYhzX8CPG7Xdyy8GWaj5Xw0CiO/QN3wW8silN4MZiSn5/gfaB3YB6+dQ
	gOwx3P/omyHm/7Mwus5CoxId6h0zxhm5BacQVvmxTiLBdSfKLylpFitBwYkCUX3e5DztoX4+9czuQ
	5Cz9MGoln2cCZylXw+6nAb5Xi8lnjLZeALtP2a/HUA4c+y85tKdDJ7MTsN6pvS0Og8ECDI30FXRSS
	No7bwDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozejp-0023Xs-OL; Mon, 28 Nov 2022 14:04:01 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozeje-0023Tx-OV
	for linux-mediatek@lists.infradead.org; Mon, 28 Nov 2022 14:03:52 +0000
Received: by mail-ed1-x532.google.com with SMTP id x2so15584640edd.2
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 06:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zygFH3C0HCyE/GmLBlI4erRi5TTs6QvY4G7d/Jx5gtk=;
        b=Dn0wZMFZCBiSUOy3MR8qgPiAfaoxuvZkJTAsFiSrMLVeGFxV9Repk5BiwfPTy3N8XT
         W9M+0YX8+efYC4xDqmVtNcgexKzjUIL6BPzynngSPCSEId9T+l1GwNc4F2cbOrOIHKjJ
         wzImkn5Oxu6LkxnQ8nO061HWlzpn5Y3kGlnLE0Bj7byBj+tIEEc3W6bHUYhgOH0vEj14
         1DyL1CF/DKXYYANdii68cyHjJ8LAnivhF2G3d+oujcYFfqamwUwxaunxpR1HyZp/7zyX
         TYQB4U+JnOMsrcTOEDej79HpPMXuU6Yhd9uDObPA7efbLEwFfaRDxnbdjbuTI6FQoKOk
         Qe6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zygFH3C0HCyE/GmLBlI4erRi5TTs6QvY4G7d/Jx5gtk=;
        b=NjHWmVyiy5oh9n7IgaVXRMr8fpBH3No90yxSjmpsnEF4m/mtgosLoonXzF+8HMJRWA
         v44fbJzVqRTK9NwHidiwZRfQnx3TxlPtdguAZmpxqafHE7nAOVzOdnHSkzd9mnwI1nH8
         tQ1rqSZJ/M1i0QsyhUVqVxOFwkT49/ag+obrTpFf+jLNWDOYGqVQpQ6aNHKTKDhb9moG
         mJFvo8IsJUQY/0zVaJr3rroB8NMnYD1CoEFlrTXUroVEve7obS4rfS+SCZxQ8nqdZw/r
         jDjL9/KOQgQB1NlIlpPLTsYzGS+bl170XJXsbD4dJHMmHOYm5tGxXSpX4p+IkgeWsSQX
         0npg==
X-Gm-Message-State: ANoB5pmA8FICD4dGWs58i0UYBVlkerFtvq/rqQI9ezH/yqAmtO/C/+Cs
	gdf1YWjYwhV0jeb0hWRxgDBYTd3dkFyt/OyPZgbAmQ==
X-Google-Smtp-Source: AA0mqf4G4fhVU8w+DttZ3I3UxPAgiaBDQuB51NYNfRQ3JXQ1lw3xInj3Qa9i3uU5+uGApZakiSG/gtoAil6IEl2XlDc=
X-Received: by 2002:aa7:dbc3:0:b0:461:6b61:81ae with SMTP id
 v3-20020aa7dbc3000000b004616b6181aemr47156519edt.62.1669644222784; Mon, 28
 Nov 2022 06:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
 <20221005-mt6357-support-v6-5-4f589756befa@baylibre.com> <a9a47e08-1a08-abe5-1dbe-1537d3414af6@linaro.org>
 <c94d15bf-c5ed-b400-abdf-8cca4102b078@linaro.org>
In-Reply-To: <c94d15bf-c5ed-b400-abdf-8cca4102b078@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 28 Nov 2022 15:03:31 +0100
Message-ID: <CAFGrd9pueans7Z_GHassY7ouGOwDmj4oJHAXS4ZtbYK4KH58Bw@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] dt-bindings: soc: mediatek: convert pwrap documentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>, 
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, Fabien Parent <fabien.parent@linaro.org>, 
	Alessandro Zummo <a.zummo@towertech.it>, Mark Brown <broonie@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Flora Fu <flora.fu@mediatek.com>, 
	Tianping Fang <tianping.fang@mediatek.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mattijs Korpershoek <mkorpershoek@baylibre.com>, Rob Herring <robh@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_060350_806962_EF8F6388 
X-CRM114-Status: GOOD (  17.70  )
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

Le dim. 27 nov. 2022 =C3=A0 14:11, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> a =C3=A9crit :
>
> >> +  pmic:
> >> +    type: object
> >
> > What's here? Other schema? If not then maybe compatible? What about
> > description?
>
> I guess this was comment from Rob, so it's fine.

Yes it is.

> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: mediatek,mt8365-pwrap
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          minItems: 4
> >> +
> >> +        clock-names:
> >> +          minItems: 4
> >
> > else:
> > ???
>
> Actually this looks less complete than your previous patch.
>
> else:
>   clocks:
>     maxItems: 2
> same for clock-names
>

I think I=E2=80=99ve followed the feedback done here [1]
I=E2=80=99ve declared `minItems: 2` globally and override it to 4 if
mediatek,mt8365-pwrap is used. Isn=E2=80=99t it the right way to implement =
it
?

> >> +            compatible =3D "mediatek,mt8135-pwrap";
> >> +            reg =3D <0 0x1000f000 0 0x1000>,
> >
> > This does not match your unit address. No warnings when compile testing=
?
> >

There are no warnings when compile testing. I will fix the unit
address anyway, sorry.

> >> +                  <0 0x11017000 0 0x1000>;
> >> +            reg-names =3D "pwrap", "pwrap-bridge";
> >> +            interrupts =3D <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
> >> +            clocks =3D <&clk26m>, <&clk26m>;
> >> +            clock-names =3D "spi", "wrap";
> >> +            resets =3D <&infracfg MT8135_INFRA_PMIC_WRAP_RST>,
> >> +                     <&pericfg MT8135_PERI_PWRAP_BRIDGE_SW_RST>;
> >> +            reset-names =3D "pwrap", "pwrap-bridge";
> >
> > Missing pmic. Make your example complete.
>
> Probably pmic should be skipped, I understand it is described in MFD
> binding.
>

Put the pmic in the example have 2 constraints:
- The original pmic "mediatek,mt6397" isn=E2=80=99t supported by a yaml
schema, so I=E2=80=99ve a dt_binding_check fail: `failed to match any schem=
a
with compatible: ['mediatek,mt6397']`
- If I put another pmic that supports a yaml schema, I need to put all
required properties for the pmic, which I thought was unnecessary
since it=E2=80=99s already done in its own schema and can change for anothe=
r
pmic, so less consistent.

Then yes, IMHO, PMIC should be skipped in the example.

[1] https://lore.kernel.org/all/fe898d24-54fa-56bb-8067-b422a3a52ff5@collab=
ora.com/

Alex

