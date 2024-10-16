Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DFBD1AD53
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 12:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jw/zthgp3ghBqEnsSRpEt2u1kq8lfx5zFQFEXf/umW4=; b=gPVNXPaGeoJY6BjSjF2BPJXwf0
	L9pF2YUZi8ZdU0trK2iHcscrEOGk9TH88j111noe3aPq2rxRa/eBI534ZzR+9blpCdpqa7k5vhCZO
	HUlYznjmxWWAolRNWqsYGypkj1KsRlrrFMu6UjKX2jW4B0jsrDz9fL5ldQSwhG7C2P0Cxgq+6pSp0
	hDA9cIeVK2RowmrJFZ3VpZzEXLMO/UnrV5wX0gtAY9IjcMIgLUjW214yRZ+o1fRPAv3LJkYgnbqpo
	m9eBvZwgsab9z0oI0+dsboKTnzp0/DtqmO1SmEdFZdINH5mZbdU/ktzX466/eraSkxvMBOj2sZBx0
	VoJGntpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t13cn-0000000Bqq8-11Jw;
	Wed, 16 Oct 2024 12:59:37 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t13Uw-0000000BowU-0Fcg;
	Wed, 16 Oct 2024 12:51:31 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71e625b00bcso2562148b3a.3;
        Wed, 16 Oct 2024 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729083088; x=1729687888; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw/zthgp3ghBqEnsSRpEt2u1kq8lfx5zFQFEXf/umW4=;
        b=XO7nc2RhGobA5d0Sa91AKhp8516FYqJulBL1IeqWjGntM9KY+FOjdGWPBjZBPsxiKn
         A7mKIwnGE321OLy9kxVcBkP4yJfr90dhu5gFqJI6szMn9oR1pW6JZPZsA1v5DONxUBH3
         pEw/WVzvBg/L0N2c6lU0ux7Rryc6ElI1Hduxgl09qFRXE05tSyOPw5JKXy+DlaS9Xd8+
         6nBH08rZ4IRUla4phXSmjMvziZKTNtG1X6hrKX4V8ElqrygnsBo4ciXx31LTQlog7gEc
         tGo4Jq1TpjV+8i42/lgkJzOFAjOT2eFh0dFXrc7NuA51DuhnBcQI7PpSqfmUYsEsMY7J
         iAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729083088; x=1729687888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jw/zthgp3ghBqEnsSRpEt2u1kq8lfx5zFQFEXf/umW4=;
        b=Za6ZxrDm03iTC2/KlshuQPFluRL0qXo1TtnHtxYRlTkEVyVWJxGf3p77okV8aTi9Dg
         jFq5zwyOvTSq7Pbw0u1PzpCtlSTgcHsgZr1jbuZOzHYqx/92srEqlI9RGU1c89NP7GFD
         hr1X3XlkMZC1o6lJmA73OEmmVnAi2v/y51vT/Ij/mELIeYUCrSVrII1ePa6J7R9rGHsZ
         vCr3dxMIBxYr9Pe0KWWcgEa0eVneNjYUBmUuJLJObmunVd1Yor6uE7Kg37w3A5qGmzzJ
         yLyQNTnudZ5ysKTPDVPikuWBuL7VM8dvrv63PRBeLOn9BQRoX0I78LrYiQj+hd4+jsEC
         pH/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/PPgOCD1rK5sXcBjae9nErpBDxczE0klfrQK1aaJZ7J0PHdwEt/gWu6Bvmy2Pgp1vmQlaYinDcFFhDEJSFJ8=@lists.infradead.org, AJvYcCVHE5QAi4QqsDJu+xPkHi5amEelpmzwAC3Rj8SzIwB8W/bD4zeHAzg2yBgjQ+0nito9I0o2l81+kqaoYijW1GFs@lists.infradead.org
X-Gm-Message-State: AOJu0YygYhYb8xQc+FGgevLqBdwcoKSyyumdwPlFt3UV+HIWWcb0pNzU
	AMWWk7QlX5dJh25EvGuQdvFtZqxhV/otHLI9ScrDY3DSV3U/bOds
