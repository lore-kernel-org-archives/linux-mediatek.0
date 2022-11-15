Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8162C43217
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wrWpTcqZkvu1mmEitCifcGVxseblveX37zlqDCCpjc=; b=zHjFAqgPef0DmtNE/xfNmDHJhS
	WvBnku26LQ5AaEH3q7qGLO72ccA548bR8C8g0l3aRXKsowgekOhmiOwu+zw6+8PMk5NJ8k/IfnKqk
	pBe7120EU33iNoh921a3lqf6mH29pn4wfxZp+oiAS+gXbcZ/LAiQgbfRpn9du8BSLaqilRw3ZGdrX
	DlQ/f9WH8Y1CnxGoB0q71VwPgGCtsUzcFuINyPkFvKlo4oRnb3ueODjirc5iFW0VEIQGcyWil/Vv3
	8Cr7ovTQq92BF26rGcRdD17pDcazcxB81H2Xm/iZ5xD3XZAPpt/Sxqva0yDV1DyKvCccre/St0Ma1
	gSfhNYZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousce-009bn8-2J; Tue, 15 Nov 2022 09:52:52 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousTx-009Wj0-Gy
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 09:43:55 +0000
Received: by mail-lf1-x12d.google.com with SMTP id p8so23550411lfu.11
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 01:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+wrWpTcqZkvu1mmEitCifcGVxseblveX37zlqDCCpjc=;
        b=it/DGIfpFZ8anGUh2KdXMRwrOXmr/1l+NeEU4BlzB5mGBZkmEixmLYx40GUCVKB87e
         bCrJmUvRNocDMraCwZfAYcF7ECn1W0ZriniqdEo6GMDTXquXhsB7Um4pr3eZ+s2VNGdc
         11q/S+5B/4piz75M2HQhxuPy2uNKsSfDGwfzbYCayE/QnHZMdVQnGBKoqVAHTLBS+TXs
         eel1HZWnAx8UWO9f+jPF8RMug7N7vVAGDysfsJMXcnx8W/fZIsWQNmsrUdKjlVXXmaua
         2Dp17L1VeW/f2vj3AWfhevQHBHEMtbjLBwgdIY8/uwChGshulhPfbzyzPcFm2ji4RcDJ
         sKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wrWpTcqZkvu1mmEitCifcGVxseblveX37zlqDCCpjc=;
        b=jqBPiVfFKIhSw6PFFrdpEHx3VbHyBxEwQNg8VbljZYFxau5185yZi+u7ozdpj91gSE
         oXi/LV00wRTJj7BF/8hP8TUgQ/8dQEjT6JqOVTfvHKX4a97JGrOm+n+T3doLGBWc1jxX
         WC7cGjq0Cz2Dzwg3Pc4HGLFWxrdLDZJlRbz7/TTJ9ecSPk08tzifybb7CuNqCPKSWX8g
         /TjSy7jLSUglG0BrKpPIki9FKh49e115oBoRCrubDy1XiQKFq2G82ufGb+XHj7ruwrVD
         OLu354SgfkKPss6NML8rRwYxGrl1LxbNNb4Dl33TjorsMWc/N2IoGW+6f4rs11sn4qam
         2gMg==
X-Gm-Message-State: ANoB5pkYEgchyGIIEv1lGhZmxfCShA1gNz58589upIUUM55mR7AjIOtB
	05nYTm3obiXaSIWBYzP8f9FeCQ==
X-Google-Smtp-Source: AA0mqf75O/7WU8XDD9IwQKSCfFeGbOFmcHAo5be07CziHS5AMi+B7pemqxe1e76Z9mVvNjLaX4/kIw==
X-Received: by 2002:a19:6449:0:b0:4ae:5dc5:82c5 with SMTP id b9-20020a196449000000b004ae5dc582c5mr5964438lfj.2.1668505429663;
        Tue, 15 Nov 2022 01:43:49 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b13-20020ac25e8d000000b004b1892aa5c8sm2155057lfq.56.2022.11.15.01.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 01:43:49 -0800 (PST)
Message-ID: <33c2ffe2-7f23-5292-8eec-aee66fb59cf8@linaro.org>
Date: Tue, 15 Nov 2022 10:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 05/15] dt-bindings: usb: mediatek,mtu3: add MT8365 SoC
 bindings
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
 <20221115025421.59847-6-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115025421.59847-6-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_014353_630062_FE8844A7 
X-CRM114-Status: GOOD (  11.41  )
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

On 15/11/2022 03:54, Bernhard Rosenkränzer wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

1. Drop second, redundant "bindings" from subject.

2. This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof


