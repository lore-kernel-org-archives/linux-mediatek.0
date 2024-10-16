Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD0ED1AD38
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 09:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMaOQqtMK7dh5z6AqS9oePkZV37kLn6/iI4c+MM8NYw=; b=VOFM+A6YaIkk2bxuLoAjYJlJut
	y7+4mihrQDt1tDkV3XkoYn+oq5e1YtNkVtFnOYb65UQh7ZnD3JmD2wDd8GljC/zT1VbGR9I1Pdm7D
	sON1dOs6scs2txUh+xu/GJeXPrQL1/BzEg7S5erym91iQLxHLx0F2QOErfuN2kMLfzI5aKuqluMSp
	iGWHsm03OSQ+kUdxwlC7ZqMwcebV9XYz/yA7XttjSxF794odIWWhJA6cNliytWK43OBYAVXltKCap
	Ri8IqwwCJGhnQwhALOG6BzTg8lUcKzH8s/CowsCeg05hpDFOTS8ZXT71szpk6+48zKGi0XfkmUpIk
	Pz6Ry/cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t10Ns-0000000BFBs-2vji;
	Wed, 16 Oct 2024 09:32:00 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t10Id-0000000BEAh-0ZBE;
	Wed, 16 Oct 2024 09:26:37 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a9a0cee600aso409883266b.1;
        Wed, 16 Oct 2024 02:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729070793; x=1729675593; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rMaOQqtMK7dh5z6AqS9oePkZV37kLn6/iI4c+MM8NYw=;
        b=B24Vg1UqqJMi+SA5drC6WL+Bq72K9ONNtPj++tyfSyZ/JTj9XwGPDdoGOadmYnljgf
         ssfCa7098Tt0bJ4Upd6DPfWNXRqf5WmZxVmm+hyaYscmoLZ5J6mp7ebmSo0lGVMJnf4E
         wBwNeicWd7uSn/wIy3Bt9GWaggj3OlQ5mPio/45TP+NjPzK800IkwUmTaoo4AntxzY98
         LxR12TfRUSoj78/N6mhCNjRxbM/RGCVvNoSeadb47iyHFTraTZSbz+GjsWFIQ8zXwF2D
         k2dmFDOVZG8xz4Vvsr50R2F3KCeZFWsehwui5ntmL1HyrzbRiEPUBI0R9zOk7SCCnfsv
         40ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070793; x=1729675593;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMaOQqtMK7dh5z6AqS9oePkZV37kLn6/iI4c+MM8NYw=;
        b=QA78olMnCbwfbYcKHgLz7igIlZPOjKGI46Mfwna0LdZP5J4A1mY/Kc9NPhF5NWJaGe
         2JzlfNWF7fYnqDAeu3yegf2VBdxdJ1lCHjs4xa4H77+bBWI+NcYzycFKoJ9+Eo0k2TYH
         XjK1g1Yb+cnTo5sWFzlFChrvfLibrJYdzE/n8CJOQnJS1+sSt7MQ8ab1iK9HA0sLvVif
         y0zcPk15tzXWyDzQvTNOrI4cGNyb8qV4qGQuw/c5n6xKHKEj48dBQYnJwdlxgirur+6e
         FnGUSkJ0n/vOWrZ63YmLmRaJiJkvthe3Lv8FNrcBEDZhuINBQ+TsHoI4GsVn3/R3JUkW
         X5YA==
X-Forwarded-Encrypted: i=1; AJvYcCXFxcYrFfF5T/2LVe7ib7SC18RIKLgkmnV96CYWkLsoOAfHH2axhW9vKxTzDWcdJb14j6AdFA5Dm8CqUgXhfWM=@lists.infradead.org, AJvYcCXoQAz67+L+yF55KH5U92/3ugdxOKnBBNbrflv/ITBR96Vhp5P4yJg9Anl4UgZuCPLdRSMK5m35O1myWl7f+vl9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/iR0ruj6mFLCtTnkyGkZvrpBVMlNEBXKU5f/gePZm09PmqE+1
	RXJ4SV/ZxLlgHmFMuKT767eCtEG+EPBpVoOtzSHqQEpTNp+zvp/gIG7V0Nb5
