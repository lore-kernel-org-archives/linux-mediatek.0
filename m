Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9470DC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DD3fGBfG9/zPLRqWphhAvLBiOO/6wCBUgxf5dozP1a8=; b=hy2Fi7iQDtp0egay9x3F8G1pCF
	bkqg7tR+zMmo6k5wvNPjoiGbq9fiHTX7Fq7at4Bibpa43iYGRrIkpGBV84g47oFBL3z4t0Mdo9rv/
	xODtxSP716niPCfp9WYYqG6g2CO0fqDdXmIOcjFHxuHWEl7uBCYfGLxhp5x0VfSATG2Itxxq/gz7n
	eHRSMB0MAUqE8SL77nMx52MymDH6agWbvZjdNmKG7v0S2aQ4/SmcQoWyngFIMceIosPiOBrYj3bzb
	UoN7yewExDh82vGY2YyGl9VzU6lLzbTkArvNVWt8HPyUegC6FdYebs2J7kdURX7ySDY1sP5y6aVkW
	Qd7d3xlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2v7S-0000000H6bx-14xs;
	Fri, 03 May 2024 15:46:42 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2v7O-0000000H6aS-46hC
	for linux-mediatek@lists.infradead.org;
	Fri, 03 May 2024 15:46:40 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-439884be4efso55851741cf.2
        for <linux-mediatek@lists.infradead.org>; Fri, 03 May 2024 08:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714751193; x=1715355993; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DD3fGBfG9/zPLRqWphhAvLBiOO/6wCBUgxf5dozP1a8=;
        b=2pvmcfuUmqXVdM3Xox6UE3MkjT0e/c5M0Lfdx8qrTM4QXalWuAfhj1rp/DZOQ5k+9h
         SlXKKfIvublXQcDh8G4FyEQEV7qwNB5IsieNTVlkOiS1N4YZyFi8Nn6DKmc/QmNWSzGW
         IvagHveKgc+EbZADtqFQgc5ZfS9aoQKdSEE2XbvB2CF26kxg1viw++F3DDmgDI13friG
         7tlZepi/XE66nHFOtjewT7i14bk5bDZv7ixbfW/7yZQhm7B2iPlUtQNETr/4AaYOO31b
         GIc4ownTesxB6DGBBhUDu6YoR2xPGJ5kqPL9ft/BuS/FQswC1UuXUSnAa/tHEJlmg6na
         zSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714751193; x=1715355993;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DD3fGBfG9/zPLRqWphhAvLBiOO/6wCBUgxf5dozP1a8=;
        b=TEVUoO0lWeq6F7sUn+DG9RbPz6PuNoO3eDhq0cs/LzF7kviPvjqMxOj7wJq5zM3HTY
         UPhtm9M85mzvOYufQFdglzy0XKwlw1sK280M0gCPdT3W339WWieH1huiqsbEv/Sr/2Qb
         i1tWen9WZcG+s/bzt2DnJowzH4Rr5wqZv0+HjT/WypPMx8unXs665mcQ0MgYEPxlpbwa
         44jNbSArRmvPwaotYEsK3HnAyNY3sM6OzU/TcRwDZV+WprXcecN2dXHYoyOvpAaTu4nH
         jo0bl4S6w3r28vaXMyl23nOLm4/HS5/JKwT6vIW52TwhA2DRvBZmYyXo7W2TuwCPQHFo
         zafA==
X-Forwarded-Encrypted: i=1; AJvYcCUE8HhgENn1xOx55ATwg0TC8ka75JH55Bq3eL6kincDmrIp/1V/x6a4Ge00mYFSInQVQJPeNK3E+6zz/ammVQ6EWRrY080TwSQ8gBWDWLim9DWR
X-Gm-Message-State: AOJu0YyU/SWDgu5KlLQB4rdXeT4Ss5mBXvrIqa+faxgL4HFtUphVP8kt
	tfcZahIu6/v9WSa4vEkeRKUVrAtRRZMhIoSNFrfjkJkHNP3Ja0ZS0dljvi2A858=
X-Google-Smtp-Source: AGHT+IHvorLKVldcwPuXub3vxQ9aDpAAyxM3M6JDKLRxX/G+y4VOONQbkGOltiMGMq6o1FuWaPwO5Q==
X-Received: by 2002:ac8:7f01:0:b0:437:87f9:5ad2 with SMTP id f1-20020ac87f01000000b0043787f95ad2mr2820051qtk.45.1714751193620;
        Fri, 03 May 2024 08:46:33 -0700 (PDT)
Received: from xanadu (modemcable018.15-162-184.mc.videotron.ca. [184.162.15.18])
        by smtp.gmail.com with ESMTPSA id dr12-20020a05622a528c00b0043c58b6d941sm1703704qtb.42.2024.05.03.08.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 08:46:33 -0700 (PDT)
Date: Fri, 3 May 2024 11:46:32 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Julien Panis <jpanis@baylibre.com>
cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] thermal/drivers/mediatek/lvts_thermal: Remove unused
 members from struct lvts_ctrl_data
In-Reply-To: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-1-f605c50ca117@baylibre.com>
Message-ID: <n7os6420-s4n1-1874-6qs4-409818807pnq@onlyvoer.pbz>
References: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-0-f605c50ca117@baylibre.com> <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-1-f605c50ca117@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_084639_048869_F0D1F5F0 
X-CRM114-Status: GOOD (  13.55  )
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

On Fri, 3 May 2024, Julien Panis wrote:

> In struct lvts_ctrl_data, num_lvts_sensor and cal_offset[] are not used.
> 
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>


> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 86b2f44355ac..18a796386cd0 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -105,8 +105,6 @@ struct lvts_sensor_data {
>  
>  struct lvts_ctrl_data {
>  	struct lvts_sensor_data lvts_sensor[LVTS_SENSOR_MAX];
> -	int cal_offset[LVTS_SENSOR_MAX];
> -	int num_lvts_sensor;
>  	u8 valid_sensor_mask;
>  	int offset;
>  	int mode;
> 
> -- 
> 2.37.3
> 
> 

