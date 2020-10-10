Return-Path: <SRS0=AZ7y=DR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEC5C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 06:18:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 654FC20731
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 06:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VGhqD7Wz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tTX5WoQW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 654FC20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k8MM2iwOYk5rvmXoV9xFxV66veBVsZJK0YMgFzbsg9g=; b=VGhqD7Wz2IUi0u5B/P/Z7Vvlu
	Kw/lLX660VjBYT1vDK0ZUyCDzdMuEthSAylFHHbmWEueIi8N6OpCeZXJfNtKP9hw8RioezGnU+rUD
	gBsUV5lcdX4cgS7+NJem2gMLxFmxuszNF3XgtL2ayFlOW8MPGj5m5CN2qibNwRK17DwwY+/GzTS9B
	HQBvDmo8+O7xQKXfhIxYX27eWb5p4USDAqdX9sYhe/vrKAUWrQYgtxkNJQguOPy7u01taDF4qXmeo
	rZiZHy7MubXVf6faiveWyLhyPU3MJwOvRADMwgLvJkq/MXiTRC9C1ZYL5NszJRtXLLK8CieCY9DLC
	+p8BFsBTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kR8DA-0006dt-Sr; Sat, 10 Oct 2020 06:18:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kR8D6-0006dR-Dj; Sat, 10 Oct 2020 06:18:30 +0000
X-UUID: a2090c63322d4a7fba7010c715d85acd-20201009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=61F5Tl8G56sPcS7KsAwbgCO83qs6Yq3c4B1Tn8qYWKc=; 
 b=tTX5WoQWKTWgrH9qVB4rbXuhNoS74yy7+7kV1Iurkbfs/2wEs+iSylm4pbHANRoDIrHeJ0Yy8V/2wzWJgDa2kX6ITumCJBZZRh8NnDrl8mbXebIBXoGUEgdFAREcGT5si3+gE3cUF1P5YIGpcKfL7i49vTZYtBVdk/2/z/R5EQk=;
X-UUID: a2090c63322d4a7fba7010c715d85acd-20201009
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 516722907; Fri, 09 Oct 2020 22:18:16 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Oct 2020 23:18:14 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 10 Oct 2020 14:18:09 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Oct 2020 14:18:08 +0800
Message-ID: <1602310691.26323.39.camel@mhfsdcap03>
Subject: Re: [PATCH v3 02/24] dt-bindings: memory: mediatek: Convert SMI to
 DT schema
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sat, 10 Oct 2020 14:18:11 +0800
In-Reply-To: <CAJKOXPfOOGnJeNCa58WEZqbzaAFdLHSm-7pyMyGkYgCBEt0+RA@mail.gmail.com>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-3-yong.wu@mediatek.com> <20201002110831.GD6888@pi3>
 <1601958428.26323.26.camel@mhfsdcap03>
 <CAJKOXPfOOGnJeNCa58WEZqbzaAFdLHSm-7pyMyGkYgCBEt0+RA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2F5B50D45BFEE5DEAF980977B4B60D0C1CC732DEAB64F85D93BF6AB7D84D9C0F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_021828_665211_20FCB263 
X-CRM114-Status: GOOD (  27.59  )
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
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com, Will
 Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-10-06 at 09:15 +0200, Krzysztof Kozlowski wrote:
