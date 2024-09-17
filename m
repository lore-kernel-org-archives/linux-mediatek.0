Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A55C36006
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Sep 2024 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJbxN/BoBiYWDohSMCRDVcluwineaYIhEPM4cB3crFw=; b=2xYFGQScwV2v4jFMvwdBT2cePc
	1HzHOTP6QTmOarrZDXMjeVsMkUP6C8DnAitsv5cXaeAL7TAORKJO2mC3e9Nwd+n1JSPxs2AYJuwWs
	hxP7TwxsWKLI6oFVHIRo2zWBi6WnhC8/oU/n8/1nNg5zwUnMRJkG5Km4v74mjv/A3MNxpvTuMjHLB
	Tlxs7isCG60CCCrhg1/0hT9bHSTGTYy5yxcTFeWrr5ICfHrQuA0AslcyWIChnEEwIGHxPGovrsRMU
	mYBGMu5FSwMbs18C8i8K4Y5mThnvFQ7vmqfqCvl6W6HkskKH9dLDiyhgWhixmXnHBmSJjUXRkOr7E
	IgZnZAIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqV84-00000005uJE-0oi0;
	Tue, 17 Sep 2024 10:08:16 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqV81-00000005uIp-2Exd;
	Tue, 17 Sep 2024 10:08:14 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2f75e5f3debso35673011fa.1;
        Tue, 17 Sep 2024 03:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726567691; x=1727172491; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KJbxN/BoBiYWDohSMCRDVcluwineaYIhEPM4cB3crFw=;
        b=kShdh89P1qbk4MWA+Sas9r5pbGKfQxkRuCXBVtAKczCWUL0P56DnJyf4+lnLqBX8T2
         DsBGjBHUYDWf0+kGue2r6XgjkMMnT/no88Pocx+DPAX+zZnZ6TNqL9bJCweDrRO/ySvw
         XJmaCzoOWPqb3S6MJ8Iyr7sAPABKHNFrfZTlx40eBsWF/iQhvYLE6Be/cy/02ru9OP1+
         6RMkReN7k94/LfYiJvwnR9qAclWEn286bTHadKDIL1mKP4eSC8L5whbrdIwEsW7ednBs
         LUnokjSkbzabSxL2UMH53Li7H08NVWw1/dBXxOvZoaTZDQCxUTHho3CQWefBGSSjq4t2
         82BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726567691; x=1727172491;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJbxN/BoBiYWDohSMCRDVcluwineaYIhEPM4cB3crFw=;
        b=FvBOshDrCUoKOb4cs15/bLhVVSUymVkn8bJh4JTgHikR9tn0v2f3HLQdqbswwg+GAQ
         cdJq84GfnKwcrGWmnP2I1RdU03FMXhCwX/S4WzGO/9P5B93jDzS8/8vHJiU1CCmmcCYr
         ++ciqBZlKGOV+aUvGZCESLWIbImWjvI2f+zIYjAurnvr9bG+ANfuwrB1iQZNqGuHlE1J
         1HuzGTkMfWApKpAbVVjsuaCPK92ES3CSXFdzKk4GRC6Vtunwxu86jubW887AnEk+h0Yj
         mLAn2XgtEXKLD+LkT+C4vglHYhT/6dh+hmXk2IVNGQDHHvSl8sTY5uqm7nYRxVA4rn9x
         yGbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM+RbWS5jh9PoIlsjfimIrhdZGzQgdrZg1lTr9QUx6A93oIT+yDhkyhxPbh2aWulLQ9dS6LC/C4sZAddqidGC/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3lsqIzOPqaknvuP9iDQFwpp1oWlN0WwUfykIofQhD1k9svsGt
	QyQoKQA6KzYRg9/xUcuQNCcCqHboAFs5dejvrIceNG3Pb+EiqO2W
X-Google-Smtp-Source: AGHT+IGiqzBAYFz/mDtE2N5VLwEzMkWQFs36XzIRE4/HfHEtFG+isbnI1S5WWQgrzxd2uMOGc0oGfQ==
X-Received: by 2002:a2e:e11:0:b0:2f7:53b8:ca57 with SMTP id 38308e7fff4ca-2f791a01ef2mr51657271fa.19.1726567690819;
        Tue, 17 Sep 2024 03:08:10 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b1947e2sm135592985e9.44.2024.09.17.03.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 03:08:10 -0700 (PDT)
Message-ID: <5823a50e-c607-4e1c-ba4d-d88b38c734cb@gmail.com>
Date: Tue, 17 Sep 2024 13:08:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG and WARNINGs from mt7921s on next-20240916
To: Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Deren Wu
 <deren.wu@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ma Ke <make24@iscas.ac.cn>,
 regressions@lists.linux.dev
