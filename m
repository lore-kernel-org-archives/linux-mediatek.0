Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB51C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 17:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVxoqrhc3yrtGubZ0RHjnJ/hxiODwV3KHU0a9jTWrR8=; b=a8YFqyInt6F9IqiKpn72Qb2zmc
	mjMm2qzMpoYtcZ3ONYe58aFjD/ZMgdDEGQj2Otb/Z5YQ3hn/WW5r4dwfBi327KT0zvISt9F1eP0Ug
	fUq8Y0PNnOpgElduowwaJeNjjafFXZMcpIklHKeIoreyzVBIWY2ESwAtU4T24Kek3fR2cyF9/tY49
	ATJaoAs9bt3Th9NlyUPqnsGA2qKls8ev5Q1EHLeK87K+dH9nYq+b5G2JiPBLHAYHCKZfru6sEvlHu
	Ream5eiRCACg4FqXZDpHe3hYeeINr83uIpyhEN5ccNVtCUBMH/tHT+SMm+8qtP/1DEzz5G996eF+K
	tRtg6tKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phw7C-004e3z-2K;
	Thu, 30 Mar 2023 17:31:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phw75-004e2M-1X;
	Thu, 30 Mar 2023 17:31:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so12312375wms.1;
        Thu, 30 Mar 2023 10:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680197461;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hVxoqrhc3yrtGubZ0RHjnJ/hxiODwV3KHU0a9jTWrR8=;
        b=fJbwrNSH8a/qPjoFa8TTfzC4kyyATGF1Sz673IqjXu8HgDpeMUNr+lyW9bY6JAUGLE
         EId0OhaO/7JG1wZareEy+SxWAjWvLr/cH0w85cZZ698VBJ76M5PYqmuXi+5SZbdFa03h
         LT4WNwKHNta2j511KzE1u3mQ3mV5jaK29QRJMTCaUdnoA5ocXzZMHzTVsKJg8x3RLnoo
         F6frH37WQnAJrkPStf7B7pbvejEcWWoMm0ndnhmHnoiZWuuzOQrTZ4j/IqkUEEHyqVYN
         76/CA0bADuwpIfTDV2DpL20N6EmIRed/h3HMVC/eO4l38NrRpDrslA++UbDKHmzXiixO
         D68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680197461;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hVxoqrhc3yrtGubZ0RHjnJ/hxiODwV3KHU0a9jTWrR8=;
        b=fgHKw1WNVXUKMowRpJI+HSo9Tk7hWUV1Sy//orFcTn++MgsMUERQV26uD8X+IoCKsY
         kETwS5wJrbV2hoTbA1Iag/JCidKHANk2N8xJ61fTUtU6qn1MLtufEt9VcoOAsB3JtRBB
         CTNixZ0k8eeZghEZxv4fYhcNuvHLK9xpmMkVl1yFOOWR7n3l53Jiws5xRbXbC5t/fI51
         G6Lrg8uHrI+rOrRwkyxr7/MQy+wRTEUZwbOEgTUoiA4DmB3p8dnlXdd6VgL/dN6S4UPb
         TyX1E/8vXFE5i55rfwfp3oVAP34SsdMiQCS9fr3wKjsxMchZBA+sUME5dIYGOx9hDs9r
         45/g==
X-Gm-Message-State: AAQBX9e9UqPG554aPKgLewQllfJQlRvZ/LZ0ZlIBCW7Az6l4r/SrPKdN
	P0dzqZEklKMTVcsFVzPzj5A=
X-Google-Smtp-Source: AKy350ZbVWPX16B0VmtNoa+uELKUsvvda6aqmDybw6P4+CSguTo5raie1R2mhEBS+W4lPD3qEOepew==
X-Received: by 2002:a1c:7406:0:b0:3da:2ba4:b97 with SMTP id p6-20020a1c7406000000b003da2ba40b97mr4684708wmc.19.1680197461365;
        Thu, 30 Mar 2023 10:31:01 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id r16-20020a05600c35d000b003ee9f396dcesm6948932wmq.30.2023.03.30.10.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 10:31:00 -0700 (PDT)
Message-ID: <395a1fbf-4d97-930b-5dca-33f14b337837@gmail.com>
Date: Thu, 30 Mar 2023 19:30:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 11/17] arm64: dts: mediatek: add usb controller support
 for mt8365-evk
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
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
 <20230203-evk-board-support-v3-11-0003e80e0095@baylibre.com>
 <5b213d2f-4694-5548-9cce-f01dacda9c84@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <5b213d2f-4694-5548-9cce-f01dacda9c84@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_103103_512856_689F8AA8 
X-CRM114-Status: GOOD (  15.24  )
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



On 29/03/2023 15:26, AngeloGioacchino Del Regno wrote:
> Il 29/03/23 10:54, Alexandre Mergnat ha scritto:
>> This patch add support for SuperSpeed USB, in OTG mode, on micro connector.
>> It also add support for the Extensible Host Controller Interface USB.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts 
>> b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>> index 22ec332fe9c9..868ee0d160e4 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>> @@ -319,6 +319,28 @@ &pwm {
>>       status = "okay";
>>   };
>> +&ssusb {
>> +    pinctrl-0 = <&usb_pins>;
>> +    pinctrl-names = "default";
>> +    maximum-speed = "high-speed";
>> +    usb-role-switch;
>> +    dr_mode = "otg";
>> +    vusb33-supply = <&mt6357_vusb33_reg>;
>> +    status = "okay";
> 
> Order by name please.
> 
> P.S.: status can go at the bottom, even if v < s :-)

You mean v > s ;-)

Yes please reorder keep the status to the bottom that's somehow identical 
throughout the kernel.

Regards,
Matthias

> 
> Thanks,
> Angelo

