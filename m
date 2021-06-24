Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAFFC49EA6
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 21:00:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2440761249
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 21:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2440761249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmbzExgPxh8WjbPnTJjTr+5/b/8++FAd2g76ohVY+QM=; b=sadJVCmqS7YwXr
	mbZkApyavou5r1riJQoi4RIckF2NPKrNiqE7Za9s8Q1KYL3z4ikImhX/5mza0fjAPqQhItRZpvqQX
	XWinWLWhFe4CFMlTQM8Ew/Zi225TCuFQL7T4kWU81oNXCh4lS63iFvrV1O/SVhYVTPn5dNNsQXSOM
	4zGPt8O/VesdN5OZOQXMdwjQx3/WByIYBmOCKXcjGvUBom631HEsPcxfqf0ZJ5lGwggfbFI4NtgNl
	S5wPu0MxzkFhYOTmLa6wCFCuM91VWcOfMSWbE8rkb/chs5yDkJnw/gBDlp8pev7I1BbvtsodV6NY0
	XFRw1n5xUuxaXS8yvFbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwWSC-00GHyx-KY; Thu, 24 Jun 2021 21:00:04 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwWRx-00GHwA-Ot; Thu, 24 Jun 2021 20:59:51 +0000
Received: by mail-il1-f176.google.com with SMTP id o10so2814901ils.6;
 Thu, 24 Jun 2021 13:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7TPuQYn5TrdtpCMrt9NzUNr8Bc5QeegacRjqO37lMrk=;
 b=OZFSBLMaQdQBtNsJDsgSyrPCaE3cyLjH2u4Kx5VXx6buLRvEnZiBvM3UmKCo8TqUxi
 aTAIn4MrB3j46EIuz8pJad3/nyBE5jEfs5BeOXkTmYSozyV4+Zxc7CGBSC2kgAOjfn2K
 Er3fkuG9VjHZarIc9xtqkYAxh5WzYpkQSunYlkpNIUjmkb4kr7/ddEH8mvoDnNNVg4Hc
 Q2ffL/er9nou6y1Jq5T1jFuhLlw/Y01JePThs/sCtW1+zXLEDfyG9aqiJ3pxCSG5vjFZ
 nO+tju+bSxdM0Q+0vOkBF3Lnu899aF3SDAgiRaxlW6lv2teV/Weh+B5Ugqrl+Luy0CXL
 +WEQ==
X-Gm-Message-State: AOAM532/FOce0a+xtfka4xsYF+EPqZ/w01kK+IIOXAlbsKbPluvMn8Ix
 zkr0aKYHW79PH3tKjMM8Ow==
X-Google-Smtp-Source: ABdhPJwmb8nMgS28mIElNf41xKpEy4mNltJ/cIYnO9tX0DzTH3aqcY3eCggpaC0HUD67Ou7Ez5uf4Q==
X-Received: by 2002:a05:6e02:1e03:: with SMTP id
 g3mr5039902ila.248.1624568388123; 
 Thu, 24 Jun 2021 13:59:48 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id n17sm2488350ilt.16.2021.06.24.13.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 13:59:47 -0700 (PDT)
Received: (nullmailer pid 1978111 invoked by uid 1000);
 Thu, 24 Jun 2021 20:59:44 -0000
Date: Thu, 24 Jun 2021 14:59:44 -0600
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v10 01/19] dt-bindings: ARM: Mediatek: Add new document
 bindings of MT8192 clock
Message-ID: <20210624205944.GA1975382@robh.at.kernel.org>
References: <20210616003643.28648-1-chun-jie.chen@mediatek.com>
 <20210616003643.28648-2-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616003643.28648-2-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_135949_867073_36C3B28A 
X-CRM114-Status: GOOD (  17.95  )
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

On Wed, Jun 16, 2021 at 08:36:25AM +0800, Chun-Jie Chen wrote:
> This patch adds the new binding documentation for system clock
> and functional clock on Mediatek MT8192.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,mt8192-clock.yaml   | 216 ++++++++++++++++++
>  .../mediatek/mediatek,mt8192-sys-clock.yaml   |  66 ++++++
>  2 files changed, 282 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> new file mode 100644
> index 000000000000..ce02c22c5d08
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
> @@ -0,0 +1,216 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek Functional Clock Controller for MT8192
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The Mediatek functional clock controller provides various clocks on MT8192.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:

You can simplify to just:

compatible:
  enum:
    ...

