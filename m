Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7E1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 07:20:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD0D3610A2
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 07:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD0D3610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGvERppevNn6XPWYVMamT2937npCsBJvVK6gH0f034U=; b=FId104DjmsSp4A
	TI5gnl1quX2rGrHJSkJdIHHJsCNT70LJBHQCqzY56UBGKc2eSIlvI1DjB/jNJZjajtE8rdVRtIJ7z
	vMYKJg4Ml03yxISXCEMWPiCm+CRo0WWQeAvScc7X54iRxEiaz4pJMs9tYRxqZ5IUU15X3TRQeJt7p
	Iw13pMocu/X7PhBQlotfy07twyCpmX5jZqb16yTTR/dE9aVLVYlnQAMrFq/KT5X1Og6jy12Fb8Mnn
	sYXOVPH45WmGqaE0ejpdTpFZ/zSAVTuOwhB3fYRnjNE4dmlJb0zbXxF+B9E3SeUItpfE6iyqIhbvc
	dlQZVKKwCsPatfx8uayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM3Uf-00BA09-II; Fri, 03 Sep 2021 07:20:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM3Uc-00B9yg-EH; Fri, 03 Sep 2021 07:20:08 +0000
X-UUID: 0fd6939327e645feb66b27e920c46168-20210903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jkQ8GlgO4m2Y/GUZwg2HJt2/bsPC1xOfAKtALF6ap1s=; 
 b=RKtMgiOufNtxSzepG+Hjf3nLO70d5ONn9tiG9NI5sNw4cV8xZGXZdsAeOdeSHrw0nez7/70ltbc6von/zUFDAqblDPFJW29WcH5e1aBMFL8wzyCIHl28chLN7LGf9KWPR9/fSvTAJbHo63UKTzz/NeyLpuHLR2pi3vyKMauz2vY=;
