Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F2AC35FFC
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Sep 2024 09:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSrvhSccG4jYV4fFOorkzHAURIRqtMxP8iPHb1jw5uI=; b=rzacZTpcUheXXPD3FJMGr0wneM
	54VXE6o3FauaMNy+RxT6ytzAmY55WmRzcnPmxr8ly0cRCWT6dMOG6r0kEuCHV/mva29LFk3xztxJ5
	gcl8AH5DPibfMjw+dZh+Xdf19LSZjbnPboRyKV501v5vNAW+d2gzH2ntDN7zbTfaFG2CrbCixuAwH
	Cqg1KEu7Z3VoQcQtxpiGf13+BJAh234fQJY4T74+e3JgEy2XBcKXye86Bj4DTqQyNDJsduNufyCRB
	UjInmPcGtqHW1EL14ztfdhDG969ubDKFJAOuChQ3XHctzzuwuwXckgiNJqaYc5HsLp5Nw4gbvP/R4
	AsxPmEVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqU9f-00000005mKe-0J1Y;
	Tue, 17 Sep 2024 09:05:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqU9B-00000005mFh-0l4K;
	Tue, 17 Sep 2024 09:05:22 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42bbffe38e6so41689645e9.0;
        Tue, 17 Sep 2024 02:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726563919; x=1727168719; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oSrvhSccG4jYV4fFOorkzHAURIRqtMxP8iPHb1jw5uI=;
        b=IVX0e3ZVqnq0lS/TeZFQXYBLwWkasoWwl7JC5BJ8EgWsqbRL1LRUW1SxsqVhYAOi7v
         rNNw8wrRpE0/C480CHpyecZ3+Xd+MoF/2HNlH+Gh8eOxEuMXn3vwqw694l98fm5czWvr
         Pz9upFin4S8NtBbofR2r+GK0ULB52HLYYQfluUWC7DjVM/vvFfq94GxPG5ndwzg92KqB
         FE7BNhvVUnO0fuy+bnLbESWZV+VkuK5KJUttJ5Mxe3fkvyKJlOUquMz5AYdf3ruoa+VU
         WeyFoITi1QXHEEvRi4gwWlb4aa+Mh129rieJNxWl+q7YUEeAenoLW7dY/dWjxPPmOkHt
         qu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726563919; x=1727168719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oSrvhSccG4jYV4fFOorkzHAURIRqtMxP8iPHb1jw5uI=;
        b=dCQWNGJYGKSzvtlwDdXdYuJIRw+nH3vGIlsz8uIJnarWxgoHOO7u/1QfDcXNf8ppOA
         FwvMd7NHh6D25tb4ahnkMbvvHyXvzIvVpErA7i+z2UbNJ9EKuJPdstbaac0tLX4Iudrt
         v0DZT70gFcCRF5EGj315XBem18aDuz/UZWv83zotO35g+Ck3th1LQxfzTdrTbMvOcXtV
         Qz+IXehUnNP/ZA0536Cyo2UzO57u3zRFRxzEbhhd+HrTKGvGgEmDIV0/eS+6p78e1ko9
         dDRoBTg3enLkOgJvMPkx5bPxYNwXt46ji5X1YSHkTsk+sS/px+cD2tHgmQ+teMmGdudZ
         k7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWonAXhlugnX6XbstfBRxIOybmy8bmzrujqCJv6tAyNbmcxWQHBaUDXL83AO6Ty4bbaXpcBJSJfGTCCRZ8gyNJx@lists.infradead.org
X-Gm-Message-State: AOJu0YxMqzhgJSRxlXeFwlAYvKsvRuXaC44iM3/bP/7Qv+/qrh2z5R1w
	X6FdedPTaV/GbuZZzWpDsR2i5MiORNl0hrKUQfx5WMjxaTXqwevY
X-Google-Smtp-Source: AGHT+IFU3P3MQf5VTEuLKF85MQML6XIcvLrFQezS4OKNLvV1EMyIBYelPAYYhEKEIx215+fARri8Bg==
X-Received: by 2002:a05:600c:4fc8:b0:427:ff3b:7a20 with SMTP id 5b1f17b1804b1-42cdb56714bmr108943345e9.27.1726563918916;
        Tue, 17 Sep 2024 02:05:18 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b15d3ebsm130744695e9.28.2024.09.17.02.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 02:05:18 -0700 (PDT)
