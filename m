Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA546C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 16:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbqVM245e6Z56JV4fTQJ7zaDg0Ij9XOsJaiCe7CtwSI=; b=hMmUp52iuxYQEfrQFy41H20gw/
	RXdwJLInjfwXgPnc+xY7rEJkOrjcBebxaAFX4KqTsmTMq4/SEWLghS1a3NNKVq1gv+oiIYjCt86+C
	M6rocKQfq47v7EiCQdoqREZTNPE5ImC3zz70ag+mP8G3PB/ZkiOZ36fzz/Eb1h4M+T8t1AyQfITB0
	b0ZFZIpLrqVD579ZnCd6wjzGeTsTJPFIPBFmnBy6N2Ph7zb2nevVerchxf1MxvfoiE2em3cku/TKM
	UvTsSKvTgNP8r4ObpwU5g+HgQBY+v4olizcEYoSXE3v45ZekzWDdwMQntavco3oX5mwdAXPBBROyb
	PaPh7buQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKMZh-004jqi-Iw; Tue, 24 Jan 2023 16:55:09 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKMZV-004jmZ-15
	for linux-mediatek@lists.infradead.org; Tue, 24 Jan 2023 16:54:58 +0000
Received: by mail-wr1-x435.google.com with SMTP id m7so852994wru.8
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jan 2023 08:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gbqVM245e6Z56JV4fTQJ7zaDg0Ij9XOsJaiCe7CtwSI=;
        b=h9LyvKHpqcEYEPF91dnPtmFsg1Q6w8uYVb2sKT5lMeEyiXpW96z3iumL0u0qM1EwnP
         TaEq0f7B7VcO3hhRz873j1GGvz3+FmJE7ftqI3EmXHTyPfEuscdo1Y0auets+Uzj96fz
         3b8Sfk850eA9XSOcGeLhQMjjUawr2P1mW3DBLH9R9rJ4pR67US94mJFlVXE4lIG/zAQC
         hdKBPYGS6SFhYb4Rk85tG5GsGjSk1qF6y1lf1+5DGuOQoSkYJHQUyz/QL4Di4suWiStE
         iP1ZegoV7hRyoYC6qVqk6YvjC9EnREHXN0x5FmMmoUmlwPp+bUas8Xpu4jXLYakET2/w
         8Psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gbqVM245e6Z56JV4fTQJ7zaDg0Ij9XOsJaiCe7CtwSI=;
        b=aAeGu31YAD5j2r6dlINOo0a/gOefxIs8vr0+mz5BqDj7og+7w3ZEcsR2TaVKZw5iXW
         HBRdsS85p2BbV8B9RLLB8vvE3uNCPi6RsG4qXG54eDx9Jpp/Kl/RnADh3v3MMilCL9y/
         j0+A7l4gaAOi/Bf1wzaZm6Wa1QPiUawK4x43850I6fiNPPaZGvIo+WccYY9xGolZ1ZIe
         6JH3j2kegnmslG0IfPI8TksaT54Y/uWzSO/4hVgn5XzkYzCSOF7J6QdDkZmZYGB3qssq
         iR6ydAm2Tjj2G870Dd2BsftK/N4iCDeoe6sXb1PYi7JqRamTpCRDn8+wRK08euJqQM0b
         rSeA==
X-Gm-Message-State: AFqh2koFdUCVZokSDbdBERHXE5upV5om9rvlWM8oxbWgIrKBBPNTDhvN
	tSSUqfjk7LrOQWpx9XsOI9JmIg==
X-Google-Smtp-Source: AMrXdXvYLP0S2L1TVzYTE/JdyRpc+28HghprLvYQY2mjMLlO48/znsZB/dI8qkE+nkFKCEGaEuUmfQ==
X-Received: by 2002:adf:dd41:0:b0:2be:d9e7:f39a with SMTP id u1-20020adfdd41000000b002bed9e7f39amr12551254wrm.43.1674579294704;
        Tue, 24 Jan 2023 08:54:54 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id g9-20020adff3c9000000b002bfb29d19e4sm1427304wrp.88.2023.01.24.08.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 08:54:54 -0800 (PST)
Message-ID: <9f9547a2-69dd-f91d-c587-289156bf9d55@linaro.org>
Date: Tue, 24 Jan 2023 17:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 4/4] thermal: mediatek: add another get_temp ops for
 thermal sensors
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, linux-pm@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Michael Kao <michael.kao@mediatek.com>,
 linux-kernel@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20221018-up-i350-thermal-bringup-v7-0-ebf08ff2eddb@baylibre.com>
 <20221018-up-i350-thermal-bringup-v7-4-ebf08ff2eddb@baylibre.com>
 <4121bb6b-30db-7a23-f4c8-40afdda7a0b5@linaro.org>
 <COTTJX635TNF.1WL2TEZN7VW9O@amjad-ThinkPad-T490>
 <adfe41f7-00e5-876b-7803-3127919fba13@linaro.org>
 <COUMF3IZ9Y63.LA3KFHJSUZIC@amjad-ThinkPad-T490>
 <0644aede-c281-3919-50e0-4466f6587d81@linaro.org>
 <187b0fe1-1f14-d8b8-c827-1e824da0b1d3@baylibre.com>
 <d3daece0-ed23-fae7-9bc8-c6e53b84e8e7@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <d3daece0-ed23-fae7-9bc8-c6e53b84e8e7@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_085457_094257_093CDFBF 
X-CRM114-Status: GOOD (  17.14  )
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


Hi Amjad,

On 24/01/2023 11:08, Amjad Ouled-Ameur wrote:

[ ... ]

>>>
>>> IIUC, there is a sensor per couple of cores. 1 x 2Bigs, 1 x 2Bigs, 1 
>>> x 4 Little, right ?
>>
>> MT8365 SoC has 4 x A53 CPUs. The SoC has 4 thermal zones per sensor. 
>> Thermal zone 0 corresponds
>>
>> to all 4 x A53 CPUs, the other thermal zones (1, 2 and 3) has nothing 
>> to do with CPUs. The cooling device type
>>
>> used for CPUs is passive. FYI, thermal zones 1, 2 and 3 are present in 
>> the SoC for debug-purpose only, they are not supposed
>>
>> to be used for production.
>>
> After reconsidering the fact that zones 1, 2 and 3 are only used for 
> dev/debug, it might be best to avo >
> aggregation as you suggested, and keep only support for zone 0 in this 
> driver. Thus I suggest I send a V8
> 
> where I keep only below fixes for this patch if that's okay with you:
> 
> - Define "raw_to_mcelsius" function pointer for "struct thermal_bank_cfg".
> 
> - Fix "mtk_thermal" variable in mtk_read_temp().
> 
> - Set "mt->raw_to_mcelsius" in probe().
> 
> 
> For zones 1, 2 and 3 we can later add a different driver specific for 
> dev/debug to probe them to
> 
> avoid confusion.

You can add them in the driver and in the device tree, but just add the 
cooling device for the thermal zone 0.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


