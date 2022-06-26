Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EF4C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jun 2022 10:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uid1nPU8KOeE8niwF3D46qRU8qJY11HwGt4P2APkK6s=; b=HPuBNOYValsoMG3eP40IKOpGFd
	KeA7FN97MM8OgPq3dHfYbnIrwvpzFvn4jDlXMgYorVBZ5OctJmDXVJy7mrlJ8A+LylQnE9MwU0dEn
	frpvg2jRv6LiuzcRXhyT7LOz9VNgUEPqNXZmekYbtaLccKvwOnFjGCoWxbnUsvSjy0EHHHcR3/YUP
	J2/FajfmUksS34QDFye0W8KvU1n9A5KHaDVPF5EeSGgHawYxzsToQ9Ty4sg7GohaT1QA5lA2zZwxh
	19N6m4ywQfpBXFqmqt4gV0RCwWfToVC9mUTnWLud3BSX361f+eGFCHeL3uswH0iWrIBEg1lIfJkO9
	5qkiDQ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5PYN-00BAzC-4L; Sun, 26 Jun 2022 10:31:43 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5PYJ-00BAwk-ME
	for linux-mediatek@lists.infradead.org; Sun, 26 Jun 2022 10:31:41 +0000
Received: by mail-ej1-x62d.google.com with SMTP id d2so1568203ejy.1
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Jun 2022 03:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uid1nPU8KOeE8niwF3D46qRU8qJY11HwGt4P2APkK6s=;
        b=XAAC8AAlqRMmEzIHciueTzD3m22dmzWily6b8BHr6rpAvs0uXwzFyjFU045Lj7kkAe
         E79BdJ7MTKVbCL4wI6W9DsNgbpv6aW6GnwH7FZ4j3Es873/RwWQZOYfEASsZ8PPpzVP5
         dP5C+APcEInT67HZF1QBAf2do2AqTi8t07BAr4Gnx6UU+kyFOgz3SrYCkQ0LvoCC2dY5
         wAIMpoeO6Tp2eb8BRQqGfvmaMIF2KLt6qtodk3zqF8PF3YIfXCn9TvG9r4GjheCfMRFh
         8ec2U8O7uXcId5goQakMrd/qdV1II34NJfmrTyvrbe0MNI60NvlpB6Mwy0F/+l4Rqp0l
         6+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uid1nPU8KOeE8niwF3D46qRU8qJY11HwGt4P2APkK6s=;
        b=I4cf0NJG+N6dHyuxWoGSq718tVHgGoH/12OMKrfBm0GPXEhmM9aNbEVnOI0P5vh+Y/
         7SAkMxGzbTLzOdHk7XPNSari/L9Usa1HgQ3Dn9viHTZlj7h3yR11n4SD1StiDFZbGVi/
         AAm0PjJWYSUnupO2YbKTxRBReXPxa56jOyjmfHCm8oaBobZdyT7GCk0JvDEtvTpIMTdX
         F4FJhiDCWcMEdEbfU5x86t51Vwfkrmd4oZa7l8fP8WTxcGoxpfCg7fMd0xq8VC0i2b/B
         aYnaUth8geZZzGkjueevAGPjwNK/UOUZUQOCZu7WchLmsefoMVTCxes4cQ78stX2Hdqj
         Z9Cg==
X-Gm-Message-State: AJIora/L0wZLZeukAzoTOH78+loLVim2VqTmSlUyk7oPk62oPeFWpyw2
	0cbyRsQvxEKpDUBsZ+GfI5eflg==
X-Google-Smtp-Source: AGRyM1v5PkYm9NSDHkT60vS80gGlYU4SSApNwB4dG6nO+r0o1Sb57gZPEpYSfK3zIyIeGsRQtSZH7A==
X-Received: by 2002:a17:907:980a:b0:722:f4a7:e00 with SMTP id ji10-20020a170907980a00b00722f4a70e00mr7752467ejc.114.1656239497724;
        Sun, 26 Jun 2022 03:31:37 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g10-20020aa7dc4a000000b0043567edac3csm5724723edu.61.2022.06.26.03.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 03:31:37 -0700 (PDT)
