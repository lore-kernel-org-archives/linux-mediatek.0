Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F7CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 18:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CD37GK8J9Xe+9sSJBE1nsV5T0FhoutXfDb7snO1zAb8=; b=jF6NNjE1JLzl3n
	IQQBopvSExJwLspP3QriwyqfiJKqVnHshrE4KTMdXVDGCWD8f/pmdA/nJJkrb9mGCbBgeseTQ32bW
	6TAIbdds6pTCOdSdEg9GYWUsz1L5W6Ira8yM34sY5ZRmgG2F6Fkz5AoM2EW68RlERwvtKLQ2DXz8B
	OX/4CDkJ18hsTGENL0YrJDbdGB/tHgkEVFJzTEdiSMKS6KEI0nbwaFsQFkBZbc72J9uMIhsj3vtO+
	pS6eQ1Al0uRGlBrXwTCzUjypWLB51/N02j32fMY1t8D9E9iewEoIhsGiMux/JgWnUOFtmQ8W4ZkL8
	UK054GoCG1AY7YtD7IvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNfmp-006hCr-Lr; Fri, 25 Feb 2022 18:57:51 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNfmc-006h85-26; Fri, 25 Feb 2022 18:57:39 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 l25-20020a9d7a99000000b005af173a2875so4261595otn.2; 
 Fri, 25 Feb 2022 10:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x8VduacFeI2TtrIqE99cIVcfc9BkTJGt0d9uSUOVc7E=;
 b=Owlh1syaazR3UXsn0iK0JmfMBrVopJBK+IP2TPi412gQOPbJCc3LgMdCWWOImfox6+
 eVvVv+ZkTXSBpvakCv5JGAmTjjAe6wG9I0lyto4DmNPJ0rlal6wL8XHnw3eR+a/a3T/n
 oRihd24OdcAGxx8YnSdXaBTCwGvyZYMVZxCIS8UbW+pU53I1d7htI/HKztq13UNhg+/d
 JPA25b/kwTfMNd6Jjy7b1fVAi1Ym/DK5QxykuAidb5iaVubao/xd4DaFz5N6BrQidv7q
 U5tPmfpyaplRYy5lpS1mMEa1kC6UbtUGgxrPtmyI9s4Dx2sJCOFhNIAc0FKi9ARbF/Yp
 N9aA==
X-Gm-Message-State: AOAM5331FoRdSlg1XZ/OypR3IdgvGFyUnaWtQeW2/M9nX3pGDP6iOLLt
 09JwOvYaw8QgznWWQ+9uBg==
X-Google-Smtp-Source: ABdhPJyley6JPhi/AEjlC8FHuJ7ppAxof/WudVKlaHcQo3+Rn5IGxqe/9TCzVrCzQFJDLr4y/9d3LA==
X-Received: by 2002:a9d:6a43:0:b0:5af:6595:458c with SMTP id
 h3-20020a9d6a43000000b005af6595458cmr3452302otn.241.1645815456446; 
 Fri, 25 Feb 2022 10:57:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 u24-20020a4ae698000000b0031c286f2e0csm1451768oot.29.2022.02.25.10.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 10:57:35 -0800 (PST)
Received: (nullmailer pid 1247199 invoked by uid 1000);
 Fri, 25 Feb 2022 18:57:34 -0000
Date: Fri, 25 Feb 2022 12:57:34 -0600
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 01/15] dt-bindings: ARM: Mediatek: Add new document
 bindings of MT8186 clock
Message-ID: <YhkmnnIApvU7gRlZ@robh.at.kernel.org>
References: <20220221015258.913-1-chun-jie.chen@mediatek.com>
 <20220221015258.913-2-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221015258.913-2-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_105738_130039_CFA8D3B2 
X-CRM114-Status: GOOD (  20.26  )
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

On Mon, Feb 21, 2022 at 09:52:44AM +0800, Chun-Jie Chen wrote:
> This patch adds the new binding documentation for system clock
> and functional clock on Mediatek MT8186.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,mt8186-clock.yaml   |  56 +++
>  .../mediatek/mediatek,mt8186-sys-clock.yaml   |  54 +++
>  include/dt-bindings/clock/mt8186-clk.h        | 445 ++++++++++++++++++
>  3 files changed, 555 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
>  create mode 100644 include/dt-bindings/clock/mt8186-clk.h
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
> new file mode 100644
> index 000000000000..373e8a100da3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Mediatek Functional Clock Controller for MT8186
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:

You need a '|' to preserve the formatting.

> +  The clock architecture in Mediatek like below
> +  PLLs -->
> +          dividers -->
> +                      muxes
> +                           -->
> +                              clock gate
> +
> +  The devices provide clock gate control in different IP blocks.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8186-imp_iic_wrap
> +          - mediatek,mt8186-mfgsys
> +          - mediatek,mt8186-wpesys
> +          - mediatek,mt8186-imgsys1
> +          - mediatek,mt8186-imgsys2
> +          - mediatek,mt8186-vdecsys
> +          - mediatek,mt8186-vencsys
> +          - mediatek,mt8186-camsys
> +          - mediatek,mt8186-camsys_rawa
> +          - mediatek,mt8186-camsys_rawb
> +          - mediatek,mt8186-mdpsys
> +          - mediatek,mt8186-ipesys
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    imp_iic_wrap: clock-controller@11017000 {
> +        compatible = "mediatek,mt8186-imp_iic_wrap";
> +        reg = <0x11017000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
> new file mode 100644
> index 000000000000..4c071dd66b76
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-sys-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Mediatek System Clock Controller for MT8186
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:

And here.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +  The clock architecture in Mediatek like below
> +  PLLs -->
> +          dividers -->
> +                      muxes
> +                           -->
> +                              clock gate
> +
> +  The apmixedsys provides most of PLLs which generated from SoC 26m.
> +  The topckgen provides dividers and muxes which provide the clock source to other IP blocks.
> +  The infracfg_ao provides clock gate in peripheral and infrastructure IP blocks.
> +  The mcusys provides mux control to select the clock source in AP MCU.
> +  The device nodes also provide the system control capacity for configuration.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
