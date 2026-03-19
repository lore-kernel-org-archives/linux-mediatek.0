Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862C81088E76
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2026 04:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycSewpuz2GDH8JHlWYt42sU/cLJKsJubh50gU2e8SKI=; b=4ozO9dLFYQDs0U+Q4ooSU8VTCp
	/BOXKLXRc4AKEnvZSfQB04VxEWc0sv/XZfZ6EuNWVHI6eoTkei8OcNjeXKDjVeEiXohzvAO9Fdgcg
	3buXrX39etIsDhj+H4K5ujfygE9Mq4eYGk+l9oMG4WapxOZyGUdWOnBr43WtZt+M1iq3LruM6uHvY
	JHfGa/rMV6em4EGhFfTCPKO7b1LHrTATFZaDp1SGXLKO6FH87oG3FaDGhtrbIgbYPt1c/Gyl8QDeq
	IADYVncRHWZWND+k1PuYW3ruMAe1b94PCi0MWNGkg0kGxK4HUApyydpovGY2YrGJWiWhpNjLG0Y5n
	BX7/Zx1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w35OX-00000009v1c-0xLH;
	Thu, 19 Mar 2026 04:54:05 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w35OT-00000009v0b-2Vm2
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Mar 2026 04:54:03 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a159c1e65aso469840e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 21:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773896039; cv=none;
        d=google.com; s=arc-20240605;
        b=jjJwnaEzVntbMloBANVQvnMfJOWqTdtMMbqntTfkR87iPqi60j7K7QxxwTbWvJoSBK
         qbwQz8HiK9EmiQkeCwrOd+FyZzJsKUYHWWWOf78PSrX45ZTlnYggNYxRQgTuLBAdyHLW
         WmkxiFGZgrRDjKMrbeniFksXx2vAIt9pm6RkVGYMAp11OkTn8ktMoporCEPIcmbVxySQ
         1k0iy/QzTfE4YFPuEUEY5fT50b7LcZpM3QiBEZUbT60621VCQDmVh1DHwLWa2cqUm0vY
         /8NIg6EBYLqtEo18lgoujsI2nXHQ49VRI5gmPSmjwRNU9nVPa+Ymfw9XXLqoVfe9vTGD
         06cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ycSewpuz2GDH8JHlWYt42sU/cLJKsJubh50gU2e8SKI=;
        fh=dmVUuq3GMTXYi4/T/hkl58URMmn8pXBCz2Ls8x2SkNY=;
        b=X4KqTBY3PJehfLsOF+OF9dFz/9Vpw2OudyuYUH/ElMDd04fPwfGSuo2JRFJaSh7xB1
         Sw2yJXMf1xxz3cagq+TefvmALPHm0ZOfCTBIb9GCqrBakVsGcGwdwfdGQsBAu5KWWppZ
         E/XsdzRFXogyN3qo22UxUacgH8P4L4QA5vl39EpfCDh/pi5l5UzNbBdSNEDXhnhMjkML
         Ffn1N0lAwliGaFclOo04FwyGVGMseCkqAa5JwZxpb7bjIh6DOvLolrq3Gg1EPFVavBcG
         WEsng4NeMCq2JgoxP9cXZaamUq/LjaN97GCp+ZSMKV+kbELZ3v8+cadsKLRUuC/MYDkH
         us5w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773896039; x=1774500839; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycSewpuz2GDH8JHlWYt42sU/cLJKsJubh50gU2e8SKI=;
        b=JCLNYB8n9IIKjCbI5Ec3nfwUrA7qb8o9Dv43sMa1sU+RxcrxKzx9gpyfQvm1TvFH3+
         gHJZK7CCpoNY9Tx7FRoMJYGb99zMGvaFTWq9+xiNXFOn3hfs8duoBhRM1J6YT9Ea/F5n
         hKJYXOPYV5cQ5IFHwSQpgYOXy/XBeF7G+83L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773896039; x=1774500839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ycSewpuz2GDH8JHlWYt42sU/cLJKsJubh50gU2e8SKI=;
        b=PGRpgdtNhhPdeA++YwAdoocSc1UKZwizb1XeDsI/PM5jb6HAQkrAiV4auuSmQPiFY8
         47P4fPWi60clN43Qd4YJG5ugd82pSBPgEcqYQbKyILOYTTqnvvTjcV4G0s9rOfDRmfl4
         YAhtH4mhDFa5vuI2U059ojm8HHP2pI2ZRRLT+cr/ujRK6vQdCLNRL8knpyv/lQI+5isM
         gQnFy/TVuO2z0TafetCMAkSiLDPST3S0GqXH7wHIURqEXHKujDldnIv5RcjkNsTwRWB+
         gwY3eqAB64OrHeRGZg04VlSJFEegczCDx3oA+piaQcIWMN9v9VBNM66YLjOKOvEUjpfb
         W+Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVdAnVbz6k784Do4O7wOqmk+5B+9bzV3zxP9Ch3mpQw9f0xX2WTakjm1wPJK17FAYP/tKcxR2Z2MqGpj6A2PQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcnvS6Up7XNVhL7YxAwJDufpz6FfwFHZ3vflZt8mQ82QEyao4J
	dwdZ1H9S42xQtem++dGqcz7unob7+F9KWGaM4IlNlhEqb1UnaRggBfAtdf9NaAfR94/VrYxCPka
	ga5l9D2s7scOcL/uOHzqVQyzKRcGcEdxdFaQZbb43
