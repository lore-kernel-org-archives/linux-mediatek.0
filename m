Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADBCC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 09:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=peZz5h4h3bn8hv8YHumr7ceqkFhj3w4YIO8slWNAEQE=; b=HULPAH1KRt75me
	kNNQADUcnrMFIZsj33aCfc7eYk0eTe7GGA7Z6v0AxAmVUTD/SPeQzfgZ/DYu+HR6LCG5B63f9grs7
	GugFlhj/jL767bpWlh3vLlF2Wo0AizBd+SjUblSAeB3CkNPfHF7JT1LwNLRxOW4cN7tTrMNWf7a7B
	NT77aBoNBAPE8u+7/ocdDzN1kHh8IQZbh1GCbA3QhSMamubCz56R2vqqoKibfPEIeYX2e2J/sxJxR
	00kLAukel/shKFAXCgnnSvOJImVJ+CD5BaUume8/XqVL05StI3IcwX9gcj2+J+szhL/ymZKMtUk32
	mnCFvW4++D+mXvRaUDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc206-0050ei-IA; Wed, 06 Apr 2022 09:30:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc202-0050dN-EB; Wed, 06 Apr 2022 09:30:52 +0000
X-UUID: 53f81bc097e64d8fa315f7051798556c-20220406
X-UUID: 53f81bc097e64d8fa315f7051798556c-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 794107212; Wed, 06 Apr 2022 02:30:44 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 02:23:32 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 17:23:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 17:23:30 +0800
Message-ID: <e75f2d49447f9c04e7f6b06c6cafdfd28b741ef7.camel@mediatek.com>
Subject: Re: [PATCH v12 1/3] dt-binding: mt8183: add Mediatek MDP3 dt-bindings
From: moudy.ho <moudy.ho@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Jernej
 Skrabec" <jernej.skrabec@siol.net>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Alexandre Courbot <acourbot@chromium.org>,
 <tfiga@chromium.org>, <drinkcat@chromium.org>, <pihsun@chromium.org>,
 <hsinyi@google.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Maoguang Meng
 <maoguang.meng@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, <menghui.lin@mediatek.com>,
 <sj.huang@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 6 Apr 2022 17:23:30 +0800
In-Reply-To: <YkYa6vyucOrwPNcX@robh.at.kernel.org>
References: <20220317145605.25782-1-moudy.ho@mediatek.com>
 <20220317145605.25782-2-moudy.ho@mediatek.com>
 <YkYa6vyucOrwPNcX@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_023050_514679_2F910F05 
X-CRM114-Status: GOOD (  49.65  )
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

Hi Rob,

Thanks for your advises, some responses are as follows.

On Thu, 2022-03-31 at 16:19 -0500, Rob Herring wrote:
> On Thu, Mar 17, 2022 at 10:56:03PM +0800, Moudy Ho wrote:
> > This patch adds DT binding documents for Media Data Path 3 (MDP3)
> > a unit in multimedia system combined with several components and
> > used for scaling and color format convert.
> > 
> > It can create multiple paths with different functions by assigning
> > different components, a simple diagram is as follows:
> > 
> >   +------------+          +------------+
> >   |    RDMA    |          |   ISP[*1]  |
> >   +---+--+--+--+          +-----+--+---+
> >       A  B  C                   2  1
> >       v  v  v                   v  v
> >       |  |  |                   |  |
> >       |  |  +---------+         |  |
> >       |  |            |         |  |
> >       |  +-------+    |         |  |
> >       |          |    |         |  |
> >       |  +-------+----+---------+  |
> >       |  |       |    |            |
> >       |  |       |    +---------+  |
> >       v  v       |              |  |
> >       A  2       |              |  |
> >     ********     |              |  |
> >   **        **   |              |  |
> >  *   PQ[*2]   *  |              |  |
> >   **        **   |              |  |
> >     ********     |              |  |
> >       |  |       |              |  |
> >       v  v       |              v  v
> >       A  2       |              C  1
> >   +---+--+---+   |        +-----+--+--+
> >   |    RSZ   |   |        |    RSZ    |
> >   +---+------+   |        +-----+--+--+
> >       D          |              3  4
> >       v          |              v  v
> >       |          |              |  |
> >       |  +-------+              |  |
> >       |  |                      |  |
> >       |  |  +-------------------+  |
> >       |  |  |                      |
> >       v  v  v                      v
> >       D  B  3                      4
> >   +---+--+--+--+         +---------+--+
> >   |    WROT    |         |    WDMA    |
> >   +------------+         +------------+
> 
> Sure seems like you should be using the OF graph binding to describe 
> these connections unless all the sub-blocks and their connections
> are 
> fixed across different SoCs.
> 

