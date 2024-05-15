Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2776C25B79
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 15:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7fuG8q4vN8I17KIqwuUEjtG/Vg923yjRqjA4jq2rhI=; b=K08DSLkbN5pFbiZorbsvJV43Rt
	DgiUhEDlK35isCAcgyulIymQ4cASLitoEvq6LJfQU6nSy9JKjjt9dwwPcw2rXuqmO5avIg5cMRBpZ
	L3xNwA/OHxjU90Pf8IO05+oiocaaVV24hL1UaIwxg50ZVlIoPtRPR7eOGkkq698P0IkaPQXhnKTQv
	kYZ40XnJ+wAjaJvFwUo5yzSCn/9XyKRCnA5jzvmjOUV7U4zJR41CLI1sUMw4uEhj5sB3wuvt37lUw
	dxkjhMgOy/4dXKUKRNBzKT9fiWXAb46br9KLx1OocpZggXZnotH4yy0EXmFMXZLlepEkHkD4EkpBS
	WSincoyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7GT8-00000001waR-17ds;
	Wed, 15 May 2024 15:23:02 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7GT4-00000001wXK-3tjt
	for linux-mediatek@lists.infradead.org;
	Wed, 15 May 2024 15:23:00 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-792bf1a4f75so557020985a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 May 2024 08:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715786570; x=1716391370; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=e7fuG8q4vN8I17KIqwuUEjtG/Vg923yjRqjA4jq2rhI=;
        b=WbZjOsK0WxDeJgmif3cSkgFSOMpHza/MYbp4/JWr2BIcPy/b34vXkR4n7NFk5DsK1R
         1HclTPllYQ+YIDyQqI2H0/RexjPNY1dbNuuur3UJqsnyzM09ViTeWDMFUvJZiY+fJgj8
         lsYLAazfeoaJg7qUJTI+GjiKqYaYGxUX2eU3Az314c+KG1EjFoZxtHdXVHZATXZsBJte
         rDoy17Ym0ThO+QBCxMGhKpSkm0FVPxw5Lhya09J2byWEkeuh2YGCDIEXYmufCWmOPdp9
         JKdAXw5QOy/7DYa65Seih0Gicl45nRwQ5O+EQ8MeF4D5SYbSIz5eU8MSwFQ1dN4xTdvg
         7wzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715786570; x=1716391370;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7fuG8q4vN8I17KIqwuUEjtG/Vg923yjRqjA4jq2rhI=;
        b=Dt/eUUa/beHz7Bfx3sT3owgGsxWCYr99TVndk5Bbx4NIDNKklIiTP+MMpjgI4etxfS
         UrxzS9b1K6cgZ58UGJyreQyey9r8tWcvrBSnO2P96mL3BZXAN042obfgESJxdAfbdniz
         MSIHslnHTekC9Otej/3HHaU4MPN9V7/tbEFfr0qmyf0ge3qmF78/ZmKC9vgqd/K1+2cg
         +t/x078q8tNDFB8KL9TbDoPqzbIg/UnLKIiR0WBNW+FqMk0AxrKfKkjUJv7iQjKcV/N5
         3jJIyxODPxXS6VwnHkEipBH7GHkionJKMuZxJ6srbZ9kkAMdQp7/ago78piNWoT8lvw4
         ONnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2i3nL9Vp+Mo3MzeI0pNdhJw+/rsylH4gctA6F40JM/fJSYbnbaJXMicxaI4f/h310LepjXvoKeJwJlb+sx5amljB0GDZUa8bo1AVtJfyfOTFq
X-Gm-Message-State: AOJu0YyTwAFzKouMgDuixPZv5UG8XCkhdrSyI3HKfO77qfASKXd7e893
	Zwvitw38JGYyP5dHu9n0oTJeN+BO4rD0IlFDUGRSDu/2mbH7ntnU7AiSoMzuZ1c=
