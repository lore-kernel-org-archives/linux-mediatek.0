Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B07E7719E
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2025 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxLA9rUR/gJT7KoDTQj0+vBZS7GvUNOK0hNifMZCuqw=; b=Vzj19meKyHQ/+twVi+9VQq8TTe
	s/Erm+HQf3AqP2z79ajmxkltvbSUCA9rxhvM/Rhaa7kOM8yZrAjLxdoa6Sf7P0JamZNPqqh3XKII5
	Knn18qKQgBY6by1+60f+Kvb3yzDLmKkD/Rav3CVbrDrBW26FCva4d3KaEKhwXuK3WDdAUGX7hroaM
	rk/IlhhXfun7pjO/nOz8zd4pIkJA5Vpk8NZjfvQwTdoXW5VWddHPugtLuy4ZNts3JY0i/TFmbGeU+
	1Ftztv4MMajK8ucc79zwqu236ay202FN6IhvTzzu41aBC8Y1LesgGY11Ez+/hFT98g9UYPQo+zXk8
	B8KS5nzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5Vx-000000042Ap-3l4Z;
	Tue, 07 Jan 2025 09:04:41 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5Tl-000000041Or-23pQ
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jan 2025 09:02:29 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53df80eeeedso1207363e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jan 2025 01:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736240543; x=1736845343; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxLA9rUR/gJT7KoDTQj0+vBZS7GvUNOK0hNifMZCuqw=;
        b=lysfhPoQhIkq6oHM6IFSPIJNPLsJxV6IbB1GcrRDJddVLuCi0jtyU1i02I3dBRtFZU
         zonAAazbKEL3QIlnYtXdlYK+C3FIK+bhZ79Bdip3vac+YHFnhHoDUNoIMvZXg4A5Hfet
         XWezPU2kdVeFGguTnCpNN/4LN4kCzBwazJ3K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736240543; x=1736845343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxLA9rUR/gJT7KoDTQj0+vBZS7GvUNOK0hNifMZCuqw=;
        b=wGMyn9MT9b7aA2a/LRYji6lyp2LUNo24Ox+02ov6ynF5ceGPNYo4CFdijlz4+xVLZj
         dVrdBKSKadnsb+flnlwAle490dtvjXssM25FMIBb1wTkRaHJeaDY6Vl7VM6sGAzGkUBd
         dPivcUMbe9hhvDexq08fDkqJSdFmelFWRLgaZ1zZNnh+DNRXngQf30Q9jsJCVfRbu4C7
         okQPkOxgS7uGtGwhSdkz7ShseF7X1VrxHlncs9m3Orwv8ZaXyhGdIIe1tpoS/x5a9JH2
         1TfAAEFmOB1NeMmMc9elfy8kE+/mGkv9YUNZGd9AjmaC51EqOooa+6/5gm6M+C2zljM0
         Er4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVx4kTf8+T9Jl5g9qNGUv0BTNIEE0kr5XCRb00inzpZCT30rvtHc44IrkGsCfetJygLwELiRchzj4EMjGqZhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzboQm8pHb7qmfiuVeWDCUlW/ygDVUdJ/wVH/NV+cyBFa6Yiee+
	loq80ePrg9fhMMrHdHjJ1v/qj321Zm+yEo6JbWESFWobfwdOgt8QuDLXSRd+vU66zlz7gwa7LGv
	bW5X6LEGESruUElFKytisrSlYX7cgaa6qMsI1
X-Gm-Gg: ASbGncveuqIuGhksEfSY6sMlpYlXi86Ak+T5mdPXN2nxU/f76z1eBUVpGJi6e/6vLpA
	E24VVYau5GoEYOk06IRLVr26OAc+DH/GlZtFOc7ax0kQAkptvdeUEJu/LDGyfH3dR
X-Google-Smtp-Source: AGHT+IHelcMparcoLg17vF4WDr4gu9Gh7r2hpYwzZdtimgS/flztrhU/dbW77dw1U2dj/dcAHZrsaayy4PGBYwNtXOU=
X-Received: by 2002:a05:6512:10cc:b0:53d:ed69:a593 with SMTP id
 2adb3069b0e04-5422953ff0amr20882626e87.22.1736240543524; Tue, 07 Jan 2025
 01:02:23 -0800 (PST)
