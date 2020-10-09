Return-Path: <SRS0=0dL+=DQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3068C43457
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 12:51:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3920B222B8
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 12:51:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LraACOhQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvz7+I6m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3920B222B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xgkAj0HSDE5VtggxF6tWd5Toi+l/P6tMyvCWSxdOkvE=; b=LraACOhQUzyNmaIXhCJVaN42/
	BVuZVcxb6Jo35utrooh7GFZnd/G7PFOA0la2FTYMIi72NS5NxvKjkUHvr4tdQc1yEUZfQfEc70XX8
	RGY9DGNytO9y0roN9evm84Nc6r4EDu8rMeZRNQxoWOrDioycdTIBhMfoniQRjyNMGjW8C2Em2Bjb1
	9uAMmeh+F10tcXuE5IxFms5huqsqZ0fEttEfkUa58FvBODy43fTibLsLOBujchql78yKKJAiQ2mir
	brlXVnCzep80+rQbShgxLjTTtrB3OuY7x8LlW1SAH+snGEZvTIDET7TPKUSwqi5uHfxLyIN0GrAD0
	EZK32kqIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQrrQ-00086T-UR; Fri, 09 Oct 2020 12:51:00 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQrrK-00084u-Ua; Fri, 09 Oct 2020 12:50:55 +0000
Received: by mail-wr1-x442.google.com with SMTP id h5so92206wrv.7;
 Fri, 09 Oct 2020 05:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tM6Kdz3zm/Ta3Gss9N6jrcTtQpKgV/+ZBA6O7+RCUIU=;
 b=fvz7+I6mR0zZMw32XB6gmmCQotdNgOJrrC+cN0BzmWCvh/XsJp8belJ57zLJY3e/P7
 8/sx2jUAlExX14aaehwes7Fk58lq3KOylbb/hUHU5G9uOl7I4EUPltuEcegw1iCd1pee
 Uj7Yp2bv7x49Vcvdfzmzox/WpPlO+dA0B5YfGraVIPgGXTNFI/y/26pWhx8d/R5SOeJ/
 VxTTJ3lLVALX+ytUyhoLaTfRt+Uz1e16l6RAXJt8ZY8kJpeFGBw0ExAEQ+TnIYdXXlkv
 01dA86W6+YqjD5npZf9PN7anS+9AvTeWbNP8sclnSLN9XjWu6TrrsUW0TW5UzdRmqYV2
 JRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tM6Kdz3zm/Ta3Gss9N6jrcTtQpKgV/+ZBA6O7+RCUIU=;
 b=XeQ3q6IMOLiw78w1kd1H7K2aZbJYW2GQ2eZGzAgNQDK0cHoGmb4UAnFuJyD5GK9HsQ
 LimZO+sfp2kERmRXCKmxeLVF9/b7dMKo8gc8UFFTi7yS3yHnTwuYfWAmATBacZAXDC7k
 lET+IvhDwIHkejMKGt4yFYeTARJ2idHfnE0n3F7jHrkEs2e5N4kH5fR2eyL8IZpbGkvo
 B4kpRkubqpUjTBq2AjuU5lbKZCAWMJz1OhgYMnylWNOznyepLjTBD+XIlUDU72+GNehn
 cnBwzNqyFsRwq1mAeVBUxfoy068oFtN18QK9PIZkqKSZ3OCgl8LpiKlkuQueCzidkPPI
 yOLg==
X-Gm-Message-State: AOAM530tCedUXNfiVaTKFZ7qKa4xQ6yJe4v8eSE/4Yi+TfejRkvj+4G1
 j2pdJDeldCyHgjcX1r1WDTNb7BLr2RwKpA==
X-Google-Smtp-Source: ABdhPJwz4y/KndvcADy27gF36kL0k+wfesqMBuQbCCYUAsMR9/vizw/ke6NPsmw8w2hj4OGccaTUSQ==
X-Received: by 2002:adf:9e87:: with SMTP id a7mr1178442wrf.185.1602247853535; 
 Fri, 09 Oct 2020 05:50:53 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id k190sm11691295wme.33.2020.10.09.05.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 05:50:52 -0700 (PDT)
Subject: Re: [PATCH 00/12] soc: mediatek: pm-domains: Add new driver for
 SCPSYS power domains controller
To: Weiyi Lu <weiyi.lu@mediatek.com>
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <1601028361.1346.38.camel@mtksdaap41>
 <19678952-e354-2067-e619-ffac28b347be@gmail.com>
 <1601967207.8638.4.camel@mtksdaap41>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <f2185b28-0b1f-8cf9-8717-12e28cf2bbf0@gmail.com>
Date: Fri, 9 Oct 2020 14:50:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1601967207.8638.4.camel@mtksdaap41>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_085055_010328_39964AAD 
X-CRM114-Status: GOOD (  26.95  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 linux-kernel@vger.kernel.org, fparent@baylibre.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 06/10/2020 08:53, Weiyi Lu wrote:
> On Fri, 2020-09-25 at 16:04 +0200, Matthias Brugger wrote:
>>
>> On 25/09/2020 12:06, Weiyi Lu wrote:
>>> On Thu, 2020-09-10 at 19:28 +0200, Enric Balletbo i Serra wrote:
>>>> Dear all,
>>>>
>>>> This is a new driver with the aim to deprecate the mtk-scpsys driver.
>>>> The problem with that driver is that, in order to support more Mediatek
>>>> SoCs you need to add some logic to handle properly the power-up
>>>> sequence of newer Mediatek SoCs, doesn't handle parent-child power
>>>> domains and need to hardcode all the clocks in the driver itself. The
>>>> result is that the driver is getting bigger and bigger every time a
>>>> new SoC needs to be supported.
>>>>
>>>
>>> Hi Enric and Matthias,
>>>
>>> First of all, thank you for the patch. But I'm worried the problem you
>>> mentioned won't be solved even if we work on this new driver in the
>>> future. My work on the MT8183 scpsys(now v17) is to implement the new
>>> hardware logic. Here, I also see related patches, which means that these
>>> new logics are necessary. Why can't we work on the original driver?
>>
>> Well the decision was to change the driver in a not compatible way to make
>> device tree entries better. If we work on the old driver, we would need to find
>> some creative ways to handle old bindings vs new bindings.
>>
>> So I thought it would be better doing a fresh start implementing mt1873 support
>> for reference and add mt8183 as new SoC. From what I have seen mt8192 and others
>> fit the driver structure too.
>>
>>> Meanwhile, I thought maybe we should separate the driver into general
>>> control and platform data for each SoC, otherwise it'll keep getting
>>> bigger and bigger if it need to be support new SoC.
>>>
>>
>> We could in a later series split the SoC depended data structures and put them
>> in drivers/soc/mediatek/pm-domains-mt8183.h or something like this. Is that what
>> you mean?
>>
> 
> Yes, that is what I want. And I guess it could avoid the collisions in
> the different defines to the control registers and power status bits you
> mentioned. Hope this will happen in this series.
> 

Sounds good to me. Enric could you move the soc specific data to separate 
include files?

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
