Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1740CC05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyrI3NvpPP2H73tDQUkeXD7ywpVhyUvLhc3oDCVzmjw=; b=32rIin3DeyAp+LYbrewrjhraMC
	rxrm4AP4KHSML0KrZf9eupyQcgVoucK43VgRETYLmkwHr2E+U0owbaYVC+d3UZzky9EBzgZpahnd/
	1gyWnODRjdJfOr1BTTDy3DYX1ChETCv0MatzsKeN0leI088N9uaBgURo1RJ5F5ZbaJqs2u7SRTjGb
	Wl/4oSlyUkWSpp7Xm7n87Y4Oa484LG4aNswG6WnZTbiXvlUh6ic0snpHAuzLCKLLNIDbk14m1DGeZ
	nyNGpVi7uMQ82cNJPWRbVqdI5Pspb3MAhQG5fl2F/p9+0BsRs7RF6B3jKOJvENVmuzHOkJ1CnK0/k
	gEcwf7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDJ5-00C6nE-Dr; Wed, 01 Feb 2023 13:37:47 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDIu-00C6j7-7y
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 13:37:37 +0000
Received: by mail-wr1-x432.google.com with SMTP id d14so17329677wrr.9
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Feb 2023 05:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oyrI3NvpPP2H73tDQUkeXD7ywpVhyUvLhc3oDCVzmjw=;
        b=syH1KHQ/S1ZhTMEWn8mGlOLilhwDzgl5stlHCbswfoBFUCEgraZl9lsaAcEna+mSr7
         0yQGorNeBSBk41id+jZlvxatCUTVNamJmetV04g3YOp1vzf6URiHJ/GpOZBsGGdcVcG1
         yrydldS4xEBG2aSivt2oEhXphJU80jy47PMqdCjy/LO2FSQ5T6VEg6QpRspV9HEimqJk
         3e9ZAzTREjbWqsFGo/UUp/WIjnlaKS+fmPnYI2DiaMNOsbH/H6kT6181YUDUW+1jAO5G
         tDRXMgVmhTqfJ3jza91l11GpS533qzK4b3gUtrYU6EhUp+8Rz5aHCIE5jcBUR5K2QUq8
         zoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oyrI3NvpPP2H73tDQUkeXD7ywpVhyUvLhc3oDCVzmjw=;
        b=S1G7aCusDMQhSLBj2pBrF6v2cDgW+CemR4AYgsZDawZYLF9n/U7pU10e2dCqZAxno+
         R7Bwp3otvSbJbt3bNfgmzYQ5kI+au5SthgEm8i2pgdAdjwZuYQblAPx+VUc3uJ9MYenl
         o1YqZzZZ5kZOizT8Xn61xwSZiHz+DAzFIayIxlxcQgG0GPt4gmageRWRtcPKTKItBU9J
         emC4HgvWuMSzVw+/oozhoSW20ti6X0oqMvQOzd4uTvAmp2SULeMWtdZigP+wMpBLDlQw
         zmblmA0sn2FDoYPq/i7pGbrFVU5orAJgCYglDo4AH1aKR52WgLnIzvnQvPz7EiBPg/1p
         NIzg==
X-Gm-Message-State: AO0yUKU/tiwML3rBA93odq7zI1TXAOzc4+zg+tDfBCIT7PpJuY2m1aD4
	INU4FNXahtSq3Ds1bGf5BpTmvA==
X-Google-Smtp-Source: AK7set/7fI04cn7R2f0gMOHtzvRdfhScVUINCv8IHm1+jVlFbB8TfUyUXTZ0va8DMEFCFYNEQvg2wg==
X-Received: by 2002:a05:6000:1a53:b0:2bf:b743:f035 with SMTP id t19-20020a0560001a5300b002bfb743f035mr1641562wry.28.1675258654696;
        Wed, 01 Feb 2023 05:37:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f12-20020adfdb4c000000b002bfb1de74absm17328592wrj.114.2023.02.01.05.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 05:37:34 -0800 (PST)
Message-ID: <ad24739b-f8e7-45ad-ecd7-6d3329f01986@linaro.org>
Date: Wed, 1 Feb 2023 14:37:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] dt-bindings: thermal: mediatek: Add LVTS thermal
 controllers
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
References: <20230126161048.94089-1-bchihi@baylibre.com>
 <20230131140439.600164-1-bchihi@baylibre.com>
 <ab3357ad-01ec-8a1a-d627-a1543874f0ef@linaro.org>
 <CAGuA+oqXN3eoVyYkjuZjefPa-q542b7QLkBv+E-0a7k3U8BbFA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGuA+oqXN3eoVyYkjuZjefPa-q542b7QLkBv+E-0a7k3U8BbFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_053736_394994_F9651975 
X-CRM114-Status: GOOD (  14.22  )
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

On 01/02/2023 14:34, Balsam CHIHI wrote:
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - mediatek,mt8195-lvts-ap
>>> +      - mediatek,mt8195-lvts-mcu
>>
>> What about other devices? You called the file name as generic for all
>> Mediatek SoCs, so why only one SoC is here? Is there going to be more?
>> If yes, why they cannot be added now?
> 
> Yes, there is another MTK SoC mt8192 that supports LVTS,
> I was asked in v10 of the series to remove the unimplemented SoC.
> It will be added later with the driver that supports it.
> just let me know if you still want to add mt8192 bindings in the next
> version without the driver.

The binding should be complete, if that's possible, so if you had mt8192
already there, it could stay. Anyway it's fine then.

Best regards,
Krzysztof


