Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1EFC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 14:59:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56F9E64E1F
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 14:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56F9E64E1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fxbQhT7Ag70Aj3UEyjCakTMewqulDlCsyT1HXtV6nKQ=; b=tWkH4m0tMmdVpPcQWHMvaeEDz
	HaNGGAn8pFFHEcqx3Y9IieUOWoPtJFF63uKlNT1YXuBMvLfIEyWGn6ahAnGqAvCBUSB8C6TmV3Ufc
	mBuflD6RVyx8PCCrrfnTRbElFJFgXwoUKywP11CkRpyqviVhM9cnkTr+A32HkzjsbsXoxfJszwsIZ
	4nXVcMeNmCjpkMNSEIo8M7I0cER3z/oZGnjSsdyIkbY7EQnnBmheeQYKjUMzPPOeZno6ghWSPZlit
	FE25aHPOsFghMnc65ZpNX8Zc29wRFtxipIbfgMYd90/YXLT3v/yNdm9fYGAZz2jMUy8iUZ1O6FnH4
	1qSMjMqPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6ECV-0001Sp-Ck; Sun, 31 Jan 2021 14:59:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6ECT-0001SA-Fb; Sun, 31 Jan 2021 14:59:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id i9so11028837wmq.1;
 Sun, 31 Jan 2021 06:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4aT46G28vzJoBnX9iiIsaSmCpy5np56jMcrWEDGLCgE=;
 b=l5xX7oJCpwybk0kKJpimqxdg3LRZpkUJWSp/E7BeQlQ5bb6VBusuSES6Oi5uIQdb+3
 kX294KdrgrolGoqHznPX48lDQXaEMqqU25rMh/IHyCJsUFK/4NTzKpxn7vvMGMLHtFT3
 gKHqTu3Pcn25xaH7dvMXEXrFa/X0szN+jZqeAkI1M5gN4mGqk2gy63C/kEZ9VyDI/feg
 IILmyk4b86JQZ/QRUVR44AeDh80pLFU4IzjF6Dyu4uQGaZduERzk65MCjXYTycbn197L
 jb9XSGU5YeWvRd2LePDf+/u+FWiPq3ZaeiqogyqU9XpxjpWNMlEOKYHfpe90d0Z/7F5f
 yjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4aT46G28vzJoBnX9iiIsaSmCpy5np56jMcrWEDGLCgE=;
 b=gMu0YgCi26pti8+8UWujI2bbpycHjAbTzgLIHjrkr/jVIKhNNLr6fKxnJAWIklNx8X
 sqnRb8QC8jTMLCE7lD13Ocjc2dGmjGMO5hXoeN0aJyQMGVW6bc874O0E9Fz2yYkNMx/L
 xt14x4NMzApEwthEbysBC8Byxf+UF3mkU9UjP7nt6eIfNmcfsRftsF5tq8EwMkTDA7ts
 WTDB9ThCypBB58uvioRPRqgEziv0BHRi+K7fqhmsBAVm9wJUHiEeYSDZsd6rwE3mj/18
 BRny10bnlX2ULHPetptXqoPAnZH3mM8GvfJRoptP/cI5c8ktpumzVdwXLSYDg59wWo3d
 4C/w==
X-Gm-Message-State: AOAM532Aepmo0Dq+K7cAxMCPQIEWADec9Qcyyn5PHBnsK0GTQ3jdd+u6
 7a3UNq4AJiI3613ZybH/xl3MkODgMkaQGhsC
X-Google-Smtp-Source: ABdhPJxH9y0L+8UHG7ALoVCnNf478ueZoH4sFRLVR6hzynO+RgpUih7R5yZbnRlVyxw5ZpZqf6DGZw==
X-Received: by 2002:a1c:e146:: with SMTP id y67mr7643190wmg.55.1612105180308; 
 Sun, 31 Jan 2021 06:59:40 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id y67sm18886083wmg.47.2021.01.31.06.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 06:59:39 -0800 (PST)
Subject: Re: [PATCH] soc: mediatek: pm-domains: Don't print an error if child
 domain is deferred
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20210113213012.67643-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <60cb2364-7bc5-61da-c4e4-878fa7327776@gmail.com>
Date: Sun, 31 Jan 2021 15:59:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113213012.67643-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_095941_598177_E251F372 
X-CRM114-Status: GOOD (  18.35  )
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
Cc: drinkcat@chromium.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 hsinyi@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 13/01/2021 22:30, Enric Balletbo i Serra wrote:
> Child domains can be deferred by the core because one of its resources
> is not available yet, in such case, it will print an error, but
> later it will succeed to probe. Fix that using the dev_err_probe()
> function so it only prints an error on a real error.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Applied to v5.11-next/soc

Thanks

> ---
> 
>  drivers/soc/mediatek/mtk-pm-domains.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index ae255aa7b1a9..8055fb019ba6 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -480,8 +480,8 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
>  
>  		child_pd = scpsys_add_one_domain(scpsys, child);
>  		if (IS_ERR(child_pd)) {
> -			ret = PTR_ERR(child_pd);
> -			dev_err(scpsys->dev, "%pOF: failed to get child domain id\n", child);
> +			dev_err_probe(scpsys->dev, PTR_ERR(child_pd),
> +				      "%pOF: failed to get child domain id\n", child);
>  			goto err_put_node;
>  		}
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
