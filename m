Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FB4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 11:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzksgh0x+zMbqkL5lOd9iUIZ7M+qRWCpvFKFVhrZ8Dw=; b=koJhPWgaJHWnaGPaVb68wNTXJ5
	wszikYNShD6pPfwTVRPHo2aPfsu8sJqTup7FciS6jh07HAykOGcywfL8ONFdYcWQnUC9fFydxwWWp
	Ekk1e+hNDtnPeuq8d0H5nXn9GTJNAJjoSdkrPI4NBPEbGLjTBKGvmEZJApzAm7DZDelqwDIRYmSvp
	80Q981vM7NoQhRWRXwHy76hOvaaq5zoDXADcMDvK+0SvWSMiw3UqKV0ybsL/vpEnq73uUsClbW3B6
	WzTzXLrWBGWl4glpd2qP7UywydWZLkQamxNCpR6+RAKEG9aTT3m1ULfmUyUOsB5Wa80yZIi0q/v/s
	FERjo7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiD1i-00447P-Sv; Tue, 11 Oct 2022 11:02:22 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiD1Y-00444k-5k; Tue, 11 Oct 2022 11:02:13 +0000
Received: by mail-ed1-x534.google.com with SMTP id s30so19598580eds.1;
        Tue, 11 Oct 2022 04:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nzksgh0x+zMbqkL5lOd9iUIZ7M+qRWCpvFKFVhrZ8Dw=;
        b=Uhop3Sq0002OM4Hjr3ys31jz0FLsKMP+77kfswKwyjTaVh+2P31pQbplzKzlhij/mi
         gqPm0HB1I11ewOvvbVHjMHiAYmqBUuHhvhKiXZMyLlPATRUwHcSoeAhEr+VDF/ah9eT2
         Sf0Ralh1RnYYmTVhWP56Nk3QjB1bU44eoeR3OykD26Samm/YFqtEPOtOy+WbhtH1rWQF
         zvIHEMB231pZjwqcCbAfZvRQtaaR172QWmVvvwdDyNPUOU3kiZ1slLmXpdzil24qKCeK
         +Eh3dq3xpQKSjeF2LfDdtvXMQgdsLltqR3UGVrfTv2qsqzaD/y0GLkaL9Tyj2XhWFuis
         f2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nzksgh0x+zMbqkL5lOd9iUIZ7M+qRWCpvFKFVhrZ8Dw=;
        b=4ooAQ6g8weHXov6gm4rPlvRfIadXH5KNgnnzDY2XsKKAvRWayDVncPWkNpBotnunLK
         1xVa6IzV/xoZfXYjfveHVbUiC1HYah/pYWhwD3rusfI7t8ZqCQnKklVdMl4dvlIC8T73
         nki1Vv2zMQXkXcsJUcJmjYNrPPKUrZCHDIL+HL9e12ikF91h/42BhBTg+Li0iDtUEdzH
         pxollhi6a2SEVMkPao32hlSqNb0TydSihi2ApR7YvYuj/A4wvQ47vRyvnGNSPldA/xNM
         WEIdF1/PzrhO4dTN2Wol6XNZnce+QC7YvA0nVFnddcDbQXEm2serj8ymcxMBAvXowL0U
         Nppg==
X-Gm-Message-State: ACrzQf1ZnH+DmLouRcamBUPwlZtqn3gOnPIN3CQraEFHLnsIjtWLiK4M
	SxuPkUVffqhiNuSFw/7pe9w=
X-Google-Smtp-Source: AMsMyM5EJXVN5zoQgHh4FaQ4dx3WtUOiDD6MKCS0aAGX8ewxL3N97a2u9xNKznKUqkvfmP19dC/Dlg==
X-Received: by 2002:a05:6402:191:b0:45c:83e8:d74a with SMTP id r17-20020a056402019100b0045c83e8d74amr1671165edv.329.1665486128969;
        Tue, 11 Oct 2022 04:02:08 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id v2-20020a170906292200b0077086d2db8esm6873717ejd.140.2022.10.11.04.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 04:02:08 -0700 (PDT)
