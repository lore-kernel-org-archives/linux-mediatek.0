Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF77C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:54:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4958723333
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4958723333
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p6xFIJkzXabhN7hAoXrzoeNpSY0htstk1rfuAeGbnTg=; b=nxfNt5NzeTnd05lKafsONYHDR
	uzP9sUt437I+vjC5xWcmWzuRBnpHfVoCt1DIegbOfbnEZnQSV9rdpzxlGtEvpW2zimxPxPgBVP7eS
	wjD0M1ml60R4iBFk0/fD/Z1gkKhnYP/YQ4CSERap01pTw2kzUnKwzwog7feVwi0/Gcg2M2R+TeJfP
	5AcTdqhaCGl5OliIJ4KNf1FyO9JiHWq7D7JcZVBjAPIs+Oi33GeQN1LpqjvAGCUFfYSNQEqI+phz1
	mK9nvOoqgovPxEda3hXIohele6CkuzfflLzu9v9vXmcsSAHhcAobq9RYgB33/BX6mxuRiTOJQ/HHJ
	mPGurJP4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxIcx-0006z6-VF; Wed, 06 Jan 2021 23:54:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxIcs-0006y5-J7; Wed, 06 Jan 2021 23:54:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41E6B2333B;
 Wed,  6 Jan 2021 23:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609977240;
 bh=KccsynjnFEJcrmwhf1b16TrZXgLFZesL4NPRSueUY1Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O2Ctx+s/gNPzfxDa6pUH5emHrwTQaey2rpG/bApQcfaeCZglbryJfn/DohlvW0nUP
 ks+CvxCNnJRnQfy1QICe+Y/6UfBNdT7Fie4mU6hkxCc/qY6KmEvsjE/egeqs4GV+y1
 TW4FPA4nNMCMblnS6eOGf3yVexLzvV+1VHE+P/5WESFRYSwOPYyEdD4j3tBfw5xqxA
 7vQXvaCaynNadGEw+FJn10Dl6UTHcWFFh0UYHsJ4LKoK6EOh3BwO8FAbRzaSr9OFo3
 q+w0B08DB3B2O57YrN4skC7MHmVbtwCkc0B0Hqwa7sjwiFudRDfmnjHa2/qSUl0KdQ
 8u/WZFhIkL+DQ==
Received: by mail-qv1-f45.google.com with SMTP id p12so2044568qvj.13;
 Wed, 06 Jan 2021 15:54:00 -0800 (PST)
X-Gm-Message-State: AOAM533N2yjCP539SYxfUBh1NBai6zBkwbVcyhVjji25vtWJTbSNqXXY
 Su+G8uIihVa4BlK70An2jDmvLwEz8R1UNAgfgg==
X-Google-Smtp-Source: ABdhPJzZl3aU05D6dlvbXZTfnBuEeO/OPJggOMbq92bGAhrV+nuJsZ/bCmxU3BveNk7VWisYeznWdqpE7BUkNfpW7nU=
X-Received: by 2002:ad4:4a72:: with SMTP id cn18mr6116796qvb.50.1609977239399; 
 Wed, 06 Jan 2021 15:53:59 -0800 (PST)
MIME-Version: 1.0
References: <1608715847-28956-1-git-send-email-EastL.Lee@mediatek.com>
 <1608715847-28956-2-git-send-email-EastL.Lee@mediatek.com>
 <20210103165842.GA4024251@robh.at.kernel.org>
 <1609925140.5373.5.camel@mtkswgap22>
In-Reply-To: <1609925140.5373.5.camel@mtkswgap22>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Jan 2021 16:53:46 -0700
X-Gmail-Original-Message-ID: <CAL_JsqLjgJUNJiE8uri9MKqTdik=7BBGP9bZSkD1mF+Sk3YfmQ@mail.gmail.com>
Message-ID: <CAL_JsqLjgJUNJiE8uri9MKqTdik=7BBGP9bZSkD1mF+Sk3YfmQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] dt-bindings: dmaengine: Add MediaTek Command-Queue
 DMA controller bindings
To: EastL <EastL.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_185402_779464_C7E70CD6 
X-CRM114-Status: GOOD (  23.78  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 CC Hwang <cc.hwang@mediatek.com>, wsd_upstream <wsd_upstream@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Vinod <vkoul@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 6, 2021 at 2:25 AM EastL <EastL.Lee@mediatek.com> wrote:
>
> On Sun, 2021-01-03 at 09:58 -0700, Rob Herring wrote:
> > On Wed, Dec 23, 2020 at 05:30:44PM +0800, EastL Lee wrote:
> > > Document the devicetree bindings for MediaTek Command-Queue DMA controller
> > > which could be found on MT6779 SoC or other similar Mediatek SoCs.
> > >
> > > Signed-off-by: EastL Lee <EastL.Lee@mediatek.com>
> > > ---
> > >  .../devicetree/bindings/dma/mtk-cqdma.yaml         | 104 +++++++++++++++++++++
> >
> > Use compatible string for filename:
> OK
> >
> > mediatek,cqdma.yaml
> >
> > >  1 file changed, 104 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > > new file mode 100644
> > > index 0000000..a76a263
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > > @@ -0,0 +1,104 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/dma/mtk-cqdma.yaml#
> >
> > Don't forget to update this.
> OK
> >
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: MediaTek Command-Queue DMA controller Device Tree Binding
> > > +
> > > +maintainers:
> > > +  - EastL Lee <EastL.Lee@mediatek.com>
> > > +
> > > +description:
> > > +  MediaTek Command-Queue DMA controller (CQDMA) on Mediatek SoC
> > > +  is dedicated to memory-to-memory transfer through queue based
> > > +  descriptor management.
> > > +
> > > +allOf:
> > > +  - $ref: "dma-controller.yaml#"
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - mediatek,mt6765-cqdma
> > > +          - mediatek,mt6779-cqdma
> > > +      - const: mediatek,cqdma
> > > +
> > > +  reg:
> > > +    minItems: 1
> > > +    maxItems: 5
> > > +    description:
> > > +        A base address of MediaTek Command-Queue DMA controller,
> > > +        a channel will have a set of base address.
> > > +
> > > +  interrupts:
> > > +    minItems: 1
> > > +    maxItems: 5
> > > +    description:
> > > +        A interrupt number of MediaTek Command-Queue DMA controller,
> > > +        one interrupt number per dma-channels.
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    const: cqdma
> > > +
> > > +  dma-channel-mask:
> > > +    description:
> > > +       For DMA capability, We will know the addressing capability of
> > > +       MediaTek Command-Queue DMA controller through dma-channel-mask.
> > > +      minimum: 1
> > > +      maximum: 63
> >
> > Indentation is wrong here so this has no effect.
> I'll fix it
> >
> > A mask of 63 is 6 channels...
> In my opinion, kernel dma mask if for 32/64 bit capability...
> If I don't set dma mask I will get fail on DMATEST.

As in the kernel's 'dma_mask'? That's something entirely different.
The driver should set the mask to the max the device supports.
Typically this is a 32-bit or 64-bit mask. The default is 32-bit. If
the SoC has limitations in its buses, then you need to use
'dma-ranges' in DT which will in turn set the bus_dma_limit.

For the above, the purpose is if you have sparsely allocated DMA channels.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
