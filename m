Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A4EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 07:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jh5p1uXnfWPr62N57p7ENPPsfNiy8/3PddseIj2vP94=; b=zzDsOUg9UxLWz0
	7Us6R3S7y2STL7HMwM4FPmezfZTEgHwJOJifHRinqp/2LAIlhEkZRlGKy5x0xd5awZ1RuxoaYihhP
	mchqSsZXjg4CD5XOxhlKvCMyosDMU8RCc6wdA+EdEUt8esrWjpxX07FH7h+frC9Cz8idlIVQ3E69A
	E5DTIWUubFC78n0GKVKL/fr0giLMk2dAIn2X8YTpof7OJev58NN24PJBMV1/jAhKnTEJsGnINJWMu
	hOAfKSIQDMdoligXULwQntyD/V9mCJIuS3J4rfHQ0mYd4DdnWOYf7y0qd/QbtyFgeCObQp14lpgtI
	4iiBMqJxN5UbIbjmgD5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxBz-00FOAx-VM; Tue, 01 Mar 2022 07:45:07 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxBZ-00FO2x-Sp; Tue, 01 Mar 2022 07:44:43 +0000
Received: by mail-wr1-x42c.google.com with SMTP id n14so18978095wrq.7;
 Mon, 28 Feb 2022 23:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9N9OiuGebRhfkNZJOLbrZK8yGd1uJ/RwgoMHb8+66t8=;
 b=Bd+fGZjkwpi83khB3kaCW3TE7uA/n0ymRuN9QLFQQG4LrHj5rvdwgc1wEwX1Xxn6sq
 DksXh6oU6CV9jSuMHBZvENgFiZud2pXFODfMSYUY6B24NNYWtSbHdkbY1C1b2koSfK8N
 cWfgc47rnHia0nC6rcp7kmcPM2WaJBcMweTZJ73ldxsU5WkDvzbrwXdejlkplE1RXDrb
 Ko3Ss7B4j3V6l0gIMXvvjcLhgknSGYPU0QV5Rry0O2dIp09EgT16VTg1/HM404dVNBJH
 UGYDpiS8V3stQQI9uPZeejn4KCymYULGHOZDo4EB+H/EsNQxSDITLDXHNHEgD4ct5EnX
 SkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9N9OiuGebRhfkNZJOLbrZK8yGd1uJ/RwgoMHb8+66t8=;
 b=mjeXTN6s6fpM71vkZgCe5cAXTiElYraY7iRxG7PcrT/WXD6v8HRV3L6Nu5C0o0e/GJ
 57K0tPkDg8LwcO7oP0TNCCAFqrgMX75hWABYICUF1MR3niakfRzuLccLlVQ9zhcjTeGT
 LTBjOVDz1LM/2OtB3s3eR2Q/t9WHJBVse12tlHo6erygqdoa3NIscuJEuGAgrtysQI/n
 sGSUnNEY41kjCfsI/md+MAk2yNhC4HfsbYfIP3kIDXLPLmTxZJe4pO3W4VN+LwFXw02G
 FKQ1LL/gICS1+aaJb5RNcJEIXUj/kW/0eDGFir8BogP/XlDBJcnL635/Y6xmeLPOoTNf
 lc0A==
X-Gm-Message-State: AOAM533QstSw7e7os5PKYMch5ub3InXEGoASWDcu6Lma4Mu20hE39w+S
 CEjn2ixoTH1T7439ai9+P3c=
X-Google-Smtp-Source: ABdhPJxBUb5/MBYpZP4ycan/j5lwLp+Y/Q02GVioXh44+q0ranawE0HXM7MhI3mcgC5A8bu7SuyoOw==
X-Received: by 2002:a5d:62c9:0:b0:1ea:940f:d929 with SMTP id
 o9-20020a5d62c9000000b001ea940fd929mr18519621wrv.164.1646120680070; 
 Mon, 28 Feb 2022 23:44:40 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 m34-20020a05600c3b2200b00380e3225af9sm1717859wms.0.2022.02.28.23.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 23:44:39 -0800 (PST)
Message-ID: <ecb43ffc-48ff-97ab-c411-0597f356dd1a@gmail.com>
Date: Tue, 1 Mar 2022 08:44:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 4/4] arm64: dts: mt6358: add mt6358-keys node
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Fabien Parent <fparent@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
 <20220121140323.4080640-5-mkorpershoek@baylibre.com>
 <87v8xps705.fsf@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <87v8xps705.fsf@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_234442_012203_00A91666 
X-CRM114-Status: GOOD (  17.10  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 08/02/2022 16:38, Mattijs Korpershoek wrote:
> Hi Matthias,
> 
> On ven., janv. 21, 2022 at 15:03, Mattijs Korpershoek <mkorpershoek@baylibre.com> wrote:
> 
>> This enables the power,home keys on MediaTek boards with a mt6358 pmic.
>>
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> Since the driver change has been merged [1], can we queue up the DT change?
> Or should I resubmit this separately?
> 
> Thanks

Applied, thanks!

> 
> [1] https://lore.kernel.org/all/YgIE%2F806gDmRJYCn@google.com/
>> ---
>>   arch/arm64/boot/dts/mediatek/mt6358.dtsi | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
>> index 95145076b7e6..98f3b0e0c9f6 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
>> @@ -2,6 +2,7 @@
>>   /*
>>    * Copyright (c) 2020 MediaTek Inc.
>>    */
>> +#include <dt-bindings/input/input.h>
>>   
>>   &pwrap {
>>   	pmic: mt6358 {
>> @@ -357,5 +358,16 @@ mt6358_vsim2_reg: ldo_vsim2 {
>>   		mt6358rtc: mt6358rtc {
>>   			compatible = "mediatek,mt6358-rtc";
>>   		};
>> +
>> +		mt6358keys: mt6358keys {
>> +			compatible = "mediatek,mt6358-keys";
>> +			power {
>> +				linux,keycodes = <KEY_POWER>;
>> +				wakeup-source;
>> +			};
>> +			home {
>> +				linux,keycodes = <KEY_HOME>;
>> +			};
>> +		};
>>   	};
>>   };
>> -- 
>> 2.32.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