X-Google-Smtp-Source: AGHT+IHMzxBtdEjtVgLCn4hmoAnv2sE5tdGFWFFOdsQvOO0VupDmPCb8kIWiZ+cHK0TgZ/yPcT5P7A==
X-Received: by 2002:a17:907:3fa0:b0:a99:f9e6:1d0 with SMTP id a640c23a62f3a-a99f9e61f50mr1161706966b.27.1729070792226;
        Wed, 16 Oct 2024 02:26:32 -0700 (PDT)
Received: from [10.34.14.228] ([95.183.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a298170fesm165347266b.142.2024.10.16.02.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 02:26:31 -0700 (PDT)
Message-ID: <f9b09f59-a222-4b75-a6ef-c7fb7c2cff9e@gmail.com>
Date: Wed, 16 Oct 2024 12:26:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
 <20230302124015.75546-3-y.oudjana@protonmail.com>
 <0398e95e-dbb8-2e41-7b36-12e36b8729f0@collabora.com>
Content-Language: en-US
In-Reply-To: <0398e95e-dbb8-2e41-7b36-12e36b8729f0@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_022635_233214_27AEA19E 
X-CRM114-Status: GOOD (  21.62  )
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

On 02/03/2023 6:15 pm, AngeloGioacchino Del Regno wrote:
> Il 02/03/23 13:40, Yassine Oudjana ha scritto:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> Add support for the watchdog timer/top reset generation unit found on 
>> MT6735.
>> Disable WDT_MODE_IRQ_EN in mtk_wdt_restart in order to make TOPRGU assert
>> the SYSRST pin instead of issuing an IRQ. This change may be needed in 
>> other
>> SoCs as well.
>>
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   drivers/watchdog/mtk_wdt.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>> index a9c437598e7e..5a7a7b2b3727 100644
>> --- a/drivers/watchdog/mtk_wdt.c
>> +++ b/drivers/watchdog/mtk_wdt.c
>> @@ -10,6 +10,7 @@
>>    */
>>   #include <dt-bindings/reset/mt2712-resets.h>
>> +#include <dt-bindings/reset/mediatek,mt6735-wdt.h>
>>   #include <dt-bindings/reset/mediatek,mt6795-resets.h>
>>   #include <dt-bindings/reset/mt7986-resets.h>
>>   #include <dt-bindings/reset/mt8183-resets.h>
>> @@ -82,6 +83,10 @@ static const struct mtk_wdt_data mt2712_data = {
>>       .toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
>>   };
>> +static const struct mtk_wdt_data mt6735_data = {
>> +    .toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
>> +};
>> +
>>   static const struct mtk_wdt_data mt6795_data = {
>>       .toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
>>   };
>> @@ -187,9 +192,15 @@ static int mtk_wdt_restart(struct watchdog_device 
>> *wdt_dev,
>>   {
>>       struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>>       void __iomem *wdt_base;
>> +    u32 reg;
>>       wdt_base = mtk_wdt->wdt_base;
>> +    /* Enable reset in order to issue a system reset instead of an 
>> IRQ */
>> +    reg = readl(wdt_base + WDT_MODE);
>> +    reg &= ~WDT_MODE_IRQ_EN;
>> +    writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
> 
> This is unnecessary and already done in mtk_wdt_start().
> If you think you *require* this snippet, you most likely misconfigured the
> devicetree node for your device :-)

Ok so mtk_wdt_start is never called. I'm still not quite sure how the 
watchdog works but it seems to me like it's supposed to be started from 
userspace. I also see some drivers calling it in probe.

Say I don't want to use the watchdog (which I don't, all I need from 
TOPRGU is the resets, I don't care about the watchdog). Not starting the 
watchdog means I can't reset the system because all mtk_wdt_restart will 
do is make TOPRGU send me an IRQ that I have no use for. According to 
the datasheet, setting WDT_MODE_IRQ_EN configures TOPRGU to send an IRQ 
on system reset event (either watchdog timeout or software watchdog 
reset) while clearing it makes it actually issue a system reset. What 
can I do in this case?

