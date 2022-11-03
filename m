Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8539AC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 15:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMIGCst1E5FAAxeJFJkmLvsSRBUT4nIQSQ8HrU7lElk=; b=qsmIZxSF2IDgpMnptgJBql866z
	ASvriSqXcAMlJNc4TP4ztQ1z6WT6Dz//DN1DtVybafqYCnzQ9qGVOjHSiZMxf9LDXB/cWYep8TFxO
	8HhneF0UW3Ejt43LEijGSORpujVZaJRJ+C0VPxRJjOWQYekCw6zX+e3h8lgCkkkjUEgOMPpChDfFz
	95jQ9lzA5YfsEdoarAYDSDB04sgsNUvkq9X37iaCuSZuKiJPhl5yIoA82kS4oPtxIA4sYQ6eXizf1
	LU5565pf69WPJkBkAX5yjkIKGjK5ocZJY8504yqkWyqibiLa7LejP3T8vk3Z7lkxfjIQ76EsFdkYr
	+dkHubEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqcH3-000QkS-8z; Thu, 03 Nov 2022 15:36:57 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqby0-000HV2-SP
	for linux-mediatek@lists.infradead.org; Thu, 03 Nov 2022 15:17:20 +0000
Received: by mail-lj1-x229.google.com with SMTP id d20so2587358ljc.12
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Nov 2022 08:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zMIGCst1E5FAAxeJFJkmLvsSRBUT4nIQSQ8HrU7lElk=;
        b=rZTm6D+9wrr5NMuKjwiyWM/wANopi9ZBzu+73zoUUZamwmI9Wp1UzGtz65L39GFHAa
         ueN7YEavrKgyI2y8dRywfut2DmpqibYASxNuU+tvkXv+Oln6l8X6l2nEK98yxEQ7V4nd
         J+rZ0Hak05nfWne9YZlsX55S4u595qwJQedfruyy6tNqlM1i9Ywl/FBwVAwyNoY9lQPp
         gX7HORQRsf/9BuXI79WfTsK9eGWdJR3jrluEvwGrMAZVX/Oax6aUCNS3NzzRwpXZ1uB4
         glfYuougZSTiZboChZk0uBDNn5MF3w553wd7r6Pj9ik7+rZhkFqftPo9135dN/dMroOT
         c2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMIGCst1E5FAAxeJFJkmLvsSRBUT4nIQSQ8HrU7lElk=;
        b=lyWc6q4itG/0+Tn+c9LTi9bo+9Q2fEe2F29p91P2yx1XJHHuZ1Tv+xMy9bVj2uAn6D
         CMgB6J/cE8/1lJCPlmflDfLrqT7tqjnJgg4xn5MIx/1gEwQSbuh/YFtIf2e4TYUgqNpw
         zLuIwftVV0dr5y6Ey8XwB4AAekzGKbaF2fhy0soG96rgYrrOe15Osftr5cIqOjW8ZY+C
         VKxh0sR5UNR9JeXE+C/C4JTpTh7VueieFRhyxkOenEonAEHpHoem+750uOBSboHDCYwu
         LSGk2AObEpPIv+VnEKAZWi5OgXY8dxo7/hu5L/7Bkf7ud8/FAJxFZ69eYdxm5ibsIHw+
         /Nmg==
X-Gm-Message-State: ACrzQf2QR05qqvnv6q1iI7yasRbWrvIyweHIqNwgYGhDA4qb/vG5bGsp
	9A5wmIVpc0KtQpRS7Kh7Jbqspm/N0fgPHdrlG0f5mg==
X-Google-Smtp-Source: AMsMyM5sM/soeeRCI/qJ75zYexRAjufkAYu9hKvyCzUz+VB4Z02VVK67yQnEJDo7RVKJlVEeZEpME0L7fyuS9mMB2KM=
X-Received: by 2002:a2e:2e0c:0:b0:277:75bb:429e with SMTP id
 u12-20020a2e2e0c000000b0027775bb429emr3705962lju.314.1667488632950; Thu, 03
 Nov 2022 08:17:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Nov 2022 08:17:12 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v2-0-8419dcf4f09d@baylibre.com> <20220919-v2-2-8419dcf4f09d@baylibre.com>
 <c91ee3ce-3f30-a3ef-bb38-8571e488b6b6@linaro.org> <CABnWg9t3w4o4rmNosvYCpqG-h8DESerajH7OsXEYofRf2kr1Xg@mail.gmail.com>
 <6bb3ab49-1c12-6863-a49a-2fd1f34de561@linaro.org>
In-Reply-To: <6bb3ab49-1c12-6863-a49a-2fd1f34de561@linaro.org>
MIME-Version: 1.0
Date: Thu, 3 Nov 2022 08:17:12 -0700
Message-ID: <CABnWg9uDki0ZtkxU1BPZq0ZU1mi4zFjasw+e3pQYb+Nv1MThLA@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] dt-bindings: display: mediatek: add MT8195 hdmi bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jitao shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: stuart.lee@mediatek.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	mac.shen@mediatek.com, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_081716_981054_2D291F70 
X-CRM114-Status: GOOD (  19.37  )
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

