Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199DFC433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 03:53:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB5F62068F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 03:53:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1iHVJIMw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoY/vrzI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB5F62068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PDsraZH7k/KgY8QfMKehDCoaWbpgY1oeeNDj7kuPt/U=; b=1iHVJIMwRxd0r6EC/2gexaO1v
	JGveR8yn4B2JMqJPU4ykWeTnyCATSsrgYuBlmKEJ2UvGLmMNHhz4BOxHr7gdotY+ve3xiKPQiads1
	1lBPpTY8Cq9ljTZdRaqe6/kWUPD6HUaJH/O7emUbafTz0jHXDxA7ZXr1S8719bUuZXtTiUYEgY4ha
	mdQFCo0qNsiFGTzwKsUws6hmFgXFDUkm6ormKKNS588jGmFXUzVDr5d4m9Od31c37UngTsvjsw3wz
	61VqMyN2m11umq5haFH/+TpU2+XQb6yVTCTV6vUnTksocU7u9Y0ayJFW2qVGw7rd7GYsonJCt1kuN
	55h168xMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jupWk-0005Q8-Fh; Mon, 13 Jul 2020 03:53:14 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jupWh-0005Ph-K2; Mon, 13 Jul 2020 03:53:12 +0000
Received: by mail-pg1-x543.google.com with SMTP id m22so5455421pgv.9;
 Sun, 12 Jul 2020 20:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P/uMBAFsJSFsMe0s271yKJa7p3nRkmMFxcASFVx3X9s=;
 b=VoY/vrzIzoUvpLLOWgA04fLa3of+ub+owBKbOFPm4LdVdlbMRJRIXMVMWrrc9BNOKF
 r1GKF4a3rcQ658wT6pYylfRqzRAtJ0LnTHrzrbJj/RDqE/thsXDNuW6RBEHCF42iA3fG
 xxO+aGacyGOZsWbLTZosotOjPPtD7nZhnnRp2HdoV1MNWNt3v5+07vL98jQ7SEDH37sY
 MbzM0SBQhhYgZpuY/z2NCAsBS4v+BJ/xEnbSN7Axq0kCWAa79y7aPFHi/kmMj0PizaT1
 a9XKlAFkkDACZCXA04uEUl2HNmTg9eaIZMBmmIGD4Qez8apholVrmNLQL7Ak2DfrBBkp
 8Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P/uMBAFsJSFsMe0s271yKJa7p3nRkmMFxcASFVx3X9s=;
 b=uXcymhaZ6RMikjqanoW1hP2SIRM9svhD9TAu1pTs+KjwirF8+MCsJXRJy5qNK2b/Y3
 iva+wky5k2QYW7gSAKJLXUnmR5lV8zy9AOJwIE6TqMHIlwRDGyVJZPsSFzwFGMCQUdyK
 6NwuGmDLZcer7RZleB6CEjO0zFLHw3JS2GWG8Ss0pTmm+gZSpWlk1END/PN0w+vvnNY0
 i6HlWT/SIj/3a6+kt1AM87iSryLZxuW9yLwPcQ5sHRVfAqgFVvg7ngkWP2GbPnIc3G57
 HfePviZSQVkITOn6rJq1dwH/RIIIWJIW1i2jHz2oQ4mr6ZSoBTNn79xKpSSvHruyayyU
 KGRg==
X-Gm-Message-State: AOAM5318Lix1JdftRKvx4T9j2YQNautU4c0PxjaOYk5lsYBbGx5dILPF
 YldCztsm4xEAD0agbtpANu6DsUa1
X-Google-Smtp-Source: ABdhPJwyduixaPXyl9nsR8wsh7T30kYdCLoB5U/CwQARqKP0/h/EygceJsHfNzJNv902tkQp43X7rA==
X-Received: by 2002:a63:f50b:: with SMTP id w11mr66510839pgh.157.1594612387120; 
 Sun, 12 Jul 2020 20:53:07 -0700 (PDT)
Received: from ?IPv6:2001:470:67:5b9:5dec:e971:4cde:a128?
 ([2001:470:67:5b9:5dec:e971:4cde:a128])
 by smtp.gmail.com with ESMTPSA id 207sm13052897pfa.100.2020.07.12.20.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jul 2020 20:53:06 -0700 (PDT)
Subject: Re: [v2 PATCH] usb: gadget: bdc: use readl_poll_timeout() to simplify
 code
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
References: <1594611017-4535-1-git-send-email-chunfeng.yun@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b73d8a90-96cd-42b5-bbc2-26e300da0603@gmail.com>
Date: Sun, 12 Jul 2020 20:53:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594611017-4535-1-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_235311_759260_5E8BAC84 
X-CRM114-Status: GOOD (  20.31  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 7/12/2020 8:30 PM, Chunfeng Yun wrote:
> Use readl_poll_timeout() to poll register status
> 
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2 changes, suggested by Stephen:
>   1. use unsigned int instead of int for @usec parameter
>   2. add dev_log() back
>   3. drop "Err" in error log
> ---
>  drivers/usb/gadget/udc/bdc/bdc_core.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
> index 02a3a77..53dccb1 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> @@ -12,6 +12,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/platform_device.h>
>  #include <linux/interrupt.h>
> +#include <linux/iopoll.h>
>  #include <linux/ioport.h>
>  #include <linux/io.h>
>  #include <linux/list.h>
> @@ -29,24 +30,19 @@
>  #include "bdc_dbg.h"
>  
>  /* Poll till controller status is not OIP */
> -static int poll_oip(struct bdc *bdc, int usec)
> +static int poll_oip(struct bdc *bdc, u32 usec)
>  {
>  	u32 status;
> -	/* Poll till STS!= OIP */
> -	while (usec) {
> -		status = bdc_readl(bdc->regs, BDC_BDCSC);
> -		if (BDC_CSTS(status) != BDC_OIP) {
> -			dev_dbg(bdc->dev,
> -				"poll_oip complete status=%d",
> -				BDC_CSTS(status));
> -			return 0;
> -		}
> -		udelay(10);
> -		usec -= 10;
> -	}
> -	dev_err(bdc->dev, "Err: operation timedout BDCSC: 0x%08x\n", status);
> +	int ret;
>  
> -	return -ETIMEDOUT;
> +	ret = readl_poll_timeout(bdc->regs + BDC_BDCSC, status,
> +		(BDC_CSTS(status) != BDC_OIP), 10, usec);

You could probably indent this to the opening parenthesis, but with or
without it:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

and thanks for picking up the MAINTAINERS file update ;)

> +	if (ret)
> +		dev_err(bdc->dev, "operation timedout BDCSC: 0x%08x\n", status);
> +	else
> +		dev_dbg(bdc->dev, "%s complete status=%d", __func__, BDC_CSTS(status));
> +
> +	return ret;
>  }
>  
>  /* Stop the BDC controller */
> 

-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
