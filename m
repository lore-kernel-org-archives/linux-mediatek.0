Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC40FC2BA4C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 10:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3da5HILeyYPGnGtHLWsjk3LqVIbbgxLagISkn91noF0=; b=NLwY3IFGfBYlL2
	ikR2u2Dn4vgf2lUASAXAhgsGAEkX2EFxWJ7K1fDPE4KEvB6GLeX2c+DxtGhvkVgz9tPBgbV0d6o+Q
	2WwUUaSUyDXBcx+Uzhw+QkIqiPQVjM60ZVcbWQ+0XowtyRLmlCV4SJ7rhtaSo01WbqCVuPROftdlW
	ZxaaY71ExnoryDWoZmeONCkiGlXD9DwIdpDvflCPrkNMgWpg6X2WUaAU83CMbxLMukEjth4Xg3B1X
	QRh7V7REY6yd9yppB1EE7kp7yMnc0DhWbsQa+HmGj4jkNH8WxhfGq8bnhjjXvf65eRfvkh1JlgHfc
	aWTxYUTphPrlIqsOz/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCfUB-00BDEu-3M; Wed, 26 Jan 2022 10:25:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCfTw-00BDBn-IU; Wed, 26 Jan 2022 10:24:55 +0000
X-UUID: b5faf8e611e247c58abbdd74b25d7480-20220126
X-UUID: b5faf8e611e247c58abbdd74b25d7480-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1185090378; Wed, 26 Jan 2022 03:24:46 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 02:24:44 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 26 Jan 2022 18:24:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Jan 2022 18:24:42 +0800
Message-ID: <56801c5e596727a4f97e82e23450f9689808e040.camel@mediatek.com>
Subject: Re: [PATCH v11 1/3] dt-binding: mt8183: add Mediatek MDP3 dt-bindings
From: moudy.ho <moudy.ho@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Jernej
 Skrabec" <jernej.skrabec@siol.net>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Alexandre Courbot <acourbot@chromium.org>,
 <tfiga@chromium.org>, <drinkcat@chromium.org>, <pihsun@chromium.org>,
 <hsinyi@google.com>, Maoguang Meng <maoguang.meng@mediatek.com>, "daoyuan
 huang" <daoyuan.huang@mediatek.com>, Ping-Hsun Wu
 <ping-hsun.wu@mediatek.com>, <menghui.lin@mediatek.com>,
 <sj.huang@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Wed, 26 Jan 2022 18:24:42 +0800
In-Reply-To: <815a363d-749e-d7a5-3786-c11dfd4d22d4@collabora.com>
References: <20220105093758.6850-1-moudy.ho@mediatek.com>
 <20220105093758.6850-2-moudy.ho@mediatek.com>
 <YesiwTSxa9HJ1lxG@robh.at.kernel.org>
 <815a363d-749e-d7a5-3786-c11dfd4d22d4@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_022452_675319_46E10C64 
X-CRM114-Status: GOOD (  66.40  )
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

