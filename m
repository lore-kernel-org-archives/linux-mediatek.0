Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572A4C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 07:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=suvCg2Qx7+IA1xS6G6IqJXKDDlXAk9D/5oA3+6/FWbI=; b=ZA6PNkB53mkwbF
	obxatExCAWdtIA/C3FLxEteM/8/XpASqkODcN0GRQnqZo+D3eziI4IOzAZcFDfKk7OhxWdCT4203U
	v9PSED/CxUKid0olw3eo0dU/qzmMsqHntnTiNcsC83qee+aQQzjRvVcpOpJFlHKgmPfxkT2nQbSqE
	/w83xaUUFyC8ktPgaEkr8TD7t5bGIj9iZKcsNTCPspFU21VUdM5mr74JHPjxVw7SN0iJ3CdQ5UgwP
	npAZoF1pc+JEzwarTPNHbBKvJjIBSqedqPTW0n5hbDCcbXb6OPFYqk2QYsVaHajRNv9QQ7IvuKZyu
	dLW24uBM1OcrK3QFf6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnxvN-00Csu5-7J; Mon, 09 May 2022 07:35:21 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnxvC-00Csqd-9J
 for linux-mediatek@lists.infradead.org; Mon, 09 May 2022 07:35:12 +0000
Received: by mail-ed1-x52b.google.com with SMTP id p4so15241912edx.0
 for <linux-mediatek@lists.infradead.org>; Mon, 09 May 2022 00:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6jbURD8Ey2jd/vwDhR1u6Z9PNW187Y1F9ebai4/UsoU=;
 b=L74itdn5Wcx/56Pz2s1h8uLsLuSZhFw0Z98BIInddU6cGZRn0/kl5pwPoWyNvnhm3m
 vwVUWJsUGJwVSsy3ob82PnHB7WVgTowC/+TDjuzwyPXHjePgr6qadNIXDCVt4n5EVaLm
 T3uXj/kmBzdJVjy63+STw5j3OHd/7srnA4DBs5c7ZaDYu8+onYOveOpqfCnWFWbsiJKG
 mMsxNmwWouQpVZAW19AkVU/nMrve3qEtgUrZ1nNoJ6D+TgaBl1gy+pCmlN8ym7fqYauY
 pkKrNO7RaXfR7qCTju5FKt4YSAZbD0t8/wEM5fAybnXyGljplV5MWNrPUtkvmboeIorO
 v0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6jbURD8Ey2jd/vwDhR1u6Z9PNW187Y1F9ebai4/UsoU=;
 b=QnVPcERPfI/9Vgrb1Mb+NG3/E7J24vbqGJKLDC6AzeGOPunAJeKBHS4rqlavb3qdkd
 ATWhn4c5FzDurysTBYvQk6lU3nPkXd9uno2OPvwihFV7ZytsGB0v6i2wpQEr67uuuHwE
 46iErTxE02pOLhrpY0MW2SAnSo3stga2vqeeV24VHL8n3RU0xDWKs7upU+rGKsR6gzzY
 Nq36+m0Dq4dKJK5MnKFwJx6DTGtx23y/0ROc7v9AAdvj+jDAb/rdV/KkVuHNeA9E2FWE
 +L0wdn5PDHZy8/NT91zv6i1gP/r/IRDgT9NsF0SHV7atjwRcW9B/DpEl7aYnA7SrcL1a
 ehpA==
X-Gm-Message-State: AOAM530tJihzlQ/2aqwnIVpQlWG8Ya/bazSXDWu/To4lBT9lXkviDgYC
 rXdIift1fQQufJyUKdl90mqIJg==
X-Google-Smtp-Source: ABdhPJzYO8cmNC9uBKCClx5X3DrATjSonDW6UXPxBkrSLm3jIm2wX91BBa+d8YB3/zGFnWnOLUhhZA==
X-Received: by 2002:aa7:d416:0:b0:425:f5c7:d633 with SMTP id
 z22-20020aa7d416000000b00425f5c7d633mr15808452edq.105.1652081708825; 
 Mon, 09 May 2022 00:35:08 -0700 (PDT)
