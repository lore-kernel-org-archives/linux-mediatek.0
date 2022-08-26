Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA12ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 07:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDSlL2xJwUefPOQBgao6BVjTl0UpfSoRkoXUA5oa1uw=; b=oIsyG3iR1E5gDXuiTZLtGfYmvd
	2E1TdYxrD/wDTGjyNO3elAnk0i65vMTexTURw/Z80O342il7ZODSpftnTE4peuw9VMYJTuEfcLE/W
	a9NJbDAU1C7GV6oFYfxmKOuY2f7/xjq5A28vo/IeFXm4bMapeeG957IaGJRipHOsGZQQqfQ16cv6B
	PPue/DNEk3vtkjJ6oR3MKU90EbU5SH2NeQEgpWq+G7VATiWfCJTpJvEjpidl2Jx+doS37GmBaXlLH
	6VaHQcFv5qdPEjisHRmFTisQ5jk2mx9QywxkmM+GarpmoXpCJ801Q7/LLZLlg9R0spfGeF+Bm3oQx
	FyfLYXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRTKj-00FAxV-Ok; Fri, 26 Aug 2022 07:00:49 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRTKY-00FAgE-PI
	for linux-mediatek@lists.infradead.org; Fri, 26 Aug 2022 07:00:40 +0000
Received: by mail-lj1-x229.google.com with SMTP id u24so756048lji.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Aug 2022 00:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=XDSlL2xJwUefPOQBgao6BVjTl0UpfSoRkoXUA5oa1uw=;
        b=VIQ0/aCVG7C0/SP/6lizVVUIqzNtPOz0E5F8QezJetvzwZcY1ks5/1rymNtqiUdhh5
         Ky/dd4lJGeuapfM/XLAvt00ndR3xFtSpHeRK/5JPD1YtvVeWBEPgv2Kl/H/kcor2v7RH
         l9636NhXHvlG55Wkr+4t51jJEMz9S+/1p2i3IhDKsoUK3731ELKDUAhVoDPvms4BQynY
         AYnBNulTgQrkSTBn+4q6i0U9DXPsuDoZVKfx3Q5RUdHbAvwH8IaZTAsXF5fRoJK/nLZ9
         8vQSYmNIG/rOXnB8cUBnflGghJuqmVInOf5o5cjFWAzDa9f7w1OIxAmfhUA6uCgvdQge
         0QWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=XDSlL2xJwUefPOQBgao6BVjTl0UpfSoRkoXUA5oa1uw=;
        b=IHuvL6/pLrJnM8Nnx9cGCqXNjUC9owWEmmnL7UzOb1dNWhOb87Nv5jzPgEb3SjMIvG
         oNasUC+5oN36SYpYGX/QWR1VFclEjH9ym1DD9UZxfaLuM6pikG2+BWKMPcLEk9sVJ6Zv
         LQXFguWul/oqs9k/g19Zlpmf0VJCN4KLWCAg7Zrjb2gyP6wF8EEs1gGECMUkry9r5GCQ
         XfDH3tN/KFhRKRWhgOqklSkKmD7Samyuj+x3ARBVEA6j9vVccXco51/pBz3SWTBpNtyX
         KyEJf+PEbJOEVykkFjTHeu1jmZo7rJF5AwLZoqc5oE0H+T8LDO/gAEIpgr/NpdgJmwR7
         472w==
X-Gm-Message-State: ACgBeo1Yx3dACfuq6HTSRYfzyrzinQpcG+5PXJ5SnEj7k3WjV8rqrhLz
	Ky5HvxbNXCZ7yhxnDgiyWnFkxA==
X-Google-Smtp-Source: AA6agR5g0u2skWFQchEDJp1a5NnlA5x35VYg2ub3C0/UN+k+BHOqSg0QHov6T6lMDAKl0alSdIin1Q==
X-Received: by 2002:a2e:3509:0:b0:261:cca8:7b71 with SMTP id z9-20020a2e3509000000b00261cca87b71mr1829251ljz.176.1661497234606;
        Fri, 26 Aug 2022 00:00:34 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id x27-20020a19e01b000000b00492b679d5aesm273544lfg.81.2022.08.26.00.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 00:00:33 -0700 (PDT)
Message-ID: <adcbb2b7-cddd-4546-bdf2-66d056a40c1d@linaro.org>
Date: Fri, 26 Aug 2022 10:00:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] dt-bindings: arm: mediatek: mmsys: change compatible
 for MT8195
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "hsinyi@google.com" <hsinyi@google.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220825091448.14008-1-rex-bc.chen@mediatek.com>
 <3ed3d73a-1671-708e-7c42-498cca6aaf1d@gmail.com>
 <8f3dba943170361211d9bb4c8bf1be12bbfdec20.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8f3dba943170361211d9bb4c8bf1be12bbfdec20.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_000038_856424_C511CD47 
X-CRM114-Status: GOOD (  26.59  )
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

On 26/08/2022 05:07, Bo-Chen Chen wrote:
> On Thu, 2022-08-25 at 22:57 +0800, Matthias Brugger wrote:
>>
>> On 25/08/2022 11:14, Bo-Chen Chen wrote:
>>> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
>>>
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
>>> Changes for v2:
>>> 1. Add hardware difference for VDOSYS0 and VDOSYS1 in commit
>>> message.
>>> ---
>>>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml       |
>>> 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> index 6ad023eec193..bfbdd30d2092 100644
>>> ---
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> +++
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>>> l
>>> @@ -31,7 +31,8 @@ properties:
>>>                 - mediatek,mt8183-mmsys
>>>                 - mediatek,mt8186-mmsys
>>>                 - mediatek,mt8192-mmsys
>>> -              - mediatek,mt8195-mmsys
>>> +              - mediatek,mt8195-vdosys0
>>
>> Thanks for you patch. As I mentioned on v1, I propose to set 
>> mediatek,mt8195-mmsys as fallback for mediatek,mt8195-vdosys0 to not
>> break 
>> backwards compatibility.
>>
>> Apart from that, the binding change will need some changes to support
>> the new 
>> binding. Please provide these together with this patch.
>>
>> Regards,
>> Matthias
>>
> 
> Hello Matthias,
> 
> Thanks for your comments.
> The purpose of this patch is to confirm we can separate mt8195 mmsys
> into two compatibles. I think this modification is accepted.

No, it is not accepted following Matthias comments. You received my ack
based on assumption that ABI break is perfectly ok for platform
maintainer, as he has decisive voice. If anyone is not happy with a ABI
break, then his concerns must be addressed.

So let it be specific:
NAK.

> 
> After this, I think Jason-JH will push another series with this binding
> patch. 

I don't know what do you mean here - another series on top of wrong patch?

> In Jason-JH's series, we will modify mmsys driver based on this.
> And I think we don't need to keep "mediatek,mt8195-mmsys" if we also
> modify mmsys drivers in the same series.

This does not fux ABI break and broken bisectability.

> 
> Is it ok that postpones to pick this patch until we finish review
> follow-up series?
> 

No. You got a clear review to fix.

Best regards,
Krzysztof

