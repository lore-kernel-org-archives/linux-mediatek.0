Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BBDC77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7g5hV3NWDVn1/V7aQRt4oQ8CBf16T6HKdjwb2x5bdk=; b=FbfLXW+lAzeojDRuYItAUxOuv6
	exH7HAL3xbW/Xu0ipspSLZWyp/NiQBfRfvS3kdIT4/ImzDfTjMyxiFpXHPlERyrVMpzME8V9SZUKX
	9W05tls7E2FHapfXW9ydj//5xErMmt6qlhIk8U+J8ybpNx0WsKqD7Aaj5As/k8lEg68XW2mStjVkD
	9pvR+s++3qnVGZkPX+KZBYd+QyuInLkDCOpbh3g+XMJJ2GiAG94EVbJwnp39/h0FVYNmuNDtCzxow
	4m4qb6CZnhppQBIaVDvfL6IIyXUh3agyCj8CYov59r522yy1B596/oHTceJGpGOd+58sugqusSwpY
	nDuuBQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsnK-005URi-0H;
	Thu, 13 Apr 2023 08:59:06 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsnH-005UQr-2Y;
	Thu, 13 Apr 2023 08:59:05 +0000
Received: by mail-wr1-x433.google.com with SMTP id v27so4243840wra.13;
        Thu, 13 Apr 2023 01:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681376340; x=1683968340;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7g5hV3NWDVn1/V7aQRt4oQ8CBf16T6HKdjwb2x5bdk=;
        b=dBQhg5EbOvayR7mx31g2Jml4oYq5/XXxJlntstydhf4l7HpHShRVId/butsUy55+3P
         EsfmjNNOvORzCCy9QrCrhfQ+NTZ2L3YPpyILbRZZh4Z0DC80Bk+ylhxVs+zuIVYeiEk6
         WMSrTGlcRp94aMhIDPa9q1PpS6Fdk/5/eCF820KZyQ0No/UnjIG0HBi/m1RC4M68XKHy
         XeOSWDFKffbUpGzlPRgMTgi2c9AkCSK5nQdePDFLEjMBVDR0WcU73xrKpxaPEEVPltjN
         9zZdFEN8Rws2NkH82yXHFR2q4Udm2qOj4psP4gaDMK4HtgQ1oRZANyNdzRZYpIeGAE18
         vujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681376340; x=1683968340;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7g5hV3NWDVn1/V7aQRt4oQ8CBf16T6HKdjwb2x5bdk=;
        b=iGDdHhxwP+4mQ0My1bZtSbCo3A2BYnvK7FgNkO5LvobbkqQiL//h1QKMRSnweeQjfp
         ti0iOX6cDeM4f0O+w6CvYpbarO3VTDqAreaoBVifbfVTyBrAgcanisiWX0cYOHr58p7N
         7A1iDsJTYTwJdmsYRmvY5AKNqaRuBhcPq/Ja3j0MuVDKgoPVJWifHIa/Kdz9o19J27/t
         E4yiogNBEIu43fQSoy2LxUtNI25NPqX74FwXYY6q0+vMz4hRJO2SS3rW+l860rzOj+JB
         De/5sOHJk3F+i93TwsQeslcTMFXZpIKjyLUa012h3MVQtOHgCf6XGvHsL3L/XRwfcOZ9
         5y+Q==
X-Gm-Message-State: AAQBX9fDvb1pxtaJmi/YqxUjx2EN7rT8pTZSSmztH9E/beg+GV97a2q9
	cz0Gk1p17bMvOiBcvmJEZLQ=
X-Google-Smtp-Source: AKy350Zxv3Ko4eW0Fum9TmN1yb7aYSGe0D9dQ8XHg0Ai6fR9/Rf1dH0XSwLKNKkfZjY0IWUaTBv/eg==
X-Received: by 2002:adf:ef51:0:b0:2f0:2e3a:cc04 with SMTP id c17-20020adfef51000000b002f02e3acc04mr1138305wrp.8.1681376340325;
        Thu, 13 Apr 2023 01:59:00 -0700 (PDT)
