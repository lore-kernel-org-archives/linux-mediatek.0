Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF17BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bgxu/xLyyKqfoS5wPukZ0Iv8tWIgajlD3uz/Xf77/w4=; b=vzyfDHAbcKKPJDFBqPSWqvZV72
	BcQ4d62S5zctvLqS+Sitc5iHUJSputzqQuzl6phpz7IfLI21OJ19EivvLDEcYlbC3+kiqpB8SPu8u
	zQcndyRQENwj2LuO80piZ6bufykmua2QHEtRbpY0469kACojzFrznkF6PvNxlrHM4y0KGOj9n4W7R
	DSxLIipLdWTnY9116fAsJGhCO/FUn9TXV/2RqHLYiCdAhVGOd0ROsDjGzR65W77PD3eKQU2/DrSDF
	WCZ9eO0tlAiwpZZsnmvp4ZYrsfysj0WdYDJdpxKcpqW7I6mGepynVIkUkyRYlzfElpha8mSIZ3HVb
	hg+WRF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jNv-002YYQ-4q; Fri, 08 Jul 2022 08:30:47 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jKV-002X4g-Qg; Fri, 08 Jul 2022 08:27:17 +0000
Received: by mail-il1-x133.google.com with SMTP id n9so8311563ilq.12;
        Fri, 08 Jul 2022 01:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Bgxu/xLyyKqfoS5wPukZ0Iv8tWIgajlD3uz/Xf77/w4=;
        b=o/XgkzJQCfZK0pGFN2Km8fOBNvJRpwLH60EDC76vYr7wNIhoj1JTnffNMGCZUC2oMc
         owNNwAknfKOVCNL8wRVnZWXs78qP0xOg7u7BW/+YXxE0B6gsaJENw15zhwqFKBKPG5vE
         KdIVSbdFhhcaQclB8PdJuwp6VkqQ0K3rEsdaOKhVjZEAufdG5acAHQthmTpQ4pSvfUMR
         e+z2n2c0o3YycYgexQHqoLasJBOJZhyiiS3i8aBI804bLF9k7CBtvvdfz3Cc7KN3YpSa
         tVLfGAee31+S95ltfxtgaItoSMQVpsQ55/7CobQF0PILrlHcvXZ2VSVGCgaAdP16Gqd0
         nHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Bgxu/xLyyKqfoS5wPukZ0Iv8tWIgajlD3uz/Xf77/w4=;
        b=ueU9cqZ5X74cz8PL6s9GCdz9PZCreTVaY0AqiKf2fEg5zFa1vAz5TIfT2CkeuO3HaY
         oFoxds7/86Pvb5UoEoch44od7r3q2rqFH8tqCMWoKP+6raTxoUdCl0LmcwQWjOrlRj4D
         rywMBP986NZTYqqtTJcDDdE1+k7QItowCgN6d+jVOiXnvZIU6xYotyQabbBebaMoyRG2
         FGdpRr01Aj4Rxn94GvM4HMpgDRIB0blwL0rz5twJlfplY6td8C3A2pdyGOP7yGsqMQBZ
         iI6ho6v2wSxzJ3pVVLpHsnE88rwJ4zqwcj57XZDAnFZJeQe9SU/pagx/t/9bWwKDUUKL
         ULqQ==
X-Gm-Message-State: AJIora/yj3SryBuWXSB5cNpOzZrWXr/HR1utliToOBiInjCJ79eV4n0Q
	Ai0XyznSn1XBwF8UcMKoR+T6YJGFn89JJlvK
X-Google-Smtp-Source: AGRyM1vnsWrtnJRk0jGv6Ng9Tvb3M1qrO1dRsqt8Fp6uiudca8vyk74yUZblERyEFd0mFY7nwZs3kg==
X-Received: by 2002:a05:6e02:1284:b0:2dc:d3b:ccf6 with SMTP id y4-20020a056e02128400b002dc0d3bccf6mr1391671ilq.91.1657268834670;
        Fri, 08 Jul 2022 01:27:14 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id s13-20020a02cf2d000000b0032e7d0a79basm17938432jar.158.2022.07.08.01.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 01:27:13 -0700 (PDT)
Message-ID: <b741704d-e8b0-25b9-6111-cb4fedfd18c7@gmail.com>
Date: Fri, 8 Jul 2022 10:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/2] MediaTek Helio X10 MT6795 - power domains
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, mbrugger@suse.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, nfraprado@collabora.com
References: <20220503141441.125852-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220503141441.125852-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_012716_030514_6C4AD97B 
X-CRM114-Status: GOOD (  14.26  )
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



On 03/05/2022 16:14, AngeloGioacchino Del Regno wrote:
> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.
> 
> This series introduces support for the MTCMOS power domains found on
> the Helio X10.
> 
> Tested on a Sony Xperia M5 (codename "Holly") smartphone.
> 

Whole series applied, thanks!

> Changes in v2:
>   - Changed license header for mt6795-power.h binding as per
>     Krzysztof's review.
> 
> AngeloGioacchino Del Regno (2):
>    dt-bindings: power: Add MediaTek Helio X10 MT6795 power domains
>    soc: mediatek: pm-domains: Add support for Helio X10 MT6795
> 
>   .../power/mediatek,power-controller.yaml      |   2 +
>   drivers/soc/mediatek/mt6795-pm-domains.h      | 112 ++++++++++++++++++
>   drivers/soc/mediatek/mtk-pm-domains.c         |   5 +
>   include/dt-bindings/power/mt6795-power.h      |  16 +++
>   4 files changed, 135 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mt6795-pm-domains.h
>   create mode 100644 include/dt-bindings/power/mt6795-power.h
> 

