Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C249AC25B10
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 May 2024 13:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABNtOh/Z3AIwsdePLSWkzeYb78xrA+zqTZ4Vj4WEmaE=; b=TZ1NCh8OPBaxpR6CLJ0ovhJaKT
	HMmUwtvEU9FFhToOo2Kh7N0dMimZtzDXH/Dv8kHGN3N7u/ZNE710S2so9TUJVCe7ENLEXDFDHnkOq
	YvJ0E9Y3RDTcd7snUCwgbOYzbvb0Vo4TFoX6rmb8HyD83GaI5bm3/Ex7Li2X/DhL39bqdo2E9gY3f
	unQVRfnFvc8iIOmd30dorMrGdxViFltP2p7bIP0nOP6vo85yGDdRhJcUcofbu0vT8XPcIvCcvwg5I
	Gu+bPH5CUuej98qskB/lI+zv/6D9MX0lkfPkszR1QqhlupOJFHNLfXNNSkhAQmKNxpYKnIb9Bn3/O
	ux20Muxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Vqz-0000000D0z0-1E1U;
	Mon, 13 May 2024 13:36:33 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Vqu-0000000D0xe-2Tk7
	for linux-mediatek@lists.infradead.org;
	Mon, 13 May 2024 13:36:30 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a5a4bc9578cso463950466b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 13 May 2024 06:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715607384; x=1716212184; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ABNtOh/Z3AIwsdePLSWkzeYb78xrA+zqTZ4Vj4WEmaE=;
        b=aNx7gK2OoPvTuGu/bSHQUjaAPWHVF+z6nKcitlvn/c2tW57LkFapZ6ZDBsnuSKV8q3
         vqFHluqpgJM4xAqa0462pd+4T72Cb5rIpmeZY3DvMtLdi765C3+tBFRSZcBjCuYVAagR
         DtDsFTm2OIJEKBIYoKzPB3I7Vxnr/XnMVUilw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715607384; x=1716212184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABNtOh/Z3AIwsdePLSWkzeYb78xrA+zqTZ4Vj4WEmaE=;
        b=vqtE8zz5uw3Aqv/LRhLla+1dE4fC1rQgw4whc3ruZgzBTA+u3tmeZ6Tbf9gThPk6CK
         Vp44k7FSyQyQf/9uaok/PT9JjFlZQ/vWNpFRT025zo9ml4nG+MbD9/BhfFGIZdEpF2K4
         5hj6vNl6TIeTm7sae9zpbygjtUyQbx9dBbET2s8U9W1/xsEy6RrUHtKtoWx4E1P6uxPS
         7ARptDJD9fOeN6JS7mHuT9834k6HZvzTxxw4vOrZZHni8/wYX86MDoYOEqAvTkkr6bwK
         WP4EQAMF4ddHr8SkPkZJJNuGQLKYF9VKBPFzZ89Z9hOhQS9PLkIWOqkWHFmSdNAtuuPq
         o7xA==
X-Forwarded-Encrypted: i=1; AJvYcCUT8YkHGahqyFe6KZtPdT6jmgjDl8akFBe6P7LuL9Zo//gBSOc/whRrqloYoEtAWF8ENnQ6fhT+jFqJycZutIcLxu3afUnN6qlngHZxaUzd5ujM
X-Gm-Message-State: AOJu0Yywd8qhUzJ98qHGCY9VswbeBQGZZdqGhW/x91C3xYLeSMGALXNa
	itfhq+IoEdI5EOjlP5LRfY1MCDH9ALp/omHnoWcZdvt7dDqk+KI3VysgJJSmAxQFNgFdAVnA9xU
	4R2J04ig=
