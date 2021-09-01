Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972D5C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 09:04:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B9166103D
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 09:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B9166103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Inbeu9+CwZnaBLb6AqufPV32YamkirLIUNRiN8Ouw80=; b=whoshpifJnxnIx
	Q2kcFJoaUJK0+MtE057Frrwu2YnMppnxMLlsApXTaiPWbswaLpCjYvSWRa8AmJKSMwaw8gNzgChKe
	eY6jUmsFr+MuDJ6a+dxmLpcwiYUnPQ2jLqchD+7MSVbHITAPV3g87EbZmm5rvNzuG0daQcMlbqJn0
	aFl/9jRLnDeraB+NtCOWDBxQvBf9/oAyZohphaI1+dWb87Pwmh4aTAgi4I25ABxENoWYcnEgyiF8D
	2QQyoNTZPSvO1NwFVumetYheKCM5vrxp9oM6hSx2/MSpdYZWMYopZkK2eTOtblWWfvSVfmFgN9/l1
	abMHzjv49w2x7nB4UlgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLMAH-004kCj-RB; Wed, 01 Sep 2021 09:04:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLLXw-004YdI-9U; Wed, 01 Sep 2021 08:24:41 +0000
X-UUID: bb8ba6a60ecc4acea362f00ef8eac3d8-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aQczDb7Ur1z09Hhq0WSHuu1d90/3MPLqR+HcJ6VmReA=; 
 b=A4a0zlhw01WiPT0kd/kac98k5OHeQr006UWgyCM+vtOaOUTHkaiXsnGIfb1KfyMYv0UN7rMeNGq81/VhW0WaNzx6Vvo0+Ln7jvnWWFvm4asobMRdmhmi+y/99QJzxiIBhZ8L5NS3uIEfbZFnk6z2feZd8gWma87Q1m8u+X35yn0=;
X-UUID: bb8ba6a60ecc4acea362f00ef8eac3d8-20210901
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1847210691; Wed, 01 Sep 2021 01:24:33 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 01:14:31 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 16:14:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 16:14:30 +0800
Message-ID: <39cec599a65eeb142cb7e729f954098a25652b2b.camel@mediatek.com>
Subject: Re: [PATCH v7 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
From: moudy ho <moudy.ho@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Jernej
 Skrabec" <jernej.skrabec@siol.net>, Maoguang Meng
 <maoguang.meng@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>, "Nicolas
 Boichat" <drinkcat@chromium.org>, Alexandre Courbot <acourbot@chromium.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, <menghui.lin@mediatek.com>, Sj Huang
 <sj.huang@mediatek.com>, <ben.lok@mediatek.com>, <randy.wu@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, Hsin-Yi Wang
 <hsinyi@google.com>
Date: Wed, 1 Sep 2021 16:14:30 +0800
In-Reply-To: <CAL_JsqJ_cProt35pdd2MjoHsSKtd+0n1Dwq6ooV+CJH5sfOFWg@mail.gmail.com>
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
 <20210824100027.25989-4-moudy.ho@mediatek.com>
 <YSU0TrfFCsaI1TqV@robh.at.kernel.org>
 <0092244acd520acac81208b8863b15fba58f4193.camel@mediatek.com>
 <CAL_JsqJ_cProt35pdd2MjoHsSKtd+0n1Dwq6ooV+CJH5sfOFWg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_012436_384331_35CDB958 
X-CRM114-Status: GOOD (  34.41  )
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

On Mon, 2021-08-30 at 10:05 -0500, Rob Herring wrote:
> On Mon, Aug 30, 2021 at 2:58 AM moudy ho <moudy.ho@mediatek.com>
> wrote:
> > 
> > On Tue, 2021-08-24 at 13:02 -0500, Rob Herring wrote:
> > > On Tue, Aug 24, 2021 at 06:00:25PM +0800, Moudy Ho wrote:
> > > > This patch adds DT binding document for Media Data Path 3
> > > > (MDP3)
> > > > a unit in multimedia system used for scaling and color format
> > > > convert.
> > > > 
> > > > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > > > ---
> > > >  .../bindings/media/mediatek,mdp3-ccorr.yaml   |  57 +++++
> > > >  .../bindings/media/mediatek,mdp3-rdma.yaml    | 207
> > > > ++++++++++++++++++
> > > >  .../bindings/media/mediatek,mdp3-rsz.yaml     |  65 ++++++
> > > >  .../bindings/media/mediatek,mdp3-wdma.yaml    |  71 ++++++
> > > >  .../bindings/media/mediatek,mdp3-wrot.yaml    |  71 ++++++
> > > >  5 files changed, 471 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > ccorr.yaml
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > ccorr.yaml
> > > > b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > ccorr.yaml
> > > > new file mode 100644
> > > > index 000000000000..59fd68b46022
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > > > ccorr.yaml
> > > > @@ -0,0 +1,57 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id:
> > > > 
https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-ccorr.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXdgy3_VCQg8MdsJP7n8TlxbGyajipusfH8hi$
> > > > 
> > > > +$schema:
> > > > 
https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!1C0ChLqzi7Zq8D2d4_S4IqCEei4GXdgy3_VCQg8MdsJP7n8TlxbGyajipi-OInix$
> > > > 
> > > > +
> > > > +title: Mediatek Media Data Path 3 CCORR Device Tree Bindings
> > > > +
> > > > +maintainers:
> > > > +  - Daoyuan Huang <daoyuan.huang@mediatek.com>
> > > > +  - Moudy Ho <moudy.ho@mediatek.com>
> > > > +
> > > > +description: |
> > > > +  One of Media Data Path 3 (MDP3) components used to do color
> > > > correction with 3X3 matrix.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - enum:
> > > > +        - mediatek,mt8183-mdp3-ccorr
> > > > +
> > > > +  mediatek,mdp3-id:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    maxItems: 1
> > > > +    description: |
> > > > +      HW index to distinguish same functionality modules.
> > > 
> > > If we wanted h/w indexes in DT, we'd have a standard property.
> > > Why
> > > do
> > > you need this?
> > > 
> > 
> > I'm sorry not quite sure what HW indexes means (something like
> > aliases?)
> 
> It means whatever you said in your description.
> 
> And no, I'm not suggesting you use aliases.

Sorry for the inaccuracy described here, the comment i mentioned before
should be "standard property" instead of "HW index".

> > It was originally used to mark multiple identical modules in the
> > MDP
> > data path algorithm, so that appropriate paths can be dynamically
> > dispatched.
> 
> If they are identical, then why do you need to distinguish them in
> DT?
> If there's some difference you need to know about such as connections
> to other blocks, then describe that. Another common example is
> needing
> to know what bits/registers to access in a syscon phandle. For that,
> make the register offset or bits be args to the phandle property.  
>  
> Rob

Integrating the previous discussion, maybe I can revise the description
to the following:
    description: |
      There may be multiple blocks with the same function but different
      addresses in MDP3. In order to distinguish the connection with
      other blocks, a unique ID is needed to dynamically use one or
      more identical blocks to implement multiple pipelines.

Moudy
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
