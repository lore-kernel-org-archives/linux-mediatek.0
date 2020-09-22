Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C5DC2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 20:29:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 215D02223E
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 20:29:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RlR+kaM5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 215D02223E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6qPhxcCNzgKSQLEoqILzY3cUIM2R6c6/NAab/29hJDA=; b=RlR+kaM5gEpFtuWHhOqLZgmGP
	sUh+k7P27xHnVFLHghUePaTv74mv8WBq6bheRHEBZ947UhdGeLhoIb1kX1PYjMFPjlz8YrJ7+7ybn
	KCp0JAZD0Ys28Tjps5cH2zqfbQxLXvDsal1PRT7yk4M+m040nZbTThUyqzjL8UH2WL9Wv1qdgkfxU
	2SUrDgQFT3hd2JdSTky9No0FyjXN8R/e7GfEPcSCjz4uhr9qmc3PArA2ZqxuovM3CJteTwR0erc1/
	gPC5D7vUSjZIsAX/199YoG7irad3dluAbzL12C7/zMYrgUtX4AYUiMC+3iaPXq4JEKTYrrcDMty0f
	0iG34B2yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKouJ-0003MR-R1; Tue, 22 Sep 2020 20:29:00 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKouG-0003L4-V4; Tue, 22 Sep 2020 20:28:58 +0000
Received: by mail-il1-f196.google.com with SMTP id a19so18620040ilq.10;
 Tue, 22 Sep 2020 13:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sG3/4Sm2TbdfoNZTEErI9bYJSMt9tAsj3PNbFfGW440=;
 b=JO1iJeJcanmoUoC6pCiZCOr/gLMBMabfoDPzy7exVTqylpjLdAb0IdpxGm9FHTvZNe
 1mbApdbtVFlXl0v6umU8KOgUnrX8nZwST3LyqJQEq6a2sMaDWwdy9ylcQBme+BevFTFM
 sqGDpKZFjWU6tfhITQ4OoNXvwtfz02PX3E99f5NAvzIvCR9KIwFtLrXfSL80osKILM4I
 un2M9rMLuk8HwRIat1s1XzvnxZhJLGDI0Q/S38sKzzlXoqquQqM05rBD6OaQjtzb3PLI
 +JuRjtzRz15MruMR2mss1NXybSBoKvVyl19Oxgiv3IDhHPmasCViuY6P600zDJqz0VR5
 hq9g==
X-Gm-Message-State: AOAM53284uZZecmGzogJFS1YSNNbewWJ6fhjtFGAgiAmWGEDs7S2BBdj
 els4LMP/0DbNb/VXzgG8sw==
X-Google-Smtp-Source: ABdhPJwa0z2waMXySa0O+m+dIuO8EDFkC94aAPAWjkmJ8FNwkvzwEn3oTHwvj7PfsYkpPqkQ+KyLPg==
X-Received: by 2002:a92:99cb:: with SMTP id t72mr5775658ilk.172.1600806535543; 
 Tue, 22 Sep 2020 13:28:55 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id u15sm7898833ior.6.2020.09.22.13.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 13:28:54 -0700 (PDT)
Received: (nullmailer pid 3186311 invoked by uid 1000);
 Tue, 22 Sep 2020 20:28:52 -0000
Date: Tue, 22 Sep 2020 14:28:52 -0600
From: Rob Herring <robh@kernel.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Message-ID: <20200922202852.GA3134161@bogus>
References: <1599712262-8819-1-git-send-email-hector.yuan@mediatek.com>
 <1599712262-8819-3-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599712262-8819-3-git-send-email-hector.yuan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_162857_064272_4FF308EB 
X-CRM114-Status: GOOD (  23.62  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2020 at 12:31:02PM +0800, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add devicetree bindings for MediaTek HW driver.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  141 ++++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> new file mode 100644
> index 0000000..118a163
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> @@ -0,0 +1,141 @@
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
> +    const: "mediatek,cpufreq-hw"

Needs to be SoC specific. This stuff is never constant from one SoC to 
the next. 'cpufreq' is a Linuxism. What's the block called in the 
datasheet? Use that.

Don't need quotes either.

> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    description: |
> +      Addresses and sizes for the memory of the HW bases in each frequency domain.
> +
> +  reg-names:
> +    items:
> +      - const: "freq-domain0"
> +      - const: "freq-domain1"

Kind of pointless to have names based on the index. Drop 'reg-names'.

> +    description: |
> +      Frequency domain name. i.e.
> +      "freq-domain0", "freq-domain1".
> +
> +  "#freq-domain-cells":
> +    const: 1
> +    description: |
> +      Number of cells in a freqency domain specifier.

You don't need this. It's not a common binding that's going to vary.

> +
> +  mtk-freq-domain:
> +    maxItems: 1
> +    description: |
> +      Define this cpu belongs to which frequency domain. i.e.
> +      cpu0-3 belong to frequency domain0,
> +      cpu4-6 belong to frequency domain1.

This property doesn't go in the 'mediatek,cpufreq-hw' node. You would 
need a separate schema. However, I think the easiest thing to do here is 
something like this:

mediatek,freq-domain-0 = <&cpu0>, <&cpu1>;

Or you could just re-use the OPP binding with just 0 entries:

opp-table-0 {
  compatible = "mediatek,hw-operating-points", "operating-points-v2";
};
opp-table-1 {
  compatible = "mediatek,hw-operating-points", "operating-points-v2";
};

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#freq-domain-cells"
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
> +                mtk-freq-domain = <&cpufreq_hw 0>;
> +                reg = <0x000>;
> +            };
> +
> +            cpu1: cpu@1 {

Unit address is wrong.

> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                mtk-freq-domain = <&cpufreq_hw 0>;
> +                reg = <0x100>;
> +            };
> +
> +            cpu2: cpu@2 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                mtk-freq-domain = <&cpufreq_hw 0>;
> +                reg = <0x200>;
> +            };
> +
> +            cpu3: cpu@3 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                mtk-freq-domain = <&cpufreq_hw 0>;
> +                reg = <0x300>;
> +            };
> +
> +            cpu4: cpu@4 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                mtk-freq-domain = <&cpufreq_hw 1>;
> +                reg = <0x400>;
> +            };
> +
> +            cpu5: cpu@5 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a55";
> +                enable-method = "psci";
> +                mtk-freq-domain = <&cpufreq_hw 1>;
> +                reg = <0x500>;
> +            };
> +
> +            cpu6: cpu@6 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a75";
> +                enable-method = "psci";
> +                mtk-freq-domain = <&cpufreq_hw 1>;
> +                reg = <0x600>;
> +            };
> +
> +            cpu7: cpu@7 {
> +                device_type = "cpu";
> +                compatible = "arm,cortex-a75";
> +                enable-method = "psci";
> +                mtk-freq-domain = <&cpufreq_hw 1>;
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
> +        cpufreq_hw: cpufreq@11bc00 {
> +            compatible = "mediatek,cpufreq-hw";
> +            reg = <0 0x11bc10 0 0x8c>,
> +               <0 0x11bca0 0 0x8c>;
> +            reg-names = "freq-domain0", "freq-domain1";
> +            #freq-domain-cells = <1>;
> +        };
> +    };
> +
> +
> +
> +
> -- 
> 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
