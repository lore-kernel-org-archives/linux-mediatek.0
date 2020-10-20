Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B8AC4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 15:37:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79EAB2076A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 15:37:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oaOPixUk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79EAB2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T0NXNZZR5cekwle5VmrxahAG0jPEJaXllAl7+qmPZJM=; b=oaOPixUkD5zLvCkMIDWTWqkJm
	FOVux7BryGQFKHURUXs0gVmCxBHUEENHBuxdM1hvuyk4DQdY2r3EfY70Wk2xj3nXPPCfJfYjOOv5B
	qwZqJ+q3/HdKdzCT9QehjJzB1N6C/7Y9kT5snvhNofDd0tGc+FX79lABEgZeH5K1ORiWvYVnCSGyG
	C7KxCT8fy2QCU7F++YXmj/4L9otibWnVWQ0OtcJ8Ym7GZloC72rYU2V3y4Gc9fsdVkEufK0d/L7qY
	E54RbWaaF+QP5TtK39pDJtNJAayco5deoEZLvBGTvksKgtHLlfagfDY82ptb+HSLgyfkWqH1syvOO
	YdB/DkU9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUthO-0007ro-Jz; Tue, 20 Oct 2020 15:37:18 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUthK-0007qn-UC; Tue, 20 Oct 2020 15:37:15 +0000
Received: by mail-ot1-f67.google.com with SMTP id e20so2067330otj.11;
 Tue, 20 Oct 2020 08:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g4B3H2YyTXqBLgg1wF4uxkPxqRZVivqfWeJYJsXlNNE=;
 b=T+E0TNd4v8VW06/ddc6FgbeieaGNvqXgE208uO0uRVFxPRT1pFo6dZdp3uNRzVsur0
 ZBM2LoKV2dMKISPT2qHbNQJ26DLhSLFGcWE5C9PLKZmYgGWBSfDOjVFwNym8zPrZajSH
 8oz8i0KTw63aIdcGHG4TlPzRq/ojVqsnsvhLfWxr0jNg3Xa5067cJwC7YDjqTLxvsH3z
 SK3YqbswrvuBF/r8t7gzxriZUNzI/XZpDSct4iTRX5zwAyDuwYjJOQzyFjJd6bk5SDw5
 RSKkYkhG437sympfobHBR4zwfNwgA2GQTITlJKkLxQOxJjAQ1wTR4vV2m/ulZBDDU+LY
 9Png==
X-Gm-Message-State: AOAM5317RYbWxwto97VjEEzjCFKhavQ92ZWezHsUoPIwnf8jXgLaKuqK
 VzXtxJUdMqg2S9pipzv3dQ==
X-Google-Smtp-Source: ABdhPJzJLEvPTM2atQsX36mX0hN4YdP/3drHQ23QZjJYMNFXExKWGkmuVNrhKAKbB6OQjr9eitHk0A==
X-Received: by 2002:a9d:1ee5:: with SMTP id n92mr1552389otn.152.1603208233680; 
 Tue, 20 Oct 2020 08:37:13 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n1sm497370otr.16.2020.10.20.08.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 08:37:12 -0700 (PDT)
Received: (nullmailer pid 884187 invoked by uid 1000);
 Tue, 20 Oct 2020 15:37:06 -0000
Date: Tue, 20 Oct 2020 10:37:06 -0500
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: regulator: document binding for
 MT6315 regulator
