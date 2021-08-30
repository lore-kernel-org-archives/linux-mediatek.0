Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350E9C4320A
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 07:59:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFB2961004
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 07:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFB2961004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIyqEjcDNdRngnigGFgzc45psyaOMZIYk2c5qdYivIE=; b=M94jnIti+7EgdS
	NIVgw9GkJhOqps+dw78vIMol4ll17vRQp0upmqc6q5RlW+PGIo48C4V8XFyY5kHgynKQ8CMsdX7jd
	9oDCNgJZQT6pZo0sGhbgmuHpp3Yfk3hzyhTZg8wff2C0RaJ4zEnTW/GriQKHAwC9+yOESXnbvEVqk
	uIxHXnoPampp09bEOZIyai2MZw5ZVIUOd7zPN8UgN9qOan6HrJ1sTvUQMVpFlckC0AukwdNfyhJ9l
	SXz1xg38OyBXgMcdpk8FmLiRJX7EljuN1QUp5/nak6R29J73nMRbx7UgFGJfj4/1JySMzDEbmbGFu
	bv5LAb4k9EBXCy9jZISQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKcCK-00GgEc-NO; Mon, 30 Aug 2021 07:59:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKcBr-00Gg4J-9p; Mon, 30 Aug 2021 07:58:53 +0000
X-UUID: 37300e0bd70b4026a6fcb4a347edccda-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SAmlQ+ArQPQLCnABUPbpOrUMdGSRUENkoVWvRMe52ck=; 
 b=n7Qu7S1zWV2enQ5wGqa/1985GvPJXMuW2Nd7PHOI45h0+oz9jIjPQhf1XiODazMdnOchTP/NTjBy9BDyLAz7U7XsLProFXzEA3RskJA17mMG0WYbihw1v03FcRVEuAD+54rpL1fKO7ysFvp6JRTZrrTVxcEqtVwudS0LzToJOJg=;
X-UUID: 37300e0bd70b4026a6fcb4a347edccda-20210830
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 406379064; Mon, 30 Aug 2021 00:58:43 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 00:58:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 15:58:39 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 Aug 2021 15:58:39 +0800
Message-ID: <0092244acd520acac81208b8863b15fba58f4193.camel@mediatek.com>
Subject: Re: [PATCH v7 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
From: moudy ho <moudy.ho@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Jernej
 Skrabec" <jernej.skrabec@siol.net>, Maoguang Meng
 <maoguang.meng@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <tfiga@chromium.org>, <drinkcat@chromium.org>, <acourbot@chromium.org>,
 <pihsun@chromium.org>, <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <ben.lok@mediatek.com>, <randy.wu@mediatek.com>,
 <srv_heupstream@mediatek.com>, <hsinyi@google.com>
Date: Mon, 30 Aug 2021 15:58:34 +0800
In-Reply-To: <YSU0TrfFCsaI1TqV@robh.at.kernel.org>
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
 <20210824100027.25989-4-moudy.ho@mediatek.com>
 <YSU0TrfFCsaI1TqV@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_005847_391148_ABF2A496 
X-CRM114-Status: GOOD (  35.53  )
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

On Tue, 2021-08-24 at 13:02 -0500, Rob Herring wrote:
> On Tue, Aug 24, 2021 at 06:00:25PM +0800, Moudy Ho wrote:
> > This patch adds DT binding document for Media Data Path 3 (MDP3)
> > a unit in multimedia system used for scaling and color format
> > convert.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >  .../bindings/media/mediatek,mdp3-ccorr.yaml   |  57 +++++
> >  .../bindings/media/mediatek,mdp3-rdma.yaml    | 207
> > ++++++++++++++++++
> >  .../bindings/media/mediatek,mdp3-rsz.yaml     |  65 ++++++
> >  .../bindings/media/mediatek,mdp3-wdma.yaml    |  71 ++++++
> >  .../bindings/media/mediatek,mdp3-wrot.yaml    |  71 ++++++
> >  5 files changed, 471 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > ccorr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > ccorr.yaml
> > new file mode 100644
> > index 000000000000..59fd68b46022
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > ccorr.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-ccorr.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXdgy3_VCQg8MdsJP7n8TlxbGyajipusfH8hi$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXdgy3_VCQg8MdsJP7n8TlxbGyajipi-OInix$
> >  
> > +
> > +title: Mediatek Media Data Path 3 CCORR Device Tree Bindings
> > +
> > +maintainers:
> > +  - Daoyuan Huang <daoyuan.huang@mediatek.com>
> > +  - Moudy Ho <moudy.ho@mediatek.com>
> > +
> > +description: |
> > +  One of Media Data Path 3 (MDP3) components used to do color
> > correction with 3X3 matrix.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +        - mediatek,mt8183-mdp3-ccorr
> > +
> > +  mediatek,mdp3-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    maxItems: 1
> > +    description: |
> > +      HW index to distinguish same functionality modules.
> 
> If we wanted h/w indexes in DT, we'd have a standard property. Why
> do 
> you need this?
> 
I'm sorry not quite sure what HW indexes means (something like
aliases?)

