Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2C1C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 10:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPkV0sNugJ6qgQtdOYjt79FX134OLt8EXh0nbMQL+rg=; b=VzDdmvwp8+QcSUzxbCD3VpqFru
	Islfi8w2lDjTRescw4z2iMO4WCqeoA0ecggEQEwkyX52yAdo7sUUNTGPWAXIP0M9sJ4wBB+zlZ0I6
	yIXS/wDIDSBX8ViUunOo4jheJ8r27eyEgBnMfYt7bxeFlS6r6ckDsnQWg9oXXTAEXqA6pSFdwKh9/
	weKKbFCXJm+bVm7h2RXacEUnXE3S4w3nKw7sq70IQuhiq1ukg7E2wPb06NN7qozftgSvklgtgY+hE
	oK5UAwzZ3u80CJvAfKnTeb7BjZ73Rmw4s38wacJu7LsVojejEU2lJlWtw5DXD+QKv0ZgOwL3N4OWG
	xwVtIpmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwflX-0000000BjBq-1iac;
	Tue, 16 Apr 2024 10:10:15 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwflU-0000000BjAn-3ciy
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 10:10:14 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-570097653faso2702713a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 03:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713262210; x=1713867010; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kPkV0sNugJ6qgQtdOYjt79FX134OLt8EXh0nbMQL+rg=;
        b=aRsiVjYo7k9EruVRWrvTptYC7wvUByHD8LWGvLzZRi2uNG1fbqCKpOvR7rpvjulYgd
         DBeSwrXlXwKT9XyrzwV6atRkasJcFuRdnp+uLVGoSWrgHbU7B53fkm7gk4U9K0pZA14M
         CcnAmDvUiG8dN2BOYDM7S8+o5FSrdXmOF9BQoowzjj1uCufEbRCphV51+aNzXCwxTfZX
         xNnA7wK+z3IcY0M3vZWa5rT3cFzpiyso4qDeHrPRyrC/Xsr3gjPbvmGhm9h1PIY4Jm8K
         jDdS7cwC4e83uewLTNtpER0ZWBlsbGsXxEHfBcLjBDjp/9hEk9DuJbEUpuHX9KphLqny
         c4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713262210; x=1713867010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPkV0sNugJ6qgQtdOYjt79FX134OLt8EXh0nbMQL+rg=;
        b=hkI/Us8zidSHEUCy0vdM9TyPaFN0PGInFpmC/p/YAxH647Fr74vhqvys6mkVvdtI8W
         i/1JKuZ94qxhC1jNJ4g8kCmrgXwu6a9CoVNfgqsd710QoimLz9wuFWJ8a0sRWTuADsq7
         mISgI0Pqh4kKydz1xbA+E8xcbr5gS+kFa320M0LIkXkVgAvGJ89lhEwdeGeMfCy4CUWT
         Dq5OFLUk5JCR6F2WBDBaR8P2CTsfvB56WI1qf6cfyvMhaZ25XC20Zv3zUMxji9QBTuS+
         cjYEgUdLA8jkgw1ySiHRU9jVOQ8SH4N7SkFtFfitslfA1DEun4HTgoWXPkJxld//MK0O
         uIlA==
X-Forwarded-Encrypted: i=1; AJvYcCUhpQ6oAsJzbpskoUumZLVNCjHuGUZ/LJg+ky3oSjwRccPODzbIsdzzdJXpB2jYJBEFSHaYsp0DPidRRAaApUJA9DEqueBku7dMpgHonu/Ur1HM
X-Gm-Message-State: AOJu0YwVR8x7WWpL3gyYcCFkKxNayEcRWqVzpPBBOjEsYoVNn15c+cRQ
	fVLW+r6xaZO/48hylssr8WPzhrEP1X810HDoR6nmKNMUkkXOFpf5G7B1rxRBlBA=
X-Google-Smtp-Source: AGHT+IFhSr3NXd446nyUjvnWQSCi0io0wiES4XmD0wl9oB47DE6g/h+2O4fAwSx4U05cyhNdrYyvxA==
X-Received: by 2002:a50:d605:0:b0:56d:fc9f:cca0 with SMTP id x5-20020a50d605000000b0056dfc9fcca0mr8578449edi.41.1713262209754;
        Tue, 16 Apr 2024 03:10:09 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a15-20020a50ff0f000000b0056fc72bb490sm5823291edu.61.2024.04.16.03.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 03:10:09 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:10:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 23/35] media: dvb-frontends: tda10048: Use the right div
Message-ID: <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-23-477afb23728b@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_031012_938972_4B523DEA 
X-CRM114-Status: GOOD (  17.38  )
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

On Mon, Apr 15, 2024 at 07:34:40PM +0000, Ricardo Ribalda wrote:
> z does not fit in 32 bits.
> 

z has to fit in 32 bits otherwise there is a different bug.

> Found by cocci:
> drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/dvb-frontends/tda10048.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
> index 5d5e4e9e4422..b176e7803e5b 100644
> --- a/drivers/media/dvb-frontends/tda10048.c
> +++ b/drivers/media/dvb-frontends/tda10048.c
> @@ -342,8 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
>  	t *= (2048 * 1024);
>  	t *= 1024;
>  	z = 7 * sample_freq_hz;

sample_freq_hz is a u32 so z can't be more than U32_MAX.  Perhaps there
is an integer overflow bug on this line.

The sample frequency is set in tda10048_set_if().

	state->sample_freq = state->xtal_hz * (state->pll_mfactor + 45);

->xtal_hz is set earlier in tda10048_set_if() and it goes up to
16,000,000.  So if ->pll_mfactor is non-zero this line will have an
integer overflow.  16million * 46 > U32_MAX.  Maybe when .clk_freq_khz
is TDA10048_CLK_16000 then ->pll_mfactor is zero?  Ugh...

> -	do_div(t, z);
> -	t += 5;
> +	t = div64_u64(t, z) + 5;
>  	do_div(t, 10);

regards,
dan carpenter


