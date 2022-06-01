Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A26EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03XkPOBjtcPPLwbUKpxttcj/1ZIvmiA4G+M1hQmTIQ0=; b=x+XZLdv8v3DNeU
	Jv6+dGAauTDf4FOVkwe8YZ4ofRMIiNqtaaLUqdKlrqfkDN3lwESL8BG/nF4XGjwBazxVjKgZ+pksf
	gpns+yulM8A2Rj4RPHeNQntMoHZZd6NKL7/+aO8aKbHl3YZVj9ZEQkOjb25U8xkeD3mLpGA1U9eT+
	BZdrytcnUlmv8IV3JDJym6uB8oN6BckVBvjFGXtRz2Uc0e0cUzxwLVosbZ6tlwtm7CCdC1Eqv0T35
	sAiQokAbYAayETjScYnrxojag7QbMsFaKHnFcIbSSyKdsJEJ4l4RAVb+DQohG6+qqsG9pTnKVO4TV
	A59MTisKDy9ISYg/nirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMCe-00FVvb-Gj; Wed, 01 Jun 2022 11:07:52 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMCN-00FVmb-F9
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 11:07:36 +0000
Received: by mail-ed1-x536.google.com with SMTP id b8so1646655edf.11
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 04:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=H0ece/IDP7RdIvy51D5F2zJdLXLmLswCl9L/sPADS14=;
        b=Gw2IkXH0AxoQW7eV/fyLtVJXgYNj3yp2/vDlyx3L992+MyWBLy201VqcAOHwG7mxge
         ELtYHKv5BrHIaEwSYaYPCtKJNRQP/JI9TmS0Tl3JuEy9QmiPVPykG3VXalmU2tEhvrGT
         loTE2guxJvC2opKPUauvpFgESwofZPRZiyAQyivxl9qkkJUIxVSzB/lruTWB9PvjzRmS
         sr6/ilJQk50sNQ7KgZzUFYFkkVdvCgDkfOHwxTBIX4dMFMCnO1OJSmzKWeUiv7wrgUT/
         ExLAs5kiWKrWoj+vETqnuFG4fMv5nqLrejtAIa9nnPSX+Yyo5mUwuB3lsT/cIt/aKIY3
         RotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=H0ece/IDP7RdIvy51D5F2zJdLXLmLswCl9L/sPADS14=;
        b=IYpFqPE5zqUeudbyWTTQMh2sGNBnIp71CWTkgk1yxRWTEWMlRSHpvY+YWLdbIvRUr7
         QGt7M00OT0mWgL6qdrPrQ97WkmKW+q4QZ/tSQxj+ZV8/HICakYhJqb5iFaqzrB7JOG7L
         Dznh1VfGZ0tqWdgQmIeCca6xKyYWywoGfq7i9kvSho97pSOQelBSMboJE9OaHFVqE7sy
         GWRAGW6pf4DBKg9mevaXzH0Ces6rk/roqApV2qxiXyHid+gmJCpprApeeLB6zBlmglNc
         Y+ruaos8EaBgmqsW10+7MuIq8gXvs73CpKjhe05w4ePlABKmaU9Z88ZGOn/yPxV6rCGW
         5C7g==
X-Gm-Message-State: AOAM533A5nV3Wz8gH/F7rErRy89/amjh7HHU8cWC3+9g/kvpHmG8rgd2
	UzYvhx1dSIOGZ/AwpmbeYdhCjw==
X-Google-Smtp-Source: ABdhPJxliq2zoQ7EY75YWWIwkNtBeKvlUu6ft5cqp9PCjRrmQSQdP2fZQajwIK1mJ3JRnyAOtaVuFw==
X-Received: by 2002:a05:6402:3906:b0:42a:ad43:6477 with SMTP id fe6-20020a056402390600b0042aad436477mr69832096edb.20.1654081652247;
        Wed, 01 Jun 2022 04:07:32 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f1-20020a056402160100b0042de839eb2csm778928edv.27.2022.06.01.04.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 04:07:31 -0700 (PDT)
Message-ID: <fdbb08a7-393b-73e4-7b63-dd668c23874d@linaro.org>
Date: Wed, 1 Jun 2022 13:07:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: mfd: mt6397: Add compatibles for MT6331
 RTC and keys
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, johnson.wang@mediatek.com,
 hsin-hsiung.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220520124617.228808-1-angelogioacchino.delregno@collabora.com>
 <20220520124617.228808-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520124617.228808-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_040735_613580_0FF6114C 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20/05/2022 14:46, AngeloGioacchino Del Regno wrote:
> MT6331 is a multifunction device, providing RTC, keys and more: add
> the necessary compatibles to start implementing the basics.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 2 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
