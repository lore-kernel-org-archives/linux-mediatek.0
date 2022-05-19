Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E93C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 05:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mTq0ChnGY8KLBkM0X3C/F/j7KfEU+AxtVq7qj5hQ3o=; b=nDe+OILTEHY5q5
	dgGZtOMELXW8mrX/7wQ+CSqRMUgUdVA0eBeHlGpe8/NPIsdpsgQ/u4frWZFLvo1JPQyuZi9QsPcKc
	s4KmGC5FlnmsZNQ4xoV6KlJlj13IePN6SXZ/n3oRTSbv8rVLmZVVJAcPMP60lJg07uzVx4nVJN2x7
	c75oaTNNUjBQS6pdOUQhxBqIeH04smFbXXTz7NdC/YW0BBukBvcri7VrZyWvrvc1XFC5vN6s9iWNw
	xXJgY2YL+2J3RmeIGJYLftWea/DcceJ8U1lSeAV3KVXRg6Q1o9EE8Whmxp953avjJsj93GcNj4LSl
	RM8ad/ldn8fJJOglGYSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrYoI-00574S-3q; Thu, 19 May 2022 05:34:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrYoD-00572b-Qg; Thu, 19 May 2022 05:34:52 +0000
X-UUID: c1a5a140226f46d6ad64a8a8f46f3db0-20220518
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:0b2febeb-e35b-44e8-a8a6-a10f3bf53bfa, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:005ebfe2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: c1a5a140226f46d6ad64a8a8f46f3db0-20220518
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 474699137; Wed, 18 May 2022 22:34:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 22:34:39 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 19 May 2022 13:34:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 May 2022 13:34:37 +0800
Message-ID: <dbdf325362f4eeda5201d8afaf001b7988c59d78.camel@mediatek.com>
Subject: Re: [PATCH v15 1/3] dt-binding: mediatek: add bindings for MediaTek
 MDP3 components
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Moudy Ho <moudy.ho@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Alexandre Courbot
 <acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
 <pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
 <randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <cellopoint.kai@gmail.com>
Date: Thu, 19 May 2022 13:34:37 +0800
In-Reply-To: <59137538-bf77-5ea2-3375-c4d3f8c6ff27@xs4all.nl>
References: <20220512092306.6895-1-moudy.ho@mediatek.com>
 <20220512092306.6895-2-moudy.ho@mediatek.com>
 <59137538-bf77-5ea2-3375-c4d3f8c6ff27@xs4all.nl>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_223449_929831_EFD6EB2F 
X-CRM114-Status: GOOD (  37.21  )
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

On Wed, 2022-05-18 at 12:09 +0200, Hans Verkuil wrote:
> Hi Moudy,
> 
> On 5/12/22 11:23, Moudy Ho wrote:
> > This patch adds DT binding documents for Media Data Path 3 (MDP3)
> > a unit in multimedia system combined with several components and
> > used for scaling and color format convert.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >  .../bindings/media/mediatek,mdp3-rdma.yaml    | 85
> > +++++++++++++++++++
> >  .../bindings/media/mediatek,mdp3-rsz.yaml     | 65 ++++++++++++++
> >  .../bindings/media/mediatek,mdp3-wrot.yaml    | 70 +++++++++++++++
> >  .../bindings/soc/mediatek/mediatek,ccorr.yaml | 58 +++++++++++++
> >  .../bindings/soc/mediatek/mediatek,wdma.yaml  | 71
> > ++++++++++++++++
> 
> This changes bindings in two subsystems in a single patch. I would
> recommend splitting
> this up. Besides, the subject specifically says "MDP3 components", so
> having other
> components in this patch is confusing.
> 
> The soc bindings can either go through the soc subsystem or through
> the media
> subsystem, but then I need Acked-by from the maintainer.
> 

Hello Hans,

There is something wrong for Moudy's mediatek mail server, so I help
him to reply this mail to prevent the mismatch of discussion between
Moudy and you.

Moudy will split the bindings under ./soc/mediatek
into a separate patch in the next version.