> +              - mediatek,mt8192-scp_adsp
> +              - mediatek,mt8192-imp_iic_wrap_c
> +              - mediatek,mt8192-audsys
> +              - mediatek,mt8192-imp_iic_wrap_e
> +              - mediatek,mt8192-imp_iic_wrap_s
> +              - mediatek,mt8192-imp_iic_wrap_ws
> +              - mediatek,mt8192-imp_iic_wrap_w
> +              - mediatek,mt8192-imp_iic_wrap_n
> +              - mediatek,mt8192-msdc_top
> +              - mediatek,mt8192-msdc
> +              - mediatek,mt8192-mfgcfg
> +              - mediatek,mt8192-mmsys
> +              - mediatek,mt8192-imgsys
> +              - mediatek,mt8192-imgsys2
> +              - mediatek,mt8192-vdecsys_soc
> +              - mediatek,mt8192-vdecsys
> +              - mediatek,mt8192-vencsys
> +              - mediatek,mt8192-camsys
> +              - mediatek,mt8192-camsys_rawa
> +              - mediatek,mt8192-camsys_rawb
> +              - mediatek,mt8192-camsys_rawc
> +              - mediatek,mt8192-ipesys
> +              - mediatek,mt8192-mdpsys
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
> +    scp_adsp: clock-controller@10720000 {
> +        compatible = "mediatek,mt8192-scp_adsp";
> +        reg = <0x10720000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_c: clock-controller@11007000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_c";
> +        reg = <0x11007000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    audsys: clock-controller@11210000 {
> +        compatible = "mediatek,mt8192-audsys";
> +        reg = <0x11210000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_e: clock-controller@11cb1000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_e";
> +        reg = <0x11cb1000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_s: clock-controller@11d03000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_s";
> +        reg = <0x11d03000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_ws: clock-controller@11d23000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_ws";
> +        reg = <0x11d23000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_w: clock-controller@11e01000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_w";
> +        reg = <0x11e01000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imp_iic_wrap_n: clock-controller@11f02000 {
> +        compatible = "mediatek,mt8192-imp_iic_wrap_n";
> +        reg = <0x11f02000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    msdc_top: clock-controller@11f10000 {
> +        compatible = "mediatek,mt8192-msdc_top";
> +        reg = <0x11f10000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    msdc: clock-controller@11f60000 {
> +        compatible = "mediatek,mt8192-msdc";
> +        reg = <0x11f60000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    mfgcfg: clock-controller@13fbf000 {
> +        compatible = "mediatek,mt8192-mfgcfg";
> +        reg = <0x13fbf000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    mmsys: clock-controller@14000000 {
> +        compatible = "mediatek,mt8192-mmsys";
> +        reg = <0x14000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imgsys: clock-controller@15020000 {
> +        compatible = "mediatek,mt8192-imgsys";
> +        reg = <0x15020000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    imgsys2: clock-controller@15820000 {
> +        compatible = "mediatek,mt8192-imgsys2";
> +        reg = <0x15820000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vdecsys_soc: clock-controller@1600f000 {
> +        compatible = "mediatek,mt8192-vdecsys_soc";
> +        reg = <0x1600f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vdecsys: clock-controller@1602f000 {
> +        compatible = "mediatek,mt8192-vdecsys";
> +        reg = <0x1602f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    vencsys: clock-controller@17000000 {
> +        compatible = "mediatek,mt8192-vencsys";
> +        reg = <0x17000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys: clock-controller@1a000000 {
> +        compatible = "mediatek,mt8192-camsys";
> +        reg = <0x1a000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys_rawa: clock-controller@1a04f000 {
> +        compatible = "mediatek,mt8192-camsys_rawa";
> +        reg = <0x1a04f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys_rawb: clock-controller@1a06f000 {
> +        compatible = "mediatek,mt8192-camsys_rawb";
> +        reg = <0x1a06f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    camsys_rawc: clock-controller@1a08f000 {
> +        compatible = "mediatek,mt8192-camsys_rawc";
> +        reg = <0x1a08f000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    ipesys: clock-controller@1b000000 {
> +        compatible = "mediatek,mt8192-ipesys";
> +        reg = <0x1b000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    mdpsys: clock-controller@1f000000 {
> +        compatible = "mediatek,mt8192-mdpsys";
> +        reg = <0x1f000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
> new file mode 100644
> index 000000000000..ececce3a1507
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-sys-clock.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek System Clock Controller for MT8192
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The Mediatek system clock controller provides various clocks and system configuration
> +  like reset and bus protection on MT8192.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

And here, drop the 'oneOf'.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +          - enum:
> +              - mediatek,mt8192-topckgen
> +              - mediatek,mt8192-infracfg
> +              - mediatek,mt8192-pericfg
> +              - mediatek,mt8192-apmixedsys
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
> +        compatible = "mediatek,mt8192-topckgen", "syscon";
> +        reg = <0x10000000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    infracfg: syscon@10001000 {
> +        compatible = "mediatek,mt8192-infracfg", "syscon";
> +        reg = <0x10001000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    pericfg: syscon@10003000 {
> +        compatible = "mediatek,mt8192-pericfg", "syscon";
> +        reg = <0x10003000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    apmixedsys: syscon@1000c000 {
> +        compatible = "mediatek,mt8192-apmixedsys", "syscon";
> +        reg = <0x1000c000 0x1000>;
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
