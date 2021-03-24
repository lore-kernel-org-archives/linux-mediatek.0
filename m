Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CAAC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 16:08:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38BA361A09
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 16:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38BA361A09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AUujSr59TPY5daDG57Wsk1yoe7Ig5X1nWZC/I4KGrcs=; b=bu/0UnBLAIkJxdpq9M54Rb0ut
	talT/NjvstO8ZQ8qm2/pvjtHkGmHbm89t2WcUpB1IZ6R7Ypx/Df2dS8+QJj/gous1asD7nYyappNk
	Eekhthak0Wui/WRLBm+OPnJyhS31bAKbu72YD2NOBPv+1HkEiaxymtQcLGRHeZQjCnXHFGId5VFnp
	s+rsgH/sCD6/8uhXDwhLIqyyU+sReyGodvEkrEPcbIU1EoZz25X5ILfcnFq0Xg7ONRz4PqoPvP70+
	ctop0yFYqVoak2yh7zneKAPk/8xsMchFp+nFIR055AOfrGD2/HnKYLpipP/A/Rhb6CB0QDqoas5se
	5AbiR8hXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP635-00HLfm-Vq; Wed, 24 Mar 2021 16:08:00 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP631-00HLeo-7c; Wed, 24 Mar 2021 16:07:57 +0000
Received: by mail-io1-f47.google.com with SMTP id z136so22052843iof.10;
 Wed, 24 Mar 2021 09:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+TKJ7TFEwQUAbTBq1YwmMD5zRQ+v2F+z93Rbx7y6w3w=;
 b=GrGJcsTCiXi8xN+F6grB1lymePWer8WOzI72Xr96XOGZand6huXa3pEeCbY/aytXb8
 3TUIl3wQ7cv5aXNLXDMFV7mX6Js6aJB3anVOuV5qlT/QA/35accln9b+kRNTHOXTIuY4
 trvrddnxHoHir/7PwjRZGMel5YubznOrI6n/opBsDkjbPesq1ioJNTtadyNpa/P8DLjA
 zjU8oYJTp7PTAL4mRvu0JmYERRea0vp85w4nZ5Bt5tK8LV0dDrcRVl/UcI+oRX5dhNIr
 qFOybgtvvnEAIUVgb0uUeqjSqs1ZQLD6ppXt+UwRyCGfW/J6b6Ylj9bGu8GV11eon3zv
 dzIw==
X-Gm-Message-State: AOAM533cDqpFElIDyBr+qOcQZcGAV4XUXhowPBXxf0IhFg5QyRWMGes6
 j9z6g5S0TMQ2lZQ9jKbsYg==
X-Google-Smtp-Source: ABdhPJya1dN4uozCjZmQ2auHAPj9umaWDlRyWBJXtu3w7IXLRDTFyu35xHocwAJF6I49H2oa8mwhzg==
X-Received: by 2002:a5e:980e:: with SMTP id s14mr3134530ioj.63.1616602073375; 
 Wed, 24 Mar 2021 09:07:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id x2sm1279900ilv.36.2021.03.24.09.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 09:07:52 -0700 (PDT)
Received: (nullmailer pid 3162147 invoked by uid 1000);
 Wed, 24 Mar 2021 16:07:50 -0000
Date: Wed, 24 Mar 2021 10:07:50 -0600
From: Rob Herring <robh@kernel.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v11 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Message-ID: <20210324160750.GA3154702@robh.at.kernel.org>
References: <1615549235-27700-1-git-send-email-hector.yuan@mediatek.com>
 <1615549235-27700-3-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615549235-27700-3-git-send-email-hector.yuan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_160755_373690_485EAD13 
X-CRM114-Status: GOOD (  23.54  )
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

On Fri, Mar 12, 2021 at 07:40:35PM +0800, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add devicetree bindings for MediaTek HW driver.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  127 ++++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> new file mode 100644
> index 0000000..0f3ad47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> @@ -0,0 +1,127 @@
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
> +
> +properties:
> +  compatible:
> +    const: mediatek,cpufreq-hw
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    description: |
> +      Addresses and sizes for the memory of the
> +      HW bases in each frequency domain.
> +
> +  "#performance-domain-cells":

A common binding schema for this and 'performance-domains' needs to land 
first.

> +    description:
> +      Number of cells in a performance domain specifier. Typically 0 for nodes
> +      representing a single performance domain and 1 for nodes providing
> +      multiple performance domains (e.g. performance controllers), but can be
> +      any value as specified by device tree binding documentation of particular
> +      provider.
> +    enum: [ 0, 1 ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#performance-domain-cells"
> +
> +additionalProperties: true
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
> +
> +            cpu1: cpu@100 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                performance-domains = <&performance 0>;
> +                reg = <0x100>;
> +            };
> +
> +            cpu2: cpu@200 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                performance-domains = <&performance 0>;
> +                reg = <0x200>;
> +            };
> +
> +            cpu3: cpu@300 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                performance-domains = <&performance 0>;
> +                reg = <0x300>;
> +            };
> +
> +            cpu4: cpu@400 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                performance-domains = <&performance 1>;

Seems a bit odd that a55 and a75 share a perf domain?


> +                reg = <0x400>;
> +            };
> +
> +            cpu5: cpu@500 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                performance-domains = <&performance 1>;
> +                reg = <0x500>;
> +            };
> +
> +            cpu6: cpu@600 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a75";
> +                enable-method = "psci";
> +                performance-domains = <&performance 1>;
> +                reg = <0x600>;
> +            };
> +
> +            cpu7: cpu@700 {

Do we really need to show 8 cores to show how to use this binding?

> +                device_type = "cpu";
> +                compatible = "arm,cortex-a75";
> +                enable-method = "psci";
> +                performance-domains = <&performance 1>;
> +                reg = <0x700>;
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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