On Mon, 2022-01-24 at 12:40 +0100, AngeloGioacchino Del Regno wrote:
> Il 21/01/22 22:16, Rob Herring ha scritto:
> > On Wed, Jan 05, 2022 at 05:37:56PM +0800, Moudy Ho wrote:
> 
> Hello Rob,
> 
> since I'm not the best at reviewing dt-bindings, I always try to
> leave that to
> 
> other reviewers; in which case, thank you for your awesome review
> activity on
> 
> all of these (and helping me a lot on some of my attempts to write
> yaml..!!)
> 
> 
> In this case, though, since I do have knowledge about the platform,
> it's probably
> worth for me to try to address some of your questions, on at least
> this one.
> 
> 
> > > This patch adds DT binding document for Media Data Path 3 (MDP3)
> > > a unit in multimedia system used for scaling and color format
> > > convert.
> > > 
> > > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > > ---
> > >   .../bindings/media/mediatek,mdp3-rdma.yaml    | 193
> > > ++++++++++++++++++
> > >   .../bindings/media/mediatek,mdp3-rsz.yaml     |  55 +++++
> > >   .../bindings/media/mediatek,mdp3-wrot.yaml    |  57 ++++++
> > >   .../bindings/soc/mediatek/mediatek,ccorr.yaml |  47 +++++
> > >   .../bindings/soc/mediatek/mediatek,wdma.yaml  |  58 ++++++
> > >   5 files changed, 410 insertions(+)
> > >   create mode 100644
> > > Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> > >   create mode 100644
> > > Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> > >   create mode 100644
> > > Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> > >   create mode 100644
> > > Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yam
> > > l
> > >   create mode 100644
> > > Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml 
> > > b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> > > new file mode 100644
> > > index 000000000000..002503383934
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > rdma.yaml
> > > @@ -0,0 +1,193 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: 
> > > https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!zgc4tZBqeOyinIM3DFy7YlTTFM9LtRFRUOLmIB6Go6xpTeaPQaFg_ekOtt5fpkQb$
> > >  
> > > +$schema: 
> > > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!zgc4tZBqeOyinIM3DFy7YlTTFM9LtRFRUOLmIB6Go6xpTeaPQaFg_ekOtk8-fzFI$
> > >  
> > > +
> > > +title: Mediatek Read Direct Memory Access
> > > +
> > > +maintainers:
> > > +  - Matthias Brugger <matthias.bgg@gmail.com>
> > > +
> > > +description: |
> > > +  Mediatek Read Direct Memory Access(RDMA) component used to do
> > > read DMA.
> > > +  It contains one line buffer to store the sufficient pixel
> > > data, and
> > > +  must be siblings to the central MMSYS_CONFIG node.
> > > +  For a description of the MMSYS_CONFIG binding, see
> > > +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.
> > > yaml
> > > +  for details.
> > > +  The 1st RDMA is also used to be a controller node in Media
> > > Data Path 3(MDP3)
> > > +  that containing MMSYS, MUTEX, GCE and SCP settings.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          # MDP3 controller node
> > > +          - const: mediatek,mt8183-mdp3
> > 
> > How is this more specific than this:
> > 
> > > +          - const: mediatek,mt8183-mdp3-rdma0
> 
> Probably, oneOf is not the right choice here... "mediatek,mt8183-
> mdp3" is needed
> to probe the "main" mdp3 core pdev, while RDMA0 is a necessary
> component (as in
> this driver uses the component framework, and rdma0 is required for
> functionality,
> as far as I understand).
> 
> This shouldn't be a choice, meaning that defining mdp3-rdma0 without
> mdp3 is
> completely useless, as there wouldn't be anything else initializing
> that component,
> nor sub-components of that.
> 
Hi Rob and Angelo,
Sorry for the incomplete description here, I originally planned to add
a compatible name here in the future when the chip has multiple RDMAs.
Since 8183 currently has only one RDMA, the above design expression is
incorrect and should be rewritten as follows:

[8183]
properties:
  compatible:
    items:
      # MDP3 controller node
      - const: mediatek,mt8183-mdp3
      - const: mediatek,mt8195-mdp3-rdma0

[8195]
properties:
  compatible:
    oneOf:
      - items:
          # MDP3 controller node
          - const: mediatek,mt8183-mdp3
          - const: mediatek,mt8195-mdp3-rdma0
      - items:
          # normal RDMA conponent
          - const: mediatek,mt8195-mdp3-rdma1
      - items:
          # normal RDMA conponent
          - const: mediatek,mt8195-mdp3-rdma2
      - items:
          # normal RDMA conponent
          - const: mediatek,mt8195-mdp3-rdma3

> > > +      - items:
> > > +          # normal RDMA conponent
> > > +          - const: mediatek,mt8183-mdp3-rdma0
> > > +
> > > +  mediatek,scp:
> > > +    description: The node of system control processor (SCP),
> > > using
> > > +      the remoteproc & rpmsg framework.
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    maxItems: 1
> > > +
> > > +  mediatek,mdp3-comps:
> > > +    description: MTK sub-system of direct-link or DIP
> > 
> > This needs a better description. What is DIP? What is direct-link?
> 
> I agree, this needs a better description.
> 
I tried to modify the description as follows, could you help to see if
there is anything confusing:

  mediatek,mdp3-comps:
    description:
      MDP subsystem which has direct-link from Image Signal
Processor(ISP).
      When using the camera, the DMA of ISP PASS (DIP) module will
directly trigger MDP3 without other control (such as V4L2 M2M) to
create corresponding HW path.
      The MDP3 controller must set up a series of registers at the
