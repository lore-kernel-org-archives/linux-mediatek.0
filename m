Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C78C41604
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 07:16:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB02D20760
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 07:16:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZFGb9qLQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0yoI/R/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB02D20760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l6b3ETPuxQIajTRyFphDxDskEqv/YlWQ2Xpf8UvTsUY=; b=ZFGb9qLQxj8t2MwgxWaVvsnb7
	A6nVh3h6tcmj2QosnMJWwLXTP0VDeleDzigbs5SbJDIcRK/7oMIwMsoG1krvWwY5YyCwlHJjaOval
	6WWw4IOr6HyoOL23zZ0gb0/1SMFZvWXoGz8qykb52pVAgQl8JdBxRabzrn4zXVvQ49yQGdtn3QTA8
	xc0lD5R49qOZNIvivx97pByuCrLhidmqa3NSvL3WRU9/z3OqSzGaxTxSZl7kvSNOnwDo7StZ7RjSo
	IBHWLpYcoBPt87OecvuLs/gxi3PJrmiXh572ZYXX7MSF8HsXxGSpIEE/8gzoMD+c657NPcZvbD6rO
	oYzVqg6eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPhCe-0005ro-Jw; Tue, 06 Oct 2020 07:16:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPhCa-0005qp-3H; Tue, 06 Oct 2020 07:16:01 +0000
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F0EF20870;
 Tue,  6 Oct 2020 07:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601968557;
 bh=Pm5Z7NVd1f2pZjZgJHSNKPNzGvewiuIqZ5UklodWXyY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=U0yoI/R/ZLFNVTakbNSgPZoT4ef0Um/3+SRSFHcmqtcw/fULKtQ5nbkygzRvT9CIq
 llgsdUHpDNwbKPA8Y1IPXyvMlhtZnQJV8o/JMTzRV3Wev5T5F3Ue4EvIeG/Rcm9NP6
 oHRHtSmJz/0G/eHm3ldhGav1th8ZfCRPI1a9RBng=
Received: by mail-ed1-f51.google.com with SMTP id k14so12423090edo.1;
 Tue, 06 Oct 2020 00:15:57 -0700 (PDT)
X-Gm-Message-State: AOAM533/rjLlTOnr3vdnDEkLE2H4X1skGCIu8INWtpG/qq5cSSGyZghJ
 psXiuvAkhd+A04RpvkxhcYgvN/miSGz1sz0QP4I=
X-Google-Smtp-Source: ABdhPJy6Bduy/2vPpEtXDeg+sGokxkFGsGaNX8K4hY71wfoyWPBbf88d5SopREX/likk3O4XjoQM/xVhY/Zs/LtrErU=
X-Received: by 2002:a05:6402:22b7:: with SMTP id
 cx23mr4008415edb.246.1601968555919; 
 Tue, 06 Oct 2020 00:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-3-yong.wu@mediatek.com>
 <20201002110831.GD6888@pi3> <1601958428.26323.26.camel@mhfsdcap03>
