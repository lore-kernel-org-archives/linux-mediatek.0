Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4E5C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 17:08:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D93222388C
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 17:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D93222388C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JAE3FziugFKIILeTDBhzL+4zL9NQbSfZ8cC6owtXnFo=; b=fGatbb4PsJ6+SFDSxcLIhjq+s
	p86SUNdiKq4swIlB3zlZrwVoH515GIWiZUoKMEda6YAtZaUKYwgAOLK345PZ3ojRKB6azyPjLjaF4
	+RYNScOM6Wm09mVvhc4CZty1SOxgR3kWAZspqBwYLJ3e1EixKI/nC/G6cItaAJwvJNjQPJs1+h273
	U0ii73582c7xB3PKMVG26AvYroYdtTy94IB0djZP0DkacUb9r7j6VIPkph9m6jlaZnGXUO+Mtlhkj
	vsscIw+aWcHp3bXIDHtIcDt7htDcMTZhi+Hm/IW4drpGAiiV7ZL0d6PZ+ezvPNWrmCNryegOsS0pp
	xTyLIFoxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmJzi-0007mV-Sq; Mon, 07 Dec 2020 17:08:15 +0000
Received: from mail-oo1-f65.google.com ([209.85.161.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmJzd-0007kz-7w; Mon, 07 Dec 2020 17:08:10 +0000
Received: by mail-oo1-f65.google.com with SMTP id w9so3339554ooh.13;
 Mon, 07 Dec 2020 09:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SogwgdPzZLs7UQaCL9uSzW/XvOBxKSbmidKt0mKHBqM=;
 b=Cab8r8Q0ZnfNajybqH2qW+mGeT4qBvGE+tY0y6P3iRGEpHkRDXdX4LwtRriTdxwFMd
 FY6QFa2PkzopgfHVddsfKy93ZOB4XHV+jvX9F0xH9wr5s9u7XBqvxqnr8Zc7C3sDSpRR
 R+BdjyyaB1xuqLku9XRvQ+NhX/Jc+8FlxfZgNf5VIQoVk7rF7Jdi4kXDh83QCG3XTsOt
 L/Z6ledQ8bLHHzftO88Zf93gd6q7vsmyPjK6K+mDlf6RUjuttgz03faxNqDEqGWyPkvl
 fAkw38J6hEWtaFCB56ujyap6m6NmTsuvO1OFRdpNbd9g2DpktIRpuoUK4Ioo0ot4Sap8
 rTKw==
X-Gm-Message-State: AOAM533h7kDvLoFn5kHi55BUSgJuHtrwO7m2eE+IQFMst8i14zC6knCF
 H5mfguNYMJYviaZ8qMICqQ==
X-Google-Smtp-Source: ABdhPJzmdnrsrHxYVXf/qeAQGbpnlZ7/zYKbrxltqs4VunJ1rWtUE6YSlqOlmfjWhHbswR7eYMS+4w==
X-Received: by 2002:a4a:3e42:: with SMTP id t63mr1568149oot.32.1607360878900; 
 Mon, 07 Dec 2020 09:07:58 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k13sm2929820otl.72.2020.12.07.09.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 09:07:58 -0800 (PST)
Received: (nullmailer pid 445307 invoked by uid 1000);
 Mon, 07 Dec 2020 17:07:56 -0000
Date: Mon, 7 Dec 2020 11:07:56 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Kao <michael.kao@mediatek.com>
Subject: Re: [PATCH 3/3] dt-bindings: thermal: Add binding document for
 mt6873 thermal controller
Message-ID: <20201207170756.GB439416@robh.at.kernel.org>
References: <20201207063127.28051-1-michael.kao@mediatek.com>
 <20201207063127.28051-4-michael.kao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207063127.28051-4-michael.kao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_120809_446482_874ADBC6 
X-CRM114-Status: GOOD (  19.01  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Eduardo Valentin <edubezval@gmail.com>, ethan.chang@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 07, 2020 at 02:31:27PM +0800, Michael Kao wrote:
> This patch adds binding document for mt6873 thermal controller.
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> ---
>  .../thermal/mediatek-thermal-lvts.yaml        | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> new file mode 100644
> index 000000000000..745611718c0a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/mediatek-thermal-lvts.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek SoC LVTS thermal controller (DTS) binding
> +
> +maintainers:
> +  - Yu-Chia Chang <ethan.chang@mediatek.com>, Michael Kao <michael.kao@mediatek.com>

Not the right format. 1 email per entry.

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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
