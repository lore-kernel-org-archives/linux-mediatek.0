Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879C4C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 06:49:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49E1D61447
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 06:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49E1D61447
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HqFzv6hKVgAkho2j0F65Do//n7LDKqIy+j1kFu557u0=; b=nfhjRrOCY5GYN3/9wtW6W49AW
	NKq14HOcegUPhLROvJ/5sirPcf0cV9qJ3JA1Qu53gy1iOdrXInsbqbWjYLMjQfdp5SWWLvhFrp0tJ
	ASUzBBKaOtXc2csig/O8SJ+Loqg/PS6jyY3eIRQysJ8zKpz8LvWQRFOsJuNntky9hhiVg/GdgY/9k
	TRbG6il/spM2HB+FB0Z+aYd0j4xhVu2Y4zPJuQH6MAtMx/snBr72D+uGnY3fIG049xxmvZk1nab7w
	nIKRD3MfwA/BJXBximoDyFUMmipKcyo9XTOtz1r/zK+hWxpJ2bltX/nRDB8ZvksxNRR+3CqO6jMrw
	pkctcrlLw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc0U9-0056Tl-KS; Thu, 29 Apr 2021 06:49:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc0U7-0056TS-Rw
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 06:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=o3h5EriEjCqQopiIHnHAtghPtkLJbZARkrJvdBbmedE=; b=4jvFH0G7VriXkzPb9o9hEOgB4d
 N0zRaAbA3Xk+KrOTp6Kn7Jen5jBEY8b7zCjGmO4Bg9M5ysQq9I429p61oqoQMtfqhcQd/GZQ0esbo
 04hd/Vz+SApbldbHMFmqJQJ7pU6p8YXSE3d8yY1Ah9DmjIeZKKf3F9b8X2UjD33M7RpJ8LFe3A9XC
 3QuK+p5Eo3bsOKVcXavdXb3DOzRFT1fAca5d3FtFdDTaYto5k6O/eMgAkIzcaJnVY6aOqfBr97VaB
 PURiHE7YaBwvRrGngjxaLbGuiqbQ90zo6FCvZbpA4LvhqPfB5+uQJo2isDyaaeNa3beHkVVq8qBkN
 Mau3VZbA==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc0U2-000Pyp-Jz
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 06:49:14 +0000
Received: by mail-wr1-x42c.google.com with SMTP id d11so7737798wrw.8
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 23:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=o3h5EriEjCqQopiIHnHAtghPtkLJbZARkrJvdBbmedE=;
 b=d8dCRC4gjEhWMxE3SYQi+NpLceGRBYrmrFpjvbmsHAWECYSzCFyO0o/bHyEnKk1lfa
 SgH7w9204VdW7XjaaZXmFjJk4bd/euAM+GpLQUin9KJiQSCAbgM4UJHe9Jo1hZvD7Klm
 RJnAWx/25XGVuxr2RREacpJRN432K6oHtarC/d+DneSuNnDp/uVuZ3pX357f0+OOsQK1
 EXtn41+WlXzp6ZWT7FF+1ohfUOnZCL+5eVO6E25kevnK4FdNzf7XMJC3mUnicrdevtOF
 srDScOmKoiKziGoBM/B1eEA8dxqYx1e4pTmZw0J7VPu7zatqfsqnpcXThHz1bwX3Qn1v
 vZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=o3h5EriEjCqQopiIHnHAtghPtkLJbZARkrJvdBbmedE=;
 b=tV+iZbaJQB0fmNWojqHfxRhehufiRlN/hrtlFj/rLs6aCdkijaguvtyItiv5geUGFL
 Ejrx6vN5D+zNt6vN4jTPnbEmfAvE0do0NYrC7bAbUFPt1E51B5qWSzZiQdXkrXopLKT9
 oPPuxp7SWigAy8zEKXQqKklIwlVlV9IlvwJ5c8EXLZAOrfdkpRt5tMoZSvRBq3d/29+d
 vMWND3TckmF5yDVsYW8uIg96n3XLh+0E13G/LrXczwE07nLa+xqob9/B462AIl5zRCsn
 nJLUvWxSsLUW2abIVeyXUER3lEjH0Pp2WuPmCaHvzxWysm8QssnPgXPypWMgpl5SwRl1
 AkSw==
X-Gm-Message-State: AOAM530qnnaj7NYxw5+qZKSDv/7gA/e0ODPWiBPjO64vXXp5YmhcYoQZ
 jo6dBaIiw7TjA6hK++3d+31CMQ==
X-Google-Smtp-Source: ABdhPJyQ18dyuVmmPQJLNTxgisV36R9DWwMSNPYNEPe4j4InyGwlgS2BBW/xtr/CvurtASHAvnQZsQ==
X-Received: by 2002:adf:f74d:: with SMTP id z13mr817646wrp.147.1619678935368; 
 Wed, 28 Apr 2021 23:48:55 -0700 (PDT)
Received: from localhost ([2a01:cb19:826e:8e00:f37e:9091:b397:6f48])
 by smtp.gmail.com with ESMTPSA id z18sm3264416wrh.16.2021.04.28.23.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 23:48:54 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, fparent@baylibre.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] Input: mtk-pmic-keys - check for NULL on
 of_match_device()
In-Reply-To: <YIm9Bb3eBjYwY53R@google.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
 <20210428164219.1115537-2-mkorpershoek@baylibre.com>
 <YIm9Bb3eBjYwY53R@google.com>
Date: Thu, 29 Apr 2021 08:48:53 +0200
Message-ID: <875z05y4a2.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_234910_665807_A99342E6 
X-CRM114-Status: GOOD (  23.40  )
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

Hi Dmitry,

Dmitry Torokhov <dmitry.torokhov@gmail.com> writes:

> Hi Mattijs,
>
> On Wed, Apr 28, 2021 at 06:42:13PM +0200, Mattijs Korpershoek wrote:
>> mtk-pmic-keys being a child device of mt6397, it will always get probed
>> when mt6397_probe() is called.
>> 
>> This also happens when we have no device tree node matching
>> mediatek,mt6397-keys.
>
> It sounds for me that creating a platform device instance in case where
> we know need OF node, but do not have one, is wasteful. Can
> mt6397-core.c and/or MFD core be adjusted to not do that.

You are right. Maybe I can fix MFD core instead. I will look into it.

Thanks for your review.
>
>> 
>> In that case, the mfd core warns us:
>> 
>>   [    0.352175] mtk-pmic-keys: Failed to locate of_node [id: -1]
>> 
>> Check return value from call to of_match_device()
>> in order to prevent a NULL pointer dereference.
>> 
>> In case of NULL print error message and return -ENODEV
>> 
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>> ---
>>  drivers/input/keyboard/mtk-pmic-keys.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
>> index 62391d6c7da6..12c449eed026 100644
>> --- a/drivers/input/keyboard/mtk-pmic-keys.c
>> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
>> @@ -247,6 +247,9 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>>  	const struct of_device_id *of_id =
>>  		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
>>  
>> +	if (!of_id)
>> +		return -ENODEV;
>> +
>
> So if we make MFD/6396 core smarter we would not be needing this. I
> guess there is still a possibility of someone stuffing "mtk-pmic-keys"
> into "driver_override" attribute of a random platform device but I
> wonder if we really need to take care of such scenarios...
>
>>  	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
>>  	if (!keys)
>>  		return -ENOMEM;
>> -- 
>> 2.27.0
>> 
>
> Thanks.
>
> -- 
> Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
