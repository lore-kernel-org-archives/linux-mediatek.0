Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2886CC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 20:24:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0EF122C7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 20:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0EF122C7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2OoK2RhPMdLFnGiI62C8f1Bf6jZd4jvHJq7tOD2MLEs=; b=1jtOJhEYaeRf5SWfzS0Ev9W2k
	cpaEMk8zAxvePt7F2vw9s6dfG76u70wuOmoVni1Njc8wRgBtPlogjLVGiJnBeoCVMEgl2p44BiP45
	twVORt0R2sSUVHuKsGQSwfwlozf2NqWU0EJ/CBVW7C84kS6pOJwjRJZllJHh1yQi3MfzLdJ8xMCG2
	1IDR3lbm+l5IKERx4YKVM6RdvLbnHinFEDg04vAVPqglIELh/IpEW1gvtJuixBHI8QcyhtGh71sV6
	nVbKOOG5Zekw4fn/7zgV6UrnG1fdKklPlX7Nn5cRiz6+dbzqsob87BQXS1HaBdlr49RFBa9pZFwB9
	vcESUeYbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz3jC-0002KJ-Qr; Mon, 11 Jan 2021 20:23:51 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz3j9-0002J4-5U; Mon, 11 Jan 2021 20:23:48 +0000
Received: by mail-oi1-f173.google.com with SMTP id s2so723351oij.2;
 Mon, 11 Jan 2021 12:23:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N+l7oEoC2Gtdd3tsUSXfbCD3VNBOdwhPR2for7AGSP0=;
 b=sKF/JTmoofTJpE+ytq/1wO0xt4TM/q100yxvLq5m5Z4SKvkY3uWQNVZBTSnmUm3Gr+
 Cpwv5lAFJOFYztN7n3Y6heIdUYsvLRnqxx7HPGcFjS+eqGh7Upb0xfYRle/poJpjtvVm
 zlVla1ZEOtevwmNGa+wW0Dj8Ok15GBciL1AOhK8MGWt9B/OrgBuuWyP8OULjMxWM5gWP
 DT7QD/Od0Ugu+Sx9yUeHoGiK8QgEgyl/3+sFjfRlcbWi3mwdk7+bybtvQp4vljtHO9JJ
 OIGqoLWSbKh+AmsedRbgXFJsfIFZofoSU2KryU9iQMiRpxzCb26lS2MOdGahEuS+zg1l
 jAJQ==
X-Gm-Message-State: AOAM5327V6SoKc2ovUKrdZqJiQUS5wulcICB7RV5lKKtcBUWD6W6Wohd
 chbrpyuETOq1divwdXukSm9izUYkUg==
X-Google-Smtp-Source: ABdhPJwWxknOlQUQyjNGUH3P7COKkSvblU0b4yZxPrYfjVei7f813EPmKrrInAQ0BrcWWGXpSQEl5g==
X-Received: by 2002:a05:6808:8f0:: with SMTP id
 d16mr344964oic.47.1610396626307; 
 Mon, 11 Jan 2021 12:23:46 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v4sm171269otk.50.2021.01.11.12.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 12:23:45 -0800 (PST)
Received: (nullmailer pid 3005685 invoked by uid 1000);
 Mon, 11 Jan 2021 20:23:44 -0000
Date: Mon, 11 Jan 2021 14:23:44 -0600
From: Rob Herring <robh@kernel.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v10 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Message-ID: <20210111202344.GA2999777@robh.at.kernel.org>
References: <1609222629-2979-1-git-send-email-hector.yuan@mediatek.com>
 <1609222629-2979-3-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1609222629-2979-3-git-send-email-hector.yuan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_152347_283971_B80906CA 
X-CRM114-Status: GOOD (  19.76  )
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
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 29, 2020 at 02:17:09PM +0800, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add devicetree bindings for MediaTek HW driver.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  116 ++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> new file mode 100644
> index 0000000..53e0eb3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> @@ -0,0 +1,116 @@
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
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: true

This is only correct on common bindings which are incomplete. You need 
to define '#performance-domain-cells'.

And this is all dependent on performance-domains binding being accepted.

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
