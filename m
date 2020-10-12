Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E8FC433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 17:08:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E166A20838
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 17:08:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O/wkpxr8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l33ti6Wh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E166A20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dnfxlLGFzPdqMtZWCTTPRDnH6PlmMZmom584Z3jQItA=; b=O/wkpxr878e+LyKZWnrJM6osM
	Gr132BFOp3TKUZ7a8Y1pIFKXwWVeHsBRu9sjTfNblGTv3gPQRA9QGSfpKmP9H6mQsgosX+hXNVl31
	QH75pA7ZM3ns1IcmmBaEKTYAMFRYRBB41JFAoHyLzoXHHdUJIufWtyp2zitP86+KXSb2IRlqKvmh+
	WiiqUO/rkQalvD4CuwQkRjhfxa8/DtEwhNgf0aY6cONXod/6rSzx8dctNod7zPLu/i8BlPUQ82IWf
	O25jPMKGIZG61S42jvZCK3YuFGiBQYeDOQ66kP8NjW/oIy+/b+wcdEfg2icHEG589DyYcODbKppIT
	tbDjSDglA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kS1JK-0003bR-GI; Mon, 12 Oct 2020 17:08:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS1JB-0003W8-OK; Mon, 12 Oct 2020 17:08:26 +0000
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0126214DB;
 Mon, 12 Oct 2020 17:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602522504;
 bh=diu7jTvqirdea73U2Pivn25Z5fqp8dxACmIMHPhvbwQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l33ti6Wh+Yoy28eOWfBvJIGFVVsEGuoGcfMEc1rp3LXWY2i1AsPCJKFJ6JTa8n2Ej
 zXnu25cLJRfBDN2Hu9c0VAgD8B97+fz2FO6Sr1e/x+F5NBsYByZbFD/O5LeYIT97kb
 7C9jn70SgLa9QD/DQPLf+JcrmnMyxCXFsstt94M4=
Received: by mail-ed1-f42.google.com with SMTP id l24so17796823edj.8;
 Mon, 12 Oct 2020 10:08:23 -0700 (PDT)
X-Gm-Message-State: AOAM530oq3Ahw7bD78NbjGxv5SP5bwen5NY/p3PQCsmoEc7ylM2nTh0/
 3KXjyY/mlOso/jvI9ZBvVl5CjdiTxSTPz8niKeY=
X-Google-Smtp-Source: ABdhPJznFFkxxdcO9CFLA1y4py80sWN1jeeBhSeZnTVvSdAbSWX+EHDk5exEBJ+K31o8PGsm86EFdFdTJq7JbVnnqqk=
X-Received: by 2002:aa7:c643:: with SMTP id z3mr13042703edr.104.1602522502225; 
 Mon, 12 Oct 2020 10:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-2-yong.wu@mediatek.com>
 <20201002110709.GC6888@pi3> <1601958415.26323.25.camel@mhfsdcap03>
In-Reply-To: <1601958415.26323.25.camel@mhfsdcap03>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 12 Oct 2020 19:08:09 +0200
X-Gmail-Original-Message-ID: <CAJKOXPedQdOYque5igJ0_v_-_0L4S+NW6puUw-kWc+zWM96i_Q@mail.gmail.com>
Message-ID: <CAJKOXPedQdOYque5igJ0_v_-_0L4S+NW6puUw-kWc+zWM96i_Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/24] dt-bindings: iommu: mediatek: Convert IOMMU to
 DT schema
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_130825_919643_CEF603A1 
X-CRM114-Status: GOOD (  22.20  )
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
 kernel-team@android.com, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 6 Oct 2020 at 06:27, Yong Wu <yong.wu@mediatek.com> wrote:
>
> On Fri, 2020-10-02 at 13:07 +0200, Krzysztof Kozlowski wrote:
> > On Wed, Sep 30, 2020 at 03:06:24PM +0800, Yong Wu wrote:
> > > Convert MediaTek IOMMU to DT schema.
> > >
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > ---
> > >  .../bindings/iommu/mediatek,iommu.txt         | 103 ------------
> > >  .../bindings/iommu/mediatek,iommu.yaml        | 154 ++++++++++++++++++
> > >  2 files changed, 154 insertions(+), 103 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > >  create mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> > >
>
> [...]
>
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - enum:
> > > +          - mediatek,mt2701-m4u # mt2701 generation one HW
> > > +          - mediatek,mt2712-m4u # mt2712 generation two HW
> > > +          - mediatek,mt6779-m4u # mt6779 generation two HW
> > > +          - mediatek,mt8173-m4u # mt8173 generation two HW
> > > +          - mediatek,mt8183-m4u # mt8183 generation two HW
> > > +
> > > +      - description: mt7623 generation one HW
> > > +        items:
> > > +          - const: mediatek,mt7623-m4u
> > > +          - const: mediatek,mt2701-m4u
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    description: |
> > > +      bclk is optional. here is the list which require this bclk:
> > > +      mt2701, mt2712, mt7623 and mt8173.
> >
> > Similarly to my comment in other patch, this should be part of schema
> > within 'if-then'.
>
> Thanks for the review.
>
> I will change like this:
>
> =============
>   clocks:
>     items:
>       - description: bclk is the block clock.
>
>   clock-names:
>     items:
>       - const: bclk
>
> required:
>   - compatible
>   - reg
>   - interrupts
>   - mediatek,larbs
>   - '#iommu-cells'
> if:
>   properties:
>     compatible:
>       contains:
>         enum:
>           - mediatek,mt2701-m4u
>           - mediatek,mt2712-m4u
>           - mediatek,mt8173-m4u
>
> then:
>  required:
>    - clocks
> ==============
>
> If this is not right, please tell me.
> (dt_binding_check is ok.)

Looks fine, except "if" should be part of some "allOf" block.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