On Thu, 03 Nov 2022 13:45, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 02/11/2022 09:31, Guillaume Ranquet wrote:
>> On Fri, 14 Oct 2022 18:08, Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>> On 14/10/2022 11:15, Guillaume Ranquet wrote:
>>>> Add mt8195 SoC bindings for hdmi and hdmi-ddc
>>>>
>>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>>> ---
>>>>  .../bindings/display/mediatek/mediatek,hdmi.yaml   | 67 +++++++++++++++++-----
>>>>  .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml | 51 ++++++++++++++++
>>>>  2 files changed, 104 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>>>> index bdaf0b51e68c..955026cd7ca5 100644
>>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>>>> @@ -21,26 +21,21 @@ properties:
>>>>        - mediatek,mt7623-hdmi
>>>>        - mediatek,mt8167-hdmi
>>>>        - mediatek,mt8173-hdmi
>>>> +      - mediatek,mt8195-hdmi
>>>>
>>>>    reg:
>>>>      maxItems: 1
>>>>
>>>> -  interrupts:
>>>> -    maxItems: 1
>>>> -
>>>
>>> This change is not really explained in commit msg...
>>>
>>>>    clocks:
>>>> -    items:
>>>> -      - description: Pixel Clock
>>>> -      - description: HDMI PLL
>>>> -      - description: Bit Clock
>>>> -      - description: S/PDIF Clock
>>>> +    minItems: 4
>>>> +    maxItems: 4
>>>>
>>>>    clock-names:
>>>> -    items:
>>>> -      - const: pixel
>>>> -      - const: pll
>>>> -      - const: bclk
>>>> -      - const: spdif
>>>> +    minItems: 4
>>>> +    maxItems: 4
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>>
>>>>    phys:
>>>>      maxItems: 1
>>>> @@ -58,6 +53,9 @@ properties:
>>>>      description: |
>>>>        phandle link and register offset to the system configuration registers.
>>>>
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>>    ports:
>>>>      $ref: /schemas/graph.yaml#/properties/ports
>>>>
>>>> @@ -86,9 +84,50 @@ required:
>>>>    - clock-names
>>>>    - phys
>>>>    - phy-names
>>>> -  - mediatek,syscon-hdmi
>>>>    - ports
>>>>
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: mediatek,mt8195-hdmi
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          items:
>>>> +            - description: APB
>>>> +            - description: HDCP
>>>> +            - description: HDCP 24M
>>>> +            - description: Split HDMI
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: hdmi_apb_sel
>>>> +            - const: hdcp_sel
>>>> +            - const: hdcp24_sel
>>>> +            - const: split_hdmi
>>>> +
>>>> +      required:
>>>> +        - power-domains
>>>> +    else:
>>>> +      properties:
>>>> +        clocks:
>>>> +          items:
>>>> +            - description: Pixel Clock
>>>> +            - description: HDMI PLL
>>>> +            - description: Bit Clock
>>>> +            - description: S/PDIF Clock
>>>> +
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: pixel
>>>> +            - const: pll
>>>> +            - const: bclk
>>>> +            - const: spdif
>>>> +
>>>> +      required:
>>>> +        - mediatek,syscon-hdmi
>>>> +
>>>>  additionalProperties: false
>>>>
>>>>  examples:
>>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>>>> new file mode 100644
>>>> index 000000000000..0fe0a2a2f17f
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>>>> @@ -0,0 +1,51 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Mediatek HDMI DDC for mt8195
>>>> +
>>>> +maintainers:
>>>> +  - CK Hu <ck.hu@mediatek.com>
>>>> +  - Jitao shi <jitao.shi@mediatek.com>
>>>> +
>>>> +description: |
>>>> +  The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - mediatek,mt8195-hdmi-ddc
>>>
>>> I think I wrote it - you already have bindings for HDMI DDC. I doubt
>>> that these are different and it looks like you model the bindings
>>> according to your driver. That's not the way.
>>
>> Hi Krzysztof,
>>
>> I've made a separate binding as this new IP is integrated into the
>> HDMI hw block.
>> The difference it makes is that the hw is slightly simpler to describe
>> as the IP doesn't
>> have it's own range of registers or an interrupt line.
>>
>> I can use the "legacy mediatek mtk ddc binding" if I modify it to have
>> the reg and
>> interrupt properties not being required for mt8195.
>
>OK, it is reasonable - such stuff should be in commit msg, so we won't
>keep asking.
>

I'll sum this up in the commit msg for V3 then.

>>
>> Would that work better for you?
>>
>>>
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: ddc
>>>> +
>>>> +  mediatek,hdmi:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description:
>>>> +      A phandle to the mt8195 hdmi controller
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - clocks
>>>> +  - clock-names
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>> +    hdmiddc0: ddc_i2c {
>>>
>>> Node names should be generic - ddc.
>>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>>>
>>> No underscores in node names.
>>>
>>> Additionally I2C devices have addresses on the bus. Why this one doesn't?
>>>
>>
>> This is an i2c adapter, not a device.
>> And as it lives inside the HDMI hw block, I've omitted using an address here.
>>
>> Is this valid? or should this be expressed differently?
>
>What is an I2C adapter? Did you mean I2C controller (master)?

Yes, a controller.
This is an I2C controller connected to the HDMI connector, it is used
to exchange data on the Display Data Channel with
the display (such as EDID).

Thx,
Guillaume.

>
>Best regards,
>Krzysztof
>

