Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A78DCEF148
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 10:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNsu9nK1jAUO1Ldt/+9/ISvxpOMLIyS2jgvXo4aXxhQ=; b=eAVsQNWSUJo5hhvdot8Kt9D8tr
	wVZjpORr4nACkSTflfiVeU43qhGj49IC+jao3k99TUU5Z5KdKnLGEqHBuUhWs+F82mma+NP0d7wZO
	Ci3WYgVn8+s9YnlKh9S/ryk3mW/z434sMwRBeCc+OvdNJG6R9VPJ59/b/jyFQ4zS/t5wQNAAAiszx
	GMNnTh8/jr1/QQqBHt2ca9dBvUZg0Q4OCEmJPWY+6sI2fc1A0Ec8/VemE7spK+aB2MkT8hECLn4a2
	BMmHvZOWpYnlhFrXipRFgr8N10If8JTTNugQhyfXxHxOo3RlUYlO15p9NweVFVNM8RufFyJ/4pEp5
	c1IYbUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy7G4-00000005QSS-0cR6;
	Tue, 08 Oct 2024 10:16:00 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy7Ek-00000005QHF-3OfN
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 10:14:40 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53988c54ec8so6231340e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Oct 2024 03:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728382477; x=1728987277; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNsu9nK1jAUO1Ldt/+9/ISvxpOMLIyS2jgvXo4aXxhQ=;
        b=kxucALko5o86oXcYet0z5bQcm0dAj58qWA6EjCBMe10Dz7NARYSB7uLUX/1b4twWGt
         QChc92/hK9cJ3FEn0yfobYnhFGDP4p8+kABKvOzr1Wmo8dLpkxaI7tLtq2zsMfis3JAg
         Ee0eOXIibRDk+/1wu4fm+a58ZB0gVHQj10AyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728382477; x=1728987277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNsu9nK1jAUO1Ldt/+9/ISvxpOMLIyS2jgvXo4aXxhQ=;
        b=d/1aRodCbyPe2xRaBwKi5UZ0LBfbT79VKPQRaB+AeK4sR4aX+UTHcGUJamnto+ph+m
         Xm2GHnNYFtmUjtLYLF4EH1gvizSCJTgS55c4hyR2TVxa0yzOMVzEXMurFj3U29R60bn8
         lcabBwASWf38VAKMzcKxZLXuGj82NP+u7B8nnPu9QU++fXrPLO+o9C4X/4fwIbAxf9l0
         jKfwtPTmtkldb/SSUSpTZ33UdEmp7tSarG1gsebJQbYFoM8HXr07YelVhG/tQ+B2TVuv
         W7oRRamQGb7z7+QKzK16Vzeqvr57EPDIvZ/sLamqTMG8tkZflAJFa7P1QGSAH71MPkXQ
         KGtg==
X-Forwarded-Encrypted: i=1; AJvYcCXn10IbEo2cv9V0F1siMW9ke5y0+aEb+b3q7gSG301V/lXVdcCvAhiag88AHfuTTJDzm90R2fU31Wfb4u9iNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSa9lZYikBhI7Kcc8OUNbgDhPdPz/8Zi79rl4sDzpHbj1CQ5HO
	hBfRnC/cbznYz+E6nOiotGeYtCfOVZokDCrwVrbxrZ1EPmXa5SAvWci5tt7E5s51isGo/LYdoqk
	UwSu1sxYsC/0kJUMrC0ueIlp4E3K+xTlr90PV
X-Google-Smtp-Source: AGHT+IGF9lC0snzvw5z5AN3DUk1MeiK5PHXImnz7s9F0EqPgF1mS/GGKJJ2oiGoWdynH8LJtt2a8fXMLMXD7PTKHv8s=
X-Received: by 2002:a05:6512:2204:b0:539:896e:46c0 with SMTP id
 2adb3069b0e04-539ab9eaddfmr7534098e87.37.1728382476550; Tue, 08 Oct 2024
 03:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20241008082200.4002798-1-wenst@chromium.org> <7caa85fa-7186-4f8f-8195-19325ebf06bd@collabora.com>
In-Reply-To: <7caa85fa-7186-4f8f-8195-19325ebf06bd@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Oct 2024 18:14:25 +0800
Message-ID: <CAGXv+5FgPOh4kNdrG1uN-NOWEpC5rXvsr0egTsgOw+v_E3vdRg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186-corsola-voltorb: Merge
 speaker codec nodes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_031438_856792_DB3A0EB1 
X-CRM114-Status: GOOD (  22.63  )
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

On Tue, Oct 8, 2024 at 4:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 08/10/24 10:21, Chen-Yu Tsai ha scritto:
> > The Voltorb device uses a speaker codec different from the original
> > Corsola device. When the Voltorb device tree was first added, the new
> > codec was added as a separate node when it should have just replaced th=
e
> > existing one.
> >
> > Merge the two nodes. The only differences are the compatible string and
> > the GPIO line property name. This keeps the device node path for the
> > speaker codec the same across the MT8186 Chromebook line.
>
> Ok, I agree...
>
> But, at this point, can we rename `rt1019p` to `speaker_codec` instead?
>
> Imo, that makes a bit more sense as a phandle, as it reads generic and it=
's not
> screaming "I'm RT1019P" on dts(i) files where it's actually not.

Works for me.

> >
> > Fixes: 321ad586e607 ("arm64: dts: mediatek: Add MT8186 Voltorb Chromebo=
oks")
>  > Cc: <stable@vger.kernel.org>
>
> Well, that's not a fix - it's an improvement, so we can avoid this Fixes =
tag :-)

I'd like to see it backported though, so we minimize the different DTS file=
s.
Guess I'll add Cc stable instead? Not sure if that works without a Fixes ta=
g.

ChenYu

> Cheers,
> Angelo
>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   .../dts/mediatek/mt8186-corsola-voltorb.dtsi  | 19 ++++--------------=
-
> >   1 file changed, 4 insertions(+), 15 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi b=
/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
> > index 52ec58128d56..fbcd97069df9 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
> > @@ -10,12 +10,6 @@
> >
> >   / {
> >       chassis-type =3D "laptop";
> > -
> > -     max98360a: max98360a {
> > -             compatible =3D "maxim,max98360a";
> > -             sdmode-gpios =3D <&pio 150 GPIO_ACTIVE_HIGH>;
> > -             #sound-dai-cells =3D <0>;
> > -     };
> >   };
> >
> >   &cpu6 {
> > @@ -59,19 +53,14 @@ &cluster1_opp_15 {
> >       opp-hz =3D /bits/ 64 <2200000000>;
> >   };
> >
> > -&rt1019p{
> > -     status =3D "disabled";
> > +&rt1019p {
> > +     compatible =3D "maxim,max98360a";
> > +     sdmode-gpios =3D <&pio 150 GPIO_ACTIVE_HIGH>;
> > +     /delete-property/ sdb-gpios;
> >   };
> >
> >   &sound {
> >       compatible =3D "mediatek,mt8186-mt6366-rt5682s-max98360-sound";
> > -     status =3D "okay";
> > -
> > -     spk-hdmi-playback-dai-link {
> > -             codec {
> > -                     sound-dai =3D <&it6505dptx>, <&max98360a>;
> > -             };
> > -     };
> >   };
> >
> >   &spmi {
>