X-Google-Smtp-Source: AGHT+IE2WDEUri/0niQPSHTzuGoKqevEw+vQH/+KYN2UGRl4RxmXw2NIdVtd6cMybX5jSMSn8Pnzlw==
X-Received: by 2002:a05:6a00:c90:b0:71e:7e8e:f684 with SMTP id d2e1a72fcca58-71e7e8ef71dmr4415283b3a.9.1729083088017;
        Wed, 16 Oct 2024 05:51:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e774a41a2sm2970341b3a.124.2024.10.16.05.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 05:51:27 -0700 (PDT)
Message-ID: <7b0d5ea4-b3a2-40f2-8762-5a828c2dc485@roeck-us.net>
Date: Wed, 16 Oct 2024 05:51:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
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
 <f9b09f59-a222-4b75-a6ef-c7fb7c2cff9e@gmail.com>
 <9bd327fb-5f67-453d-947d-4742134b32b1@collabora.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <9bd327fb-5f67-453d-947d-4742134b32b1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_055130_123963_9422828C 
X-CRM114-Status: GOOD (  17.02  )
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

On 10/16/24 02:56, AngeloGioacchino Del Regno wrote:
> Il 16/10/24 11:26, Yassine Oudjana ha scritto:
>> On 02/03/2023 6:15 pm, AngeloGioacchino Del Regno wrote:
>>> Il 02/03/23 13:40, Yassine Oudjana ha scritto:
>>>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>>>
>>>> Add support for the watchdog timer/top reset generation unit found on MT6735.
>>>> Disable WDT_MODE_IRQ_EN in mtk_wdt_restart in order to make TOPRGU assert
>>>> the SYSRST pin instead of issuing an IRQ. This change may be needed in other
>>>> SoCs as well.
>>>>
>>>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>>> ---
>>>>   drivers/watchdog/mtk_wdt.c | 12 ++++++++++++
>>>>   1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>>>> index a9c437598e7e..5a7a7b2b3727 100644
>>>> --- a/drivers/watchdog/mtk_wdt.c
>>>> +++ b/drivers/watchdog/mtk_wdt.c
>>>> @@ -10,6 +10,7 @@
>>>>    */
>>>>   #include <dt-bindings/reset/mt2712-resets.h>
>>>> +#include <dt-bindings/reset/mediatek,mt6735-wdt.h>
>>>>   #include <dt-bindings/reset/mediatek,mt6795-resets.h>
>>>>   #include <dt-bindings/reset/mt7986-resets.h>
>>>>   #include <dt-bindings/reset/mt8183-resets.h>
>>>> @@ -82,6 +83,10 @@ static const struct mtk_wdt_data mt2712_data = {
>>>>       .toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
>>>>   };
>>>> +static const struct mtk_wdt_data mt6735_data = {
>>>> +    .toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
>>>> +};
>>>> +
>>>>   static const struct mtk_wdt_data mt6795_data = {
>>>>       .toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
>>>>   };
>>>> @@ -187,9 +192,15 @@ static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
>>>>   {
>>>>       struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>>>>       void __iomem *wdt_base;
>>>> +    u32 reg;
>>>>       wdt_base = mtk_wdt->wdt_base;
>>>> +    /* Enable reset in order to issue a system reset instead of an IRQ */
>>>> +    reg = readl(wdt_base + WDT_MODE);
>>>> +    reg &= ~WDT_MODE_IRQ_EN;
>>>> +    writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
>>>
>>> This is unnecessary and already done in mtk_wdt_start().
>>> If you think you *require* this snippet, you most likely misconfigured the
>>> devicetree node for your device :-)
>>
>> Ok so mtk_wdt_start is never called.
> 
> mtk_wdt_init() says
> 
>      if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN) {
>          set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
>          mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
>      }
> 
> Your bootloader starts the watchdog. This driver will set WDOG_HW_RUNNING and
> will hence prevent calling the .start() callback - that's why.
> 

FWIW, if the bootloader _doesn't_ start the watchdog, and the watchdog device
is never opened, the restart handler has to start the watchdog.

Guenter


