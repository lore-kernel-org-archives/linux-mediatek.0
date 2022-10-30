Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06412C38A02
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Oct 2022 10:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uv/cptTfLtPvcsrktv/mW5+tMHWrOclQLGOQ7J33l4w=; b=OROShMVDrAwMaZfOLxbq+fg/IV
	iYiZtzHOsq2ZYALLXWC+thTMNWR3QLAD+vBS23MgDb1oHkyEKDHbWxBKl5m4D0+z5C0UhKb48oIHv
	9GmG8E4TeGeu3JBn1f+5yn5JeiWNgXLEJzCwLPQYejQEa46eZvdKQQakz0764/iYZGJWrJZkkA0KA
	YV7NW0BY4e1TttmfNE8GC8CP8Sv+tKebmH11o39qA6ajz8HV1gvMdugQRNffG08EhdknUhHXLaRF7
	3/xrCcU3shPwY/VqQpnrfp6xODq73n8/twcMQhuiiDRKcp3m7rkpJPRpUwkXU3NcugBO80CC32+kT
	h6VJ97iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op5Co-00F7t5-09; Sun, 30 Oct 2022 10:06:14 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op5Ck-00F7r0-SI; Sun, 30 Oct 2022 10:06:12 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 21so13728162edv.3;
        Sun, 30 Oct 2022 03:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uv/cptTfLtPvcsrktv/mW5+tMHWrOclQLGOQ7J33l4w=;
        b=GWILsf6kT0LKOVvM+sv//uQTV3XO++uU+E0iuf1VMiiviFpkANLlmzGTC+U/vzu3sm
         pniRmGLEfB/R4O9PTxZ3SdNDKBBddlMWm6C95FaK65McyLejGtTyFAg1tpkOWzaImKEj
         /pw/A+J5SIZAmeM/R8VDDA2wBczSzjDlCEdDRRMnyiQF1N8AdDR+e5viYfk7PVEBsQX6
         IFCHOwyH/ucVq2KdiPLTh1lHBuDFUTe+enx/eBJTvYAX+GKdGIf3K6WLK6sNNWsCHDnr
         83b7KksNrL8+rrLpoQtqHkAekpL9OdyH3IQ+O16pJImO5/cp8Y+H251C81MeonoB7dMY
         eoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uv/cptTfLtPvcsrktv/mW5+tMHWrOclQLGOQ7J33l4w=;
        b=roTuZktwsWvQ4aOnz8KFLiePLYmWquA9qTvO6MLR+VC7AUc9sFkoeIAB5ZSpYkWg9D
         Kiif/9R8Xw/oGlDSN+qi9/IcwwvogE8R3gwGXaVFro+p1dOtGG9HQ3f5VctGB0VomXfO
         4jLeTvVDJZoV1SGFiwMGklk0AITI8DNCNGBL3t++vjnar6F41YVBj5dmUlEZCW5IHEnI
         XH4D01GOAyq6uUVIJ1Yssk17TMAUR93LhX6D0ZX9yr8JMsZfMwJlO+QAvxWBxP+RBKLk
         jcRtob+41YxLHPlrdr8QG725AWrKnsT8qtUGojAH9A2lMtdBctnScT6fuosI1+9XSrSP
         NJNA==
X-Gm-Message-State: ACrzQf1+ISXGGNQETLuP8v1ubyI/aoSUmdhi5AS9X4IzoXYZCVn03YfU
	ft7rNT83PGvlpsdMDLtQ+LU=
X-Google-Smtp-Source: AMsMyM5Z3Tx3yOXtQdRrcRKpj9zjMopo2MK2cDU9tj7aifFiqNiyvWKnYO5DSolS9/E2E5jUxlrdJA==
X-Received: by 2002:a05:6402:1cc1:b0:453:1517:94e4 with SMTP id ds1-20020a0564021cc100b00453151794e4mr8106298edb.399.1667124369029;
        Sun, 30 Oct 2022 03:06:09 -0700 (PDT)
Received: from [10.32.3.204] ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id qc9-20020a170906d8a900b0078b1ff41f05sm1669440ejb.43.2022.10.30.03.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 03:06:08 -0700 (PDT)
Date: Sun, 30 Oct 2022 13:05:59 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add MT6795
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Andy Teng
	<andy.teng@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yassine Oudjana
	<y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <ZD9KKR.M2TT1QFA4FT92@gmail.com>
