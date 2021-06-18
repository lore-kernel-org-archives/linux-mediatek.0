Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F16EC48BDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 19:10:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 075306100B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 19:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 075306100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYiVOcVRAIQf1oxZ8qegOM2bg7Rvno7iOK6uqHYx+D4=; b=p1TvO46UiVXjZX
	qgoo6VuCSTBtjrtHLN5fVRF9o00vSqOY1V1AB57NFWWsoK54HHlY69pMWPzgRv5hiwc4iL/ydyivu
	ajlqTifS/HQNI+HZ64SQBCxuDJYfgWkbFecZV9I9+RarTsEZCz5YZ0vt3XT8iRQ2/sGxa5BTEXsPD
	QrVVW87/rkj/4T+nW0pZALQyBQSO8qCtPTTISkQgl7l+EeTqGki9VmOlKsXLJnDPVz0NA4YQRQdjO
	a14TQRRrWgFf6nA1muwkYuCAFNlceHZG+++oo2KK1hrw4vfeIbEYc068/ksmVNW4s84QFTKWmI9XF
	iLTGSGrPvo0xM/xOL/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luJso-00FG86-BP; Fri, 18 Jun 2021 19:10:26 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luJsb-00FG6K-Kg; Fri, 18 Jun 2021 19:10:15 +0000
Received: by mail-oo1-f43.google.com with SMTP id
 d27-20020a4a3c1b0000b029024983ef66dbso2705640ooa.3; 
 Fri, 18 Jun 2021 12:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=daEJxXx4kGgQjf5gbnT7Q2a5f94zl/Y1PbDu72pCGuA=;
 b=VRRDQfQIXL1sqrlUbjocarul9a1hmvAZxvZXH0SkMnnea1GRFJqjoPakmPmrryuUpM
 D3kn/LnSlrPkRlvnNxcG31oer6UI28CDPZRM41Dh6efVczWjQniRVvsxD9JuMbke3gG6
 4/i/qZzfJu6LhQ0ucEgOKUUAZYDQ2BMfNQR0p0iUtLCyKU3w5pEr50nGTu7IEpY3YwQ0
 YcyBhTzX77zPIJV3Qxu96oH+pmCG1qnE0xTQ0006skXMzXdi4RekJA/bvg2hZGOicP33
 RWLTryYCQY0qmz9+jmBetjfWbxenVdzgq1xr2tw26okcfdFn8k2dyV8rVorZfltDgej0
 NsSA==
X-Gm-Message-State: AOAM5322BWDUFZl+BX5KAL4Pe++S6AdOpD9mi1UjhWvj2MTTA27X5AMh
 1EbfWokuVd0A2u4RLrQU1Q==
X-Google-Smtp-Source: ABdhPJzYycg7M/u2vTWyigX0DR29r/E95lU8Z7lGuBbGyiTV0doykatrXGVzFhx4S8iGthmRHLvppQ==
X-Received: by 2002:a4a:d781:: with SMTP id c1mr10281257oou.23.1624043412611; 
 Fri, 18 Jun 2021 12:10:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id v203sm1970825oie.52.2021.06.18.12.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:10:11 -0700 (PDT)
Received: (nullmailer pid 2636260 invoked by uid 1000);
 Fri, 18 Jun 2021 19:10:07 -0000
Date: Fri, 18 Jun 2021 13:10:07 -0600
From: Rob Herring <robh@kernel.org>
To: Ben Tseng <ben.tseng@mediatek.com>
Cc: Fan Chen <fan.chen@mediatek.com>, Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 srv_heupstream@mediatek.com, Eduardo Valentin <edubezval@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Michael Kao <michael.kao@mediatek.com>
Subject: Re: [PATCH v5 3/3] dt-bindings: thermal: Add binding document for
 mt6873 thermal controller
Message-ID: <20210618191007.GA2633228@robh.at.kernel.org>
References: <20210617114707.10618-1-ben.tseng@mediatek.com>
 <20210617114707.10618-4-ben.tseng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617114707.10618-4-ben.tseng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_121013_727019_7D1360ED 
X-CRM114-Status: GOOD (  19.70  )
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

On Thu, Jun 17, 2021 at 07:47:07PM +0800, Ben Tseng wrote:
> From: Michael Kao <michael.kao@mediatek.com>
> 
> This patch adds binding document for mt6873 thermal controller.
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> ---
> This patch depends on [1].
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210524122053.17155-7-chun-jie.chen@mediatek.com/
> ---
> Feature: Thermal Management
> 
> Change-Id: Ibe06c699c6edc870aaee95170c3f182d1889472d
> ---
>  .../thermal/mediatek-thermal-lvts.yaml        | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> new file mode 100644
> index 000000000000..69ffe7b14c21
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/mediatek-thermal-lvts.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek SoC LVTS thermal controller (DTS) binding
> +
> +maintainers:
> +  - Yu-Chia Chang <ethan.chang@mediatek.com>
> +  - Ben Tseng <ben.tseng@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6873-lvts
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: lvts_clk

Not really a useful name. I'd just drop 'clock-names'.

> +
> +  "#thermal-sensor-cells":
> +    const: 0
> +
> +required:
> +  - "#thermal-sensor-cells"
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/thermal/thermal.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +    dts: lvts@1100b000 {

thermal-sensor@...

> +        compatible = "mediatek,mt6873-lvts";
> +        reg = <0x1100b000 0x1000>;
> +        clocks = <&infracfg CLK_INFRA_THERM>;
> +        clock-names = "lvts_clk";
> +        #thermal-sensor-cells = <0>;
> +        interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +    thermal-zones {
> +        cpu_thermal: cpu-thermal {
> +            polling-delay-passive = <0>;
> +            polling-delay = <0>;
> +
> +            thermal-sensors = <&dts>;
> +            trips {
> +                cpu_alert1: cpu-alert1 {
> +                    temperature = <85000>;
> +                    hysteresis = <0>;
> +                    type = "passive";
> +                };
> +
> +                cpu_crit: cpu-crit {
> +                    temperature = <120000>;
> +                    hysteresis = <0>;
> +                    type = "critical";
> +                };
> +            };
> +
> +            cooling-maps {
> +            };
> +        };
> +    };
> +...
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
