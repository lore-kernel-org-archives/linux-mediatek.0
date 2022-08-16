Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13BEC2BB41
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zz0T4gIy7kUegqK8wikQ7+ezHFbCfs8YzoP1aT72UQs=; b=1p0R+Bbc/bkiyrztmq8b2FttD+
	vJQ0L8MJTdJ0TCTBDdhI9vGoBnn727puCBesvlbqVBBmxVDAEHdACbI20sqRlr9nwDnwIk40lKJSK
	skR4ptmo18oaV37sQw+j5atfVDp2MsfpuNMC6iImH01cAdx9BpL40MQQl+o0Xa/y8TWLsdHL6NaGC
	FNoEQRjAq66h90+W0FG8I+U6G+0NQYSz1jyR0pyTZgzL6p1cmez/7TIy35llvVdpzK2TxORqdTvnj
	pwbTzTuHnkbGqcbxQNxIEOP+AsMgXI7h94w05XPKSMpf8E12y0BRXBLB2zJhT1azk4ShJEhOWlky+
	YsfynShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNzPb-004Yhj-7n; Tue, 16 Aug 2022 16:27:27 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNzPF-004YJK-LR; Tue, 16 Aug 2022 16:27:07 +0000
Received: by mail-io1-f50.google.com with SMTP id n12so5293276iod.3;
        Tue, 16 Aug 2022 09:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Zz0T4gIy7kUegqK8wikQ7+ezHFbCfs8YzoP1aT72UQs=;
        b=qjF4OenK1Yz76xkbjKSgJGjyBSD40r43q5Fs202jTk+eXbd3WYUXJJdMtl2Kn8kuX/
         iBlHOh8nNYQrIpsda6EnhIvKjReuG20noFp2AkQfLFoe2PPejU2fPOUb4aV1+1FPETfz
         tT8Z6ii+C4OX75sUHqVG5KwTXm0RuIrjwxhJ7C+AitwbI4/I1jDB+SAWWyr8w5wK7DNL
         hRvIBHYm6u4Nq77WmYV0uoksKeN/as8JMxMwQn3MWrIZMiWg1XGdRlXjufgZDy+W5wyV
         bZ5xb5qqU3bgpc0eubmEtFxn9Zc1DMJzUYa3x3iTCleMiGCHtYFGxLfZoF0h8DuV1ZBE
         vl8w==
X-Gm-Message-State: ACgBeo2DE2y6wuK2dPbSvcnnREfAWaY3EU3xROOcmBdEHzfji4U6lSHF
	bgRB2UTQRnRHZ2iOb0+B7A==
X-Google-Smtp-Source: AA6agR7X5CuyHhjwtGZhIOksAHtXxYfsykPsT1Osf3XidFVfyLHpT86byQxklF0G4+/6CsHAnUcfzg==
X-Received: by 2002:a02:904c:0:b0:343:50f4:48a2 with SMTP id y12-20020a02904c000000b0034350f448a2mr10155030jaf.22.1660667222698;
        Tue, 16 Aug 2022 09:27:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id v17-20020a056e020f9100b002dc2485d528sm1370649ilo.85.2022.08.16.09.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 09:27:02 -0700 (PDT)
Received: (nullmailer pid 2326662 invoked by uid 1000);
	Tue, 16 Aug 2022 16:27:00 -0000
Date: Tue, 16 Aug 2022 10:27:00 -0600
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>, angelogioacchino.delregno@collabora.com, nicolas.dufresne@collabora.com, wenst@chromium.org, kyrie wu <kyrie.wu@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>, xia.jiang@mediatek.com, maoguang.meng@mediatek.com
Subject: Re: [V12,1/7] dt-bindings: mediatek: Add mediatek, mt8195-jpgenc
 compatible
Message-ID: <20220816162700.GA2325543-robh@kernel.org>
References: <20220729062630.5592-1-irui.wang@mediatek.com>
 <20220729062630.5592-2-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729062630.5592-2-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_092705_751314_BA7B4CDC 
X-CRM114-Status: GOOD (  19.21  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 29, 2022 at 02:26:24PM +0800, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> Add mediatek,mt8195-jpgenc compatible to binding document.
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> Signed-off-by: irui wang <irui.wang@mediatek.com>
> ---
>  .../media/mediatek,mt8195-jpegenc.yaml        | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> new file mode 100644
> index 000000000000..d9133e6a92f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> @@ -0,0 +1,139 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek JPEG Encoder Device Tree Bindings
> +
> +maintainers:
> +  - kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
> +
> +description:
> +  MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt8195-jpgenc
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 4
> +    description:
> +      Points to the respective IOMMU block with master port as argument, see
> +      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +      Ports are according to the HW.
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +# Required child node:
> +patternProperties:
> +  "^jpgenc@[0-9a-f]+$":
> +    type: object
> +    description:
> +      The jpeg encoder hardware device node which should be added as subnodes to
> +      the main jpeg node.
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mt8195-jpgenc-hw
> +
> +      reg:
> +        maxItems: 1
> +
> +      iommus:
> +        minItems: 1
> +        maxItems: 32
> +        description:
> +          List of the hardware port in respective IOMMU block for current Socs.
> +          Refer to bindings/iommu/mediatek,iommu.yaml.
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      clocks:
> +        maxItems: 1
> +
> +      clock-names:
> +        items:
> +          - const: jpgenc
> +
> +      power-domains:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - iommus
> +      - interrupts
> +      - clocks
> +      - clock-names
> +      - power-domains
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - power-domains
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/mt8195-memory-port.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        jpgenc_master {
> +                compatible = "mediatek,mt8195-jpgenc";
> +                power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
> +                iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
> +                <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
> +                <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
> +                <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
> +                #address-cells = <2>;
> +                #size-cells = <2>;

Same issue here as the decoder.

