Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3260DC5321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 06:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iGhqdq8Nm6zibPdgyg1lBX8pBlA7d0Q+MAWA1vQXy0=; b=VuFbdGeP9YsVY3hYsTDc8IO2He
	/88tBIiuonviuF3zdbICt5eFNV+16ZngNPUPHyVa8E2jv6/6HWMU3s4Uy9DjzHbT2K4sLYmB5jyoZ
	GFFmuo75R2sTzIvTQZlhP5ybCjf7N7CJWc16mMjCDGTiGbjc6GJXQ3vakGja7kUtdMIpsP3Z8SWY5
	EFLXdCqfGUIc+/s9AtE7i7eMBeH2AKBGi80yesMlxzVnqZr2Dnz2lgDuOzsH+nxcdiTUj94D+iJvv
	7Gc/uydbdY0VQXEh4zeBxBsjAb4+N/5/4+04MI5a9lsWG25Hskl7KZIYrmGkY5yElgs8V5ygErz8g
	oCpJMXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siTdR-000000068JP-2vvP;
	Mon, 26 Aug 2024 06:55:29 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siTQI-000000065ob-13tM
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Aug 2024 06:41:56 +0000
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1C7F13F285
	for <linux-mediatek@lists.infradead.org>; Mon, 26 Aug 2024 06:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1724654511;
	bh=+iGhqdq8Nm6zibPdgyg1lBX8pBlA7d0Q+MAWA1vQXy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=b4hRgfIzB/mDIrfYtHj/G34XG7dmLkxh4yORHqlvGPDzoE9P0g+mPEQe3ySx5gUDn
	 b6VcKp+1O6+tFgzcFITOYQlMS/xApUM1pZINLHXtmvuMb+1D5Z92arJp0fzXTX8YpF
	 hDvYFWN924lfG0APugTqHtELGDVQDfQS9R7RS367DQPTWId3tIcCB9MBa9kLZdXvd/
	 7jhJ7ZJ2OLZK0xIlvqQEFmYcNgabPcGgP8K+XtgEIwbzjEDHAqSmVrS4LCKrE5+TpP
	 /tOd7txN48cDFrC3zjbAAiuRv6GUAVMXYWCw3TtYRfylOQfV+7QLMq6sY9G/WPqlWn
	 kK9rC5bOCSHmQ==
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7141ab07fddso3362271b3a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Aug 2024 23:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724654509; x=1725259309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+iGhqdq8Nm6zibPdgyg1lBX8pBlA7d0Q+MAWA1vQXy0=;
        b=K0CMBOoWGroZjonMBVgBM5Vb9RFAZ9QyTi7z5NOyeDxWFOFIdv/3NHDGt3DSHtGkrt
         ufbant6ZtuXZAhxEkRxxYi9y2GnpXF5ks8GNSYtXrH9PH/QmGwhdVgGP7zI89+oLvZNV
         7FuiWr1jFg5WU7TGmsiQAVEfeSk0lWw7lhSH4eCnbXf4SiUg4qyU98ZAku6+PMxD8Ydd
         YteneBAujSIqKS0l7VmZBUMC59VomY01ef9vVLMNvN5Ijkp1ak20ak58iTiDvZK9DSvb
         Dsi1iqToYpHIyEg/LhSmnsfgUEXMyjTT2Y36jShN8FiKOok2jW4AA2Mf75F8t7nT66vC
         67fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQD5k30L122qPJIUpEmG8j7/MvmDDqYJjbmJMakw0PvjvM+nfFe7D+g/m4mYFLdoyXggNR4hzT6HecxSRibA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKCpBNW3BilQycpdmK05M6cggEhdCnlRiLin8JVt6/P8LKb/oq
	mxzzYZG84yxG1AM70XzvIQwvhU1CSxr8/muu5meDchhs1e2DE5kf7wa5G1g5rzVEVUJsrKyB093
	IqYHiw0ISiRMFMkOg5d3HVgU2M+DAVAOqysK0Hvk94LPexDIxqkhLn3XJy+eqoq5/EsPAN9spua
	aW5E7JblXTkg==
X-Received: by 2002:a05:6a00:3cd1:b0:706:700c:7864 with SMTP id d2e1a72fcca58-714457368a3mr8681942b3a.4.1724654509389;
        Sun, 25 Aug 2024 23:41:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5927KxkvcimyRd0Hf6bimnbLUHMBkrmoZO83HLCrfQIBH6ObNVYTI30V7dd/ecJKIUo9InQ==
X-Received: by 2002:a05:6a00:3cd1:b0:706:700c:7864 with SMTP id d2e1a72fcca58-714457368a3mr8681926b3a.4.1724654508934;
        Sun, 25 Aug 2024 23:41:48 -0700 (PDT)
Received: from [127.0.0.1] ([103.172.41.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714343404b0sm6467253b3a.220.2024.08.25.23.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 23:41:48 -0700 (PDT)
Message-ID: <2914fb9f-da8e-4415-ba8b-e12d3792712b@canonical.com>
Date: Mon, 26 Aug 2024 14:41:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwrng: mtk - Add remove function
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: sean.wang@mediatek.com, olivia@selenic.com, herbert@gondor.apana.org.au,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240826014419.5151-1-guoqing.jiang@canonical.com>
 <CAGXv+5G6AToabUmvPvcHQZaU-A6b-Y82ErUGxBVDojK5gMBz+w@mail.gmail.com>
Content-Language: en-US
From: Guoqing Jiang <guoqing.jiang@canonical.com>
In-Reply-To: <CAGXv+5G6AToabUmvPvcHQZaU-A6b-Y82ErUGxBVDojK5gMBz+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_234154_653111_D6A5BCC1 
X-CRM114-Status: GOOD (  17.16  )
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



On 8/26/24 13:17, Chen-Yu Tsai wrote:
> On Mon, Aug 26, 2024 at 9:45 AM Guoqing Jiang
> <guoqing.jiang@canonical.com> wrote:
>> Add mtk_rng_remove function which calles pm_runtime relevant funcs
>> and unregister hwrng to paired with mtk_rng_probe.
>>
>> And without remove function, pm_runtime complains below when reload
>> the driver.
>>
>> mtk_rng 1020f000.rng: Unbalanced pm_runtime_enable!
>>
>> Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
>> ---
>>   drivers/char/hw_random/mtk-rng.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
>> index 302e201b51c2..1b6aa9406b11 100644
>> --- a/drivers/char/hw_random/mtk-rng.c
>> +++ b/drivers/char/hw_random/mtk-rng.c
>> @@ -149,6 +149,15 @@ static int mtk_rng_probe(struct platform_device *pdev)
>>          return 0;
>>   }
>>
>> +static void mtk_rng_remove(struct platform_device *pdev)
>> +{
>> +        struct mtk_rng *priv = platform_get_drvdata(pdev);
>> +
>> +       pm_runtime_disable(&pdev->dev);
> Instead maybe just replace pm_runtime_enable() with devm_pm_runtime_enable()
> in the probe function?

Good point, will try it though it seems the function was not called by 
any hwrng driver so far.

>> +       pm_runtime_set_suspended(&pdev->dev);
> Not sure if this is needed? I'm not super familiar with runtime PM.
>
>> +       devm_hwrng_unregister(&pdev->dev, &priv->rng);
> The fact that it is already devm_* means that you shouldn't need to
> call it.

Okay, will remove the unnecessary calls.

Thanks,
Guoqing



