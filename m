Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E04C6FA83
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 14:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92yZ7qnRQqA49V70vN00C9HGqUmmV5lex66grIlTbSc=; b=TCUbNs4kVyvMvd4PQ1pPznn798
	zzJl8zfSjDgd5URdn8F9fMt0cE+hEAZwN0z2gmVhNDlQFCrPTifnK3B2ooyaw1EzROeOhr5Wn6jpA
	eonCa4dNC8NeHyZUpCDHEpSC2e5PB8DV0DmxKs+/Sq+NRnU8T0gRGEoaoIol9RSEy4BDHZRf5J4YX
	sWrUwIgxurPV3LslSpc43XWuRnCmj5yd5P5guUhXoXT52F/1aICv0kL+i27hMs8cIzaeqoxGZc136
	d4dTnXw2+EnwU6CVDU2hPLzgYB9xAQWS44YMvv8YYAl2Dnolj/VFmHEd/sGJ4e/7KTwJxhVipSCGf
	pwOVj2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odBa3-00BEuc-0t; Tue, 27 Sep 2022 14:29:03 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odBa0-00BEs4-3R
	for linux-mediatek@lists.infradead.org; Tue, 27 Sep 2022 14:29:01 +0000
Received: by mail-lf1-x12f.google.com with SMTP id o2so15949954lfc.10
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Sep 2022 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=92yZ7qnRQqA49V70vN00C9HGqUmmV5lex66grIlTbSc=;
        b=t/zPAMSAQWX7Jp2Kkrznx3pd8BaYj/V4IovrZOP0p7CA9dHLcTpMosv+TEf82eIdQN
         ZzPiXw9rKlWK7dgrb/2R9JIb8zq9h17dOUBhdV7CLo6ItGSkQYBffOF2Ou5wtqP2NA3T
         N9rEoP+h50jfo80xq4j1r3mCJzXfyYlWLZNzw2x5BGe+XyxiWRwC+2x4+yiqv6IzriEM
         fuXrcHsauWPdkNwTqAUt31tFVgYpbwvnD8NThfc3Z4YxzLdIRb1JExpoeuZAlbZVjurb
         kbFPPAxHbGw01+RTl5nssKqglXejrUk6qW39J2Eas+i02imuJL8VJjhw11y61M81MWAG
         3WYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=92yZ7qnRQqA49V70vN00C9HGqUmmV5lex66grIlTbSc=;
        b=k4DItXyUMGKmwHT6ndQmcZBmlDCdUrhbS7F4nOmJnoytJ7wJLSSO4grh+lOF9vSY/i
         xGYiprCOSW0C3vzqSAAoCivV22wO8QLuaTk8MbWmI664J5RcgpYDvRnILzpv8yCiMVqO
         xfRcCkJyg3h7Bkphf8U8DjIfLJ7Zic2P921ueksS2XMTSETY7d7w0gPI39wcHDAylMSd
         19Qv5Jw2rR4RjiDa+EeycnXJio4pAnTKrtiSJgoBumUyk7fqD7VqhJaGzoI/XnzfVdIg
         RZfD4Q1FjA6HtyliwMex4BkkGK0+hW4Q9EUYYINBAiRQIoQ+1A3BzuNG4YGFyI3/unhv
         FQQg==
X-Gm-Message-State: ACrzQf07wjQQdb2WjvYny7PWDbOnnlDlb+LmjfXhVczMGAu8Fo+5KQqr
	o/OXn76w9aODR5sjDO6kBAM9IA==
X-Google-Smtp-Source: AMsMyM53dC3y7erBKfzBQ+Nze0zZtnLF71JT4J25PfiX1YCvYNVOBA7+2R4vFWpiZCxVk3PBax4BpA==
X-Received: by 2002:a05:6512:308f:b0:49a:5a59:aa25 with SMTP id z15-20020a056512308f00b0049a5a59aa25mr10629204lfd.44.1664288937219;
        Tue, 27 Sep 2022 07:28:57 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac25a0c000000b00494a1b242dasm182416lfn.14.2022.09.27.07.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 07:28:55 -0700 (PDT)
Message-ID: <bc64b69d-3d65-f5ca-a688-2ad1a055ba4b@linaro.org>
Date: Tue, 27 Sep 2022 16:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 17/17] drm/mediatek: Add mt8195-dpi support to drm_drv
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek
 <mkorpershoek@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-17-4844816c9808@baylibre.com>
 <a0a3c427-c851-ae5d-4010-e94740bf9f6e@linaro.org>
 <CABnWg9s3N_Ua9g0S3x0uj8PN4FtOX6DO+zQcBzGFqoLTL1J24A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABnWg9s3N_Ua9g0S3x0uj8PN4FtOX6DO+zQcBzGFqoLTL1J24A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_072900_198166_042B7BEE 
X-CRM114-Status: GOOD (  16.02  )
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

On 27/09/2022 15:04, Guillaume Ranquet wrote:
> On Thu, 22 Sep 2022 09:20, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 19/09/2022 18:56, Guillaume Ranquet wrote:
>>> Add dpi support to enable the HDMI path.
>>>
>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> index 72049a530ae1..27f029ca760b 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> @@ -820,6 +820,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>>>  	  .data = (void *)MTK_DPI },
>>>  	{ .compatible = "mediatek,mt8192-dpi",
>>>  	  .data = (void *)MTK_DPI },
>>> +	{ .compatible = "mediatek,mt8195-dpi",
>>> +	  .data = (void *)MTK_DPI },
>>
>> It's compatible with the others. You don't need more compatibles.
> 
> Hi Krzysztof,
> 
> It's a bit confusing, because this compatible is used in both
> mtk_drm_drv.c and in mtk_dpi.c
> 
> Albeit it's entirely the same thing regarding the mtk_drm_drv module,
> it's pretty different
> regarding the mtk_dpi module.

Sure, but this does not explain why do you need these entries here in
mtk_drm_drv.

Best regards,
Krzysztof


