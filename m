Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174C9C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 07:19:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4C3E20790
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 07:19:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2mFWfgEl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4C3E20790
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Ors41XSWNLRxmS22E2B5wSseyzOQtn+uceJEERTU88=; b=2mFWfgElTWpNFD4z9otXU21n3
	SXvBqvIX5bpaDCPVBK7BeFi9EhJE2Cy/XkscShwjP23Jv41NOl1iGrcOjT1MnvAXcP4ux5eaZwexa
	vmL9yTnkeWkYyFQIFhF7TUEed1znbFZRat1vnSxY+EbSNMY3Msmq3QZjqgcyBRQCI1yNJtN8dkLHh
	xfEI4YzeeIn97WQ5nFtwazN1/WvImge+fdmf8lYiqGh3m5o+o7UjFl6tQIEknPSvZ3MSPLcZM+Yec
	aKeM/HvvcSXd1o2eKTDqADdOU/jpiZa4JnxKlVHEx1pDBN0caTV1kt4q5u28zlDTRQsQjCk8ZZK7D
	4cHmaM+bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRs6e-0003Y0-SR; Mon, 12 Oct 2020 07:18:52 +0000
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRs6b-0003X8-W7; Mon, 12 Oct 2020 07:18:50 +0000
Received: by mail-ed1-f66.google.com with SMTP id l24so15825750edj.8;
 Mon, 12 Oct 2020 00:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OCtzqcTvgm/lHz6dwVOWYKE+wIp/najcKC43qSAnkQQ=;
 b=qnM+C/IYYpi3rvltl1nf/Oyx8V/gLYj0NNJDqPR4Zl8ersuV0k3OE/rbbhvWyLWXko
 lxFUtzco//em1vXIqSVOY8vvye5nard+cnIunW1bltfmoR7UgC6Umfl4pf3p4cM8fcfE
 6O7eeRXqCVR2hRDWCEMkmCdncG+vvQ4M9BgVx9/oM9ckxE4jJs71YxLtpB6FMfPdXq+D
 NGU7crsJ2lUFchi4RQrWfy7d2KnLUn5zX3HMyTCP0NVnfMXl997Pp8voAcmD3TrBC+Wc
 upWlSbuqVMcO0s5R2Lhus87mn86+d5NhKxYd7ADls7wH7OAJeJRLwWaSlq1AHsIScWi7
 kIYg==
X-Gm-Message-State: AOAM5304/FcchRwQrBxTDcxZhZgf3Ch075ZjJkZ1FlB/5VeL/1hrMqVO
 +lrg3Oj2gQ7OAFPhjmKsY4g=
X-Google-Smtp-Source: ABdhPJzH66RE1w9X2obXO5dNA8hKqBI0KiAd4eRYjVVAQ32i5EUIaFFJfhg/d3NrvvfQG9iIyYP+oQ==
X-Received: by 2002:aa7:c2c4:: with SMTP id m4mr13091357edp.172.1602487127112; 
 Mon, 12 Oct 2020 00:18:47 -0700 (PDT)
Received: from pi3 ([194.230.155.215])
 by smtp.googlemail.com with ESMTPSA id a10sm9995107edu.78.2020.10.12.00.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 00:18:45 -0700 (PDT)
Date: Mon, 12 Oct 2020 09:18:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 02/24] dt-bindings: memory: mediatek: Convert SMI to
 DT schema
Message-ID: <20201012071843.GA1889@pi3>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-3-yong.wu@mediatek.com>
 <20201002110831.GD6888@pi3> <1601958428.26323.26.camel@mhfsdcap03>
 <CAJKOXPfOOGnJeNCa58WEZqbzaAFdLHSm-7pyMyGkYgCBEt0+RA@mail.gmail.com>
 <1602310691.26323.39.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602310691.26323.39.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_031850_043427_73F2AB48 
X-CRM114-Status: GOOD (  25.59  )
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

On Sat, Oct 10, 2020 at 02:18:11PM +0800, Yong Wu wrote:
> On Tue, 2020-10-06 at 09:15 +0200, Krzysztof Kozlowski wrote:
> > On Tue, 6 Oct 2020 at 06:27, Yong Wu <yong.wu@mediatek.com> wrote:
> > >
> > > On Fri, 2020-10-02 at 13:08 +0200, Krzysztof Kozlowski wrote:
> > > > On Wed, Sep 30, 2020 at 03:06:25PM +0800, Yong Wu wrote:
> > > > > Convert MediaTek SMI to DT schema.
> > > > >
> > > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > > ---
> > > > >  .../mediatek,smi-common.txt                   |  49 ---------
> > > > >  .../mediatek,smi-common.yaml                  | 100 ++++++++++++++++++
> > > > >  .../memory-controllers/mediatek,smi-larb.txt  |  49 ---------
> > > > >  .../memory-controllers/mediatek,smi-larb.yaml |  91 ++++++++++++++++
> > > > >  4 files changed, 191 insertions(+), 98 deletions(-)
> > > > >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
> > > > >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> > > > >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> > > > >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> > > ...
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    oneOf:
> > > > > +      - enum:
> > > > > +          - mediatek,mt2701-smi-common
> > > > > +          - mediatek,mt2712-smi-common
> > > > > +          - mediatek,mt6779-smi-common
> > > > > +          - mediatek,mt8173-smi-common
> > > > > +          - mediatek,mt8183-smi-common
> > > > > +
> > > > > +      - description: for mt7623
> > > > > +        items:
> > > > > +          - const: mediatek,mt7623-smi-common
> > > > > +          - const: mediatek,mt2701-smi-common
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    description: |
> > > > > +      apb and smi are mandatory. the async is only for generation 1 smi HW.
> > > > > +      gals(global async local sync) also is optional, here is the list which
> > > > > +      require gals: mt6779 and mt8183.
> > > > > +    minItems: 2
> > > > > +    maxItems: 4
> > > > > +    items:
> > > > > +      - description: apb is Advanced Peripheral Bus clock, It's the clock for
> > > > > +          setting the register.
> > > > > +      - description: smi is the clock for transfer data and command.
> > > > > +      - description: async is asynchronous clock, it help transform the smi clock
> > > > > +          into the emi clock domain.
> > > > > +      - description: gals0 is the path0 clock of gals.
> > > > > +      - description: gals1 is the path1 clock of gals.
> > > > > +
> > > > > +  clock-names:
> > > > > +    oneOf:
> > > > > +      - items:
> > > > > +          - const: apb
> > > > > +          - const: smi
> > > > > +      - items:
> > > > > +          - const: apb
> > > > > +          - const: smi
> > > > > +          - const: async
> > > > > +      - items:
> > > > > +          - const: apb
> > > > > +          - const: smi
> > > > > +          - const: gals0
> > > > > +          - const: gals1
> > > >
> > > > Similarly to my comment to other properties, this requirement per
> > > > compatible should be part of the schema within 'if-then'.
> > >
> > > I'm not so familiar with this format. Do this has "if-then-'else
> > > if'-then-else"?
> > 
> > These are mutually exclusive conditions, so you can skip else:
> >  - if-then
> >  - if-then
> >  - if-then
> > It will be more readable then stacking 'if' under 'else'
> 
> Thanks. I will use something like this:
> 
>  anyOf:

Then it should be oneOf as only one condition can be valid.

Best regards,
Krzysztof

>    - if: #gen1 hw
>      then:
>        use apb/smi/async clocks
> 
>    - if: #gen2 hw that has gals.
>      then:
>        use apb/smi/gals0/gals1 clocks
>      else: # gen2 hw that doesn't have gals.
>        use apb/smi clocks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
