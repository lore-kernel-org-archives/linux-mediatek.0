Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB52C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 14:48:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78F0523121
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 14:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78F0523121
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ssfkHCdabzjESJinZv7NDWyKkEVyisIkUUUIkyCZEbA=; b=cTExoy2eim3UEyPoxSWmhkxa2
	vixuffCLV9+0ygDk1eedS3I5TEpWcSp/vyigWk2Ya93sW270H6NizI1lc1LNHr4JT1Oa01Oz3vbnC
	qIvCAGL8Hb8knXWo4P+BryUsaLErIgP9M9wn1IhQQ6iNvvrGclqmHLy6ScQo2ZEFWmfwZwx2gcUK0
	csRPZh+Qda06DF6kb3ZlZL1HQbiUUo/E0x+nZv/LBKrh5vtJRmZyPTTs5ZLuHZhLy/qxKnf1m7tM8
	E7jx5L1CCwnEVl88t9FugfpvP2C+Fp4XCbWmrc580ZFytPNVJllolUj9q0d8Wo28hwGJCpArRrhbZ
	uDLBgWM4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzKxd-0007TK-MO; Tue, 12 Jan 2021 14:47:53 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzKxI-0007LS-5x; Tue, 12 Jan 2021 14:47:37 +0000
Received: by mail-oi1-f175.google.com with SMTP id l207so2570715oib.4;
 Tue, 12 Jan 2021 06:47:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fM7xQp3erzKr1NA4fTfzZcmXzvgc/peYjgAUUn7uWyw=;
 b=LM3Jk313KlmBafv9DsWA1ERnISbcOE5W5cXlvpinZBEkaP1eWqIhbMs8fkjB+7A3XE
 2jelRRVb8OnJyI3al4Iud3xNe81NhFoksnHH8wfS9hD7l113IfICIDO8b3fz+aWBS9YQ
 8qqaZQftppAJ8txCfGaDFJRRakbDJcUCGD9wJ/wtOAJVqm9kf6LFa1fv6mBVt87iOBwJ
 dhJ/RtoQ37Be/+irelGHtKdD4lifM3jZsTxnxK4Uw0/z2Xc22ko7z4N1eK2G2O7bLy5B
 MIklfJIYAzvreP9oiwdxsGZcLsVcEEgIbmxDampPB1+U3U4UDQL33vIC85TNawTp4B8+
 wd4Q==
X-Gm-Message-State: AOAM532kgl5dqKariId/yPcNHHd6QduFFszP6IKNyb7KvsiYORDjx3Go
 4tCQ97iMrJ32yhmzFtcqbo2LSuZIvw==
X-Google-Smtp-Source: ABdhPJwcZgbwzeRahJPpZSMpiaWcIjlcHI6CPeiAiAqPyp/VNO1VZhfwn95148OOQWTPVBTGqP0F0Q==
X-Received: by 2002:aca:af8b:: with SMTP id y133mr2510768oie.87.1610462849269; 
 Tue, 12 Jan 2021 06:47:29 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y12sm403965oti.0.2021.01.12.06.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:47:28 -0800 (PST)
Received: (nullmailer pid 327562 invoked by uid 1000);
 Tue, 12 Jan 2021 14:47:27 -0000
Date: Tue, 12 Jan 2021 08:47:27 -0600
From: Rob Herring <robh@kernel.org>
To: Roger Lu <roger.lu@mediatek.com>
Subject: Re: [PATCH v11 1/7] dt-bindings: soc: mediatek: add mtk svs
 dt-bindings
Message-ID: <20210112144727.GA321805@robh.at.kernel.org>
References: <20210107024356.583-1-roger.lu@mediatek.com>
 <20210107024356.583-2-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107024356.583-2-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_094732_308000_6440B6AB 
X-CRM114-Status: GOOD (  21.10  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Angus Lin <Angus.Lin@mediatek.com>, Kevin Hilman <khilman@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, HenryC Chen <HenryC.Chen@mediatek.com>,
 YT Lee <yt.lee@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nishanth Menon <nm@ti.com>,
 Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 07, 2021 at 10:43:50AM +0800, Roger Lu wrote:
> Document the binding for enabling mtk svs on MediaTek SoC.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  .../bindings/soc/mediatek/mtk-svs.yaml        | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> new file mode 100644
> index 000000000000..bb8c345a0c0a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mtk-svs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Introduce MTK SVS engine

Introduce? That's what this commit does, not what this binding is.

> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Kevin Hilman <khilman@kernel.org>
> +  - Nishanth Menon <nm@ti.com>

This should be someone that knows the h/w. Not who applies patches. 
Perhaps you.

> +
> +description: |+
> +  The Smart Voltage Scaling(SVS) engine is a piece of hardware
> +  which has several controllers(banks) for calculating suitable
> +  voltage to different power domains(CPU/GPU/CCI) according to
> +  chip process corner, temperatures and other factors. Then DVFS
> +  driver could apply SVS bank voltage to PMIC/Buck.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8183-svs
> +
> +  reg:
> +    description: Address range of the MTK SVS controller.
> +    maxItems: 1
> +
> +  interrupts:
> +    description: IRQ for the MTK SVS controller.

Drop. That's kind of obvious with only 1 interrupt.

> +    maxItems: 1
> +
> +  clocks:
> +    description: Main clock for MTK SVS controller to work.

How many clocks (maxItems)?

> +
> +  clock-names:
> +    const: main
> +
> +  nvmem-cells:
> +    maxItems: 2
> +    description:
> +      Phandle to the calibration data provided by a nvmem device.

Need to define what each entry is.

items:
  - description: ...
  - description: ...

> +
> +  nvmem-cell-names:
> +    items:
> +      - const: svs-calibration-data
> +      - const: t-calibration-data
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - nvmem-cells
> +  - nvmem-cell-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        svs@1100b000 {
> +            compatible = "mediatek,mt8183-svs";
> +            reg = <0 0x1100b000 0 0x1000>;
> +            interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW>;
> +            clocks = <&infracfg CLK_INFRA_THERM>;
> +            clock-names = "main";
> +            nvmem-cells = <&svs_calibration>, <&thermal_calibration>;
> +            nvmem-cell-names = "svs-calibration-data", "t-calibration-data";
> +        };
> +    };
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
