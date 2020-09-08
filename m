Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF17C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 10:07:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AD3B2078B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 10:07:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cBaLdah7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJ5s0TM9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AD3B2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A78muFUCnWsD4jzccD3O2LCHUVIk7ZdBreDm9bpeiPw=; b=cBaLdah7nYNqnHrQjziwEHZKP
	BhMw0hWBCEqQmVgF/xOMiVh/wPgAP7jlcDJIApWfQFmv9NrxxUnd6pnHt5L9C+547bXNKaTfgc1Vh
	aC6lgAm4KQY2tPn6IJ2yju2oXKlrl/DR8UzbDKG+doFL+FiGJH4KDTPWX8Q3rxPDR+85XFMnWgBa1
	Jw2jCQQnmgGrk9aLXsA4lyj9UC+ZSBC+C+C4AsftwlCNTKi45ltALg2W5g9RvKc+pSQ5kHqp1UFG4
	hyFLhF9k3GE2A9e2mCtd/fNc9nDq13hqpx6sP3Ks3U70OCJUTt+u+4MAjW3i1oxcPcO1KHmWYehTN
	fpJeIG4nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFaXV-0005hl-8K; Tue, 08 Sep 2020 10:07:49 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFaXP-0005gE-LL
 for linux-mediatek@lists.infradead.org; Tue, 08 Sep 2020 10:07:45 +0000
Received: by mail-pf1-x441.google.com with SMTP id o20so10544268pfp.11
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2020 03:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hU3oOvvnKV3sVS60ywXkD1wU0kB70X7AUVyTyZd2RY4=;
 b=AJ5s0TM9s5OJw66KaolPB8BsjovKw8GrEqoKSEGdJRI8ZS3Xh22wOFQ72Jp5UEz9QT
 QL14QkPFwkvl96bfp3dchyut4RLzlQqsVf5x1mwYYY1ZUo/vcJBg5evkvgZMdz+OZiFO
 ejQuvUh9+00emp0HrgEBJePDPEjuP9ERlmDgq2vfWH8a+TJqz3lUit2tW6+d9KqCszKf
 x3B0HD2+XG0KZZl3Ov/+RAv9oldBfoGC04efRlw9TosIeO3L9TtIjALv2b5zw/qnxOa2
 effhj1ijvXKzFiSKxYItEwdlRgjXYWztCYzBFmRwBEPppenKGFSdDN0Sg7r4aaqZVssz
 yk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hU3oOvvnKV3sVS60ywXkD1wU0kB70X7AUVyTyZd2RY4=;
 b=U6b3NYkzXcqd0GIUVuY9wlSgK1TsdJf26IQjFkcbN1hov9/GDZ6/Y+IcyyoGHNpHmh
 Gwkek/WhPX2MaD39RQb2UEPFGoVG3R+WRx8qYt5wm0Wj6lvK2lEs4kiWVYgm/5FiP+y5
 YfQl0TX9DIFq447jyN0sxOBi4blpSWqyLaxl7r2/mNsrb3wt5evei+Q6B5xKbZjUNOvg
 HntmGhgEN+oFHx7AzYqVi3DvUKuaQmZgxgPqC9MjZ+yVU0KPxXr8rHmD0QyAUkep9sq3
 FJfflvmUjemPDTNy7xOkpS9G5ETQKk+DqWunywBTkqSuUXVbbchYnrZEmnOoXslbxaaL
 kGDA==
X-Gm-Message-State: AOAM531iKr866lzLFg8DJ3edNvP7gv/DLItZZT8EVwtumLa8A0QNprsF
 SksLOGLf93AxnouNTHJD5A3Pqw==
X-Google-Smtp-Source: ABdhPJweEpB8wgJ9j3N1o+hvbAzIUldosNCWC9AYOg0yuTLIAoB7iMZYQXNSkkxkjZQyFOSNJIhNnw==
X-Received: by 2002:a65:6545:: with SMTP id a5mr20129366pgw.43.1599559661151; 
 Tue, 08 Sep 2020 03:07:41 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id s198sm14749540pgc.4.2020.09.08.03.07.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Sep 2020 03:07:40 -0700 (PDT)
Date: Tue, 8 Sep 2020 15:37:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Message-ID: <20200908100733.pbizjorq3lmn7bew@vireshk-i7>
References: <1599550547-27767-1-git-send-email-hector.yuan@mediatek.com>
 <1599550547-27767-3-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599550547-27767-3-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_060743_783306_B1490BFD 
X-CRM114-Status: GOOD (  20.85  )
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
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08-09-20, 15:35, Hector Yuan wrote:
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
> index 0000000..5be5867
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
> +    const: mediatek,cpufreq-hw

Missing "" here ?

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
> +    description: |
> +      Frequency domain name. i.e.
> +      "freq-domain0", "freq-domain1".
> +
> +  "#freq-domain-cells":
> +    const: 1
> +    description: |
> +      Number of cells in a freqency domain specifier.
> +
> +  mtk-freq-domain:
> +    maxItems: 1
> +    description: |
> +      Define this cpu belongs to which frequency domain. i.e.
> +      cpu0-3 belong to frequency domain0,
> +      cpu4-6 belong to frequency domain1.
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

I would need Ack from Rob for this.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
