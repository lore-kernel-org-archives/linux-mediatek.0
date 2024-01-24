Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5269AC46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 09:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TdYwfAa3Kb++bbinJAM8F6n7j06tuxaI+2yyckzaPc=; b=JgdXVzf4cKNSgIWX7ft3yL1QJv
	1zoW4GXtGXFjPz/6mfG7yxWx/7dcXxj2H82sAM7Oekk+of0sZQeOD/EY+61k92S4LWg2m/atFayPY
	673n1WbP+NlnYt2j5bjeukKT2TGR84p0oCb1Dg51t4o3l1lHulXa5n6INs92CpnWvyImpbFDGJnY0
	GJWLDgq3be1LXATOTeTbgNBQY1D3REZgxhvplYW4i5ZeEOZnErBJpuEdosO7Mt6nrDatzbAGvyLBE
	VwjB5O3AEGKlmQmDKj9jN6Q3gWRAC015rzp0/8mpJfNHAVHfFlWb8symEk6ggLITGnu9KlXuWsk0B
	7cS96M5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZCG-0026ed-0Z;
	Wed, 24 Jan 2024 09:05:24 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZCC-0026bd-2W
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jan 2024 09:05:22 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-55783b7b47aso5892292a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jan 2024 01:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706087113; x=1706691913; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TdYwfAa3Kb++bbinJAM8F6n7j06tuxaI+2yyckzaPc=;
        b=TQcsvD5OEzUS2pcntb37HPKM02W1lMWWwnpC2c1MOfzqnrbpjbV//i9XDBecTK+AgS
         aeBnmRywuqE8442qBFASiA1qIWqDsP7+79VVZyL34Hsb19v58gOnuBkk1kOutYmGe1LY
         7n/8ycOjtPhQKnoQ/iL1XmEELYYy4GT5W+ZgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706087113; x=1706691913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TdYwfAa3Kb++bbinJAM8F6n7j06tuxaI+2yyckzaPc=;
        b=sCK5tad+C5I61ZKPn987nA5/qywqWtKRFTbu6Ve1wNAzQaSoi0qaTOHFE7V27eS53o
         cLPE9RD7cD3nScA7Y5LeO1dMw3vx+uElKs/qxz2K7bGp36aCR4bTREsB/aFL+mTe8tv3
         ZBUFhpP1qDHGMTG1/PqOV771jSyP5Jhht58N7fCDjBksZrIV2QjaVugwX9F2a0m7rCib
         0XNUF/3M6b5NtK8rgcINmuIsnHsVZyzoeObPeYZguBR65TzOcACH/BtVUb2U0mPGh4od
         VsYgOSrqMDWNcFC5ZpzpSk7aVa8zU8yPk6Bi/oace4TCIlgrQFMY2aB0jiV5E5i+Hzx7
         cf1w==
X-Gm-Message-State: AOJu0YzTrlm0VC5Dn04XiMp+AtcTG5ShRxSKpSeBZQx/6SnyD64OtnPL
	rPF8IHrizdBL8GvXxxAwbV62LwHtBBWIlmhJoGmmaIagqnecGN9m+N5uKlO5kk6wUHwX2p26Xca
	xovPhjJk=
X-Google-Smtp-Source: AGHT+IH5LCLX9sLazY0oP543g0rOlopXlMPi0pjg26LrsR6VA4Tv3+WRtkXxjeXDZFy6DpkF+J5tVw==
X-Received: by 2002:a17:906:2551:b0:a30:d361:406e with SMTP id j17-20020a170906255100b00a30d361406emr663813ejb.76.1706087112947;
        Wed, 24 Jan 2024 01:05:12 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id v1-20020a17090606c100b00a2a04754eb1sm15259137ejb.8.2024.01.24.01.05.12
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 01:05:12 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a310f4b3597so43982366b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jan 2024 01:05:12 -0800 (PST)
X-Received: by 2002:a17:906:1756:b0:a30:cc71:7340 with SMTP id
 d22-20020a170906175600b00a30cc717340mr560441eje.120.1706087112019; Wed, 24
 Jan 2024 01:05:12 -0800 (PST)
MIME-Version: 1.0
References: <20240124-send-upstream-v3-1-5097c9862a73@chromium.org> <786c85c7-7b38-4a2a-85ec-282196de7b5e@collabora.com>
In-Reply-To: <786c85c7-7b38-4a2a-85ec-282196de7b5e@collabora.com>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 24 Jan 2024 17:04:35 +0800
X-Gmail-Original-Message-ID: <CAHc4DNKXOb54v7qJZJ2EsVP1KkMq7WnSJJLWhb2SzuhW_=qnxQ@mail.gmail.com>
Message-ID: <CAHc4DNKXOb54v7qJZJ2EsVP1KkMq7WnSJJLWhb2SzuhW_=qnxQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: mt8195-cherry-tomato: change watchdog
 reset boot flow
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_010520_857611_DBCF7F1B 
X-CRM114-Status: GOOD (  19.94  )
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

Hi AngeloGioacchino,

This bug can be triggered by stopping watchdog daemon and running
`sleep 60 > /dev/watchdog`.

Regards,
Hsin-Te



On Wed, Jan 24, 2024 at 4:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 24/01/24 08:51, Hsin-Te Yuan ha scritto:
> > From: Hsin-Te Yuan <yuanhsinte@google.com>
> >
> > The external output reset signal was originally disabled and sent from
> > firmware. However, an unfixed bug in the firmware on tomato prevents
> > the signal from being sent, causing the device to fail to boot. To fix
> > this, enable external output reset signal to allow the device to reboot
> > normally.
> >
> > Fixes: 5eb2e303ec6b ("arm64: dts: mediatek: Introduce MT8195 Cherry pla=
tform's Tomato")
> > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
>
> Can't trigger the bug, but also this commit gives no side effects, so:
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
>
> > ---
> > Changes in v3:
> > - Add Fixes tag
> >
> > Changes in v2:
> > - Limit the effect only on tomato.
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts | 4 ++++
> >   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts | 4 ++++
> >   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts | 4 ++++
> >   3 files changed, 12 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b=
/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> > index 2d5e8f371b6de..a82d716f10d44 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> > @@ -23,3 +23,7 @@ &sound {
> >   &ts_10 {
> >       status =3D "okay";
> >   };
> > +
> > +&watchdog {
> > +     /delete-property/ mediatek,disable-extrst;
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b=
/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> > index 2586c32ce6e6f..2fe20e0dad836 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> > @@ -43,3 +43,7 @@ &sound {
> >   &ts_10 {
> >       status =3D "okay";
> >   };
> > +
> > +&watchdog {
> > +     /delete-property/ mediatek,disable-extrst;
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts b=
/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
> > index f54f9477b99da..dd294ca98194c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
> > @@ -44,3 +44,7 @@ &sound {
> >   &ts_10 {
> >       status =3D "okay";
> >   };
> > +
> > +&watchdog {
> > +     /delete-property/ mediatek,disable-extrst;
> > +};
> >
> > ---
> > base-commit: 64b50fcb03649ca7f0d762a50e7a3484cfc1d586
> > change-id: 20230818-send-upstream-e91e615a893c
> >
> > Best regards,
>