It was originally used to mark multiple identical modules in the MDP
data path algorithm, so that appropriate paths can be dynamically
dispatched.
> > +
> > +  reg:
> > +    description: |
> > +      Physical base address and length of the function block
> > +      register space, the number aligns with the component
> > +      and its own subcomponent.
> 
> Drop and add 'maxItems: 1'
> 
> > +
> > +  mediatek,gce-client-reg:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: |
> > +      sub-system id corresponding to the global command engine
> > (GCE)
> 
> You mean 'phandle to GCE and sub-system id'?
Yes.

> 
> > +      register address.
> > +      $ref: /schemas/mailbox/mtk-gce.txt
> 
> Kind of looks like jsonschema but in the description and to a .txt 
> file...
> 
> > +
> > +  clocks:
> > +    minItems: 1
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    #include <dt-bindings/gce/mt8183-gce.h>
> > +
> > +    mdp3_ccorr: mdp3_ccorr@1401c000 {
> > +      compatible = "mediatek,mt8183-mdp3-ccorr";
> > +      mediatek,mdp3-id = <0>;
> > +      reg = <0x1401c000 0x1000>;
> > +      mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000
> > 0x1000>;
> > +      clocks = <&mmsys CLK_MM_MDP_CCORR>;
> > +    };
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rdma.yaml
> > new file mode 100644
> > index 000000000000..b355d7fe791e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rdma.yaml
> > @@ -0,0 +1,207 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXdgy3_VCQg8MdsJP7n8TlxbGyajips2k1HT2$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXdgy3_VCQg8MdsJP7n8TlxbGyajipi-OInix$
> >  
> > +
> > +title: Mediatek Media Data Path 3 Device Tree Bindings
> > +
> > +maintainers:
> > +  - Daoyuan Huang <daoyuan.huang@mediatek.com>
> > +  - Moudy Ho <moudy.ho@mediatek.com>
> > +
> > +description: |
> > +  One of Media Data Path 3 (MDP3) components used to do read DMA.
> > +  RDMA0 is also used to be a controller node containing MMSYS,
> > +  MUTEX, GCE and SCP settings.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +        - enum:
> 
> Should be indented 2 more spaces. Install yamllint and check with
> 'make 
> dt_binding_check'.
> 
> > +          # controller node
> > +          - mediatek,mt8183-mdp3
> 
> And then 2 more here.
> 
> > +        - enum:
> > +          - mediatek,mt8183-mdp3-rdma
> > +
> > +      - items:
> > +        - enum:
> > +          # read DMA
> > +          - mediatek,mt8183-mdp3-rdma
> > +
> > +  mediatek,scp:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    maxItems: 1
> > +    description: |
> > +      The node of system control processor (SCP), using
> > +      the remoteproc & rpmsg framework.
> > +      $ref: /schemas/remoteproc/mtk,scp.yaml
> > +
> > +  mediatek,mdp3-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    maxItems: 1
> > +    description: |
> > +      In MDP3, it can allocate multiple identical modules for
> > +      different data path selection or multi-pipeline execution.
> > +      This node is used to indicate the ID of each module.
> > +
> > +  mdp3-comps:
> > +    $ref: /schemas/types.yaml#/definitions/string-array
> > +    items:
> > +        - enum:
> 
> And this is 2 too many spaces...
> 
> > +          # MDP direct-link input path selection, create a
> > +          # component for path connectedness of HW pipe control
> > +          - mediatek,mt8183-mdp3-dl1
> > +        - enum:
> > +          - mediatek,mt8183-mdp3-dl2
> > +        - enum:
> > +          # MDP direct-link output path selection, create a
> > +          # component for path connectedness of HW pipe control
> > +          - mediatek,mt8183-mdp3-path1
> > +        - enum:
> > +          - mediatek,mt8183-mdp3-path2
> > +        - enum:
> > +          # Input DMA of ISP PASS2 (DIP) module for raw image
> > input
> > +          - mediatek,mt8183-mdp3-imgi
> > +        - enum:
> > +          # Output DMA of ISP PASS2 (DIP) module for YUV image
> > output
> > +          - mediatek,mt8183-mdp3-exto
> > +
> > +  mdp3-comp-ids:
> > +    maxItems: 1
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> 
> If only a single item, then it's a 'uint32' not an array.
Only one in other module, but multiple in RDMA0 for subcomponents.
> 
> > +    description: |
> > +      Pipeline ID of MDP direct-link or DIP.
> > +
> > +  reg:
> > +    description: |
> > +      Physical base address and length of the function block
> > +      register space, the number aligns with the component
> > +      and its own subcomponent.
> > +
> > +  mediatek,gce-client-reg:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: |
> > +      sub-system id corresponding to the global command engine
> > (GCE)
> > +      register address.
> > +      $ref: /schemas/mailbox/mtk-gce.txt
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 6
> 
> Need to define what they are.
> 
> > +
> > +  iommus:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> 
> iommus already has a type definition.
> 
> > +    description: |
> > +      Should point to the respective IOMMU block with master
> > +      port as argument.
> > +      $ref: /schemas/iommu/mediatek,iommu.yaml
> 
> No. Drop (the whole description because you don't need generic 
> descriptions for common properties).
> 
> What's needed is how many entries (maxItems: 1).
> 
> > +
> > +  mediatek,mmsys:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    maxItems: 1
> > +    description: |
> > +      The node of mux(multiplexer) controller for HW connections.
> > +
> > +  mediatek,mm-mutex:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    maxItems: 1
> > +    description: |
> > +      The node of sof(start of frame) signal controller.
> > +
> > +  mediatek,mailbox-gce:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      The node of global command engine (GCE), used to read/write
> > +      registers with critical time limitation.
> > +      $ref: /schemas/mailbox/mtk-gce.txt
> > +
> > +  mboxes:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: |
> > +      $ref: /schemas/mailbox/mailbox.txt
> > +
> > +  gce-subsys:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: |
> > +      sub-system id corresponding to the global command engine
> > (GCE)
> > +      register address.
> > +      $ref: /schemas/mailbox/mtk-gce.txt
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      items:
> > +        - enum:
> > +          - mediatek,mt8183-mdp3
> > +        - enum:
> > +          - mediatek,mt8183-mdp3-rdma
> 
> Normally, you want to use 'contains' for if/then schemas:
> 
> compatible:
>   contains:
>     const: mediatek,mt8183-mdp3
> 
> > +
> > +then:
> > +  required:
> > +    - mediatek,scp
> > +    - mediatek,mmsys
> > +    - mediatek,mm-mutex
> > +    - mediatek,mailbox-gce
> > +    - mboxes
> > +    - gce-subsys
> > +
> > +required:
> > +  - compatible
> > +  - mediatek,mdp3-id
> > +  - reg
> > +  - clocks
> > +  - mediatek,gce-client-reg
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
> > +    mdp3_rdma0: mdp3_rdma0@14001000 {
> > +      compatible = "mediatek,mt8183-mdp3",
> > +                   "mediatek,mt8183-mdp3-rdma";
> > +      mediatek,scp = <&scp>;
> > +      mediatek,mdp3-id = <0>;
> > +      mdp3-comps = "mediatek,mt8183-mdp3-dl1", "mediatek,mt8183-
> > mdp3-dl2",
> > +                   "mediatek,mt8183-mdp3-path1", "mediatek,mt8183-
> > mdp3-path2",
> > +                   "mediatek,mt8183-mdp3-imgi", "mediatek,mt8183-
> > mdp3-exto";
> > +      mdp3-comp-ids = <0 1 0 1 0 1>;
> > +      reg = <0x14001000 0x1000>,
> > +            <0x14000000 0x1000>,
> > +            <0x14005000 0x1000>,
> > +            <0x14006000 0x1000>,
> > +            <0x15020000 0x1000>;
> > +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000
> > 0x1000>,
> > +                                <&gce SUBSYS_1400XXXX 0 0x1000>,
> > +                                <&gce SUBSYS_1400XXXX 0x5000
> > 0x1000>,
> > +                                <&gce SUBSYS_1400XXXX 0x6000
> > 0x1000>,
> > +                                <&gce SUBSYS_1502XXXX 0 0x1000>;
> > +      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> > +      clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> > +               <&mmsys CLK_MM_MDP_RSZ1>,
> > +               <&mmsys CLK_MM_MDP_DL_TXCK>,
> > +               <&mmsys CLK_MM_MDP_DL_RX>,
> > +               <&mmsys CLK_MM_IPU_DL_TXCK>,
> > +               <&mmsys CLK_MM_IPU_DL_RX>;
> > +      iommus = <&iommu>;
> > +      mediatek,mmsys = <&mmsys>;
> > +      mediatek,mm-mutex = <&mutex>;
> > +      mediatek,mailbox-gce = <&gce>;
> > +      mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
> > +               <&gce 21 CMDQ_THR_PRIO_LOWEST 0>,
> > +               <&gce 22 CMDQ_THR_PRIO_LOWEST 0>,
> > +               <&gce 23 CMDQ_THR_PRIO_LOWEST 0>;
> > +      gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
> > +                   <&gce 0x14010000 SUBSYS_1401XXXX>,
> > +                   <&gce 0x14020000 SUBSYS_1402XXXX>,
> > +                   <&gce 0x15020000 SUBSYS_1502XXXX>;
> > +    };
> > \ No newline at end of file
> 
> Fix this.
> 
> Similar comments on the rest.
> 
> Rob

Thanks for the suggestion, the remaining will be corrected in the
further.

Moudy Ho
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
