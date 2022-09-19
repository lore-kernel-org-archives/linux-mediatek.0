Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E854C54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 09:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ni5vNsO8umndiniabq8C5W9eiIXqQqotBmgaNWkkLK0=; b=AzihJrk+pKDgWKMaeqY7zQv2HY
	CjHxRwAGgwhoJvJw1LmgvgGYrdD2VWubAXjV31g5drdGHRlJi/F0KjMnHUhIVNoQcL27Ldc4ehciB
	MZdiJrA9MzkPtwJfx+QVkIBA/b+Oizw8pQRMYXd0E3hr48RKgoFAx/eqp7uoJystdc+IW/xaMNFR6
	uCDpiu55zQ3CwmdQpkf79N/NMxVckc9ER02GGzOHw+vkvpSP1l/oCJMg3RB05sZSrzrdrNHxVlRml
	lINQktXVZXWEcpDFBsQFpisUDUz5EeHX0ysCWiKVVbiC/xbx3WmhKJ+f6KOmPXVxYeqt5dysdTpad
	0/w5FFlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaD5C-00Aldx-DR; Mon, 19 Sep 2022 09:28:54 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaD48-00Al03-T6
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 09:28:05 +0000
Received: by mail-lf1-x12e.google.com with SMTP id j16so18909737lfg.1
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 02:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Ni5vNsO8umndiniabq8C5W9eiIXqQqotBmgaNWkkLK0=;
        b=kdGdpmpEChbWIseVkCKVEvUwIFi0MK0B4sNLWcpeEmqU9CRrk2WTj+kKzfKYObMR7m
         mXTvLyiMeNthhWAu8GagmQ82H8Edn+6gSumV048FtoC17iw9TJG+Nh8+R1WLThAaMurM
         I4jkZovZ1fuU/0VMZHnBMNWlfWfcv/QYfv1fFbL3meE0eOr1n0zwvocmGc66XdkeMEBe
         TKiE8eEBKPICnX7K946jxfyP1rPCdO61qSJ6GmKPYeZAgKW0E2f6lQcRIvjugfQDHnTl
         XcBY+5NOBufJa4x37aCbFok8afQLMXl8ISv2RjLCIgw54pRiwlYDAyoNcT7P6tP8NWZ8
         ximQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Ni5vNsO8umndiniabq8C5W9eiIXqQqotBmgaNWkkLK0=;
        b=3Kt7rLgHBHYHBHLl1DAMW5HfCIOch1+q12HqugcrD5bcH3Zo8jc3PHG/btCvKmsxj/
         5zVme0b2raVOL7dIAyNsa25sIs9PpreTrFkPpKCvh/mTvoEQ+GViyH904eUhbaywgfni
         oh0JmVjU65dOTQ69T2iHRXpLJh7pJRemzLOTjym8IlFRP8oBGLCkNa1k9sxW5IfBoCAC
         heAJAE4xObO97vffx0RnrVHNe1dgCYa95TMU7dd8j2wJcUh16x7HjaGc6jKIMpqPnHe5
         ImBhS+mD28JWvHi3UYXAayC36WT3ZBgsLtdQ9MRRItFCg2+De21IU5MUdW7wBeXbhA+R
         hP1g==
X-Gm-Message-State: ACrzQf3zqEY/XbwYLEPJyybJrfjtDKgui9lp7w1wFt4zqizqRTM2d6x+
	U+w226GaD00e5Y0KRh9VHhEkzA==
X-Google-Smtp-Source: AMsMyM7lxiuvbds2FRZKDW9lrUwIuvpGFw0m9oRIkcp0QON8mh5L72dtCjDGDIjOi83tFBanr+gAeA==
X-Received: by 2002:a05:6512:3d1c:b0:49d:87fc:f63 with SMTP id d28-20020a0565123d1c00b0049d87fc0f63mr5950005lfv.327.1663579667364;
        Mon, 19 Sep 2022 02:27:47 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q16-20020a194310000000b004946aef1814sm5112366lfa.137.2022.09.19.02.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 02:27:46 -0700 (PDT)
Message-ID: <88412fcc-96be-cd9d-8805-086c7f09c03b@linaro.org>
Date: Mon, 19 Sep 2022 11:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] stmmac: dwmac-mediatek: add support for mt8188
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
 <20220919080410.11270-2-jianguo.zhang@mediatek.com>
 <d28ce676-ed6e-98da-9761-ed46f2fa4a95@linaro.org>
 <4c537b63f609ae974dfb468ebc31225d45f785e8.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4c537b63f609ae974dfb468ebc31225d45f785e8.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_022749_182205_A65999F3 
X-CRM114-Status: GOOD (  17.76  )
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

On 19/09/2022 10:37, Jianguo Zhang wrote:
> Dear Krzysztof,
> 
> 	Thanks for your comments.
> 
> 
> On Mon, 2022-09-19 at 10:19 +0200, Krzysztof Kozlowski wrote:
>> On 19/09/2022 10:04, Jianguo Zhang wrote:
>>> Add ethernet support for MediaTek SoCs from mt8188 family.
>>> As mt8188 and mt8195 have same ethernet design, so private data
>>> "mt8195_gmac_variant" can be reused for mt8188.
>>>
>>> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
>>> ---
>>>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
>>> b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
>>> index d42e1afb6521..f45be440b6d0 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
>>> @@ -720,6 +720,8 @@ static const struct of_device_id
>>> mediatek_dwmac_match[] = {
>>>  	  .data = &mt2712_gmac_variant },
>>>  	{ .compatible = "mediatek,mt8195-gmac",
>>>  	  .data = &mt8195_gmac_variant },
>>> +	{ .compatible = "mediatek,mt8188-gmac",
>>> +	  .data = &mt8195_gmac_variant },
>>
>> It's the same. No need for new entry.
>>
> mt8188 and mt8195 are different SoCs and we need to distinguish mt8188
> from mt8195, so I think a new entry is needed for mt8188 with the
> specific "compatiable".

No, this does not justify new entry. You need specific compatible, but
not new entry.

> On the other hand, mt8188 and mt8195 have same ethernet design, so the
> private data "mt8195_gmac_variant" can be resued to reduce redundant
> info in driver.

And you do not need new entry in the driver.

Best regards,
Krzysztof

