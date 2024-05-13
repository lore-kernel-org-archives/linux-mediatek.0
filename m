Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C764C25B10
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 May 2024 14:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sK9xvJl9XrjIJPbZCGnymwZFnfbvziAIa+Da/Sad12w=; b=QsdbF7AdW4zCq95PT8aEpN3Prg
	2iTZeUumZ5JQMForhseLYdDKSrKiEFTlmv5VdXO/sI/DraLpx39nJtnH3wNwWiFNVUxZ1hMuO/4vC
	KaQ0KT5vItH9fvDL2JOCHQ78jLTaRUGG+ZF74uTZ5Lwd3V6etR9BGRLWUkz9N8Mj8ibNmRlbDmFd6
	GLdqvstGfP+v3Q07GlUXXnox3oFvfaY58epgvmpexA1F8linib6zs8vvMtfx3XnwTueOddK0Uq+P3
	ILinnr0rg3U0M4qt6tro8e8zo2Qzn91wZqqh25Y0tujskQWrjMMBeah/0FbAWGbCXeN52DqXSd8f8
	BILlvqbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Wcu-0000000DBSq-3Qan;
	Mon, 13 May 2024 14:26:04 +0000
Received: from mail-il1-f174.google.com ([209.85.166.174])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Wcq-0000000DBR0-3Lzc;
	Mon, 13 May 2024 14:26:02 +0000
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-36c809db200so19824715ab.3;
        Mon, 13 May 2024 07:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715610358; x=1716215158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sK9xvJl9XrjIJPbZCGnymwZFnfbvziAIa+Da/Sad12w=;
        b=pQYPcT4mvhaxkPMixTDuxlvFyUP0viRQpYT5MR9QuK3/Ik7Z4sDiR4UYiqv1KCZCDy
         uGn1hO1UR6PVudFqyUDyUqRmJcY1MTg3IjjTZ+AOBOsiW/nu5ItepHvVqIBEDWeOeGAh
         5OLHSBc8cGVL7fyHL7lNA3Q7nCy6IW2QF5hZbtngIIQomPvELTc2D3phQDb3/UnTiZCm
         +1jYBk2G/JnVRr3cPb7fD53dvH4wrVbZaDgb8dDYH9XLAbjp4EqLiDLcg6VMeXcy4G0Q
         PsQBTF3ldBxB/NWwqKx6gAZMkRf+E770o+YSxEsoduP2L5Zd8jRUhrjldbequZ3p/7Ci
         tkFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCqJno3QgqnTdYTShjhsywHoOY87zYFhxWabX/rAupaiZNhJTXDcfuZHGP4lQqfEllm2kqy6f8uEV+VgGLGZxkjAmqi5rbjAENxOBs0UWih++otmHKDsLnqHbOd5EVpweCFl9zZE7X/LoYhv6TxIFmf3zONWKP5E0=
X-Gm-Message-State: AOJu0YyCwgVG0gC6yK/hCOhHFoZpU/cbK9KpCAsNN9jgN06hTLZ3xQod
	fmGH4rv++yWZs5lTeS0y3HJya89ZmR9ZcUWr8CSeOfwBtwYN1JRuVeEcohLoDCokU5zoz/2acMD
	trdC+1amk/EX8CBtN0SI0VxrO+7U=
X-Google-Smtp-Source: AGHT+IFyOfQnbA9ms39YA3JnidYP9+rIgusb4dXRdT9AsrFWsuAAy/tDhx5o7DbKhUv0mKkeQIsYNZzXtRA/E0XxIpU=
X-Received: by 2002:a05:6e02:1c84:b0:36c:f0b:4f54 with SMTP id
 e9e14a558f8ab-36cc14e788cmr123202195ab.21.1715610357786; Mon, 13 May 2024
 07:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org> <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain> <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
 <fe95e3c3a89de4566a4eb53ca8b26c25@manjaro.org> <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
In-Reply-To: <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
From: Michael Ira Krufky <mkrufky@linuxtv.org>
Date: Mon, 13 May 2024 10:25:46 -0400
Message-ID: <CAOcJUbwJkbEG6+u==de7CzXDUPGj6J3-p-7E3o+iAzjgSgybSg@mail.gmail.com>
Subject: Re: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range
 of z explicit.
