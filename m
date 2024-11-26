Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F4DD59D93
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 10:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDslh+ljpVvNODtMmRwl8AAxwmvJGoBek7yI5XWC5Bw=; b=ShuKohne/E5ZzklOdahaJ4bvWH
	7DwoiQYEbW2kc7ZI1zQd4XjhFxtL6YC9sqTuAg0aLBc+OkuPhE2x6xyTXIq220QBWuXfetwy2J3/I
	VqfJcznxzD2oaSt0SvoCmT+64saLfI2YwJwqtigHfWN38BWhNR+6lfY01/dkKZOYjKwDGZ4cZLMiC
	64sskxMA4HFuJyWj+U3kIltNCAaghQ52U6siNNIBcbJEU2fMTZO84L7KzEwKm3MwEZGAsklKlU5Mv
	zUF2yTCIk60Mp8MPtjaamC7vs63SG3Aqv0j2ItvIj0Gfn1DbfSUjGBFitQ/FfbJjHZB9D2vWLhg7R
	h8IvJe5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsp4-0000000AJMn-138E;
	Tue, 26 Nov 2024 10:29:34 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsp1-0000000AJM7-3aFv
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Nov 2024 10:29:33 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38242abf421so3626991f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Nov 2024 02:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732616970; x=1733221770; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VDslh+ljpVvNODtMmRwl8AAxwmvJGoBek7yI5XWC5Bw=;
        b=pIgrDN/g288GJhPEKHZ0PqmoOKk/6Zomctz/AWcvp02+AhRac9rCbiS5xvQ0/A3lab
         +Ihgd9B/vP9wngZYG6eNZijuaG/5B650lRIrtm9CrUS/qvsnYSu8mFZ3HRdyjgvZ8tmD
         y5E936VgKxoX6Wvq6P1anntV8dnXoNN5/q2199Rv7sDeww/Js2iloOF/2jsuFRQVyxBH
         zYjVA8AUv50YTfgu/NudnMx/gb0f0sYli7C2PnfjRGH4+mI7qS7M3K2fftdU5CRB9kR2
         460IobDwnnnBiRQvpDNwM8FRlD8t7kQGzdX8MLQAECpBdN/iBp2ewLZjRn54P62oS4cg
         kKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732616970; x=1733221770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDslh+ljpVvNODtMmRwl8AAxwmvJGoBek7yI5XWC5Bw=;
        b=ErNqYhns0CERTRGZygXQdDpbEbPPgj9cd3QgJjH7UV9f11MN0fgurCmpvN/N7NG9Xz
         qsvSUL79XXcPOBgmnFc0tln/j/TtqlKxIgOyJ3jyEx3SeugW/4ApiAI9fHar5EbX5Ngk
         kHr2HohHCIPl6D6kF5O4twkEXBnahHCHdXftkbUoIFZ6GzPzbr6zy78dMcnbkVn8xqHE
         f2Hl+Aionfpzf9NXrX2yNqsXCZabS8KUR+p3uwmIq7rZEAhNkRAGsrIj+M8wU/D0aHUD
         Mvs1LW/u9KbXAetCLifFwx9GTPbj2fthxAQnnIo7Z/NbbZPzXFBBGVVTM+hQtogyVm6y
         V5WQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3gzflKUI+fEwaOGNAzjR82PDv9uXrQbTnZ6/JmI9Zcg+O13P0tFqzhm0D+YTGhtW64Ueg2yPB5mBeqIqidw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoZwioCqvkb0EIMNEdl7u4FPX7yFIuI24YG1ckApUWcEZ50fT0
	8KvySMR3oyNvX7tt1k+GnC7XA0NRXPfLQ99P61tiXEAw5QQhtMHYzP+QQRNWKT8=
X-Gm-Gg: ASbGncshiLqSL0mytLoX4m6/XbPuIrJ/5ltLCK2Yt7dNoJPjZZxdM70+F0X1ddsT8yi
	AWu4ed3qL2AyPHi8A9WbUQqqcxj16DKgRl9Jhuwg8gE3GTtnnU9OWscjLNckhzcacnZGwYTUQ7o
	nxlCsQIY5kQD5u9JYGpY0KAJjDPoBwuCkIkWp+iE8chlijrIqGNwGZ3FsZRo6Yb34aMsb74a2Ml
	QXrw564O001OVmZUPCmHrwY9NdT/EvEO3gqeN7PKsosFj46uGdzKi+bwWe8DijX7tkvQ4hHZGIA
	TQkBC4KBRJmBqQ==
X-Google-Smtp-Source: AGHT+IFgeqqkJ6wjR9SgxT1xrYJ0KahQXa7sIHvXaict/TpEQq8UBgqk2qQhjj3zdFl3pgNOycsAVA==
X-Received: by 2002:a05:6000:1866:b0:382:4a3b:5139 with SMTP id ffacd0b85a97d-38260bed0dcmr13711723f8f.59.1732616970162;
        Tue, 26 Nov 2024 02:29:30 -0800 (PST)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde8c804sm159339195e9.30.2024.11.26.02.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 02:29:29 -0800 (PST)
Message-ID: <ed50c130-076c-4697-9f11-fe602c7ca03d@baylibre.com>
Date: Tue, 26 Nov 2024 11:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
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
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <Z0RkaqfID9v0age_@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_022931_980334_E842F880 
X-CRM114-Status: GOOD (  14.53  )
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

Hi Andy

On 25/11/2024 12:50, Andy Shevchenko wrote:
> On Mon, Nov 25, 2024 at 12:32:13PM +0100, Alexandre Mergnat wrote:
>> Hello Andy.
>>
>> Actually, after test it, "linux/of_gpio.h" isn't needed at all anymore.
>>
>> That mean all added include in this patch aren't required.
> Do you mean the driver doesn't not use types from types.h or dev_*() macros
> from dev_printk.h? I don't believe this, sorry.

> 
> Basically what you are trying to say is "let's move of_gpio.h implicit
> includes to become something else's problem". It's not what this patch
> intended to do.

I'm just saying that I've test a build/boot with "linux/of_gpio.h" removed and without all
include added in you patch. My understand is "linux/of_gpio.h" act as proxy
for the includes added in your patch, my first idea was "if I remove it, build should fail cause
of lack of other includes". I can understand these missing includes are mandatory, that
probably means there is another proxy header ?
Maybe my test isn't consistent because it isn't possible to clear all proxy ?

If that's the case, consider my review-by.
I've validated some include manually. Are you using a script to parse the file and raise all 
necessary "linux/*" include ?

-- 
Regards,
Alexandre

