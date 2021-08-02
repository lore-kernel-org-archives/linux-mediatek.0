Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97157C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 21:32:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FB4160EB2
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 21:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FB4160EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sK/cMBkb1odIBlmUJNhTI2TnLyQ8zVMKyTfxnM7J1II=; b=2UKEqfplYJg+uo
	a0IKl3M9weuLuuYR+ReZZyivC5MlvPVCSnPf9zvvS2eGKibxYTGuSUcZO9FzzrP4R65u4DpAxaoMJ
	UIWFoTWjkP83iuGsTmh9tEB5RVe8X/7cx2K6RUQo7RAEyIrYHqFRcfVgJpCxyuO4UkC74Yos1Ekt8
	SSEQzLqOofbwmg70usOskNQ5gaLpH2w07uSNhDDB+jVx1I9Nwxo1EyuU0gJ1ZfWfc3jjwgWf4v3PD
	c8KJNPZO4SW5A/vY4CzP1BY2G94FHtcMnO87uqCAJzJfYOry4b7sD0PTwbpN5Pfh2oJ1+hgCmJ1GE
	8uL0Z23pv82atdUpKDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAfXQ-000Htm-Sb; Mon, 02 Aug 2021 21:31:56 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAfXD-000Hrk-NZ; Mon, 02 Aug 2021 21:31:45 +0000
Received: by mail-io1-f50.google.com with SMTP id r18so22017453iot.4;
 Mon, 02 Aug 2021 14:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LMgRhy6hctyBbGDHOH8RGjk1VRc0Fj5vVUTdjQrtcow=;
 b=HkaFgS49wa4J9JqezxtlDcwpoXfkzCV9xyEJWtRQoTuHvn1yaemSng1BC0+hIH1Oaa
 k8ccPkevyezRBLRyL/F2Yka2LCoKkALjluG2pDmcULG3G5+YmkrZm2bSv9mI7qMvzKJ3
 a/VorTOfGWFpFSCbf68mGhUK1WRR9l65DyNMHJXDYypjKAAqUA+cf2uzc7aNRhmXzbPN
 OzqwVqGNe8u1q9HbhCkVn8pUCZWrzSKAGJktjjejNhMMSyys5kFKIOIpMbQBgmmC0rR+
 qz1Xlzq5Ez5n+ODty2vCFjS+6P5PXjTl2kRDFMqTTRD100yrMS4hyCUK3cconB+g7ogM
 TpJA==
X-Gm-Message-State: AOAM53093rHuQBJl5B8z14SP5xlBsO4JJSv3N6NbQflO32hxhtwfNLlY
 4PX7fAJuiOViCYiWDnpoJg==
X-Google-Smtp-Source: ABdhPJywEL177WRcsNGDOmEHk8cW91nV9jDwHkmis2MuSxnkUqZhe3Xrb96xaRz1m2dBieNoHMa85A==
X-Received: by 2002:a05:6602:218c:: with SMTP id
 b12mr1423523iob.82.1627939899489; 
 Mon, 02 Aug 2021 14:31:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id g26sm7835048ioh.48.2021.08.02.14.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 14:31:38 -0700 (PDT)
Received: (nullmailer pid 1650185 invoked by uid 1000);
 Mon, 02 Aug 2021 21:31:37 -0000
Date: Mon, 2 Aug 2021 15:31:37 -0600
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, tzungbi@google.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 3/4] dt-bindings: remoteproc: mediatek: Convert
 mtk,scp to json-schema
Message-ID: <YQhkOSEP0PAN9rY7@robh.at.kernel.org>
References: <20210728035859.5405-1-tinghan.shen@mediatek.com>
 <20210728035859.5405-4-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728035859.5405-4-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_143143_817242_529F00F3 
X-CRM114-Status: GOOD (  27.69  )
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

