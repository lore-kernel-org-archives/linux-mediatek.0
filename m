Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D43C49EA6
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 21:22:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E56DF613C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 21:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E56DF613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9achJMBdW63RBH0YLH8713+AOP9Z/a33uuL4Q/taY8=; b=KjhaIlPlM3Y/Eh
	FM0cyw78/6Ta/yYYLxrfsL+3OtqpVkFp8vwo5ZQzE87e4xoD6MDXmD/Av8hpD7675+MzdF0Hvohax
	/mLOCKy89JECD9/u2x1zqa96fsctKJWnvnq8UUEMyTQZr51iqxSjq2QnXCcsxSONWFJEvI8aDCm+t
	T95lz11xkqWuJods+wGMHRFdYFeFG+Kw09APTME+nIqVgNlyJTp2nmX1/h+3IOpegV5mbhHGhNuqd
	eHHbPV2OhJXvvTMX+T+I/daLq08zimXYXm3U0bJkwt3f93KwgliREjc45hRigApJzKxD4MY2AltTe
	6x0JRGhAP/Sb96Vv7F4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwWnu-00GM2v-RZ; Thu, 24 Jun 2021 21:22:30 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwWnX-00GLwU-4r; Thu, 24 Jun 2021 21:22:09 +0000
Received: by mail-io1-f41.google.com with SMTP id s19so10047382ioc.3;
 Thu, 24 Jun 2021 14:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IjYln7/CWaQLlpNjEcHcKJVMwo4CKVakMcfjJuaqkT8=;
 b=hpgCr779rUmApKXU7h9q1K4nsslNlz+sA0CiSnJkPw6/tI7ZiJz6gfkcsKjToulvr+
 G9j9ijjwQG1OQ1NCE67fr/sawQV6tb0KlvY7U21TytPeKWawgkVa3fCKY5Oq+igms8BZ
 eWfA8iQ+R1j6JqHxVaXx7IuHaMyVnDEuxuzj3mEaIRBH/mDoqCy28yIDUkoAPzzknMGM
 +IsbhzDSlR6qUkfSyZqM2ZOZASLvGnq7vTan2grV6FexWnAqvkmjMjpObXC+fWl0uhbQ
 chiH6SA3IF+/AHCQmBrPDSq0WTsMRUDDaPaRWd1UCmHTsWyiuSD8oiJug96vLk8G5e+x
 RCyQ==
X-Gm-Message-State: AOAM532mYeULOuEwzpvYlUS5htwo+HK+08ZcHJXTE8H2EMVvbbzL8OC4
 iaD1jG2IDDWSX3vNApyegg==
X-Google-Smtp-Source: ABdhPJxY7LVDeDJUcuupR3ORKvKxfaqDvWjHt+12T65JRLfVwAsqXRCuBS/7Kqc+3sQFOLfMwHy8uQ==
X-Received: by 2002:a5e:8a41:: with SMTP id o1mr5642355iom.92.1624569725445;
 Thu, 24 Jun 2021 14:22:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id z12sm2028180iop.46.2021.06.24.14.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 14:22:04 -0700 (PDT)
Received: (nullmailer pid 2007687 invoked by uid 1000);
 Thu, 24 Jun 2021 21:21:58 -0000
Date: Thu, 24 Jun 2021 15:21:58 -0600
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 01/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of MT8195 clock
Message-ID: <20210624212158.GA2005899@robh.at.kernel.org>
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-2-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616224743.5109-2-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_142207_286810_663CC3FC 
X-CRM114-Status: GOOD (  17.98  )
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

On Thu, Jun 17, 2021 at 06:47:22AM +0800, Chun-Jie Chen wrote:
> This patch adds the new binding documentation for system clock
> and functional clock on Mediatek MT8195.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,mt8195-clock.yaml   | 287 ++++++++++++++++++
>  .../mediatek/mediatek,mt8195-sys-clock.yaml   |  66 ++++
>  2 files changed, 353 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> new file mode 100644
> index 000000000000..21554b3515cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
> @@ -0,0 +1,287 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek Functional Clock Controller for MT8195
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The Mediatek functional clock controller provides various clocks on MT8195.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:

