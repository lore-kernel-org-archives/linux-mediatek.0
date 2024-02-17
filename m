Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4DFC48BF6
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Feb 2024 07:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hs1VlpZsxeC5GOLK06WGcIjDrl11J8nbAUzkDUfDeRs=; b=iNRURpPmNFcLGjYqpyXawSWzZm
	fAnPZF95KokPwdinmPGourno5izywfpGwkYN2v8dVXmPStplbZuW3DrSFH3DP4pC0uqelRO7n3YW6
	tq1Ov1rc+upIKt0AdathnnN6FC6p7Y9GhdESTGFsICVKo4jaHOdk0vszdh6ZiEgnszPGqkmJx2Qsu
	pvjtQp1z/yTYBDzcdVap0ZAe6x2ZE8o6LTUlTrtV39IEcQ8ONb0Sqxz67p7EjaRlmBxBnntt1LCQp
	xq+unNrQLmnG9ZzNTltIG3dsEHdP6MkyY+PWMy+274Swf8eoQijRBX5StF3U4BRVSBY1FjYVU4FeX
	k32cqOmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbEi8-00000004mqF-0bOm;
	Sat, 17 Feb 2024 07:02:08 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbEi5-00000004mpI-2Yiz
	for linux-mediatek@lists.infradead.org;
	Sat, 17 Feb 2024 07:02:06 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a3566c0309fso333266666b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Feb 2024 23:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708153323; x=1708758123; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hs1VlpZsxeC5GOLK06WGcIjDrl11J8nbAUzkDUfDeRs=;
        b=C+S7KGJG34c0qMsw92QKOfZCmf5ceHwkkVf/MpguhddQE/aeNOO92pgCPPM1yw3keH
         jh9GKCik5Pa2XlaVw6cE/T96ek0HZqcGvm4Ngf7dum/XNnrB5pNJVvWyXgUNkFlQE0v3
         d6sH7NAumh61UlaXFYRFhANYz6zV8pQFMiNVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708153323; x=1708758123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hs1VlpZsxeC5GOLK06WGcIjDrl11J8nbAUzkDUfDeRs=;
        b=MMmiyHVGsmj7rGHWCyun5qfpurJhcSULxvRNaMgC0G0FgLQDa0FQWJ3kPJGTiB4v0+
         JZAUZDp6Pp3jB7CqyGBWb0YmvugU4W9xzVOvbbpMxHC5k1yjIDV26BWFM6J+jhBkQccq
         QJQnU8bZtACjruM6VSxRScOkIi49I42OW7bcGsPfrDiXRVZC6VqfuYvQwNxTOF8vao+E
         2jJaeUrguw2cUTmDmgCafNnIjGSaFKvVnmVtX5wClSGAcDmVIaTfUvPJu6htYhSB80xf
         BiscjJ+UuIBhYXdqwbaQ3I9qZyh/wMvWj6WnIRl6B7dweXz43GKNuGQOeF9W09b6V8xh
         667w==
X-Forwarded-Encrypted: i=1; AJvYcCVCzFrba6ILaNhpSZxf1Csnc/G3NFNY7B4n3w1+/3KZRgv2MvBkx5ya99Amb+A/wgwYPmUELNPdhrj5ELF1oCNzJElnssNPjxlKsb90j3ZAv1F6
X-Gm-Message-State: AOJu0Yz8aC7uqt4yZa6iyMjt9HcROfADy99ag7LIgXzuGdrnfAZ4GgoA
	ZBClWmtVfF6YqNyuhBRoArG/n1dBfvGpY6R9V7amLtC0B7hfkKv4kYiFNk03ntH0yFYWW9ZgmEY
	=
X-Google-Smtp-Source: AGHT+IFELzMFLx+1zc3T7xy28mpngVcPWhy5rKKRWdAoTXsL+tuw47Xi1UxFuoSi9M1RqDhYrka6KA==
X-Received: by 2002:a17:906:2514:b0:a3d:2024:5738 with SMTP id i20-20020a170906251400b00a3d20245738mr5246711ejb.30.1708153322913;
        Fri, 16 Feb 2024 23:02:02 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id m5-20020a1709061ec500b00a3d669a2055sm715152ejj.88.2024.02.16.23.02.02
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 23:02:02 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3566c0309fso333264066b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Feb 2024 23:02:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9hlsPmXTkX/vjqKISM5uHT2zLUASwC9Zxj4va1OK/+jhU0i4S3qi0K1D7Uue6w/qhSQa9nClYZ6RtP9/Fw40XKeUp9XsQ9QksOZByd62ufGbi
X-Received: by 2002:a17:906:c2d7:b0:a3c:9bc7:7a0e with SMTP id
 ch23-20020a170906c2d700b00a3c9bc77a0emr4749372ejb.9.1708153321660; Fri, 16
 Feb 2024 23:02:01 -0800 (PST)
