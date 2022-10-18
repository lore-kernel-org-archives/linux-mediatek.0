Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB8EC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 18:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BK5yk15LkKfIrAj2R6RMYbj0RdizV7gUhlXw7YTHuck=; b=Z5hgnHGu1MNAgqMgXnX5fYPmvn
	DcUG3VFq8qPeXDrtP3vsa+QO455bGUMyxQUEgb7xHz4LdicfFScX1LgCxLRfb5S6iSpKgIXDazI98
	upWFzsWx83xrujQXaXO3mVDBl9Jgrn31teIH39Bz8pKUyINlNIhwf8cE/gvdYOufMftiDdGFsjCLj
	LI3YafO6aibBer9BGl/5xpc+0lZlX6sUvsyqsU3CsebNSzMxMN7IrkFjFC9Hy7VCsNQG9WWFpL9DL
	KT37Mqe6roDrXdmO4Z9AgD5/AxTVldkPxr2D1p2DQaLUALYTtdZQMOI6IRgvOgyii1XCN7Vl7Y4x8
	J8J54QpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okrM0-009vJo-I4; Tue, 18 Oct 2022 18:30:16 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okrLp-009vH0-Gc
	for linux-mediatek@lists.infradead.org; Tue, 18 Oct 2022 18:30:06 +0000
Received: by mail-qk1-x72f.google.com with SMTP id x13so9217612qkg.11
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Oct 2022 11:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BK5yk15LkKfIrAj2R6RMYbj0RdizV7gUhlXw7YTHuck=;
        b=S8z7ViILNWv6pSSoxpuj/F/EYGFfWIFaN7il1DWvpL18xqGZcNZUAQfdS1OoechpTt
         sK1h7Hg6LerSvf+o6QdYAXBqi796Yvaz+JeibS5CoyetsXV42bOX8mqWETc9k96d+N5L
         Xxx7R9SCKEijUzuvOg+SUMer/s9EUFXzrFH87JB14uQpyoXoYGwkDx6mburJYJ3BTCXx
         s5XCERItoFaBUGwLV/CSTYRVJHPl4ET9rJbCDstnJco4kAacYirsKbJRviRK2kwo9ytt
         OEX6IrVCI9Jhjh6fAqr8LHlGezBmkX+p2TVL4mYXjve0evSn1s+FOvo9kKpb87LUg7/S
         Z0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BK5yk15LkKfIrAj2R6RMYbj0RdizV7gUhlXw7YTHuck=;
        b=ngEHkpr7lQ19VMPEZz1JzOD8/7QFa/AJVoQmzLnpACJ57UDdNNbmm1v+h3qYkZB68x
         v1jq6d+IG556aiLzA3ghP/MK2dScurDnC5O9U4ZSNGY+c02jG3nVhaKptAeIiG9Zfb/9
         FOoe+ybh3bBG7iV0SnAeOs96jfrxsLagKJst8hfCcf3WlecrdyTGg9sl7Jg5zVO1OULP
         jSEOUnIa/uySpwNpmzVFCVOpsGQczWBu0pHThWu0rZQYkbX+jfF1FKhWD3Kt8GlttsRS
         tzlTuEcOiqoNhPaNltYrr55iNEnobJ3T3/h+KeJJ3Qcvexdjo3HC/MyoE+d9kMEXKe4w
         bmUw==
X-Gm-Message-State: ACrzQf3ElCRBF+CU7O+sQkXHi2qdMUFE/0oUSg86kYHat3WvF/f6Xq4U
	OYIsHmvl6VoM4TTaWRuA0F4toQ==
X-Google-Smtp-Source: AMsMyM4kK8z6bP4sSqyzi35kzNH1G8VJ027Py0bbB36RNpqYcPKjKDrRGf2YgUcA/R6HCsTR+aiB9A==
X-Received: by 2002:a05:620a:4548:b0:6ee:deba:2795 with SMTP id u8-20020a05620a454800b006eedeba2795mr2837278qkp.621.1666117804589;
        Tue, 18 Oct 2022 11:30:04 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id cf17-20020a05622a401100b0039c7b9522ecsm2405829qtb.35.2022.10.18.11.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 11:30:03 -0700 (PDT)
Message-ID: <8a418360-400f-ff00-4230-865af883f17d@linaro.org>
Date: Tue, 18 Oct 2022 14:30:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/2] dt-bingdings: mmc: Mediatek: add ICE clock
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mengqi Zhang <mengqi.zhang@mediatek.com>, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 wenbin.mei@mediatek.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221017142007.5408-1-mengqi.zhang@mediatek.com>
 <20221017142007.5408-3-mengqi.zhang@mediatek.com>
 <5d87f1c3-1c73-054b-dca1-9f52939e187d@linaro.org>
In-Reply-To: <5d87f1c3-1c73-054b-dca1-9f52939e187d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_113005_590221_285E0DD5 
X-CRM114-Status: GOOD (  12.84  )
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

On 18/10/2022 14:29, Krzysztof Kozlowski wrote:
> On 17/10/2022 10:20, Mengqi Zhang wrote:
>> Document the binding for crypto clock of the Inline Crypto Engine
>> of Mediatek SoCs.
> > This does not match the patch contents at all.

Ah, my bad, I read "crypto block", not clock, so it matches. :)

However you are not documenting a binding for it. You are adding
optional clock.

> 
>>
>> Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>
>> ---
>>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
> 
> Best regards,
> Krzysztof
> 

Best regards,
Krzysztof