X-UUID: 0fd6939327e645feb66b27e920c46168-20210903
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1915431275; Fri, 03 Sep 2021 00:20:01 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Sep 2021 00:15:31 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 3 Sep 2021 15:15:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Sep 2021 15:15:29 +0800
Message-ID: <ca5acabdae7b0a9c929c662c35dee10a88646f83.camel@mediatek.com>
Subject: Re: [PATCH v7 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
From: moudy ho <moudy.ho@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Maoguang Meng <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux Media Mailing
 List <linux-media@vger.kernel.org>, Devicetree List
 <devicetree@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>, "Nicolas
 Boichat" <drinkcat@chromium.org>, Alexandre Courbot <acourbot@chromium.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, <menghui.lin@mediatek.com>, Sj Huang
 <sj.huang@mediatek.com>, <ben.lok@mediatek.com>, Randy Wu
 <randy.wu@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>,
 Hsin-Yi Wang <hsinyi@google.com>
Date: Fri, 3 Sep 2021 15:15:29 +0800
In-Reply-To: <CAGXv+5GtDNwKpXEnont+UshVrSugQnTPyNF7VF3dVzTX9ruNdw@mail.gmail.com>
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
 <20210824100027.25989-4-moudy.ho@mediatek.com>
 <YSU0TrfFCsaI1TqV@robh.at.kernel.org>
 <0092244acd520acac81208b8863b15fba58f4193.camel@mediatek.com>
 <CAL_JsqJ_cProt35pdd2MjoHsSKtd+0n1Dwq6ooV+CJH5sfOFWg@mail.gmail.com>
 <39cec599a65eeb142cb7e729f954098a25652b2b.camel@mediatek.com>
 <CAGXv+5GtDNwKpXEnont+UshVrSugQnTPyNF7VF3dVzTX9ruNdw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_002006_517603_431A9456 
X-CRM114-Status: GOOD (  44.38  )
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

On Wed, 2021-09-01 at 18:16 +0800, Chen-Yu Tsai wrote:
> On Wed, Sep 1, 2021 at 5:04 PM moudy ho <moudy.ho@mediatek.com>
> wrote:
> > 
> > On Mon, 2021-08-30 at 10:05 -0500, Rob Herring wrote:
> > > On Mon, Aug 30, 2021 at 2:58 AM moudy ho <moudy.ho@mediatek.com>
> > > wrote:
> > > > 
> > > > On Tue, 2021-08-24 at 13:02 -0500, Rob Herring wrote:
> > > > > On Tue, Aug 24, 2021 at 06:00:25PM +0800, Moudy Ho wrote:
> > > > > > This patch adds DT binding document for Media Data Path 3
> > > > > > (MDP3)
> > > > > > a unit in multimedia system used for scaling and color
> > > > > > format
> > > > > > convert.
> > > > > > 
> > > > > > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > > > > > ---
> > > > > >  .../bindings/media/mediatek,mdp3-ccorr.yaml   |  57 +++++
> > > > > >  .../bindings/media/mediatek,mdp3-rdma.yaml    | 207
> > > > > > ++++++++++++++++++
> > > > > >  .../bindings/media/mediatek,mdp3-rsz.yaml     |  65 ++++++
> > > > > >  .../bindings/media/mediatek,mdp3-wdma.yaml    |  71 ++++++
> > > > > >  .../bindings/media/mediatek,mdp3-wrot.yaml    |  71 ++++++
> > > > > >  5 files changed, 471 insertions(+)
> > > > > >  create mode 100644
> > > > > > Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > > ccorr.yaml
> > > > > >  create mode 100644
> > > > > > Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > > rdma.yaml
> > > > > >  create mode 100644
> > > > > > Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > > rsz.yaml
> > > > > >  create mode 100644
> > > > > > Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > > wdma.yaml
> > > > > >  create mode 100644
> > > > > > Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > > wrot.yaml
> > > > > > 
> > > > > > diff --git
> > > > > > a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > > ccorr.yaml
> > > > > > b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > > ccorr.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..59fd68b46022
> > > > > > --- /dev/null
> > > > > > +++
> > > > > > b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > > > ccorr.yaml
> > > > > > @@ -0,0 +1,57 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id:
> > > > > > 
> > 
> > 
https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-ccorr.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXdgy3_VCQg8MdsJP7n8TlxbGyajipusfH8hi$
> > > > > > 
> > > > > > +$schema:
> > > > > > 
> > 
> > 
https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXdgy3_VCQg8MdsJP7n8TlxbGyajipi-OInix$
> > > > > > 
> > > > > > +
> > > > > > +title: Mediatek Media Data Path 3 CCORR Device Tree
> > > > > > Bindings
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Daoyuan Huang <daoyuan.huang@mediatek.com>
> > > > > > +  - Moudy Ho <moudy.ho@mediatek.com>
> > > > > > +
> > > > > > +description: |
> > > > > > +  One of Media Data Path 3 (MDP3) components used to do
> > > > > > color
> > > > > > correction with 3X3 matrix.
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    items:
> > > > > > +      - enum:
> > > > > > +        - mediatek,mt8183-mdp3-ccorr
> > > > > > +
> > > > > > +  mediatek,mdp3-id:
> > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > +    maxItems: 1
> > > > > > +    description: |
> > > > > > +      HW index to distinguish same functionality modules.
> > > > > 
> > > > > If we wanted h/w indexes in DT, we'd have a standard
> > > > > property.
> > > > > Why
> > > > > do
> > > > > you need this?
> > > > > 
> > > > 
> > > > I'm sorry not quite sure what HW indexes means (something like
> > > > aliases?)
> > > 
> > > It means whatever you said in your description.
> > > 
> > > And no, I'm not suggesting you use aliases.
> > 
> > Sorry for the inaccuracy described here, the comment i mentioned
> > before
> > should be "standard property" instead of "HW index".
> > 
> > > > It was originally used to mark multiple identical modules in
> > > > the
> > > > MDP
> > > > data path algorithm, so that appropriate paths can be
> > > > dynamically
> > > > dispatched.
> > > 
> > > If they are identical, then why do you need to distinguish them
> > > in
> > > DT?
> > > If there's some difference you need to know about such as
> > > connections
> > > to other blocks, then describe that. Another common example is
> > > needing
> > > to know what bits/registers to access in a syscon phandle. For
> > > that,
> > > make the register offset or bits be args to the phandle property.
> > > 
> > > Rob
> > 
> > Integrating the previous discussion, maybe I can revise the
> > description
> > to the following:
> >     description: |
> >       There may be multiple blocks with the same function but
> > different
> >       addresses in MDP3. In order to distinguish the connection
> > with
> >       other blocks, a unique ID is needed to dynamically use one or
> >       more identical blocks to implement multiple pipelines.
> 
> With display pipelines it is common to describe the pipeline with an
> OF
> graph. With the pipeline drawn out, you also get ways to derive
> identifiers
> for otherwise identical blocks, such as from port IDs.
> 
> See Documentation/devicetree/bindings/display/allwinner,sun4i-a10-
> display-engine.yaml
> and arch/arm/boot/dts/sun9i-a80.dtsi for such an example.
> 
> 
> ChenYu

From the MDP routing table defined in mt8183-mmsys.h
([v7,2/5] soc: mediatek: mmsys: Add support for MDP),
It can be seen that each component has its own independent
one-to-many mapping table, and its next-level receiver may
have its own multiple inputs and is difficult to briefly
describe these relationships.
 
In addition, due to hardware limitations, RSZ0 (for example)
cannot be completely regarded as RSZ1 in mmsys, and must be
regarded as an independent entity, an example mentioned
in line #67 from mtk-mdp3-cmdq.c
([v7,5/5] media: platform: mtk-mdp3: Add Mediatek MDP3 driver).

Moudy
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
