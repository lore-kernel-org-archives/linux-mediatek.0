Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB18AC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 10:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+LvTU+20katiBQPmXC4bjjTw0g5f/3WkUMY6Jo3I4w=; b=2puz7Uw9RW2L4cWL7sQMEUMcR7
	bvME9dHB47uOgTIzOFc7TGsjJXZEmMLxyHqCj4620CiQlX4+FtR6HSGn87jyHOzrEMxnjzmLqvl09
	R9Ekwgs2hBBd9R7kHUPWIxDEejhVL7WWmrhcOxBfa7MUiScTAqrPwFuEJewvSM5qdoGJ5rKFKjyaj
	2DHDg5PbYxpRYnB10js3Oc3T1v5/4bQr1L4JhVDUtbIz94R8hWuLbsVpOUgPCqAHPtSmL9Tcn9riZ
	hiRiFwXq8LEdyWRZMoT7Ws6A5XGNiFTKvJvOhID8/4ExkTQvddSrRNWtqdTt/K6D3vZN4kACJWCov
	VL8iYaUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwgUf-0000000Btid-0b6K;
	Tue, 16 Apr 2024 10:56:53 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwgUc-0000000BtgO-1kll
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 10:56:51 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so6704796a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 03:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713265003; x=1713869803; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5+LvTU+20katiBQPmXC4bjjTw0g5f/3WkUMY6Jo3I4w=;
        b=qnwvReGtCPsB70ydXWRoVMel3ETZW05Pp4NIm1CW5Lq6zoUOgZKfKrzpWwY6EyvZC7
         vaR+C5icaLa/PLVaTJtm5hLZfBuAvha/zeCe82BDz/8mJcvZIAM9Mm4ipajWSZJLAojj
         eJYReRqlKilfdcKnK5VdsDIOYJHUNcGvPxe2NedgvTq5YzITIplSWHcsphNQkafX51lC
         aoyez8sCz5KPSF7f7daBa7xK5GZJZa17U9BSfbMi0YPD0VVE5HG/oL5es4UEnUbgxOoZ
         6/ucQeF8YpXjzMOZbyzQRCqYf2L4ZrD7+nJmxFBjBQj5qS9woJsz3uMnqVotgJnk+uaE
         XFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713265003; x=1713869803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+LvTU+20katiBQPmXC4bjjTw0g5f/3WkUMY6Jo3I4w=;
        b=qwP8iXRJxb1mzAnQfmie6cguDvABiuoXVpFdvPMFSeQLLJZ+kNbblNQ0Qf14rxwTIN
         GsnDKKlDCDlGAHDsCUY8l6QoPSlezK6eylVIlSjPfSTERl6MbejmQNw145E+2Dr+B9Wj
         7cpTsuUscCgaV8wwBih6vsDk+m/lmc1cj31h3I0fCvg5zOE3LzU3PJSegHL9Upj4uk/o
         OM9IPZBxCpP+gtxCffA6q5fJru8/3oDX4CIRM3Fevxgdp2Awz82LaU4Vx40Lka+KI5gq
         BzgoEpVGXasuOmjvQYPWBYSNg2b2ReyU/Qzboq+VzQH4Ip701D/NPyoeSVLUGBurRFcg
         addQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3HJ3ooYl2QcVEglOoCI9Y3weFt2QR7+nwjlcLdgv3fv5zwpA1MmKNEilU4sCZc6eJpx/Aep8Vl3qKHpJSCR7LYC4k5ZqU1w9IzwuanXbUFw0Y
X-Gm-Message-State: AOJu0Yxg8JSszZyQXufoCKdH5wx9Tz9c/UtKNwvAKbnhppVwZbN1NfvB
	FGIjCnzoae00ltudzAPTdGvJSRDT6tp4fb3xfGBt6PmqtaesjuWgmmjXn1G9JO0=
X-Google-Smtp-Source: AGHT+IFRHzwHYV/k15VsjWZfN2SFFrEwWZL3WX+T78lKXGwI5ZHOHbWBE7IZ649XfmZzZPkChlPXBw==
X-Received: by 2002:a50:8d19:0:b0:570:1161:111f with SMTP id s25-20020a508d19000000b005701161111fmr8339541eds.15.1713265003274;
        Tue, 16 Apr 2024 03:56:43 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u5-20020aa7d985000000b0057000a2cb5bsm4692942eds.18.2024.04.16.03.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 03:56:42 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:56:38 +0300
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
Message-ID: <bb7d0078-764a-4cf9-9fcf-2e91eaf33e76@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org>
 <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
 <CANiDSCvp9gBo6Oh31GghvcHmgBY1cYqq4uM_njFTTvQOcS1mbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCvp9gBo6Oh31GghvcHmgBY1cYqq4uM_njFTTvQOcS1mbw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_035650_498063_F8FB404A 
X-CRM114-Status: GOOD (  13.36  )
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

On Tue, Apr 16, 2024 at 12:39:33PM +0200, Ricardo Ribalda wrote:
> Hi Dan
> 
> What about going the safe way?
> 
> --- a/drivers/media/dvb-frontends/tda10048.c
> +++ b/drivers/media/dvb-frontends/tda10048.c
> @@ -341,7 +341,7 @@ static int tda10048_set_wref(struct dvb_frontend
> *fe, u32 sample_freq_hz,
>         /* t *= 2147483648 on 32bit platforms */
>         t *= (2048 * 1024);
>         t *= 1024;
> -       z = 7 * sample_freq_hz;
> +       z = (u64)7 * sample_freq_hz;

I think your patch works, but it might be nicer without the casts.  We
end up having the discussion where it's like "Can this hz be above 4GHz?"
And, here, I think we're safe but a lot of stuff is pushing up against
that limit these days...

regards,
dan carpenter


