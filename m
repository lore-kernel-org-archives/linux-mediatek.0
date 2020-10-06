Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BEFC41604
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 04:27:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 922F420757
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 04:27:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qitfaarW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LlgiulCH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 922F420757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sRCXmtHhB30Ri4mmVT93sjGXVGNxz4bNfWYUoczqWRg=; b=qitfaarWPYHJi7jObb+xBsCpG
	VID4m7i2GTwHSP8NXZ0U9TKFjyowqPdoBVxzL7Yw/CLe5QsqEb/T62tGxixNof9H+d6zTJhFdJ6Rc
	qstzC9I15y/zSHzE8BK+z2ebJ9xORJUXlYngnrw2jdwacv3ng4KyP+E0PLucro196TT6GTDIPhIkO
	DtmzYpCozNnmdPx3A4L6nragLGKgbRgI2lSifOkfhT9DbUxMfTV4aPRylsli8hV0cOiEl5YSr+CWx
	uRoqFtUYNXTcImmFQ8s36GogR0meK3fITo/F2iYrQVyRntfb3yr5YCiCBYWckq7pfNFoRwzPK3TSe
	mnqtivAxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPeZI-0006Cm-9F; Tue, 06 Oct 2020 04:27:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPeZB-000698-Uu; Tue, 06 Oct 2020 04:27:12 +0000
X-UUID: f4156641e2af46b49d24e11a9f66c186-20201005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+pxD8I7KLNWeEZpM4bXar+ZxPMehQGOOhOWN3s3N3JU=; 
 b=LlgiulCH1vbtlqMqPKGj7lJV74EHGO8snpFZzj3MRv3r4yE3EjpwYuBsjimEZCZyDYVruQNOrG5ZO9ptSqm2ktrIDpIK2Duk9SUh45UuYdR14L8w10VROUMxGcMcm+QXgc58zJndND/q7NGk66clOiDBmXpJEcbrPWTPPvjlMuI=;
X-UUID: f4156641e2af46b49d24e11a9f66c186-20201005
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 322720852; Mon, 05 Oct 2020 20:27:00 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Oct 2020 21:26:59 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 6 Oct 2020 12:26:55 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Oct 2020 12:26:54 +0800
Message-ID: <1601958415.26323.25.camel@mhfsdcap03>
Subject: Re: [PATCH v3 01/24] dt-bindings: iommu: mediatek: Convert IOMMU to
 DT schema
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 6 Oct 2020 12:26:55 +0800
In-Reply-To: <20201002110709.GC6888@pi3>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-2-yong.wu@mediatek.com> <20201002110709.GC6888@pi3>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9A9DF6700EE416CA650EB803451E471F73CB22B3E312AC0B29EBEE4AED21DE852000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_002710_155289_1032EE99 
X-CRM114-Status: GOOD (  17.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 kernel-team@android.com, Nicolas
 Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Greg Kroah-Hartman <gregkh@google.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will
 Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-02 at 13:07 +0200, Krzysztof Kozlowski wrote:
> On Wed, Sep 30, 2020 at 03:06:24PM +0800, Yong Wu wrote:
> > Convert MediaTek IOMMU to DT schema.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  .../bindings/iommu/mediatek,iommu.txt         | 103 ------------
> >  .../bindings/iommu/mediatek,iommu.yaml        | 154 ++++++++++++++++++
> >  2 files changed, 154 insertions(+), 103 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> >  create mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > 

[...]

> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - mediatek,mt2701-m4u # mt2701 generation one HW
> > +          - mediatek,mt2712-m4u # mt2712 generation two HW
> > +          - mediatek,mt6779-m4u # mt6779 generation two HW
> > +          - mediatek,mt8173-m4u # mt8173 generation two HW
> > +          - mediatek,mt8183-m4u # mt8183 generation two HW
> > +
> > +      - description: mt7623 generation one HW
> > +        items:
> > +          - const: mediatek,mt7623-m4u
> > +          - const: mediatek,mt2701-m4u
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description: |
> > +      bclk is optional. here is the list which require this bclk:
> > +      mt2701, mt2712, mt7623 and mt8173.
> 
> Similarly to my comment in other patch, this should be part of schema
> within 'if-then'.

Thanks for the review.

I will change like this:

=============
  clocks:
    items:
      - description: bclk is the block clock.

  clock-names:
    items:
      - const: bclk

required:
  - compatible
  - reg
  - interrupts
  - mediatek,larbs
  - '#iommu-cells'
if:
  properties:
    compatible:
      contains:
        enum:
          - mediatek,mt2701-m4u
          - mediatek,mt2712-m4u
          - mediatek,mt8173-m4u

then:
 required:
   - clocks
==============

If this is not right, please tell me.
(dt_binding_check is ok.)

> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