References: <144fbf79-950c-4cd1-bc68-4e00b47b03e9@gmail.com>
 <ZujCwvd4XiwljDyv@lore-desk> <87ldzqdcsv.fsf@kernel.org>
 <b8e11bbc-c718-4acf-acc0-6b31f25fae27@nbd.name>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <b8e11bbc-c718-4acf-acc0-6b31f25fae27@nbd.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_030813_613757_83B04D03 
X-CRM114-Status: GOOD (  17.64  )
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

Hi,

On 2024-09-17 12:15 +03:00, Felix Fietkau wrote:
> On 17.09.24 08:17, Kalle Valo wrote:
>> Lorenzo Bianconi <lorenzo@kernel.org> writes:
>>
>>>> Hi,
>>>>
>>>> I ran into some bug messages while testing linux-next on a MT8186
>>>> Magneton Chromebook (mt8186-corsola-magneton-sku393218). It boots 
>>>> to the OS, but at least Wi-Fi and Bluetooth are unavailable.
>>>>
>>>> As a start, I tried reverting commit abbd838c579e ("Merge tag 
>>>> 'mt76-for-kvalo-2024-09-06' of https://github.com/nbd168/wireless")
>>>> and it works fine after that. Didn't have time to do a full bisect, 
>>>> but will try if nobody has any immediate opinions.
>>>>
>>>> There are a few traces, here's some select lines to catch your attention,
>>>> not sure how informational they are:
>>>>
>>>> [   16.040525] kernel BUG at net/core/skbuff.c:2268!
>>>> [   16.040531] Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
>>>> [ 16.040803] CPU: 3 UID: 0 PID: 526 Comm: mt76-sdio-txrx Not tainted
>>>> 6.11.0-next-20240916-deb-00002-g7b544e01c649 #1
>>>> [   16.040897] Call trace:
>>>> [   16.040899]  pskb_expand_head+0x2b0/0x3c0
>>>> [   16.040905]  mt76s_tx_run_queue+0x274/0x410 [mt76_sdio]
>>>> [   16.040909]  mt76s_txrx_worker+0xe4/0xac8 [mt76_sdio]
>>>> [   16.040914]  mt7921s_txrx_worker+0x98/0x1e0 [mt7921s]
>>>> [   16.040924]  __mt76_worker_fn+0x80/0x128 [mt76]
>>>> [   16.040934]  kthread+0xe8/0xf8
>>>> [   16.040940]  ret_from_fork+0x10/0x20
>>>
>>> Hi,
>>>
>>> I guess this issue has been introduced by the following commit:
>>>
>>> commit 3688c18b65aeb2a1f2fde108400afbab129a8cc1
>>> Author: Felix Fietkau <nbd@nbd.name>
>>> Date:   Tue Aug 27 11:30:01 2024 +0200                  
>>>
>>>     wifi: mt76: mt7915: retry mcu messages                                            
>>>                         
>>>     In some cases MCU messages can get lost. Instead of failing completely,
>>>     attempt to recover by re-sending them.
>>>      
>>>     Link: https://patch.msgid.link/20240827093011.18621-14-nbd@nbd.name
>>>     Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>>
>>>
>>> In particular, skb_get() in mt76_mcu_skb_send_and_get_msg() is bumping skb users
>>> refcount (making the skb shared) and pskb_expand_head() (run by __skb_grow() in
>>> mt76s_tx_run_queue()) does not like shared skbs.
>>>
>>> @Felix: any input on it?
> 
> Sorry about that. Please try this patch, it should probably resolve this issue:
> 
> ---
> --- a/drivers/net/wireless/mediatek/mt76/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mcu.c
> @@ -84,13 +84,15 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
>   	mutex_lock(&dev->mcu.mutex);
>   
>   	if (dev->mcu_ops->mcu_skb_prepare_msg) {
> +		orig_skb = skb;
>   		ret = dev->mcu_ops->mcu_skb_prepare_msg(dev, skb, cmd, &seq);
>   		if (ret < 0)
>   			goto out;
>   	}
>   
>   retry:
> -	orig_skb = skb_get(skb);
> +	if (orig_skb)
> +		skb_get(orig_skb);
>   	ret = dev->mcu_ops->mcu_skb_send_msg(dev, skb, cmd, &seq);
>   	if (ret < 0)
>   		goto out;
> @@ -105,7 +107,7 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
>   	do {
>   		skb = mt76_mcu_get_response(dev, expires);
>   		if (!skb && !test_bit(MT76_MCU_RESET, &dev->phy.state) &&
> -		    retry++ < dev->mcu_ops->max_retry) {
> +		    orig_skb && retry++ < dev->mcu_ops->max_retry) {
>   			dev_err(dev->dev, "Retry message %08x (seq %d)\n",
>   				cmd, seq);
>   			skb = orig_skb;
> 

Tested-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>

Thanks!