X-Gm-Gg: ATEYQzwv+L/m3SplVK+QP8J/vIZ58XuFbpzirKWJdLmUyfMTfDCjc6iARd3oP2PkWnQ
	jXiuWjpoamrzXvBotYgN0CbTEDoj95rt9zccNx7oV6YGCD5GtdJbH+Bf+hSWrP+/KRA1n1Rsjpu
	ZonKFIHKUPvL4iqiTi8n3n5EMOgTYkxkVvpNGuuZokHpOgKUj/ERtpSsascsoPDXaCSUpQFlwxw
	kzBRoANRkfH/0PCKtcJvQoNff5h8wNF8D2njy/2M9wW7lHcyLeokAVj/rA5yckVjO/ovvTyP2+A
	FnK77i7RQF7GTfXa70bxTBzBbv+gKJp7yrfCsg==
X-Received: by 2002:a05:6512:601:20b0:5a1:76b7:ac06 with SMTP id
 2adb3069b0e04-5a279585449mr1694598e87.3.1773896039222; Wed, 18 Mar 2026
 21:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-4-l.scorcia@gmail.com>
 <20260318-nickel-serval-of-tolerance-621bad@quoll> <CAORyz2Laoo4EiLcHZ-ygLiFGW_h8qV7QxqNsMbueM=nov5zH0A@mail.gmail.com>
 <ad0d1ea1-4c5d-4cfc-af0d-8d843e7e0e9e@kernel.org>
In-Reply-To: <ad0d1ea1-4c5d-4cfc-af0d-8d843e7e0e9e@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 Mar 2026 12:53:47 +0800
X-Gm-Features: AaiRm53rEbzUcysiLnjhOdOv1aJMbQDabqUfN6XBRWKQC_wiMRBidNmKXvI9wx8
Message-ID: <CAGXv+5EqUhJ62fjE0R9nLcu6tsfXan8ZEYe7hvkofKnFM7W8NQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] dt-bindings: regulator: Document MediaTek MT6392
 PMIC Regulators
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_215401_735285_2E12F836 
X-CRM114-Status: GOOD (  29.71  )
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

On Thu, Mar 19, 2026 at 6:14=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 18/03/2026 22:25, Luca Leonardo Scorcia wrote:
> >>
> >> Drop compatible. Regulator nodes do not have compatibles.
> >
> > Thanks for this comment. It took me a while to understand what you
> > meant as most of the MediaTek PMIC regulator drivers still require the
> > compatible node to probe, including MT6397 that was the template for
> > this patch. I compared the driver to MT6359 that does not use it and I
> > am now working on the driver to not rely on it.
> >
> >> With this, you can also drop example as it won't be used.
> >
> > Just to be sure - do you mean remove the compatible attribute from the
> > example, or the whole example section?
>
> The entire example because without the compatible it will be no-op.
>
> >
> >>> +
> >>> +patternProperties:
> >>> +  "^(buck_)?v(core|proc|sys)$":
> >>
> >> Nope, underscores are not allowed. Use only hyphens.
> >
> > Got it. I will actually completely remove the (buck_|ldo_) prefix
> > altogether as suggested in another comment.
> >
> >>> +  "^(ldo_)?v(adc18|camio|cn18|io18)$":
> >>> +    description: LDOs with fixed 1.8V output
> >>
> >> If fixed, then encode it in the schema - min/max microvolt.
> >
> > If possible I'd like some clarification here. According to Chen-Yu
> > Tsai comment [1], dtsi shouldn't contain voltage constraints. The way
>
> That's odd, because long time in the past I heard that DTS must
> absolutely set min/max constraints, because these are real hardware
> (board) constraints for each regulator, unlike the generic and broad
> ones from the driver.
>
> IOW, driver has what datasheet tells. DTS has what actually should be use=
d.
>
> Also, I did not actually require to make min/max required, just they
> have to be specific/constrained.
>
> > I understood this is that electrical constraints are a matter of the
> > actual board layout, so if adjustments are needed they have to be in
> > the board dts. But you also specify "If fixed", so maybe there's an
> > exception to this rule when the constraint is "absolute" and boards
> > can't actually set a different value?
>
> Now I am confused. You wrote - LDOs with fixed 1.8V output - so board
> cannot set it to 2.0V for example. They are affixed. This regulator
> CANNOT physically produce anything else.

As you said, it cannot physically produce anything else. IMO it doesn't
even need voltage constraints as it is already implied by the model and
regulator output, in which case I would actually recommend rejecting
min/max voltage being added to this node.


ChenYu

