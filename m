Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04A4C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 03:29:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A3FC61452
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 03:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A3FC61452
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=miL2l4HUQR34zYCy5AQVIJP+Tb9EvshdmTCVGPHl6vE=; b=nd0XgO5IcY7WR+j/9AiiIudyV
	YhSxPvIEuKBXB1NTxM2z4jHo2RFxbdDEp9iSiOp2/VQC3y780D6TofOLxOzkKOrEtXN+hS5n4WAv5
	N1iTGMqamk8r3x9atJEx1wW5DTD6nOUA9ev7Xd5CkVOuJ3toF56lnxDe5BuynHdcY4o4htNuTRml6
	kNIl19rxc5p84gLgyJDsd+anL98Wk9Jyma7Cmz6b1f8ERHLJZXUO9+2Sxqr88HIT6/eDR6tR5+tiz
	0JzNUW/znqbQALXlU52c1JO3JBm3swV0hCeHF9vH2Y66/GdC/DrcwnfAw5nc4+/h4Fj9Q5xqKxyoy
	tFvyxOllQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmVF-000T7e-VY; Fri, 23 Apr 2021 03:29:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmV7-000T6L-Ir; Fri, 23 Apr 2021 03:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=1upb3UwlpjSwcPkYN75X6/2ZBEc2jskb7/XEm7owznc=; b=Edv5olyzh9ZacgDfMV4lgsAtQd
 UtdyyMju3KHnvKsyVipncyRnrtvdtRaR6oFUnyZUpFQTrmOvjRK2WVKOuknsQVV2OBq1Fmkv3F4L6
 cSdsZb07tH11Vt1JjFIIS0HDHDAbxm+aDItuR5tq3i8f0bC/BAl4C0NjUMq5oxBLOdjrfb0eBnbH8
 YOS4EWWeaYg96p+/+HgvscDLFX7D4uSeofO4EtY2rw+Q/xvQwc1aT6eG4gW0o4WomewI+VQukRq60
 0mN58eLJ6MXuGnkmp6CffuE57MW2bxUCOJbDwjOG4d050F68cgNScfUSqmsodnbpujissL1nTSYvg
 cckiVD6w==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmV4-00E7DJ-Iu; Fri, 23 Apr 2021 03:29:04 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so39082835otf.12; 
 Thu, 22 Apr 2021 20:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1upb3UwlpjSwcPkYN75X6/2ZBEc2jskb7/XEm7owznc=;
 b=iK4kZXJgnoW7pLY09tMdeK6JxkJQFX+eGaE+UJKX1PU6eSM2nwRl5MQ0mwMBYUZ4WD
 7Z0uYPgnd3rbaHj/mbe0DNUc7dFgCWT/+D2htMGnOOWeZtEwIFz4jifH7MAHIygDqQe2
 FRrVnjMeeoU0YPJ7xnftC9Oayo2h22cobD33A8YAW0u/Rs4oWp3e6lQlF+jmS0dcAKEZ
 X+Vn+huAQBqIxZrUTLN5zykla5I7+z4eLdlq/UvuOmYB6WTYOkV99Vtuaa3UAo9JEOQ3
 57eo5k3Colu2Wfg/9tk+kDTOgasF+WU4iotnQjt75gonIP95x2YlA4uRWrswnt1/MSCm
 Vtlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1upb3UwlpjSwcPkYN75X6/2ZBEc2jskb7/XEm7owznc=;
 b=hZ3GHQBfiiazLJ7fBWZ0dBA56AkEesFQxSziWFD2lgjVrXwvNPhIC67izcHlF9u2Ai
 oijQQk7v4wmv9MDiFrjyZ7WHEhqrhngFPlenpNhl938tWcDhpANpop22cdy6NV0fHvrb
 ZdUdnpTqKPBz1yIs62vNy6XvULkiZuYPJSGDEkPb7PKhZo70hPAoDqkKlDqx9uRTl1gQ
 UPG7AbByTQ4eTQCbv3tT//BupF28O0A2POY52g/g5jhIPcrAcWzCsVvrZw3qagaZErf4
 9XlPYOq7P/FQfADM3OzBXV2KXgIWoj52Izn3x6eA2Svt1IZ0ewHjfbV/MAPuc5lXN447
 BL6g==
