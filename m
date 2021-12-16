Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D17C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 19:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XIMnHYhBj1XHAxSUmoVnYJxUzthhW2Yp2ZtFlToMgac=; b=yReHWeG218Yxje
	cLlt63Rkdnr9ss8lXfeYxnEzH4Hb8Taa0sW4hIr6UF5Hn7PzqCQU00b6tT4T+KHfSvAGy14cwk/cM
	XortH3mZcuHwEqqO3kDpL3Fwgf9ls+xL+Hd3dDygV0y9P1YUFVn99ImS2L7ElbmHsciArvvholV0Y
	SWw17kiLwF/SqCmzfmSBrigQkTNbC68UKprqXyeik1T5SD/58Q5W2ljMm32A0kp0TL32r4aFdNx8N
	vBJQPoPORK2IhhaulABBaX21yHKPRA8gdsDDRqh8hKuccjLdFuw4bGENabzXLkrO5ZkfTDWBjU1YH
	mX5Nkh8xCm8srrZ/8A+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxw2w-007HeI-PH; Thu, 16 Dec 2021 19:04:06 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxw2u-007Hck-0G; Thu, 16 Dec 2021 19:04:05 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso21335otf.12; 
 Thu, 16 Dec 2021 11:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5/FblGQaJYZssbV69UJ4GBrUt2uvEHBBh4mxqSnBM3E=;
 b=Ru9D91b9knuss5WeJzWPTBFVNuplHE31TVC/IwFVaGwOCMr70xjA7+fo7R4Jl/qvfo
 HBJlb1z/sNAiKDpnVo53h29pSieq5F9UkSHeGFjGWudE7wRf56I1XuqFjY/C7Cn+lv2n
 td3xFqNwu5pXiZEZ8p8+qvJpajry3JoQhTh5ikjWc8Y3vBKU3R83CaiXukf8XslGaBiq
 FTlKR9QWxQI/m0HTtVmeomjW6C/zO/VRoIOO+fbftPCOsaGC5uI3XXvzlSjtf49euAlD
 XFn3qbucsrsXk8bZjrIiakkLV5OFx+SuZNgCViOz5PRtsxaTA8JqBcG7wE6ff/8+1TzG
 n9ZQ==
X-Gm-Message-State: AOAM531gCrB4R3gflB1Q/41Kx93I7IZj6nROfGxOg+5zy3beLwgJzjpQ
 w+6pGSPVugdNj2pCuyOarA==
X-Google-Smtp-Source: ABdhPJylzhDYwAG/ANQ9sMz1+y1MrNz8yzIlAoSA+tfilj3ZOjyyjojSNkGMgpWF30qXQkkor7jaQQ==
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr13665614otl.85.1639681442381; 
 Thu, 16 Dec 2021 11:04:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s26sm1164360oiw.19.2021.12.16.11.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 11:04:01 -0800 (PST)
Received: (nullmailer pid 575687 invoked by uid 1000);
 Thu, 16 Dec 2021 19:04:00 -0000
Date: Thu, 16 Dec 2021 13:04:00 -0600
From: Rob Herring <robh@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, daniel.baluta@nxp.com, trevor.wu@mediatek.com,
 allen-kh.cheng@mediatek.com
Subject: Re: [PATCH] dt-bindings: dsp: mediatek: add mt8195 dsp document
Message-ID: <YbuNoG3mw2/syi8+@robh.at.kernel.org>
References: <20211215031955.28244-1-yc.hung@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215031955.28244-1-yc.hung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_110404_108614_CD16F128 
X-CRM114-Status: GOOD (  19.13  )
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

On Wed, Dec 15, 2021 at 11:19:55AM +0800, YC Hung wrote:
> From: "yc.hung" <yc.hung@mediatek.com>
> 
> This patch adds mt8195 dsp document.
> 
> Signed-off-by: yc.hung <yc.hung@mediatek.com>
> ---
>  .../bindings/dsp/mtk,mt8195-dsp.yaml          | 116 ++++++++++++++++++

mediatek,mt8195-dsp.yaml

>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> new file mode 100644
> index 000000000000..33db11ee2336
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> @@ -0,0 +1,116 @@
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

blank line

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
> +      - description: a mailbox is ised for ipc reply between host and audio DSP.
> +      - description: a mailbox is ised for ipc reuqest between host and audio DSP.

typos

'a mailbox is ised for ' part can be dropped.


> +
> +  mbox-names:
> +    items:
> +      - const: mbox0
> +      - const: mbox1
> +
> +  memory-region:      
> +    items:
> +      - description: A phandle to a reserved memory region is used for dma buffer between host and DSP.   
> +      - description: A phandle to a reserved memory region is used for DSP system memory.

'A phandle to a reserved memory region is used for' part can be dropped.

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
> +    adsp: dsp@10803000 {

Drop unused labels.

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
> +       };

Wrong indentation.

> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
