Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DFEC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 16:52:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A707A60EE9
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 16:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A707A60EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRZkJdAycTQXvZt9lY5rD5HyhSE9k+CLdY60Si99YIQ=; b=v8M83QO8iuCsJW
	CDmbqHE9WN6Pa+nZRojmpLF/yzJ1ZYsyr1PoUydihmzizMOzyrldstVNQ7UrN9Ght3mT93LevaW1l
	wpQiTcAPZQzvzQAi9qTaFt0gYjYmF+s8tUzMnQJEmrl7UtwIqJFiBN0BboJ3mnpxL087DIKbP8e2K
	YfeYhNGkF9S1JLg5Fr7Vkko/gsNqrhWmvtzEFv1STtMmHQXUJjkxJRqQ+cb6qNSrXY08zc39bnsW5
	R7ZN18mM70HP3rVzmAu/d1cTjbZ5f4mkDeqrf4vWukFbTpub1xMMWVoYh0BMQzTE2otCvRbIOYZ0X
	gWfIw+nrMjScYUhnrPTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhx15-002OEg-TA; Tue, 02 Nov 2021 16:52:07 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhwyo-002Mvk-Uj; Tue, 02 Nov 2021 16:49:48 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 o10-20020a9d718a000000b00554a0fe7ba0so25001119otj.11; 
 Tue, 02 Nov 2021 09:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w7OCrf7rifBBMWTmL311h+DC3U5MFxTs2snFaNj8QNE=;
 b=bYGlSEzapAalXgG7lJZPXhU78n/SV24xmiSgkntSyqIjFEsGFKKt6zn0Jm0tFfcClM
 MqToc4NxY44WtlZr2SQmuMKs8lI0dbVz77TxJ1Y8U3hGnQ00ottUDQuBWakJmP3q6n7h
 zEG8JpiW+rvSuFRiCG2lgNyvh/t/GBqXdg+9kLCn139O1DJIn0ej1NsLWKrq3jVbQAAI
 8tn/zrUJjiFnN0yVuYM8pbULfvmQZcOxyKua1eRJVzTRROyVMkAA9jK1Rgy7izCLlsxA
 kU/7L/VBYO0GB6PZUh9v6nmqQktOIZfM6XEGqM3sFFRjsSy4SzuhuGY6KVeGhhKdua9v
 Y6nQ==
X-Gm-Message-State: AOAM533zmHCy+DZt8H9AZ3f/bHe9NqGjdiMRzaP4d7P0TmYx+D+/7dM4
 er5cmqeTAh62tfXo2HklLQ==
X-Google-Smtp-Source: ABdhPJxNkprmX4LIkrnpupfOPtMxMkApEBcH/bSyncViTFJO8577qI0GbUK13qW17fKIYl7dW5ZQaw==
X-Received: by 2002:a9d:6e16:: with SMTP id e22mr27466399otr.77.1635871785382; 
 Tue, 02 Nov 2021 09:49:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q5sm5218662otg.1.2021.11.02.09.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:49:44 -0700 (PDT)
Received: (nullmailer pid 3049381 invoked by uid 1000);
 Tue, 02 Nov 2021 16:49:43 -0000
Date: Tue, 2 Nov 2021 11:49:43 -0500
From: Rob Herring <robh@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, daniel.baluta@nxp.com, trevor.wu@mediatek.com,
 allen-kh.cheng@mediatek.com, angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 2/2] dt-bindings: dsp: mediatek: Add mt8195 DSP
 binding support
Message-ID: <YYFsJ+J9m7QBGpmB@robh.at.kernel.org>
References: <20211028135737.8625-1-yc.hung@mediatek.com>
 <20211028135737.8625-3-yc.hung@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211028135737.8625-3-yc.hung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_094947_064844_1D61D41C 
X-CRM114-Status: GOOD (  23.27  )
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

On Thu, Oct 28, 2021 at 09:57:37PM +0800, YC Hung wrote:
> This describes the mt8195 DSP device tree node.
> 
> Signed-off-by: YC Hung <yc.hung@mediatek.com>
> ---
>  .../bindings/dsp/mtk,mt8195-dsp.yaml          | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> new file mode 100644
> index 000000000000..f113f71ca094
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> @@ -0,0 +1,139 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dsp/mtk,mt8195-dsp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek mt8195 DSP core
> +
> +maintainers:
> +  - YC Hung <yc.hung@mediatek.com>
> +
> +description: |
> +  Some boards from mt8195 contain a DSP core used for
> +  advanced pre- and post- audio processing.
> +properties:
> +  compatible:
> +    const: mediatek,mt8195-dsp
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    maxItems: 2