MIME-Version: 1.0
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
 <20250103060035.30688-2-jianjun.wang@mediatek.com> <ndj6j2mmylipr7mxg42f3lcwgx55cvcjnuuofmlk6n6t5uz5pr@bxugolyfublc>
 <04ae2a07e2c2d3c03e82596034b1b7711450a0ae.camel@mediatek.com>
 <eb2088d3-81f6-4cb8-a4d7-6ef985aedbda@kernel.org> <9b0a463312702fb78e4ca2ba79c9ec6b62e33c58.camel@mediatek.com>
In-Reply-To: <9b0a463312702fb78e4ca2ba79c9ec6b62e33c58.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Jan 2025 17:02:12 +0800
X-Gm-Features: AbW1kvZTmXzwbrGBqElpSqfN778xG89x2dquf_HbLF0Z9gqveP2lcGYTvPUsDT4
Message-ID: <CAGXv+5H5ymEem=JWF1J6dHr4B7o5cdOgvCSg0Q_5GVkx487Ksw@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: PCI: mediatek-gen3: Add MT8196 support
To: =?UTF-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>
Cc: "krzk@kernel.org" <krzk@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Ryder Lee <Ryder.Lee@mediatek.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	=?UTF-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010225_554921_21550689 
X-CRM114-Status: GOOD (  27.25  )
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

On Tue, Jan 7, 2025 at 4:45=E2=80=AFPM Jianjun Wang (=E7=8E=8B=E5=BB=BA=E5=
=86=9B)
<Jianjun.Wang@mediatek.com> wrote:
>
> On Mon, 2025-01-06 at 13:27 +0100, Krzysztof Kozlowski wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > On 06/01/2025 10:26, Jianjun Wang (=E7=8E=8B=E5=BB=BA=E5=86=9B) wrote:
> > > On Fri, 2025-01-03 at 10:10 +0100, Krzysztof Kozlowski wrote:
> > > > External email : Please do not click links or open attachments
> > > > until
> > > > you have verified the sender or the content.
> > > >
> > > >
> > > > On Fri, Jan 03, 2025 at 02:00:11PM +0800, Jianjun Wang wrote:
> > > > > +        clock-names:
> > > > > +          items:
> > > > > +            - const: pl_250m
> > > > > +            - const: tl_26m
> > > > > +            - const: peri_26m
> > > > > +            - const: peri_mem
> > > > > +            - const: ahb_apb
> > > > > +            - const: low_power
> > > > > +
> > > > > +        resets:
> > > > > +          minItems: 1
> > > > > +          maxItems: 2
> > > > > +
> > > > > +        reset-names:
> > > > > +          minItems: 1
> > > > > +          maxItems: 2
> > > >
> > > > Why resets are flexible?
> > >
> > > There are two resets, one for MAC and another for PHY, some
> > > platforms
> > > may only use one of them.
> >
> > Even more questions. What does it mean use? Is it there or is it not?
>
> It will be used by calling the reset controller's APIs in the PCIe
> controller driver. Ideally, it should be de-asserted before PCIe
> initialization and should be asserted if PCIe powers down or the driver
> is removed.
>
> > Platform like SoC? But this is one specific SoC, it cannot be used on
> > different SoC.
>
> Yes, it should be SoC, each SoC have its own resets, and the number of
> resets for each SoC is defined by the hardware design, most SoCs should
> have one reset for MAC and one reset for PHY.
>
> >
> > >
> > > Would you prefer to set the number of resets to a fixed value for
> > > specific platforms?
> >
> > Everything should be constrained to match hardware.
>
> For MT8196, there are 2 resets. Should I use a fixed item in this case?

Yes. As you said, MT8196 has two resets, therefore the binding should
say it requires two resets.

So in the second part where it matches against mt8196, you should
have minItems =3D maxItems =3D 2.


ChenYu

> Thanks.
>
> >
> >
> > Best regards,
> > Krzysztof
> >

