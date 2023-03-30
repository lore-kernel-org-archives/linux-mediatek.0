Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C5CC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 17:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ub/AQVZfAChA/d+KSB5lldfEy26j6LKXVDj7xODNFoM=; b=b/ZNSmf4acojL6ZsH7XKPH2aYp
	m5vNxzsc4xOpLuA+k63OY+87RxC+ELtExWj4KinDDuVtXrFoGK4RaAHb8GllZEPMhKLNNHaa2fIlZ
	szn8PQRFDbInH0VySPV7RlIY2eMeqCPjYCZMEEbgAI3rhzOhDSjcGIyzNkhQWR9JinfAo/vZw3R8b
	ZYAZkHJps1ACHZkscZBhn+WOm12o7HQvpz+Jd+zPOhu2GyGCVn1YK1oFZsFjAha06q1RC08aRmh7g
	v3CmFL0OOKY0oAa85eKhKhpy+7OwJGSH54UszVieM7e+uz0LojyisHG07Kze5fm5+ffFTLOj0vMKy
	hh4/1VlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phvyZ-004cQN-24;
	Thu, 30 Mar 2023 17:22:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phvyW-004cOu-1Y;
	Thu, 30 Mar 2023 17:22:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id t17-20020a05600c451100b003edc906aeeaso3544374wmo.1;
        Thu, 30 Mar 2023 10:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680196929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ub/AQVZfAChA/d+KSB5lldfEy26j6LKXVDj7xODNFoM=;
        b=KLiv+Q7hqzdXpK0fgRBj67KNAUOqJoWJnE1LMeZ8IfLHVgdlV6kLwIuXuxWSDpUWse
         hMHaXiRocH3o8cU6G6DRwHksPLdzpPhjypTQtwojIQ7pwuCp75wpopMCg106el5i2qp0
         bkelgS1rvpqBd7PuNgpPc7o8M1Fl8jy4czasiaq1CLsC0oRxgc194CrnXs3miihYZmaR
         2/7BpBIwHW99VjxF6goFddcsgKc75BjsVAOwYFyGxVE5a3Aj0ytTDFebONzL/Z/FWUb8
         tFQ0Z92vNGSFNvQMT8Ny/BsLElNOtA85GrZ4XV3rqfA68BUKRmXmVlMK5LTLPVhC7axL
         ysHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680196929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ub/AQVZfAChA/d+KSB5lldfEy26j6LKXVDj7xODNFoM=;
        b=svieBQpzBA9Gy+5nsfO/mTc9t/YCXWEwJyL51oH/m2Q2dVTouBQMfCk8MW6t9IP8Mw
         oOahDfCg3HFdIcc6dLHrRX3B1PQKD8BRozbyEMbOyUtj+kpAWcX8WaaXcA90Xc2fLBNO
         PT65RLuW71O5qeOq8vCVwQ9KBfKg1xkTTPcm1A93pWupM6tBleGQcwQKKceaSvG0m5B5
         Nkjyz6On9XU1y6z/RZ9yG9s+vxDhWdUg/8KN7bmWV9gGaQ9VFvJlk/liY5QmppdXuHlY
         Rved8cqD0BSR/FfjwES73bi8vKTnImkity8hVeEfMfPj0l7xZq7pn8zzO+vfbAJdpTZg
         zNiw==
X-Gm-Message-State: AO0yUKUmdSxqZ0goA97/FfgirZrGiLAOaVthfHgXWZmJbdhrhHqBC05T
	MnkzTNwEetD5IRhScJvz5jo=
X-Google-Smtp-Source: AK7set+Z7z1kVsT/1a8sP5GsrmavnXRm3sG7+NJ+W+MACV28utX/L4C5aZ+aBDDLru+8Dt00emmWtA==
X-Received: by 2002:a7b:c381:0:b0:3ed:4627:ed09 with SMTP id s1-20020a7bc381000000b003ed4627ed09mr18130818wmj.28.1680196929078;
        Thu, 30 Mar 2023 10:22:09 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c358600b003ef6708bc1esm7079233wmq.43.2023.03.30.10.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 10:22:07 -0700 (PDT)
Message-ID: <5291a565-acdd-a4aa-9f33-ec6f254a0ab1@gmail.com>
Date: Thu, 30 Mar 2023 19:22:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 05/17] arm64: dts: mediatek: add mt6357 device-tree
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 amergnat@baylibre.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-5-0003e80e0095@baylibre.com>
 <889be563-78d6-7148-f7d2-09ae21383ee4@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <889be563-78d6-7148-f7d2-09ae21383ee4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_102212_520425_F80679C4 
X-CRM114-Status: GOOD (  17.48  )
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



On 29/03/2023 15:17, AngeloGioacchino Del Regno wrote:
> Il 29/03/23 10:54, amergnat@baylibre.com ha scritto:
>> From: Fabien Parent <fparent@baylibre.com>
>>
>> This new device-tree add the regulators, rtc and keys support
>> for the MT6357 PMIC.
>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt6357.dtsi | 282 +++++++++++++++++++++++++++++++
>>   1 file changed, 282 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi 
>> b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
>> new file mode 100644
>> index 000000000000..3330a03c2f74
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
>> @@ -0,0 +1,282 @@
> 
> ..snip..
> 
>> +
>> +        keys {
>> +            compatible = "mediatek,mt6357-keys";
>> +
>> +            key-power {
>> +                linux,keycodes = <KEY_POWER>;
>> +                wakeup-source;
>> +            };
>> +
>> +            key-home {
>> +                linux,keycodes = <KEY_HOME>;
>> +                wakeup-source;
> 
> KEY_HOME is a wakeup-source?! are you sure?!

I think it could make sense to do that, so I just queued the patch. If that was 
an oversight, then please send a follow-up patch.

Regards,
Matthias

> 
> (P.S.: I'm just checking if that was intended)
> 
> Regards,
> Angelo

