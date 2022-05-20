Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82963C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 08:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SYd4qeqIXElfjabtTRCI1cyJAyACNky7zpo2CU3+h8=; b=rUMfRngeEl16R/
	kcT0CJCRiV0u9aW/LM5aVckNbul16Mjuu6KJnsvi32ryXJ4Kr3eD5HPdchFCETH1Q17IARZrtNHIl
	rds/KmZHiQZaug6Mmm5C6+w1daMhb2cHJVDAAT2K3/IYT2lCGGQ25MyIgJcgjDjdLK9+GfVMUzmZp
	JfBvzy5XmkqDSMzax8JuOAUCGGuNjoNCf3wcEDRlZ/wjFj5Kqr0ycoJakvy/NuWNun3G+9AuvJXlA
	m5CWm7tj1NH3yvPtpSUnEZnrLuMCSqOGuxWEGKwknTwwQlIeDL9v6epajyr1UPNKqaAZr+YegbB8A
	ZAHxM8RgnUNWqWWInuFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrxnw-00BCZn-5u; Fri, 20 May 2022 08:16:12 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrxnk-00BCXG-MI
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 08:16:02 +0000
Received: by mail-lf1-x12a.google.com with SMTP id u23so13068960lfc.1
 for <linux-mediatek@lists.infradead.org>; Fri, 20 May 2022 01:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3WMyBzBsRRCp6gbma/PbvD8+LxmLfC0Z+aWsUUO5v2Q=;
 b=r8VE/uCTjI1e7vSggfcD/lYcs0j1kTxOduTx3B/oYII5BDkRCTFH8oLlvB4Tof2u4D
 srS0Okq1V37kNOj+J0SbInhv+n24I+vkVDFIQ06wiyfkkAzCCe9TxOnztwm7TOy6OsRi
 r5uotICug85Fom3LRI5GHqRjAM8dyJmTIGZF9JAucv5bIUju3LizX2JH3cDTsYdCbpV+
 /dvm7USDxXWWjZiaqH9X3v9iH33NRi/011BF43EKMgU10d+u7pRuZbxa93+hEVU19CmH
 96GhWRfNlrjwi2H3D3shQ/vvJUvLQKZraiyEi3N6ReCkaB6uTsZR35TzIS1CiM6YfP1Q
 uSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3WMyBzBsRRCp6gbma/PbvD8+LxmLfC0Z+aWsUUO5v2Q=;
 b=eH+EGqNAXBHkkvXx5Qyiae5m0jmcHO93UJmr1lIF3WzF2vYwxSFWas4aDVGhhRmdYk
 2xxGnZBNQEDhsweOJu/3Ehd4t/TN4/2Tt+/3LSKG0sa5aqQgrDbE7IUKb5PQOnz9YGlT
 CaKDm20J9sqwi1A+BmFsddWnrWzIXast3qbdam+2hunJCdztlKGhILEZ8Zvj5/NmAeh/
 7SuOKOO7JeayAV+risgpgc+K9qbucHzokX+mJXZTdtj7piaiWG2Oyg9q2y86oyC4Tweq
 DaI2UomU9aWm59Q8Z7yqB2M7r82vX5y4VLztwMGQ7KeNVvWRErAJleK+snc+bsmrGMCg
 3wtA==
X-Gm-Message-State: AOAM533gLAwAArAiKY4iTSml64QRJN4WEy+zHBpidrUGjKeA5Xl/qngv
 8TFXv6JgkA70i5Gf3KamYjVgOw==
X-Google-Smtp-Source: ABdhPJwykLzONsSZWY9axC9eeMj14sgcODVg3yQ+6KyFmWtA4KaDq9yJKAlnTHB1z/K2FxU5uXKaeQ==
X-Received: by 2002:a05:6512:3d1a:b0:477:ae14:9778 with SMTP id
 d26-20020a0565123d1a00b00477ae149778mr6380088lfv.72.1653034556706; 
 Fri, 20 May 2022 01:15:56 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 x17-20020a05651c105100b0024f3d1dae9esm222920ljm.38.2022.05.20.01.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 01:15:56 -0700 (PDT)
Message-ID: <45e78390-5f91-7ac7-45d8-5796bc608234@linaro.org>
Date: Fri, 20 May 2022 10:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] dt-bindings: mailbox: mtk-gce: Convert txt to json-schema
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: jassisinghbrar@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, houlong.wei@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220519101806.18097-1-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519101806.18097-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_011600_781109_D450291E 
X-CRM114-Status: GOOD (  17.67  )
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

On 19/05/2022 12:18, AngeloGioacchino Del Regno wrote:
> Convert the mtk-gce documentation from freeform text format to a
> json-schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mailbox/mediatek,gce-mbox.yaml   | 114 ++++++++++++++++++
>  .../devicetree/bindings/mailbox/mtk-gce.txt   |  82 -------------
>  2 files changed, 114 insertions(+), 82 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-mbox.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mbox.yaml
> new file mode 100644
> index 000000000000..750391b4038c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mbox.yaml
> @@ -0,0 +1,114 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mediatek,gce-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Global Command Engine (GCE) mailbox
> +
> +maintainers:
> +  - Houlong Wei <houlong.wei@mediatek.com>
> +
> +description: |
> +  The Global Command Engine (GCE) is used to help read/write registers
> +  with critical time limitation, such as updating display configuration
> +  during the vblank.
> +  The GCE can be used to implement the Command Queue (CMDQ) driver.

Mention the headers in description.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6779-gce
> +      - mediatek,mt8173-gce
> +      - mediatek,mt8183-gce
> +      - mediatek,mt8186-gce
> +      - mediatek,mt8192-gce
> +      - mediatek,mt8195-gce
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: gce
> +
> +  '#mbox-cells':
> +    description: |
> +      The first cell describes the mailbox channel, which is the GCE Thread ID;
> +      The second cell describes the priority of the GCE thread.
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - '#mbox-cells'
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8195-gce
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2

Are you sure this works on mt8195-gce?

> +
> +        clock-names:
> +          items:
> +            - const: gce0
> +            - const: gce1
> +

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
