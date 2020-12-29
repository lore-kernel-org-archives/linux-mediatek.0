Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653E0C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 15:08:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DF05208BA
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 15:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DF05208BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u/1kFVwLwekbs1/M58/wt+xROXjyLZqXkJn5Zn9TBlc=; b=iMIJQbHxYp6MXRv0QHUEqTNLC
	F6aR70mfZn71jFBqXBJpMEKA25StBdJVx40j8DF5QmbrhporG+jB3haGPC6xfZ/RR6/vfD0Kan+J+
	zDVbjqp58fX0j7Igpdvmz19Jcxo17PJfKRn4xJWu85YTlDJG29hix07wKRJQKrBmZXbvS4ow1aONv
	gVpJmnSUxVoSo4IpJVqH/Pk1idwX9aINMGaEDab2efiyFaPy/bEGIl+Sso1DvTtJgPJ2KVck/AoG+
	6lAqeDk06nxD2OZmwiwbkhAsdFskQzUyy8QeGxNwWnKtE1PFhREJyTbKfAlK5tg4OR12quaP7aZZP
	CznRM3aqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuGc5-0004JH-H6; Tue, 29 Dec 2020 15:08:41 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuGc2-0004Ie-BH; Tue, 29 Dec 2020 15:08:39 +0000
Received: by mail-ot1-x329.google.com with SMTP id a109so12051240otc.1;
 Tue, 29 Dec 2020 07:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xZHSBiVUwIgDg8uKaPgW1PwpX2gYJ+881jDSzgwCR8I=;
 b=krRu67xNHcyuy+xtlmdsRTOxEZYxgZFANHeIJCF33c1xHYVierz/5wmtgyBdqQQFlq
 wmCXg0noFHs+aIk76kJUAxfCswjrtFxZUn4kPpESQXRamsRG+99kaKlBylJtQ2aLNodH
 N4XhXJ8wDFU2d7p+VChdcyI8aTirF4czvep/IhkvTlrvh+6atrV4Eri5Zk64hcMRcm6M
 RgRjDku++IDEz44wvtc2I/cRJHV6Mmo33mNe4l37RRGThV7EAM9HtMRlTnvEfKYEytFZ
 YcJlLKwtrniWEtfENn5X2xJgYpnN4qO8kwn0QU38cBSpcN/b9jTi1il/XBi1Dvz43468
 PUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xZHSBiVUwIgDg8uKaPgW1PwpX2gYJ+881jDSzgwCR8I=;
 b=hdz7qR4BWRISdhLPLPwX8lw4YATgMZ68EFHPw7teCIel4sn62R8k3aK6xGEYeyHVMk
 gif2ynSPASgB8v08wIaFpJVYgRyFGnGDdPEJ4aXRo8Ty76V33pgx09NXdo9N4UHbBv92
 U/Jixy4gdK06u6h37buiXAgNlJspTktXobg1/llWYajR+HzBSnWHry3sG4tWS5CFugUZ
 NrQ7iVTlH3IIpmJ2CpZrYhydlfXmL28MT+13M9vqW7CU2JFGIXL2Oan1zFS9HXhzLnqs
 fkxLqnkLZhRcZkycOTiQE8Nfb6/NGkOP58qt9miA4y5nab7CWnXXLZSxi+nedzEqPtFh
 Fu7A==
X-Gm-Message-State: AOAM530x5hcihiN+7h9BIN7DlCmavnTxVSZQIjS/QAczYX74FnqpxGXg
 MOJSEiORRzRq9kFnnA5h1zE=
X-Google-Smtp-Source: ABdhPJw5EzW3ziBTpnlwb0NPA8Dnhql3bbfxvHSVyRQMLL3tnDcV6wcSXOka27KeWWKCK79HBJSWmw==
X-Received: by 2002:a05:6830:2397:: with SMTP id
 l23mr35530195ots.357.1609254511970; 
 Tue, 29 Dec 2020 07:08:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 y10sm10077491ota.42.2020.12.29.07.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Dec 2020 07:08:30 -0800 (PST)
Subject: Re: [PATCH v1 1/1] driver: watchdog: Remove mtk_wdt_stop() in probe()
 to prevent the system freeze and it doesn't reboot by watchdog problem
To: "Freddy.Hsin" <freddy.hsin@mediatek.com>
References: <1608881450-11081-1-git-send-email-freddy.hsin@mediatek.com>
 <1608881450-11081-2-git-send-email-freddy.hsin@mediatek.com>
 <a3851099-128a-1305-0f76-66af3c9c6e63@roeck-us.net>
 <1609231194.9252.6.camel@mtkswgap22>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <01d27a27-4dd7-8ffb-cc00-81def958f659@roeck-us.net>