Message-ID: <cc1d1b63-4ee6-68cf-a175-401239539e18@gmail.com>
Date: Tue, 11 Oct 2022 13:02:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v14 3/3] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 ChiaEn Wu <peterwu.pub@gmail.com>, pavel@ucw.cz, matthias.bgg@gmail.com,
 jic23@kernel.org, lars@metafoo.de, andriy.shevchenko@linux.intel.com
Cc: chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, szunichen@gmail.com
References: <cover.1665488982.git.chiaen_wu@richtek.com>
 <657f73ae257925ebc68dc825998384ad79d31e1f.1665488982.git.chiaen_wu@richtek.com>
 <68ab0f05-e74a-e091-0109-09b57b90c652@collabora.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <68ab0f05-e74a-e091-0109-09b57b90c652@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_040212_235697_686C6ED2 
X-CRM114-Status: GOOD (  23.31  )
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

On 10/11/22 11:52, AngeloGioacchino Del Regno wrote:
> Il 11/10/22 06:05, ChiaEn Wu ha scritto:
>> From: Alice Chen <alice_chen@richtek.com>
>>
>> The MediaTek MT6370 is a highly-integrated smart power management IC,
>> which includes a single cell Li-Ion/Li-Polymer switching battery
>> charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
>> LED current sources, a RGB LED driver, a backlight WLED driver,
>> a display bias driver and a general LDO for portable devices.
>>
>> Add support for the MT6370 Flash LED driver. Flash LED in MT6370
>> has 2 channels and support torch/strobe mode.
>>
>> Signed-off-by: Alice Chen <alice_chen@richtek.com>
>> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
>> ---
>>
>> v14
>> - Remove unused 'depend on OF' in Kconfig
>> ---
>>   drivers/leds/flash/Kconfig             |  14 +
>>   drivers/leds/flash/Makefile            |   1 +
>>   drivers/leds/flash/leds-mt6370-flash.c | 631 
>> +++++++++++++++++++++++++++++++++
>>   3 files changed, 646 insertions(+)
>>   create mode 100644 drivers/leds/flash/leds-mt6370-flash.c
>>
>> diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
>> index d3eb689..0dd955c 100644
>> --- a/drivers/leds/flash/Kconfig
>> +++ b/drivers/leds/flash/Kconfig
>> @@ -61,6 +61,20 @@ config LEDS_MT6360
>>         Independent current sources supply for each flash LED support 
>> torch
>>         and strobe mode.
>> +config LEDS_MT6370_FLASH
>> +    tristate "Flash LED Support for MediaTek MT6370 PMIC"
>> +    depends on LEDS_CLASS
>> +    depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
> 
> This dependency makes no sense, as the options in the Kconfig you're 
> putting
> this into gets parsed only `if LEDS_CLASS_FLASH`.
> Please remove that.

So the Kconfig is buggy. Someone didn't take into account
`config LEDS_MT6360` requirements when moving drivers to the
flash subdirectory.

> 
>> +    depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> 
> Well, if it depends on that being either y, m or n, it means that it does
> not depend on that at all. Remove.

I disagree. It makes a lot of sense.
This syntax allows creating correct dependencies by depmod for both
cases when V4L2_FLASH_LED_CLASS is enabled or not, since the driver
can work in both cases.

> 
> After which,
> Reviewed-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>
> 
>> +    depends on MFD_MT6370
>> +    help
>> +      Support 2 channels and torch/strobe mode.
>> +      Say Y here to enable support for
>> +      MT6370_FLASH_LED device.
>> +
>> +      This driver can also be built as a module. If so, the module
>> +      will be called "leds-mt6370-flash".
>> +
>>   config LEDS_RT4505
>>       tristate "LED support for RT4505 flashlight controller"
>>       depends on I2C && OF
> 
-- 
Best regards,
Jacek Anaszewski