MIME-Version: 1.0
References: <20240124-send-upstream-v3-1-5097c9862a73@chromium.org>
 <786c85c7-7b38-4a2a-85ec-282196de7b5e@collabora.com> <CAHc4DNKXOb54v7qJZJ2EsVP1KkMq7WnSJJLWhb2SzuhW_=qnxQ@mail.gmail.com>
In-Reply-To: <CAHc4DNKXOb54v7qJZJ2EsVP1KkMq7WnSJJLWhb2SzuhW_=qnxQ@mail.gmail.com>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Sat, 17 Feb 2024 15:01:25 +0800
X-Gmail-Original-Message-ID: <CAHc4DNKSj5MK5Pfi5DYm9hUqh=uxUs4S3uakqfht-3O18vgLTA@mail.gmail.com>
Message-ID: <CAHc4DNKSj5MK5Pfi5DYm9hUqh=uxUs4S3uakqfht-3O18vgLTA@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: mt8195-cherry-tomato: change watchdog
 reset boot flow
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_230205_703161_1343A69A 
X-CRM114-Status: GOOD (  23.20  )
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

Hello AngeloGioacchino,

I noticed that this patch does not seem to have been landed yet.
Please let me know if there are any issues.

Thank you,
Hsin-Te


On Wed, Jan 24, 2024 at 5:04=E2=80=AFPM Hsin-Te Yuan <yuanhsinte@chromium.o=
rg> wrote:
>
> Hi AngeloGioacchino,
>
> This bug can be triggered by stopping watchdog daemon and running
> `sleep 60 > /dev/watchdog`.
>
> Regards,
> Hsin-Te
>
>
>
> On Wed, Jan 24, 2024 at 4:27=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 24/01/24 08:51, Hsin-Te Yuan ha scritto:
> > > From: Hsin-Te Yuan <yuanhsinte@google.com>
> > >
> > > The external output reset signal was originally disabled and sent fro=
m
> > > firmware. However, an unfixed bug in the firmware on tomato prevents
> > > the signal from being sent, causing the device to fail to boot. To fi=
x
> > > this, enable external output reset signal to allow the device to rebo=
ot
> > > normally.
> > >
> > > Fixes: 5eb2e303ec6b ("arm64: dts: mediatek: Introduce MT8195 Cherry p=
latform's Tomato")
> > > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> >
> > Can't trigger the bug, but also this commit gives no side effects, so:
> >
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> >
> >
> > > ---
> > > Changes in v3:
> > > - Add Fixes tag
> > >
> > > Changes in v2:
> > > - Limit the effect only on tomato.
> > > ---
> > >   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts | 4 ++++
> > >   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts | 4 ++++
> > >   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts | 4 ++++
> > >   3 files changed, 12 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts=
 b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> > > index 2d5e8f371b6de..a82d716f10d44 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> > > @@ -23,3 +23,7 @@ &sound {
> > >   &ts_10 {
> > >       status =3D "okay";
> > >   };
> > > +
> > > +&watchdog {
> > > +     /delete-property/ mediatek,disable-extrst;
> > > +};
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts=
 b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> > > index 2586c32ce6e6f..2fe20e0dad836 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
> > > @@ -43,3 +43,7 @@ &sound {
> > >   &ts_10 {
> > >       status =3D "okay";
> > >   };
> > > +
> > > +&watchdog {
> > > +     /delete-property/ mediatek,disable-extrst;
> > > +};
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts=
 b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
> > > index f54f9477b99da..dd294ca98194c 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
> > > @@ -44,3 +44,7 @@ &sound {
> > >   &ts_10 {
> > >       status =3D "okay";
> > >   };
> > > +
> > > +&watchdog {
> > > +     /delete-property/ mediatek,disable-extrst;
> > > +};
> > >
> > > ---
> > > base-commit: 64b50fcb03649ca7f0d762a50e7a3484cfc1d586
> > > change-id: 20230818-send-upstream-e91e615a893c
> > >
> > > Best regards,
> >