Date: Tue, 29 Dec 2020 07:08:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1609231194.9252.6.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_100838_411678_AB61D266 
X-CRM114-Status: GOOD (  24.56  )
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
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?Q2hhbmctQW4gQ2hlbiAo6Zmz5pi25a6JKQ==?= <Chang-An.Chen@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/29/20 12:39 AM, Freddy.Hsin wrote:
> On Fri, 2020-12-25 at 22:27 +0800, Guenter Roeck wrote:
>> On 12/24/20 11:30 PM, Freddy Hsin wrote:
>>> From: "freddy.hsin" <freddy.hsin@mediatek.com>
>>>
>>> Before user space daemon start to access the watchdog device,
>>> there is a time interval that watchdog is disabled in the
>>> original flow. If the system freezing at this interval, it
>>> cannot be rebooted by watchdog hardware automatically.
>>>
>>> In order to solve this problem, the watchdog hardware should be
>>> kept working, and start hrtimer in framework to ping it by
>>> setting max_hw_heartbeat_ms and HW_RUNNING used in
>>> watchdog_need_worker to determine whether the worker should be
>>> started or not
>>>
>>> Change-Id: I6a041b0922888a90011d7538ee804d80bc8d15ea
>>> Signed-off-by: freddy.hsin <freddy.hsin@mediatek.com>
>>> ---
>>>  drivers/watchdog/mtk_wdt.c |   22 ++++++++++++++++++----
>>>  1 file changed, 18 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>>> index d6a6393..62f08cd 100644
>>> --- a/drivers/watchdog/mtk_wdt.c
>>> +++ b/drivers/watchdog/mtk_wdt.c
>>> @@ -195,6 +195,19 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
>>>  	return 0;
>>>  }
>>>  
>>> +static void mtk_wdt_init(struct watchdog_device *wdt_dev)
>>> +{
>>> +	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>>> +	void __iomem *wdt_base;
>>> +
>>> +	wdt_base = mtk_wdt->wdt_base;
>>> +
>>> +	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN) {
>>> +		set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
>>> +		mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
>>> +	}
>>> +}
>>> +
>>>  static int mtk_wdt_stop(struct watchdog_device *wdt_dev)
>>>  {
>>>  	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>>> @@ -266,16 +279,17 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>>>  	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
>>>  	mtk_wdt->wdt_dev.max_timeout = WDT_MAX_TIMEOUT;
>>
>> No longer needed if max_hw_heartbeat_ms is set.
> 
> Got it. it will be removed in V2 patch
> 
>>
>>>  	mtk_wdt->wdt_dev.min_timeout = WDT_MIN_TIMEOUT;
>>> +	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = (WDT_MAX_TIMEOUT - 1) * 1000;
>>
>> This needs explanation. Why WDT_MAX_TIMEOUT - 1 ?
> 
> In watchdog_need_worker(), there is a condition for starting worker (hm
> && watchdog_active(wdd) && t > hm), so I think in the case
> that watchdog_active is true, the t (timeout) should be greater than
> hm (max_hw_heartbeat_ms) or the worker will not work. Shouldn't I
> consider for this case?
> 

You are claiming that the watchdog core is buggy. Make your case there, not here.

Guenter

>>
>>>  	mtk_wdt->wdt_dev.parent = dev;
>>>  
>>> +	watchdog_set_drvdata(&mtk_wdt->wdt_dev, mtk_wdt);
>>> +
>>> +	mtk_wdt_init(&mtk_wdt->wdt_dev);
>>> +
>>
>> Setting the chip (with the maximum timeout) ...
>>
> Got it. mtk_wdt_init will be moved after watchdog_init_timeout in V2
> 
> BRs,
> FreddyHsin
> 
>>>  	watchdog_init_timeout(&mtk_wdt->wdt_dev, timeout, dev);
>>
>> just before initializing/setting the real timeout doesn't really make sense.
>>
>>>  	watchdog_set_nowayout(&mtk_wdt->wdt_dev, nowayout);
>>>  	watchdog_set_restart_priority(&mtk_wdt->wdt_dev, 128);
>>>  
>>> -	watchdog_set_drvdata(&mtk_wdt->wdt_dev, mtk_wdt);
>>> -
>>> -	mtk_wdt_stop(&mtk_wdt->wdt_dev);
>>> -
>>>  	watchdog_stop_on_reboot(&mtk_wdt->wdt_dev);
>>>  	err = devm_watchdog_register_device(dev, &mtk_wdt->wdt_dev);
>>>  	if (unlikely(err))
>>>
>>
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