In-Reply-To: <1601958428.26323.26.camel@mhfsdcap03>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 6 Oct 2020 09:15:43 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfOOGnJeNCa58WEZqbzaAFdLHSm-7pyMyGkYgCBEt0+RA@mail.gmail.com>
Message-ID: <CAJKOXPfOOGnJeNCa58WEZqbzaAFdLHSm-7pyMyGkYgCBEt0+RA@mail.gmail.com>
Subject: Re: [PATCH v3 02/24] dt-bindings: memory: mediatek: Convert SMI to DT
 schema
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_031600_290202_382A8754 
X-CRM114-Status: GOOD (  24.39  )
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
> On Fri, 2020-10-02 at 13:08 +0200, Krzysztof Kozlowski wrote:
> > On Wed, Sep 30, 2020 at 03:06:25PM +0800, Yong Wu wrote:
> > > Convert MediaTek SMI to DT schema.
> > >
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > ---
> > >  .../mediatek,smi-common.txt                   |  49 ---------
> > >  .../mediatek,smi-common.yaml                  | 100 ++++++++++++++++++
> > >  .../memory-controllers/mediatek,smi-larb.txt  |  49 ---------
> > >  .../memory-controllers/mediatek,smi-larb.yaml |  91 ++++++++++++++++
> > >  4 files changed, 191 insertions(+), 98 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
> > >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> > >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> ...
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - enum:
> > > +          - mediatek,mt2701-smi-common
> > > +          - mediatek,mt2712-smi-common
> > > +          - mediatek,mt6779-smi-common
> > > +          - mediatek,mt8173-smi-common
> > > +          - mediatek,mt8183-smi-common
> > > +
> > > +      - description: for mt7623
> > > +        items:
> > > +          - const: mediatek,mt7623-smi-common
> > > +          - const: mediatek,mt2701-smi-common
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    description: |
> > > +      apb and smi are mandatory. the async is only for generation 1 smi HW.
> > > +      gals(global async local sync) also is optional, here is the list which
> > > +      require gals: mt6779 and mt8183.
> > > +    minItems: 2
> > > +    maxItems: 4
> > > +    items:
> > > +      - description: apb is Advanced Peripheral Bus clock, It's the clock for
> > > +          setting the register.
> > > +      - description: smi is the clock for transfer data and command.
> > > +      - description: async is asynchronous clock, it help transform the smi clock
> > > +          into the emi clock domain.
> > > +      - description: gals0 is the path0 clock of gals.
> > > +      - description: gals1 is the path1 clock of gals.
> > > +
> > > +  clock-names:
> > > +    oneOf:
> > > +      - items:
> > > +          - const: apb
> > > +          - const: smi
> > > +      - items:
> > > +          - const: apb
> > > +          - const: smi
> > > +          - const: async
> > > +      - items:
> > > +          - const: apb
> > > +          - const: smi
> > > +          - const: gals0
> > > +          - const: gals1
> >
> > Similarly to my comment to other properties, this requirement per
> > compatible should be part of the schema within 'if-then'.
>
> I'm not so familiar with this format. Do this has "if-then-'else
> if'-then-else"?

These are mutually exclusive conditions, so you can skip else:
 - if-then
 - if-then
 - if-then
It will be more readable then stacking 'if' under 'else'

>
> I tried below instead of the clocks segment above:
>
> ===================================
> if:
>   properties:
>     compatible:

Missing contains. Just take an example from some existing schema.

>       enum:
>         - mediatek,mt6779-smi-common
>         - mediatek,mt8183-smi-common
>
> then:
>   properties:
>     clock:
>       items:
>         - description: apb is the clock for setting the register..
>         - description: smi is the clock for transfer data and command.
>         - description: gals0 is the path0 clock of gals(global async
> local sync).
>         - description: gals1 is the path1 clock of gals.
>     clock-names:
>       items:
>         - const: apb
>         - const: smi
>         - const: gals0
>         - const: gals1
> else:
>   if:
>     properties:
>       compatible:
>         contains:
>           enum:
>             - mediatek,mt2701-smi-common
>
>   then:
>     properties:
>       clocks:
>         items:
>           - description: apb is the clock for setting the register.
>           - description: smi is the clock for transfer data and command.
>           - description: async is asynchronous clock, it help transform
> the smi clock
>               into the emi clock domain.
>       clock-names:
>         items:
>           - const: apb
>           - const: smi
>           - const: async
>   else:
>     properties:
>       clocks:
>         items:
>           - description: apb is the clock for setting the register.
>           - description: smi is the clock for transfer data and
> command.
>       clock-names:
>         items:
>           - const: apb
>           - const: smi
> ================================
>
> But I got a warning when dt_binding_check:
>
> CHKDT
> Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
>   SCHEMA
> Documentation/devicetree/bindings/processed-schema-examples.yaml
>   DTC
> Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.example.dt.yaml
>   CHECK
> Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.example.dt.yaml
> .../Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.example.dt.yaml: smi@14022000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'

There are several files which already choose different clocks based on
compatible, simple grep shows them:
Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
Documentation/devicetree/bindings/clock/idt,versaclock5.yaml

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
