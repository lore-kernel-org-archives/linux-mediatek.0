Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D5DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 17:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YhmvIlU2cSbCQRjEtaTU/Bg8hd+inF1VeFhDrp7bFe0=; b=uuz7Z4Tsks9Jd5
	Y4gFg9MwZUQEAUFnpXgzOQnu57rknjHXeCTrvoevtQydynXg4dkmM/sNh9yVrPAsYISebFpnjZo2I
	ieHAPqVwY0YSIkhSOKNY1dJRuju6ZZgwsG/pQHqlk35fExKDOTU+xJ8mWHFSfdLXygRWK0cdTUA7a
	eT2wrevcRyMiUwbDZGMZkt8ZHdaZ2uEmJ6TkIx023hfWcmVNBQOEzjcxCT13ekrcZD+HelFlswOfd
	ApDDokGsGgRa/GFkyvapxISOGR9+cn1zu1Wg7nWCqmnIpxc0fA/R4gbZOrunCPYkjw98mELgDcuuY
	bPDH2QUgUbB6wv6MOMmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n05G5-00AyOt-W1; Wed, 22 Dec 2021 17:18:34 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n05G3-00AyNy-Ba; Wed, 22 Dec 2021 17:18:33 +0000
Received: by mail-qv1-f45.google.com with SMTP id q3so2898625qvc.7;
 Wed, 22 Dec 2021 09:18:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VwGJdZszDEBZ/haW/szM0MBy82aTvjUJCHaFFhvVrG0=;
 b=Mc+W/5cG7loMlILrMHe+9Ta2lZeY3dOs2bCBtZQQpxdrL/xlvy1GcmJAgXyZ5zWQ5M
 A1H2qDGvSpVcTDpo1FfSnopMX5Xzf9X7KsSaOJ/1LHDePD8qQLUocG4WRIFIzivQSyoH
 V2+TrZ5OCrF1WJgz8kp9m6RlS9foRIwQk3JvgMz8t1iExorIwoudOitiz+c8HYA+bqOo
 7BFWWlxitIybSp1ZC086BpUwdSpRzJF1x04Yh9xTsScohJWsYQMxHtagdk9bfBkxLMPv
 N24+uHqo27ZZdKj7Si1rDe85piYc8WWTodCYso+Qj7AzgJ9IbFIffJb8SDNAJxH3FSFe
 moUg==
X-Gm-Message-State: AOAM531zyI4yDhV4AU4Pp3V1ydj2kFaEz77kDO+hwT+XJ9VsfyGyMOdg
 GArB9I4DyLH6VltklUejow==
X-Google-Smtp-Source: ABdhPJyJ0bAGX2VL5tWgGbkPj8TCBhCWbSyDJ6PRFRs/4iibZv+H1Rhu7n1V0H4nZJGe1uhaZaf3Ow==
X-Received: by 2002:a05:6214:f04:: with SMTP id
 gw4mr3226167qvb.42.1640193508175; 
 Wed, 22 Dec 2021 09:18:28 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id b2sm1436713qtq.95.2021.12.22.09.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 09:18:27 -0800 (PST)
Received: (nullmailer pid 2347804 invoked by uid 1000);
 Wed, 22 Dec 2021 17:18:25 -0000
Date: Wed, 22 Dec 2021 13:18:25 -0400
From: Rob Herring <robh@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, daniel.baluta@nxp.com, trevor.wu@mediatek.com,
 allen-kh.cheng@mediatek.com
Subject: Re: [PATCH v2] dt-bindings: dsp: mediatek: add mt8195 dsp document
Message-ID: <YcNd4RXYldP8uWgg@robh.at.kernel.org>
References: <20211217070835.31709-1-yc.hung@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217070835.31709-1-yc.hung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_091831_432337_6EA5E0AC 
X-CRM114-Status: GOOD (  18.79  )
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

On Fri, Dec 17, 2021 at 03:08:36PM +0800, YC Hung wrote:
> From: "yc.hung" <yc.hung@mediatek.com>

Should be 'YC Hung'?

> 
> This patch adds mt8195 dsp document.
> 
> Signed-off-by: yc.hung <yc.hung@mediatek.com>
> ---
> Changes since v1:
>   Rename yaml file name as mediatek,mt8195-dsp.yaml
>   Refine descriptions for mailbox, memory-region and drop unused labels
>   in examples.
> ---
>  .../bindings/dsp/mediatek,mt8195-dsp.yaml     | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> new file mode 100644
> index 000000000000..bde763191d86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dsp/mediatek,mt8195-dsp.yaml#
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
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8195-dsp
> +
> +  reg:
> +    items:
> +      - description: Address and size of the DSP Cfg registers
> +      - description: Address and size of the DSP SRAM
> +
> +  reg-names:
> +    items:
> +      - const: cfg
> +      - const: sram
> +
> +  interrupts:
> +    items:
> +      - description: watchdog interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: wdt
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
> +    items:
> +      - description: ipc reply between host and audio DSP.
> +      - description: ipc reuqest between host and audio DSP.
> +
> +  mbox-names:
> +    items:
> +      - const: mbox0
> +      - const: mbox1
> +
> +  memory-region:      
> +    items:
> +      - description: dma buffer between host and DSP.   
> +      - description: DSP system memory.
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
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    dsp@10803000 {
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
> +       mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
> +    };
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