beginning of path creation which covering MMSYS, IMGSYS, and MDP3's
components, so that data flow can pass through MDP3.
      The entire path is briefly described as follows:
      DIP   : ISP ->
      MDP3  :       IMGI -> DL -> CCORR(optional) -> RSZ -> PATH_OUT ->
WDMA/WROT
> > 
> > > +    $ref: /schemas/types.yaml#/definitions/string-array
> > > +    items:
> > > +      - enum:
> > > +          # MDP direct-link input path selection, create a
> > > +          # component for path connectedness of HW pipe control
> > > +          - mediatek,mt8183-mdp3-dl1
> > > +      - enum:
> > > +          - mediatek,mt8183-mdp3-dl2
> > > +      - enum:
> > > +          # MDP direct-link output path selection, create a
> > > +          # component for path connectedness of HW pipe control
> > > +          - mediatek,mt8183-mdp3-path1
> > > +      - enum:
> > > +          - mediatek,mt8183-mdp3-path2
> > > +      - enum:
> > > +          # Input DMA of ISP PASS2 (DIP) module for raw image
> > > input
> > > +          - mediatek,mt8183-mdp3-imgi
> > > +      - enum:
> > > +          # Output DMA of ISP PASS2 (DIP) module for YUV image
> > > output
> > > +          - mediatek,mt8183-mdp3-exto
> > 
> > There's only 1 possible value for mediatek,mdp3-comps, so why does
> > it
> > need to be in DT?
> > 
> 
> The wanted logic here (I believe) is that, depending on firmware
> capabilities
> and/or platform/board capabilities, you may miss some subcomponents
> like IMGI
> and/or EXTO.
> As for DL1/2 and PATH1/2... DL1+PATH1 is surely critically necessary
> for the
> functionality of the MDP3 RDMA... I don't know whether it's possible
> that we
> get any fw/platform/device that's not using DL2/PATH2 at all.
> 
> Moudy, can you please explain?
> 
Hi Angelo,
  Thanks for your help and your assumptions are correct.
  In further chips(such as 8195), IMGI will be replaced by WPE, and
PATH_OUT will be removed, and DL will be expanded to 6 (implicit number
of direct-link from ISP paths).
  For this variable hardware design, not sure how to flexibly describe
in dt-bindings to meet futher requirements.
  It should be that I got wrong with the definition of "enum", should
