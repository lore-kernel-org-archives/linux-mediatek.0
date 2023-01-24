Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA34C25B4E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 17:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdCDxw9M+4W0xFySyeUJf90dqwb2v7zc2Ewn7qbXfQc=; b=WXtRH+oae7e0yayAD+Ru4+ipJs
	mnh1G3jSe65r3tQdV0uAMH6glVzq5sghTAQFTmODS5tMN1dstRO6uH7KoiH2CW+jfFgy1Ng1Vz2qr
	QNTNN/3guwQK69QPbu9YcAxuMLHLHfIgRmo5HvaM8tBglemPG/HJrkr6sqeRDtElzWmdvFmUvm6od
	/j20OKgP6t1rxVF6pbpr4hPzi/7F81mUNim82w6lRzxm9Jk9+MXnTJjuu3mKYYwYvq8x+nYK5nJRI
	+BUTbsXmpixHTrsN448dqllMiZrzS8EI/lTJIEvVnaKt4xYQvYzopqNGAXnU6Em+Oq/FbnLez96dU
	L0yAE76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKNWA-004tat-0C; Tue, 24 Jan 2023 17:55:34 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKNVz-004tYg-Fe
	for linux-mediatek@lists.infradead.org; Tue, 24 Jan 2023 17:55:25 +0000
Received: by mail-wm1-x332.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so11585349wmq.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jan 2023 09:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YdCDxw9M+4W0xFySyeUJf90dqwb2v7zc2Ewn7qbXfQc=;
        b=nTV6D3WxyzREC9gAUBj88qhd6dsVubBwo+bua+KcqQsi8SCAXCmgRE6bDc1Z2+f7Zd
         SIqicVlq3EwfcpB94fJJFj6QTA4hpd2Jcoo2bM5rPUKJ2JrJ+83qH2mdkkn9KgF1lZxV
         Miqwkx3iUyDPH4bXFO+pJsYQOYHvoXkXxiBOhUVnFUtPhcwNkIS/EipwFcSUN19P849A
         E5XbPyCcrW+5BMoY4L+mXW63eC1PyK6cSUb/yo+MrU3IXz9+NidcsaJXDRnnXpssnlUr
         e2ojOuSj3BuTojAhZoql+/SptDHxKhkCeUhrfMghNpytbFbqrMLWs14AzMkYTxtig9Ux
         Q3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YdCDxw9M+4W0xFySyeUJf90dqwb2v7zc2Ewn7qbXfQc=;
        b=cHSOvTIy/ASi+0DZLHGI1dF3oLzzRC9iBearK8RjFyKYu2v7AWSTJJAgKZRQ2t/0Ms
         7+OYDlIsQ0OOz42KgMCzvfaACu8uAqi6HCuy0HdHDAqmLx2R8CAhcvQFte1II6EoRET6
         +KXtmrxItl6zUTayRvpZOPe7w3d+SH8O2jdhaAof/hF2H0IYHVuEPpxCmqD1AO5yhSu6
         e/ANnN1X1OlmW9sZzg5Uy6uKnbRSjCXwMK8bPJ4VLjkSjECVTR46GbRR+jA0+c0uRzpU
         pDElTV7ilsAEeQcDnJ4M9ToZKMZl6D1YGo6G7FXnVjdgQFZGeerNITQiph0Fb3RK+Nli
         10pg==
X-Gm-Message-State: AFqh2krmRE39lMONlTrUIHp/pJW+veA/36l9ZC2Bp+iw+KPHmTUQg7Zc
	Xl9t4WaErqi5xu0vXrK89wM0lg==
X-Google-Smtp-Source: AMrXdXu5BjwW7IFLRR4MJylMvG6n0IIZ5Qgl14oQlDbA4IA8jBRxv1Dcpy/srHrBN7IZmO+kRvOodw==
X-Received: by 2002:a05:600c:600e:b0:3c6:e62e:2e74 with SMTP id az14-20020a05600c600e00b003c6e62e2e74mr25728996wmb.15.1674582921045;
        Tue, 24 Jan 2023 09:55:21 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id f14-20020a05600c154e00b003daff80f16esm19579059wmg.27.2023.01.24.09.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 09:55:20 -0800 (PST)
Message-ID: <c1fad818-1858-2e81-84fd-03cfb54d8938@linaro.org>
Date: Tue, 24 Jan 2023 18:55:18 +0100
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
 <9f9547a2-69dd-f91d-c587-289156bf9d55@linaro.org>
 <2950b824-ad2f-2579-a956-a03d157453eb@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <2950b824-ad2f-2579-a956-a03d157453eb@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_095523_565619_3911568B 
X-CRM114-Status: GOOD (  16.95  )
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

On 24/01/2023 18:46, Amjad Ouled-Ameur wrote:
> 
> On 1/24/23 17:54, Daniel Lezcano wrote:
>>
>> Hi Amjad,
>>
>> On 24/01/2023 11:08, Amjad Ouled-Ameur wrote:
>>
>> [ ... ]
>>
>>>>>
>>>>> IIUC, there is a sensor per couple of cores. 1 x 2Bigs, 1 x 2Bigs, 
>>>>> 1 x 4 Little, right ?
>>>>
>>>> MT8365 SoC has 4 x A53 CPUs. The SoC has 4 thermal zones per sensor. 
>>>> Thermal zone 0 corresponds
>>>>
>>>> to all 4 x A53 CPUs, the other thermal zones (1, 2 and 3) has 
>>>> nothing to do with CPUs. The cooling device type
>>>>
>>>> used for CPUs is passive. FYI, thermal zones 1, 2 and 3 are present 
>>>> in the SoC for debug-purpose only, they are not supposed
>>>>
>>>> to be used for production.
>>>>
>>> After reconsidering the fact that zones 1, 2 and 3 are only used for 
>>> dev/debug, it might be best to avo >
>>> aggregation as you suggested, and keep only support for zone 0 in 
>>> this driver. Thus I suggest I send a V8
>>>
>>> where I keep only below fixes for this patch if that's okay with you:
>>>
>>> - Define "raw_to_mcelsius" function pointer for "struct 
>>> thermal_bank_cfg".
>>>
>>> - Fix "mtk_thermal" variable in mtk_read_temp().
>>>
>>> - Set "mt->raw_to_mcelsius" in probe().
>>>
>>>
>>> For zones 1, 2 and 3 we can later add a different driver specific for 
>>> dev/debug to probe them to
>>>
>>> avoid confusion.
>>
>> You can add them in the driver and in the device tree, but just add 
>> the cooling device for the thermal zone 0.
> 
> Thermal zone 0 uses CPU{0..3} for passive cooling, in this case we 
> should register cooling device with
> 
> cpufreq_cooling_register() for each CPU right ?

No, the OF code device tree does already that. You just have to register 
the different thermal zones.

Do you have a pointer to a device tree for this board and the thermal 
setup ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