In-Reply-To: <e34b35f4-4197-3973-0947-14ee577494e9@linaro.org>
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
	<20221028153505.23741-10-y.oudjana@protonmail.com>
	<e34b35f4-4197-3973-0947-14ee577494e9@linaro.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_030610_961152_AF5A0AA3 
X-CRM114-Status: GOOD (  23.70  )
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


On Fri, Oct 28 2022 at 16:01:58 -04:00:00, Krzysztof Kozlowski 
<krzysztof.kozlowski@linaro.org> wrote:
> On 28/10/2022 11:35, Yassine Oudjana wrote:
>>  From: Yassine Oudjana <y.oudjana@protonmail.com>
>> 
>>  Combine MT6795 pin controller document into MT6779 one. In the
>>  process, amend the example with comments and additional pinctrl
>>  nodes from the MT6795 example, replace the current interrupts
>>  property description with the one from the MT6795 document since
>>  it makes more sense and define its items using conditionals
>>  as they now vary between variants. Also use conditionals to define
>>  valid values for the drive-strength property for each variant.
>> 
>>  Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>  ---
>>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 189 ++++++++++-----
>>   .../pinctrl/mediatek,pinctrl-mt6795.yaml      | 227 
>> ------------------
>>   2 files changed, 127 insertions(+), 289 deletions(-)
>>   delete mode 100644 
>> Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
>> 
>>  diff --git 
>> a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml 
>> b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>>  index 70e4ffa2d897..6f2cffe50b11 100644
>>  --- 
>> a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>>  +++ 
>> b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>>  @@ -8,6 +8,7 @@ title: Mediatek MT6779 Pin Controller
>> 
>>   maintainers:
>>     - Andy Teng <andy.teng@mediatek.com>
>>  +  - AngeloGioacchino Del Regno 
>> <angelogioacchino.delregno@collabora.com>
>>     - Sean Wang <sean.wang@kernel.org>
>> 
>>   description:
>>  @@ -18,6 +19,7 @@ properties:
>>     compatible:
>>       enum:
>>         - mediatek,mt6779-pinctrl
>>  +      - mediatek,mt6795-pinctrl
>>         - mediatek,mt6797-pinctrl
>> 
>>     reg:
>>  @@ -43,9 +45,7 @@ properties:
>>     interrupt-controller: true
>> 
>>     interrupts:
>>  -    maxItems: 1
> 
> Leave the constraints.
> 
> Why? Because now you dropped it for mt6797... You bring here some 
> random
> changes and it is difficult to review it.

Fair point. I'll undo this.

I was thinking that MT6797 doesn't take any interrupts at the moment, 
but I'm certain the hardware does in fact have interrupts, so leaving 
the constraint should both keep the bindings more accurate and reduce 
the DT compatibility breakage when someone implements interrupts later.

> 
>>  -    description: |
>>  -      Specifies the summary IRQ.
>>  +    description: Interrupt outputs to the system interrupt 
>> controller (sysirq).
>> 
>>     "#interrupt-cells":
>>       const: 2
>>  @@ -57,59 +57,6 @@ required:
>>     - gpio-controller
>>     - "#gpio-cells"
>> 
>>  -allOf:
>>  -  - $ref: "pinctrl.yaml#"
>>  -  - if:
>>  -      properties:
> 
> Make the move of this hunk in your description cleanup patch. Don't 
> mix
> functional changes and some cleanups.

The idea was that drive-strength was to be defined first then have its 
constraints set in the conditionals, so I moved this below the 
patternProperties block to accomplish that. Now I'm thinking of putting 
it here to begin with so that I wouldn't need to move it in this patch. 
What do you think?