> On Tue, 6 Oct 2020 at 06:27, Yong Wu <yong.wu@mediatek.com> wrote:
> >
> > On Fri, 2020-10-02 at 13:08 +0200, Krzysztof Kozlowski wrote:
> > > On Wed, Sep 30, 2020 at 03:06:25PM +0800, Yong Wu wrote:
> > > > Convert MediaTek SMI to DT schema.
> > > >
> > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > ---
> > > >  .../mediatek,smi-common.txt                   |  49 ---------
> > > >  .../mediatek,smi-common.yaml                  | 100 ++++++++++++++++++
> > > >  .../memory-controllers/mediatek,smi-larb.txt  |  49 ---------
> > > >  .../memory-controllers/mediatek,smi-larb.yaml |  91 ++++++++++++++++
> > > >  4 files changed, 191 insertions(+), 98 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> > > >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> > ...
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - enum:
> > > > +          - mediatek,mt2701-smi-common
> > > > +          - mediatek,mt2712-smi-common
> > > > +          - mediatek,mt6779-smi-common
> > > > +          - mediatek,mt8173-smi-common
> > > > +          - mediatek,mt8183-smi-common
> > > > +
> > > > +      - description: for mt7623
> > > > +        items:
> > > > +          - const: mediatek,mt7623-smi-common
> > > > +          - const: mediatek,mt2701-smi-common
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    description: |
> > > > +      apb and smi are mandatory. the async is only for generation 1 smi HW.
> > > > +      gals(global async local sync) also is optional, here is the list which
> > > > +      require gals: mt6779 and mt8183.
> > > > +    minItems: 2
> > > > +    maxItems: 4
> > > > +    items:
> > > > +      - description: apb is Advanced Peripheral Bus clock, It's the clock for
> > > > +          setting the register.
> > > > +      - description: smi is the clock for transfer data and command.
> > > > +      - description: async is asynchronous clock, it help transform the smi clock
> > > > +          into the emi clock domain.
> > > > +      - description: gals0 is the path0 clock of gals.
> > > > +      - description: gals1 is the path1 clock of gals.
> > > > +
> > > > +  clock-names:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - const: apb
> > > > +          - const: smi
> > > > +      - items:
> > > > +          - const: apb
> > > > +          - const: smi
> > > > +          - const: async
> > > > +      - items:
> > > > +          - const: apb
> > > > +          - const: smi
> > > > +          - const: gals0
> > > > +          - const: gals1
> > >
> > > Similarly to my comment to other properties, this requirement per
> > > compatible should be part of the schema within 'if-then'.
> >
> > I'm not so familiar with this format. Do this has "if-then-'else
> > if'-then-else"?
> 
> These are mutually exclusive conditions, so you can skip else:
>  - if-then
>  - if-then
>  - if-then
> It will be more readable then stacking 'if' under 'else'

Thanks. I will use something like this:

 anyOf:
   - if: #gen1 hw
     then:
       use apb/smi/async clocks

   - if: #gen2 hw that has gals.
     then:
       use apb/smi/gals0/gals1 clocks
     else: # gen2 hw that doesn't have gals.
       use apb/smi clocks.

> 
> >
> > I tried below instead of the clocks segment above:
> >
> > ===================================
> > if:
> >   properties:
> >     compatible:
> 
> Missing contains. Just take an example from some existing schema.


Like the example you gave below
(Documentation/devicetree/bindings/clock/idt,versaclock5.yaml), It also
doesn't have "contains" in "if". I guess it is unnecessary if there is
only one compatible string. it may be necessary when it has backward
compatible string.

> 
> >       enum:
> >         - mediatek,mt6779-smi-common
> >         - mediatek,mt8183-smi-common
> >
> > then:
> >   properties:
> >     clock:
> >       items:
> >         - description: apb is the clock for setting the register..
> >         - description: smi is the clock for transfer data and command.
> >         - description: gals0 is the path0 clock of gals(global async
> > local sync).
> >         - description: gals1 is the path1 clock of gals.
> >     clock-names:
> >       items:
> >         - const: apb
> >         - const: smi
> >         - const: gals0
> >         - const: gals1
> > else:
> >   if:
> >     properties:
> >       compatible:
> >         contains:
> >           enum:
> >             - mediatek,mt2701-smi-common
> >
> >   then:
> >     properties:
> >       clocks:
> >         items:
> >           - description: apb is the clock for setting the register.
> >           - description: smi is the clock for transfer data and command.
> >           - description: async is asynchronous clock, it help transform
> > the smi clock
> >               into the emi clock domain.
> >       clock-names:
> >         items:
> >           - const: apb
> >           - const: smi
> >           - const: async
> >   else:
> >     properties:
> >       clocks:
> >         items:
> >           - description: apb is the clock for setting the register.
> >           - description: smi is the clock for transfer data and
> > command.
> >       clock-names:
> >         items:
> >           - const: apb
> >           - const: smi
> > ================================
> >
> > But I got a warning when dt_binding_check:
> >
> > CHKDT
> > Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> >   SCHEMA
> > Documentation/devicetree/bindings/processed-schema-examples.yaml
> >   DTC
> > Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.example.dt.yaml
> >   CHECK
> > Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.example.dt.yaml
> > .../Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.example.dt.yaml: smi@14022000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> There are several files which already choose different clocks based on
> compatible, simple grep shows them:
> Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> Documentation/devicetree/bindings/clock/idt,versaclock5.yaml

Thanks for the review. I will send the next version after v5.10.

> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
