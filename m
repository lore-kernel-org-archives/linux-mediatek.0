Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90BBC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 08:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GYVEqyWRIb5M8DvqDeUYgwKR6PMorbc+DxpJvheRTc=; b=f752aXFPWz9+GSpnDn66sNt4+1
	XdW10r0P44QoHkebndw3UIGMGqDYfHT12r9iWE5Hrq4K3sKG875mucaxVeV2NUq4hBwOwp7CI0GHL
	lRWilsFvl15eudByAkHEoFWia6RZo92IpTOmPSx+5qV+LO1c+inPAVWgZlg1oVDfKZAu8EbtJrhZd
	XvyGOLefNug8JKp/Dpfr+LMQ1kgXJlDZBNVvVIU/nknnEywuyAb/juFd9SJxh/OpjhcLfXxdHXNGb
	JT+sJCJonej9PbKAMPdliH0K4GqNxzka03GqMuJtRfKw5B+muIGJfKUkTVm8ODlUCIb0JY91xDWR4
	zc8/u2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1our8S-008vBu-KC; Tue, 15 Nov 2022 08:17:36 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1our8Q-008vB9-1K
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 08:17:35 +0000
Received: by mail-lj1-x229.google.com with SMTP id x21so16506984ljg.10
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 00:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GYVEqyWRIb5M8DvqDeUYgwKR6PMorbc+DxpJvheRTc=;
        b=TqJCj+iF0xcmojTDBuDLqr1AeL6bJ9jOa5Q+rGhcue0HiucpyMr4LZxSGn3fUOgaWN
         MB546udpmn7GTMK6FamliZ6yOM0xFmEaWZ0FAaB8W4Be+RG4HRSwvt+z/ae+viDoe1d+
         Qu7Ho6EjyR7PZeIMtvE9rLe97vl5MesO8sFGAR3oSQGTsZ5MaYGGtFjOOAVnGRM07NVA
         UMf92qW+MN7DXOI+1+r2OIb8dwug4ssjZYHyDrtftTuN5USXfRGFq2pZIi/ITtr8c41o
         GimrzIiUDLZfP8ZrkDLf3BV5vuktAr1HRDJxRJn+SjR41SNt4C5HgciPnj3LgiXPMUVy
         3yeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GYVEqyWRIb5M8DvqDeUYgwKR6PMorbc+DxpJvheRTc=;
        b=iugUR8Iz8l/xzqlI9FmwyNi68TOUCqi0++sce84OhucD16YxvN9qlVDzRPYVN2YCjx
         14deIJ+YP0V2Gm8I/F3m1Ph6ZYozpz4nqdK8nFDB2cVV5ooYDZVN+/n1Dp3iq+n6Uxir
         6QDTc44v8SkWI4Oi/TmrzVTx2AHKB2cRhKmh5O3sa14vmFCUuAl9TbYCXspszAxTdEXv
         4+y/0ewoPOUHDdkhH5bmvwdjjLy79RiMHVWQ2EfEPu5UKCNCSQ5SUxX7yhcmZiefr9hY
         vV2VqEExO6ahxsBFi6M7yjoDTaylqLEDVXLo9CBbvwkrIlZiJd7BD7YyPuPEFqhGEup1
         w85g==
X-Gm-Message-State: ANoB5pl6Yw79xjMNvxSj+GmiHDsUJc1CTAc4QQuZdHzc7e+ZjSCdsQNQ
	LPKu4l9rCDrWuwyzeeV7Ft+J8g==
X-Google-Smtp-Source: AA0mqf5MXWb0JfEc/1mOlUnuRhtFp0aaBS83d/Ar8w4XBbipn6uUq0jtPrZD5niyiXlKAQweBcxJ6A==
X-Received: by 2002:a05:651c:490:b0:277:5f7e:9cad with SMTP id s16-20020a05651c049000b002775f7e9cadmr5055715ljc.420.1668500252199;
        Tue, 15 Nov 2022 00:17:32 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b0048b003c4bf7sm2112048lfr.169.2022.11.15.00.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 00:17:31 -0800 (PST)
Message-ID: <09495553-e563-e12b-056e-bed95531ab6b@linaro.org>
Date: Tue, 15 Nov 2022 09:17:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>,
 Fabien Parent <fabien.parent@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-rtc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
 <20221109222916.GA2985917-robh@kernel.org> <Y2wwUOJ0KZdt1tZ6@mail.local>
 <adf8bc44-4cbc-af2a-4ec8-1859a98146d7@linaro.org>
 <Y3LHxDIzfZWhnQJN@mail.local>
 <37dc4e39-8033-a40f-edd7-4bd30f841e23@linaro.org>
 <Y3NIRbyirJjT7xay@mail.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3NIRbyirJjT7xay@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_001734_110655_E09CC606 
X-CRM114-Status: GOOD (  15.40  )
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

On 15/11/2022 09:05, Alexandre Belloni wrote:
>>> I checked and it doesn't support it but this needs to be fixed.
>>>
>>>> What about rest of rtc.yaml schema?
>>>>
>>>
>>> wakeup-source would make sense but the driver doesn't support it yet.
>>
>> The question is about hardware - does hardware support waking up the
>> system via interrupt? This is usually a domain of PMICs which still are
>> powered on when system sleeps.
>>
> 
> I'd say that it is possible that a PMIC is able to wake up the system
> with or without having an interrupt wired to the SoC so wakeup-source
> makes sense. We don't need it if it is interrupt only.

Then I propose to reference the rtc.yaml.

Best regards,
Krzysztof


