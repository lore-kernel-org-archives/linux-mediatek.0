Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D361C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 06:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAGj1lKGN9zHdLIAaa+8k2WGvGRtgT1Nau/Jlmhp4JI=; b=e37WhW6DmbLjrD2W/81bvYnTsp
	6PyFYfnNBhPI2FJMuu7N+wGtlJQ2wLx+RlOKC7PCdwahAvtnuOcyzAtnxgYhKp9aN+p8gD35mGx8e
	by5Yhk4baIXG5i0IyBkO2yS4P3mVsuHmiZ6wUFUO3YEzuhGx06vw/A7jQ/fQ5DMJLg2zuNqTp2QuV
	5QedZb0++znoRcvDIFn69oZqPpbB5E4WOs8T5oWfQVgoZ81e8ZPH7yUGOFA0lgkez8I5CThCSSTm/
	LdShfdQHK/Br90ecxHP83PdtElb1V2RY2aBqvSwY6vEF0oNvyTtO/FSgn3ZglwVLu/u67UC0SXETg
	t0KgKszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okg5w-003FmU-UG; Tue, 18 Oct 2022 06:28:56 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okg5u-003Fl0-AM
	for linux-mediatek@lists.infradead.org; Tue, 18 Oct 2022 06:28:55 +0000
Received: by mail-ua1-x930.google.com with SMTP id p89so5174604uap.12
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Oct 2022 23:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAGj1lKGN9zHdLIAaa+8k2WGvGRtgT1Nau/Jlmhp4JI=;
        b=PI5cJjdk125nNbORefNwPn3dHrb2DtMqrwV5OXfVD43plQbvrx5fUPudwMhDnjNrfg
         G9EppTZJ3Q1Y9WAJGE4DwwxHkn5xuZmObKFVPgks31eGfJlhD9u9Ay9cO6i7deDNmBgQ
         ja1HckyzidsXZaj/5AfHUDtw0laL4iGuEQuqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAGj1lKGN9zHdLIAaa+8k2WGvGRtgT1Nau/Jlmhp4JI=;
        b=O0+cxGmMlD0zZK9BQR7I0Nf2lisjAINbumUIOabk4ltLTbqik+858nNmE9GSyXoTeW
         71S7Gd97Q+XZ6cMsatSpOBYurhmDh+EvBWl23O+a1SFfSDR5x0bXb2MLpSTgsBj6F4J4
         qmVxdC4VtThH2O6tsXqcfjtMdJ9dVIuG+3x9Vd2q+V0fGvcoUdF7a2CczTRgoZGZIoVL
         77Yo0m9+nD3IVFLEIOao05y/XH0gqOH0uNcVafj3WKKuAut1mR2NGa8BrlNTYdmdHFNQ
         55+bj92w9j1pTO+8tEzipo2DNaElcbsHbh18nXYE+iYScHYz5fTLkxFhR+vpMc+dFH3U
         OQIw==
X-Gm-Message-State: ACrzQf2/w1Hd+jlVVOB8rrxR7PHBAMtp7uNfFyjAWyqec0BOhZm6GYS8
	4ScRQsijrqt4MXmT9nhao5r3co6uqrVeH5EE1iCmbA==
X-Google-Smtp-Source: AMsMyM4J1/pYS6uRKCnZ0z/WETNX/uPZ1lRyX+7KVLa0Zu3m64DyjaaSm7FddeBarCnYjlNrz5KH/F9aLYq9wS3rt6E=
X-Received: by 2002:ab0:38c5:0:b0:383:eed8:dd45 with SMTP id
 l5-20020ab038c5000000b00383eed8dd45mr785773uaw.11.1666074532048; Mon, 17 Oct
 2022 23:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221006212528.103790-1-nfraprado@collabora.com>
 <20221006212528.103790-6-nfraprado@collabora.com> <CAGXv+5GmJOYnfLsovO_+piuJ1ry1R0ZQqALRGK3MNp=nUO-TNw@mail.gmail.com>
 <CAGXv+5HGodRWbawEpDppZWM_EiuzdvZC9h4XBoAPo=FQ7yNotA@mail.gmail.com> <20221013202438.unfa4fqinwhgvfiz@notapiano>
In-Reply-To: <20221013202438.unfa4fqinwhgvfiz@notapiano>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 18 Oct 2022 14:28:40 +0800
Message-ID: <CAGXv+5HHMuFgrKge8dd+yoH8Vo1_k8nG=QUD3GDrUKnAMeh1+w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: mediatek: asurada: Add aliases for i2c
 and mmc
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_232854_415911_4132F3F1 
X-CRM114-Status: GOOD (  27.86  )
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

On Fri, Oct 14, 2022 at 4:24 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Fri, Oct 07, 2022 at 12:02:03PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Oct 7, 2022 at 11:51 AM Chen-Yu Tsai <wenst@chromium.org> wrote=
:
> > >
> > > On Fri, Oct 7, 2022 at 5:25 AM N=C3=ADcolas F. R. A. Prado
> > > <nfraprado@collabora.com> wrote:
> > > >
> > > > Add aliases for the i2c and mmc nodes on the Asurada platform DT to
> > > > ensure that we get stable ids for those devices on userspace.
> > > >
> > > > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com=
>
> > > >
> > > > ---
> > > >
> > > > Changes in v2:
> > > > - Added this commit
> > > >
> > > >  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 12 ++++++++++++
> > > >  1 file changed, 12 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > > > index dac2d4f5e670..758ca42a6156 100644
> > > > --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > > > +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > > > @@ -11,6 +11,18 @@
> > > >
> > > >  / {
> > > >         aliases {
> > > > +               i2c0 =3D &i2c0;
> > > > +               i2c1 =3D &i2c1;
> > > > +               i2c2 =3D &i2c2;
> > > > +               i2c3 =3D &i2c3;
> > > > +               i2c4 =3D &i2c4;
> > > > +               i2c5 =3D &i2c5;
> > > > +               i2c6 =3D &i2c6;
> > > > +               i2c7 =3D &i2c7;
> > > > +               i2c8 =3D &i2c8;
> > > > +               i2c9 =3D &i2c9;
> > >
> > > You should only add aliases for interfaces that are actually enabled.
>
> Ok, will drop the extra ones.
>
> > >
> > > Also, I think we can disable i2c6. None of the current products use i=
t.
>
> It's already disabled upstream.
>
> > >
> > > ChenYu
> > >
> > > > +               mmc0 =3D &mmc0;
> > > > +               mmc1 =3D &mmc1;
> >
> > Also, Spherion does not have an SD card slot. It might be better to mov=
e
> > the mmc aliases to the end .dts files.
>
> Based on the downstream dts, rev0 and rev1 do have SD card slot (or at le=
ast the
> mmc1 controller isn't disabled on those). However upstream we have a sing=
le dts
> (asurada-spherion-r0) shared by those two and rev2 and rev3 (which don't =
have
> the SD card slot), given that this way we can have a single dts and there=
's no
> disadvantage to keeping the mmc1 node enabled because the CD IRQ will nev=
er be
> triggered. With this in mind, I think it makes more sense to keep the mmc
> aliases in the asurada dtsi, as there's no harm in having them, and will =
ensure
> fixed ids for the rev0 and rev1 spherion boards.

Sounds good to me.

ChenYu

