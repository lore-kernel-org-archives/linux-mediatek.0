Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82777C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qt810txVALNNyUdY4OEJ1D3fYrKTdtnWDD3u56EERwI=; b=Zv4h5408SbNsUgz3qWEsTGaufL
	AibArVwiPKfQGxcmvzWNLlxL6D2EjsRUHPxYTiLKUsGxIa7zgiDSe8OBZCrnV4pk9iwQj4Dse+jD5
	HVbGwQbIakJm5GP4F3LR2syXJxAFpmE1EO+USbfc3I8rtgje11hSMVqc73Srlv1TU1CkzZmf48gIs
	oY1ioNpXPRu/yU7d2Ik9J6UiHp3663D9t3LQn5IhElskFtucvwV8RU564bgTehaZmEiLqXTmB+qD4
	CwR3LGAjsnuVCI3HNEWJKtU1ji6sq+YD9fIckHEvrL01+FWhumMEqGgM6JP/ewmE2/u8QfZ+SBrza
	b/95Hvdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqDqI-00BIk8-2x; Wed, 02 Nov 2022 13:31:42 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqDq6-00BIfc-6i
	for linux-mediatek@lists.infradead.org; Wed, 02 Nov 2022 13:31:34 +0000
Received: by mail-lf1-x131.google.com with SMTP id g12so28275466lfh.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Nov 2022 06:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qt810txVALNNyUdY4OEJ1D3fYrKTdtnWDD3u56EERwI=;
        b=3xmqrEhp6kIZuyPMYnSPokp0VKivtqklDyyWKzYNWn7RZ9r32jO+TYfFJYvac4ILFA
         HN8cAoqwO36KNOPekRjuxDsqK6LQuARHGNBy7DDo2ods9roVUhZI42CQh5OFNUZKbTfG
         F9gCKBM7koia5e0VuYUIfiKOHb3GGXspmKJ7JmSWnnDslrPKhxbER3LVZJ8JhFK+Is6V
         V64OO2OHY3kFRAvTWv/NIU604DON7dRgX2bQETft6CwN1IGmZVn9qrvWFUZ5OmHKlnZ2
         TVsTmVfPlMVH8huodx3nlqli2FqtWsmNB+OZqtu3f39Bn7ooCpAkDJ2DQH11Qrs6wy8W
         5zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qt810txVALNNyUdY4OEJ1D3fYrKTdtnWDD3u56EERwI=;
        b=OIww5iDI8nQbHmq/6MaZm4WHguX4xIa4s6ABEq6sKl71Q2VjU/dM6tYtt1LU56Wl1Z
         7jbcT3wt3DsY/92dWwbB9OSqgkeljYEZI3cf/G6x7/vEEVBDNh6UkV3XsoEkVHIRKQak
         Zr0szjmD7ryRX1kjIwe1Abks59wg0+DIiivpqHZBA/1WxmfcFrXEQnfqixLP9/DW05lk
         33oqjjTk3L6HPqAbkxaEZTHjCBsx2FPaWt0NT3QRftYOryJWu4hRx0phAnITnj1oiJXE
         tglgTBx3EmbfaZ5QrtgZwSClc/ilj1AbjGne7l05bolFY0FLHTMtp7xDj/Jcy37/0kDN
         LGTQ==
X-Gm-Message-State: ACrzQf1IShO/LXnDUIWfDh1lTHJjZlU2DI8m0aG/FAYGyoCbJFMhXZvB
	+7k+hF7t8YjEzb6DzSdcnAWhIamm53HZPTqCCd8WHg==
X-Google-Smtp-Source: AMsMyM7NEe/GaJR4NF+KA5B639tBCDJwn4kT6yPPjmVJnVe6xV1T07jvraVMLccE++55BYXBEE26QqdBGn1uy3S8WHM=
X-Received: by 2002:ac2:5e33:0:b0:4a2:1d16:5cc2 with SMTP id
 o19-20020ac25e33000000b004a21d165cc2mr8578793lfg.620.1667395887603; Wed, 02
 Nov 2022 06:31:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Nov 2022 13:31:27 +0000
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v2-0-8419dcf4f09d@baylibre.com> <20220919-v2-2-8419dcf4f09d@baylibre.com>
 <c91ee3ce-3f30-a3ef-bb38-8571e488b6b6@linaro.org>
In-Reply-To: <c91ee3ce-3f30-a3ef-bb38-8571e488b6b6@linaro.org>
MIME-Version: 1.0
Date: Wed, 2 Nov 2022 13:31:26 +0000
Message-ID: <CABnWg9t3w4o4rmNosvYCpqG-h8DESerajH7OsXEYofRf2kr1Xg@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] dt-bindings: display: mediatek: add MT8195 hdmi bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, David Airlie <airlied@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jitao shi <jitao.shi@mediatek.com>, 
	CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: stuart.lee@mediatek.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	mac.shen@mediatek.com, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_063130_281188_20832B98 