>>  -        compatible:
>>  -          contains:
>>  -            const: mediatek,mt6779-pinctrl
>>  -    then:
>>  -      properties:
>>  -        reg:
>>  -          minItems: 9
>>  -          maxItems: 9
>>  -
>>  -        reg-names:
>>  -          items:
>>  -            - const: gpio
>>  -            - const: iocfg_rm
>>  -            - const: iocfg_br
>>  -            - const: iocfg_lm
>>  -            - const: iocfg_lb
>>  -            - const: iocfg_rt
>>  -            - const: iocfg_lt
>>  -            - const: iocfg_tl
>>  -            - const: eint
>>  -  - if:
>>  -      properties:
>>  -        compatible:
>>  -          contains:
>>  -            const: mediatek,mt6797-pinctrl
>>  -    then:
>>  -      properties:
>>  -        reg:
>>  -          minItems: 5
>>  -          maxItems: 5
>>  -
>>  -        reg-names:
>>  -          items:
>>  -            - const: gpio
>>  -            - const: iocfgl
>>  -            - const: iocfgb
>>  -            - const: iocfgr
>>  -            - const: iocfgt
>>  -  - if:
>>  -      properties:
>>  -        reg-names:
>>  -          contains:
>>  -            const: eint
>>  -    then:
>>  -      required:
>>  -        - interrupts
>>  -        - interrupt-controller
>>  -        - "#interrupt-cells"
>>  -
>>   patternProperties:
>>     '-pins$':
>>       type: object
>>  @@ -169,8 +116,7 @@ patternProperties:
>> 
>>             input-schmitt-disable: true
>> 
>>  -          drive-strength:
>>  -            enum: [2, 4, 8, 12, 16]
>>  +          drive-strength: true
>> 
>>             slew-rate:
>>               enum: [0, 1]
>>  @@ -202,6 +148,110 @@ patternProperties:
>> 
>>           additionalProperties: false
>> 
>>  +allOf:
>>  +  - $ref: "pinctrl.yaml#"
>>  +  - if:
>>  +      properties:
>>  +        compatible:
>>  +          contains:
>>  +            const: mediatek,mt6779-pinctrl
>>  +    then:
>>  +      properties:
>>  +        reg:
>>  +          minItems: 9
>>  +          maxItems: 9
>>  +
>>  +        reg-names:
>>  +          items:
>>  +            - const: gpio
>>  +            - const: iocfg_rm
>>  +            - const: iocfg_br
>>  +            - const: iocfg_lm
>>  +            - const: iocfg_lb
>>  +            - const: iocfg_rt
>>  +            - const: iocfg_lt
>>  +            - const: iocfg_tl
>>  +            - const: eint
>>  +
>>  +        interrupts:
>>  +          items:
>>  +            - description: EINT interrupt
>>  +
>>  +      patternProperties:
>>  +        '-pins$':
>>  +          patternProperties:
>>  +            '^pins':
>>  +              properties:
>>  +                drive-strength:
>>  +                  enum: [2, 4, 8, 12, 16]
>>  +
>>  +  - if:
>>  +      properties:
>>  +        compatible:
>>  +          contains:
>>  +            const: mediatek,mt6795-pinctrl
>>  +    then:
>>  +      properties:
>>  +        reg:
>>  +          minItems: 2
>>  +          maxItems: 2
>>  +
>>  +        reg-names:
>>  +          items:
>>  +            - const: base
>>  +            - const: eint
>>  +
>>  +        interrupts:
>>  +          items:
>>  +            - description: EINT interrupt
>>  +            - description: EINT event_b interrupt
>>  +
>>  +      patternProperties:
>>  +        '-pins$':
>>  +          patternProperties:
>>  +            '^pins':
>>  +              properties:
>>  +                drive-strength:
>>  +                  enum: [2, 4, 6, 8, 10, 12, 14, 16]
>>  +
>>  +  - if:
>>  +      properties:
>>  +        compatible:
>>  +          contains:
>>  +            const: mediatek,mt6797-pinctrl
>>  +    then:
>>  +      properties:
>>  +        reg:
>>  +          minItems: 5
>>  +          maxItems: 5
>>  +
>>  +        reg-names:
>>  +          items:
>>  +            - const: gpio
>>  +            - const: iocfgl
>>  +            - const: iocfgb
>>  +            - const: iocfgr
>>  +            - const: iocfgt
>>  +
>>  +      patternProperties:
>>  +        '-pins$':
>>  +          patternProperties:
>>  +            '^pins':
>>  +              properties:
>>  +                drive-strength:
>>  +                  enum: [2, 4, 8, 12, 16]
>>  +
>>  +  - if:
>>  +      properties:
>>  +        reg-names:
>>  +          contains:
>>  +            const: eint
>>  +    then:
>>  +      required:
>>  +        - interrupts
>>  +        - interrupt-controller
>>  +        - "#interrupt-cells"
>>  +
>>   additionalProperties: false
>> 
>>   examples:
>>  @@ -237,8 +287,9 @@ examples:
>>               #interrupt-cells = <2>;
>>               interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
>> 
>>  -            mmc0_pins_default: mmc0-0 {
>>  -                cmd-dat-pins {
> 
> How this is related to the patch?
> 
> Organize the patches so they are easy for review.

Sorry, this was meant to be in the previous patch that changed the 
subnode name patterns. I'll move it there for the next revision.

Thanks,
Yassine