X-Google-Smtp-Source: AGHT+IGw0aDYjqBIiQz2ro5yaFEoOd0FlTaGJoFh4u+ygsAdhEHrwkLXERLT8RI/xzS13PWtMHd3jw==
X-Received: by 2002:a05:620a:e14:b0:792:c413:f827 with SMTP id af79cd13be357-792c757412dmr1767831385a.11.1715786570417;
        Wed, 15 May 2024 08:22:50 -0700 (PDT)
Received: from xanadu (modemcable018.15-162-184.mc.videotron.ca. [184.162.15.18])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792e91acc94sm245912185a.26.2024.05.15.08.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 08:22:50 -0700 (PDT)
Date: Wed, 15 May 2024 11:22:49 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Julien Panis <jpanis@baylibre.com>
cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Remove filtered
 mode for mt8188
In-Reply-To: <20240515-mtk-thermal-mt8188-mode-fix-v1-1-e656b310b67f@baylibre.com>
Message-ID: <06np453s-183n-68qn-o33o-97q4163oro4s@onlyvoer.pbz>
References: <20240515-mtk-thermal-mt8188-mode-fix-v1-1-e656b310b67f@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_082258_977522_0579BB4C 
X-CRM114-Status: GOOD (  17.17  )
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

On Wed, 15 May 2024, Julien Panis wrote:

> Filtered mode is not supported on mt8188 SoC and is the source of bad
> results. Move to immediate mode which provides good temperatures.
> 
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Reviewed-by: Nicolas Pitre <npitre@baylibre.com>


> ---
> Filtered mode was set by mistake and difficulties with the test setup
> prevented from catching this earlier. Use default mode (immediate mode)
> instead.
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 0bb3a495b56e..82c355c466cf 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -1458,7 +1458,6 @@ static const struct lvts_ctrl_data mt8188_lvts_mcu_data_ctrl[] = {
>  		},
>  		VALID_SENSOR_MAP(1, 1, 1, 1),
>  		.offset = 0x0,
> -		.mode = LVTS_MSR_FILTERED_MODE,
>  	},
>  	{
>  		.lvts_sensor = {
> @@ -1469,7 +1468,6 @@ static const struct lvts_ctrl_data mt8188_lvts_mcu_data_ctrl[] = {
>  		},
>  		VALID_SENSOR_MAP(1, 1, 0, 0),
>  		.offset = 0x100,
> -		.mode = LVTS_MSR_FILTERED_MODE,
>  	}
>  };
>  
> @@ -1483,7 +1481,6 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
>  		},
>  		VALID_SENSOR_MAP(0, 1, 0, 0),
>  		.offset = 0x0,
> -		.mode = LVTS_MSR_FILTERED_MODE,
>  	},
>  	{
>  		.lvts_sensor = {
> @@ -1496,7 +1493,6 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
>  		},
>  		VALID_SENSOR_MAP(1, 1, 1, 0),
>  		.offset = 0x100,
> -		.mode = LVTS_MSR_FILTERED_MODE,
>  	},
>  	{
>  		.lvts_sensor = {
> @@ -1507,7 +1503,6 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
>  		},
>  		VALID_SENSOR_MAP(1, 1, 0, 0),
>  		.offset = 0x200,
> -		.mode = LVTS_MSR_FILTERED_MODE,
>  	},
>  	{
>  		.lvts_sensor = {
> @@ -1518,7 +1513,6 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
>  		},
>  		VALID_SENSOR_MAP(1, 1, 0, 0),
>  		.offset = 0x300,
> -		.mode = LVTS_MSR_FILTERED_MODE,
>  	}
>  };
>  
> 
> ---
> base-commit: 82d92a9a1b9ea0ea52aff27cddd05009b4edad49
> change-id: 20240515-mtk-thermal-mt8188-mode-fix-e583d9a31da1
> 
> Best regards,
> -- 
> Julien Panis <jpanis@baylibre.com>
> 
> 

