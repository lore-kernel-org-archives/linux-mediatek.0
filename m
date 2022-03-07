Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA97C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 02:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BrVMqulh6/Jyi+v/frew1BB/PJzQUsP3VnLMUBI1jas=; b=kXqv0S2FLQOyCW
	vglkYwo1r0deFDWY+2xCub1leq2BvgX7O8clTtTbrSdvY9I4429+qY//qjhoYCSXT9c+s2tkQ8vRa
	aE7MZFrhhjDdppYRDrXy0fqHSiusg9/i4FRojdNp23AsjyzNfFuy4IvlIK9aDmInew6aiOBkqpH0q
	rdtsZin9SCyqMQ9ve018h6HagTHgqj4wAG0s58MpmVWFFHqRfecBhN4G8Ho9BYIjjuVQoPrLlISgr
	BdIOCUFMlZ413V+Ok/lEbP6yWeys0EbIlF/X7Dor6mFHfQy6ojQ3S2IRH59OjnmIzOnmt6OGuvZDJ
	wsB98ZZITI8haQnjmQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR3FM-00Fcp5-0O; Mon, 07 Mar 2022 02:37:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR3FG-00FcoR-MQ; Mon, 07 Mar 2022 02:37:13 +0000
X-UUID: f4f1aac0f8964e42b1ca7c3da9c598fb-20220306
X-UUID: f4f1aac0f8964e42b1ca7c3da9c598fb-20220306
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 246196590; Sun, 06 Mar 2022 19:37:06 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Mar 2022 18:37:04 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 7 Mar 2022 10:37:03 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Mar 2022 10:37:02 +0800
Message-ID: <89e2c254cb8a391aef5fed550b65ba6531b5adee.camel@mediatek.com>
Subject: Re: [PATCH v12 01/23] dt-bindings: mediatek: add vdosys1 RDMA
 definition for mt8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Mon, 7 Mar 2022 10:37:02 +0800
In-Reply-To: <a958a934-5a24-e5c5-c4c9-ce46a2b140b6@collabora.com>
References: <20220222100741.30138-1-nancy.lin@mediatek.com>
 <20220222100741.30138-2-nancy.lin@mediatek.com>
 <a958a934-5a24-e5c5-c4c9-ce46a2b140b6@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_183710_777334_FEFB980D 
X-CRM114-Status: GOOD (  26.84  )
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

Hi Angelo,

Thanks for the review.

On Wed, 2022-03-02 at 11:13 +0100, AngeloGioacchino Del Regno wrote:
> Il 22/02/22 11:07, Nancy.Lin ha scritto:
> > Add vdosys1 RDMA definition.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >   .../arm/mediatek/mediatek,mdp-rdma.yaml       | 77
> > +++++++++++++++++++
> >   1 file changed, 77 insertions(+)
> >   create mode 100644
> > Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-
> > rdma.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-
> > rdma.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-
> > rdma.yaml
> > new file mode 100644
> > index 000000000000..d70b81ec1914
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-
> > rdma.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,mdp-rdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!zIPCtbPPoflk_hFhtOHugiiLMs-r5rgosZX1t7X_vJxEL13ZNvZ3fMKFvJ5XPNDs$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!zIPCtbPPoflk_hFhtOHugiiLMs-r5rgosZX1t7X_vJxEL13ZNvZ3fMKFvECZss8_$
> >  
> > +
> > +title: Mediatek MDP RDMA
> > +
> > +maintainers:
> > +  - Matthias Brugger <matthias.bgg@gmail.com>
> > +
> > +description: |
> > +  The mediatek MDP RDMA stands for Read Direct Memory Access.
> > +  It provides real time data to the back-end panel driver, such as
> > DSI,
> > +  DPI and DP_INTF.
> > +  It contains one line buffer to store the sufficient pixel data.
> > +  RDMA device node must be siblings to the central MMSYS_CONFIG
> > node.
> > +  For a description of the MMSYS_CONFIG binding, see
> > +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.ya
> > ml for details.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: mediatek,mt8195-vdo1-rdma
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    description: A phandle and PM domain specifier as defined by
> > bindings of
> > +      the power controller specified by phandle. See
> > +      Documentation/devicetree/bindings/power/power-domain.yaml
> > for details.
> > +
> > +  clocks:
> > +    items:
> > +      - description: RDMA Clock
> > +
> > +  iommus:
> > +    description:
> > +      This property should point to the respective IOMMU block
> > with master port as argument,
> > +      see
> > Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for
> > details.
> > +
> > +  mediatek,gce-client-reg:
> > +    description:
> > +      The register of display function block to be set by gce.
> > There are 4 arguments,
> > +      such as gce node, subsys id, offset and register size. The
> > subsys id that is
> > +      mapping to the register of display function blocks is
> > defined in the gce header
> > +      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - power-domains
> > +  - clocks
> > +  - iommus
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> 
> You're missing a couple of header inclusions and relying on the
> default
> address-cells, size-cells, which is wrong here, as you have two of
> both.
> 
> #include .........
> 
> soc {
>      #address-cells = <2>;
>      #size-cells = <2>;
> 
>          vdo1_rdma0: .......
> 
OK, I will fix it in the next revision.

Best,
Nancy
> > +
> > +    vdo1_rdma0: vdo1_rdma@1c104000 {
> > +        compatible = "mediatek,mt8195-vdo1-rdma";
> > +        reg = <0 0x1c104000 0 0x1000>;
> > +        interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> > +        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> > +        iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
> > +        mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x4000
> > 0x1000>;
> > +    };
> > +


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
