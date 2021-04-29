Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3282C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 14:49:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFCA961449
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 14:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFCA961449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BOMvqqQAhOj22nZY8GCTGcZLUSOfjrSgG61jb3TwKEw=; b=JjyYZSGZ3XZ2mHFlkr5hThgld
	y4lZnvsJ4AAC5v/cYbDt9wdj/CC8gTuZfbyVyVlvF/bwv43ujol6gG6SsTzGi70b3LwoA+jZV8SWi
	1HzPlRKvm2q4FLe2ztrCAI5jIHVe+E3syyYNZXTR0mBxSPC0JXpYqs8d9rRHd+NpL71pW+4fYyf3C
	9CTSrS4Wj9LkQX+u6cTV4PL+wVS+zAy/DBb3mKUm6mNwxUHw51S9kH8LskQXdgaK8+uQN02GhiM8H
	A60YGdYYmOc26kq5V+Ck2k8FG+qvo3FMDxLuMdAqzsDEWvQnRuipLohB9FAZJLCt+H95F8fYgTPiC
	5LvBHHV1A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc7yS-005rLY-Dy; Thu, 29 Apr 2021 14:49:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc7yQ-005rLL-Dh
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 14:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vngK38/uzYnT4W+jr6IRjRIJAM+iJCix31NgQ9EuLvg=; b=jH+gfOSTejAZgVFbqb+354ek45
 XoDJ5kX5L2AFjgR3n/1iHQkSSTxevViLTtnId4pYjOwJ5LNRKcU6hlph1Q1HsnFtFfts6i9TMc/BV
 LjDclb3r4izJ1zp1W5U4q6+f+4lKyzU5PCLwxRGxHLB7k5ABNBh+oJ9DOQ+6pjEWKYLOzNB6nxyBl
 cZsNnMu42rChJcH06DaLHTXedhhYKOgDebEcvtLJQRdkNH2e4R5QLX+IHWvFqvEk/fdYgc7X5tvDa
 Vd6ugFdeB6+I8t2KfeEdUgpfQuJOu6Nxi0YrWn9Rxaem8ABZbWre8zw9Ua6rDJCmc6HfPCfpLVVT9
 PIrfpSXQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc7yM-000hZt-TP
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 14:49:01 +0000
Received: by mail-wr1-x429.google.com with SMTP id a4so67258164wrr.2
 for <linux-mediatek@lists.infradead.org>; Thu, 29 Apr 2021 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=vngK38/uzYnT4W+jr6IRjRIJAM+iJCix31NgQ9EuLvg=;
 b=YTSzJGcJHQgMlVXHNlXeaegByzcdO/Ixq9cwa3gZIFs3WIVEICy7i6oaNv6IY9heK7
 3c+2qFCcvore/t6PybqZ371mANjlIO6Gow70D+otyIZbAmzdIs25wLSskUQbnAeN6e/F
 Ka3IZAu9ACMS2YqTyCoGjzJdaTJLf6Bh5Q3u0ojWvmh3ox6/A/oHVkgYkmtR5Uk5ykVn
 9MciTdw6XCQoZaeHTMxi/igOej912jK01qR+4ZtYYNTFHrluX9deMM+JEN8vmzveHWyr
 iUd6sEyPOAhufRaw9anUNU86N5EcjVMvyafncjUCAGlePRQXghhvzVcsKb39+t+pipJY
 iuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=vngK38/uzYnT4W+jr6IRjRIJAM+iJCix31NgQ9EuLvg=;
 b=GiUpKAAuRrCme7U/wOkCyOKaNWaZF4tjLt+alpImeVVzJk+kBt6uE8MovjJOOrPteY
 SLO9QD0069bpubQiBOV1WAxVkDb32zzGb8cMC27YNB7MJwEUYDs26LRK+TKF75eqUntn
 ue4bjhiwrPaNR5UB7VkhUKhPliHcWbS28YS+eFIi46BsOHtKpN32/AtZMID384GMKh/e
 f4y1qx7SSudoJdbuy6T5pLVQKoXEvIusvbjsJFS6FG/BvwHJNjxgxqf6w+WlP7w06Lvj
 42vvCiKazkueBcuRmSnVpjOq5jkahEmxAvZH6YO/Gk0pCBfUwv1mSmFnZs/wJJ/PevkJ
 BXLw==
