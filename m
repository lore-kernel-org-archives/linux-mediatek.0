Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01B3C04A95
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 17:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaBM0F0vS4egIo+p/65Wr1pcDzd34fHYDBsYt35zuD8=; b=w4jIiPnz8JU4NfG93wjglBdl+m
	dENPRdaOwq9jzZdaCMZ1C24dY/boUsy7M8kX42FPs4APUo1NQSwvUUdMUAdVa/Iz5OI71AIuXVT/5
	9ZS2fzqUtyip/Kr17lfHMrnER7xpithXbtTV6GG24SnDYjN6lSDsgupMK5ESGWY+/oDgg+I1t3SNQ
	sU85mb6Do8I8vst/Bl8Y3lFNxt7Zk7QNpNSGhKVYl3ok4GW5XdClbr7UkxOeEqe9T3gAKtAtR0ngH
	T79FP+riySihpZfT9l1IQM7Go82CyeCEdYpD8CGIrWyKkbhmfJnmiw3Cthuj8U5jDPQuIhNjTIIfo
	bJUp4meg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odapE-00HMmR-CV; Wed, 28 Sep 2022 17:26:24 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odapB-00HMkZ-8k
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 17:26:22 +0000
Received: by mail-lf1-x12d.google.com with SMTP id a8so21363176lff.13
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Sep 2022 10:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=iaBM0F0vS4egIo+p/65Wr1pcDzd34fHYDBsYt35zuD8=;
        b=Vm5/O2dA7LM9byhTgJjsTEWiTpq6cbx1A7BcdH2Ae3P/5/939CIAvevcFcAWx2icSy
         6sYCxFBqORGn4L0pgWt9/FPWej0Om7OVd3JvMK5qJ/5+cqwxIi5+TFnstDTJ4hcDaOVA
         8Ufz8DMelf4OICaUFMm010gmSIyEpIT9Yd7R63XTZhZ5arbfvpX3wDLscjse15LeVkzB
         2HDjW7GG9p5boYj4CRRGcBvr3yD6qkKI70Zebvlm8O3wH6rrbfRZ8pwI0ueWhNPJmepx
         X7kCeu7k2CMlj4PxYoPEFKCOHT6E5x1IVEV2/nC+W7hYCSP/oc6EfMLdgXaQ/LN5H+m6
         hBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=iaBM0F0vS4egIo+p/65Wr1pcDzd34fHYDBsYt35zuD8=;
        b=EdkY4xq3P0Pn+2K7b0RUC1HD7xz97KGtLj1e9CF5LdbeEcUIY9n35qXGNYTdCG2Qcp
         9GSf6lv76klzArYRphMNsnbXov0Rz5pawB9GLDlAAylQxeOPwUYFpErWlSMliG4RWhNw
         nJ8KoUoiA2lVqq2nqE0X3b9SEvdpdIxKSDzV7nDlwxBpfshNUmNwaglduPUKlTh2XMqu
         IrkVLpAHBbArdbwkScCQ5eZVze3J6trQYNZkCAk9G7oCdAY3RO+I5HomaHFIhcVcBN9Y
         jOT59ApSxQLnZxTvIhLTrpz10xASrouRG3f1VKOzdc3gqhaCohzqLk0c+Oon5d4ywSOq
         beXQ==
X-Gm-Message-State: ACrzQf1FqfIH/QlMMvix/gf69n61UU6CEgcLbXCn8LYZ1clbFM5LIfUx
	iq8OFqcU8WfLMqHtm2ucubSaoQ==
X-Google-Smtp-Source: AMsMyM4DHKDdL4v9sepFSeuj5HbhsSN0dN9rFWUBcOnDLKUvgTtOG5lza4guiF8m6cN/mojNElNGkg==
X-Received: by 2002:ac2:4c50:0:b0:49a:3768:da81 with SMTP id o16-20020ac24c50000000b0049a3768da81mr13102942lfk.247.1664385977386;
        Wed, 28 Sep 2022 10:26:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bg40-20020a05651c0ba800b00261e7e7b698sm494329ljb.123.2022.09.28.10.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:26:16 -0700 (PDT)
Message-ID: <186bc17e-56d2-f125-aab9-f47bf3f45b79@linaro.org>
Date: Wed, 28 Sep 2022 19:26:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] arm64: dts: mt8192: Add vcodec lat and core nodes
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20220926105047.19419-1-allen-kh.cheng@mediatek.com>
 <4d1e8600-f73d-8d2b-2e7a-1b75be7624bd@collabora.com>
 <d71334b63427df73d01ff1b9fa4d2dec94ad9c95.camel@mediatek.com>
 <05ed341b-2db3-620f-7a70-dcebfaa66f1a@collabora.com>
 <172e10ee-22fd-ccec-1a5a-7bd0a29dbfc4@linaro.org>
 <68e1c8b0-04cf-acf8-b6b6-97d9eb8a7c4a@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <68e1c8b0-04cf-acf8-b6b6-97d9eb8a7c4a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_102621_360700_AA8DFBD4 
X-CRM114-Status: GOOD (  19.66  )
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

On 28/09/2022 09:58, AngeloGioacchino Del Regno wrote:
> Il 28/09/22 09:04, Krzysztof Kozlowski ha scritto:
>> On 27/09/2022 12:17, AngeloGioacchino Del Regno wrote:
>>>>>
>>>>
>>>> Sorry, my bad. I alsways run `make dtbs_check` to confirm dtb with
>>>> bindings. I just think we didn't limit node names in mtk-vodec
>>>> bindings. I will pay attention next time.
>>>>
>>>>
>>>> Since currently the vcodec lat and core nodes are absent from the mtk
>>>> dts, do you think the child node name should be changed to something
>>>> more general (ex: video-codec) in mediatek,vcodec-subdev-decoder
>>>> bindings?
>>>
>>> The video codec is mt8192-vcodec-dec, while the other nodes are describing
>>> the VPU instances (and/or vpu cores)... I'm not sure.
>>>
>>> Krzysztof, please, can you give your opinion on that?
>>>
>>
>> What's the difference between them? I understand parent device is entire
>> block of consisting of multiple processing units? If so, video-codec
>> actually could fit in both places. But feel free to call it a bit
>> different (video-codec-core, video-codec-lat, processing-unit, even
>> something less generic). Sometimes it's tricky to find nice name, so I
>> wouldn't worry too much in that case. Just not "mt8192-vcodec" :)
>>
> 
> The parent device is the entire block consisting of multiple processing units
> and has "global" control registers; children are LAT(s) and processing cores.
> 
>  From my understanding, the processing cores are physical cores of one big VPU
> and, depending on the actual (current gen) SoC, the VPU may have one or two
> cores.
> 
> Right now, the bindings want vcodec-latX@addr, vcodec-coreX@addr (where X is
> a number, like vcodec-core0, vcodec-core1) but, in my opinion, changing that
> to video-codec-lat@addr and video-codec-core@addr would be more descriptive.
> 
> ...Or should we simply leave the bindings as they are and just go with the
> abbreviated "vcodec-(hwtype)" names?

video-codec-lat sounds better, but I am not sure if it is worth the
churn, so I am fine with both.

Best regards,
Krzysztof


