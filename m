Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B3BC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 19:22:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD91A60D07
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 19:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD91A60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MewVA9S4PLKH4RSeAxJZqOR/uFfML0DFEMH6bQXoGRs=; b=nCFnb/cADhDB8x
	9orhI3pNlr6Uc7QglUgpzMAgCzo+pey2GZcY6zqZSVlmXD9lYYKSuwUtt+ZjhhfC9awavbygvsPfn
	t4EOgQPhRNy14pxpAiySG6phDj+qCN8C3bkGKwFTxEd/No+UBEXOGA5kXhtyI8X2Ju9zL+0D3D3/k
	s+QoueHlQo67ZL57qM/Tfy3YhZ/jjU4IBaHL82PHkY9sEiQQjuf2dCOE6Ay+pgsJKObuxhkqj40e3
	2/27W6RpnuRLRe1Op47pN4MsOfSVew2lBQxNWTOZ3ydbi1kCwEafwDNzNqf72tYPK4LHtM1IS/9HK
	x8Fslm/um03YoR1wpOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAzzl-0042YX-RO; Tue, 03 Aug 2021 19:22:33 +0000
Received: from mail-il1-f170.google.com ([209.85.166.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAzzi-0042Xf-LL; Tue, 03 Aug 2021 19:22:32 +0000
Received: by mail-il1-f170.google.com with SMTP id r1so20489876iln.6;
 Tue, 03 Aug 2021 12:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i62AD3moOWwFAL7Cs6cq2TGwdGazIQUY9cbfa6j5bi0=;
 b=iroOLALEzmAF5LzdbiRmczCvelECKtSlhutYyXnS/zAM7OW/y4kwPM9D9S0ruke7Ic
 FNuC/yE/H+EVMlq6WEE5pM2/UJHwGAXPBonNDi0cxHum7zYF91+hw2xhsAck8Js2BMyN
 XTSBSJhIzdhUev+xL5E2U1aiIaXKZIVNdEvpgKf9uJZ8QRLjd1w9K2bJWmmk9exvGq6z
 xO0vw53wbB5wJoQUlctt1zCzXwaDjX4vA6Aoe6WZabk26PkbLDSPxAXEELcifFZeRpP6
 0/PwGSfmIt/T3t2fXt9WTuHxhYkg0qnA/IJaJvcyCLtpziklmnDiF6uUqa6DRKBYKpwq
 Ys8g==
X-Gm-Message-State: AOAM530qFmU2qT4Y+QTNg5desCnJeqb4Svw2ye+mm09/fJftOG9wpXX/
 klTEHJzuK5oBJtWDDK/Fvw==
X-Google-Smtp-Source: ABdhPJwgh9BcVJvgkrinoh/evNe99kSmeAxGbfAvV8Fpg6hFfbIYPTrPAVYCd4p/k1Pi06KLy82qQA==
X-Received: by 2002:a05:6e02:1e06:: with SMTP id
 g6mr621165ila.41.1628018549853; 
 Tue, 03 Aug 2021 12:22:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id p1sm7769629ilh.47.2021.08.03.12.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 12:22:29 -0700 (PDT)
Received: (nullmailer pid 3593480 invoked by uid 1000);
 Tue, 03 Aug 2021 19:22:27 -0000
Date: Tue, 3 Aug 2021 13:22:27 -0600
From: Rob Herring <robh@kernel.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v13 1/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Message-ID: <YQmXc2kofIZacBRw@robh.at.kernel.org>
References: <1627574891-26514-1-git-send-email-hector.yuan@mediatek.com>
 <1627574891-26514-2-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1627574891-26514-2-git-send-email-hector.yuan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_122230_746426_43D68576 
X-CRM114-Status: GOOD (  21.72  )
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

On Fri, Jul 30, 2021 at 12:08:10AM +0800, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add devicetree bindings for MediaTek HW driver.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |   70 ++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> new file mode 100644
> index 0000000..6bb2c97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cpufreq/cpufreq-mediatek-hw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek's CPUFREQ Bindings
> +
> +maintainers:
> +  - Hector Yuan <hector.yuan@mediatek.com>
> +
> +description:
> +  CPUFREQ HW is a hardware engine used by MediaTek
> +  SoCs to manage frequency in hardware. It is capable of controlling frequency
> +  for multiple clusters.

Strange choice of line breaks.

> +
> +properties:
> +  compatible:
> +    const: mediatek,cpufreq-hw
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    description: |

Don't need '|' unless there's formatting to preserve.

> +      Addresses and sizes for the memory of the
> +      HW bases in each frequency domain.

'Each entry corresponds to a register bank for each frequency 
domain present.'

> +
> +  "#performance-domain-cells":
> +    description:
> +      Number of cells in a performance domain specifier. Typically 1 for nodes
> +      providing multiple performance domains (e.g. performance controllers),
> +      but can be any value as specified by device tree binding documentation
> +      of particular provider.
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#performance-domain-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    cpus {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            cpu0: cpu@0 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                performance-domains = <&performance 0>;
> +                reg = <0x000>;
> +            };
> +    };
> +
> +    /* ... */
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        performance: performance-controller@11bc00 {
> +            compatible = "mediatek,cpufreq-hw";
> +            reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
> +
> +            #performance-domain-cells = <1>;
> +        };
> +    };
> -- 
> 1.7.9.5
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