X-Gm-Message-State: AOAM530AEdHxaSmIEFGQLSzUNvgdgf/ff7e4bkLzGc3Nw8rM7Bm6bfXn
 qYgDRNq/S1EKPfGVvV+tAy5EgA==
X-Google-Smtp-Source: ABdhPJzRr1ptHoMK+F/hhQ1TsfC2223uBRcGsPIsIY79GHjAwVNUN4USMf1S/BuOGfztjsVVwGhQrA==
X-Received: by 2002:a5d:6da8:: with SMTP id u8mr218171wrs.48.1619707736884;
 Thu, 29 Apr 2021 07:48:56 -0700 (PDT)
Received: from localhost ([2a01:cb19:826e:8e00:f37e:9091:b397:6f48])
 by smtp.gmail.com with ESMTPSA id r2sm4995675wrt.79.2021.04.29.07.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 07:48:56 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, fparent@baylibre.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] Input: mtk-pmic-keys - check for NULL on
 of_match_device()
In-Reply-To: <875z05y4a2.fsf@baylibre.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
 <20210428164219.1115537-2-mkorpershoek@baylibre.com>
 <YIm9Bb3eBjYwY53R@google.com> <875z05y4a2.fsf@baylibre.com>
Date: Thu, 29 Apr 2021 16:48:55 +0200
Message-ID: <87wnslw3hk.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_074858_972806_A6C44BA0 
X-CRM114-Status: GOOD (  22.53  )
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

Mattijs Korpershoek <mkorpershoek@baylibre.com> writes:

> Hi Dmitry,
>
> Dmitry Torokhov <dmitry.torokhov@gmail.com> writes:
>
>> Hi Mattijs,
>>
>> On Wed, Apr 28, 2021 at 06:42:13PM +0200, Mattijs Korpershoek wrote:
>>> mtk-pmic-keys being a child device of mt6397, it will always get probed
>>> when mt6397_probe() is called.
>>> 
>>> This also happens when we have no device tree node matching
>>> mediatek,mt6397-keys.
>>
>> It sounds for me that creating a platform device instance in case where
>> we know need OF node, but do not have one, is wasteful. Can
>> mt6397-core.c and/or MFD core be adjusted to not do that.
>
> You are right. Maybe I can fix MFD core instead. I will look into it.
>
> Thanks for your review.
>>
>>> 
>>> In that case, the mfd core warns us:
>>> 
>>>   [    0.352175] mtk-pmic-keys: Failed to locate of_node [id: -1]
>>> 
>>> Check return value from call to of_match_device()
>>> in order to prevent a NULL pointer dereference.
>>> 
>>> In case of NULL print error message and return -ENODEV
>>> 
>>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>>> ---
>>>  drivers/input/keyboard/mtk-pmic-keys.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>> 
>>> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
>>> index 62391d6c7da6..12c449eed026 100644
>>> --- a/drivers/input/keyboard/mtk-pmic-keys.c
>>> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
>>> @@ -247,6 +247,9 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>>>  	const struct of_device_id *of_id =
>>>  		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
>>>  
>>> +	if (!of_id)
>>> +		return -ENODEV;
>>> +
>>
>> So if we make MFD/6396 core smarter we would not be needing this. I
>> guess there is still a possibility of someone stuffing "mtk-pmic-keys"
>> into "driver_override" attribute of a random platform device but I
>> wonder if we really need to take care of such scenarios...
It turns out it was possible to make 6397-core smarter.
I've submitted [1] to replace this patch.

Thanks again for your suggestion. Please let me know if I should add
your Suggested-by: in [1].

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210429143811.2030717-1-mkorpershoek@baylibre.com/ instead
>>
>>>  	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
>>>  	if (!keys)
>>>  		return -ENOMEM;
>>> -- 
>>> 2.27.0
>>> 
>>
>> Thanks.
>>
>> -- 
>> Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