Message-ID: <20201020153706.GB876906@bogus>
References: <1603187810-30481-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1603187810-30481-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603187810-30481-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_113714_973790_08CA80CD 
X-CRM114-Status: GOOD (  21.60  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 20, 2020 at 05:56:49PM +0800, Hsin-Hsiung Wang wrote:
> Add device tree binding information for MT6315 regulator driver.
> Example bindings for MT6315 are added.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../regulator/mtk,mt6315-regulator.yaml       | 88 +++++++++++++++++++
>  include/dt-bindings/regulator/mtk,mt6315.h    | 17 ++++
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mtk,mt6315-regulator.yaml
>  create mode 100644 include/dt-bindings/regulator/mtk,mt6315.h
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mtk,mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mtk,mt6315-regulator.yaml
> new file mode 100644
> index 000000000000..457606800d5b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mtk,mt6315-regulator.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mtk,mt6315-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6315 Regulator
> +
> +maintainers:
> +  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> +
> +description: |
> +  The MT6315 is a power management IC (PMIC) configurable with SPMI.
> +  that contains 4 BUCKs output which can combine with each other
> +  by different efuse settings.
> +
> +allOf:
> +  - $ref: "regulator.yaml#"

This doesn't go here, but...

> +
> +properties:
> +  $nodename:
> +    pattern: "mt6315@[0-9]"
> +  compatible:
> +    enum:
> +      - mediatek,mt6315_3-regulator
> +      - mediatek,mt6315_6-regulator
> +      - mediatek,mt6315_7-regulator

What's 3, 6, 7 mean?

> +
> +  reg:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +    description: List of regulators and its properties
> +
> +    patternProperties:
> +      "^vbuck[1-4]$":
> +        type: object

regulator.yaml ref goes here.

> +
> +        properties:
> +          regulator-name:
> +            pattern: "^vbuck[1-4]$"
> +            description:
> +              should be "vbuck1", ..., "vbuck4"
> +
> +          mtk,combined-regulator:
> +            $ref: "/schemas/types.yaml#/definitions/uint32-array"

Wouldn't a phandle make more sense. And we have coupled regulator 
binding that this may work for.

> +            description: |
> +              defines other bucks combined with this buck, must contain the following
> +              values MT6315_VBUCK1, MT6315_VBUCK2, MT6315_VBUCK3, MT6315_VBUCK4
> +
> +    unevaluatedProperties: false

'additionalProperties: false' would be better here.

> +
> +required:
> +  - compatible
> +  - reg
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* This example shows that buck2 and buck4 are combined into buck1. */
> +    #include <dt-bindings/regulator/mtk,mt6315.h>
> +
> +    mt6315@6 {

pmic@6

> +      compatible = "mediatek,mt6315_6-regulator";
> +      reg = <0x6 0 0xb 1>;
> +
> +      regulators {
> +        vbuck1 {
> +          regulator-compatible = "vbuck1";
> +          regulator-min-microvolt = <300000>;
> +          regulator-max-microvolt = <1193750>;
> +          regulator-enable-ramp-delay = <256>;
> +          regulator-allowed-modes = <0 1 2 4>;
> +          mtk,combined-regulator = <MT6315_VBUCK2 MT6315_VBUCK4>;
> +        };
> +
> +        vbuck3 {
> +          regulator-compatible = "vbuck3";
> +          regulator-min-microvolt = <300000>;
> +          regulator-max-microvolt = <1193750>;
> +          regulator-enable-ramp-delay = <256>;
> +          regulator-allowed-modes = <0 1 2 4>;
> +        };
> +      };
> +    };
> diff --git a/include/dt-bindings/regulator/mtk,mt6315.h b/include/dt-bindings/regulator/mtk,mt6315.h
> new file mode 100644
> index 000000000000..6ed9b2b121db
> --- /dev/null
> +++ b/include/dt-bindings/regulator/mtk,mt6315.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_REGULATOR_MTK_MT6315_H
> +#define _DT_BINDINGS_REGULATOR_MTK_MT6315_H
> +
> +/* Regulator ID */
> +#define MT6315_VBUCK1	1
> +#define MT6315_VBUCK2	2
> +#define MT6315_VBUCK3	3
> +#define MT6315_VBUCK4	4

I don't find these defines to be that helpful.

> +#define MT6315_VBUCK_MAX	5
> +
> +#endif /* _DT_BINDINGS_REGULATOR_MTK_MT6315_H */
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
