Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B7BC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 09:05:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CC18205F4
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 09:05:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F/GKIBWe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoDYuhXS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CC18205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z6sBsi0Dx9y15IGRtQd6CYkrASsB4UYoqDQ5G2N9zVI=; b=F/GKIBWeV/9s9YjbYqkPN9KKX
	kqb9s7YZbIL/lp5BfZiHw8B2jATiTJinXGIzkSJHGDgfuXjxiAuTQMnR0T2xfWPZKyLPAJxSrtl6x
	CJ6Q+O/ZByQZE5ZEcL4Cv6xSpxKzn07bzmI+aTy9FgVqiGylaGD6Ic7E5TljMr1Q8rduAwESvNV6x
	fAsN201EWztQ3I0M7bQpN9kCZSSCxVZgGnZmcPmarp8NcKZA9LC0/O9cW/wbYbMDy09HZ3d2sdq9A
	yj8uPu4Qr78DzYlbSREERn0UER/po5gTR1BKEDDSvJe0j6CNmTvHfoV8fnpSIcLF+Jmnb7V4OycbZ
	eiYwN2glg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOGzo-0003Ir-ED; Fri, 02 Oct 2020 09:04:56 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOGzm-0003Hv-5a; Fri, 02 Oct 2020 09:04:54 +0000
Received: by mail-wm1-x342.google.com with SMTP id e2so909274wme.1;
 Fri, 02 Oct 2020 02:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qFbZVEFOo9elK0nsgeUP///LqF9DZa97QUZx/Et/nCQ=;
 b=eoDYuhXS4JXmAa8VaGf28tPEEvCrCfFFL5oNJ8c2sq3ZxLvCo/wJko+AQjUTxctibx
 d/4Ze8SUgEz1x5F/tKz1bAZ0G9Y9KZ/IGBdeUTtNeWabgBJFkGhOd4ksLZTczM/BkR7y
 kZVmS04orPgCzeRl1BB2igsDgz0+sTAcEwHv/qc1Y+XjWjJVnR9wDRyN4mKwgzPlcapy
 uFGgOFBGiPGzs7qfrLk96sWC4ml1Sk7+hPBqqCjdBdoebUQ4uxOOCIGIo9XRyKP5xw0r
 C5VEbni8QUd3ZglNfISRyiG2ejQnIFPajEWRv5O7tLKg0Qt5xqfwajmSq90VS1TgqJ0x
 cfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qFbZVEFOo9elK0nsgeUP///LqF9DZa97QUZx/Et/nCQ=;
 b=pHSaYPl7DxqYK+Y3DEzgUKU07yGc2429PX63aUrHOJFLueROxxvZgUIL7/sFkWWJy+
 OnPqRTRqNvordvp8YO/MfpCOVU5yuMgpRprzF5l5FDQ0/fR55m+OOdtSDXRQUlBB9+QW
 zRN13AqjOfV0QaO9abhHob9nxsuV/XwQMl1hPqHX2vUjoD/zrL0vnkqr5lG5SZiVdklb
 qcC8eA993k+ZcWFMlWZeIB7YrOok201DAt6rX/qxuE7YKmg/Uz/knRLauCKeQUxaANVU
 7yxfIhxITRZeiK2n2M1Ojf15l5jKZpz2RrIBvLhkdizThfNdBIDbhJO3wr0PX2W9y6FR
 5LIA==
X-Gm-Message-State: AOAM530nV6Xa7Y6BUzn1sBwO3l6wgtZn9Rm9Iyb4k8kBon4xRLkxjKvr
 y94S15ObFPJwwi+iRpRkOoV2beu13Rfusw==
X-Google-Smtp-Source: ABdhPJxdJUJFUkdUk83/VZEqiiRbaw+nZR16/sLO/3+w3JdtUO61nqVxdUrwv69Anzp3QXIIOHhOSA==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr1673883wml.176.1601629492205; 
 Fri, 02 Oct 2020 02:04:52 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id g12sm991740wro.89.2020.10.02.02.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 02:04:51 -0700 (PDT)
Subject: Re: [PATCH v2 08/12] soc: mediatek: pm-domains: Add subsystem clocks
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20201001160154.3587848-1-enric.balletbo@collabora.com>
 <20201001160154.3587848-9-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d6d132ba-1ce1-f537-57ba-4b6bed784b48@gmail.com>
Date: Fri, 2 Oct 2020 11:04:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201001160154.3587848-9-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_050454_309716_41CF03AA 
X-CRM114-Status: GOOD (  25.27  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com, fparent@baylibre.com,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 01/10/2020 18:01, Enric Balletbo i Serra wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> For the bus protection operations, some subsystem clocks need to be enabled
> before releasing the protection. This patch identifies the subsystem clocks
> by it's name.
> 
> Suggested-by: Weiyi Lu <weiyi.lu@mediatek.com>
> [Adapted the patch to the mtk-pm-domains driver]
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v2:
> - Use dev_err_probe if getting clocks fails, so an error is not printed
>    if is deferred.
> 
>   drivers/soc/mediatek/mtk-pm-domains.c | 89 ++++++++++++++++++++++-----
>   1 file changed, 75 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index e0a52d489fea..2075072f16da 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
[...]
>   
> +	for (i = 0; i < pd->num_subsys_clks; i++) {
> +		struct clk *clk = of_clk_get(node, i + clk_ind);
> +
> +		if (IS_ERR(clk)) {
> +			ret = PTR_ERR(clk);
> +			dev_err_probe(scpsys->dev, PTR_ERR(clk),
> +				      "%pOFn: failed to get clk at index %d: %d\n",
> +				      node, i + clk_ind, ret);
> +			goto err_put_subsys_clocks;
> +		}
> +
> +		pd->subsys_clks[i].clk = clk;
> +	}
> +
> +	ret = clk_bulk_prepare(pd->num_subsys_clks, pd->subsys_clks);
> +	if (ret)
> +		goto err_put_subsys_clocks;
> +

Not sure if it really matters, but logically we should prepare the basic clocks 
before we prepare the subsystem clocks. And fix the error handling accordingly.

Regards,
Matthias

>   	ret = clk_bulk_prepare(pd->num_clks, pd->clks);
>   	if (ret)
> -		goto err_put_clocks;
> +		goto err_unprepare_subsys_clocks;
>   
>   	/*
>   	 * Initially turn on all domains to make the domains usable
> @@ -462,6 +513,12 @@ static int scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node
>   
>   err_unprepare_clocks:
>   	clk_bulk_unprepare(pd->num_clks, pd->clks);
> +err_unprepare_subsys_clocks:
> +	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> +err_put_subsys_clocks:
> +	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
> +	devm_kfree(scpsys->dev, pd->subsys_clks);
> +	pd->num_subsys_clks = 0;
>   err_put_clocks:
>   	clk_bulk_put(pd->num_clks, pd->clks);
>   	devm_kfree(scpsys->dev, pd->clks);
> @@ -541,6 +598,10 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
>   	clk_bulk_unprepare(pd->num_clks, pd->clks);
>   	clk_bulk_put(pd->num_clks, pd->clks);
>   	pd->num_clks = 0;
> +
> +	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> +	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
> +	pd->num_subsys_clks = 0;
>   }
>   
>   static void scpsys_domain_cleanup(struct scpsys *scpsys)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
