Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B044CD13570
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2024 11:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVZy5IrMKfr30Sb+HXmGpWXo6EuG4COK1gDvgq9aZn8=; b=rOv/ixW4meaCpQpcoaREMu6LM5
	oGeLYkwnle7FgaF81u6WBcZslZGV/BAgPwCXJ+fLBLDGGkn39VB+6UUCn8wRowKygrDZH/PsYlTqY
	LP26C64tiJvEyfOXTQFDcVKgAZ9wFvyiVT2sS26BwDBRlmkkkdVb5tvuAP3UEMw1ZVggjG2NALsph
	U0UCu+Sp2fiMxLFj2TWh+/lD/wu2Gh7o9yWifzhwsfYDUhf+TehEjTrBmhscNswsXgSWRzo5hDGYX
	4K4sKg+TD1vS857+bfNJTmnKr2NcfCsx4zxUXKTC1T9k6Tb/LZVcBwme3YrXWhNxHT89bacHA8tgq
	wB+OzeGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ng3-0000000AXHp-1qJs;
	Mon, 28 Oct 2024 11:12:51 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NeN-0000000AWvc-3Y2g
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Oct 2024 11:11:09 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-50d32d82bd8so996681e0c.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Oct 2024 04:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730113866; x=1730718666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVZy5IrMKfr30Sb+HXmGpWXo6EuG4COK1gDvgq9aZn8=;
        b=KM/4D/7POHP4tZ5spJzPNiNUFvsrQ7OdA6CJSbxlS1QNu/2h2eu7+Iuo10cSTFmbem
         WnK8gWCdp80HUxLU/g1WbVDT5RuKlAPtwnojUQmHeeReswrExqwZV5LZRHDhwMDhppuk
         rWhQ0jEiwAu0R+KerDaizMHzr/aOEtEzutW4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730113866; x=1730718666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVZy5IrMKfr30Sb+HXmGpWXo6EuG4COK1gDvgq9aZn8=;
        b=icb5vURpwhh84DTJ+UWHlQsxlqt1hHACgYGoiUHfUb60d0G682f4Zlhz/mQkx/U9Rz
         3Ma6kR9trQmmTtMBT/i9XDh+QV77kRamCZkerO3i55rpnRfC1sB/zvUMOAOsS6uoOhYq
         AA3vd2b4WZqlY9JK1T7XDBkFYj7IrZDjSRcpfS0XnEWRT3bJRdyaCCztwM49K3ca1fRL
         WsjZ82brq4Q+9VhIpXxFCXtJUW4uF5sURcATZY8JltY/NgLOfBuZVQzY5dvCHo3JCN66
         nWM5rZNiWtV5LKJCLVpjB+EXmj85NAo+7V6M9mgrtWEoifpI8lqadGBfkqBKToILTa9x
         0nlA==
X-Forwarded-Encrypted: i=1; AJvYcCXXZf4vkxUEJVsfqjHBguJi2dyOmQuAIiFH8q/FyLOyi6l1zYREV/TKNHmDw6cK9o5NzohUXQANPf66aNBo/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZCy3VlWF6C/epcwyBGCZuemeXfUqOQhd2ONOzPDesFFezOQEz
	ESO5qZVDWbcP1h9pJdFc84ehWdYmV/Ao+IxdkPoqFSQAf66V0syJxT/LEBosIyqSKkpKR8iFSsU
	=