Drop 'oneOf' and 'items'.

> +              - mediatek,mt8195-nnasys
> +              - mediatek,mt8195-scp_adsp
> +              - mediatek,mt8195-audsys
> +              - mediatek,mt8195-audsys_src
> +              - mediatek,mt8195-imp_iic_wrap_s
> +              - mediatek,mt8195-imp_iic_wrap_w
> +              - mediatek,mt8195-mfgcfg
> +              - mediatek,mt8195-vppsys0
> +              - mediatek,mt8195-wpesys
> +              - mediatek,mt8195-wpesys_vpp0
> +              - mediatek,mt8195-wpesys_vpp1
> +              - mediatek,mt8195-vppsys1
> +              - mediatek,mt8195-imgsys
> +              - mediatek,mt8195-imgsys1_dip_top
> +              - mediatek,mt8195-imgsys1_dip_nr
> +              - mediatek,mt8195-imgsys1_wpe
> +              - mediatek,mt8195-ipesys
> +              - mediatek,mt8195-camsys
> +              - mediatek,mt8195-camsys_rawa
> +              - mediatek,mt8195-camsys_yuva
> +              - mediatek,mt8195-camsys_rawb
> +              - mediatek,mt8195-camsys_yuvb
> +              - mediatek,mt8195-camsys_mraw
> +              - mediatek,mt8195-ccusys
> +              - mediatek,mt8195-vdecsys_soc
> +              - mediatek,mt8195-vdecsys
> +              - mediatek,mt8195-vdecsys_core1
> +              - mediatek,mt8195-apusys_pll
> +              - mediatek,mt8195-vencsys
> +              - mediatek,mt8195-vencsys_core1
> +              - mediatek,mt8195-vdosys0
> +              - mediatek,mt8195-vdosys1
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
> +    nnasys: clock-controller@10211000 {
> +        compatible = "mediatek,mt8195-nnasys";
> +        reg = <0x10211000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    scp_adsp: clock-controller@10720000 {
> +        compatible = "mediatek,mt8195-scp_adsp";
> +        reg = <0x10720000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    audsys: clock-controller@10890000 {
> +        compatible = "mediatek,mt8195-audsys";
> +        reg = <0x10890000 0x10000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    audsys_src: clock-controller@108a0000 {
> +        compatible = "mediatek,mt8195-audsys_src";
> +        reg = <0x108a0000 0x2000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_s: clock-controller@11d03000 {
> +        compatible = "mediatek,mt8195-imp_iic_wrap_s";
> +        reg = <0x11d03000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_w: clock-controller@11e05000 {
> +        compatible = "mediatek,mt8195-imp_iic_wrap_w";
> +        reg = <0x11e05000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    mfgcfg: clock-controller@13fbf000 {
> +        compatible = "mediatek,mt8195-mfgcfg";
> +        reg = <0x13fbf000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vppsys0: clock-controller@14000000 {
> +        compatible = "mediatek,mt8195-vppsys0";
> +        reg = <0x14000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    wpesys: clock-controller@14e00000 {
> +        compatible = "mediatek,mt8195-wpesys";
> +        reg = <0x14e00000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    wpesys_vpp0: clock-controller@14e02000 {
> +        compatible = "mediatek,mt8195-wpesys_vpp0";
> +        reg = <0x14e02000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    wpesys_vpp1: clock-controller@14e03000 {
> +        compatible = "mediatek,mt8195-wpesys_vpp1";
> +        reg = <0x14e03000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vppsys1: clock-controller@14f00000 {
> +        compatible = "mediatek,mt8195-vppsys1";
> +        reg = <0x14f00000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imgsys: clock-controller@15000000 {
> +        compatible = "mediatek,mt8195-imgsys";
> +        reg = <0x15000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imgsys1_dip_top: clock-controller@15110000 {
> +        compatible = "mediatek,mt8195-imgsys1_dip_top";
> +        reg = <0x15110000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imgsys1_dip_nr: clock-controller@15130000 {
> +        compatible = "mediatek,mt8195-imgsys1_dip_nr";
> +        reg = <0x15130000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imgsys1_wpe: clock-controller@15220000 {
> +        compatible = "mediatek,mt8195-imgsys1_wpe";
> +        reg = <0x15220000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    ipesys: clock-controller@15330000 {
> +        compatible = "mediatek,mt8195-ipesys";
> +        reg = <0x15330000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys: clock-controller@16000000 {
> +        compatible = "mediatek,mt8195-camsys";
> +        reg = <0x16000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys_rawa: clock-controller@1604f000 {
> +        compatible = "mediatek,mt8195-camsys_rawa";
> +        reg = <0x1604f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys_yuva: clock-controller@1606f000 {
> +        compatible = "mediatek,mt8195-camsys_yuva";
> +        reg = <0x1606f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys_rawb: clock-controller@1608f000 {
> +        compatible = "mediatek,mt8195-camsys_rawb";
> +        reg = <0x1608f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys_yuvb: clock-controller@160af000 {
> +        compatible = "mediatek,mt8195-camsys_yuvb";
> +        reg = <0x160af000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys_mraw: clock-controller@16140000 {
> +        compatible = "mediatek,mt8195-camsys_mraw";
> +        reg = <0x16140000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    ccusys: clock-controller@17200000 {
> +        compatible = "mediatek,mt8195-ccusys";
> +        reg = <0x17200000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vdecsys_soc: clock-controller@1800f000 {
> +        compatible = "mediatek,mt8195-vdecsys_soc";
> +        reg = <0x1800f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vdecsys: clock-controller@1802f000 {
> +        compatible = "mediatek,mt8195-vdecsys";
> +        reg = <0x1802f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vdecsys_core1: clock-controller@1803f000 {
> +        compatible = "mediatek,mt8195-vdecsys_core1";
> +        reg = <0x1803f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    apusys_pll: clock-controller@190f3000 {
> +        compatible = "mediatek,mt8195-apusys_pll";
> +        reg = <0x190f3000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vencsys: clock-controller@1a000000 {
> +        compatible = "mediatek,mt8195-vencsys";
> +        reg = <0x1a000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vencsys_core1: clock-controller@1b000000 {
> +        compatible = "mediatek,mt8195-vencsys_core1";
> +        reg = <0x1b000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vdosys0: clock-controller@1c01a000 {
> +        compatible = "mediatek,mt8195-vdosys0";
> +        reg = <0x1c01a000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vdosys1: clock-controller@1c100000 {
> +        compatible = "mediatek,mt8195-vdosys1";
> +        reg = <0x1c100000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
> new file mode 100644
> index 000000000000..ea379452ba91
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8195-sys-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek System Clock Controller for MT8195
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The Mediatek system clock controller provides various clocks and system configuration
> +  like reset and bus protection on MT8195.
> +
> +properties:
> +  compatible:
> +    oneOf:

Drop oneOf.

> +      - items:
> +          - enum:
> +              - mediatek,mt8195-topckgen
> +              - mediatek,mt8195-infracfg_ao
> +              - mediatek,mt8195-apmixedsys
> +              - mediatek,mt8195-pericfg_ao
> +          - const: syscon
> +
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
> +    topckgen: syscon@10000000 {
> +        compatible = "mediatek,mt8195-topckgen", "syscon";
> +        reg = <0x10000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    infracfg_ao: syscon@10001000 {
> +        compatible = "mediatek,mt8195-infracfg_ao", "syscon";
> +        reg = <0x10001000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    apmixedsys: syscon@1000c000 {
> +        compatible = "mediatek,mt8195-apmixedsys", "syscon";
> +        reg = <0x1000c000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    pericfg_ao: syscon@11003000 {
> +        compatible = "mediatek,mt8195-pericfg_ao", "syscon";
> +        reg = <0x11003000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
