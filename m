Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE59C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 11:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIQYzERZuoai3S+56g+PCO0eH9AcNEE3QItVvT9Fk4U=; b=ApJBSusIvJNXgs
	zQWjF1NniUeFGiC2yZEOnErJuSxXJ81Gu79wnL/3vSfBcm7vKOHwdsMlEbpdQ4OnqJgI4NDsOm2Wv
	t0PghgTAfLJ9smexbUi1k2b9kOxZ7KJl3lcLkTcbtwkewQJXmKZNuE6Rp+yfRyVV7XIqLrEEbnTpp
	I+cPKVBsIutV+Y0SRUWUATEZK6D5FK50EtWfjbWe/3wRYRCxTwWreYSXx7+E0j1BuiQKn5JBtjfJv
	hbNRs6Izc7sEbmbj3S31ubjkQeSsLqZkLzzNolZq9pRBJNNrN1e/raZ0j3hVj7Q27xb2FC9ng6T1R
	3R5JPeDWDLI/K3xK9pWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmDW2-00AZ3r-7y; Wed, 04 May 2022 11:49:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmDVa-00AYtG-I9; Wed, 04 May 2022 11:49:32 +0000
X-UUID: 9190b6a0fe724a0a85f9fb55dd12b6ad-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:90f2d9fd-71c5-4eb2-9ff6-40dab7d1d428, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:1fc58ab2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 9190b6a0fe724a0a85f9fb55dd12b6ad-20220504
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 915605098; Wed, 04 May 2022 04:49:24 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 04:49:22 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 19:49:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 4 May 2022 19:49:21 +0800
Message-ID: <7189b0c0c62fe8a8026d2e25e741a29b2f5b01a9.camel@mediatek.com>
Subject: Re: [PATCH v14 1/3] dt-binding: mediatek: add bindings for MediaTek
 MDP3 components
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 4 May 2022 19:49:21 +0800
In-Reply-To: <YnFqnEI16B+xrxdQ@robh.at.kernel.org>
References: <20220427070514.10355-1-moudy.ho@mediatek.com>
 <20220427070514.10355-2-moudy.ho@mediatek.com>
 <YnFqnEI16B+xrxdQ@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_044930_696746_87D581C2 
X-CRM114-Status: GOOD (  29.61  )
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

On Tue, 2022-05-03 at 12:47 -0500, Rob Herring wrote:
> On Wed, Apr 27, 2022 at 03:05:12PM +0800, Moudy Ho wrote:
> > This patch adds DT binding documents for Media Data Path 3 (MDP3)
> > a unit in multimedia system combined with several components and
> > used for scaling and color format convert.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >  .../bindings/media/mediatek,mdp3-rdma.yaml    | 82
> > +++++++++++++++++++
> >  .../bindings/media/mediatek,mdp3-rsz.yaml     | 61 ++++++++++++++
> >  .../bindings/media/mediatek,mdp3-wrot.yaml    | 66 +++++++++++++++
> >  .../bindings/soc/mediatek/mediatek,ccorr.yaml | 54 ++++++++++++
> >  .../bindings/soc/mediatek/mediatek,wdma.yaml  | 67 +++++++++++++++
> >  5 files changed, 330 insertions(+)
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
> > index 000000000000..ce24eda14cb6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> > rdma.yaml
> > @@ -0,0 +1,82 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml*__;Iw!!CTRNKA9wMg0ARbw!zzzJB6GFgAbOaMvOMeEANc2UnatoXvcdzZ3UGx6024oxx1okemuH9vCeCSpaGUuD8dSrlYueRf2HFVdfFu6CVB7LUQ$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!zzzJB6GFgAbOaMvOMeEANc2UnatoXvcdzZ3UGx6024oxx1okemuH9vCeCSpaGUuD8dSrlYueRf2HFVdfFu5BwY-loQ$
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
> > +    maxItems: 1
> 
> Like your other patches this needs 'items' describing each cell.
> 
> > +    description: |
> > +      The register of client driver can be configured by gce with
> > +      4 arguments defined in this property, such as phandle of
> > gce, subsys id,
> > +      register offset and size. Each GCE subsys id is mapping to a
> > client
> > +      defined in the header include/dt-bindings/gce/<chip>-gce.h.
> 
> Other than other cases of this property, the rest looks fine.
> 
> Rob

Hello Rob,

Thanks for your review and reminder.

Moudy's mail is still not received by devicetree@vger.kernel.org.
We are still under checking this issue.
To prevent you do not receive his response, I help Moudy to mail you
again.

Moudy will sync the description from the patch listed below to this
property and extend to other yaml files in this series.


https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220427064425.30383-5-moudy.ho@mediatek.com/

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
