Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74951C38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 10:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwSavTNmt/iSOWToRrOQRo5WI793hfeDOFSkH2AVIz4=; b=wSyyoSkQa6iiGw+sTgfrhC2Hj2
	iF4DBSrv5vSrMWVzWEbWJ2k3Gx2LroWGakhUVCxi4ibG3dpa0Tc3fscH+esExb8goTOvGSZ6b5r1w
	aa7xh0drCsJuYd48fxede+mO5VWZtAZxNvx/+BzpWnSyrWhHGaF33TV/rfAD7BdbfTvHh2s8vk//j
	c9im7DvCIapCV+ypfQ7fgLbX+vozuk5xskeAaM3o3QL8BoqCC7gMIA2VcRcwS9ZnpW59dNHboO3Sw
	xM1o+mrJpygbhZA1b9l1KeS0uYSWDG0UlScKEpHxnJ1iaNtHMatL98Manz09tH7sVtNjGAeFzfVZT
	YhkA4gFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLMK2-00E0d4-7y; Fri, 27 Jan 2023 10:51:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLMJo-00E0Yb-KN
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 10:50:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so5129471wma.1
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 02:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HwSavTNmt/iSOWToRrOQRo5WI793hfeDOFSkH2AVIz4=;
        b=A7BuikDUFnrnOkNs916iNPhILrb7gliAt6eo8nRlWdME4PTFbBNJ3aDOqDnwIpTSQY
         z+ZyqKx+O38L99+8VzZAlfgVTtrnUCLP/vaPuao/SMaJ56swbuQ6u+VZtqaWWEG43Ijz
         wmiZGAY709vdHZo8FQ93iJK2M+ufm4iWJpqORKO1M2lTSxr1WZsYvkxma4YcMImOs4+b
         +WI/iNo6Q+eh8PTJoLcmt/nCleaqD2a3qLuO/N+CTFbqR+leiQvT6XlPxid/f+GpBWVO
         h4ou/aUEIfE8mMENFwYH5dvwhuAQYfslY4qUYpiIyS/xbHQSc/53tiLa8V1MfpXgFurJ
         vuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HwSavTNmt/iSOWToRrOQRo5WI793hfeDOFSkH2AVIz4=;
        b=wC3DDc7zqMssHGPOtCciURtjm1wj5QFKWwv709S6Gh6CFovy+oI/S14vXBRKckdBtg
         WVMmzAIVYjWkDGIdNlSRfHgP3TO/vWskJnQd0W3ohuH4xw6mkGw190UlI0v+NNzV95Cm
         FgN+JiaNoLReDRW5rn8O6PToxqNPQHJoFrvRT3urZDXz17i9zqAxgE2yMVE7w+nUhaKD
         yJ8/CKX0YouJxra+/FCNhousCom0ijVpGE1+1yKBiVwPFb5ECWErAzr7GuedG44PajdV
         KC4BydLEcwBtUXiJRKkTi2MMYmvUWtXr9xVTYG+NNdrzsHXc68ky35iRHSKAQnTL3zN2
         5d9Q==
X-Gm-Message-State: AFqh2kp59fLfNv2bhfWXpoAkMgsfgGTw6/IWNLLcYk3fgCS2Uf907asz
	U2EFJ5ypdwo85BH51KbjQKJ2zQ==
X-Google-Smtp-Source: AMrXdXvW1bSIjLK7Tu0+rEdSDxo9z/Df4JT/zK4JmYVf4bN2G5mcNCKaqFahL8xtSz0ogBFXfk+JDw==
X-Received: by 2002:a05:600c:4b9a:b0:3da:fcdc:cafd with SMTP id e26-20020a05600c4b9a00b003dafcdccafdmr38636963wmp.13.1674816648946;
        Fri, 27 Jan 2023 02:50:48 -0800 (PST)
Received: from [192.168.0.20] (62.213.132.195.rev.sfr.net. [195.132.213.62])
        by smtp.gmail.com with ESMTPSA id u12-20020a05600c19cc00b003db0ee277b2sm8128445wmq.5.2023.01.27.02.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 02:50:47 -0800 (PST)
Message-ID: <9b5911ec-9993-5540-6de5-c62c7c446274@baylibre.com>
Date: Fri, 27 Jan 2023 11:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v8 5/5] thermal: mediatek: try again if first temp read is
 bogus
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Michael Kao <michael.kao@mediatek.com>
References: <20221018-up-i350-thermal-bringup-v8-0-23e8fbb08837@baylibre.com>
 <20221018-up-i350-thermal-bringup-v8-5-23e8fbb08837@baylibre.com>
 <96e7aaf5-76ef-9356-84e2-ee1f747dafcd@linaro.org>
Content-Language: en-US
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <96e7aaf5-76ef-9356-84e2-ee1f747dafcd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_025052_674736_B06625FD 
X-CRM114-Status: GOOD (  17.83  )
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

Hi Daniel,

On 1/25/23 11:58, Daniel Lezcano wrote:
> On 25/01/2023 10:50, Amjad Ouled-Ameur wrote:
>> In mtk_thermal_bank_temperature, return -EAGAIN instead of 0
>> on the first read of sensor that often are bogus values.
>>
>> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/thermal/mtk_thermal.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
>> index b8e06f6c7c42..e7be450cd40a 100644
>> --- a/drivers/thermal/mtk_thermal.c
>> +++ b/drivers/thermal/mtk_thermal.c
>> @@ -736,7 +736,7 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>>            * not immediately shut down.
>>            */
>>           if (temp > 200000)
>> -            temp = 0;
>> +            temp = -EAGAIN;
>
> Did you try to add a delay between the bank init and the thermal zone device register (eg. 1ms) ?
>
> May be the HW did not have time to initialize and capture a temperature before thermal_zone_device_register() is called (this one calls get_temp) ?

A delay of 29 ms actually fixed the issue, thanks for the suggestion. I can send a V9 with this improvement.

Is there anything else to fix perhaps ?


Regards,

Amjad

>
>>           if (temp > max)
>>               max = temp;
>>
>

