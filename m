Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074F8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 04:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Af0rXBjy4btjtAq0+mjwMMwgSlm1/EPt2q3PIpU7I8=; b=gblHP6UJPGkXC9
	NFw/fDRyQowson9nrknIk2FtAlfF0BBY24HnbCnxIxkU85ws95zQ0nMZsOzS2VoDD/d1XdTVUqbYF
	jW+or8jE4AnJJZQxpe1XLCtmvVOdd00yzDRDTOahScxAa4qyhHDN+6cOtP2BXoM+AZ0xXmqtxnJeu
	5CLQwc5YYggXvIlRv/xmFJiDBZyZQPkvX3e/ZzALgiDHmJp/CBB2Pup0sBy875ZCloBY8ReHA+T5l
	QXzBq8J6wza7pOfO8NiHUoIOPWm/hLZcnJygGSAtbY/LsyesN/JZAhiKEeAwE1gd7iiduaxD3XSG6
	xev4n3pqpbm2dbiyJi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkHxb-009VH5-0b; Fri, 29 Apr 2022 04:10:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkHxX-009VGT-RA; Fri, 29 Apr 2022 04:10:25 +0000
X-UUID: 8a914610f1164908ae7f0ae6551ed89d-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:4ae16dfb-5fa3-4364-82a1-c50f8f79ce38, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:97a5202f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 8a914610f1164908ae7f0ae6551ed89d-20220428
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 7687923; Thu, 28 Apr 2022 21:10:16 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 21:10:14 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 12:10:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 12:10:13 +0800
Message-ID: <60338c26047f47c77fdc7d4eff6a7dee43853e1b.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: arm: mediatek: mmsys: refine power and gce
 properties
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Fabien Parent <fparent@baylibre.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 29 Apr 2022 12:10:13 +0800
In-Reply-To: <b7bb228f-751c-e7ad-a695-3dc40d889a72@linaro.org>
References: <20220428012715.2619-1-jason-jh.lin@mediatek.com>
 <b7bb228f-751c-e7ad-a695-3dc40d889a72@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_211023_964950_2F894C71 
X-CRM114-Status: GOOD (  31.02  )
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

Hi Krzysztof,

Thanks for the reviews.

On Thu, 2022-04-28 at 09:16 +0200, Krzysztof Kozlowski wrote:
> On 28/04/2022 03:27, jason-jh.lin wrote:
> > From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> > 
> > Power:
> >   Refine description and add item number for power-domains
> > property.
> > 
> > GCE:
> >   Refine description and add item number for mboxes property and
> >   mediatek,gce-client-reg property.
> > 
> > Fixes: 1da90b8a7bae ("dt-bindings: arm: mediatek: mmsys: add power
> > and gce properties")
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > ---
> >  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 29 +++++++++----
> > ------
> >  1 file changed, 14 insertions(+), 15 deletions(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > index 6ad023eec193..6722f1b724ef 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > l
> > @@ -43,28 +43,27 @@ properties:
> >      maxItems: 1
> >  
> >    power-domains:
> > +    maxItems: 1
> >      description:
> > -      A phandle and PM domain specifier as defined by bindings
> > -      of the power controller specified by phandle. See
> > -      Documentation/devicetree/bindings/power/power-domain.yaml
> > for details.
> > +      Each mmsys belongs to a power-domains. If mmsys wants to use
> > PM
> > +      interface to control the power controller of mmsys, it
> > should have
> > +      this property.
> >  
> >    mboxes:
> > +    minItems: 1
> 
> maxItems, surely you cannot have infinite number of mailboxes to talk
> with?

Yes, we cannot have infinite number for this, but we can use not only
one mbox channel for one mmsys.

Its maximum number is equal to GCE HW thread number.
The maximum number in mt8195 is 24 and mt8173 is 16.

But we currently using 1.
So I'm not sure if I need to set the maxItems for this?

> 
> >      description:
> > -      Using mailbox to communicate with GCE, it should have this
> > -      property and list of phandle, mailbox specifiers. See
> > -      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for
> > details.
> > -    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +      If using mailbox to communicate with GCE, it should have
> > this
> > +      property. GCE will help configure the hardware settings for
> > the
> > +      current mmsys data pipeline.
> >  
> >    mediatek,gce-client-reg:
> > -    description:
> > -      The register of client driver can be configured by gce with
> > 4 arguments
> > -      defined in this property, such as phandle of gce, subsys id,
> > -      register offset and size.
> > -      Each subsys id is mapping to a base address of display
> > function blocks
> > -      register which is defined in the gce header
> > -      include/dt-bindings/gce/<chip>-gce.h.
> > -    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Why removing ref? Does your binding work after such change?

I removed it unexpectedly, I'll add it back.
> 
> >      maxItems: 1
> > +    items:
> > +      - items:
> > +          - description: phandle to GCE
> > +          - description: subsys id
> > +          - description: register offset
> > +          - description: register size
> >  
> >    "#clock-cells":
> >      const: 1
> 
> 
> Best regards,
> Krzysztof

Regards,
Jason-JH.Lin
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
