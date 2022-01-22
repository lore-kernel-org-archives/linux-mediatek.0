Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A922C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 00:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=askHXiCiQ+Gw1eEE8RylwfBwN957xb/3F3o2G2NslJc=; b=LANQYZRdRU+App
	M24i0XaLTnCToinRomHDsnZLY6ZnmSimMk5ilr79jjYxiX5jzJe5x1pNGiDLYHw8EAK6GLEuwFWr+
	SOIVc4U3FeA98kwjSHkvpHObVJACXArXtrZesIuuN8Nw01x7gNdVGDllX+rAlVoFAme0HDCBEhvc7
	FTUsNU2h1nq+OXgiaNO5DBEmjXtHGAokvWCYSb9X6BEz36JZGV1DkNTUOZwBoqSejQ68GDE29G2cl
	D29oAOsBrE5mw+7pN3tWEReF/bjhMveGFGxBsitsOr+HKxPzLiQIMbQ/TmJjxgp+WgVgWPt2viJWV
	SpFKQnmyz4r9cZkmS+bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB4ED-00GIVI-4u; Sat, 22 Jan 2022 00:26:01 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB4E1-00GITz-64; Sat, 22 Jan 2022 00:25:51 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 x31-20020a056830245f00b00599111c8b20so13800055otr.7; 
 Fri, 21 Jan 2022 16:25:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vnvsBi6j4QlS4pFCiK5E8vYWQqq9vF/OarQfMrfrUoU=;
 b=PIUK/vMVhDz51yrRvMHmdzbSrFnk3HLhvmD/hhK49evUSTYDzKTV2QdbSgCZ9v14To
 es+rYOBDLgzH4IGLJSqf63b4j0qmt/4XN5yG6H3u6dn5jvPhQ+CryhKFiHrf9Eh64jvO
 AVdu/qUVJU6VZ77foDCiHCAJVDBXEJsbUx1tOy+f/tVVmkjQnoShyD8C1FfrG6wVGEqP
 NJHLjT8eimmq3HNmCMRQ1f6jbWvTA+OvSox+Erhx1TbbUQyxqkZGYnssaRCbgu3AEHER
 r+GZ2FL3ogbGzr1CcUDAgrSOEmEtx02TsOx6D5bCmdBz4UjCXvlRUpC+QmFVJ/3R9gRp
 fw4g==
X-Gm-Message-State: AOAM530fg1y0mjT6El2TcWJOuwr7udSseTxsU+iVocZM9lRsWXEaek06
 R8/2XXse4czQDaQiADAFKg==
X-Google-Smtp-Source: ABdhPJyIRwb1uKhM2T0nBmqMzLQYSw3XjKvixBZjdgNMxJ07YX+aRKLlfHPvnDBRvZmeKfO84OYM8w==
X-Received: by 2002:a05:6830:40af:: with SMTP id
 x47mr4629544ott.193.1642811148336; 
 Fri, 21 Jan 2022 16:25:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e26sm1868700oiy.16.2022.01.21.16.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 16:25:47 -0800 (PST)
Received: (nullmailer pid 1904240 invoked by uid 1000);
 Sat, 22 Jan 2022 00:25:46 -0000
Date: Fri, 21 Jan 2022 18:25:46 -0600
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v1 01/16] dt-bindings: ARM: Mediatek: Add new document bindings
 of MT8186 clock
Message-ID: <YetPCgSSRiWpDtcc@robh.at.kernel.org>
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-2-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110134416.5191-2-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_162549_268521_E1750C4E 
X-CRM114-Status: GOOD (  18.26  )
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

On Mon, Jan 10, 2022 at 09:44:01PM +0800, Chun-Jie Chen wrote:
> This patch adds the new binding documentation for system clock
> and functional clock on Mediatek MT8186.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,mt8186-clock.yaml   | 133 ++++++++++++++++++
>  .../mediatek/mediatek,mt8186-sys-clock.yaml   |  74 ++++++++++
>  2 files changed, 207 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
> new file mode 100644
> index 000000000000..fc39101bc9b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
> @@ -0,0 +1,133 @@
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
> +
> +  - |
> +    mfgsys: clock-controller@13000000 {
> +        compatible = "mediatek,mt8186-mfgsys";
> +        reg = <0x13000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    wpesys: clock-controller@14020000 {
> +        compatible = "mediatek,mt8186-wpesys";
> +        reg = <0x14020000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imgsys1: clock-controller@15020000 {
> +        compatible = "mediatek,mt8186-imgsys1";
> +        reg = <0x15020000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imgsys2: clock-controller@15820000 {
> +        compatible = "mediatek,mt8186-imgsys2";
> +        reg = <0x15820000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vdecsys: clock-controller@1602f000 {
> +        compatible = "mediatek,mt8186-vdecsys";
> +        reg = <0x1602f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vencsys: clock-controller@17000000 {
> +        compatible = "mediatek,mt8186-vencsys";
> +        reg = <0x17000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys: clock-controller@1a000000 {
> +        compatible = "mediatek,mt8186-camsys";
> +        reg = <0x1a000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys_rawa: clock-controller@1a04f000 {
> +        compatible = "mediatek,mt8186-camsys_rawa";
> +        reg = <0x1a04f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys_rawb: clock-controller@1a06f000 {
> +        compatible = "mediatek,mt8186-camsys_rawb";
> +        reg = <0x1a06f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    mdpsys: clock-controller@1b000000 {
> +        compatible = "mediatek,mt8186-mdpsys";
> +        reg = <0x1b000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    ipesys: clock-controller@1c000000 {
> +        compatible = "mediatek,mt8186-ipesys";
> +        reg = <0x1c000000 0x1000>;
> +        #clock-cells = <1>;
> +    };

There's little point in enumerating every possible compatible. 1 example 
is more than enough.


> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
> new file mode 100644
> index 000000000000..11473971a165
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
> @@ -0,0 +1,74 @@
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
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8186-mcusys
> +          - mediatek,mt8186-topckgen
> +          - mediatek,mt8186-infracfg_ao
> +          - mediatek,mt8186-apmixedsys
> +      - const: syscon
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
> +    mcusys: syscon@c53a000 {

clock-controller@...

Drop unused labels.

> +        compatible = "mediatek,mt8186-mcusys", "syscon";
> +        reg = <0xc53a000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    topckgen: syscon@10000000 {
> +        compatible = "mediatek,mt8186-topckgen", "syscon";
> +        reg = <0x10000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    infracfg_ao: syscon@10001000 {
> +        compatible = "mediatek,mt8186-infracfg_ao", "syscon";
> +        reg = <0x10001000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    apmixedsys: syscon@1000c000 {
> +        compatible = "mediatek,mt8186-apmixedsys", "syscon";
> +        reg = <0x1000c000 0x1000>;
> +        #clock-cells = <1>;
> +    };

Again, 1 example is enough.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
