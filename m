Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133F2C25B6B
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 19:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMeG9MZNqxS33OpWNusWQZ07NUKZ/4HRV8It71VS7r0=; b=K4gKGPelxKhc21
	th4cTu7gCRv5iWbbmzvLasGwjwnQ9P9/X6RWq92VFgrSLZtr/ifeEpmAZEGTl0tnMgIUAO+o11P0p
	QGCqPSzAfQ7+gVYlw6ioHWH1Jg1DkhQ9tup+77tdUk+NUoKWEDi3uSthkDzRtuZmlUzet1shdp6q1
	buaoAMcYVTtApXzVkXTnww7499MUgWYxSZ+Z8z3qlhAA65nu0PatTA3j3LmOUExo2O4TwJFAkhv20
	4TDgKujEFhgMWo+eUqevrAcSTHQV3aS5JS/E+p7QZZ+OcFxB93GQRNcVEo7ePZUvdy7aIWcCVdnjo
	LNvAIRIkHd42RngXCG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvjdG-00Cy15-0l;
	Wed, 25 Oct 2023 19:33:34 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvjdD-00Cxzr-0F
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Oct 2023 19:33:32 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6ce2b6cb933so75313a34.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Oct 2023 12:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698262408; x=1698867208; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMeG9MZNqxS33OpWNusWQZ07NUKZ/4HRV8It71VS7r0=;
        b=CXTcKw2iepLUqszuD/asDabEKl8mWqa+XgiiRFPQabBEdw+xr7pNTU5AIxSETtAUwy
         cTLI89ShP//KnAHL4SdTi3YcwGbYqTzsSh5vecKBLEwEjehSw/2g2iOIw2pa2iLPNdJP
         VcETLLMwyEn1U4J8yqUtdhxGeAu9hSZfMl41A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262408; x=1698867208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMeG9MZNqxS33OpWNusWQZ07NUKZ/4HRV8It71VS7r0=;
        b=oxlxY+3Bc8OdwDMgU+Cg8BXDkpOOI97AytsaBBzWhSSgyWx74cAPxMM/Eaf9yNdOly
         rW/Ola8UV09ba4Uj/MdEhjB811QMnmkq7L7c2iWIwDKtzze2GsXAetpTRqGnEC974Wgc
         zS0M7MxRNi/lAVsbmiikHobVPCpxUSS4BTVyb6gXF61i+cNOfU1OSiq5nITCeaCmk5Rd
         FH5LyxfQNPG0/uxS4wsqxYoL9yqjYjfy2uOys1iM02mnhuvJ8XfTnjXCz8sXGh4OW6T0
         f5E5SXCTjBo5NHx2N06U3uJLcOpDZzOdVs2iFfCpxrN2VBo0FHvSVgeeInktI6LwWB3q
         ewWQ==
X-Gm-Message-State: AOJu0YwlgXba8YasnNfx2/Z2n3NjKe0kSi/pbW1A/acBy+rYh6lgPDuG
	ys0GXPtC0my/gCsWx1T0NT+6z5P2El1wCIGUVfV0jw==
X-Google-Smtp-Source: AGHT+IHiYSybIcqOiSHYlaPTfrpU/MNeQ/W6p+mNix58fbQG6nB2jXmpWTM6OIrTAkYTbY/RB4wv8ZzvD1YbuWiQtog=
X-Received: by 2002:a05:6830:314f:b0:6b9:b1b1:135 with SMTP id
 c15-20020a056830314f00b006b9b1b10135mr20680016ots.13.1698262408688; Wed, 25
 Oct 2023 12:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231024000724.57714-1-hsinyi@chromium.org> <20231024000724.57714-4-hsinyi@chromium.org>
 <20231024-bobbed-although-06f341259ebb@spud> <CAJMQK-hvhjNGFUfgqb7pm=pAYjJ0wZAhkPGXxDCUJ5cnUDh2gw@mail.gmail.com>
 <20231025-charity-replica-9c9b03380d7f@spud>
In-Reply-To: <20231025-charity-replica-9c9b03380d7f@spud>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 25 Oct 2023 12:33:03 -0700
Message-ID: <CAJMQK-gkCK=AtSYa7vH5mfD01GedXqd2Hrt1aYPymzOiEr2LRQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-makomo
To: Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_123331_113433_82A2564A 
X-CRM114-Status: GOOD (  23.27  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 25, 2023 at 7:49=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Oct 24, 2023 at 11:22:00AM -0700, Hsin-Yi Wang wrote:
> > On Tue, Oct 24, 2023 at 8:17=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Mon, Oct 23, 2023 at 05:02:26PM -0700, Hsin-Yi Wang wrote:
> > > > Add makomo sku0 and sku1 which uses different audio codec.
> > > >
> > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/mediatek.yaml | 12 +++++++++=
+++
> > > >  1 file changed, 12 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/=
Documentation/devicetree/bindings/arm/mediatek.yaml
> > > > index fe8c488a3207..b131e0bdbf01 100644
> > > > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > > > @@ -250,6 +250,18 @@ properties:
> > > >                - google,kodama-sku32
> > > >            - const: google,kodama
> > > >            - const: mediatek,mt8183
> > > > +      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen=
 MTK 2)
> > > > +        items:
> > > > +          - const: google,makomo-rev4-sku0
> > > > +          - const: google,makomo-rev5-sku0
> > >
> > > With these bindings, how does one describe a makomo-rev5-sku0?
> > > What you have here is only suitable for describing the makomo-rev4-sk=
u0.
> > >
> > makomo-rev5-sku0 and makomo-rev4-sku0 uses the same dts:
> >
> > compatible =3D "google,makomo-rev4-sku0", "google,makomo-rev5-sku0",
> >                       "google,makomo", "mediatek,mt8183";
> >
> > In this case, can bindings be listed like that?
>
> On a rev5-sku0, the first compatible should be the most specific one,
> which would mean:
>
> compatible =3D "google,makomo-rev5-sku0", "google,makomo", "mediatek,mt81=
83";
>
> I said the same on other google laptop bindings before, but I'm not
> really happy with these compatible configurations, that seem conjured up
> to suit your firmware. It'd make far more sense to me to have a setup
> that permitted:
> compatible =3D "google,makomo-sku0-rev5", "google,makomo-sku0", "google,m=
akomo", "mediatek,mt8183";
> and
> compatible =3D "google,makomo-sku0-rev4", "google,makomo-sku0", "google,m=
akomo", "mediatek,mt8183";
>

The actual compatible is like:
google,makomo-rev4-sku1 google,makomo-sku1 google,makomo-rev4 google,makomo

So I think I can remove the rev here, and just let them match with
google,makomo-skuX, since rev4/rev5 share the same dts.

> Cheers,
> Conor.
>
> > > > +          - const: google,makomo
> > > > +          - const: mediatek,mt8183
> > > > +      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen=
 MTK 2)
> > > > +        items:
> > > > +          - const: google,makomo-rev4-sku1
> > > > +          - const: google,makomo-rev5-sku1
> > > > +          - const: google,makomo
> > > > +          - const: mediatek,mt8183
> > > >        - description: Google Willow (Acer Chromebook 311 C722/C722T=
)
> > > >          items:
> > > >            - enum:
> > > > --
> > > > 2.42.0.758.gaed0368e0e-goog
> > > >

