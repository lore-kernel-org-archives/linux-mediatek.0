Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795A5CDD0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 20:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKDnl7wKJvDkeBeWUqma/+8SHGVxxBCShhMLzaahqkY=; b=X2C2IAcoL478xqUSbEK7i9FfPN
	RYcJKo4gs61eTNhTs+xsJ0JEDPxUqGV99G5F45BXfOkFoGGsiRuNc90d/4DjIxSHZQISYDGlXH8Tw
	OR/wPSbCMF3epgFCCq9OhV5TvgV7qWotWFfnxZ2Ftj4X7JXnvmP0L+usHVlAiVmr3rYfNQ4vkcC7s
	FnGg9hKBGJUgGtk7zuyBFZ6ZdVheSMgfhsAZe9qJzb3RxeDTjLYF2+GVmpCb7qUDJwm19uf5661Fw
	UK1Ev1CteyUooZUMaZoJCrVD4y3O1vp2X+8y7XacSSjVmudIBfnMWM76ZzG+EF3c5shfIAuc20RS5
	vVS6SxQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3LCS-0000000C3uY-26RW;
	Tue, 22 Oct 2024 20:09:52 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3LAu-0000000C3gN-3x69
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Oct 2024 20:08:19 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-288661760d3so3350725fac.3
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Oct 2024 13:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729627695; x=1730232495; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKDnl7wKJvDkeBeWUqma/+8SHGVxxBCShhMLzaahqkY=;
        b=Mf3zureZiKi7zqw9+SIl24eqyQ2VCqc2rVl2++9wTXeBjWCZApnJtWKoI8PfFnEO1c
         RNz2BTTesWoH5k/IdbHfqVJNnds+QmD+cxyeAjGppzPVn7529Mf4mBp5TP65y47Dl7F0
         ITSZL2A174xl5qPFXU7HyNqnfvzrGJcBhslWU12+9XfqfQlxODrWy3AOlr6yo80WWBb+
         pHIfVhsslD9hr96XM1FDVYUuyZRpQKj2Up8Z7CGOIJnQeC2lxmWIx9MHJURu/eI+usAE
         wuQ8IGXP6kIeljyonTQriUBPD9JYtn5d6b7CojUz7Ns0OFktjgjq8ebV05J8IrBzDT89
         SyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729627695; x=1730232495;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RKDnl7wKJvDkeBeWUqma/+8SHGVxxBCShhMLzaahqkY=;
        b=TEMgmFqlbt6BofVxkVSOT22pKkK6829aEE1mCdCBDjW8AGRdaM10xycwPVaFfA3cAg
         3cRY1mBTlh6WwQ47oPdJPmX++33NbpqeUyEaPG61RImbfhrq2XD0RZp5iWNKRb8GvNmf
         bfMzfuPtZ/gDQ1C/JqwxZQAhs/DOlG1Z7PQsRmNOGwjGM97Cd8cL5Xnj3JlMcsddZpNA
         fdF9gMinwGf//iIy7lz2CIFsDb0iBHcZzi3gHzYozugWE051r0UeeZhMCMXuNej9ZjZF
         Xf8bjs4WpCPpCnXbFbngc76SfiH2zYJApqp0PGZdLD5d6GQYLvB0luTTQ4DazLP3ml8g
         zRkg==
X-Forwarded-Encrypted: i=1; AJvYcCWid2GMeXPXR2j+0Mr6/gKsk/GqgdxNIovRje4IXAQaJIxtmRTPHM9IngS1GlxN/23AMU5mCh2YK06pkEKDkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLUZbeobl1ac51BIwIwVvsB80HoD4DCk65mJPuxpi6FRH3I5gm
	5EohLzf0yVlSvAX546DDc8vgmEOHnUmugp21FaNYfY4ZbtTbpNwFDz2swrUyHHM=
X-Google-Smtp-Source: AGHT+IGrMpyj2ZITk+VVk3SSfXrARFJXCsgS7Lt+ivjrH7hMCKpqWqljJ8FddgEDhbT/k+C50LCeMA==
X-Received: by 2002:a05:6870:a346:b0:287:29a0:cfe4 with SMTP id 586e51a60fabf-28ccb5d7929mr521152fac.32.1729627695309;
        Tue, 22 Oct 2024 13:08:15 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b165a710a7sm315154785a.106.2024.10.22.13.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 13:08:14 -0700 (PDT)
Date: Tue, 22 Oct 2024 16:08:13 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Colin Ian King <colin.i.king@gmail.com>
cc: "Rafael J . Wysocki" <rafael@kernel.org>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
    linux-mediatek@lists.infradead.org
Subject: Re: [PATCH][next] thermal/drivers/mediatek/lvts_thermal: make
 read-only arrays static const
In-Reply-To: <20241022184622.1296044-1-colin.i.king@gmail.com>
Message-ID: <rq710p19-nq43-p91r-56o4-p75468q5psp4@onlyvoer.pbz>
References: <20241022184622.1296044-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_130817_185132_CFE7CDAA 
X-CRM114-Status: GOOD (  15.08  )
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

On Tue, 22 Oct 2024, Colin Ian King wrote:

> Don't populate the read-only arrays on the stack at run time, instead
> make them static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>

> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 1997e91bb3be..ce223bab6b55 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -329,7 +329,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>  
>  static void lvts_update_irq_mask(struct lvts_ctrl *lvts_ctrl)
>  {
> -	u32 masks[] = {
> +	static const u32 masks[] = {
>  		LVTS_MONINT_OFFSET_SENSOR0,
>  		LVTS_MONINT_OFFSET_SENSOR1,
>  		LVTS_MONINT_OFFSET_SENSOR2,
> @@ -424,7 +424,7 @@ static irqreturn_t lvts_ctrl_irq_handler(struct lvts_ctrl *lvts_ctrl)
>  {
>  	irqreturn_t iret = IRQ_NONE;
>  	u32 value;
> -	u32 masks[] = {
> +	static const u32 masks[] = {
>  		LVTS_INT_SENSOR0,
>  		LVTS_INT_SENSOR1,
>  		LVTS_INT_SENSOR2,
> -- 
> 2.39.5
> 
> 