X-Gm-Message-State: AOAM532KG8L8KjSn2INGhoSPeqkUF39lbpez3xrr/CmwT17rWgW4JnXB
 dgvdelB6O1+mssNnt3BVEVY=
X-Google-Smtp-Source: ABdhPJwFtdIkfkoY5Bd1U8zGq9fOrQBvE8iO9A0LGo7xPIZCmtXV6EvbIjKOh1cgclTm70e15viNQg==
X-Received: by 2002:a05:6830:120a:: with SMTP id
 r10mr1518868otp.47.1619148541567; 
 Thu, 22 Apr 2021 20:29:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t19sm1107255otm.40.2021.04.22.20.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 20:29:00 -0700 (PDT)
Subject: Re: [PATCH V7 1/2] watchdog: mtk: support pre-timeout when the bark
 irq is available
To: Wang Qing <wangqing@vivo.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1619146403-12769-1-git-send-email-wangqing@vivo.com>
 <1619146403-12769-2-git-send-email-wangqing@vivo.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <0de7e5c8-57a2-9b27-d8a8-ed7e0b394b02@roeck-us.net>
Date: Thu, 22 Apr 2021 20:28:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1619146403-12769-2-git-send-email-wangqing@vivo.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_202902_667786_9F701C20 
X-CRM114-Status: GOOD (  34.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4/22/21 7:53 PM, Wang Qing wrote:
> Use the bark interrupt as the pretimeout notifier if available.
> 
> When the watchdog timer expires in dual mode, an interrupt will be
> triggered first, then the timing restarts. The reset signal will be
> initiated when the timer expires again.
> 
> The pretimeout notification shall occur at timeout-sec/2.
> 
> V2:
> - panic() by default if WATCHDOG_PRETIMEOUT_GOV is not enabled.
> 
> V3:
> - Modify the pretimeout behavior, manually reset after the pretimeout
> - is processed and wait until timeout.
> 
> V4:
> - Remove pretimeout related processing. 
> - Add dual mode control separately.
> 
> V5:
> - Fix some formatting and printing problems.
> 
> V6:
> - Realize pretimeout processing through dualmode.
> 
> V7:
> - Add set_pretimeout().
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  drivers/watchdog/mtk_wdt.c | 76 +++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 71 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 97ca993..ab3ac5d
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -25,6 +25,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/types.h>
>  #include <linux/watchdog.h>
> +#include <linux/interrupt.h>
>  
>  #define WDT_MAX_TIMEOUT		31
>  #define WDT_MIN_TIMEOUT		1
> @@ -184,15 +185,23 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  {
>  	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>  	void __iomem *wdt_base = mtk_wdt->wdt_base;
> +	unsigned int timeout_interval = timeout;
>  	u32 reg;
>  
>  	wdt_dev->timeout = timeout;
> -
> +	/*
> +	 * In dual mode, irq will be triggered at timeout / 2
> +	 * the real timeout occurs at timeout
> +	 */
> +	if (wdt_dev->pretimeout) {
> +		wdt_dev->pretimeout = timeout / 2;

min_timeout is set to 1. I don't this works well if timeout == 1.
You'll either need to set min_timeout to 2, or handle that case.

> +		timeout_interval = wdt_dev->pretimeout;

timeout_interval is unnecessary. Just update timeout accordingly.
It needs to take the situation of timeout == 1 into account, though.

> +	}
>  	/*
>  	 * One bit is the value of 512 ticks
>  	 * The clock has 32 KHz
>  	 */
> -	reg = WDT_LENGTH_TIMEOUT(timeout << 6) | WDT_LENGTH_KEY;
> +	reg = WDT_LENGTH_TIMEOUT(timeout_interval << 6) | WDT_LENGTH_KEY;
>  	iowrite32(reg, wdt_base + WDT_LENGTH);
>  
>  	mtk_wdt_ping(wdt_dev);
> @@ -239,13 +248,46 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>  		return ret;
>  
>  	reg = ioread32(wdt_base + WDT_MODE);
> -	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	if (wdt_dev->pretimeout)
> +		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	else
> +		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
>  	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
>  	iowrite32(reg, wdt_base + WDT_MODE);
>  
>  	return 0;
>  }
>  
> +static int mtk_wdt_set_pretimeout(struct watchdog_device *wdd,
> +					unsigned int timeout)
> +{
> +	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdd);
> +	void __iomem *wdt_base = mtk_wdt->wdt_base;
> +	u32 reg = ioread32(wdt_base + WDT_MODE);
> +
> +	if (timeout && !wdd->pretimeout) {
> +		wdd->pretimeout = wdd->timeout / 2;
> +		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	} else if (!timeout && wdd->pretimeout) {
> +		wdd->pretimeout = 0;
> +		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	} else
> +		return 0;
> +
> +	iowrite32(reg, wdt_base + WDT_MODE);

What is the point of setting the mode here ? It will
be set again in mtk_wdt_set_timeout(). Seems to me all
you need to do here is to set wdd->pretimeout,
then call mtk_wdt_set_timeout().

Guenter

> +
> +	return mtk_wdt_set_timeout(wdd, wdd->timeout);
> +}
> +
> +static irqreturn_t mtk_wdt_isr(int irq, void *arg)
> +{
> +	struct watchdog_device *wdd = arg;
> +
> +	watchdog_notify_pretimeout(wdd);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static const struct watchdog_info mtk_wdt_info = {
>  	.identity	= DRV_NAME,
>  	.options	= WDIOF_SETTIMEOUT |
> @@ -253,12 +295,21 @@ static const struct watchdog_info mtk_wdt_info = {
>  			  WDIOF_MAGICCLOSE,
>  };
>  
> +static const struct watchdog_info mtk_wdt_pt_info = {
> +	.identity	= DRV_NAME,
> +	.options	= WDIOF_SETTIMEOUT |
> +			  WDIOF_PRETIMEOUT |
> +			  WDIOF_KEEPALIVEPING |
> +			  WDIOF_MAGICCLOSE,
> +};
> +
>  static const struct watchdog_ops mtk_wdt_ops = {
>  	.owner		= THIS_MODULE,
>  	.start		= mtk_wdt_start,
>  	.stop		= mtk_wdt_stop,
>  	.ping		= mtk_wdt_ping,
>  	.set_timeout	= mtk_wdt_set_timeout,
> +	.set_pretimeout	= mtk_wdt_set_pretimeout,
>  	.restart	= mtk_wdt_restart,
>  };
>  
> @@ -267,7 +318,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct mtk_wdt_dev *mtk_wdt;
>  	const struct mtk_wdt_data *wdt_data;
> -	int err;
> +	int err, irq;
>  
>  	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
>  	if (!mtk_wdt)
> @@ -279,7 +330,22 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(mtk_wdt->wdt_base))
>  		return PTR_ERR(mtk_wdt->wdt_base);
>  
> -	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq > 0) {
> +		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
> +					&mtk_wdt->wdt_dev);
> +		if (err)
> +			return err;
> +
> +		mtk_wdt->wdt_dev.info = &mtk_wdt_pt_info;
> +		mtk_wdt->wdt_dev.pretimeout = WDT_MAX_TIMEOUT / 2;
> +	} else {
> +		if (irq == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +
> +		mtk_wdt->wdt_dev.info = &mtk_wdt_info;
> +	}
> +
>  	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
>  	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
>  	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT * 1000;
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
