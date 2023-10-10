Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF11FCD80C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 12:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=199RxfkmlH6n0PnGVzkV097mb/3xpEnD5+hjR+TaTtE=; b=L9Pt8sgH/CkOhgXx/KwgWNxwUs
	rL2DdZOcIZ2kEpFsqZr+UKLgqCu0QkwjxBXByQdYYltkG+qTETBTSpA35KuEMDCCDpNfnre1ONviO
	rdEuYjh4rmFh3ee2p1gd1v+o52tULY7bjhEUWpnnO2O65ZSrLAPpFDMiQMhTw0OwtXkIhNYmqwP9+
	V+p3O2Z5uGqjO+IRaeMksM00CcES4Bt2wM/y3tSBKfHZ+62PrpNlukXWrkbebYEwpiwbfSbmwu+/a
	f3PLIDLU94NJQZo+XzztxQg6492KN31OL8Kzqkc30+WjqJCAt0/7GRJ2/4sfB0AIwKJJRCL+OjMCU
	fWxtf2ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqC6f-00DMnT-1T;
	Tue, 10 Oct 2023 12:45:01 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqC6b-00DMlE-1b
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Oct 2023 12:44:59 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-533c5d10dc7so9867208a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Oct 2023 05:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696941893; x=1697546693; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=199RxfkmlH6n0PnGVzkV097mb/3xpEnD5+hjR+TaTtE=;
        b=yYEYHzeHTihRZ111DJ1jpYqvKjGSdxo4hyJvgDw9OrYrlvGTjR6DXX3YFXSfGGwPeN
         F+XxvrxvtnYqBRtSKdEaIlAjWkuFPcXwxZxhQKsqBwdM1D+730y2dMbuIkvyaYO4/Sts
         hHf/sViNGcC52WeF4FYPLm0za/ejzH7MbgF7Ai1UCKGbPKN23KO7L0lLcMNACItq/+Lq
         +pIZsxwAkE8Cjdj+64ziA3hlysLdtIpFIlhCswo2dvkDbiCJXMAkYlOmAHAA0+lun8nH
         umggbF2eAOxUSH339BHfxh91OXGc6iry6wXKPbUFVb3pGWcYxFEL/uPJWHbwsYHqPlFa
         l3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696941893; x=1697546693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=199RxfkmlH6n0PnGVzkV097mb/3xpEnD5+hjR+TaTtE=;
        b=ltPciHiiy4Htvzj12DCfUALynRwnds/kvQp+bCs1sePIpCqb2fpf0zxuHOl1mDFqAO
         C8cIOrG3rpW6hPGM9hS7oUXRsPe51cBJ04vmmpZqgR+YWfNdrz2peQVXHE0Sr3tDNjD4
         FlxvExd311D5xf4eMaLf5mrhsrB0/Cq/uj6TjE/4VK4grMQrRdEYXFfR+1nviatrGPFN
         DlJC2dGoER8j2PE0GTwRJcKS0Gw6JehCRHVNAdzPqqEx1V0mR7la65vKNWitH0NEXHhU
         krwKwzKhB+bydub6mF03C0zlZkYf90lEnMNOFgs2SUsvaLYrCt1+qVbX5yilw8+LsF79
         UveA==
X-Gm-Message-State: AOJu0YyOijlpt34eSeJ9dcLovm6Mo6fIs62DbRz9q13PzGqN5QPuSWst
	hxeGf5X6baDX0kjPbBz+MnHUFQ==
X-Google-Smtp-Source: AGHT+IEsJzobcPu8rJ40cb7SMlsIt72AvoIPVaKzAJWjiofu8QAGko17hHTmiHgPwC4WWEHIk++zTA==
X-Received: by 2002:a17:906:530b:b0:9b2:b975:8327 with SMTP id h11-20020a170906530b00b009b2b9758327mr17819526ejo.65.1696941892862;
        Tue, 10 Oct 2023 05:44:52 -0700 (PDT)
Received: from blmsp ([2001:4091:a246:8222:872:4a5b:b69c:1318])
        by smtp.gmail.com with ESMTPSA id qq25-20020a17090720d900b00977cad140a8sm8410416ejb.218.2023.10.10.05.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 05:44:52 -0700 (PDT)
Date: Tue, 10 Oct 2023 14:44:51 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com,
	ruanjinjie@huawei.com, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org,
	kernel@collabora.com
Subject: Re: [PATCH] iio: adc: mt6577_auxadc: Fix kernel panic on suspend
Message-ID: <20231010124451.iopfw2gnc54dap6f@blmsp>
References: <20231010121940.159696-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231010121940.159696-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_054457_531254_6CAB2549 
X-CRM114-Status: GOOD (  16.21  )
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

On Tue, Oct 10, 2023 at 02:19:40PM +0200, AngeloGioacchino Del Regno wrote:
> Commit a2d518fbe376 ("iio: adc: mt6577_auxadc: Simplify with device managed function")
> simplified the driver with devm hooks, but wrongly states that the
> platform_set_drvdata(), platform_get_drvdata() are unused after the
> simplification: the driver data is infact used in .suspend() and
> .resume() PM callbacks, currently producing a kernel panic.
> 
> Reintroduce the call to platform_set_drvdata() in the probe function
> 
> Fixes: a2d518fbe376 ("iio: adc: mt6577_auxadc: Simplify with device managed function")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best,
Markus

> ---
>  drivers/iio/adc/mt6577_auxadc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> index 370b84c2d0ba..3343b54e8e44 100644
> --- a/drivers/iio/adc/mt6577_auxadc.c
> +++ b/drivers/iio/adc/mt6577_auxadc.c
> @@ -293,6 +293,7 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
>  	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
>  			      MT6577_AUXADC_PDN_EN, 0);
>  	mdelay(MT6577_AUXADC_POWER_READY_MS);
> +	platform_set_drvdata(pdev, indio_dev);
>  
>  	ret = devm_add_action_or_reset(&pdev->dev, mt6577_power_off, adc_dev);
>  	if (ret)
> -- 
> 2.42.0
> 

