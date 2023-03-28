Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E13C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 13:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5yUH2O4hFCVjfaJWgubVrQf+rHb0zN2XaPsX21lAqI=; b=mTA9GCGs0oAI4hS+fhrLC9rm1T
	mMkicyAzJXT5RiewI7xqTjxMkkTFDByT4Y1pwIwhYgb8SPtYW/XrFfC9wkBgk3NvsiBxZpuAFiZER
	hph6upl9y/X45xeBEO83zUrq79K+OqnvqT2+isbshYpyTaP6tuTS8/ms+E5K4TsRMkaSytveVpaM0
	1Im2fZ+Qo34V/tEwo24m+alBMBiLEhDWYzTxM9aP9l+TqygLqTkO/OSeiKxPGl0U/dQ0DVHrajONx
	JMj2YQr7rIpEHRszW0JoaradQdEc6UsQYOyhCngJGq5682ZnEraXunJZKLlTq/FLDY4HRRqHK9DWC
	Jr4vxPcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph96A-00EVgb-0u;
	Tue, 28 Mar 2023 13:10:50 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph967-00EVf9-2n
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Mar 2023 13:10:49 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5456249756bso228565687b3.5
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Mar 2023 06:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680009044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5yUH2O4hFCVjfaJWgubVrQf+rHb0zN2XaPsX21lAqI=;
        b=vpa/+dtXjYAGKZeU8wx922IUmAzz10Ey2PwnEv3C6YNXcpfFqDvPP9DAyCYP/Rp6US
         xopnZ+5Vz+RzGo033bP6o44pPbxUQ9qrXT8ouYCOeR2mmX29fKdZPNQI6JXw5VVtCEbE
         K2d+jCn3Qr38rlPs7tLJSjq5sKNy+HrzQ8WvMXu1/KBgRyf4B2oc3g/ocJ530XxOA0A0
         mzHUzru5ARo8f8qnw0hvTNU90vLr2XYzmJdAPqUp4fQ94R85EvyzoH41ISOnWdg8vxGS
         f18UVQbyZ9MWZ3D3f3WgH4G8oNm9zUEnX5ryw0NdgpkDWURzHPsXfbCjkgo2eYmZhQmT
         +xCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680009044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5yUH2O4hFCVjfaJWgubVrQf+rHb0zN2XaPsX21lAqI=;
        b=2a15CLIfZGVkDLnXEEmH4HfM4jA8fWIFTG7KEhoiR2mkV1QZBr19kXyZjnyvMNenWg
         ZCCvF0CYBg5BZqyghgiT6/S3xO6OQtU9MCrBpeEzP+6gkLdWAbTK2mNVZuZUcKoPblnR
         U8RgsYZWYOTyj3ETStYi6gW748HTe1TDCIGt+cU+atNsG2fGl0/N/wMzA7pdWMKpVeO3
         rGRPEsNnniyc68Gic43pSfW8vf8vT1EgY9GaU2YnDYOSqaaYf7Rf+D5MBj9P2VyONto0
         h3BD3B/koOQyU0pLz+FAuSmJSFAsgq+U9f5tVJmFXVdy4hgFK78KWp/ynjb57zKsdaW2
         VWKg==
X-Gm-Message-State: AAQBX9dHSSBy9FG3a8wZYd/MeTIXa3NSycK4ptEjLI5j5kgXlAhyryVm
	6lwOUie52LD22ULz1C9MUbd5OJn7kg4tvBb1cEgQGQ==
X-Google-Smtp-Source: AKy350bdKqptsJnHXGuH0PKZyaYDntgiQ0cShdje6zVHnvCC14jNHBYIsZq725pn7qWvX7BedhrW3FtTFjBXS25A3qI=
X-Received: by 2002:a81:b721:0:b0:545:3f42:2d97 with SMTP id
 v33-20020a81b721000000b005453f422d97mr6264242ywh.3.1680009044455; Tue, 28 Mar
 2023 06:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com>
 <20221122-mt8365-i2c-support-v6-2-e1009c8afd53@baylibre.com> <945d8a82-80b3-8ae2-3b2a-7011621ad8d9@collabora.com>
In-Reply-To: <945d8a82-80b3-8ae2-3b2a-7011621ad8d9@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 28 Mar 2023 15:10:33 +0200
Message-ID: <CAFGrd9oV9isSmpsT7VZ6VY4VpW4RtNnM4J+t_TbRMwt7t13gRw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk board
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_061047_908020_60E29139 
X-CRM114-Status: GOOD (  12.20  )
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

Le mar. 28 mars 2023 =C3=A0 12:05, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 28/03/23 11:04, Alexandre Mergnat ha scritto:
> > Enable the I2C0 bus provides communication with:
> > - The integrated RT9466 Switching Battery Charger.
> > - The integrated MT6691 LP4X buck for VDDQ.
> > - The integrated MT6691 LP4X buck for VDD2.
> > - The pin header, to plug external I2C devices.
> >
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/b=
oot/dts/mediatek/mt8365-evk.dts
> > index 4683704ea235..adc79ba14b33 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> > @@ -87,6 +87,13 @@ optee_reserved: optee@43200000 {
> >       };
> >   };
> >
> > +&i2c0 {
> > +     clock-frequency =3D <100000>;
> > +     pinctrl-0 =3D <&i2c0_pins>;
> > +     pinctrl-names =3D "default";
> > +     status =3D "okay";
> > +};
> > +
> >   &pio {
> >       gpio_keys: gpio-keys-pins {
> >               pins {
> > @@ -96,6 +103,14 @@ pins {
> >               };
> >       };
> >
> > +     i2c0_pins: i2c0-pins {
> > +             pins {
> > +                     bias-pull-up;
>
> I prefer seeing pinmux first, any other properties last....

Here the pinctrl binding cleanup [1]

Regards,
Alex

[1]: https://lore.kernel.org/all/20230327-cleanup-pinctrl-binding-v1-0-b695=
e32e4f2e@baylibre.com/