Need to define what each entry is and the names for them.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    maxItems: 1

Need to define the name. Though -names with 1 entry is not that useful.

> +
> +  clocks:
> +    items:
> +      - description: mux for audio dsp clock
> +      - description: 26M clock
> +      - description: mux for audio dsp local bus
> +      - description: default audio dsp local bus clock source
> +      - description: clock gate for audio dsp clock
> +      - description: mux for audio dsp access external bus
> +
> +  clock-names:
> +    items:
> +      - const: adsp_sel
> +      - const: clk26m_ck
> +      - const: audio_local_bus
> +      - const: mainpll_d7_d2
> +      - const: scp_adsp_audiodsp
> +      - const: audio_h
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  mboxes:
> +    maxItems: 2
> +
> +  mbox-names:
> +    description:
> +      Specifies the mailboxes used to communicate with audio DSP
> +    items:
> +      - const: mbox0
> +      - const: mbox1

Is there not a specific function for each mailbox? You already have an 
index implicitly.

> +
> +  memory-region:
> +    description:
> +      phandle to a node describing reserved memory (System RAM memory)
> +      used by DSP (see bindings/reserved-memory/reserved-memory.txt)
> +    maxItems: 2

1 phandle or 2? If 2, what is each one for?

> +
> +  sound:
> +    description:
> +      Sound subnode includes ASoC platform, DPTx codec node, and
> +      HDMI codec node.
> +
> +    type: object

       additionalProperties: false

Though why do you need a child node here in the first place?

> +
> +    properties:
> +      mediatek,platform:
> +        $ref: "/schemas/types.yaml#/definitions/phandle"
> +        description: The phandle of MT8195 ASoC platform.
> +
> +      mediatek,dptx-codec:
> +        $ref: "/schemas/types.yaml#/definitions/phandle"
> +        description: The phandle of MT8195 Display Port Tx codec node.
> +
> +      mediatek,hdmi-codec:
> +        $ref: "/schemas/types.yaml#/definitions/phandle"
> +        description: The phandle of MT8195 HDMI codec node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - memory-region
> +  - power-domains
> +  - mbox-names
> +  - mboxes
> +  - sound
> +
> +

Extra blank line.

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    adsp: adsp@10803000 {

dsp@...

> +       compatible =  "mediatek,mt8195-dsp";
> +       reg = <0x10803000  0x1000>,
> +             <0x10840000  0x40000>;
> +       reg-names = "cfg", "sram";
> +       interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
> +       interrupt-names = "wdt";
> +       clocks = <&topckgen 10>, //CLK_TOP_ADSP
> +                <&clk26m>,
> +                <&topckgen 107>, //CLK_TOP_AUDIO_LOCAL_BUS
> +                <&topckgen 136>, //CLK_TOP_MAINPLL_D7_D2
> +                <&scp_adsp 0>, //CLK_SCP_ADSP_AUDIODSP
> +                <&topckgen 34>; //CLK_TOP_AUDIO_H
> +       clock-names = "adsp_sel",
> +                     "clk26m_ck",
> +                     "audio_local_bus",
> +                     "mainpll_d7_d2",
> +                     "scp_adsp_audiodsp",
> +                     "audio_h";
> +       memory-region = <&adsp_dma_mem_reserved>,
> +                       <&adsp_mem_reserved>;
> +       power-domains = <&spm 6>; //MT8195_POWER_DOMAIN_ADSP
> +       mbox-names = "mbox0", "mbox1";
> +       mboxes = <&adsp_mailbox 0>, <&adsp_mailbox 1>;
> +       status = "disabled";

Don't disable your example. Drop status.

> +       sound {
> +              mediatek,dptx-codec = <&dp_tx>;
> +              mediatek,hdmi-codec = <&hdmi0>;
> +              mediatek,platform = <&afe>;
> +             };
> +       };
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
