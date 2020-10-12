Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8096DC433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 13:26:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15BB32076E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 13:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ge0X74ne";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2D2ESyQO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15BB32076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IWmu5Ed8fW2Ob58evZzb5wG7nKYnVPxMDErUOUyhjKA=; b=Ge0X74neGSa1BL35r4sQmvVSs
	bEZiZLGrrTedLKf0/ztt+yGxN/o6jCxYUlGV7jHq33DNRTqHlBLPixA1tJYUR+mn3WSrCFWNHOruB
	0iA9p/auzrc6ks8RHrP1d/y8F9vSjzEPbwuQROKRKjIIoApUKr34qzcBrwiJj2Mn3QS/pxKcNu5HM
	v9XEEZCQW0HiEVFqUk6OhhUMWkf9eL0dfGMr0b/W03gcY2YHgDnup8wnP8VL//6bYv2u6T0BkBHjf
	tL9v1wqezPpASFhc8YzJi8pHw2g3OlGddwyjMIbi987IwBF/V43Mv7Z/VUnKhL9h8CM/MySv6UA9n
	2SL2L4t0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRxqS-00085W-Le; Mon, 12 Oct 2020 13:26:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRxqG-00080M-VQ; Mon, 12 Oct 2020 13:26:23 +0000
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 882D5215A4;
 Mon, 12 Oct 2020 13:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602509179;
 bh=yGzfcblPNkEu1jThQo3Kr1pZhnuRpAynpzlLmU3Eyto=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2D2ESyQOMTChv7yvxLAiD0dAuxlG0M14eT38MlEDqC6L6xVG1ZHu4M9xJTVMu5neu
 envgnta/HiKRtEOq8DzGGEU2tSlQMCpbouoj1QusJ1hHAbZKyt9hdK0qWJrfv3/G+f
 WjCjzSGa8vfOIx5nqxsYLyVIBn2+E5lpoNLRstuk=
Received: by mail-ed1-f46.google.com with SMTP id cq12so16930866edb.2;
 Mon, 12 Oct 2020 06:26:19 -0700 (PDT)
X-Gm-Message-State: AOAM53053nCn7lNvU52GBhVRdAbn+6/jHSrrSJLYyvCfmIT63V9Ag1Gq
 /Tt8diN9YLIMCgClhizQULwi2o1RFHygHWxUcz4=
X-Google-Smtp-Source: ABdhPJxZI9QpirJF8bPQYjiJrUckib3iXod98Zoj/Cz28ZEeJBmZJyvnNsh48f+gVrrDxErmHk+CoScI5f/RtUGp454=
X-Received: by 2002:a50:8b62:: with SMTP id l89mr14553273edl.132.1602509177952; 
 Mon, 12 Oct 2020 06:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-3-yong.wu@mediatek.com>
 <20201002110831.GD6888@pi3> <1601958428.26323.26.camel@mhfsdcap03>
 <CAJKOXPfOOGnJeNCa58WEZqbzaAFdLHSm-7pyMyGkYgCBEt0+RA@mail.gmail.com>
 <1602310691.26323.39.camel@mhfsdcap03> <20201012071843.GA1889@pi3>
 <1602504119.26323.54.camel@mhfsdcap03>
In-Reply-To: <1602504119.26323.54.camel@mhfsdcap03>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 12 Oct 2020 15:26:05 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcn4scqt2C9eE_EikJ76kqro2QYzThdsXXR_5xtBmyH3g@mail.gmail.com>
Message-ID: <CAJKOXPcn4scqt2C9eE_EikJ76kqro2QYzThdsXXR_5xtBmyH3g@mail.gmail.com>
Subject: Re: [PATCH v3 02/24] dt-bindings: memory: mediatek: Convert SMI to DT
 schema
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_092621_185662_A83781A0 
X-CRM114-Status: GOOD (  29.23  )
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