Message-ID: <5a0a8892-c88e-4cac-a53c-a31385217235@gmail.com>
Date: Tue, 17 Sep 2024 12:05:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG and WARNINGs from mt7921s on next-20240916
To: Kalle Valo <kvalo@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Felix Fietkau <nbd@nbd.name>
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Deren Wu
 <deren.wu@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ma Ke <make24@iscas.ac.cn>,
 regressions@lists.linux.dev, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>
References: <144fbf79-950c-4cd1-bc68-4e00b47b03e9@gmail.com>
 <ZujCwvd4XiwljDyv@lore-desk> <87ldzqdcsv.fsf@kernel.org>
Content-Language: en-US, tr, en-GB
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
In-Reply-To: <87ldzqdcsv.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_020521_247129_EBC44A45 
X-CRM114-Status: GOOD (  13.37  )
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

On 2024-09-17 09:17 +03:00, Kalle Valo wrote:
> Lorenzo Bianconi <lorenzo@kernel.org> writes:
> 
>>> Hi,
>>>
>>> I ran into some bug messages while testing linux-next on a MT8186
>>> Magneton Chromebook (mt8186-corsola-magneton-sku393218). It boots 
>>> to the OS, but at least Wi-Fi and Bluetooth are unavailable.
>>>
>>> As a start, I tried reverting commit abbd838c579e ("Merge tag 
>>> 'mt76-for-kvalo-2024-09-06' of https://github.com/nbd168/wireless")
>>> and it works fine after that. Didn't have time to do a full bisect, 
>>> but will try if nobody has any immediate opinions.
>>>
>>> There are a few traces, here's some select lines to catch your attention,
>>> not sure how informational they are:
>>>
>>> [   16.040525] kernel BUG at net/core/skbuff.c:2268!
>>> [   16.040531] Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
>>> [ 16.040803] CPU: 3 UID: 0 PID: 526 Comm: mt76-sdio-txrx Not tainted
>>> 6.11.0-next-20240916-deb-00002-g7b544e01c649 #1
>>> [   16.040897] Call trace:
>>> [   16.040899]  pskb_expand_head+0x2b0/0x3c0
>>> [   16.040905]  mt76s_tx_run_queue+0x274/0x410 [mt76_sdio]
>>> [   16.040909]  mt76s_txrx_worker+0xe4/0xac8 [mt76_sdio]
>>> [   16.040914]  mt7921s_txrx_worker+0x98/0x1e0 [mt7921s]
>>> [   16.040924]  __mt76_worker_fn+0x80/0x128 [mt76]
>>> [   16.040934]  kthread+0xe8/0xf8
>>> [   16.040940]  ret_from_fork+0x10/0x20
>>
>> Hi,
>>
>> I guess this issue has been introduced by the following commit:
>>
>> commit 3688c18b65aeb2a1f2fde108400afbab129a8cc1
>> Author: Felix Fietkau <nbd@nbd.name>
>> Date:   Tue Aug 27 11:30:01 2024 +0200                  
>>
>>     wifi: mt76: mt7915: retry mcu messages                                            
>>                         
>>     In some cases MCU messages can get lost. Instead of failing completely,
>>     attempt to recover by re-sending them.
>>      
>>     Link: https://patch.msgid.link/20240827093011.18621-14-nbd@nbd.name
>>     Signed-off-by: Felix Fietkau <nbd@nbd.name>
>>
>>
>> In particular, skb_get() in mt76_mcu_skb_send_and_get_msg() is bumping skb users
>> refcount (making the skb shared) and pskb_expand_head() (run by __skb_grow() in
>> mt76s_tx_run_queue()) does not like shared skbs.
>>
>> @Felix: any input on it?
> 
> Adding regressions list to Cc.

Reverting just that commit fixes my issue. Looks like it's the same
issue recently reported by kernelci as a reply to that patch [1].

[1] https://lore.kernel.org/all/d907b13a-f8be-4cb8-a0bb-560a21278041@notapiano/

Adding Cc: Nícolas F. R. A. Prado <nfraprado@collabora.com> per above.