X-CRM114-Status: GOOD (  20.45  )
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

On Fri, 14 Oct 2022 18:08, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 14/10/2022 11:15, Guillaume Ranquet wrote:
>> Add mt8195 SoC bindings for hdmi and hdmi-ddc
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> ---
>>  .../bindings/display/mediatek/mediatek,hdmi.yaml   | 67 +++++++++++++++++-----
>>  .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml | 51 ++++++++++++++++
>>  2 files changed, 104 insertions(+), 14 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> index bdaf0b51e68c..955026cd7ca5 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> @@ -21,26 +21,21 @@ properties:
>>        - mediatek,mt7623-hdmi
>>        - mediatek,mt8167-hdmi
>>        - mediatek,mt8173-hdmi
>> +      - mediatek,mt8195-hdmi
>>
>>    reg:
>>      maxItems: 1
>>
>> -  interrupts:
>> -    maxItems: 1
>> -
>
>This change is not really explained in commit msg...
>
>>    clocks:
>> -    items:
>> -      - description: Pixel Clock
>> -      - description: HDMI PLL
>> -      - description: Bit Clock
>> -      - description: S/PDIF Clock
>> +    minItems: 4
>> +    maxItems: 4
>>
>>    clock-names:
>> -    items:
>> -      - const: pixel
>> -      - const: pll
>> -      - const: bclk
>> -      - const: spdif
>> +    minItems: 4
>> +    maxItems: 4
>> +
>> +  interrupts:
>> +    maxItems: 1
>>
>>    phys:
>>      maxItems: 1
>> @@ -58,6 +53,9 @@ properties:
>>      description: |
>>        phandle link and register offset to the system configuration registers.
>>
>> +  power-domains:
>> +    maxItems: 1
>> +
>>    ports:
>>      $ref: /schemas/graph.yaml#/properties/ports
>>
>> @@ -86,9 +84,50 @@ required:
>>    - clock-names
>>    - phys
>>    - phy-names
>> -  - mediatek,syscon-hdmi
>>    - ports
>>
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: mediatek,mt8195-hdmi
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: APB
>> +            - description: HDCP
>> +            - description: HDCP 24M
>> +            - description: Split HDMI
>> +        clock-names:
>> +          items:
>> +            - const: hdmi_apb_sel
>> +            - const: hdcp_sel
>> +            - const: hdcp24_sel
>> +            - const: split_hdmi
>> +
>> +      required:
>> +        - power-domains
>> +    else:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Pixel Clock
>> +            - description: HDMI PLL
>> +            - description: Bit Clock
>> +            - description: S/PDIF Clock
>> +
>> +        clock-names:
>> +          items:
>> +            - const: pixel
>> +            - const: pll
>> +            - const: bclk
>> +            - const: spdif
>> +
>> +      required:
>> +        - mediatek,syscon-hdmi
>> +
>>  additionalProperties: false
>>
>>  examples:
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>> new file mode 100644
>> index 000000000000..0fe0a2a2f17f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Mediatek HDMI DDC for mt8195
>> +
>> +maintainers:
>> +  - CK Hu <ck.hu@mediatek.com>
>> +  - Jitao shi <jitao.shi@mediatek.com>
>> +
>> +description: |
>> +  The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - mediatek,mt8195-hdmi-ddc
>
>I think I wrote it - you already have bindings for HDMI DDC. I doubt
>that these are different and it looks like you model the bindings
>according to your driver. That's not the way.

Hi Krzysztof,

I've made a separate binding as this new IP is integrated into the
HDMI hw block.
The difference it makes is that the hw is slightly simpler to describe
as the IP doesn't
have it's own range of registers or an interrupt line.

I can use the "legacy mediatek mtk ddc binding" if I modify it to have
the reg and
interrupt properties not being required for mt8195.

Would that work better for you?

>
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ddc
>> +
>> +  mediatek,hdmi:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      A phandle to the mt8195 hdmi controller
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    hdmiddc0: ddc_i2c {
>
>Node names should be generic - ddc.
>https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
>No underscores in node names.
>
>Additionally I2C devices have addresses on the bus. Why this one doesn't?
>

This is an i2c adapter, not a device.
And as it lives inside the HDMI hw block, I've omitted using an address here.

Is this valid? or should this be expressed differently?

Thx,
Guillaume.

>> +      compatible = "mediatek,mt8195-hdmi-ddc";
>> +      mediatek,hdmi = <&hdmi0>;
>> +      clocks = <&clk26m>;
>> +      clock-names = "ddc";
>> +    };
>> +
>> +...
>>
>
>Best regards,
>Krzysztof
>

