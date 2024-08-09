Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F052C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Aug 2024 08:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UOjCAID+UZ2tEQeZhluoBp+qMsVXiycrhYlTzLnVcU=; b=qU95zmt+XiiqndWYoTr/i67Myu
	ZmNsZm1b8uPlUkCIK6XcYx30M/vs1RPlW2wePSZkhRkuVNGYoIviyQo6fFeg9iTLle+Odxeuh5TRQ
	p6BvIgkLJkcl8gb0srVr04X0HZpGRQ0KLM2UF3/v6vgH4noXi6LudoJgSR9GEH17/Io1PpW8B8rS5
	xtp5IzcnYhlnxIf9fLjLbX/D2kWBvdmQsR6fQcHZlbk8/nAxMm8B5djQwb/fYI85xnehm//qWYPK7
	9+PN4BwtDa/jGe6PmYw8fXj064J1ALfV8kC7Q//D6Cn2t0bHWimOmqpH2/BhW3N1bov49QjsJaCJ5
	WAdlt38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scKhf-0000000Ae5I-3C8W;
	Fri, 09 Aug 2024 08:10:27 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scKhc-0000000Ae4m-2hLr
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Aug 2024 08:10:26 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a7aa4bf4d1eso221595166b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Aug 2024 01:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723191023; x=1723795823; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UOjCAID+UZ2tEQeZhluoBp+qMsVXiycrhYlTzLnVcU=;
        b=aIVXu+KAK8csNs0+sNABmINtkrTATqAp/l9+7WNVhYDwxyb6RIOIEpKjROBSW539aX
         2w+Yp23m2AYJBXJnw7CuhKL/wZDauYXFKXb/nN5FI+FkuT0XlpE+Jah5rTrCeqpo3TQX
         R7nOjSQpGv6cb/aFw+4Gap/WxnmgX0XXwsnWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723191023; x=1723795823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UOjCAID+UZ2tEQeZhluoBp+qMsVXiycrhYlTzLnVcU=;
        b=DckL9Pt3SAPGNCtN50QvTSgUMhKpABd4F13zILeckZ/3mh6TmmJ7k9awEe4wAZ3Yhk
         OJbkhXDpZiBe09yX+y2h6bHmlgP1gdrYxiqRUKrhD/A03wEQ+vk6mxPLA18yY38K5mRi
         fcHVEYoKhrUofCg9scyYlWnbi2hCQWVEhEQcY+6D+h+iOVfs9QXjUGV0qFN0idKmrHBQ
         hViRd9oKQtY6t0KlM9lurm1t6XE1BQ8krEge/fiPx7qPtuIidS+FRjQ8OJ1h40cj7Xo4
         OzvjmYglDNaAXU+ADVJa2lrrziCd+j78fLgRaP4wE7smI9YwMZp9qcH/yvHlc9Yiq4T/
         RUYg==
X-Forwarded-Encrypted: i=1; AJvYcCV5vc+zSiltlUupAMqj58Gfb84NjZhJSiegpAAzv4hq02ex2a66mzR+ORLPqKnMO5oOPUqFxsHiMN5ru7cnOIY6Ua7v7Yv99H3JDYUUC8a9Q6GL
X-Gm-Message-State: AOJu0Yy65/+SjExWnSyUcidperSqk2hCg67PAaKlp7GyEkk+vUAQ3TBH
	6VV2N6fpdrqkEox0w8391zzI1xMTUzX0WT/sIu1V+7Llz/3q3qHG6NOVm7yzaCMgSMR/iIAUdW4
	R13Kr
X-Google-Smtp-Source: AGHT+IFVg0GpbUq3VSGUL2VMDMT44LYNeouZJ5d+z5J7NquPQVxI0ra0OmgDIczHhDXfCWTWDYnSHg==
X-Received: by 2002:a17:907:7f17:b0:a7d:9d6f:2b97 with SMTP id a640c23a62f3a-a80aa67b107mr64599366b.48.1723191022586;
        Fri, 09 Aug 2024 01:10:22 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7de2e1b093sm707250366b.148.2024.08.09.01.10.21
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 01:10:22 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ba43b433beso2030782a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Aug 2024 01:10:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpIppZPjLK3PJNg9hbLNTGzHXTWw40BZ6D+H6x1cL5CNP308MXJ0SJY8vlGsRJTgHI0Isl3EJPXafq3lwlZfheSAUSWLYMJMzMQXE+kfEUwbUK
X-Received: by 2002:a05:6512:3e1c:b0:530:adfe:8607 with SMTP id
 2adb3069b0e04-530ee9f3594mr770871e87.51.1723190567467; Fri, 09 Aug 2024
 01:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org> <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain> <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
 <fe95e3c3a89de4566a4eb53ca8b26c25@manjaro.org> <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
 <CAOcJUbwJkbEG6+u==de7CzXDUPGj6J3-p-7E3o+iAzjgSgybSg@mail.gmail.com>