Sorry for the misunderstanding, this diagram was originally used to
illustrate the design principle of the previous version, but now the
relevant routing information has been moved from MDP3 to MMSYS.
The original hardware index is designed for MDP3 to control routing
settings, but at your reminder, we check that this control is actually
more suitable to be placed in MMSYS which directly sets the mux
register.
Since the final control is in the upper module MMSYS and MDP3 is only a
component provider, should the relevant block diagram be removed from
MDP3 to avoid further misunderstanding.

> > 
> > [*1] Direct-link path for camera input
> > [*2] A series of picture quality adjustment
> >      engines, composed of AAL, CCORR, TDSHP
> >      and COLOR
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >  .../bindings/media/mediatek,mdp3-rdma.yaml    | 214
> > ++++++++++++++++++
> >  .../bindings/media/mediatek,mdp3-rsz.yaml     |  54 +++++
> >  .../bindings/media/mediatek,mdp3-wrot.yaml    |  57 +++++
> >  .../bindings/soc/mediatek/mediatek,ccorr.yaml |  47 ++++
> >  .../bindings/soc/mediatek/mediatek,wdma.yaml  |  58 +++++
> >  5 files changed, 430 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rdma.yaml
> > new file mode 100644
> > index 000000000000..3bf59c3f521f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rdma.yaml
> > @@ -0,0 +1,214 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!wgkVc9UZ_DrFo3wSkfSUMtOET9ehz_854vK450j_jmVDVRaLrLgDaCKPPbJWNtWX$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!wgkVc9UZ_DrFo3wSkfSUMtOET9ehz_854vK450j_jmVDVRaLrLgDaCKPPZdLY-1x$
> >  
> > +
> > +title: Mediatek Read Direct Memory Access
> > +
> > +maintainers:
> > +  - Matthias Brugger <matthias.bgg@gmail.com>
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
> > +  The 1st RDMA is also used to be a controller node in Media Data
> > Path 3(MDP3)
> > +  that containing MMSYS, MUTEX, GCE and SCP settings.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          # MDP3 controller node
> > +          - const: mediatek,mt8183-mdp3
> > +          - const: mediatek,mt8183-mdp3-rdma
> 
> This does not make sense as a compatible entry. The first string
> should 
> be more specific than the 2nd string. The controller node is a
> different 
> instance of the RDMA block or some s/w designation? Looks like the 
> latter to me...
> 
> 

This is exactly what you supposed, and there is currently only one RDMA
and should not make additional distinctions. This part will be
corrected in the next version

