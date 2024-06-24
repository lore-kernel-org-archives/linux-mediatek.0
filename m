Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E27C2BD05
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 07:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFj7WMECrZQvXPBur3IZuEGzsvTsWvv9LoTaf7/abfI=; b=UJRKMJ+y3Fjl+2sZaLkO6E1s/Q
	zMp4HEihIffkYe3ZgUaNnuAuCtfV73Du6NY4r85uO48rttFftmd+sFk27yNLuePrWlMLedn5LgW6e
	c/JqssovUEthm0aElbU+EEtnAVfjHwVzpPZOwPl/PMfcvAtL+DOV2nPn3pomv17IRFAZkeJ+fcK0a
	WcKZKtXdg7rwgkM0UOmfmEe4wxn+mGWIFQAMQDk2nMk/SnjNUxQvCghLeHOYjxYWB84rdCE2HDFcb
	vOP5kN0oI0VqKszN0xcmHbGIM3bOCceu00IaIxARvAmZVTbORmQ/I46kd2pCndwF2MzxptXP6lsQi
	UwIL6Edw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLeOD-0000000FvMa-2ppn;
	Mon, 24 Jun 2024 07:45:25 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLeOA-0000000FvLT-2olu
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Jun 2024 07:45:24 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso43035081fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Jun 2024 00:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719215120; x=1719819920; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFj7WMECrZQvXPBur3IZuEGzsvTsWvv9LoTaf7/abfI=;
        b=fk1pND+ix6PDCv8Xkh4L7+WUpqXedByEdWxJtc18yXn4w3MU+OIoXAInawRrLFnXVE
         UkJMMiOhwGfHqWaCksR3/CNrEFGt2VBDR9eWxqfj+1QOyR8GoBrXb7LvN2CSuH75v8Ka
         jZ/WW1PljAxEAt13KZSWr1DyQEhL29k4ngm8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719215120; x=1719819920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFj7WMECrZQvXPBur3IZuEGzsvTsWvv9LoTaf7/abfI=;
        b=tTd3A/bGAujvycnEFPSeioNilDjlmYliNc33jg1IAteLMzKBPp+YzZKdAHrzRZuz+G
         xv2oBj6/g6vef/+7mlMhDEpTKLvKtdU/tC50djdYM+sF6VxM2yCGQT0wPhvLWeZ/+aMC
         fk8iAkrL08tO+WFf8XlibHpxuELHIYnnHaPnjDivBwPsMBEws5LeC9QPc6x30DYrLfn5
         MjE9IK0gWQJamjU+Rt8duqey4ZalwkF8Lj5dnp3jrzhzBbjA8jBUkaoeemj+FdfYLJN5
         OziIJfwRM0oiDr2mxB7BH+r9GVIb/ghmM4G5qS2hGAgQty+sIQNhmkYmeC3lKvmBLLqz
         fViA==
X-Forwarded-Encrypted: i=1; AJvYcCXl+X94pZ0iB4rywf7ehXd1Af3aQNXAcBbUssmMEZUH9sce4HUbjC7rQf/U/UjJbk/8UBSAkDE+iZIAYHvAuNwtp2pXQ74s8NC8d4lwbK86oIaE
X-Gm-Message-State: AOJu0YxgQW04W24YVJrswZrkYTep/I7E9R6222bP9dz4GT4fdoilQ0tT
	p0zaheohQ3z95z1JmrD5OaGoLsNpwDLGskm+syrClXBDwGDCr/4ce0mHcTG4scFn142duJUb5Wn
	IDEod9eLu2USWeTEPKSoPBNv95phAOR9HMvK9nAfFl7vmY7guzQ==
X-Google-Smtp-Source: AGHT+IEbhqe0mQnb2PixzzonBLpTKQYKoC3EopeCBCB9riM06jvOadKH8w8jJMjv/sLheepUTJFeBYE8ulRIzGzE7xw=
X-Received: by 2002:a2e:7812:0:b0:2ec:4d8d:375f with SMTP id
 38308e7fff4ca-2ec593d8c1cmr28622491fa.16.1719215120082; Mon, 24 Jun 2024
 00:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240620094746.2404753-1-wenst@chromium.org> <20240620094746.2404753-3-wenst@chromium.org>
 <20240620-outcome-circulate-40a2971f53b9@spud>
In-Reply-To: <20240620-outcome-circulate-40a2971f53b9@spud>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Jun 2024 15:45:08 +0800
Message-ID: <CAGXv+5E1g3tba1iXtrXrdGwUCiUY39q5pvugsfnXXSDFLMGEZA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm: mediatek: Add MT8186 Voltorb Chromebooks
To: Conor Dooley <conor@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_004523_018155_8EAFB4F0 
X-CRM114-Status: GOOD (  17.09  )
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

On Fri, Jun 21, 2024 at 12:13=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, Jun 20, 2024 at 05:47:37PM +0800, Chen-Yu Tsai wrote:
> > Add an entry for the MT8186 based Voltorb Chromebooks, also known as th=
e
> > Acer Chromebook 311 (C723/C723T). The device is a clamshell style lapto=
p
> > with an optional touchscreen.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docu=
mentation/devicetree/bindings/arm/mediatek.yaml
> > index b1b09db0bd65..e7746afeb0b3 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -301,6 +301,13 @@ properties:
> >            - const: google,tentacruel-sku327683
> >            - const: google,tentacruel
> >            - const: mediatek,mt8186
> > +      - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
> > +        items:
> > +          - enum:
> > +              - google,voltorb-sku589824
> > +              - google,voltorb-sku589825
>
> This looks rather sane for a chromebook!

It really depends on the OEM/ODM for how many combinations they end up
producing...

> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

> > +          - const: google,voltorb
> > +          - const: mediatek,mt8186
> >        - items:
> >            - enum:
> >                - mediatek,mt8186-evb
> > --
> > 2.45.2.741.gdbec12cfda-goog
> >