Message-ID: <ee945844-5d78-7c2b-215e-25fe5617b481@linaro.org>
Date: Sun, 26 Jun 2022 12:31:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 4/7] dt-bindings: clock: mediatek: Add clock driver
 bindings for MT6795
Content-Language: en-US
To: David Heidelberg <david.heidelberg@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, jason-jh.lin@mediatek.com, ck.hu@mediatek.com,
 fparent@baylibre.com, rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
References: <20220624093525.243077-1-angelogioacchino.delregno@collabora.com>
 <20220624093525.243077-5-angelogioacchino.delregno@collabora.com>
 <cea65d6a-7d9b-7b14-9984-bcd7f115da47@linaro.org>
 <728b2c54-0dc0-533f-bab8-fca228f6c1b1@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <728b2c54-0dc0-533f-bab8-fca228f6c1b1@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_033139_785975_780C8594 
X-CRM114-Status: GOOD (  16.77  )
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

On 26/06/2022 11:47, David Heidelberg wrote:
> On 25/06/2022 22:29, Krzysztof Kozlowski wrote:
>> On 24/06/2022 11:35, AngeloGioacchino Del Regno wrote:
>>> Add the bindings for the clock drivers of the MediaTek Helio X10
>>> MT6795 SoC.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   .../bindings/clock/mediatek,mt6795-clock.yaml | 66 +++++++++++++++++
>>>   .../clock/mediatek,mt6795-sys-clock.yaml      | 74 +++++++++++++++++++
>>>   2 files changed, 140 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
>>>   create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
>>> new file mode 100644
>>> index 000000000000..795fb18721c3
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
>>> @@ -0,0 +1,66 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: "http://devicetree.org/schemas/clock/mediatek,mt6795-clock.yaml#"
>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>> +
>>> +title: MediaTek Functional Clock Controller for MT6795
>>> +
>>> +maintainers:
>>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
>>> +
>>> +description: |
>>> +  The clock architecture in MediaTek like below
>>> +  PLLs -->
>>> +          dividers -->
>>> +                      muxes
>>> +                           -->
>>> +                              clock gate
>>> +
>>> +  The devices provide clock gate control in different IP blocks.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - mediatek,mt6795-mfgcfg
>>> +      - mediatek,mt6795-vdecsys
>>> +      - mediatek,mt6795-vencsys
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  '#clock-cells':
>>> +    const: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - '#clock-cells'
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    soc {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        mfgcfg: clock-controller@13000000 {
>>> +            compatible = "mediatek,mt6795-mfgcfg";
>>> +            reg = <0 0x13000000 0 0x1000>;
>>> +            #clock-cells = <1>;
>>> +        };
>>> +
>>> +        vdecsys: clock-controller@16000000 {
>>> +            compatible = "mediatek,mt6795-vdecsys";
>>> +            reg = <0 0x16000000 0 0x1000>;
>>> +            #clock-cells = <1>;
>>> +        };
>>> +
>>> +        vencsys: clock-controller@18000000 {
>>> +            compatible = "mediatek,mt6795-vencsys";
>>> +            reg = <0 0x18000000 0 0x1000>;
>>> +            #clock-cells = <1>;
>>> +        };
>>> +    };
>>> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
>>> new file mode 100644
>>> index 000000000000..44b96af9ceaf
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
>>> @@ -0,0 +1,74 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: "http://devicetree.org/schemas/clock/mediatek,mt6795-sys-clock.yaml#"
>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>> +
>>> +title: MediaTek System Clock Controller for MT6795
>>> +
>>> +maintainers:
>>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
>>> +
>>> +description:
>>> +  The Mediatek system clock controller provides various clocks and system configuration
>> Wrap according to Linux coding convention, so at 80.
> 
> What I understood that 100 length was agreed [1] as a limit. I haven't 
> noticed any recent change regarding to line length.
> 
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144

The coding style (also in change above) clearly states:
"The preferred limit on the length of a single line is 80 columns."
Just read the first line of new diff/hunk...

checkpatch was indeed long time converted not to complain on 80 but on
100, but that does not change coding style. The point of that was only
to accept 100 wrapping when it is beneficial,  iow, it increases the
code readability.

It's not the case here and coding style clearly asks for 80. Wrap at 80.


Best regards,
Krzysztof

