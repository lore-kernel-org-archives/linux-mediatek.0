Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2B3C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 07:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haniZwft4cKI4inX+PJG9Yqt5S7i74415SjH5HntUuo=; b=1G1ZUAr6MbbrisBPofUjRX1oZ4
	4SRVN78Iml7NaevQsjECg/vEO7XCyVRgJpd7dIq4lz5Lk9bN9R1KVma1N+bqoNEmAadGhQT5KhJ3m
	2tkRfGYOVTG+w3mTuedwNvQCyR68dgEGXlzfu9CdZIQuSFdIvdPXaj+sulzPSVGcsChKPBE3IKPKQ
	Apa75iQMbofG0zyAFD1eIfUbpWqvg6epbuX9Hg+sjdz2D1zEZBUU18HDyScQUW1HSQmz3RdiYJgyA
	nmtTEV39tpYJ7rsvF3wcrAaeI69p21pVhl13w9ug76Ofh8Wnw4HwTB4DU7UbgEINFxB/o9XqdRXO8
	dzAjqQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUgv-000000089M0-1FZ6;
	Fri, 08 Mar 2024 07:30:53 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUgq-000000089Je-2mu6;
	Fri, 08 Mar 2024 07:30:50 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-21f5ab945e9so696203fac.0;
        Thu, 07 Mar 2024 23:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709883047; x=1710487847; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haniZwft4cKI4inX+PJG9Yqt5S7i74415SjH5HntUuo=;
        b=J4zG2KfSzQCTywI+DYdLN7HSsu7/uSNtmpnxeDYSYVcK8d7jhXkR80D3woZfFGPCqj
         hSR+odh++L2ysj3wMVavQ4Kbc0/CBSDjRnBjFXirtBXGf2OQ6tsChs+momORBmzrbJk+
         kYGANuZ19G/0BtMnTRiDount7+g1/Qx9+C9EVCLDfNS0YCLQ/5pnm+F+h24KFeMFnkXq
         d2SHGuISn/M9zYeEbTuK5eKmgdhCDb2aC+ksFBAj4yO9vJOphD3wIim9kfUmHd8/i3Bc
         0PBcwbvbOgwtZIvlH1yrKq54Wts0Hb+IYANcg7HhoT1FZaFhgEchq2T1iU5TaU2S0fWd
         2h/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709883047; x=1710487847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=haniZwft4cKI4inX+PJG9Yqt5S7i74415SjH5HntUuo=;
        b=JZpyHCUq/L/FZaK0QQ0PsjGwKIQZW5RntWK5IxqpDzH/4LUHb9A7/ZktPmQuJ9Oqy+
         xhbXPU9Ewpt6tw30VuUln8SkkqnOyAxf76yH4AzuENpCWf6W6QsaUAwiKfODFz5paskG
         qS3KaaC2hogdTMq9z2VODSKNEFtcn1WeJOfBoI0ipQ51o8KSDdIFiar7rL8wivat9g3l
         rqHWb5yTTur8rcx/KAbYDiVblUADeXwRvb/wqIjg7AP6lk4kv4ypKXoJTuCz7CUSNsMx
         EKLQRsFcviLbDD4fukK24t+mqOdMQDk7IEI0lW0D/aYZBJY9dHzjwY7nOvpIhYp+wSci
         CGjg==
X-Forwarded-Encrypted: i=1; AJvYcCVWkv6ZpAWgqn5nHrmaqDSevmCT/zMqMxmJDtNYPAjXrYEAIDTfi00dddupGfZdGrNmJM4x9v1CGmTUJLEwl1rn/cEtE7uupizjTBYF7VAMiR4Cgu6NdzqT1CUUhM9BZ6jY6xd/DmN+guH/KNs0ot/Pin6HIKQ9cE4=
X-Gm-Message-State: AOJu0YzO9VSGPZUoiIzmFVCBY6q6GBGO1gpINSHTooHZZLOf8c5caRsl
	SKFM095pJUaNAOuV86xnAHY0n5y1H2yjZrgBsU96sPsPUw70KDQmldZQaQgr3wkJsWd+JqvnUcV
	l8HCPFSQIhTZowVD1i0QT41QdAzJmVkf6Qb0=
X-Google-Smtp-Source: AGHT+IGZiX9XYKiUBp+8l+Pz8MJ931cWf8obPtigppTRXErCR0+r4FF+RoS1m/WY/W7uarevs4qbHcVRWUViLmQcbVA=
X-Received: by 2002:a05:6870:a108:b0:221:88a7:d8a5 with SMTP id
 m8-20020a056870a10800b0022188a7d8a5mr1051515oae.7.1709883047312; Thu, 07 Mar
 2024 23:30:47 -0800 (PST)
MIME-Version: 1.0
References: <CAMhs-H_eUKm7C40oCzuKwwEMZAcOJ-g4MghAfkGAmxRM0AXPUw@mail.gmail.com>
 <20240307190408.23443-1-justin.swartz@risingedge.co.za> <CAMhs-H-qHGEpjJqMu4J2SxBo1Sq3+yy74v-j=oH=P9sSt-19zg@mail.gmail.com>
In-Reply-To: <CAMhs-H-qHGEpjJqMu4J2SxBo1Sq3+yy74v-j=oH=P9sSt-19zg@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 8 Mar 2024 08:30:35 +0100
Message-ID: <CAMhs-H-S3DSaBbkRWpDEiKB=M2GjJE3xfsRXCJPWsz-YU58uRQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mips: dts: ralink: mt7621: associate uart1_pins
 with serial0
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_233048_732281_348078BB 
X-CRM114-Status: GOOD (  16.34  )
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

On Fri, Mar 8, 2024 at 8:27=E2=80=AFAM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> On Thu, Mar 7, 2024 at 8:05=E2=80=AFPM Justin Swartz
> <justin.swartz@risingedge.co.za> wrote:
> >
> > Add missing pinctrl-name and pinctrl-0 properties to declare
> > that the uart1_pins group is associated with serial0.
> >
> > Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> > ---
> >  arch/mips/boot/dts/ralink/mt7621.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts=
/ralink/mt7621.dtsi
> > index 35a10258f..dca415fdd 100644
> > --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
> > +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
> > @@ -123,6 +123,9 @@ serial0: serial@c00 {
> >                         reg-shift =3D <2>;
> >                         reg-io-width =3D <4>;
> >                         no-loopback-test;
> > +
> > +                       pinctrl-names =3D "default";
> > +                       pinctrl-0 =3D <&uart1_pins>;
> >                 };
> >
> >                 spi0: spi@b00 {
> > --
> >
>
>  Please add Acked-by/Reviewed-by tags when posting new versions.
>
> Thanks,
>     Sergio Paracuellos

Anyway:

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