To: Ricardo Ribalda <ribalda@chromium.org>
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
X-CRM114-CacheID: sfid-20240513_072600_869724_12B8A719 
X-CRM114-Status: GOOD (  42.63  )
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

On Mon, May 13, 2024 at 9:38=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> On Fri, 3 May 2024 at 16:08, Dragan Simic <dsimic@manjaro.org> wrote:
> >
> > Hello Ricardo,
> >
> > On 2024-05-03 13:56, Ricardo Ribalda wrote:
> > > I am trying to get the DS, but
> > > https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf is =
a
> > > dead links now.
> > >
> > > Anyone have access to the datasheet?
> >
> > It's kind of available on the link below, but for some strange reason
> > the download fails after downloading the first 128 KB or so.
> >
> > https://web.archive.org/web/20080907185532/https://www.nxp.com/acrobat_=
download/literature/9397/75015931.pdf\
>
> Mike, by any chance do you have a copy of the DS?
>
>
> >
> >
> > > On Fri, 3 May 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org>
> > > wrote:
> > >>
> > >> On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wrot=
e:
> > >> > Em Mon, 29 Apr 2024 15:05:05 +0000
> > >> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> > >> >
> > >> > > We do not expect the sample_freq to be over 613MHz.
> > >> > >
> > >> > > Found by cocci:
> > >> > > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div(=
) does a 64-by-32 division, please consider using div64_u64 instead.
> > >> > >
> > >> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >> > > ---
> > >> > >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> > >> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >> > >
> > >> > > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/me=
dia/dvb-frontends/tda10048.c
> > >> > > index 3e725cdcc66b..1886f733dbbf 100644
> > >> > > --- a/drivers/media/dvb-frontends/tda10048.c
> > >> > > +++ b/drivers/media/dvb-frontends/tda10048.c
> > >> > > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_fron=
tend *fe, u32 sample_freq_hz,
> > >> > >                          u32 bw)
> > >> > >  {
> > >> > >     struct tda10048_state *state =3D fe->demodulator_priv;
> > >> > > -   u64 t, z;
> > >> > > +   u32 z;
> > >> > > +   u64 t;
> > >> > >
> > >> > >     dprintk(1, "%s()\n", __func__);
> > >> > >
> > >> > > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_fron=
tend *fe, u32 sample_freq_hz,
> > >> > >     /* t *=3D 2147483648 on 32bit platforms */
> > >> > >     t *=3D (2048 * 1024);
> > >> > >     t *=3D 1024;
> > >> > > +   /* Sample frequency is under 613MHz */
> > >> >
> > >> > Are you sure about that? Some DVB devices have very high frequency
> > >> > clocks, specially if they're also used for satellite, so I can't
> > >> > be sure by just looking at the driver's code.
> > >> >
> > >> > Also, we had already a bunch of regressions with "fixes" like this
> > >> > that actually broke frontend drivers.
> > >>
> > >> This patch preserves the existing behavior. The sample_freq_hz
> > >> variable
> > >> is a u32 so, in the original code, z couldn't have been more than
> > >> U32_MAX even though it was declared as a u64.
>
>
> I agree with Dan, we keep the existing behaviour. So it wont hurt to
> merge the code...
>
> All  that said, if someone has access to the DS, I do not mind reviewing =
it.
>
>
> > >>
> > >> It's possible that the original code was wrong.  We have seen that i=
n
> > >> other places in this patchset.  Adding a note about the datasheet is
> > >> also a good idea.
> > >>
> > >> regards,
> > >> dan carpenter
> > >>
>
>
>
> --
> Ricardo Ribalda
>

Nice to hear from you!  :-)

I believe that I may have a copy of it on an old "spinny" hard drive
somewhere in one of the ancient desktop computers I have lining my
basement walls, lol.  It will take me some time to locate it.  I hope
this isn't urgent o:-)

...It so happens that the dev box I used when I worked on that driver
is up right now, but the datasheet isn't in my home directory.  There
are two other drives in the chassis but not connected / powered - I'll
give these a look and let you know if I find anything.

Best,
Michael Krufky

