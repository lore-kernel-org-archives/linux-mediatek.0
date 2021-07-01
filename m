Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2904EC11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 20:19:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC84261413
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 20:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC84261413
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+i5hlkbF+UcikEPa/dGhtH52pZtmSv8saX5HgyEiIlY=; b=T7IA8UBRxZW5MM
	Tqd2PgZewtmuCpFJ2NLPQG8ImscT3wLMRPWCAnCDpfYR0NzsVtGPHNrS1GxxFNjmKKDOZ7fU/Zequ
	SSisxybtRXdtc17iBxCWeQU4ip+g58bFIKgnRJ1DvUylD0WpGisUrbBpsF0jN5UxqCygeabH1b0l6
	ljRk2A9AhnG/ag4d3Rcmd3IvmWP34rSG3ys3k3oKdhco6b3iHr+lrDCJ5N5elxr+hoJlmnxEG1ob6
	wwamu//X4o4om/yljxQ3fNrdz31houY3lwqya+5WrYecC1dqsrtiuO10lpypl201oFODEwxRvPAji
	mu4EE3mN05Tx4dh40tPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz39E-00120G-7j; Thu, 01 Jul 2021 20:18:56 +0000
Received: from mail-il1-f172.google.com ([209.85.166.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz39B-0011yw-9z; Thu, 01 Jul 2021 20:18:55 +0000
Received: by mail-il1-f172.google.com with SMTP id f12so1332735ils.11;
 Thu, 01 Jul 2021 13:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jkKNz83v8bTKAmVdHO7nGUak++aeSsOWlXuVgcISOl0=;
 b=qvjaUEiNC+uc8eT/obj7IbUMmi8qe78GSQKOZeMXUGcVAGmh6pEF+WdoSfr/nQ84vZ
 nvMcyf0pnFPOqMc+LdYKxlVG09kSKZUi4/cdju28UpnCqUacfCvajnOR69o3UDGJ11Jd
 YqUyrcWa5z5IAT/lkw9SfDMuM+L8tHudm7wPPfUYeBNht1eB3ga027nWi1th69y28nWz
 ckMUUXh9+MYZn0ngHWdFQP2xE7BbY3FsjNEoPRgYY7QR0i/k/7mazayOKGAqI7gkUbjU
 2I98nIVXWR8RkXdvS+snVA+Goymat1L6Z6jCmqiUEEHGa0pKKfQBbLzsSVvJGUdV3BV4
 2Nhg==
X-Gm-Message-State: AOAM5337eIKXfk5BVtF5JwXdpMJIXrlG55B04OzkXedVTMauyV8Gti41
 qgrC9kr+NOJAQwcTAxYI8g==
X-Google-Smtp-Source: ABdhPJxtxgEA4kNkOytbyFpCO9NEcYOLLKLdFA7tA79AD7cIrlqW3i8z2e3RRRGjRSL7hT+sxY+b4g==
X-Received: by 2002:a05:6e02:1292:: with SMTP id
 y18mr896855ilq.30.1625170732037; 
 Thu, 01 Jul 2021 13:18:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id u16sm419388iob.41.2021.07.01.13.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 13:18:51 -0700 (PDT)
Received: (nullmailer pid 2858275 invoked by uid 1000);
 Thu, 01 Jul 2021 20:18:46 -0000
Date: Thu, 1 Jul 2021 14:18:46 -0600
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, bicycle.tsai@mediatek.com, jiaxin.yu@mediatek.com,
 cychiang@google.com, aaronyu@google.com
Subject: Re: [PATCH v2 6/8] dt-bindings: mediatek: mt8195: add audio afe
 document
Message-ID: <20210701201846.GA2783836@robh.at.kernel.org>
References: <20210629014736.31153-1-trevor.wu@mediatek.com>
 <20210629014736.31153-7-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210629014736.31153-7-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_131853_412135_91B9FD11 
X-CRM114-Status: GOOD (  21.97  )
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

On Tue, Jun 29, 2021 at 09:47:34AM +0800, Trevor Wu wrote:
> This patch adds mt8195 audio afe document.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
> This patch depends on the following series that have not been accepted.
> 
> [1] Mediatek MT8195 clock support
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=501923
> (dt-bindings/clock/mt8195-clk.h is included)
> 
> [2] Mediatek MT8195 power domain support
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=500709
> (dt-bindings/power/mt8195-power.h is included)
> ---
>  .../bindings/sound/mt8195-afe-pcm.yaml        | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
> new file mode 100644
> index 000000000000..a4fb5c7dd022
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8195-afe-pcm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek AFE PCM controller for mt8195
> +
> +maintainers:
> +  - Trevor Wu <trevor.wu@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8195-audio
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mediatek,topckgen:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of the mediatek topckgen controller
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: audio 26M clock
> +      - description: AFE clock
> +      - description: audio infra sys clock
> +      - description: audio infra 26M clock
> +
> +  clock-names:
> +    items:
> +      - const: clk26m
> +      - const: aud_afe
> +      - const: infra_ao_audio
> +      - const: infra_ao_audio_26m_b
> +
> +  etdm-in1-chn-disabled:

Needs a vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 24
> +    description: Specify which input channel should be disabled.
> +
> +  etdm-in2-chn-disabled:

Needs a vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 16
> +    description: Specify which input channel should be disabled.
> +
> +patternProperties:
> +  "^etdm-in[1-2]-mclk-source$":

And all these need a vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specify etdm in mclk source clock.
> +    enum:
> +      - 0 # xtal_26m_ck
> +      - 1 # apll1_ck
> +      - 2 # apll2_ck
> +      - 3 # apll3_ck
> +      - 4 # apll4_ck
> +      - 5 # apll5_ck
> +      - 6 # hdmirx_apll_ck
> +
> +  "^etdm-out[1-3]-mclk-source$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specify etdm out mclk source clock.
> +
> +  "^etdm-in[1-2]-mclk-alwasys-on-rate$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specify etdm in mclk output rate for always on case.

Hz? If so, '-hz' unit suffix and drop the type ref.

> +
> +  "^etdm-out[1-3]-mclk-alwasys-on-rate$":

typo: alwasys

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specify etdm out mclk output rate for always on case.

Hz?

> +
> +  "^etdm-in[1-2]-data-mode$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specify etdm in data mode.
> +    enum:
> +      - 0 # one pin (TDM)
> +      - 1 # multi pin (I2S)

Can be boolean?

> +
> +  "^etdm-out[1-3]-data-mode$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specify etdm out data mode.

Constraints on values?

> +
> +  "^etdm-in[1-2]-cowork-source$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      etdm modules can share the same external clock pin. Specify
> +      which etdm clock source is required by this etdm in moudule.
> +    enum:
> +      - 0 # etdm1_in
> +      - 1 # etdm2_in
> +      - 2 # etdm1_out
> +      - 3 # etdm2_out
> +      - 4 # etdm3_out
> +
> +  "^etdm-out[1-3]-cowork-source$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      etdm modules can share the same external clock pin. Specify
> +      which etdm clock source is required by this etdm out moudule.

Constraints?

> +
> +required:
> +  - compatible
> +  - interrupts
> +  - mediatek,topckgen
> +  - power-domains
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +
> +    afe: mt8195-afe-pcm {
> +        compatible = "mediatek,mt8195-audio";
> +        interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
> +        mediatek,topckgen = <&topckgen>;
> +        power-domains = <&spm MT8195_POWER_DOMAIN_AUDIO>;
> +        clocks = <&clk26m>,
> +                 <&audsys CLK_AUD_AFE>,
> +                 <&infracfg_ao CLK_INFRA_AO_AUDIO>,
> +                 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>;
> +        clock-names = "clk26m",
> +                      "aud_afe",
> +                      "infra_ao_audio",
> +                      "infra_ao_audio_26m_b";
> +    };
> +
> +...
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
