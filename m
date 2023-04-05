Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9105BC76188
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 14:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CW6SEmeeRI4KuBNDdzCiH6zGWbYI1ySCeEScYHS2P00=; b=2NXJh/hLnmjIIjivaTeWKH+bst
	YIdKBkEjdqnaxlW7i1H3JpGUgtvn6ZK5jJpnLnWtwYZqno3uhE92N1h7SyY1Uiip5WMAqNEaStLvY
	dY8U+KfhHu9SX8ciPUXL+RYo1XGNWHhh2aVuF6vGshKAG4NNo87y/+MhHHx8+wSi3oOT7fhZAapWO
	YJLpm6J1l042q/UTW8a3czlmdpB6wgoz2Iwibf+qD4O5rN45Qcr6U9BbhfvRh9hPwvhlDj0/7nTE9
	NmoEaalI9El3Pb4NKcTvtce//YPGnhGDcQ4rKfGd71omYdgZRUwIeXfLiBhT0lWa8akkNmg+R/a3b
	8ol/Yf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4Dv-004hFP-0b;
	Wed, 05 Apr 2023 14:34:55 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk4Dr-004hE7-26
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 14:34:53 +0000
Received: by mail-wr1-x435.google.com with SMTP id l12so36414135wrm.10
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 07:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680705288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CW6SEmeeRI4KuBNDdzCiH6zGWbYI1ySCeEScYHS2P00=;
        b=YrHVUT/qOMG/lSCl/TxA+5ER2cLvgR+4p4XnJeag4tAzZbSa4j3qiw+HWKAq8phWyx
         nvFMFv6EI/PxNWwv1sE7v/QKbUHmbZFq5kswHNV7kLmwW1cCmCy8+qpVkhM/nCEPwUAX
         26sEgrtGY1Rv1A3VoFoo+PK5gLppRKj5FW4WgFPLvfd4jkaYisdgCUj6vDZDRDiMbW52
         Ko+yWY5tjQoCW0qTEv2iyTCq9ImTAuWX21wxSUwa8siGXcorQYuoS90KhkTSJhWAaRUl
         MAkJ4r9Jn9hK5/1h95Cog+W/uA67v+kOzRm+rngmmTJXldtDd3dozxhZ41x/R5ZDIPUO
         Uvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680705288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CW6SEmeeRI4KuBNDdzCiH6zGWbYI1ySCeEScYHS2P00=;
        b=sWZ5vyAYTu2gVpnsrTO2IdgaQXagTMr73f1jQGraO1E/GvAEz4iG3cfcfJkZaX4ydU
         qMGFRlj0vY1EXq6K/vu6pPl0A39IAOFxZIO28vLuOiDWYvH5JNUSG4lP8O3DLi+Y0KHd
         mIqrP5svmjuQuqF7ZCWjSqmKpuNAUoCaEMblKuRY0WlP2SVxk/Jxfz5gjqYuE2R2G2Hb
         GofiURWgsyJSxYsi2kcYvwANPvr+qZ00x3sc5y3ZKnONfXQf/0ZgfsEF+bI2lS7zCskd
         44rOCA0mWzwh33ThrqnYQlNUAV17sxBUG50kAPr4PjB6LzoSIGrfzy9zDjfG9Z5C6G6+
         2brA==
X-Gm-Message-State: AAQBX9cH2LETI7P7kK5bk7rGMWWdfdD0to7iqjUXDJtzX/OS/mp89Phr
	sgSbyJ78LHZK6nu1OJxN9Ia/yw==
X-Google-Smtp-Source: AKy350bRoK9o4nxpqsA5Es5CtZzavd7UOZlD9bG7h4k4M3SvZbJJl06c9LEpbSdXuqddV7dQYXIvsQ==
X-Received: by 2002:a5d:4f06:0:b0:2cd:defe:cfd3 with SMTP id c6-20020a5d4f06000000b002cddefecfd3mr4511354wru.30.1680705288039;
        Wed, 05 Apr 2023 07:34:48 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id k4-20020a5d4284000000b002cefcac0c62sm15333506wrq.9.2023.04.05.07.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 07:34:47 -0700 (PDT)
Message-ID: <25bcaa84-fb29-4343-d046-26e210fc81f4@baylibre.com>
Date: Wed, 5 Apr 2023 16:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 10/10] memory: mtk-smi: mt8365: Add SMI Support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
 <20230207-iommu-support-v2-10-60d5fa00e4e5@baylibre.com>
 <9847bc48-c96c-3599-e876-bcf9ebf1522e@linaro.org>
 <CAFGrd9pBdaHLGUZHkaz2_XKafyX=dxu9UckQxrphg52EG=A1SQ@mail.gmail.com>
 <8fc3dd22-79df-32cb-c219-896eda8fa986@linaro.org>
 <fd24877a-5fae-5434-dc56-61ab35ccd820@baylibre.com>
 <e38658be-1a2a-bccb-3f30-18f1b031f71d@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <e38658be-1a2a-bccb-3f30-18f1b031f71d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_073451_695294_A81FE499 
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


On 05/04/2023 15:54, Krzysztof Kozlowski wrote:
> On 05/04/2023 15:06, Alexandre Mergnat wrote:
>> On 05/04/2023 13:45, Krzysztof Kozlowski wrote:
>>> On 05/04/2023 11:53, Alexandre Mergnat wrote:
>>>> Ok, I will move the driver patch before the DTS patches in the next version.
>>>>
>>> Or do not send it together at all, which might solve your dependency
>>> problem. According to your cover letter I cannot take the memory
>>> controller bits, so I am waiting for dependencies to hit the mainline.
>>> Alternatively I will need pull request with stable tag.
>>>
>> Ok, I prefer send the driver patch in another serie. That will solve the
>> dependency with the DTS a least.
> What dependency? Why do you have dependencies between drivers and DTS?
> That's a no-go.
I probably do something wrong but, that start with this comment [1]:

> I guess we should add a independent "mediatek,mt8365-smi-common".

Then I have added the mt8365 compatible support in the driver instead of using the mt8186 which already supported and used in the v1.
I change the binding and DTS to use "mediatek,mt8365-smi-common" only (no more "mediatek,mt8186-smi-common").
Maybe "dependency isn't the good word to use in that case.
Except for the patch order in the serie (or send the driver in another one), everything is fine or there are others wrong things ?


[1]: 
https://lore.kernel.org/all/488d226a8a66bc6f5b96063b2816b59dd065ad3f.camel@mediatek.com/

Regards,
Alexandre


