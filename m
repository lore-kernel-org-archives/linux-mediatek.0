Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AA9C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 10:19:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F082E22263
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 10:19:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jb539OQJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgwBPyAw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F082E22263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RnRYC/ugQlNfoEVUDcdLI8Kn8p9w55rONrDrqKaxp5k=; b=Jb539OQJqhMGvjSoI4UzOSaXl
	XPrMcnzkS3scuL8M3ggB1h6gXxpOWT9lGb7hP+xWoE/wK+BIW4khGw/hTl/7UoOeZghChkx5sxPXY
	MqsiGQMA1oKb8FPetlT4sUSZDEFz/eaPt8LnE+m7bq825Fr3E3nPe9WnkpJ/+MwGRT+CGO+2zLC3I
	KvqLznRtR2oBRsvViRWEucRabcajrl26m3+Qb+FZOKuUCM6TPTTwv5+Lhc84JsIF3l7belkwf/isy
	RePTQUVLmqVfS662umlYrO9ibf7gwocSEqyI/qqq52kTl4BlgF3xzJlzKi5NN+Zxwtaur4mSA4UgN
	tLGHuCffg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXM4d-00041b-2I; Tue, 27 Oct 2020 10:19:27 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXM4Z-00040F-1j; Tue, 27 Oct 2020 10:19:23 +0000
Received: by mail-wm1-x343.google.com with SMTP id h22so834214wmb.0;
 Tue, 27 Oct 2020 03:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dkwbI/0H97SZJixhQJH8dswlbjBm943gYERZ83AMoLY=;
 b=hgwBPyAwrmX4gfhR16//+HwE/aO/mjjEpeDp9bXYGGvxR27aJkVXE9ZcKeBAcja9+s
 hRwuJMyXDtLHzeW/+SBYpX3D0WQiiFP0tokRsDKAUmKIKLh/NainCGQvYP1PfEjbYhRo
 nl9yI/xz53C1OXFvwiYN+Kk66xL+N+hPA4nzRYVK1DQ6IxM8o1To/1o2wxt77Y9kJrqs
 /IXjY8qJONoNEoHojlr0UnHijYIMlWE0NrA0i7bn9nhPLAQKcXUtapjXk0BT1gPe0UoX
 xSQZx8QU6hXImlu6ohqnHkjEXlg6fVkAi93H7bm6rFRb1TBWmkxeGbs/ZLw1y9j1oUNH
 AEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dkwbI/0H97SZJixhQJH8dswlbjBm943gYERZ83AMoLY=;
 b=hMTv3ySjRkiiElNeL6p/YPOWvBHW6k61+7ooyhjKHJY3Epmf32oV8kB23X2GbKVsHF
 WvVuqDzsklXGOTIYoJ5WPqM7QUD6K89MAZhQ4GFdTi0UT0kzlLW30P84iD6Q0YY3S6AH
 i2os1MApWm6rieLF8TSITVlfJL4VjIYf0OXpT5zxOOYYA6DcWF2+v41O71VQ0rjPnGRu
 WZqWjKPx+S3xO6h311YE7X+Dgwb4pou1fFpnN+YLQ9TWRvjEqDuScAOAejWLK/B6JmWc
 qjb/xbozZ+9CfsEinScfcV5ww8XR2rw0TEzItGUaEgt6Kh63fttAiUueznTLfZz5NAZs
 8QoQ==
X-Gm-Message-State: AOAM53189LUFqHV/Sggdey3SEhgw+2mUtChTlQFfpSvWdy/r/25DplD3
 CbvC7aMtkcnp04t9IXOGatR8AixEpWw3qQ==
X-Google-Smtp-Source: ABdhPJxeO0DzMU+707HyJRwnPTQmDLgKCotn1ndnwrMruc4M8djY+myKe0PoeIdnRJJaD54MCVb9NQ==
X-Received: by 2002:a1c:9dcc:: with SMTP id g195mr1820127wme.113.1603793962048; 
 Tue, 27 Oct 2020 03:19:22 -0700 (PDT)
Received: from ziggy.stardust ([213.195.117.206])
 by smtp.gmail.com with ESMTPSA id t7sm1367711wrx.42.2020.10.27.03.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 03:19:21 -0700 (PDT)
Subject: Re: [PATCH] mmc: host: mtk-sd: enable recheck_sdio_irq for MT8516 SoC
To: Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mmc@vger.kernel.org
References: <20201023122950.60903-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <7820dbe9-ff62-7cc3-1e60-8d5c0a069abb@gmail.com>
Date: Tue, 27 Oct 2020 11:19:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201023122950.60903-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_061923_162396_002A7734 
X-CRM114-Status: GOOD (  18.62  )
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
Cc: ulf.hansson@linaro.org, chaotian.jing@mediatek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 23/10/2020 14:29, Fabien Parent wrote:
> MT8516 SoC suffers from sometimes losing SDIO IRQs, this makes SDIO
> devices sometimes unstable. Make use of the new property
> recheck_sdio_irq to fix the SDIO stability issues on MT8516.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/mmc/host/mtk-sd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index a704745e5882..3dc102eefe49 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -524,7 +524,7 @@ static const struct mtk_mmc_compatible mt7622_compat = {
>   
>   static const struct mtk_mmc_compatible mt8516_compat = {
>   	.clk_div_bits = 12,
> -	.recheck_sdio_irq = false,
> +	.recheck_sdio_irq = true,
>   	.hs400_tune = false,
>   	.pad_tune_reg = MSDC_PAD_TUNE0,
>   	.async_fifo = true,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
