Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF74C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 20:15:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9837C60F93
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 20:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9837C60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=go96nKrUmh9B/Uw0vIaV0cTp9z+LFnFMV9rqnDCOQg8=; b=II1f+HK0MMReTp
	eG6dO8ecljhSuPhy6IzyDY4ducTwlmripD/td5HSpbj8ns6wVtGm12iyOlSc5OfeDvteuVOAr+N9Q
	vG+u0xHz0X43C0lkYTSEYhhZoedOroHLomkr7uuliw+ulqJbbF4yBtg6AnbF4AQEb3JH5ic/CaIhe
	FwEbnMoR+lJGPVH3UacMDuJdm+11OfqblPgn99yefn4/Sv9mQ5jMZyvSNkppIoyE7mzp1qvgww1Pp
	OuT6TRKC8riJYNWhICYggJ4mecPKoMIoEaXYz17Wkk6ni5S3bV9ZDMqgf0xYPKa3fgIiX4d7wHkdN
	uqErOI0t0UTanJVA2X6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlcxG-00BWjD-Af; Fri, 12 Nov 2021 20:15:22 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlcxD-00BWiB-HS; Fri, 12 Nov 2021 20:15:21 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so7574727otj.7; 
 Fri, 12 Nov 2021 12:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=keLT6GqkBxKBg5E7mpziqAGsje8UnIi4oJ/70fWYsOk=;
 b=sSMx9szugp//jHUzZnyKAQxX/hkcU5Djvbzti8fJPYL93EUt7mP33ggDokE/fTP8x1
 SRBjN08z+oAbFNwgFufSTpIHIzv+XO39FyGErMnPgAEyY2ECiNiC1fMtg+2/0ja72X5e
 oMfYp2zf12P1nEFQFyMlgYGpvuOaYkN58O6vhqjueFMTi1BkkDB7Yes6HAlEjSEy19iD
 oTeFYxQpkimCmF2Fx9D9fVK73iQ65zq0R6XVHkwzBRej4eS7Bpd7WkhJwiHnuY/gY0lP
 OhLUziXLgagtLUrYgnL9K5I6ojXe5pkDTffkj0fB+rLcLLEAosrJFF9KUlCnlSDuOSy8
 TcSQ==
X-Gm-Message-State: AOAM531emvZcXz/FYUuQK4POIjNt3kzVpzPCLO5w7z0Q63Im9PrbJCG1
 6sQX3WLfw84P3T0gvFv5tw==
X-Google-Smtp-Source: ABdhPJz0IgudO9I+dADfCJrqhnAcSXUvXv7srFOWzM/tpxDv/VcAcn13Yy2W70rZqXpm+7Y/UoSzNQ==
X-Received: by 2002:a9d:6307:: with SMTP id q7mr14945920otk.83.1636748115023; 
 Fri, 12 Nov 2021 12:15:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id y9sm1235608oon.8.2021.11.12.12.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 12:15:14 -0800 (PST)
Received: (nullmailer pid 3294254 invoked by uid 1000);
 Fri, 12 Nov 2021 20:15:13 -0000
Date: Fri, 12 Nov 2021 14:15:13 -0600
From: Rob Herring <robh@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, daniel.baluta@nxp.com, trevor.wu@mediatek.com,
 allen-kh.cheng@mediatek.com, angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v5] dt-bindings: dsp: mediatek: Add mt8195 DSP binding
 support
Message-ID: <YY7LUWS5YDBBl/Kp@robh.at.kernel.org>
References: <20211103102607.12277-1-yc.hung@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103102607.12277-1-yc.hung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_121519_614326_A5BBEC35 
X-CRM114-Status: GOOD (  20.36  )
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

On Wed, Nov 03, 2021 at 06:26:08PM +0800, YC Hung wrote:
> From: "yc.hung" <yc.hung@mediatek.com>
> 
> This describes the mt8195 DSP device tree node.
> 
> Signed-off-by: yc.hung <yc.hung@mediatek.com>
> ---
> Changes since v4:
>   - remove patch 1 with clocks as it will be reviewed and merged to SOF tree.
>     https://github.com/thesofproject/linux/pull/3237
>   - refine DT file binding files with Rob's comments.
> 
>  .../bindings/dsp/mtk,mt8195-dsp.yaml          | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> new file mode 100644
> index 000000000000..aeeb7af69625
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> @@ -0,0 +1,142 @@
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
> +
> +  sound:
> +    description:
> +      Sound subnode includes ASoC platform, DPTx codec node, and
> +      HDMI codec node.
> +
> +    type: object

Same question as v4, why do you need a sub-node here. Just move these 
properties up a level.

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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
