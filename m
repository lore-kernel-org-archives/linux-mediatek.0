Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2235C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 22:36:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20C4120715
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 22:36:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lkHIVXzb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="G985UI6D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20C4120715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G7sOIuZ2dAAfTPUiN0tpiYHIr1ndnBk1yl5wIMlwXow=; b=lkHIVXzbqbQjwhFEjBjOYo31B
	BAJF/Af26LWkGZs40U39OO5mpOxqovflqugE2cdpqErHWTtuYZillEmO0Xy0+dMxkRfnZl+V1NaDd
	YTqendXjvQyhlVGLhb+WcvQOthgS6gIGDjcui+6wpGYgLDMxsgisyK6XJ25L0GNEef/dZvUoIJOQs
	l7T5HxlJxLENkrhepjI3vLeHpcYBuWWkOpywQc8ff/O/AkRgEuk16shD85YU+MebMQsJ1kSIXjcB4
	dhHgfilo5fG7xHOwCTqJ0cGiTad20Vb0XaMkQ+YB7evRlsivL+/RPEpHguBplbItOpfRxUlDqcQGm
	1dp6yFQgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKqtp-0001jQ-Jx; Tue, 22 Sep 2020 22:36:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKqtl-0001iV-GO; Tue, 22 Sep 2020 22:36:34 +0000
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5671D238A1;
 Tue, 22 Sep 2020 22:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600814192;
 bh=42JEbkwJ0QcZASq1Xu6y67Bf8D/3KmeHjzJ9YCx8dHE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G985UI6DInk3QstKOjZeMHQVb2yBKJKcr6wo7bgw8wgSz4csAVdeiEuGxORsC3F23
 q4qGJSGjNjjnFmVVei6AUkvzfizaJgozFleRVSrIihdOax5W8Xy2AK63PMc9rMW4Yf
 QowxKuDNnZJxXEIrPiSYDGQsyoGCKkAl1tZzvttY=
Received: by mail-oi1-f175.google.com with SMTP id m7so22868746oie.0;
 Tue, 22 Sep 2020 15:36:32 -0700 (PDT)
X-Gm-Message-State: AOAM533FrqIbe1AsEHY4nfylIuM+xsrr/CPsJ6ctOcOWfAJDjxPoSDiJ
 KDcq0fi9aD/m1IuFzVsKLSOKDaKZDt1zRfIxAA==
X-Google-Smtp-Source: ABdhPJzZN0UgDaU6VdXUbXGFsCMsyMLMdcBZ6UFDqWV5LRcZ8PQQtjB9wUHpc6lYoWnyT/qiwTJuMWEE8IMBZfMrad8=
X-Received: by 2002:aca:fc07:: with SMTP id a7mr4015483oii.106.1600814191611; 
 Tue, 22 Sep 2020 15:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <20200910172826.3074357-2-enric.balletbo@collabora.com>
 <20200911230255.GA2972120@bogus>
 <7a1c89b6-f483-5d57-f154-b80b72964077@gmail.com>
In-Reply-To: <7a1c89b6-f483-5d57-f154-b80b72964077@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Sep 2020 16:36:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLCOXKCTbjw=8MMhnq0YdhrOb7tY6QpT7d3XTAgUrbg=w@mail.gmail.com>
Message-ID: <CAL_JsqLCOXKCTbjw=8MMhnq0YdhrOb7tY6QpT7d3XTAgUrbg=w@mail.gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: power: Add bindings for the Mediatek
 SCPSYS power domains controller
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_183633_666714_72B8EBC5 
X-CRM114-Status: GOOD (  34.23  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Weiyi Lu <weiyi.lu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>, Matthias Brugger <mbrugger@suse.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 14, 2020 at 2:59 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 12/09/2020 01:02, Rob Herring wrote:
> > On Thu, Sep 10, 2020 at 07:28:15PM +0200, Enric Balletbo i Serra wrote:
> >> The System Control Processor System (SCPSYS) has several power management
> >> related tasks in the system. Add the bindings to define the power
> >> domains for the SCPSYS power controller.
> >>
> >> Co-developed-by: Matthias Brugger <mbrugger@suse.com>
> >> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> >> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> ---
> >> Dear Rob,
> >>
> >> I am awasre that this binding is not ready, but I prefered to send because I'm
> >> kind of blocked. Compiling this binding triggers the following error:
> >>
> >>      mediatek,power-controller.example.dt.yaml: syscon@10006000: mfg_async@7:
> >>      '#address-cells', '#size-cells', 'mfg_2d@8'
> >>      do not match any of the regexes: 'pinctrl-[0-9]+'
> >>
> >> This happens when a definition of a power-domain (parent) contains
> >> another power-domain (child), like the example. I am not sure how to
> >> specify this in the yaml and deal with this, so any clue is welcome.
> >
> > You just have to keep nesting schemas all the way down. Define a
> > grandchild node under the child node and then all of its properties.
> >
> >>
> >> Thanks,
> >>    Enric
> >>
> >>   .../power/mediatek,power-controller.yaml      | 171 ++++++++++++++++++
> >>   1 file changed, 171 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> >> new file mode 100644
> >> index 000000000000..8be9244ad160
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> >> @@ -0,0 +1,171 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Mediatek Power Domains Controller
> >> +
> >> +maintainers:
> >> +  - Weiyi Lu <weiyi.lu@mediatek.com>
> >> +  - Matthias Brugger <mbrugger@suse.com>
> >> +
> >> +description: |
> >> +  Mediatek processors include support for multiple power domains which can be
> >> +  powered up/down by software based on different application scenes to save power.
> >> +
> >> +  IP cores belonging to a power domain should contain a 'power-domains'
> >> +  property that is a phandle for SCPSYS node representing the domain.
> >> +
> >> +properties:
> >> +  $nodename:
> >> +    pattern: "^syscon@[0-9a-f]+$"
> >> +
> >> +  compatible:
> >> +    items:
> >> +      - enum:
> >> +        - mediatek,mt8173-power-controller
> >> +      - const: syscon
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +patternProperties:
> >> +  "^.*@[0-9]$":
> >
> > Node names should be generic:
> >
> > power-domain@
> >
>
> Enric correct me if I'm wrong, if we want to see the power domains in debugfs,
> they are listed by their name. If all are called power-domain then the listing
> is pretty much useless.

Sorry, but not a binding problem.

Maybe if debugfs shows what devices are contained within a power
domain then it doesn't matter so much.

> >> +    type: object
> >> +    description: |
> >> +      Represents the power domains within the power controller node as documented
> >> +      in Documentation/devicetree/bindings/power/power-domain.yaml.
> >> +
> >> +    properties:
> >> +      reg:
> >> +        description: |
> >> +          Power domain index. Valid values are defined in:
> >> +              "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
> >> +        maxItems: 1
> >> +
> >> +      '#power-domain-cells':
> >> +        description:
> >> +          Documented by the generic PM Domain bindings in
> >> +          Documentation/devicetree/bindings/power/power-domain.yaml.
> >
> > No need to redefine a common property. This should define valid values
> > for it.
> >
> >> +
> >> +      clocks:
> >> +        description: |
> >> +          A number of phandles to clocks that need to be enabled during domain
> >> +          power-up sequencing.
> >
> > No need to redefine 'clocks'. You need to define how many, what each one
> > is, and the order.
> >
>
> Do you mean we have to define each clock for each power domain of each SoC?

Yes.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