it be rewritten as follows in 8183?
      items:
        - enum:
          # MDP direct-link input path selection, create a
          # component for path connectedness of HW pipe control
          - mediatek,mt8183-mdp3-dl1
          - mediatek,mt8183-mdp3-dl2
          # MDP direct-link output path selection, create a
          # component for path connectedness of HW pipe control
          - mediatek,mt8183-mdp3-path1
          - mediatek,mt8183-mdp3-path2
          # Input DMA of ISP PASS2 (DIP) module for raw image input
          - mediatek,mt8183-mdp3-imgi
          # Output DMA of ISP PASS2 (DIP) module for YUV image output
          - mediatek,mt8183-mdp3-exto
      items: (8195)
          snip....
      items: (8192)
          snip...
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: basic RDMA HW address
> > > +      - description: MDP direct-link 1st and 2nd input
> > > +      - description: MDP direct-link 1st output
> > > +      - description: MDP direct-link 2nd output
> > > +      - description: ISP input and output
> > > +
> > > +  mediatek,gce-client-reg:
> > > +    description: The register of client driver can be configured
> > > by gce with
> > > +      4 arguments defined in this property, such as phandle of
> > > gce, subsys id,
> > > +      register offset and size. Each GCE subsys id is mapping to
> > > a client
> > > +      defined in the header include/dt-bindings/gce/<chip>-
> > > gce.h.
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    items:
> > > +      - description: GCE client for RDMA
> > > +      - description: GCR client for MDP direct-link 1st and 2nd
> > > input
> > > +      - description: GCR client for MDP direct-link 1st output
> > > +      - description: GCR client for MDP direct-link 2nd output
> > > +      - description: GCR client for ISP input and output
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: RDMA clock
> > > +      - description: RSZ clock
> > > +      - description: direck-link TX clock in MDP side
> > > +      - description: direck-link RX clock in MDP side
> > > +      - description: direck-link TX clock in ISP side
> > > +      - description: direck-link RX clock in ISP side
> > > +
> > > +  iommus:
> > > +    maxItems: 1
> > > +
> > > +  mediatek,mmsys:
> > > +    description: The node of mux(multiplexer) controller for HW
> > > connections.
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +
> > > +  mediatek,mm-mutex:
> > 
> > Is this some sort of h/w lock? We have a standard binding for that.
> > 
> 
> There's a story behind that one: this was part of mtk (display) DRM
> drivers, then
> it was moved to soc/mediatek/mtk-mutex.c as it started being shared.
> 
> I wonder if the mm-mutex can be rewritten and moved to hwspinlock...
> this driver
> is growing and now, with the introduction of MDP3, we're seeing some
> more.
> 
> Though, it's definitely worth mentioning that the usage of MediaTek's
> mm-mutex is
> varying a bit between the drm case and the mdp3 case as, here, we
> have a "command
> queue" mechanism that is used for commands ordering in HW.
> This is a very complex architecture that has very specific
> requirements.
> For how I see it, migrating that to hwspinlock would require an
> almost complete
> reimplementation of soc/mediatek/*, which would take a considerable
> amount of
> time and efforts.
> I'm mostly sure that I can help with that, but for how things are
> looking right
> 
> now, between refactoring, getting code solid, going through sane
> reviews and a
> final merge, I'd say that this will take 8-12 months from now.
> 
> For this reason, I would propose to perform a slow and steady
> migration of the
> MediaTek mmsys, scpsys, mutex over time, but only after getting in
> the support
> for the new SoCs and functionality for the older ones, provided in
> this series
> and some others that were already sent by MTK, half (or more) of
> which have
> already been merged.

  Sorry for the misunderstanding caused by the name, the original mtk-
mutex design did have the ability to lock registers, but that has since
been removed but the name continues.
  It's not one of those h/w locks like spinlock, semaphore, or mutex
but is just designed to send signals to trigger h/w components to get
or send data.

> > > +    description: The node of sof(start of frame) signal
> > > controller.
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    maxItems: 1
> > > +
> > > +  mediatek,mailbox-gce:
> > > +    description: The node of global command engine (GCE), used
> > > to read/write
> > > +      registers with critical time limitation.
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +
> > > +  mboxes:
> > > +    items:
> > > +      - description: used for 1st data pipe from RDMA
> > > +      - description: used for 2nd data pipe from RDMA
> > > +      - description: used for 3rd data pipe from Direct-Link
> > > +      - description: used for 4th data pipe from Direct-Link
> > > +
> > > +  gce-subsys:
> > > +    description: sub-system id corresponding to the global
> > > command engine (GCE)
> > > +      register address.
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +
> > > +if:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        const: mediatek,mt8183-mdp3
> > > +
> > > +then:
> > > +  required:
> > > +    - mediatek,scp
> > > +    - mediatek,mmsys
> > > +    - mediatek,mm-mutex
> > > +    - mediatek,mailbox-gce
> > > +    - mboxes
> > > +    - gce-subsys
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - mediatek,gce-client-reg
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/mt8183-clk.h>
> > > +    #include <dt-bindings/gce/mt8183-gce.h>
> > > +    #include <dt-bindings/power/mt8183-power.h>
> > > +    #include <dt-bindings/memory/mt8183-larb-port.h>
> > > +
> > > +    mdp3_rdma0: mdp3_rdma0@14001000 {
> > > +      compatible = "mediatek,mt8183-mdp3",
> > > +                   "mediatek,mt8183-mdp3-rdma0";
> > > +      mediatek,scp = <&scp>;
> > > +      mediatek,mdp3-comps = "mediatek,mt8183-mdp3-dl1",
> > > +                            "mediatek,mt8183-mdp3-dl2",
> > > +                            "mediatek,mt8183-mdp3-path1",
> > > +                            "mediatek,mt8183-mdp3-path2",
> > > +                            "mediatek,mt8183-mdp3-imgi",
> > > +                            "mediatek,mt8183-mdp3-exto";
> > > +      reg = <0x14001000 0x1000>,
> > > +            <0x14000000 0x1000>,
> > > +            <0x14005000 0x1000>,
> > > +            <0x14006000 0x1000>,
> > > +            <0x15020000 0x1000>;
> > > +      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000
> > > 0x1000>,
> > > +                                <&gce SUBSYS_1400XXXX 0 0x1000>,
> > > +                                <&gce SUBSYS_1400XXXX 0x5000
> > > 0x1000>,
> > > +                                <&gce SUBSYS_1400XXXX 0x6000
> > > 0x1000>,
> > > +                                <&gce SUBSYS_1502XXXX 0 0x1000>;
> > > +      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> > > +      clocks = <&mmsys CLK_MM_MDP_RDMA0>,
> > > +               <&mmsys CLK_MM_MDP_RSZ1>,
> > > +               <&mmsys CLK_MM_MDP_DL_TXCK>,
> > > +               <&mmsys CLK_MM_MDP_DL_RX>,
> > > +               <&mmsys CLK_MM_IPU_DL_TXCK>,
> > > +               <&mmsys CLK_MM_IPU_DL_RX>;
> > > +      iommus = <&iommu>;
> > > +      mediatek,mmsys = <&mmsys>;
> > > +      mediatek,mm-mutex = <&mutex>;
> > > +      mediatek,mailbox-gce = <&gce>;
> > > +      mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST>,
> > > +               <&gce 21 CMDQ_THR_PRIO_LOWEST>,
> > > +               <&gce 22 CMDQ_THR_PRIO_LOWEST>,
> > > +               <&gce 23 CMDQ_THR_PRIO_LOWEST>;
> > > +      gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
> > > +                   <&gce 0x14010000 SUBSYS_1401XXXX>,
> > > +                   <&gce 0x14020000 SUBSYS_1402XXXX>,
> > > +                   <&gce 0x15020000 SUBSYS_1502XXXX>;
> > > +    };
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> > > b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> > > new file mode 100644
> > > index 000000000000..cd4cf1531535
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > rsz.yaml
> > > @@ -0,0 +1,55 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: 
> > > https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml*__;Iw!!CTRNKA9wMg0ARbw!zgc4tZBqeOyinIM3DFy7YlTTFM9LtRFRUOLmIB6Go6xpTeaPQaFg_ekOtoNRPuZQ$
> > >  
> > > +$schema: 
> > > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!zgc4tZBqeOyinIM3DFy7YlTTFM9LtRFRUOLmIB6Go6xpTeaPQaFg_ekOtk8-fzFI$
> > >  
> > > +
> > > +title: Mediatek Resizer
> > > +
> > > +maintainers:
> > > +  - Matthias Brugger <matthias.bgg@gmail.com>
> > > +
> > > +description: |
> > > +  One of Media Data Path 3 (MDP3) components used to do frame
> > > resizing.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - mediatek,mt8183-mdp3-rsz0
> > > +          - mediatek,mt8183-mdp3-rsz1
> > 
> > Again, what's the difference between 0 and 1?
> > 
> > I've probably asked that before, but without a sufficient reasoning
> > here in the schema I'm just going to keep asking the same question.
> 
> This can probably be, instead, something like
> 
> compatible = "mediatek,mt8183-mdp3-rsz";
> reg = < .... >;
> mediatek,instance-id = <0>;
> gce reg, clocks, blah...
> 
> or
> 
> compatible = "mediatek,mt8183-mdp3-rsz";
> reg = < ...rsz0... >, < ...rsz1... >;
> reg-names = "rsz0", "rsz1";
> gce reg, clocks, blah...
> 
> 
> ...In any case, if MediaTek chose to separate these like that, I
> guess that
> there will be differences in newer SoCs that would make that kind of
> binding
> much necessary.
> 
> Please Moudy, can you explain why you didn't write that like the
> examples
> that I provided there?

Before version 10 it was written the same way as the first form Angelo
mentioned - with h/w indexed properties, but Rob thinks it's bad idea.
At that time I asked Rob if it could be rewritten into its current V11
form, but I updated before I got a suggestion.
Apologize for the inconvenience casued by my careless handling.

In the 8183 MDP3, only RSZ is configured with 2 sets. The 1st set
upstream can have quality adjustment components (like AAL or CCORR or
both) connected, but the 2nd set does not.
Although those two RSZ components have the same hardware function but
register address. The MDP paths with different functions will be
created due to the different upstream and downstream connections.
In addition to the various upstream/downstream connection methods
caused by chip design, the above conditions are also dynamically
determined according to the current usage scenario(with or without PQ,
rotation...etc).
Also, considering that multiple paths are used at the same time, MDP3
will need to know which components are currently available for
dispatch.
At present, I can't find a better description form, let me know if you
have any thoughts with this.

> > 
> > Rob
> > 

Thanks,
Moudy
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
