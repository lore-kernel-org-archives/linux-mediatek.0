Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B51AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 14:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzKWleynAfOZzr1G32uJu4jvVPYdSV6qOcoCG8BDdeI=; b=aJXCvq5RrF83lSDMpexs3eDkwt
	XSs21Vhp87mE+Hr6pEL0tQcgf6cuoXAeqB50Fl7MVX6oWmx2nnHqSbMOnU2sEkCYJDMQKfYX7eZ/5
	u5LYJN9niR/+m7+2Wl/B1I3szZkAJt27HX8QEgxrw9vn0ynvjKknSHHUnl920Jz96ingZ6GPJQuJc
	ocWX9BvvHnOOb+AHS4ZqXosxLtFZBvefHVaW2XRYN4l+Zp4PIsY8Koxka+ZmzYMGDzJMKR5bS1wUa
	S/rG9p7oFuaMGawr1tFAZrhv/0xKAtcpaSwXrGzLaKalXLl0MPt4H9mgrDCBgYdRS0dw1i7mIvmUn
	0EeOFh4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o410x-00AnZD-HQ; Wed, 22 Jun 2022 14:07:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o410c-00AnRD-4W; Wed, 22 Jun 2022 14:07:09 +0000
Received: by mail-wm1-x330.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so11172017wmq.0;
        Wed, 22 Jun 2022 07:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MzKWleynAfOZzr1G32uJu4jvVPYdSV6qOcoCG8BDdeI=;
        b=Yybid874HpfGUBNJPUpQicuLtK79W9BMcpg+PcvVhrK/OVuHkXUoO2oqO3aymUPI4H
         NjAF+XpIeU4InRKHibe6EaWdY1PBtBghxcvFcZXuZVWsn9dEfxEbD8kYZ16iQuS+7Fyg
         5Do1T/02aka/OxICUl+TNKuG09evEQSRXIOv4Z4j2KYRCT1TZdJ8bK1xUhG65QOFVYKl
         B1vUz+CI8CSimhaytO2075oJnFb5Ul6L+h55TV5yYgA3AM2r8zCFoF+BYCaiFfcbb4A+
         W3XSyCT1SxqdvvpkDHFX5njMe7qafyIXIppomoQAG6PsniNW9eb3Bq5mX8l6dr+41RCS
         pVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MzKWleynAfOZzr1G32uJu4jvVPYdSV6qOcoCG8BDdeI=;
        b=VZPUWFGuT69XO/neKi5YI8A9CzzYmfcryTc31pmrUT2T0GvbPBwprumCgVEDpMK94u
         Qfe6Ph7mpeeQ0m9tytSWo4KylrDUsq0LfQWPtnhhdJkHyhfH1cchYZuPpOtwIqXMmZln
         jDTKoDag+bpC/CDu9PCJWRnticpzvt0RWj1IGGa3Vu3BsLaTaKUaXUp7YF4/pvxTl25o
         p4gaAhmoreIZ51KHCE7hB8cHWDfEzZMH7S6ki9ZBVwAHgU3KWc4+b61Ph8U2K3aCQA/7
         9rFs5TCXp7uTjqfjhYazq7a8Q8frd9Pz5ESDYdttv4rtTAJBlkGPUf1bWMyZJ1eJttVv
         EJUw==
X-Gm-Message-State: AOAM533JAvGmvJljj41vov6be3G75/M8KNlQGaLdzSsXz8u6eNkpdMZs
	gkgFioD8VjSy1gwoO6uMUGA=
X-Google-Smtp-Source: ABdhPJze2ccttYHD6Z+ReNpSXGvAL7/WlO9i1HO+wGVa0wB4egIBmMjI9h78jpnILe5ZX0+xYrulJA==
X-Received: by 2002:a7b:c4cb:0:b0:39c:35b3:e8c1 with SMTP id g11-20020a7bc4cb000000b0039c35b3e8c1mr46816236wmk.183.1655906822523;
        Wed, 22 Jun 2022 07:07:02 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.148.38])
        by smtp.gmail.com with ESMTPSA id d7-20020adfef87000000b0021b9153f80fsm8644703wro.71.2022.06.22.07.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:07:01 -0700 (PDT)
Message-ID: <d93c3721-8415-ad4d-2f68-2d55adbd1fff@gmail.com>
Date: Wed, 22 Jun 2022 16:06:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] soc: mediatek: mutex: Use DDP_COMPONENT_DITHER0 mod index
 for MT8365
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: fparent@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>
References: <20220620102454.131417-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220620102454.131417-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_070706_249851_C0514A85 
X-CRM114-Status: GOOD (  18.40  )
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



On 20/06/2022 12:24, AngeloGioacchino Del Regno wrote:
> In commit
> 4e8988c634a1 ("soc: mediatek: add DDP_DOMPONENT_DITHER0 enum for mt8195 vdosys0")
> the enum mtk_ddp_comp_id was modified to add an index number to the
> DITHER component because some new SoCs have multiple dither blocks.
> 
> As a result, all of the mutex mod arrays have been changed to use the
> new definition instead of the old one (even if that's retained): for
> consistency purposes, follow the same trend on the newly introduced
> MT8365 mutex mod array.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

Matthias

> ---
>   drivers/soc/mediatek/mtk-mutex.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index fa8e0ba38803..2fd8318c3bdc 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -358,7 +358,7 @@ static const unsigned int mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>   	[DDP_COMPONENT_AAL0] = MT8365_MUTEX_MOD_DISP_AAL,
>   	[DDP_COMPONENT_CCORR] = MT8365_MUTEX_MOD_DISP_CCORR,
>   	[DDP_COMPONENT_COLOR0] = MT8365_MUTEX_MOD_DISP_COLOR0,
> -	[DDP_COMPONENT_DITHER] = MT8365_MUTEX_MOD_DISP_DITHER,
> +	[DDP_COMPONENT_DITHER0] = MT8365_MUTEX_MOD_DISP_DITHER,
>   	[DDP_COMPONENT_DPI0] = MT8365_MUTEX_MOD_DISP_DPI0,
>   	[DDP_COMPONENT_DSI0] = MT8365_MUTEX_MOD_DISP_DSI0,
>   	[DDP_COMPONENT_GAMMA] = MT8365_MUTEX_MOD_DISP_GAMMA,