On Mon, 12 Oct 2020 at 14:02, Yong Wu <yong.wu@mediatek.com> wrote:
>
> On Mon, 2020-10-12 at 09:18 +0200, Krzysztof Kozlowski wrote:
> > On Sat, Oct 10, 2020 at 02:18:11PM +0800, Yong Wu wrote:
> > > On Tue, 2020-10-06 at 09:15 +0200, Krzysztof Kozlowski wrote:
> > > > On Tue, 6 Oct 2020 at 06:27, Yong Wu <yong.wu@mediatek.com> wrote:
> > > > >
> > > > > On Fri, 2020-10-02 at 13:08 +0200, Krzysztof Kozlowski wrote:
> > > > > > On Wed, Sep 30, 2020 at 03:06:25PM +0800, Yong Wu wrote:
> > > > > > > Convert MediaTek SMI to DT schema.
> > > > > > >
> > > > > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > > > > ---
> > > > > > >  .../mediatek,smi-common.txt                   |  49 ---------
> > > > > > >  .../mediatek,smi-common.yaml                  | 100 ++++++++++++++++++
> > > > > > >  .../memory-controllers/mediatek,smi-larb.txt  |  49 ---------
> > > > > > >  .../memory-controllers/mediatek,smi-larb.yaml |  91 ++++++++++++++++
> > > > > > >  4 files changed, 191 insertions(+), 98 deletions(-)
> > > > > > >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> > > > > > >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> > > > > ...
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    oneOf:
> > > > > > > +      - enum:
> > > > > > > +          - mediatek,mt2701-smi-common
> > > > > > > +          - mediatek,mt2712-smi-common
> > > > > > > +          - mediatek,mt6779-smi-common
> > > > > > > +          - mediatek,mt8173-smi-common
> > > > > > > +          - mediatek,mt8183-smi-common
> > > > > > > +
> > > > > > > +      - description: for mt7623
> > > > > > > +        items:
> > > > > > > +          - const: mediatek,mt7623-smi-common
> > > > > > > +          - const: mediatek,mt2701-smi-common
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  clocks:
> > > > > > > +    description: |
> > > > > > > +      apb and smi are mandatory. the async is only for generation 1 smi HW.
> > > > > > > +      gals(global async local sync) also is optional, here is the list which
> > > > > > > +      require gals: mt6779 and mt8183.
> > > > > > > +    minItems: 2
> > > > > > > +    maxItems: 4
> > > > > > > +    items:
> > > > > > > +      - description: apb is Advanced Peripheral Bus clock, It's the clock for
> > > > > > > +          setting the register.
> > > > > > > +      - description: smi is the clock for transfer data and command.
> > > > > > > +      - description: async is asynchronous clock, it help transform the smi clock
> > > > > > > +          into the emi clock domain.
> > > > > > > +      - description: gals0 is the path0 clock of gals.
> > > > > > > +      - description: gals1 is the path1 clock of gals.
> > > > > > > +
> > > > > > > +  clock-names:
> > > > > > > +    oneOf:
> > > > > > > +      - items:
> > > > > > > +          - const: apb
> > > > > > > +          - const: smi
> > > > > > > +      - items:
> > > > > > > +          - const: apb
> > > > > > > +          - const: smi
> > > > > > > +          - const: async
> > > > > > > +      - items:
> > > > > > > +          - const: apb
> > > > > > > +          - const: smi
> > > > > > > +          - const: gals0
> > > > > > > +          - const: gals1
> > > > > >
> > > > > > Similarly to my comment to other properties, this requirement per
> > > > > > compatible should be part of the schema within 'if-then'.
> > > > >
> > > > > I'm not so familiar with this format. Do this has "if-then-'else
> > > > > if'-then-else"?
> > > >
> > > > These are mutually exclusive conditions, so you can skip else:
> > > >  - if-then
> > > >  - if-then
> > > >  - if-then
> > > > It will be more readable then stacking 'if' under 'else'
> > >
> > > Thanks. I will use something like this:
> > >
> > >  anyOf:
> >
> > Then it should be oneOf as only one condition can be valid.
>
> I did do this at the beginning. But I get a warning log when
> dt_binding_check.

Mhmm, right, since "if-else" matches in either of arms, then oneOf
will complain as it expects only one of items to match.  Then just go
with allOf. anyOf might match zero of items, so it would not catch
actual errors, I think.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