Received: from [192.168.0.32] ([37.222.243.26])
        by smtp.gmail.com with ESMTPSA id j4-20020a5d5644000000b002f02df4c7a3sm819861wrw.30.2023.04.13.01.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 01:58:59 -0700 (PDT)
Message-ID: <4b5a6233-c8f3-4d12-7508-45df8b7548f5@gmail.com>
Date: Thu, 13 Apr 2023 10:58:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
 <20684378-cf3e-0299-d390-287b7bafbda5@baylibre.com>
 <eb770f19-ada5-81bb-5ea3-798edabca70f@collabora.com>
 <7e53c0b1-3aed-da08-5c57-800ac2277bc6@baylibre.com>
 <e129b3ff-90b1-3df7-871e-09fba0a960f4@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 02/27] dt-bindings: phy: mediatek,dsi-phy: Add compatible
 for MT6795 Helio X10
In-Reply-To: <e129b3ff-90b1-3df7-871e-09fba0a960f4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_015903_829697_272B0DF7 
X-CRM114-Status: GOOD (  18.84  )
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



On 12/04/2023 15:17, AngeloGioacchino Del Regno wrote:
> Il 12/04/23 15:12, Alexandre Mergnat ha scritto:
>> On 12/04/2023 15:03, AngeloGioacchino Del Regno wrote:
>>> Il 12/04/23 14:59, Alexandre Mergnat ha scritto:
>>>> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
>>>>> Add a compatible string for MediaTek Helio X10 MT6795: this SoC uses
>>>>> the same DSI PHY as MT8173.
>>>>>
>>>>> Signed-off-by: AngeloGioacchino Del Regno 
>>>>> <angelogioacchino.delregno@collabora.com>
>>>>> ---
>>>>>   Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 4 ++++
>>>>>   1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml 
>>>>> b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
>>>>> index 26f2b887cfc1..a9f78344efdb 100644
>>>>> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
>>>>> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
>>>>> @@ -24,6 +24,10 @@ properties:
>>>>>             - enum:
>>>>>                 - mediatek,mt7623-mipi-tx
>>>>>             - const: mediatek,mt2701-mipi-tx
>>>>> +      - items:
>>>>> +          - enum:
>>>>> +              - mediatek,mt6795-mipi-tx
>>>>> +          - const: mediatek,mt8173-mipi-tx
>>>>
>>>> AFAIK, it should be:
>>>>        - items:
>>>>            - const: mediatek,mt6795-mipi-tx
>>>>            - const: mediatek,mt8173-mipi-tx
>>>>
>>>> Since it isn't respected above for mt7623, it may be tolerated.
>>>> Please, take this comment as a suggestion, isn't a NAK from me.
>>>>
>>>
>>> First of all, Thanks!
>>> I want to explain, though, the reason for that.
>>>
>>> If you check all the commits, on some I did it as you just proposed, while
>>> on some others I did it with an enum before const: that's simply because I
>>> *totally expect* some to grow, while others (const - const) I was either
>>> unsure, or totally *not* expecting them to grow soon!
>>
>>
>> That's what I thought. IMHO, if someone add another compat later, he will be 
>> on charge to change the const by enum front of your "mediatek,mt6795-mipi-tx". 
>> But my opinion is probably not the most popular.
>>
>> I will not make the same feedback for the other patches in this series.
>>
> 
> I honestly don't know what's the most popular opinion about that... but whatever,
> in any case... just want to make sure to communicate that I don't really have
> strong opinions about doing it one way or the other.
> 
> The arguments in favor and against that are probably 1:1... :-D
> 

Then let me throw in another one :)

Take into account that if we expect the compatible to be added somtimes in the 
future (not the near future) this code will lay around for some time. People 
will take this code as an example for new code, then we will need to explain 
it... In that sense it would make more sense to have all made const: const: and 
change this to enum once a new compatible is added to the mix.

Said all this, I leave it to the DT maintainers to decide :D

Regards,
Matthias

