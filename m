Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0FFC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 15:56:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 173E960524
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 15:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 173E960524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBYl5o6e9Tj5L9PZ6nt/3GHA9W+C7Iqa9VvqvBQwcYs=; b=yzsKNy8/VImu+6
	yJMo2H6e0f1Ln4n34+g011RtHHuBuhUhqv6E2NH7tfz2OOLM0Rf1QPNaw4nxjbIROOw3nxnt2yVKs
	rPe6GVRSpUchr2S2i8bxg0AbO1vP/3oZL0HBZ5tSFVOG3sEp0D2VorstnB04mEYu05Mc4+mreLPTy
	3+rERe19qOLpYG+Msgp28woMK64AJVDr4Wi0FZRrFCoyI/vHseDoEb6dhZJAqVI5qN86kODOfjo76
	k7RyuRHrVo/fji/sMxQiQOhkOATW+ZHlSZ+NXhh9YxAaDHkt3DUHc+YZieygpsEWRCWJ+wDdO+9UL
	In9ya+301jVPsSdV1DgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Urv-009O86-RB; Fri, 30 Jul 2021 15:56:15 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Urs-009O7N-JM
 for linux-mediatek@lists.infradead.org; Fri, 30 Jul 2021 15:56:14 +0000
Received: by mail-ot1-x331.google.com with SMTP id
 i39-20020a9d17270000b02904cf73f54f4bso9997753ota.2
 for <linux-mediatek@lists.infradead.org>; Fri, 30 Jul 2021 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Xg5LLOd+ZVZa0FCK1UJtEwXy6lwS6Y0I8bC/j0Z8unY=;
 b=YjwloqPi6qyqga2J8/GuErJH/XkpjZIRsODaSYhBoqd7SS1QKQEabbwKJCX24Vf1Yn
 xJ4AipDGXaWEmwrtHSY8u7nSYP75B05IXUn3l92wuWJdjJeNyfIRfiOWGljf5rUPrEfR
 SvI/aARaRS69Cx+svmYrLRozh2Ol0qIAB/mmjQtv/EUJHvdnT+nrjE39MnMOT2n6La7q
 lezB4kG3b4KLJ8ThIbjU4PKXphn58UwJGSXRgWwzDcWmWWn/ddj2Fm370NpjrFUMFDUt
 ceDAapf+xsxeiuvKWmMnf9au3FzChHLBw7V7aArnyWBFPZowIZaFjELkDJHIuXQJGxnX
 TFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xg5LLOd+ZVZa0FCK1UJtEwXy6lwS6Y0I8bC/j0Z8unY=;
 b=Tf5o0w1jEmrroAAhB63qS7fxKAugyLYPAoZEAkrVSyDcXlKwjFVYo538Q6vXRBeCuu
 MksstxGAljjS8aepS4xyS/1O0I5q4DTIpd9j7GmYtjQGFSkr0PGWYbBvUovu01ordqdc
 5OlEE9LRe4nY81dBjEI3YeZR0v1Z8A49p7jkGF06fneZnH0WWim2cbKn7fa+lU+TGgdZ
 9LOy2Q73qXw03pobFlBLwYG5re9AehWAV6PgNcZirqbJLys0fVnfbMN20fgKPfMxQpLl
 /1iuI/rMGk+E4rj1mYpLXtjtZWwL7yknjoXtz1GzHc1uoJtJqPVzKUeFWAS5IQCrbPcE
 7jYQ==
X-Gm-Message-State: AOAM531a9VncLLYPf5cfmMMnH5WCJsqydMzQrHJICD8dpgkmpk828Hyv
 yBQPCZcPlpvV1IK1kKl8epIuNQ==
X-Google-Smtp-Source: ABdhPJxQU7cVaBcuwAUjW5jYV/z2bowE9LH3Fqf1isF2WVeMYXsNhH1VdmY3+EpLQvuU3iYOTUSq9Q==
X-Received: by 2002:a05:6830:1c65:: with SMTP id
 s5mr2542557otg.256.1627660570521; 
 Fri, 30 Jul 2021 08:56:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t7sm353447otl.25.2021.07.30.08.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 08:56:09 -0700 (PDT)
Date: Fri, 30 Jul 2021 10:56:08 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: ohad@wizery.com, mathieu.poirier@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, tzungbi@google.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 3/4] dt-bindings: remoteproc: mediatek: Convert
 mtk,scp to json-schema
Message-ID: <YQQhGNeT/A5NLjdz@builder.lan>
References: <20210728035859.5405-1-tinghan.shen@mediatek.com>
 <20210728035859.5405-4-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728035859.5405-4-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_085612_726172_625E0548 
X-CRM114-Status: GOOD (  29.37  )
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

On Tue 27 Jul 22:58 CDT 2021, Tinghan Shen wrote:

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

The '|' means that you want to preserve the formatting of the text
segment, there's no need for that.

> +      Should contain the address ranges for memory regions SRAM and CFG,
> +    maxItems: 2
> +
> +  reg-names:
> +    description: |
> +      Contains the corresponding names for the two memory regions. These
> +      should be named "sram", "cfg".

  reg-names:
    items:
      - sram
      - cfg

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

  clock-names:
    const: main

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names

The old binding, and the comment about clocks above, says that clocks
and clock-names are required for mt8183 and mt8192.

> +
> +patternProperties:
> +  ".*":
> +    if:
> +      type: object
> +    then:
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

What additional properties do you expect?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;

Skip soc and the two #-cells, and rewrite the reg to only use 1 address
and size-cell.

> +        scp: scp@10500000 {

The label doesn't add value in the example, please skip this.

> +            compatible = "mediatek,mt8183-scp";
> +            reg = <0 0x10500000 0 0x80000>,
> +                  <0 0x105c0000 0 0x5000>;
> +            reg-names = "sram", "cfg";
> +            clocks = <&infracfg CLK_INFRA_SCPSYS>;
> +            clock-names = "main";

Can you please also add a subnode, to capture that part of the binding
as well?

Regards,
Bjorn

> +        };
> +    };
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
