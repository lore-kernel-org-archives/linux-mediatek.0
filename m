Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9154C3A5A7
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tR+f/+3nybjrz985QuJTlkfFuvKyHlsK8G2EHEYD21M=; b=VcSJONYBQ69yGzQ9Qm/RfjnUuV
	FhCoQDlkc2PV9NXGhk2fCbGiY8yylYwapLrHIrKhkQEiIOQadQXyoEtAtj4PuMtWAESj0xZekM6Bm
	ems3z2rQuCUNtTIsLaVhJWsqKvKfijGhKsWWeU9m5JJIB6CsjEApIiRUun20Rheb44PxiEFBNgsa1
	amkLCnU0vuBhQqfqWX3zo6TXeDDacluxfffYkxXdT+oJH7leBVTliV+uelxKAbkVRODTTOutX2eNg
	//k2hGyUkZnJ+wQULhmHq3k0PytfTLPQzy5uqr1SDIGt3y43hwYQY2+TgjWzqlZwLSis64wZZo8lJ
	k/CxEwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DVW-00BCP6-6s; Thu, 08 Dec 2022 09:47:58 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DS3-00B8ZS-9r
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 09:44:25 +0000
Received: by mail-lf1-x129.google.com with SMTP id bp15so1166068lfb.13
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Dec 2022 01:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tR+f/+3nybjrz985QuJTlkfFuvKyHlsK8G2EHEYD21M=;
        b=NvP+hneTcrJLq5aKAbWBlzRJJD/2srJe9IAT/Pq2hUX9OAuJ1vz01KfcttkSjfGWq6
         MkVQq1uw8kaTQSnVB8uX4rSsEPLC1n/PxH/go/ginVJgW0kAhDGkoNoRs1nCQHSk4/ck
         94ktgccj6TDjOHMk+TlN+wvvuCtzqnhdW7+fA1IExI/sPZyyW9qQ4IwDE45IaqKWgC1L
         fz0+PgDy6EuN18RY7i+dTcRX5m1e/rFaC7S5djIFlmkXMFDMfb3lBRwtf1W/F9Vre7Gh
         5Y9A7wMqnRq2lIyDogonPN6I6vu4NSaPH0jxR54Lwuur/QSXC6XPAOQghUC7UTeLNFms
         ZW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tR+f/+3nybjrz985QuJTlkfFuvKyHlsK8G2EHEYD21M=;
        b=0Qnu5U5skZI+Q8XLKQbEx2p+tNlnum0T8UFYN1sa04QOQLh9hJVP45n195YuIqmkpV
         E66YksF/rR/hH5PuDIDLTEOWPCaZ4K7V4DvI/7ULQcHfiPbxL8PQwjUVppnAhAqhcIMv
         mb+meexCEJhlFEAKCBl0jajNW+F1SPl/7ut9CqPmsqDqKbh6MN85r3VBOrJmlYjPj6+H
         Iv7+TQdJ49PXZUc4x/Iecabn6yfTp0r0BiviCsIdB60z8RuC+E80htCCnqAp+1oJthoG
         fxqA9+G2KCtG9gb6Plu6UBXIJTxKzQy73/N8FGxaiXNGbWSgS2M3/b1T8uXh+LZoG7YU
         QZFg==
X-Gm-Message-State: ANoB5pmTa/NLnq++yaD/zuJk0ivuvap0fb1YQqRm1usbMqIZx2J4pIt/
	Gb6+G5gY5tFH667G2J11HEu9aA==
X-Google-Smtp-Source: AA0mqf77vkoDAk7e+na4oDIjnlgURFAAvORsW7EKDtnaXGZNkHzBFx7iahF6vIP8MxlwXav31qtCag==
X-Received: by 2002:a05:6512:31c5:b0:4a2:3ca7:3a44 with SMTP id j5-20020a05651231c500b004a23ca73a44mr26614010lfe.23.1670492659337;
        Thu, 08 Dec 2022 01:44:19 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d23-20020a194f17000000b0049482adb3basm3257906lfb.63.2022.12.08.01.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 01:44:18 -0800 (PST)
Message-ID: <fe70d964-229a-8bda-a414-e009dd955e5e@linaro.org>
Date: Thu, 8 Dec 2022 10:44:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 7/9] dt-bindings: mtd: Split ECC engine with rawnand
 controller
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221208062955.2546-1-xiangsheng.hou@mediatek.com>
 <20221208062955.2546-8-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208062955.2546-8-xiangsheng.hou@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_014423_372342_FBB4F983 
X-CRM114-Status: GOOD (  16.67  )
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

On 08/12/2022 07:29, Xiangsheng Hou wrote:
> Split MediaTek ECC engine with rawnand controller and convert to
> YAML schema.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>  .../bindings/mtd/mediatek,mtk-nfc.yaml        | 154 +++++++++++++++
>  .../mtd/mediatek,nand-ecc-engine.yaml         |  62 ++++++
>  .../devicetree/bindings/mtd/mtk-nand.txt      | 176 ------------------
>  3 files changed, 216 insertions(+), 176 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
>  create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
> new file mode 100644
> index 000000000000..eb1a44c7ae4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek(MTK) SoCs raw NAND FLASH controller (NFC)
> +
> +maintainers:
> +  - Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-nfc
> +      - mediatek,mt2712-nfc
> +      - mediatek,mt7622-nfc
> +
> +  reg:
> +    items:
> +      - description: Base physical address and size of NFI.
> +
> +  interrupts:
> +    items:
> +      - description: NFI interrupt
> +
> +  clocks:
> +    items:
> +      - description: clock used for the controller
> +      - description: clock used for the pad
> +
> +  clock-names:
> +    items:
> +      - const: nfi_clk
> +      - const: pad_clk
> +
> +  ecc-engine:
> +    description: device-tree node of the required ECC engine.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +patternProperties:
> +  "^nand@[a-f0-9]$":
> +    type: object

This should be instead:
    $ref: nand-chip.yaml#
    unevaluatedProperties: false

and then properties below (due to current dtschema limitations) should
list properties from nand-controller.yaml:

      nand-on-flash-bbt: true

Optionally, we could create additional schema - nand-controller-chip,
which would be referenced directly by nand-controller and itself would
ref nand-chip.

> +    properties:
> +      reg:
> +        minimum: 0

no need, 0 is the minimum.

> +        maximum: 1
> +      nand-ecc-mode:
> +        const: hw
> +
> +allOf:
> +  - $ref: nand-controller.yaml#
> +
> +  - if:

Best regards,
Krzysztof


