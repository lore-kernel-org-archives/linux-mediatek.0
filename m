Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90200ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 11:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IL2Qzd828Ualos45ERqPlmPSuhHUIL56hVLWxc3qLSA=; b=BsaZlaWQtRiYymUJzx4RMyr3Hk
	MdSW9AAe+rcS7ajzpWV62ycyPwRLCKl7zP1+gMNA6MmnuhFHgC4kEMnqv6V5nwXOqDZ57d5fMQ2Wq
	vaLx+3SvmT0QQmq51jjpqi5Y2hRTz6BSVnkeuu1pbSBkvh4iUTxNM8Fk1/0nz4RIZujIPMv6Qt4f7
	OQVZqOrMQmtcizwSmN9ZryQFIr7E75+fXRIrpmU2+O5BIWgH2Fg2SKkC4BE5C65Erc7rInUydA4NP
	gOMwOBdvOK+235FOnDgYofiF7C3EJGibuxMVJnCoHrgQUV63RxL1u5/Jn+hqqPTQLIoxS4GF6SDkW
	gMBMXL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgrt-003wO7-Lr; Fri, 23 Sep 2022 11:29:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgrh-003wLJ-Tn; Fri, 23 Sep 2022 11:29:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7EE5FB824C6;
	Fri, 23 Sep 2022 11:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C17C433D6;
	Fri, 23 Sep 2022 11:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663932542;
	bh=bMYt1/N3KNrv0i41IENSYS+pss/KJGw9J8JCAluJZe4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mtNpKxd1lGQnHI5nG3P2zGAtV6XMmlokHgE/SVoqu0TriQbTz+abC3DxNjhX6waeg
	 kJmhxsJpW9KtW0Uu9l0o4PEajLuS22INuxkqTgYvgRTwk8DmtobAJUTE5nhQK5Kjh8
	 66wKro/NQtoRl96QDWkMy4Za0Mnw2WowaVo3WtrqqlB3NaK3HcLKEIgonO0IYR+vD4
	 OLK148heaY+Ls5+ii+KOc7ayVyIAhHBaPpUdcSSpuFXtxternihO4madYiZauN07nF
	 iDFdvFw9eGM/txPBfDzWmzQkoz49yrGiaDMCMtW2jpxKUTicjLU/B6S9H/mJTnq3v+
	 dDN6KuFoTqLOQ==
Message-ID: <3bbdfb31-2ba2-7345-54c7-82a67d95e30f@kernel.org>
Date: Fri, 23 Sep 2022 13:28:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [V14,08/15] dt-bindings: mediatek: Add mediatek,mt8195-jpgdec
 compatible
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 angelogioacchino.delregno@collabora.com, nicolas.dufresne@collabora.com,
 wenst@chromium.org, kyrie wu <kyrie.wu@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>,
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com,
 Rob Herring <robh@kernel.org>
References: <20220915064337.2686-1-irui.wang@mediatek.com>
 <20220915064337.2686-9-irui.wang@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220915064337.2686-9-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_042906_264860_2FC8D985 
X-CRM114-Status: GOOD (  21.55  )
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

On 15/09/2022 08:43, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> Add mediatek,mt8195-jpgdec compatible to binding document.

Use scripts/get_maintainers.pl to CC all maintainers and relevant
mailing lists.

> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> Signed-off-by: irui wang <irui.wang@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../media/mediatek,mt8195-jpegdec.yaml        | 169 ++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> new file mode 100644
> index 000000000000..9135cf889d1e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek JPEG Encoder Device Tree Bindings
> +
> +maintainers:
> +  - kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
> +
> +description:
> +  MediaTek JPEG Decoder is the JPEG decode hardware present in MediaTek SoCs
> +
> +properties:
> +  compatible:
> +    items:

You do not have more than one item. Skip items.

> +      - const: mediatek,mt8195-jpgdec
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 6
> +    description:
> +      Points to the respective IOMMU block with master port as argument, see
> +      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +      Ports are according to the HW.
> +
> +  dma-ranges:
> +    maxItems: 1
> +    description: |
> +      Describes the physical address space of IOMMU maps to memory.
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
> +  "^jpgdec@[0-9a-f]+$":
> +    type: object
> +    description:
> +      The jpeg decoder hardware device node which should be added as subnodes to
> +      the main jpeg node.
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mt8195-jpgdec-hw
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
> +          - const: jpgdec
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
> +  - dma-ranges
> +  - ranges
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
> +        jpgdec_master {

No underscores in node names.

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +                compatible = "mediatek,mt8195-jpgdec";
> +                power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
> +                iommus = <&iommu_vpp M4U_PORT_L19_JPGDEC_WDMA0>,
> +                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA0>,
> +                     <&iommu_vpp M4U_PORT_L19_JPGDEC_WDMA1>,
> +                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA1>,
> +                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
> +                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
> +                dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +                #address-cells = <2>;
> +                #size-cells = <2>;
> +                ranges;

Mess up indentation.


Best regards,
Krzysztof


