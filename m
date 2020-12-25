Return-Path: <SRS0=56RK=F5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E9FC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 14:29:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97B45206FB
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 14:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97B45206FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VLhGQad2vlF9+TWIUqCaUeVysUr+um4kUpmCVpMJx6g=; b=DpAF5SBf9hSrNW/70UIa+rkwx
	hpb/XXG45nkT4N8it2AYIkvaHSkqBoIAwY0oR3vBC/7Cd6zM0qakhGAMGT5igbUCAzfuFMVV9RDGw
	8jKi/7TN8uJksLWxj7ETGN0PXwKFY5optbjYq9N3oyhKRIJYXlp6tcoeQ/2JIq1stt037ukPrqrYE
	ki7SnN4bIDW+4g8K3eCxxVNHlFzZGxIIyzas8hOjGkezWpn2nQj1T72wi5IOeHurM7NX/Qimi/h9Z
	6SWcHA0Ekdl/kEUOe5pBPfP1xfq2E5P/VYuH0T3j/PICbBvfGdMfd6lEwn3fzvheBy249sXHOrnZu
	ASNStjKcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kso5q-0006av-KX; Fri, 25 Dec 2020 14:29:22 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kso5o-0006aH-TV; Fri, 25 Dec 2020 14:29:21 +0000
Received: by mail-ot1-x333.google.com with SMTP id d20so3957430otl.3;
 Fri, 25 Dec 2020 06:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nsPbs8DHI58sfoA8au2KMJ4RcQU8NWYQBWE+deqdVP8=;
 b=JaRObnQphWrMgOyiRTT+2FqVrSA+w0VbAgvj3bEaUGNIJ99bb19A6kaJu1eYOZoD/9
 O1wMrbuASNrMG9FoorXu+pHkvbzhszvlqA8zwRxUuviBWsRL9OSr2SOTiVEH04Uux7w6
 cPzpW0AXTP0hWdM2WSY2qmcaHEuc4sURpSyazoTUo8cfU9feEEbp+8lCHoA4g+M7nQmm
 ifSIyOCUvfNF0+9uYYP6oWITjRumjBW+sk6yAF69ASRgM9HytILa7Q3wjBCg9ydA42iJ
 V0tKo0XdTEZnjLkrTRS3MkvTxqJ+iKsW+YSwBfSZo8OlHrVeeYLLDKXwz5a2vGPjGGdD
 xFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nsPbs8DHI58sfoA8au2KMJ4RcQU8NWYQBWE+deqdVP8=;
 b=KuU7xA2UnC56Ag+3UEjIHU6z8HTX/h68m9fePTWIRCaJwxuB9aJ1iFGfxIGRFamQ9H
 +AxLzOg1hQKwxQVDHeT3TM30tfkkNEGLK6DjbRFXGz7yyX1+nW6x1Ykb1G3VmtiYJI9M
 H90zNfyFfMhZBHyEDZ142yxHvOyJaBBfM+OCEZjO5ZKCPIjHG6lS8c4h5uoDTonX/MM7
 s/u36Y/WEnPp7NSUgWUpi143+JJDE7sYjelQlLaC6CfBrWwUhVbWKctl1hMjweYMf1PU
 +VGFIP3/AklSOcuQztCJxCoagOPPZwkbFm0N443D6SKbw9iCKVr3qwszOA3fE3orM/9L
 93+g==
X-Gm-Message-State: AOAM533bp87n2vBCI8YurZm5KKJfOAbuBRtF5EDKHcoZDbtadq90LL5B
 2kquixam21nR+7wIZlvZsBA=
X-Google-Smtp-Source: ABdhPJzPSuERFbTi4x4E6ykq0fKj+ir8h84udPJU8V+P9rROzdzMCTJzNPsSYou3tCllm6mUVOKhqg==
X-Received: by 2002:a9d:38e:: with SMTP id f14mr25620069otf.201.1608906558764; 
 Fri, 25 Dec 2020 06:29:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a18sm4538519otf.33.2020.12.25.06.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Dec 2020 06:29:18 -0800 (PST)
Subject: Re: [PATCH v1 1/1] driver: watchdog: Remove mtk_wdt_stop() in probe()
 to prevent the system freeze and it doesn't reboot by watchdog problem
To: Freddy Hsin <freddy.hsin@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1608881450-11081-1-git-send-email-freddy.hsin@mediatek.com>
 <1608881450-11081-2-git-send-email-freddy.hsin@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <7de67b5d-0661-d67d-fad3-a2a14ce034bb@roeck-us.net>
Date: Fri, 25 Dec 2020 06:29:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1608881450-11081-2-git-send-email-freddy.hsin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201225_092921_001894_22B2D93B 
X-CRM114-Status: GOOD (  24.09  )
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
Cc: kuohong.wang@mediatek.com, chang-an.chen@mediatek.com,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/24/20 11:30 PM, Freddy Hsin wrote:
> From: "freddy.hsin" <freddy.hsin@mediatek.com>
> 
> Before user space daemon start to access the watchdog device,
> there is a time interval that watchdog is disabled in the
> original flow. If the system freezing at this interval, it
> cannot be rebooted by watchdog hardware automatically.
> 
> In order to solve this problem, the watchdog hardware should be
> kept working, and start hrtimer in framework to ping it by
> setting max_hw_heartbeat_ms and HW_RUNNING used in
> watchdog_need_worker to determine whether the worker should be
> started or not
> 
> Change-Id: I6a041b0922888a90011d7538ee804d80bc8d15ea
> Signed-off-by: freddy.hsin <freddy.hsin@mediatek.com>

Also: $subject should refer to mtk_wdt.

watchdog: mtk_wdt: Do not stop watchdog in probe function

or similar.

Thanks,
Guenter

> ---
>  drivers/watchdog/mtk_wdt.c |   22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index d6a6393..62f08cd 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -195,6 +195,19 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
>  	return 0;
>  }
>  
> +static void mtk_wdt_init(struct watchdog_device *wdt_dev)
> +{
> +	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
> +	void __iomem *wdt_base;
> +
> +	wdt_base = mtk_wdt->wdt_base;
> +
> +	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN) {
> +		set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
> +		mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
> +	}
> +}
> +
>  static int mtk_wdt_stop(struct watchdog_device *wdt_dev)
>  {
>  	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
> @@ -266,16 +279,17 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
>  	mtk_wdt->wdt_dev.max_timeout = WDT_MAX_TIMEOUT;
>  	mtk_wdt->wdt_dev.min_timeout = WDT_MIN_TIMEOUT;
> +	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = (WDT_MAX_TIMEOUT - 1) * 1000;
>  	mtk_wdt->wdt_dev.parent = dev;
>  
> +	watchdog_set_drvdata(&mtk_wdt->wdt_dev, mtk_wdt);
> +
> +	mtk_wdt_init(&mtk_wdt->wdt_dev);
> +
>  	watchdog_init_timeout(&mtk_wdt->wdt_dev, timeout, dev);
>  	watchdog_set_nowayout(&mtk_wdt->wdt_dev, nowayout);
>  	watchdog_set_restart_priority(&mtk_wdt->wdt_dev, 128);
>  
> -	watchdog_set_drvdata(&mtk_wdt->wdt_dev, mtk_wdt);
> -
> -	mtk_wdt_stop(&mtk_wdt->wdt_dev);
> -
>  	watchdog_stop_on_reboot(&mtk_wdt->wdt_dev);
>  	err = devm_watchdog_register_device(dev, &mtk_wdt->wdt_dev);
>  	if (unlikely(err))
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