X-Google-Smtp-Source: AGHT+IHa7MwsngjKYQ7Pb5YaPfYES6AMUfouBE7+e4Azsadm/Pxm73VsQyH8tl+X5BxrV2SPulBPkw==
X-Received: by 2002:a05:6122:4690:b0:50d:4cb8:5b10 with SMTP id 71dfb90a1353d-51015026c0emr4222135e0c.4.1730113866109;
        Mon, 28 Oct 2024 04:11:06 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-510043a4cf0sm835178e0c.13.2024.10.28.04.11.04
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:11:04 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-84fc9005dccso1089253241.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Oct 2024 04:11:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUp2wEgGiJSWJjYbe6lpAObBeCikFdQC/EzOnZp0eGc3sBazCUH3nQdHQlkuEypV7nnmUZhgGIEO+qHsqCYg==@lists.infradead.org
X-Received: by 2002:a05:6122:3d01:b0:50d:99e4:dea6 with SMTP id
 71dfb90a1353d-51015055166mr3900796e0c.7.1730113863969; Mon, 28 Oct 2024
 04:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20241025104548.1220076-1-fshao@chromium.org> <20241025104548.1220076-2-fshao@chromium.org>
 <5vmfh2nkxtpzt2vk4j6ghro7z5stoyvry3enzoqepg6hjxqrho@fofs5cwa2iqq>
In-Reply-To: <5vmfh2nkxtpzt2vk4j6ghro7z5stoyvry3enzoqepg6hjxqrho@fofs5cwa2iqq>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 28 Oct 2024 19:10:27 +0800
X-Gmail-Original-Message-ID: <CAC=S1njPjtvhsc+voNK447wbQmRiN0xVDi-jgOmba4NLRiNi0Q@mail.gmail.com>
Message-ID: <CAC=S1njPjtvhsc+voNK447wbQmRiN0xVDi-jgOmba4NLRiNi0Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add adsp
 and dai-link properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_041107_912584_6D727519 
X-CRM114-Status: GOOD (  31.31  )
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

On Mon, Oct 28, 2024 at 4:54=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 25, 2024 at 06:44:41PM +0800, Fei Shao wrote:
> > Add "mediatek,adsp" property for the ADSP handle if ADSP is enabled on
> > the platform.
>
> We see this from the diff.
>
> > Add "mediatek,dai-link" property for the required DAI links to configur=
e
> > sound card.
>
> We see this from the diff.
>
> >
> > Both properties are commonly used in the MediaTek sound card driver.
>
> If they are used, why suddenly they are needed? What changed?

Nothing has changed. These should have been added altogether when the
binding was first introduced. This patch is to fill the gaps and fix
dtbs_check warnings, like I mentioned in the cover letter.
I can add a line in the commit message saying it's to fix the warning
in addition to the cover letter, if that's preferred.

>
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> >  .../bindings/sound/mediatek,mt8188-mt6359.yaml         | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt=
6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.=
yaml
> > index f94ad0715e32..701cedfa38d2 100644
> > --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.ya=
ml
> > +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.ya=
ml
> > @@ -29,6 +29,16 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >      description: The phandle of MT8188 ASoC platform.
> >
> > +  mediatek,adsp:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: The phandle of MT8188 ADSP platform.
>
> And what is the difference between ASoC and ADSP platforms? What are
> they used for?

I'm not a MediaTek or audio folks, and I'm afraid that I'm not the
best person to explain the details accurately in front of experts on
the list... I know it's an audio DSP but that explains nothing.
MediaTek didn't provide a meaningful explanation in the tree or
commits, and I want to avoid adding additional but likely misleading
descriptions from someone who doesn't have enough knowledge,
potentially causing even more confusing situations in the future.
Plus, the same changes were accepted as-is in the past, so I assumed
they might be self-explanatory to people who are familiar with the
matter.

>
> > +
> > +  mediatek,dai-link:
> > +    $ref: /schemas/types.yaml#/definitions/string-array
> > +    description:
> > +      A list of the desired dai-links in the sound card. Each entry is=
 a
> > +      name defined in the machine driver.
>
> The list is provided below. I don't understand why do you need it. Your
> msg is pretty useless - you describe what you do, instead of why.

I think this is used to explicitly list the intermediate but hidden
DAIs, but again, there's not much info about them unless MediaTek can
explain more details and why they need a vendor property for this.

Regards,
Fei

>
> Best regards,
> Krzysztof
>

