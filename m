Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A95EC3A5A7
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 10:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08K5Vlx4IB2Dsl4MLI7dMUqa7FCe1uwxxccMSj5m7Jc=; b=Gtrb/zo9jKMGNscyAzmijfbUOK
	l3SZY/D91tOh4NCKpzlNCCQ1+/4V71iJmMX9K2G5oyOi2paELRpkfjQ8UnZm+4q5uilktlJtBlp9e
	vjLs4QTi/rhq2/A84Zu6WWIyesdVWff4r2MsGbsTQ44zzSB9ugWfk8nB8/yu15g3NzF7d9ZAnYSQC
	YD6LUhmW/PlZzZU+LYlQC1Cyn9n1T8Z5gKxieIuZV3oZ/NXA612t24LoHJtmYYiyoHAKihYhoEQU8
	OvKkF+7FG+hGLNfCDCe1Ls6FPFj61KZovVncuDqOd7Wodc4MfeJJ3ko8LYyDq1LT4bk30lbZ9riNX
	5Kyq6HKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3E7u-00CTmu-Rq; Thu, 08 Dec 2022 10:27:38 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3E7o-00CTSz-2i
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 10:27:35 +0000
Received: by mail-lf1-x12e.google.com with SMTP id s8so1349423lfc.8
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Dec 2022 02:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=08K5Vlx4IB2Dsl4MLI7dMUqa7FCe1uwxxccMSj5m7Jc=;
        b=IixV+1uuN0bY/bbX/+N1Lj3Yzho/GsLoaPm65A55jNVZnGBKdqqPJHjimnAVhl56jG
         KkHyze5xgI+sqQzAHIwAnyBQlnetfyzeAarswqTTSMXXcJNiQTtHWLlyr2HKy6RJHB3z
         ftbwsIEMBQHSadpP1Bt5ZwTO7fLPQ6u61hiDiuROWH4cjz5jlPIxKlw8V2u6uH5Ao8X6
         ghDfPPV54N7yzq3bpv7U8lCMbuW1HOhxWsVQ661f4FCHJfSLxQzRaiJTq2EIx/m89PDH
         15wEdAs1fzHM+kIxmA0U77aUjmrFCD3ZXlg68lUD2GXnrrxUfb7cp6sY2zmfuaNILclm
         Db6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08K5Vlx4IB2Dsl4MLI7dMUqa7FCe1uwxxccMSj5m7Jc=;
        b=UJ215fiCCuChdFzPXItEKC5s5sauEYEp3NGCKXx6L8/lpOCWJEpu2K2dS+mED0IrPg
         UcHd9w0A0B+/5JC7OB86f+hYzFN3/DWv/k+phAf9LPkX60GHjXkg0LJUmlHnqUZGIPdg
         SjejfWd8as1zglWAio4878nwUrFtTt8rv2tfPb6gfKkVGPhMM9LswydysJT7JLfEu+Pw
         01lKWdSPlx7Gv1k9TA87KKQ8JeyEg6L9OmF0HiMvRCgpL0+DzGtFcZa6rYiXwmHbOiRY
         /QghaFmT0CvQrFnVv240mAN3HNLOU+YDHOMz8akWkivpRWwrnlMrg7Xpm+VK+qTy1Ob7
         7VyA==
X-Gm-Message-State: ANoB5plToD6A7FNwbd/XzbdB5PonFCr1gC4r0gmshr5vvDXXJCbOrE7b
	1CK8F4DhJ+LdEySmbSDKKTxK8Q==
X-Google-Smtp-Source: AA0mqf7/AP5zYXuEc0m0ov+YEb0CvMKWc7CDgcN+N/jX1BqZ0D2ehR+bjn3ZqxsyUTZwP+wrkY7e3w==
X-Received: by 2002:a05:6512:c29:b0:4b1:b061:4815 with SMTP id z41-20020a0565120c2900b004b1b0614815mr30077826lfu.18.1670495249722;
        Thu, 08 Dec 2022 02:27:29 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v7-20020ac25927000000b0048a982ad0a8sm3304728lfi.23.2022.12.08.02.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 02:27:29 -0800 (PST)
Message-ID: <f3e3a3d0-6d21-c782-38a2-c8b2c36242c3@linaro.org>
Date: Thu, 8 Dec 2022 11:27:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 7/9] dt-bindings: mtd: Split ECC engine with rawnand
 controller
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221208062955.2546-1-xiangsheng.hou@mediatek.com>
 <20221208062955.2546-8-xiangsheng.hou@mediatek.com>
 <fe70d964-229a-8bda-a414-e009dd955e5e@linaro.org>
 <20221208110035.5649a051@xps-13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208110035.5649a051@xps-13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_022732_170419_CDF63C3F 
X-CRM114-Status: GOOD (  16.97  )
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

On 08/12/2022 11:00, Miquel Raynal wrote:
> Hi Krzysztof,
> 
> krzysztof.kozlowski@linaro.org wrote on Thu, 8 Dec 2022 10:44:17 +0100:
> 
>> On 08/12/2022 07:29, Xiangsheng Hou wrote:
>>> Split MediaTek ECC engine with rawnand controller and convert to
>>> YAML schema.
>>>
>>> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
>>> ---
>>>  .../bindings/mtd/mediatek,mtk-nfc.yaml        | 154 +++++++++++++++
>>>  .../mtd/mediatek,nand-ecc-engine.yaml         |  62 ++++++
>>>  .../devicetree/bindings/mtd/mtk-nand.txt      | 176 ------------------
>>>  3 files changed, 216 insertions(+), 176 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
>>>  create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml
>>>  delete mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
>>> new file mode 100644
>>> index 000000000000..eb1a44c7ae4e
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
>>> @@ -0,0 +1,154 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek(MTK) SoCs raw NAND FLASH controller (NFC)
>>> +
>>> +maintainers:
>>> +  - Xiangsheng Hou <xiangsheng.hou@mediatek.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - mediatek,mt2701-nfc
>>> +      - mediatek,mt2712-nfc
>>> +      - mediatek,mt7622-nfc
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: Base physical address and size of NFI.
>>> +
>>> +  interrupts:
>>> +    items:
>>> +      - description: NFI interrupt
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: clock used for the controller
>>> +      - description: clock used for the pad
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: nfi_clk
>>> +      - const: pad_clk
>>> +
>>> +  ecc-engine:
>>> +    description: device-tree node of the required ECC engine.
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +
>>> +patternProperties:
>>> +  "^nand@[a-f0-9]$":
>>> +    type: object  
>>
>> This should be instead:
>>     $ref: nand-chip.yaml#
>>     unevaluatedProperties: false
>>
>> and then properties below (due to current dtschema limitations) should
>> list properties from nand-controller.yaml:
>>
>>       nand-on-flash-bbt: true
>>
>> Optionally, we could create additional schema - nand-controller-chip,
>> which would be referenced directly by nand-controller and itself would
>> ref nand-chip.
> 
> Isn't this enough? (in linux-next)
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/Documentation/devicetree/bindings/mtd/nand-controller.yaml?h=mtd/next#n54

No, I tested it and it does not work as intended. In this particular
case. I think this is a limitation of dtschema, because binding itself
looks fine. The problem is that you have:
1. mtk-nfc having nand@ children. mtk-nfc references nand-controller
which brings these children.
2. However nand-controller while bringing these children does two things:
a. ref: nand-chip
b. add more propeties

3. The mtk-nfc must further extend the nand@ child.
4. If you add "unevaluatedProperties: false" you notice warnings of
unevaluated propertie from nand-controller children.

Best regards,
Krzysztof


