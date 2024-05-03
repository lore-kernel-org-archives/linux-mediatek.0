Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EADC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 14:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3C+MgtjD5FFzr1H8ErTkKFFC7gX/7QwO2uuYNs38Akc=; b=oG0Ae4vsIHjYfuqFLKwms0NiiK
	Qq31cv+d4fQBOoXPKOz/NS6H7ewOVPqcVoYdjhh5wEjm5E/kO1DXGTo5aP1oFFtuzbsSGp84xMSUQ
	8LcGXbG/+Umqm3npWLlkgGmFeLiTnIW2GWfMGONR4JMVO8YksERtyyCDeyOZAolHdIVcYqOgd1bf1
	dkzEm+K2ptD02ijwEfkV8T0gnk4IW4sopkdnULCE6CDEehDUXmlVLxWXlGPX38J2Ldjgd6di34/bF
	Ge9ZAWNugD5qPM4e//d9tPrA9jPJA2C3ny0yp/ZGvRs0R1NKcSdSrU4lehVsKQ+lScE8G25nj6LR8
	S13st4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2tat-0000000GnEu-01qz;
	Fri, 03 May 2024 14:08:59 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2tan-0000000GnDG-3Uu9;
	Fri, 03 May 2024 14:08:57 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1714745331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3C+MgtjD5FFzr1H8ErTkKFFC7gX/7QwO2uuYNs38Akc=;
	b=mAarC0LY0zCqC2ZrO6f/B0kd24XVsuHukHHUkTxv8x6uP89ukwITU0O3Ynvicd1D1E9pAe
	IO3tmU10O6igCP8QZy19eeUc6Ld3IxJqvuNP1A5HBT6M5ThYS4BpN1w2gd1THv6O1jAK7/
	ezGJ5lRjzzWduiC7DpEa6et6y5QamPHTjx/cHxFoa92YbVL3l6ufWF1RIr8LLxjgxMNHq8
	xLmLl+oEm7sIthlsxDBs1Nx//ZO6J02vTNuOw0f8VgzJgXGDL/8MklHPqBILGlrXprDE9w
	hibkEuHJ/OUQOHG1dbrTz8I/N/GLzP9y5rNue5qKcnd9Fy1V2tSamIAR/DWm+g==
Date: Fri, 03 May 2024 16:08:48 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hugues Fruchet
 <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Sakari
 Ailus <sakari.ailus@linux.intel.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya
 Komatineni <skomatineni@nvidia.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans
 Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, Abylay Ospan
 <aospan@netup.ru>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry
 Osipenko <digetx@gmail.com>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Sylvain Petinot
 <sylvain.petinot@foss.st.com>, Stanimir Varbanov
 <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range
 of z explicit.
In-Reply-To: <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org>
 <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain>
 <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
Message-ID: <fe95e3c3a89de4566a4eb53ca8b26c25@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_070854_835282_1775D203 
X-CRM114-Status: GOOD (  24.70  )
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

Hello Ricardo,

On 2024-05-03 13:56, Ricardo Ribalda wrote:
> I am trying to get the DS, but
> https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf is a
> dead links now.
> 
> Anyone have access to the datasheet?

It's kind of available on the link below, but for some strange reason
the download fails after downloading the first 128 KB or so.

https://web.archive.org/web/20080907185532/https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf


> On Fri, 3 May 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org> 
> wrote:
>> 
>> On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wrote:
>> > Em Mon, 29 Apr 2024 15:05:05 +0000
>> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
>> >
>> > > We do not expect the sample_freq to be over 613MHz.
>> > >
>> > > Found by cocci:
>> > > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
>> > >
>> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> > > ---
>> > >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
>> > >  1 file changed, 3 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
>> > > index 3e725cdcc66b..1886f733dbbf 100644
>> > > --- a/drivers/media/dvb-frontends/tda10048.c
>> > > +++ b/drivers/media/dvb-frontends/tda10048.c
>> > > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
>> > >                          u32 bw)
>> > >  {
>> > >     struct tda10048_state *state = fe->demodulator_priv;
>> > > -   u64 t, z;
>> > > +   u32 z;
>> > > +   u64 t;
>> > >
>> > >     dprintk(1, "%s()\n", __func__);
>> > >
>> > > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
>> > >     /* t *= 2147483648 on 32bit platforms */
>> > >     t *= (2048 * 1024);
>> > >     t *= 1024;
>> > > +   /* Sample frequency is under 613MHz */
>> >
>> > Are you sure about that? Some DVB devices have very high frequency
>> > clocks, specially if they're also used for satellite, so I can't
>> > be sure by just looking at the driver's code.
>> >
>> > Also, we had already a bunch of regressions with "fixes" like this
>> > that actually broke frontend drivers.
>> 
>> This patch preserves the existing behavior. The sample_freq_hz 
>> variable
>> is a u32 so, in the original code, z couldn't have been more than
>> U32_MAX even though it was declared as a u64.
>> 
>> It's possible that the original code was wrong.  We have seen that in
>> other places in this patchset.  Adding a note about the datasheet is
>> also a good idea.
>> 
>> regards,
>> dan carpenter
>> 