In-Reply-To: <CAOcJUbwJkbEG6+u==de7CzXDUPGj6J3-p-7E3o+iAzjgSgybSg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 9 Aug 2024 10:02:35 +0200
X-Gmail-Original-Message-ID: <CANiDSCt=HOKwAT2zBg1tTbGbD-U-2K8+hi5WbdCM9ULWJvZ_Lw@mail.gmail.com>
Message-ID: <CANiDSCt=HOKwAT2zBg1tTbGbD-U-2K8+hi5WbdCM9ULWJvZ_Lw@mail.gmail.com>
Subject: Re: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range
 of z explicit.
To: Michael Ira Krufky <mkrufky@linuxtv.org>
Cc: Dragan Simic <dsimic@manjaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_011024_699710_E16C51D2 
X-CRM114-Status: GOOD (  46.90  )
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

Hi

It does not seem that we will find the datasheet.

Any objection to land the patch as it? It is as incorrect as the
original code ;)

Regards!

On Mon, 13 May 2024 at 16:26, Michael Ira Krufky <mkrufky@linuxtv.org> wrot=
e:
>
> On Mon, May 13, 2024 at 9:38=E2=80=AFAM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > On Fri, 3 May 2024 at 16:08, Dragan Simic <dsimic@manjaro.org> wrote:
> > >
> > > Hello Ricardo,
> > >
> > > On 2024-05-03 13:56, Ricardo Ribalda wrote:
> > > > I am trying to get the DS, but
> > > > https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf i=
s a
> > > > dead links now.
> > > >
> > > > Anyone have access to the datasheet?
> > >
> > > It's kind of available on the link below, but for some strange reason
> > > the download fails after downloading the first 128 KB or so.
> > >
> > > https://web.archive.org/web/20080907185532/https://www.nxp.com/acroba=
t_download/literature/9397/75015931.pdf\
> >
> > Mike, by any chance do you have a copy of the DS?
> >
> >
> > >
> > >
> > > > On Fri, 3 May 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.or=
g>
> > > > wrote:
> > > >>
> > > >> On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wr=
ote:
> > > >> > Em Mon, 29 Apr 2024 15:05:05 +0000
> > > >> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> > > >> >
> > > >> > > We do not expect the sample_freq to be over 613MHz.
> > > >> > >
> > > >> > > Found by cocci:
> > > >> > > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_di=
v() does a 64-by-32 division, please consider using div64_u64 instead.
> > > >> > >
> > > >> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > >> > > ---
> > > >> > >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> > > >> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >> > >
> > > >> > > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/=
media/dvb-frontends/tda10048.c
> > > >> > > index 3e725cdcc66b..1886f733dbbf 100644
> > > >> > > --- a/drivers/media/dvb-frontends/tda10048.c
> > > >> > > +++ b/drivers/media/dvb-frontends/tda10048.c
> > > >> > > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_fr=
ontend *fe, u32 sample_freq_hz,
> > > >> > >                          u32 bw)
> > > >> > >  {
> > > >> > >     struct tda10048_state *state =3D fe->demodulator_priv;
> > > >> > > -   u64 t, z;
> > > >> > > +   u32 z;
> > > >> > > +   u64 t;
> > > >> > >
> > > >> > >     dprintk(1, "%s()\n", __func__);
> > > >> > >
> > > >> > > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_fr=
ontend *fe, u32 sample_freq_hz,
> > > >> > >     /* t *=3D 2147483648 on 32bit platforms */
> > > >> > >     t *=3D (2048 * 1024);
> > > >> > >     t *=3D 1024;
> > > >> > > +   /* Sample frequency is under 613MHz */
> > > >> >
> > > >> > Are you sure about that? Some DVB devices have very high frequen=
cy
> > > >> > clocks, specially if they're also used for satellite, so I can't
> > > >> > be sure by just looking at the driver's code.
> > > >> >
> > > >> > Also, we had already a bunch of regressions with "fixes" like th=
is
> > > >> > that actually broke frontend drivers.
> > > >>
> > > >> This patch preserves the existing behavior. The sample_freq_hz
> > > >> variable
> > > >> is a u32 so, in the original code, z couldn't have been more than
> > > >> U32_MAX even though it was declared as a u64.
> >
> >
> > I agree with Dan, we keep the existing behaviour. So it wont hurt to
> > merge the code...
> >
> > All  that said, if someone has access to the DS, I do not mind reviewin=
g it.
> >
> >
> > > >>
> > > >> It's possible that the original code was wrong.  We have seen that=
 in
> > > >> other places in this patchset.  Adding a note about the datasheet =
is
> > > >> also a good idea.
> > > >>
> > > >> regards,
> > > >> dan carpenter
> > > >>
> >
> >
> >
> > --
> > Ricardo Ribalda
> >
>
> Nice to hear from you!  :-)
>
> I believe that I may have a copy of it on an old "spinny" hard drive
> somewhere in one of the ancient desktop computers I have lining my
> basement walls, lol.  It will take me some time to locate it.  I hope
> this isn't urgent o:-)
>
> ...It so happens that the dev box I used when I worked on that driver
> is up right now, but the datasheet isn't in my home directory.  There
> are two other drives in the chassis but not connected / powered - I'll
> give these a look and let you know if I find anything.
>
> Best,
> Michael Krufky



--=20
Ricardo Ribalda

