Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A28EC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 06:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhbji4Tk5WgVjJes/0kJR9R4EHcIP/DlEhuECb0MLiw=; b=KimWrKxhP0KoQtES6zTt1PBC2Y
	A2yoIQcrtMs6PrMHhvOcqXAo1QsyOwoWe0iEYyVcKnFvCb0aCZC7BZNetfY8BZ0CBAZizpWmRUfaK
	4m5yipybfKByXQirBnwbVwnIYvaadTYCCQey6lShqft9l7qHPidzVc7FI9M2U+Nz4VWp5DylmiIhK
	9cwh+O5eQxYxpRCuhSWIG/ws3RbtUs7pE3G4NK+oPDBwj465jjnQ9Xi7k0fh7ljm4ulBg+7VXsLS2
	w666P0ODkeIw2/cWsWLUd3CrtcqcuFbRGAuyhpfV4//Niuz2TwSXD+Bxhe8xfQ5nS3+kLVzNHGtQC
	Vp/WBVrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oat7h-009GHz-0k; Wed, 21 Sep 2022 06:22:17 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oat7d-009GEe-8U
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 06:22:14 +0000
Received: by mail-lj1-x233.google.com with SMTP id z20so5755823ljq.3
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Sep 2022 23:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=zhbji4Tk5WgVjJes/0kJR9R4EHcIP/DlEhuECb0MLiw=;
        b=U/lGPjq45+f+pnGj85u3/K4MSbowoXW2vz165u8utJHyE4IzAQ2qMLirrddp3tGAnr
         N2Hlw2qJ+VsDZCHNnY8b3zi9G/riJKnCnJkPr0KChrOG3Gahbzklv+h6nYE2oqYEREeP
         l9ROfJDLEtw6tyUm1AlYdnXslm6tHRq6wearprJuq12huaqkQWu26f/QxidtNBT3uyW7
         7EtGoIz5ll7codDIZbr6ttmoxa6w8JrxwUtGE4NXy0UL+w26TMmpcOq69XA0U0bNd55c
         HEu9oKX1dL5ChCRhO1QUzmBrWXWrY2H4Kahz35rIIKG+4jljJFxxu5jJsHMHAdYl3p01
         tIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zhbji4Tk5WgVjJes/0kJR9R4EHcIP/DlEhuECb0MLiw=;
        b=lTIhM/Sh4x8xOx+6rEiwFPbrGYR/l3ZaEWuFcoKnv/LsVGsItP8x1faleZQcUvKCAD
         HIS8/SuFpQakhmVu8nS+V5HpUMVMKFnTeuo/xEPN23R9uAWoGa/8L/13oMdcmRr7Oc2B
         SiSw4nfLZ2b1qmic8yqIbv1SQxtBKNRY9kwwnqcIYEWAtpFjLrzZQq1Irhjx9I8TF5sm
         HlpCWYIaZ23NwGCzTf6jQgV60AtfxsP1fzzs06PAZrFP9M0lC/vPWkvb8ynGn76onEnk
         4lJQ5NKWmUU31I8pyslCGZsYlvVy4mMSvENDFVrwMKHdRxck18wtpHQ98qkHOB0PBRoC
         omqA==
X-Gm-Message-State: ACrzQf3TkjbV8ITOExU/mO1rpb8H7Ibl6dLkosHB2NcLzR9yhkRzC6xa
	p2fk4YtMKTXUZN+n1gscu9o03A==
X-Google-Smtp-Source: AMsMyM4KDygZsCooVsICpXJbWHSpyCrr/E4Y0qSWrXdfaJi52JVI1jr/vzt5chRv+/jSZgC9/karqQ==
X-Received: by 2002:a2e:a791:0:b0:26c:4fad:957 with SMTP id c17-20020a2ea791000000b0026c4fad0957mr4375664ljf.263.1663741328708;
        Tue, 20 Sep 2022 23:22:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b3-20020a056512070300b00498f51af149sm284354lfs.308.2022.09.20.23.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 23:22:08 -0700 (PDT)
Message-ID: <2073b6bd-a4bd-4ab5-300d-2ce989e25d5f@linaro.org>
Date: Wed, 21 Sep 2022 08:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v9,2/7] dt-bindings: thermal: Add dt-binding document for
 LVTS thermal controllers
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
 amitk@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220817080757.352021-1-bchihi@baylibre.com>
 <20220817080757.352021-3-bchihi@baylibre.com>
 <716d6471-f0e2-489e-5f9e-9e38e9e7953a@collabora.com>
 <CAGuA+orxfcycwcUMpLe+dkjnXPQkELQsz0vBggGKTQ04XRGc+g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGuA+orxfcycwcUMpLe+dkjnXPQkELQsz0vBggGKTQ04XRGc+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_232213_369177_6719F42B 
X-CRM114-Status: GOOD (  10.70  )
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

On 14/09/2022 16:01, Balsam CHIHI wrote:
> Hi Angelo,
> 
> I've got the following errors after implementing these changes :
> [...]
>   nvmem-cells:
>     minItems: 1
>     description: Calibration eFuse data for LVTS
> 
>   nvmem-cell-names:
>     minItems: 1
>     items:
>       pattern: 'lvts-calib-data[0-9]+$'
> 
>   "#thermal-sensor-cells":
>     const: 1
> 
> allOf:
>   - $ref: thermal-sensor.yaml#
> 
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - mediatek,mt8192-lvts-ap
>               - mediatek,mt8192-lvts-mcu
>     then:
>       properties:
>         nvmem-cells:
>           maxItems: 1
> 
>         nvmem-cell-names:
>           maxItems: 1
> 
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - mediatek,mt8195-lvts-ap
>               - mediatek,mt8195-lvts-mcu
>     then:
>       properties:
>         nvmem-cells:
>           maxItems: 2
> 
>         nvmem-cell-names:
>           maxItems: 2
> [...]
> 
> $ make DT_CHECKER_FLAGS=-m dt_binding_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
>   LINT    Documentation/devicetree/bindings
>   CHKDT   Documentation/devicetree/bindings/processed-schema.json
> /home/balsam/src/linux-mtk-lvts-newThermalOF/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml:
> properties:nvmem-cell-names:items: {'pattern':
> 'lvts-calib-data[0-9]+$'} is not of type 'array'
> from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> /home/balsam/src/linux-mtk-lvts-newThermalOF/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml:
> ignoring, error in schema: properties: nvmem-cell-names: items
>   DTEX    Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.example.dts
>   DTC     Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.example.dtb
>   CHECK   Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.example.dtb
> Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.example.dtb:0:0:
> /example-0/soc/thermal-sensor@1100b000: failed to match any schema
> with compatible: ['mediatek,mt8192-lvts-ap']
> 
> am I missing something?

Maybe maxItems: 2 in top-level property?


Best regards,
Krzysztof

