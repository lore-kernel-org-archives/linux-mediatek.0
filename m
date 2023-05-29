Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E533EC7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0Rq7Kdt+FXMB2JN2FXvVxRrTv3nqYTFy/3wNrpRfJs=; b=KbdenuP99S8b2a8BDhXvezR64Z
	r97szdK2SaoxQ3R6ZIfk74O71PtrDCdD9VnIMMCR+eIt5GChCzKNP/MxIcQxoZ3Xddqw0zsKtiC3C
	pdXDe8B/SfMNs0kizUS8QsiuoOKP+gAqOBH5c/2r8lBrjmoAldefjGARgKQh+zuhzMN1hhgV5BoBE
	2j/L7vq7ZKw74CIZsYBOX13tQ0GjPNNm+niIzPmoMwVvQtoXhNl1IBpzv+BRkYb7UZ18Vaa1hSUNF
	3yRvVOieVdYeBrg0vS52OyarwTr9W1kYF54eip/meyS+mAtn7zDMiDfYOqs4XGZi9cnq9OaXxQNkc
	eU0UcTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fOq-00B39l-0u;
	Mon, 29 May 2023 16:07:12 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fOn-00B38f-2J;
	Mon, 29 May 2023 16:07:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-30789a4c537so2031672f8f.0;
        Mon, 29 May 2023 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685376428; x=1687968428;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0Rq7Kdt+FXMB2JN2FXvVxRrTv3nqYTFy/3wNrpRfJs=;
        b=YxuHKkvBdLGTLf3EO/LC+KYTauVGEsOAQ+PYdCWH6ZWv08mjoQDAitkZOivGOYR7kI
         fJsZt7OQEzN5Gk7Fte8yBy5VMClPkL3e5QGobEkM17KSpO3W7BdbREgYbcNnVAUbaxsu
         hVn4/TnuIcaFUXNedBCBABV5wEEURxRaLWOL5X1V+0/Dr5jiUpTc8+7+PMBCqluX6yOc
         a0o4nns376cJMATR40eqOmc/ScjUCsfDmr7IQYuERbvdseQdoeUlQpqEl2JIXq8vBTj5
         mrHNJwnAAqbg7C6XP83NOLinltqXxoXS63xODhZ0JTDqDAYuA+pQau4MmNgyIjQLThFf
         NrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685376428; x=1687968428;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0Rq7Kdt+FXMB2JN2FXvVxRrTv3nqYTFy/3wNrpRfJs=;
        b=k0NP4ND3kYf3WfnH8bgtPD55nfePPE2p/0jBQyYyhGHVdaXQWgA2CdgL1DUOiU0r3f
         luzzddvwJRgJc81CLhFe6TdpvIgVLYRne4r3MaAk5VJxm6VYRl32mXCsyu6nBUuq3mG9
         dwx998cZS0HV/E7NqiQKWINijfjLFB1lNAp5xXNnSRE/1b8Uu/t3zhV3bTdtTKHl8+j7
         dawEObFuKA54W3M9KYFA7O02Dq7jqK+ps+X0B0CuBh6OVuoZnk50SpfTkmZajV46r8Oq
         9bg53aC4Y+SEh0vLrDY26DTBqADxLv4Z1GffMwSAViOXf4myy77CNNEmg+3k/+hW8Zee
         95bg==
X-Gm-Message-State: AC+VfDyp44kF8hDjPmH7OVH98yAY+oysgVzECKfeX9g9KbsFPUY/zCXb
	PCvMdLffd752hblEQSZskiY=
X-Google-Smtp-Source: ACHHUZ6Sf1QKdF5Zj9s2dDaTja5Wwp1KRz+78nxr/peoDGaDbgftVGZpAFwrZtWWnB0F2hcoA7k2vw==
X-Received: by 2002:adf:f045:0:b0:30a:de1b:93e5 with SMTP id t5-20020adff045000000b0030ade1b93e5mr7871567wro.52.1685376428032;
        Mon, 29 May 2023 09:07:08 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d490b000000b003063a92bbf5sm374441wrq.70.2023.05.29.09.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 09:07:06 -0700 (PDT)
Message-ID: <09f04ff7-50ae-6e36-2b41-21dae04415ad@gmail.com>
Date: Mon, 29 May 2023 18:07:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Aw: Re: [PATCH] arm64: dts: mt7986: set Wifi Leds low-active for
 BPI-R3
Content-Language: en-US, ca-ES, es-ES
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230205174833.107050-1-linux@fw-web.de>
 <8f04f2b5-320e-50d4-9517-6dac989f63b3@gmail.com>
 <3a43ce55-ff6a-0cd2-b020-d5fefe8aca0a@collabora.com>
 <trinity-8c109262-658a-4a4e-a807-1cd8f640fdc4-1684743994291@3c-app-gmx-bs66>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <trinity-8c109262-658a-4a4e-a807-1cd8f640fdc4-1684743994291@3c-app-gmx-bs66>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_090709_759767_9EFE189C 
X-CRM114-Status: GOOD (  13.97  )
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



On 22/05/2023 10:26, Frank Wunderlich wrote:
>> Gesendet: Dienstag, 07. Februar 2023 um 17:17 Uhr
>> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
>> Il 06/02/23 21:20, Matthias Brugger ha scritto:
>>>
>>>
>>> On 05/02/2023 18:48, Frank Wunderlich wrote:
>>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>>
>>>> Leds for Wifi are low-active, so add property to devicetree.
>>>>
>>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>>> ---
>>>>    arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
>>>> b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
>>>> index 33bd6febc160..2b028141f1f7 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
>>>> @@ -446,5 +446,9 @@ &wifi {
>>>>        pinctrl-names = "default", "dbdc";
>>>>        pinctrl-0 = <&wf_2g_5g_pins>, <&wf_led_pins>;
>>>>        pinctrl-1 = <&wf_dbdc_pins>, <&wf_led_pins>;
>>>> +
>>>> +    led {
>>>> +        led-active-low;
>>>> +    };
>>>
>>> The binding is missing this property also the driver implements it. Could you
>>> please update the bindind description properly?
>>> Thanks
>>> Matthias
>>
>>
>> After and only after [1] is picked,
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> [1]:
>> https://patchwork.kernel.org/project/linux-mediatek/patch/20230207133504.21826-1-linux@fw-web.de/
> 
> Hi Matthias,
> 
> Can you take this patch into your tree? binding is already merged
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml#n114
> 

Applied now :)

Regards,
Matthias