X-Google-Smtp-Source: AGHT+IF6PFfMHKaC/bOThH7PFkKaHzgB2np39Dr4Z33irJr81yrATiJMi1NX9JlmRIzwIOGZWhVA1Q==
X-Received: by 2002:a17:906:f0d4:b0:a59:c941:e5e5 with SMTP id a640c23a62f3a-a5a2d5ccffdmr933125066b.45.1715607384642;
        Mon, 13 May 2024 06:36:24 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01647sm599457266b.160.2024.05.13.06.36.24
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 06:36:24 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a5a4bc9578cso463944566b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 13 May 2024 06:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgFcp+IqwqO1tuysIBywrzqEVPoPEfTMJLPi62EecQgQ90ZofWJnBglpzzBy9vTuFZRyXKaT1UKYtRlyBYL1Q0k7IAa2m/W1E5yUK9mVLgbNIh
X-Received: by 2002:adf:f8c4:0:b0:34f:5d07:ebda with SMTP id
 ffacd0b85a97d-3504a63111fmr10276952f8f.23.1715607363511; Mon, 13 May 2024
 06:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org> <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain> <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
 <fe95e3c3a89de4566a4eb53ca8b26c25@manjaro.org>
In-Reply-To: <fe95e3c3a89de4566a4eb53ca8b26c25@manjaro.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 May 2024 15:35:49 +0200
X-Gmail-Original-Message-ID: <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
Message-ID: <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
Subject: Re: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range
 of z explicit.
To: Dragan Simic <dsimic@manjaro.org>, Michael Krufky <mkrufky@linuxtv.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_063628_705803_0A15D85B 
X-CRM114-Status: GOOD (  35.73  )
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

On Fri, 3 May 2024 at 16:08, Dragan Simic <dsimic@manjaro.org> wrote:
>
> Hello Ricardo,
>
> On 2024-05-03 13:56, Ricardo Ribalda wrote:
> > I am trying to get the DS, but
> > https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf is a
> > dead links now.
> >
> > Anyone have access to the datasheet?
>
> It's kind of available on the link below, but for some strange reason
> the download fails after downloading the first 128 KB or so.
>
> https://web.archive.org/web/20080907185532/https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf\

Mike, by any chance do you have a copy of the DS?


>
>
> > On Fri, 3 May 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org>
> > wrote:
> >>
> >> On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wrote:
> >> > Em Mon, 29 Apr 2024 15:05:05 +0000
> >> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> >> >
> >> > > We do not expect the sample_freq to be over 613MHz.
> >> > >
> >> > > Found by cocci:
> >> > > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> >> > >
> >> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >> > > ---
> >> > >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> >> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> >> > >
> >> > > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
> >> > > index 3e725cdcc66b..1886f733dbbf 100644
> >> > > --- a/drivers/media/dvb-frontends/tda10048.c
> >> > > +++ b/drivers/media/dvb-frontends/tda10048.c
> >> > > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> >> > >                          u32 bw)
> >> > >  {
> >> > >     struct tda10048_state *state = fe->demodulator_priv;
> >> > > -   u64 t, z;
> >> > > +   u32 z;
> >> > > +   u64 t;
> >> > >
> >> > >     dprintk(1, "%s()\n", __func__);
> >> > >
> >> > > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> >> > >     /* t *= 2147483648 on 32bit platforms */
> >> > >     t *= (2048 * 1024);
> >> > >     t *= 1024;
> >> > > +   /* Sample frequency is under 613MHz */
> >> >
> >> > Are you sure about that? Some DVB devices have very high frequency
> >> > clocks, specially if they're also used for satellite, so I can't
> >> > be sure by just looking at the driver's code.
> >> >
> >> > Also, we had already a bunch of regressions with "fixes" like this
> >> > that actually broke frontend drivers.
> >>
> >> This patch preserves the existing behavior. The sample_freq_hz
> >> variable
> >> is a u32 so, in the original code, z couldn't have been more than
> >> U32_MAX even though it was declared as a u64.


I agree with Dan, we keep the existing behaviour. So it wont hurt to
merge the code...

All  that said, if someone has access to the DS, I do not mind reviewing it.


> >>
> >> It's possible that the original code was wrong.  We have seen that in
> >> other places in this patchset.  Adding a note about the datasheet is
> >> also a good idea.
> >>
> >> regards,
> >> dan carpenter
> >>



-- 
Ricardo Ribalda

