Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D725EECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 10:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/6rguEg/ZdWc1ukf7xlwUxy6XdvsLO+DoWiEuYD7Kc=; b=k9aGbeblW8igsKwg7FqVKcFt73
	DSirtTh3OF/dx25F8EbQgR6HGBZvrS7csH/CCaet9oNugbzo4JOTo6mHiLrG5iX8aBd7iawdvP8MO
	FDuQSpN9TJG4ZCMUv0ZFV5EypPPkWnZp5UczYOarPGWbsUDeZodzuGhpqbXIvzNhMPP3Yg5uy/rz/
	ytvYHzSIGXW+nAJgm6b3LPdZ5pBaj8FypKPpY8KoCjOE5BWa5ImBSobbJKO3rlX0CJCu4aH6/5pCm
	si/GB7oUog5TZtC2bJbG5eqZeE7mbx+KFIa8MJnjnPPRc7ynxPQgpElDKvW+iN8Z03Wu4aQcOAC1B
	Xi1sPA3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDfT-00B95u-Mn; Mon, 19 Sep 2022 10:06:23 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDfH-00B8n8-IE
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 10:06:15 +0000
Received: by mail-lf1-x12a.google.com with SMTP id x27so12855176lfu.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 03:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=E/6rguEg/ZdWc1ukf7xlwUxy6XdvsLO+DoWiEuYD7Kc=;
        b=R/d5F8iQ5A3MJQq2a2urDyF3hOpf96JRd6MMVeuZytNnN38d+CMzYHcqO67WLlgjrF
         1YOTkwdBXx89EEa5IHZCIOnsH/D7ixYq0fnqz7E6WzF9juomojx3oI04uV+WLIpC7pSq
         VUlPCpXDbtXt1bOBZICVgjdP5lDuEF6FW9ya//+jjjjvV4Rdu1Io9wwK6PShHtWVk05C
         myyCftKiYalXiuQf3wsSfCHOD5hrDwaw9Dy4z1o7/Lkli8O3u6KPW46z/bDhJILuJ5Ea
         qFQ/gGWd+eX6p+JCLsf4mZezgCkL2wP/f0kkg5zBeR73KILKAfNYbrWR6TYXWl5SvOyO
         YuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=E/6rguEg/ZdWc1ukf7xlwUxy6XdvsLO+DoWiEuYD7Kc=;
        b=YdKkNlZTm5wDMrw0mNf7BdPhW50m8n3EYNq3hXk9F1YKsbaf87k7EY15iL2xLUQaud
         SmhT8nVgaQS6lwIKY64qGIta4MLvTrKMmkbceQtUO0b0kmoWRU76aE5yBT7CKO4FuOby
         4mL1n6Lv7+zLX+2VGh4AnDce6VEJMUsERFogNuq7n6u3bq2E4xMUugM4GYJQhEG7P+qJ
         4wiSOFP5UgsVSTlX79uM63/7SyZBfQ0xd8LgCnYLe2z/QEc7wsr1DTrlUgdsenummMQ7
         U8XKsuulodvBOUdQkoGa5Ir6RYfJwKRgsFfzoK5cn7k6Ns7D5gaUWQmyuakpN2sCRqFV
         Rnog==
X-Gm-Message-State: ACrzQf3oHcM1mOWCYEWRwbkHTg9IBS4rCtiThbq8TB24f9hUZKW+PNO6
	oxKeM1q2FLyASq6rlECNzH1vgA==
X-Google-Smtp-Source: AMsMyM7gfRP2Gkver1jK03ZgtDxTkEMoPJyKiDo+jioBxtwYyq894VSIuGwOrIApkwapq8djpspI7g==
X-Received: by 2002:a05:6512:e9a:b0:498:ff3b:4639 with SMTP id bi26-20020a0565120e9a00b00498ff3b4639mr5805175lfb.388.1663581966082;
        Mon, 19 Sep 2022 03:06:06 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n4-20020a05651203e400b00492d064e8f8sm5141134lfq.263.2022.09.19.03.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 03:06:05 -0700 (PDT)
Message-ID: <b343e4c7-a247-28b8-3d16-cb7cea7ba36b@linaro.org>
Date: Mon, 19 Sep 2022 12:06:04 +0200
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
 <88412fcc-96be-cd9d-8805-086c7f09c03b@linaro.org>
 <f72e133e9aec70724702054e5f6a8712b649d34f.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f72e133e9aec70724702054e5f6a8712b649d34f.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_030611_689105_84B5FE6B 
X-CRM114-Status: GOOD (  10.48  )
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

On 19/09/2022 11:56, Jianguo Zhang wrote:
>> No, this does not justify new entry. You need specific compatible,
>> but
>> not new entry.
>>
>>> On the other hand, mt8188 and mt8195 have same ethernet design, so
>>> the
>>> private data "mt8195_gmac_variant" can be resued to reduce
>>> redundant
>>> info in driver.
>>
>> And you do not need new entry in the driver.
> Do you mean that I can use "mediatek,mt8195-gmac" as compatible for
> ethernet in mt8188 DTS file?

Yes, as a fallback. Example schema describes such case.

Best regards,
Krzysztof