Received: from [192.168.0.242] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ze11-20020a170906ef8b00b006f3ef214e43sm4773108ejb.169.2022.05.09.00.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 00:35:08 -0700 (PDT)
Message-ID: <46bc32df-e4e8-ac47-426d-8056714f0d5c@linaro.org>
Date: Mon, 9 May 2022 09:35:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de
Cc: airlied@linux.ie, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
 nancy.lin@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-4-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220509044302.27878-4-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_003510_410039_002D73F8 
X-CRM114-Status: GOOD (  23.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 09/05/2022 06:43, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 ETHDR definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,ethdr.yaml      | 191 ++++++++++++++++++
>  1 file changed, 191 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
> new file mode 100644
> index 000000000000..65f22fba9fed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
> @@ -0,0 +1,191 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,ethdr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Ethdr Device Tree Bindings

s/Device Tree Bindings//

You need to add some description of a device. What is a Ethdr?

> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description:
> +  ETHDR is designed for HDR video and graphics conversion in the external display path.
> +  It handles multiple HDR input types and performs tone mapping, color space/color
> +  format conversion, and then combine different layers, output the required HDR or
> +  SDR signal to the subsequent display path. This engine is composed of two video
> +  frontends, two graphic frontends, one video backend and a mixer. ETHDR has two
> +  DMA function blocks, DS and ADL. These two function blocks read the pre-programmed
> +  registers from DRAM and set them to HW in the v-blanking period.

Block does not look like wrapped at 80.

> +
> +properties:
> +  compatible:
> +    items:

One item, so no items.

> +      - const: mediatek,mt8195-disp-ethdr
> +
> +  reg:
> +    maxItems: 7
> +
> +  reg-names:
> +    items:
> +      - const: mixer
> +      - const: vdo_fe0
> +      - const: vdo_fe1
> +      - const: gfx_fe0
> +      - const: gfx_fe1
> +      - const: vdo_be
> +      - const: adl_ds
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  iommus:
> +    description: The compatible property is DMA function blocks.

I don't understand this at all.

> +      Should point to the respective IOMMU block with master port as argument,
> +      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for
> +      details.

Just skip the description, it's same everywhere.

> +    minItems: 1
> +    maxItems: 2
> +
> +  clocks:
> +    items:
> +      - description: mixer clock
> +      - description: video frontend 0 clock
> +      - description: video frontend 1 clock
> +      - description: graphic frontend 0 clock
> +      - description: graphic frontend 1 clock
> +      - description: video backend clock
> +      - description: autodownload and menuload clock
> +      - description: video frontend 0 async clock
> +      - description: video frontend 1 async clock
> +      - description: graphic frontend 0 async clock
> +      - description: graphic frontend 1 async clock
> +      - description: video backend async clock
> +      - description: ethdr top clock
> +
> +  clock-names:
> +    items:
> +      - const: mixer
> +      - const: vdo_fe0
> +      - const: vdo_fe1
> +      - const: gfx_fe0
> +      - const: gfx_fe1
> +      - const: vdo_be
> +      - const: adl_ds
> +      - const: vdo_fe0_async
> +      - const: vdo_fe1_async
> +      - const: gfx_fe0_async
> +      - const: gfx_fe1_async
> +      - const: vdo_be_async
> +      - const: ethdr_top
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: video frontend 0 async reset
> +      - description: video frontend 1 async reset
> +      - description: graphic frontend 0 async reset
> +      - description: graphic frontend 1 async reset
> +      - description: video backend async reset
> +
> +  reset-names:
> +    items:
> +      - const: vdo_fe0_async
> +      - const: vdo_fe1_async
> +      - const: gfx_fe0_async
> +      - const: gfx_fe1_async
> +      - const: vdo_be_async
> +
> +  mediatek,gce-client-reg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: The register of display function block to be set by gce.
> +      There are 4 arguments in this property, gce node, subsys id, offset and
> +      register size. The subsys id is defined in the gce header of each chips
> +      include/include/dt-bindings/gce/<chip>-gce.h, mapping to the register of
> +      display function block.
> +    items:
> +      items:
> +        - description: phandle of GCE
> +        - description: GCE subsys id
> +        - description: register offset
> +        - description: register size
> +    minItems: 7
> +    maxItems: 7
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +  - resets
> +  - mediatek,gce-client-reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +    #include <dt-bindings/memory/mt8195-memory-port.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +    #include <dt-bindings/reset/mt8195-resets.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        disp_ethdr@1c114000 {

No underscores in node name. Generic node names, so display-controller?


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
