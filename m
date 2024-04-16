Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB92C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 07:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vz5EFUG61C/PsBsUPlDK2q+AUqaXZYNi38q3WlwiS3E=; b=r2sWx9lqRan6wd6Nkd7Z12rwk0
	SeAJy+hsGibpLKjNRYl3B6FcXa+x3Newsyr1T8dFrZXo6zwIprd9uWFm2uLX2kVAImbjt3niau9Bi
	2sZna5MigjQ2XU/N8IugO7NqCVy4veJuNuX5NbMOixZUWzevvHeIN83jvjXvWCVQUPSzTNOOM1xkG
	trHDqujvdXspWeLFU1zmkWXlNNlEf5luHVgqIG0P348VjfD/Rv6G4RB4eyPT1IBNY2iu5DKN1DRZU
	pMr3gIytTUbqAUnQKoEqi0lGYnCfSRJ3Dc80/rz33YDPvJmBkaW2xTT6wCow6ykpzFNtURFRVN4rl
	K5ETRgRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdNc-0000000BIfg-1YO0;
	Tue, 16 Apr 2024 07:37:24 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdNZ-0000000BIdi-32DH
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 07:37:23 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a51a1c8d931so516666166b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713253039; x=1713857839; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vz5EFUG61C/PsBsUPlDK2q+AUqaXZYNi38q3WlwiS3E=;
        b=HNjYR1FV3gfPIDfWcB833OA/ukIrhM9HORpSsv+tQNRgMLg1Iv/sMGj8bnE3UtPoPL
         26QD3/3i2gkSzTumN2sQUxuxam6CvCwLvc43ppux48XMrqCMircLVdppGp6v/ayLxjBf
         2CXRNIiOVn06nCuCJ8oBwDWqlU1+KCHpgvig5YLjADa/+DvDY6Kl++888m8xcT/UzyYD
         xQ9yhq/wWivzvV30gM/ZPVZz405zD5hc7lLOPIXPsmkcZpsodLOi+Mhuv0qCSTBLCpf1
         7ErCHfXnFKtqdmik5vQ2G3P0L9XPxJpkmkm7U0tRBY2sVfD5ip5dUuOmObDnw84tjBJ1
         P7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713253039; x=1713857839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vz5EFUG61C/PsBsUPlDK2q+AUqaXZYNi38q3WlwiS3E=;
        b=u3+0+YPGLfs6OZDVQ0lBXaUGgJ3XsAucBLxz4LB/bkGYZYyIhGnc1G+2LNdeuyWN2G
         /7EsuMQ8EnrmOVfCiJrAGki+xEi1pZMFRlEMe0QjonKbjKvpiT4alW2FpW1hcUat89qe
         Ue896vmxxQeJNp0BlSV5oP3g9C/NG3EJn1Tkp3C/3n/2FDsxLOoNZTFA3PmvYnxSmovL
         hd3MXMfZ9a6r8NPCJp/SUMJAgCthcXzOBUt5oKPDJDs8nZK6k1hoypigYzEQzSu3QVTC
         hswG2FsQzImwXbeyhTPZg5lYViDxwM0WHvBl7v0Lgcgw3Mps0clecVE/A6cu+v4TNmJN
         TTmg==
X-Forwarded-Encrypted: i=1; AJvYcCVlK3Bv6Iafgb9hH7P9asGhR/kvhWYQWRMR9Y9PmDtU40EpuwogS1ng4HenOAXM1wiXaAnmb8V9kaNMLbo4in6KyIrmHDC0EeNOKvOi6UXZC8gl
X-Gm-Message-State: AOJu0YyjM63drnuncMUBou//Z9L/TUqIRjTeaDFm86I+PBdpS2T6WkI0
	CW0pyXmsgRF88KM0+/Bxwohh95upy27hVexrO0Hk7lAhUgD77NJFMajPZNbas+g=
X-Google-Smtp-Source: AGHT+IF7djK9Gp7QvHWuOZzhp3iyt4a4kh6gE+5Chee7fTPBiXusYHzH5iP8LrBy89Sq7/Zoad7L6g==
X-Received: by 2002:a17:906:3488:b0:a52:e86:ae62 with SMTP id g8-20020a170906348800b00a520e86ae62mr7767532ejb.54.1713253038496;
        Tue, 16 Apr 2024 00:37:18 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gt43-20020a1709072dab00b00a5242ec4573sm4507206ejc.29.2024.04.16.00.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 00:37:18 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:37:14 +0300
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
Subject: Re: [PATCH 07/35] media: staging: sun6i-isp: Remove redundant printk
Message-ID: <b8a5cc23-240f-4fe9-9b25-b534f618506e@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_003721_775094_300E953D 
X-CRM114-Status: GOOD (  17.44  )
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

On Mon, Apr 15, 2024 at 07:34:24PM +0000, Ricardo Ribalda wrote:
> platform_get_irq() already prints an error for us.
> 
> Found by cocci:
> drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:389:2-9: line 389 is redundant because platform_get_irq() already prints an error
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> index 5c0a45394cba..a6424fe7023b 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> @@ -386,7 +386,6 @@ static int sun6i_isp_resources_setup(struct sun6i_isp_device *isp_dev,
>  
>  	irq = platform_get_irq(platform_dev, 0);
>  	if (irq < 0) {
> -		dev_err(dev, "failed to get interrupt\n");
>  		ret = -ENXIO;

This is more fall out from when irq functions used to return zero (16
years ago).  Instead of ret = -ENXIO, set ret = irq.

regards,
dan carpenter

