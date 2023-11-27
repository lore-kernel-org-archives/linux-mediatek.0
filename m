Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA47C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 02:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSfUfP4XMvfz52jafZIehWTyVLB2dDTGY7kE9uvmNFU=; b=g3JKxA9kGvFvTrGvZsqG21ZmNf
	L7265v0VhTBAIOiW5bMq5teH6okgeUNe6R2bMCIa7d7p1NxAymQ4lz6LbDACBtE+sl6Zn1e6Wmv4i
	s5BWOXKkAZR6Ceh5tl4t5s6tZdbPT5cKRTFYBDr9g8VoImBdVqVr5KJLGdB6hMiHJVP0nVOeSQRXM
	DMaLf0yZFnDtEOJhpujjq8sS8nEJjdeCXk05AsrFk5+DMpp2t1kzGh0P/5qZp3RB7SDJBzP1gugfb
	9yLcbN9VW4ZAhdRDWiN6ioKrZOynAxruiVUcC29hfxuvXL1PhjTkTdeC4I+1iQ/mVPIkFZ3GEXqxE
	dApMWllw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7RHZ-000iQD-2h;
	Mon, 27 Nov 2023 02:23:34 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7RHK-000iE6-0M
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Nov 2023 02:23:19 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5079f6efd64so5036278e87.2
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Nov 2023 18:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701051793; x=1701656593; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSfUfP4XMvfz52jafZIehWTyVLB2dDTGY7kE9uvmNFU=;
        b=FeOGS+gmmQ5UzlN2TnMJrRknUjIDVI0EqCVxQKaIl7PiowAlrYbCkzkx1T05tsbpWq
         GklkHRNBZlG2EB0JtA9FSxNMophlgNkp/ch/3/3aSEDbSkiwfUNE5QsT0By0jP6gyno8
         zae31hQ5/kowKtmcQPzgszRTmBZdalm4v2dOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701051793; x=1701656593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSfUfP4XMvfz52jafZIehWTyVLB2dDTGY7kE9uvmNFU=;
        b=VWewvwJ15jyoDY8c3kkKftHhhqWAErDDJ9yZD1X7zZxzHHP9JVBRhpA6T6qkLwgp/9
         UYhA3uZEScVWwuqyI4WJDtBIN9MIh44O531HIOPoULTJSbN4VA7HNgEpzWBMKXWej15k
         ZWmatWzpOgqPvbYWVd0BqZcyNMm2StnpLmq6OnX9rrCB1H6VqRAOxlvcUlFmyaV6pvE/
         6KdWcZluqoWVInH+XnpthQqQzneHj9/CW6mcdaAjuBkiVqI3buwySfyxcAmaOxfjV0Ik
         YxlwxXjZ4K8aKnErkgGDmEFEkRZqsF/zqgRFTL/wVT9GrDtlEm88lczYLNwk8cbDLUrs
         9omw==
X-Gm-Message-State: AOJu0YyoiOhVZqxuxw4coc9bvvjUJaaER+1XRAqamIcT3fEJu12lJVWv
	3rVWNSQf1iB78UDf4nyWWh2S95YlgLmPmmxBACQJgf2x5uIJUJ6M
X-Google-Smtp-Source: AGHT+IHBN8N/+MmMOgool09rAcTcq2woF4lPrPkErpOndnaGQ8U2/8WOta2kePf5kfxSK+34TvzCKH3CIswlBBRauYc=
X-Received: by 2002:a05:6512:3b87:b0:508:264e:2ded with SMTP id
 g7-20020a0565123b8700b00508264e2dedmr8780303lfv.38.1701051793170; Sun, 26 Nov
 2023 18:23:13 -0800 (PST)
MIME-Version: 1.0
References: <20231012230237.2676469-1-wenst@chromium.org> <20231012230237.2676469-3-wenst@chromium.org>
 <20231124-old-each-230d55963934@spud>
In-Reply-To: <20231124-old-each-230d55963934@spud>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 Nov 2023 10:23:02 +0800
Message-ID: <CAGXv+5HQkTUVXVDsHjy-T+iDU3Lr-K1sPeMA5EnzvHJxg8fkYg@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: arm: mediatek: Add MT8186 Tentacruel /
 Tentacool Chromebooks
To: Conor Dooley <conor@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_182318_148403_8026450F 
X-CRM114-Status: GOOD (  23.91  )
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

On Fri, Nov 24, 2023 at 10:09=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Fri, Oct 13, 2023 at 07:02:28AM +0800, Chen-Yu Tsai wrote:
> > Add entries for MT8186 based Tentacruel / Tentacool Chromebooks. The tw=
o
> > are based on the same board design: the former is a convertible device
> > with a touchscreen, stylus, and some extra buttons; the latter is a
> > clamshell device and lacks these additional features.
> >
> > The two devices both have two variants. The difference is a second
> > source touchpad controller that shares the same address as the original=
,
> > but is incompatible.
> >
> > The extra SKU IDs for the Tentacruel devices map to different sensor
> > components attached to the Embedded Controller. These are not visible
> > to the main processor.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> I had a chat with Doug at Plumbers about the limitations of your
> firmware. As a result, I am fine with acking this if you switch the
> order of the sku compatibles to be in descending order.

Thank you for taking the effort to understand our weird firmware
implementation. And a thank you to Doug for discussing this. I'll
send out the next version shortly.

> The firmware can handle that, right?

Yes. The firmware basically takes a list of machine compatibles, and
runs them against all the DTs it has with of_machine_is_compatible().

Thanks
ChenYu

>
> Cheers,
> Conor.
>
> > ---
> >  .../devicetree/bindings/arm/mediatek.yaml     | 26 +++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docu=
mentation/devicetree/bindings/arm/mediatek.yaml
> > index 60337b439744..aa7e6734b336 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -206,6 +206,32 @@ properties:
> >            - enum:
> >                - mediatek,mt8183-pumpkin
> >            - const: mediatek,mt8183
> > +      - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM14=
02F)
> > +        items:
> > +          - const: google,tentacruel-sku262144
> > +          - const: google,tentacruel-sku262145
> > +          - const: google,tentacruel-sku262146
> > +          - const: google,tentacruel-sku262147
> > +          - const: google,tentacruel
> > +          - const: mediatek,mt8186
> > +      - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM14=
02F)
> > +        items:
> > +          - const: google,tentacruel-sku262148
> > +          - const: google,tentacruel-sku262149
> > +          - const: google,tentacruel-sku262150
> > +          - const: google,tentacruel-sku262151
> > +          - const: google,tentacruel
> > +          - const: mediatek,mt8186
> > +      - description: Google Tentacool (ASUS Chromebook CM14 CM1402C)
> > +        items:
> > +          - const: google,tentacruel-sku327681
> > +          - const: google,tentacruel
> > +          - const: mediatek,mt8186
> > +      - description: Google Tentacool (ASUS Chromebook CM14 CM1402C)
> > +        items:
> > +          - const: google,tentacruel-sku327683
> > +          - const: google,tentacruel
> > +          - const: mediatek,mt8186
> >        - items:
> >            - enum:
> >                - mediatek,mt8186-evb
> > --
> > 2.42.0.655.g421f12c284-goog
> >

