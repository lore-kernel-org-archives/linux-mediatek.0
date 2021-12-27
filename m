Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323A1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 08:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MK2qMhwfzwN4PzhCbbd5K6V+TIvixGnMFBj2vs+/+rQ=; b=Ndmwa/z4Yk08mW
	lJ/EsjsBoxu4vHrrI+HXeT/Dj3AUvO8X9UpmYt1i7KkYKMnRq9ofThmGHfhkTWGhUKmv8OqeE9aC4
	0HvPzwPG4QExhV7/7tlerFDGMKMp9MIygJizVajN7COWvQumNgP+MMkxEiPV7+nTatIelmiuMBnWg
	aRxWX01qx1m7q82Fi+o1Pw4xYuz5qxAg+kUFm5mYK2LqlmTRLNvftPs5Z1EjugWoRTKsVpLMVQRqs
	/bQG2ncdUsl+1lHgpjQVvzCMBr5r4xL3AtJH+Swwy6IJvYa+BDMeY82cGypCC9hZ/ZNsPbCCyHGCz
	T7iYDGVYqBDY9VYWVrIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1lLB-00GMbW-AM; Mon, 27 Dec 2021 08:26:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1lL5-00GMaj-3N; Mon, 27 Dec 2021 08:26:43 +0000
X-UUID: cbfa46082bb14c708f1b6373e80d6dad-20211227
X-UUID: cbfa46082bb14c708f1b6373e80d6dad-20211227
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2130907486; Mon, 27 Dec 2021 01:26:35 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Dec 2021 00:26:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 27 Dec 2021 16:26:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Dec 2021 16:26:31 +0800
Message-ID: <b13233262aed45d57984a542dcd3b9b56ff78d5c.camel@mediatek.com>
Subject: Re: [PATCH v10 1/3] dt-binding: mt8183: add Mediatek MDP3 dt-bindings
From: moudy ho <moudy.ho@mediatek.com>
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
 <srv_heupstream@mediatek.com>
Date: Mon, 27 Dec 2021 16:26:31 +0800
In-Reply-To: <YbOZsd+zNmwOpB4x@robh.at.kernel.org>
References: <20211202062733.20338-1-moudy.ho@mediatek.com>
 <20211202062733.20338-2-moudy.ho@mediatek.com>
 <YbOZsd+zNmwOpB4x@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_002639_192439_66273B71 
X-CRM114-Status: GOOD (  32.15  )
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

On Fri, 2021-12-10 at 12:17 -0600, Rob Herring wrote:
> On Thu, Dec 02, 2021 at 02:27:31PM +0800, Moudy Ho wrote:
> > This patch adds DT binding document for Media Data Path 3 (MDP3)
> > a unit in multimedia system used for scaling and color format
> > convert.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >  .../bindings/media/mediatek,mdp3-rsz.yaml     |  65 ++++++
> >  .../bindings/media/mediatek,mdp3-wrot.yaml    |  67 ++++++
> >  .../bindings/soc/mediatek/mediatek,ccorr.yaml |  57 +++++
> >  .../bindings/soc/mediatek/mediatek,rdma.yaml  | 216
> > ++++++++++++++++++
> >  .../bindings/soc/mediatek/mediatek,wdma.yaml  |  68 ++++++
> >  5 files changed, 473 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,rdma.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
> 
> I'm not a fan of bindings/soc/ either. Put everything in 
> bindings/media/. What's the difference between these blocks here and 
> the version used for display? If they are the same h/w, then the
> binding 
> needs to be the same. How they get used is the kernel's problem. 
> 
> It looks like the display ccorr, rdma, and wdma aren't documented.
> Fix 
> that before you add new stuff.
> 
> 

Hi Rob,

The bindings about display components were introduced by the other
patch listed below:

https://patchwork.kernel.org/project/linux-mediatek/patch/20211129184439.16892-4-jason-jh.lin@mediatek.com/
I'll add the bindings shared with display in the commit message, such
as ccorr and wdma but rdma has slight different.

> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rsz.yaml
> > new file mode 100644
> > index 000000000000..d7f104a0f165
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rsz.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml*__;Iw!!CTRNKA9wMg0ARbw!2EXFPaNlBbwXl4J4iyU18dX2N2UFR-c1E8Eo_tPF-FSoFNwhTh0bJynYCcta3KDP$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!2EXFPaNlBbwXl4J4iyU18dX2N2UFR-c1E8Eo_tPF-FSoFNwhTh0bJynYCTPZYiHy$
> >  
> > +
> > +title: Mediatek Resizer
> > +
> > +maintainers:
> > +  - Matthias Brugger <matthias.bgg@gmail.com>
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
> > +  mediatek,mdp3-id:
> > +    description: There may be multiple components with the same
> > function but
> > +      different addresses in MDP3. The MDP3 driver can select one
> > or zero of
> > +      them and connect other components in series according to the
> > current
> > +      application to form one or more data paths. This property
> > indicate the
> > +      selection order of the same components.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1, 2, 3]
> 
> Again, an index nor an alias is the right approach for this. Use DT 
> graph like others do. 'It's too complicated' is not a reason unless
> you 
> show how and why it won't work.
> 
> Rob

Perhaps, I can rename the compatible, for example from
"mediatek,mt8183-mdp3-rsz" to "mediatek,mdp3-rsz0" & "mediatek,mdp3-
rsz1", and handle this in driver, so another similar attribute
"mediatek,mdp3-comp-ids" can be removed too.
On the other hand, it can maintain flexibility when adding other chip
settings.

Thanks & Regards,
Moudy Ho



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
