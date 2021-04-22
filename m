Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6541C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 03:32:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A90161450
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 03:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A90161450
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T+0ADgKDwlQwbJh6UrHY4vaw7SnTjaVbUJUjRtr8294=; b=lwN96mb43zaDwR9/V/QH4v9dN
	s8tictVJSUWZgwB4TwSCfFtfi6ZZz7FPOiJmPB98LP4LDy7ICIvyhDqoQIHqdgUml/hdJgTQgGHh/
	TuJ/EZ5m5qBe6qlnLEm9W/qwkSmiUrg00KTWSJY65RVjoOv/o/K16hi5Z87l/KQkaaPNrXrv2BzxG
	Ds6Kqk7Wo5oFUGF8x50pO4sTwEM8h8MeKCQ2tY02nD3ekb2JDVeiEWSmEUswFGJISth91c/LFv+kB
	4A8Sg2hIrDakUUa7LrvLWHrxqrHgdrEHesLOQfIrIzazrbIB3P/BBHy5UEbmYiLhqJqvFIXdMfVJ5
	mbLCxvevQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQ4z-00FhJ8-9F; Thu, 22 Apr 2021 03:32:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQ4w-00FhIM-0T; Thu, 22 Apr 2021 03:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=t4JATgNYVP+y6MC8vs7Eht1rI6ywz9pTx+5OML5eawI=; b=hIe9bs3GSCgOXFPvxJyykV9fmW
 iKiOHZEGkG5jvmA+AXIeDfrIBvIaRN8bLuNKOsm7DoFPK+lBJlpKFZQ4ymupvtfiyo3qKtWXfQ75V
 t3kNwOqP6fBfgph5/6xtQBh5YLeKqBwiCee6Npto4Pa053553GKDLZnt8ZHudK3imIkJYlHfsc2nb
 O/70Sz7j+SzPIyY/NyEMgwyGgW6+e8xg5xAt/+KlKzLTk005oxtwW+FUNddKQrrVf2I21FDWbn/Ul
 CT+mwGeAN4OOw6tcQVyiOLQUImU4AddDlNV92XEB1LqxbhC7wMumQISCPFkUNhRGnen+iHPOR91h8
 qvsrqHtA==;
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQ4t-00DKvw-EZ; Thu, 22 Apr 2021 03:32:32 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id
 s1-20020a4ac1010000b02901cfd9170ce2so9659486oop.12; 
 Wed, 21 Apr 2021 20:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t4JATgNYVP+y6MC8vs7Eht1rI6ywz9pTx+5OML5eawI=;
 b=ejo7iTgB2CPmu+e98ZgOEqS9DwPgMq/4k662gfkQ9bIw/2JEQ3kjP3M9kMJD4u2L88
 L6cl7bcTwLVZ4ZQAoVMJzzWn0A+quC0YcanaiBFU0ejB+fehQs7YIOkfYnkesu0JSTdk
 UW6LOsxVVto99qBRKAICrEiPoyfOmKMYPuIOih36e5h4uym/TmcgyGO/62XsI28ex300
 JxGt/h/53KFvNm7zAnNyK1Q1SHYrDvVdpFEJ/jar/Hko/gjf5cwZCg26QYOjhxiquOOh
 QF0xbWgb1KD9T4OENAYMOS0Say3i/9SeWeSZ5qTyOoFtAHuzUesRF74gGgs3IWa558VF
 L3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=t4JATgNYVP+y6MC8vs7Eht1rI6ywz9pTx+5OML5eawI=;
 b=uhxHaGlQ+FnUf/ErkQYxYsmxuZX+HB4OK2pSAduMW8F8ttoK7z/N1smkL/7cS32Eud
 DgkRhIwCVkcFTruxX9araEViok9eg3cFG0Y3hfMINgdCPmfM1GmeoO5VeIMxviGLMF2f
 aV8XTjxEo8asnB6J6IlG7Jx/fYcUkUAmfx2fQ/1CyD+gI+MtGXeqQnfj7o6SoWk8kcmY
 M0nbez8DNVzAxjN9F7NX2rRN6/KWMYNOSXNP7r5AU8SR7kf8DzbNFICofgJCfEp3zoPz
 hMughWQiyFjhvYqMKNy6d8Nq3ZBbFCgsQyD23IJ6GuyLgvEAVYv/0EndfZrSHnd1SOOL
 9c+A==
X-Gm-Message-State: AOAM532FQPHdDm/rcM6tWOb8zwi6ebduRFioEcoXBDUfN9Av9aD4TCxx
 ftqzLxRZ7g3QRK7+sygAvYY=
X-Google-Smtp-Source: ABdhPJzoJ4z9VtrNCQN7lDYIm23Vgn4Pnjc/xlmO3L4HxQptcdi7CnvaRF8lG/ibSDw7c7IMPfWx2A==
X-Received: by 2002:a4a:48c2:: with SMTP id p185mr783409ooa.73.1619062346761; 
 Wed, 21 Apr 2021 20:32:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h28sm329541oof.47.2021.04.21.20.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 20:32:26 -0700 (PDT)
Subject: Re: [PATCH V6 2/2] doc: mtk-wdt: support pre-timeout when the bark
 irq is available
To: Wang Qing <wangqing@vivo.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1619059532-17805-1-git-send-email-wangqing@vivo.com>
 <1619059532-17805-3-git-send-email-wangqing@vivo.com>
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
Message-ID: <c7ec61dc-ae04-6c09-ab26-d432f1d5f13a@roeck-us.net>
Date: Wed, 21 Apr 2021 20:32:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1619059532-17805-3-git-send-email-wangqing@vivo.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_203231_523168_0EF24F3C 
X-CRM114-Status: GOOD (  15.80  )
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

On 4/21/21 7:45 PM, Wang Qing wrote:
> Add description of pre-timeout in mtk-wdt.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index e36ba60..ae57d6c
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -1,5 +1,8 @@
>  Mediatek SoCs Watchdog timer
>  
> +The watchdog supports a pre-timeout interrupt that fires timeout-sec/2
> +before the expiry.
> +

Seems to me the interrupt should be listed as optional property.

Guenter

>  Required properties:
>  
>  - compatible should contain:
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