> >  5 files changed, 349 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
> 
> Why is this part of soc/mediatek instead of media? CSC is typically a
> media operation.
> 
> I'm not saying it is wrong, but it's a bit odd. Apologies if this was
> asked before.
> 
> Regards,
> 
> 	Hans
> 

The purpose of this path change is to allow Mediatek's MDP and DRM to
share the same binding, and the same concept as the previous patch
listed below:


https://patchwork.kernel.org/project/linux-mediatek/patch/20220315061031.21642-4-moudy.ho@mediatek.com/
The current path is preliminary and subject to review. Please let me
know if there is a proper one.

BRs,
Rex
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rdma.yaml
> > new file mode 100644
> > index 000000000000..4fe704e476dc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rdma.yaml
> > @@ -0,0 +1,85 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!2ZNvgvI6qeg4eNprUQ48EiE4ubRcbyNYwEQQ7zr4Nyzt6FxZ0Zs8e8ae-Puy-aLskT378PmjEAnr6ceJ1uZLfyeWNg$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!2ZNvgvI6qeg4eNprUQ48EiE4ubRcbyNYwEQQ7zr4Nyzt6FxZ0Zs8e8ae-Puy-aLskT378PmjEAnr6ceJ1uYTQJNp6g$
> >  
> > +
> > +title: Mediatek Read Direct Memory Access
> > +
> > +maintainers:
> > +  - Matthias Brugger <matthias.bgg@gmail.com>
> > +  - Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > +
> > +description: |
> > +  Mediatek Read Direct Memory Access(RDMA) component used to do
> > read DMA.
> > +  It contains one line buffer to store the sufficient pixel data,
> > and
> > +  must be siblings to the central MMSYS_CONFIG node.
> > +  For a description of the MMSYS_CONFIG binding, see
> > +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.ya
> > ml
> > +  for details.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: mediatek,mt8183-mdp3-rdma
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  mediatek,gce-client-reg:
> > +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> > +    items:
> > +      items:
> > +        - description: phandle of GCE
> > +        - description: GCE subsys id
> > +        - description: register offset
> > +        - description: register size
> > +    description: The register of client driver can be configured
> > by gce with
> > +      4 arguments defined in this property. Each GCE subsys id is
> > mapping to
> > +      a client defined in the header include/dt-
> > bindings/gce/<chip>-gce.h.
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: RDMA clock
> > +      - description: RSZ clock
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  mboxes:
> > +    items:
> > +      - description: used for 1st data pipe from RDMA
> > +      - description: used for 2nd data pipe from RDMA
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - mediatek,gce-client-reg
> > +  - power-domains
> > +  - clocks
> > +  - iommus
> > +  - mboxes
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    #include <dt-bindings/gce/mt8183-gce.h>
> > +    #include <dt-bindings/power/mt8183-power.h>
> > +    #include <dt-bindings/memory/mt8183-larb-port.h>
> > +
> > +    mdp3_rdma0: mdp3-rdma0@14001000 {
> > +      compatible = "mediatek,mt8183-mdp3-rdma";
> > +      reg = <0x14001000 0x1000>;
> > +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000
> > 0x1000>;
> > +      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> > +      clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> > +               <&mmsys CLK_MM_MDP_RSZ1>;
> > +      iommus = <&iommu>;
> > +      mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST>,
> > +               <&gce 21 CMDQ_THR_PRIO_LOWEST>;
> > +    };
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rsz.yaml
> > new file mode 100644
> > index 000000000000..7b566fbec3c0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rsz.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml*__;Iw!!CTRNKA9wMg0ARbw!2ZNvgvI6qeg4eNprUQ48EiE4ubRcbyNYwEQQ7zr4Nyzt6FxZ0Zs8e8ae-Puy-aLskT378PmjEAnr6ceJ1uYLnzDDrw$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!2ZNvgvI6qeg4eNprUQ48EiE4ubRcbyNYwEQQ7zr4Nyzt6FxZ0Zs8e8ae-Puy-aLskT378PmjEAnr6ceJ1uYTQJNp6g$
> >  
> > +
> > +title: Mediatek Resizer
> > +
> > +maintainers:
> > +  - Matthias Brugger <matthias.bgg@gmail.com>
> > +  - Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > +
> > +description: |
> > +  One of Media Data Path 3 (MDP3) components used to do frame
> > resizing.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt8183-mdp3-rsz
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  mediatek,gce-client-reg:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      items:
> > +        - description: phandle of GCE
> > +        - description: GCE subsys id
> > +        - description: register offset
> > +        - description: register size
> > +    description: The register of client driver can be configured
> > by gce with
> > +      4 arguments defined in this property. Each GCE subsys id is
> > mapping to
> > +      a client defined in the header include/dt-
> > bindings/gce/<chip>-gce.h.
> > +
> > +  clocks:
> > +    minItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - mediatek,gce-client-reg
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    #include <dt-bindings/gce/mt8183-gce.h>
> > +
> > +    mdp3_rsz0: mdp3-rsz0@14003000 {
> > +      compatible = "mediatek,mt8183-mdp3-rsz";
> > +      reg = <0x14003000 0x1000>;
> > +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000
> > 0x1000>;
> > +      clocks = <&mmsys CLK_MM_MDP_RSZ0>;
> > +    };
> > +
> > +    mdp3_rsz1: mdp3-rsz1@14004000 {
> > +      compatible = "mediatek,mt8183-mdp3-rsz";
> > +      reg = <0x14004000 0x1000>;
> > +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x4000
> > 0x1000>;
> > +      clocks = <&mmsys CLK_MM_MDP_RSZ1>;
> > +    };
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > wrot.yaml
> > new file mode 100644
> > index 000000000000..5481d4e43315
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > wrot.yaml
> > @@ -0,0 +1,70 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml*__;Iw!!CTRNKA9wMg0ARbw!2ZNvgvI6qeg4eNprUQ48EiE4ubRcbyNYwEQQ7zr4Nyzt6FxZ0Zs8e8ae-Puy-aLskT378PmjEAnr6ceJ1uY3xwuR8Q$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!2ZNvgvI6qeg4eNprUQ48EiE4ubRcbyNYwEQQ7zr4Nyzt6FxZ0Zs8e8ae-Puy-aLskT378PmjEAnr6ceJ1uYTQJNp6g$
> >  
> > +
> > +title: Mediatek Write DMA with Rotation
> > +
> > +maintainers:
> > +  - Matthias Brugger <matthias.bgg@gmail.com>
> > +  - Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > +
> > +description: |
> > +  One of Media Data Path 3 (MDP3) components used to write DMA
> > with frame rotation.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt8183-mdp3-wrot
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  mediatek,gce-client-reg:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      items:
> > +        - description: phandle of GCE
> > +        - description: GCE subsys id
> > +        - description: register offset
> > +        - description: register size
> > +    description: The register of client driver can be configured
> > by gce with
> > +      4 arguments defined in this property. Each GCE subsys id is
> > mapping to
> > +      a client defined in the header include/dt-
> > bindings/gce/<chip>-gce.h.
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - mediatek,gce-client-reg
> > +  - power-domains
> > +  - clocks
> > +  - iommus
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    #include <dt-bindings/gce/mt8183-gce.h>
> > +    #include <dt-bindings/power/mt8183-power.h>
> > +    #include <dt-bindings/memory/mt8183-larb-port.h>
> > +
> > +    mdp3_wrot0: mdp3-wrot0@14005000 {
> > +      compatible = "mediatek,mt8183-mdp3-wrot";
> > +      reg = <0x14005000 0x1000>;
> > +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000
> > 0x1000>;
> > +      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> > +      clocks = <&mmsys CLK_MM_MDP_WROT0>;
> > +      iommus = <&iommu>;
> > +    };
> > diff --git
> > a/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yam
> > l
> > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yam
> > l
> > new file mode 100644
> > index 000000000000..20d02cb4ad0a
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yam
> > l
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/soc/mediatek/mediatek,ccorr.yaml*__;Iw!!CTRNKA9wMg0ARbw!2ZNvgvI6qeg4eNprUQ48EiE4ubRcbyNYwEQQ7zr4Nyzt6FxZ0Zs8e8ae-Puy-aLskT378PmjEAnr6ceJ1ua8l4S1Sg$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!2ZNvgvI6qeg4eNprUQ48EiE4ubRcbyNYwEQQ7zr4Nyzt6FxZ0Zs8e8ae-Puy-aLskT378PmjEAnr6ceJ1uYTQJNp6g$
> >  
> > +
> > +title: Mediatek color correction
> > +
> > +maintainers:
> > +  - Matthias Brugger <matthias.bgg@gmail.com>
> > +  - Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > +
> > +description: |
> > +  Mediatek color correction with 3X3 matrix.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt8183-mdp3-ccorr
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  mediatek,gce-client-reg:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      items:
> > +        - description: phandle of GCE
> > +        - description: GCE subsys id
> > +        - description: register offset
> > +        - description: register size
> > +    description: The register of client driver can be configured
> > by gce with
> > +      4 arguments defined in this property. Each GCE subsys id is
> > mapping to
> > +      a client defined in the header include/dt-
> > bindings/gce/<chip>-gce.h.
> > +
> > +  clocks:
> > +    minItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - mediatek,gce-client-reg
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    #include <dt-bindings/gce/mt8183-gce.h>
> > +
> > +    mdp3_ccorr: mdp3-ccorr@1401c000 {
> > +      compatible = "mediatek,mt8183-mdp3-ccorr";
> > +      reg = <0x1401c000 0x1000>;
> > +      mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000
> > 0x1000>;
> > +      clocks = <&mmsys CLK_MM_MDP_CCORR>;
> > +    };
> > diff --git
> > a/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> > new file mode 100644
> > index 000000000000..102d9e163139
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/soc/mediatek/mediatek,wdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!2ZNvgvI6qeg4eNprUQ48EiE4ubRcbyNYwEQQ7zr4Nyzt6FxZ0Zs8e8ae-Puy-aLskT378PmjEAnr6ceJ1uZKK4h1GQ$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!2ZNvgvI6qeg4eNprUQ48EiE4ubRcbyNYwEQQ7zr4Nyzt6FxZ0Zs8e8ae-Puy-aLskT378PmjEAnr6ceJ1uYTQJNp6g$
> >  
> > +
> > +title: Mediatek Write Direct Memory Access
> > +
> > +maintainers:
> > +  - Matthias Brugger <matthias.bgg@gmail.com>
> > +  - Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > +
> > +description: |
> > +  Mediatek Write Direct Memory Access(WDMA) component used to
> > write
> > +  the data into DMA.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt8183-mdp3-wdma
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  mediatek,gce-client-reg:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      items:
> > +        - description: phandle of GCE
> > +        - description: GCE subsys id
> > +        - description: register offset
> > +        - description: register size
> > +    description: The register of client driver can be configured
> > by gce with
> > +      4 arguments defined in this property. Each GCE subsys id is
> > mapping to
> > +      a client defined in the header include/dt-
> > bindings/gce/<chip>-gce.h.
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - mediatek,gce-client-reg
> > +  - power-domains
> > +  - clocks
> > +  - iommus
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    #include <dt-bindings/gce/mt8183-gce.h>
> > +    #include <dt-bindings/power/mt8183-power.h>
> > +    #include <dt-bindings/memory/mt8183-larb-port.h>
> > +
> > +    mdp3_wdma: mdp3-wdma@14006000 {
> > +      compatible = "mediatek,mt8183-mdp3-wdma";
> > +      reg = <0x14006000 0x1000>;
> > +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000
> > 0x1000>;
> > +      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> > +      clocks = <&mmsys CLK_MM_MDP_WDMA0>;
> > +      iommus = <&iommu>;
> > +    };


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
