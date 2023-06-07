Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BFDC7EE29
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 07:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHNOb3Vak93SE79cjJtlUcImdmBQ6YeOYklhRG0qb4M=; b=Of1Af/XUb711xNP4tX3/YE9nnU
	siagroYylNmtIMWlOJkLx8QaZYL7FNEtOv0Fs5N5SWnuBWH72eXJmJAd/v83YGEwRZ2STGMuC/bF9
	/6yecp9LqydOumL/LvA0pKmrlMYKrc9+4iai0oMyiGDfy+ZNcW/uq88b4MntedoHN6sIyNHoyeCjA
	egu3KC4YRajRgrqMUexbrtRY89CVpzByAy+k49y1yfoqKSaqnX8vB+zVye3KbZUsxG1EiCp1JT+YR
	dvdYGQ8sChgpI+RWkKIiuILlrMlZIVlJxMFioLs6Q9AsZFQxw811S1CHqMQYgsof32uzLzMVmT+eE
	6BJpyvUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nYm-004jLh-1H;
	Wed, 07 Jun 2023 07:26:24 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nYj-004jJG-0K
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jun 2023 07:26:22 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5149c76f4dbso912912a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jun 2023 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686122773; x=1688714773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AHNOb3Vak93SE79cjJtlUcImdmBQ6YeOYklhRG0qb4M=;
        b=YNNQbQZQPVdSzi20TxjAyRhsARcaBBpmpqvxoW15cjkG9qq/R+1RdWi++Z4I0q1RW/
         GuoElk2FOp7isnbZVtUv7gf67LAQQHodGe2aCu8Kb9Q2mAz8Mdl66eX4rNmA/CLg1R5i
         j2BbfjMBXFC2Ml4Q0crymEKqBcJZ5e/sEkyGBNXJZ8gG4Z08JvTthjsxyvZ6NIpkYlav
         tJ3ahH3JuWr+wBtmp6ze2+gBFCMFtUHgUSVpYqCClUlLgcxgZoccM7sTKlLeLK6rJy0w
         6cgHrK1GwuyfNvvHcDYBgGwEAPDzyBfb5a0msjkqQdEavjjho5b8SOI6I3OvXJIO/mV4
         dW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686122773; x=1688714773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AHNOb3Vak93SE79cjJtlUcImdmBQ6YeOYklhRG0qb4M=;
        b=IoJZAZYIykJzEC6pQ9mMCE4YgB3n+HkKxVHWdnjYYFFWYA7rGsAnCJEXljaUg9ls00
         ypxUu1ye9shnShXBTkoV3rmdJcOgEnd1rse7oATghfXlnLTLUNHNh2DeOrzLmkTNQnm1
         lQ+a9fPukDMbyDgd67upDg+dvd8zhnnGs9pw1GNZSzbkqgUYCfn22RcpRR7GyDyDx2/m
         yfy3xexCfL+2FPS7tBSrxMZus7fv9s03SkjFIWEgxgIcCTQlTuZbpJVzwvwmyauK3ONl
         p0J7QX8wsY1vaYLhgbNEwT1+ogcEL7RKnvlA8EnNWZR5NiGxR8Xu1Ll+yYAPDq1l0hiM
         +sMA==
X-Gm-Message-State: AC+VfDzdxtUdtKgqnO76JoPCMr1ptw6ggd/CHCYiSPir0GcxjBIp+5Ht
	uwhMwF4yuqUGu5fMkjSUMvZLxA==
X-Google-Smtp-Source: ACHHUZ7xto1maHENeeGyjFEyLu5CAnG9dDPtJTkn0FmqIdA0AISmTQj25UoPyUB1ADeQrSC57nno+A==
X-Received: by 2002:a05:6402:337:b0:514:a5fe:b304 with SMTP id q23-20020a056402033700b00514a5feb304mr4183702edw.38.1686122773327;
        Wed, 07 Jun 2023 00:26:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z15-20020aa7d40f000000b00514b2a9ce60sm5814096edq.81.2023.06.07.00.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 00:26:12 -0700 (PDT)
Message-ID: <85713602-dfe1-c90b-174b-3678d91369aa@linaro.org>
Date: Wed, 7 Jun 2023 09:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1 1/6] dt-bindings: display/mediatek: mt8188: Add
 documentations for VDOSYS1
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>, Fei Shao <fshao@google.com>
References: <20230607061121.6732-1-shawn.sung@mediatek.com>
 <20230607061121.6732-2-shawn.sung@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607061121.6732-2-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_002621_148451_D67C9210 
X-CRM114-Status: GOOD (  16.45  )
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

On 07/06/2023 08:11, Hsiao Chien Sung wrote:
> Add device tree documentations for MT8188 VDOSYS1.

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
> new file mode 100644
> index 000000000000..8a9e74cbf6dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,padding.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek PADDING
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description:
> +  MediaTek PADDING provides ability to VDOSYS1 to fill pixels to
> +  width and height of a layer with a specified color.
> +  Since MIXER in VDOSYS1 requires the width of a layer to be 2-pixel-align, or
> +  4-pixel-align when ETHDR is enabled, we need PADDING to deal with odd width.
> +  Please notice that even if the PADDING is in bypass mode,
> +  settings in the registers must be cleared to 0, otherwise
> +  undeinfed behaviors could happen.

Typo, undefined

> +



> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - clocks
> +  - mediatek,gce-client-reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8188-clk.h>
> +    #include <dt-bindings/power/mt8188-power.h>
> +    #include <dt-bindings/gce/mt8188-gce.h>
> +    #include <dt-bindings/memory/mt8188-memory-port.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        vdo1_padding0: vdo1_padding0@1c11d000 {

No underscores in node names.

Node names should be generic. See also explanation and list of examples
in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +            compatible = "mediatek,mt8188-vdo1-padding";
> +            reg = <0 0x1c11d000 0 0x1000>;
> +            clocks = <&vdosys1 CLK_VDO1_PADDING0>;
> +            power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
> +            mediatek,gce-client-reg =
> +                <&gce0 SUBSYS_1c11XXXX 0xd000 0x1000>;

Wrong wrapping. It's one line. Properties should not be wrapped after '='.


Best regards,
Krzysztof


