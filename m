Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5769D59D94
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 10:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DL8n6YXE9oeQeCSKnUhWjhtX76X8Z5GX8Xt7bIlqK5s=; b=0Ov4KrLEJvwQyRQqsiB4oUXFek
	zt1bocbQqa+XBacrHQjfn5aCLLpLULYgNApphueBTfYH6MYPthdMHiJ3J0JixMb61Nn/9mH8WqXZX
	IkjDEhq/LaqCVgMs6L64QSudRjz/U29kFAQWh6L9RRXsCOn170SFdjPlzmv1K8RPoVQIM/v3m+Ld+
	ZcDEViiqhT6GD3RmirkckYbvy0rfMrezKafEtuZ0Nou0rNpPGus6BFisCCqwjzBb31fwTegYSz4Fh
	ZEPQbPF05ltidCuwPMGPWmPV5Vw0SFeqgIy0VSA5Bu1id85nAj7Cd1D+M3ckrnwUEb3xK6hg9ePJ8
	YS3H64LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFt0d-0000000AKsZ-3kof;
	Tue, 26 Nov 2024 10:41:31 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsws-0000000AKD3-4AbH
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Nov 2024 10:37:41 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ffbea0acc2so24004781fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Nov 2024 02:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732617457; x=1733222257; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DL8n6YXE9oeQeCSKnUhWjhtX76X8Z5GX8Xt7bIlqK5s=;
        b=NKO9bQa8DqHZeFeRUsJx6g580sYtUD3YIYRwIj9RxaqdAy2fd6pxGhPwFWYc4uN25x
         /LZ0LY4skmODp0nkpk3IE9jG8jjAZy53r9eZ0/EUVPUAxn3iwPTh+/iDtGQ6g9zZlN7B
         hrbnoBFMUSiF5HTMRUh3InTDOe7GAUH6jdcjW96qEPpFLlQoDYnTOjtI72TUb/zNTZ9e
         dYK3NhZLh/WjKRvOyDmxSj7zn1TDMhdEVg5G1DDSPMx7GXqFFi6t2cRvLNOr0CvnLQ+r
         ht96JscujMVjg/+q0ixjf949t0JT0QUrseSNo2FBcDcM5naMBcYrNGfTFSiAxrkVjbNQ
         OvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732617457; x=1733222257;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DL8n6YXE9oeQeCSKnUhWjhtX76X8Z5GX8Xt7bIlqK5s=;
        b=Xi0/6xuAMZC+XDvR/lX2EDGePAgmIpR4jNUJ9K5ivwhpIKkeVPqlfqsWeSt4ziB77R
         nUTlTCvPJZjQtQKbeS8aS4xlz2MyB09qks4/Ifwy/SWFnxS2guuN3yDVnTrvdrpQtuLK
         eUHFsBBQOnKdKDidosg7Fu3WDL6RMGvWreWrNMmdePMdW21Lp1X0fIRisgA1c3urwQc2
         ciSnLRM16SnrlCFCQ5ZPlim+knJ7b4qQza7dVBJ8Ma7TLOhqa7bAEn8rOkE5PMHRE7A7
         b6qoW8NjJF59KVOwBKpKpUX6mb4Ip/9RsDDL5mKzOexnb8WuAwcK/+gn+69qIC2QhgZ+
         a6wg==
X-Forwarded-Encrypted: i=1; AJvYcCVQGyXXhvIfWpyAIbxtcoDZ7IjpbjSCkaiuRCu0rTfhqCJX3gtv4ThDBQWhePE+iIV3GYcgQiY5lXFEsU2lsg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4zmzJDRM+aAeoMLtYXODC4w8MuOQ4MK+Rlrr9oxIacv0sbHjf
	977ZaZr7+zlWdTmuZHwlBM0k1W3k4tTV+jhOFuyvQL8cifO7qw7XhH4qqxu9J3k=
X-Gm-Gg: ASbGncvcehJKoMT8EUlNxqGdeQHeIEzCojUC4BJZgrO8SFzuTp3HQpTIef9E+xnwaCc
	fXa9RuNWQlJKlUp14Q3SGIyBQWMcYlr2xg1AKGVXF0Hra+X4ssVTHWfU1x7QPStvD1B6AQ05U5v
	kuZf2Be7oZzl2Z+JNYRHXCntUor6+i+rVDK2ZIRtyQFtNX9NIj7B51gOxTt5/IYd85OJcvy/DKx
	wMFRiP1gu3H6nzWRfd1RhuP791e5A8PMZD4s/s+W7AufNIncjA0QXMLpps3Sf/evESbF8VnkB86
	YL+rirgM013i0w==
X-Google-Smtp-Source: AGHT+IGm9T8BP8eFPLu32fca54MvgO0F+vLQWk0tpYQ0ycW//DTGAHcftsM6xJdvIIJ/40Jr4imMYA==
X-Received: by 2002:a05:6512:39cb:b0:53d:ec92:2968 with SMTP id 2adb3069b0e04-53dec922a7cmr947039e87.17.1732617457163;
        Tue, 26 Nov 2024 02:37:37 -0800 (PST)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad658esm13229915f8f.8.2024.11.26.02.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 02:37:36 -0800 (PST)
Message-ID: <49fa1677-db35-497b-afae-caa5dccf3747@baylibre.com>
Date: Tue, 26 Nov 2024 11:37:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, Nicolas Belin <nbelin@baylibre.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20241031102725.2447711-1-andriy.shevchenko@linux.intel.com>
 <ZykbMlshvlwCaeGJ@smile.fi.intel.com>
 <d7bf7863-fd24-4f8e-8cd0-d84867a997bb@sirena.org.uk>
 <dad2ecb7-e624-49c2-a7d5-0ff53b6a1686@baylibre.com>
 <Z0RkaqfID9v0age_@smile.fi.intel.com>
 <ed50c130-076c-4697-9f11-fe602c7ca03d@baylibre.com>
Content-Language: en-US
In-Reply-To: <ed50c130-076c-4697-9f11-fe602c7ca03d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_023739_037335_278B1BE9 
X-CRM114-Status: GOOD (  15.52  )
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



On 26/11/2024 11:29, Alexandre Mergnat wrote:
> On 25/11/2024 12:50, Andy Shevchenko wrote:
>> On Mon, Nov 25, 2024 at 12:32:13PM +0100, Alexandre Mergnat wrote:
>>> Hello Andy.
>>>
>>> Actually, after test it, "linux/of_gpio.h" isn't needed at all anymore.
>>>
>>> That mean all added include in this patch aren't required.
>> Do you mean the driver doesn't not use types from types.h or dev_*() macros
>> from dev_printk.h? I don't believe this, sorry.
> 
>>
>> Basically what you are trying to say is "let's move of_gpio.h implicit
>> includes to become something else's problem". It's not what this patch
>> intended to do.
> 
> I'm just saying that I've test a build/boot with "linux/of_gpio.h" removed and without all
> include added in you patch. My understand is "linux/of_gpio.h" act as proxy
> for the includes added in your patch, my first idea was "if I remove it, build should fail cause
> of lack of other includes". I can understand these missing includes are mandatory, that
> probably means there is another proxy header ?
> Maybe my test isn't consistent because it isn't possible to clear all proxy ?
> 
> If that's the case, consider my review-by.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

> I've validated some include manually. Are you using a script to parse the file and raise all 
> necessary "linux/*" include ?

-- 
Regards,
Alexandre

