Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B77C7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 09:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9FbcJ8ok/dJicjZGixTx1rLY7WoaIvuxCHaDotirU4=; b=BfoGJ/JrBRYcD5iGZX3VphRl13
	LMPh+jNiqmhUJy4ZDAwm7Dxw9mf9OKzCjtsx31F7q+GUrxyj5gBJgxz2zho0UxiUPBg52VnQnGPai
	w4hPR1ZA6QVuDh4b8C+e+MAtVWmoZq2BJkQSjBL82v8e45aWC8iyzWWn6eTg7FphA2QpnAIh8C7wk
	YSyd1jWaIol+TCc7j0dENaxieD+4CROvfulX5L2kgkGWcK2Ih9OvD7Hh9KJdInMJ4WC7i10LKcSlM
	am63HWeX8BNu8juMl6FTh+Dij7wNYswXa5mNpgT/HrAzthre00/za2xVqi73lFE67ANmp5goqLHce
	Qsk2dmiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Tub-001qfz-10;
	Fri, 26 May 2023 09:39:05 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2TuW-001qdM-27
	for linux-mediatek@lists.infradead.org;
	Fri, 26 May 2023 09:39:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f611ccd06eso3732105e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 May 2023 02:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685093935; x=1687685935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c9FbcJ8ok/dJicjZGixTx1rLY7WoaIvuxCHaDotirU4=;
        b=JL9AIH+1JLjqI1bMy4zyAC7GHDy/nihvR99pjHry6l2XVXgzqeSd/O9B6T2oGdIPvA
         VkgZBzOgUU608sykszofbkMZecWAa0HoGE9t5egEInksaJ2dQoLSSbMUQWNa5bwOV1rx
         ohf/QuYu7rZKisOi0K2vsLSoVlPGCAscrZLaxrq3if7gialce24YicNKzQ2ugRFFnmV2
         jbxy7WDzGnpwoxmZmZvtFkTQa2PwwcuXAHHrU9gpVzAaDI2ry12Jwe4qqtx5CeILc0O4
         MSzVeVif0r/3wOiSpEkLOskM81rNKfB4zCaZUeRdYCujEGGmUNjWaRbZrf28KaMAzkc0
         5P0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685093935; x=1687685935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9FbcJ8ok/dJicjZGixTx1rLY7WoaIvuxCHaDotirU4=;
        b=DTgpaHY3gmNtumvPpWRxpz6iYWniyZwwXjBlvHpEUPHxYbcGsgwLCDb9hclAzkaGlD
         ikhs9x9jcwwYO3mlkBsugAO374fIS3WLy//7e1oYljGoxcxMFvGWJjqhapifbUBnkoVr
         tZYm/mHIwatW9QHm2PYSPHp1N9aHHG9yU/SYtoLSNsrghN9Baw2zaBY+bVwRbhs5I2mj
         40cT96KDl3hDbz2PBcPhXMqWUKlme+EJg6rfP0InTBg2dasrBWyWWQT3ailCK2gPampz
         EwjFBy8NjFplNWxm4osAphyZQnwudFVUrLscKA8W03ZYbL7qeX0c0llSmWCRkUNNoDq3
         lH7Q==
X-Gm-Message-State: AC+VfDynYNSUfbcQi3DEJMNAkcBUutajReaV/AQP4WMFWBESWAEMNUmC
	pryYNU/tWAxBrgQXFvQku8S8oA==
X-Google-Smtp-Source: ACHHUZ5Z/uuwFU/rDxZADcj66dYaAGt7iBmpqRVcOw6fAUTz20CCVBeanIlci2qhrpcJchgxcIz/3A==
X-Received: by 2002:a5d:640c:0:b0:30a:6958:456 with SMTP id z12-20020a5d640c000000b0030a69580456mr1091222wru.4.1685093935490;
        Fri, 26 May 2023 02:38:55 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id y15-20020a5d4acf000000b00306299be5a2sm4489937wrs.72.2023.05.26.02.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 02:38:55 -0700 (PDT)
Message-ID: <d2ed4cce-108f-c861-5f84-0c7ac5954346@baylibre.com>
Date: Fri, 26 May 2023 11:38:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] clk: mediatek: mt8365: Fix index issue
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230517-fix-clk-index-v2-0-1b686cefcb7e@baylibre.com>
 <20230517-fix-clk-index-v2-2-1b686cefcb7e@baylibre.com>
 <2a60740f-782d-08d5-f62f-dcc67aaf4d32@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <2a60740f-782d-08d5-f62f-dcc67aaf4d32@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_023900_879631_EBCE3D94 
X-CRM114-Status: GOOD (  22.96  )
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


On 26/05/2023 10:33, AngeloGioacchino Del Regno wrote:
> Il 25/05/23 16:50, Alexandre Mergnat ha scritto:
>> Before the patch [1], the clock probe was done directly in the
>> clk-mt8365 driver. In this probe function, the array which stores the
>> data clocks is sized using the higher defined numbers (*_NR_CLOCK) in
>> the clock lists [2]. Currently, with the patch [1], the specific
>> clk-mt8365 probe function is replaced by the mtk generic one [3], which
>> size the clock data array by adding all the clock descriptor array size
>> provided by the clk-mt8365 driver.
>>
>> Actually, all clock indexes come from the header file [2], that mean, if
>> there are more clock (then more index) in the header file [2] than the
>> number of clock declared in the clock descriptor arrays (which is the
>> case currently), the clock data array will be undersized and then the
>> generic probe function will overflow when it will try to write in
>> "clk_data[CLK_INDEX]". Actually, instead of crashing at boot, the probe
>> function returns an error in the log which looks like:
>> "of_clk_hw_onecell_get: invalid index 135", then this clock isn't
>> enabled.
>>
>> Solve this issue by adding in the driver the missing clocks declared in
>> the header clock file [2].
>>
>> [1]: Commit ffe91cb28f6a ("clk: mediatek: mt8365: Convert to
>>       mtk_clk_simple_{probe,remove}()")
>> [2]: include/dt-bindings/clock/mediatek,mt8365-clk.h
>> [3]: drivers/clk/mediatek/clk-mtk.c
>>
>> Fixes: ffe91cb28f6a ("clk: mediatek: mt8365: Convert to 
>> mtk_clk_simple_{probe,remove}()")
>
> This is not fixing the conversion, but the clock driver, as it 
> originally missed
> clock entries and hence was not compliant with its binding (header).
> It worked before, probably, but this doesn't mean that this driver 
> didn't contain
> a logic mistake from the beginning :-)
>
> So, add (or replace the current one with) the relevant Fixes tag...
>

Briefly and factually, the mt8365 clk probe mechanism was different

compared to the mtk clk driver. Even if it was an issue or not, it was

working (for sure). When [1] improved the mt8365 clk driver by using

the mtk clk generic probe, some clocks (USB here) no longer worked.

So, IMHO, it still a functional regression introduced by [1], because it

come from the switch of the probe function.


I'm not blaming & shaming the author of [1], as you said, it originally

missed clock entries and hence was not compliant with its binding

(whereas other MTK SoC was I guess). This commit is pointed thanks

to the bisect + test.


-- 
Regards,
Alexandre


