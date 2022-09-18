Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8778C32771
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 09:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRfTWemLr6NthIORn54hYU2A7/v8x5DzAcs7HxCHtt0=; b=1AH7k9+yIYEgJLBCvhslduWeJn
	LohRMTjEsy/AoO/hpHeRiHti9gCy02YnxHl+D8BGHRRUyXvMWxRlzRpWm8lXEFkY647w+izQctRR3
	+WYrjAJsCXEmuOT2t2qjWzrbErpGFigZ1JrYVhXCxKPepx6/Klz8a0iBcpLBxUFbullRRQSujgvla
	6PRRKbRxDYt34PwhOw9LSAKw3ks1SAm/eM551rWQkTtxzeIVjHiHLFhQeRzCa+Vna/c+XZHh0kJwQ
	J+0HqQ/LQTdxjeNyfz7fwQzvVOEEb8jmcarEQhAxTkW5n7WYIVIJ3bYdH4B51FMEPevXYCCXS3qNU
	Y81y9sgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZqf4-00ELre-Qi; Sun, 18 Sep 2022 09:32:26 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZqen-00ELeI-7O
	for linux-mediatek@lists.infradead.org; Sun, 18 Sep 2022 09:32:10 +0000
Received: by mail-lf1-x135.google.com with SMTP id a3so30248102lfk.9
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Sep 2022 02:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=jRfTWemLr6NthIORn54hYU2A7/v8x5DzAcs7HxCHtt0=;
        b=HlQfxtbd4p2nTCd2bPVs6NsfI6/NyeGnjwrBFoVcpxotPfhSAArkhB95zEL3SJtwWH
         nKbU4i7D1uWa0VIcmsocgNOI5j8nLCBZeesbCENXDcF1i6MGeEqbcwLCu72DtueKZqsm
         jtkIvLKRSDVLwnehbuBQeENj+01OD3cTC/GTvlQ8NWhUTKnIKSq3joVtgXqUBWsU35eG
         8GAyHNqI66NlF1adLSwmfxgrsIDk6gpy6BeEZJES5OgsCf1ltuAFyYbOI/UrGoY/Wy2S
         Lvc2yBC6CQFbYwovKYL5FZiGyHbyy5C9XdT0VYvSIocFky8Z5TafaSdfv0sqLpGilJBS
         08Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=jRfTWemLr6NthIORn54hYU2A7/v8x5DzAcs7HxCHtt0=;
        b=7AyK0ydC/ME1FzBBUAavfhiT7Mi4iLtj1SXKlJuWDm1T+g1At6sfBJ+srUw8KLzfdS
         zeeHCFvecXlvUo8D7AFsctThMNOnIIyM7mefcFE1BE9nQNb+asXHYFsPR1Uqe43aAk23
         tM9O9bcJp/v/duZsflCJDMO+b4+SrbMA6eXwoXbAxHSQtWFnSN0JzsTwYaM4BU4TMYzq
         mLTZspwBqEGaq6kEdQttASjx3uof4H+rShLZIg69Z7LW1gUMF33srwpmHTDKHtqbKzdy
         qMjjNryXH7nP7/36oOZnuoFT1fnNUmZaUx8qPwGkI/Ptw3RK7XMbUpKPl0WN5rWNotWo
         fj8Q==
X-Gm-Message-State: ACrzQf3WkiOgWQu31t+D4+TVS+m1YNmUfbVyyabj+U6vdoD9t/qL5AQW
	1lPxvJYhoMu1ATAv0LM1TEkklQ==
X-Google-Smtp-Source: AMsMyM6LutjsjtgHTG/aA+H1yVQ7fmKsKsJ2x+CnLGCMnrdlR7RpV6+ZVk1d7/e5+0oAOutW6nNuGg==
X-Received: by 2002:a19:7619:0:b0:49f:6cd7:45c2 with SMTP id c25-20020a197619000000b0049f6cd745c2mr1769336lff.7.1663493525421;
        Sun, 18 Sep 2022 02:32:05 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b20-20020a2ebc14000000b0026c15d60ad1sm78103ljf.132.2022.09.18.02.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 02:32:04 -0700 (PDT)
Message-ID: <17cacc6f-173f-ad6c-9056-1b17635c984d@linaro.org>
Date: Sun, 18 Sep 2022 10:31:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/6] dt-bindings: arm: mediatek: mmsys: change
 compatible for MT8195
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220915161817.10307-1-jason-jh.lin@mediatek.com>
 <20220915161817.10307-2-jason-jh.lin@mediatek.com>
 <e6921ed7-a14c-aadb-abd4-1e7ee0a63be9@gmail.com>
 <f30bd382eb8923256d6f39342ec7832774c0f547.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f30bd382eb8923256d6f39342ec7832774c0f547.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_023209_333810_32B7C4DF 
X-CRM114-Status: GOOD (  21.04  )
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

On 16/09/2022 04:34, Jason-JH Lin wrote:
> Hi Matthias,
> 
> Thanks for the review.
> 
> On Fri, 2022-09-16 at 00:05 +0200, Matthias Brugger wrote:
>>
>> On 15/09/2022 18:18, Jason-JH.Lin wrote:
>>> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
>>> pipelines binding to 1 mmsys with the same power domain, the same
>>> clock driver and the same mediatek-drm driver.
>>>
>>> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding
>>> to
>>> 2 different power domains, different clock drivers and different
>>> mediatek-drm drivers.
>>>
>>> Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
>>> CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture
>>> Quality)
>>> and they makes VDOSYS0 supports PQ function while they are not
>>> including in VDOSYS1.
>>>
>>> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
>>> component). It makes VDOSYS1 supports the HDR function while it's
>>> not
>>> including in VDOSYS0.
>>>
>>> To summarize0:
>>> Only VDOSYS0 can support PQ adjustment.
>>> Only VDOSYS1 can support HDR adjustment.
>>>
>>> Therefore, we need to separate these two different mmsys hardwares
>>> to
>>> 2 different compatibles for MT8195.
>>>
>>> Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195
>>> SoC binding")
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>>> ---
>>>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        |
>>> 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> index 6ad023eec193..0e267428eaa6 100644
>>> ---
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> +++
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> @@ -31,7 +31,7 @@ properties:
>>>                 - mediatek,mt8183-mmsys
>>>                 - mediatek,mt8186-mmsys
>>>                 - mediatek,mt8192-mmsys
>>> -              - mediatek,mt8195-mmsys
>>> +              - mediatek,mt8195-vdosys0
>>
>> Nack, we miss the fallback compatible, as I already said twice.
>>
>> Regards,
>> Matthias
> 
> I'm sorry this happened again.
> I'll keep the compatible "mediatek,mt8195-mmsys" at next version.
> 
> The patch "dt-bindings: arm: mediatek: mmsys: remove the unused
> compatible for mt8195" should be sent after accepting the vdosys1
> series, right?

I don't think there will be no such patch...

You need to add a bindings change which will accept device nodes like:
foo {
  compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-mmsys";

}

Example-schema shows how to do it.

Best regards,
Krzysztof