On Wed, Jul 28, 2021 at 11:58:58AM +0800, Tinghan Shen wrote:
> Convert the mtk,scp binding to DT schema format using json-schema.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/remoteproc/mtk,scp.txt           | 41 ---------
>  .../bindings/remoteproc/mtk,scp.yaml          | 85 +++++++++++++++++++
>  2 files changed, 85 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
> deleted file mode 100644
> index 88f37dee7bca..000000000000
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -Mediatek SCP Bindings
> -----------------------------------------
> -
> -This binding provides support for ARM Cortex M4 Co-processor found on some
> -Mediatek SoCs.
> -
> -Required properties:
> -- compatible		Should be one of:
> -				"mediatek,mt8183-scp"
> -				"mediatek,mt8192-scp"
> -				"mediatek,mt8195-scp"
> -- reg			Should contain the address ranges for memory regions:
> -			SRAM, CFG, and L1TCM.
> -- reg-names		Contains the corresponding names for the memory regions:
> -			"sram", "cfg", and "l1tcm".
> -- clocks		Required by mt8183 and mt8192. Clock for co-processor
> -			(See: ../clock/clock-bindings.txt)
> -- clock-names		Required by mt8183 and mt8192. Contains the
> -			corresponding name for the clock. This should be
> -			named "main".
> -
> -Subnodes
> ---------
> -
> -Subnodes of the SCP represent rpmsg devices. The names of the devices are not
> -important. The properties of these nodes are defined by the individual bindings
> -for the rpmsg devices - but must contain the following property:
> -
> -- mtk,rpmsg-name	Contains the name for the rpmsg device. Used to match
> -			the subnode to rpmsg device announced by SCP.
> -
> -Example:
> -
> -	scp: scp@10500000 {
> -		compatible = "mediatek,mt8183-scp";
> -		reg = <0 0x10500000 0 0x80000>,
> -		      <0 0x105c0000 0 0x5000>;
> -		reg-names = "sram", "cfg";
> -		clocks = <&infracfg CLK_INFRA_SCPSYS>;
> -		clock-names = "main";
> -	};
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> new file mode 100644
> index 000000000000..dc5fcbe65dae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek SCP Bindings
> +
> +maintainers:
> +  - Tinghan Shen <tinghan.shen@mediatek.com>
> +
> +description:
> +  This binding provides support for ARM Cortex M4 Co-processor found on some
> +  Mediatek SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8183-scp
> +      - mediatek,mt8192-scp
> +      - mediatek,mt8195-scp
> +
> +  reg:
> +    description: |
> +      Should contain the address ranges for memory regions SRAM and CFG,
> +    maxItems: 2
> +
> +  reg-names:
> +    description: |
> +      Contains the corresponding names for the two memory regions. These
> +      should be named "sram", "cfg".
> +
> +  clocks:
> +    description: |
> +        Clock for co-processor (see ../clock/clock-bindings.txt).
> +        Required by mt8183 and mt8192.
> +    maxItems: 1
> +
> +  clock-names:
> +    description: |
> +      Contains the corresponding name for the clock. This should be
> +      named "main". Required by mt8183 and mt8192.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +
> +patternProperties:
> +  ".*":
> +    if:
> +      type: object
> +    then:

This can be replaced with:

additionalProperties:
  type: object
  ... and the rest below here:

> +      description:
> +        Subnodes of the SCP represent rpmsg devices. The names of the devices
> +        are not important. The properties of these nodes are defined by the
> +        individual bindings for the rpmsg devices.
> +
> +      properties:
> +        mtk,rpmsg-name:
> +          description:
> +            Contains the name for the rpmsg device. Used to match
> +            the subnode to rpmsg device announced by SCP.
> +
> +      required:
> +        - mtk,rpmsg-name
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        scp: scp@10500000 {

Drop unused labels.

> +            compatible = "mediatek,mt8183-scp";
> +            reg = <0 0x10500000 0 0x80000>,
> +                  <0 0x105c0000 0 0x5000>;
> +            reg-names = "sram", "cfg";
> +            clocks = <&infracfg CLK_INFRA_SCPSYS>;
> +            clock-names = "main";
> +        };
> +    };
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