> > Thanks for the reminder, this part should not be designed as a
> > multi-instance scenario, and the relevant design should be left to
> > present in future chips.
> > +      - items:
> > +          # normal RDMA conponent
> > +          - const: mediatek,mt8183-mdp3-rdma
> > +
> > +  mediatek,scp:
> > +    description: |
> > +      The node of system control processor (SCP), using
> > +      the remoteproc & rpmsg framework.
> > +    $ref: '/schemas/types.yaml#/definitions/phandle'
> > +    maxItems: 1
> > +
> > +  mediatek,mdp3-comps:
> > +    description: |
> > +      MDP subsystem which has direct-link from Image Signal
> > Processor(ISP).
> > +      When using the camera, the DMA of ISP PASS (DIP) module will
> > directly
> > +      trigger MDP3 without other control (such as V4L2 M2M) to
> > create
> > +      corresponding HW path.
> > +      The MDP3 controller must set up a series of registers at the
> > beginning of
> > +      path creation which covering MMSYS, IMGSYS, and MDP3's
> > components,
> > +      so that data flow can pass through MDP3.
> > +      The entire path is briefly described as follows
> > +      ISP --+
> > +            |
> > +            +-> DIP --+
> > +      ................|...........................................
> > ...
> > +      (MDP3)          +->IMGI -+-> DL1 ->  RSZ -+-> PATH1 -> WROT
> > +                               |            ^   |
> > +                               |            |   |
> > +                               +-> DL2 -----+   +-> PATH2 -> WDMA
> > +                               |
> > +                               +---------------------------> EXTO
> > +    $ref: '/schemas/types.yaml#/definitions/string-array'
> > +    items:
> > +      enum:
> > +        # MDP direct-link input path selection, create a
> > +        # component for path connectedness of HW pipe control
> > +        - mediatek,mt8183-mdp3-dl1
> > +        - mediatek,mt8183-mdp3-dl2
> > +        # MDP direct-link output path selection, create a
> > +        # component for path connectedness of HW pipe control
> > +        - mediatek,mt8183-mdp3-path1
> > +        - mediatek,mt8183-mdp3-path2
> > +        # Input DMA of ISP PASS2 (DIP) module for raw image input
> > +        - mediatek,mt8183-mdp3-imgi
> > +        # Output DMA of ISP PASS2 (DIP) module for YUV image
> > output
> > +        - mediatek,mt8183-mdp3-exto
> > +
> > +  reg:
> > +    items:
> > +      - description: basic RDMA HW address
> > +      - description: MDP direct-link 1st and 2nd input
> > +      - description: MDP direct-link 1st output
> > +      - description: MDP direct-link 2nd output
> > +      - description: ISP input and output
> > +
> > +  mediatek,gce-client-reg:
> > +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> > +    minItems: 1
> > +    items:
> > +      - description: GCE client for RDMA
> > +      - description: GCE client for dl1 and dl2
> > +      - description: GCE client for path1
> > +      - description: GCE client for path2
> > +      - description: GCE client for imgi and exto
> > +    description: |
> > +      The register of client driver can be configured by gce with
> > +      4 arguments defined in this property, such as phandle of
> > gce, subsys id,
> > +      register offset and size. Each GCE subsys id is mapping to a
> > client
> > +      defined in the header include/dt-bindings/gce/<chip>-gce.h.
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: RDMA clock
> > +      - description: RSZ clock
> > +      - description: direck-link TX clock in MDP side
> > +      - description: direck-link RX clock in MDP side
> > +      - description: direck-link TX clock in ISP side
> > +      - description: direck-link RX clock in ISP side
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  mediatek,mmsys:
> > +    description: The node of mux(multiplexer) controller for HW
> > connections.
> > +    $ref: '/schemas/types.yaml#/definitions/phandle'
> > +
> > +  mediatek,mm-mutex:
> > +    description: |
> > +      Mediatek mutex, namely MUTEX, is used to send the triggers
> > signals called
> > +      Start Of Frame(SOF) / End Of Frame(EOF) to each sub-modules
> > on the data path.
> > +      In some SoC, such as mt2701, MUTEX could be a hardware mutex
> > which protects
> > +      the shadow register.
> > +    $ref: '/schemas/types.yaml#/definitions/phandle'
> > +
> > +  mediatek,mailbox-gce:
> > +    description: |
> > +      The node of global command engine (GCE), used to read/write
> > +      registers with critical time limitation.
> > +    $ref: '/schemas/types.yaml#/definitions/phandle'
> > +
> > +  mboxes:
> > +    items:
> > +      - description: used for 1st data pipe from RDMA
> > +      - description: used for 2nd data pipe from RDMA
> > +      - description: used for 3rd data pipe from Direct-Link
> > +      - description: used for 4th data pipe from Direct-Link
> > +
> > +  gce-subsys:
> 
> Vendor prefix needed.
> 

Thanks for the reminder, this should be removed directly and replaced
by "mediatek,gce-client-reg".

> > +    description: |
> > +      sub-system id corresponding to the global command engine
> > (GCE)
> > +      register address.
> > +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: mediatek,mt8183-mdp3
> > +
> > +then:
> > +  required:
> > +    - mediatek,scp
> > +    - mediatek,mmsys
> > +    - mediatek,mm-mutex
> > +    - mediatek,mailbox-gce
> 
> Note that if there's only 1 instance of these blocks, you can just
> find 
> them by compatible and don't need a property.
> 

Thanks for the correction, this part should not be designed as a multi-
instance scenario, and the relevant design should be left to present in
future chips.

Thanks,
Moudy
> > +    - mboxes
> > +    - gce-subsys
> > +
> > +required:
> > +  - compatible
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
> > +      mediatek,mdp3-comps = "mediatek,mt8183-mdp3-dl1",
> > +                            "mediatek,mt8183-mdp3-dl2",
> > +                            "mediatek,mt8183-mdp3-path1",
> > +                            "mediatek,mt8183-mdp3-path2",
> > +                            "mediatek,mt8183-mdp3-imgi",
> > +                            "mediatek,mt8183-mdp3-exto";
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
> > +      mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST>,
> > +               <&gce 21 CMDQ_THR_PRIO_LOWEST>,
> > +               <&gce 22 CMDQ_THR_PRIO_LOWEST>,
> > +               <&gce 23 CMDQ_THR_PRIO_LOWEST>;
> > +      gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
> > +                   <&gce 0x14010000 SUBSYS_1401XXXX>,
> > +                   <&gce 0x14020000 SUBSYS_1402XXXX>,
> > +                   <&gce 0x15020000 SUBSYS_1502XXXX>;
> > +    };


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
