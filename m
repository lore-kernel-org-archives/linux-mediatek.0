Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07E9C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 12:14:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F1EF2310A
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 12:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F1EF2310A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VXQBzwG9QSmE2OVgBJZYpl2ERhUDO4dwqittUaPFXdc=; b=H8ZXjhhlvVp9Kad12au6itPSC
	zDVxFurUDFZrmw755UtpcJBWMu7hzrYnxkjtRZUXhyfixn8bBCOVRZsNuzPz4oJu85GKDpluZ62Kc
	wi7sxClluGWeNlQ/5GArfvi7j0yKMdma1VfDFJnmF/xmYuOJt62VAxrDY+sEqe+qJJanMRASb25J7
	VNucnZEw/jdE/cGQMq3EgPUDr8pGc0TBLzG/7IU0S4CncIpQVc4WUHKv0/c9R/xBGUWz1hMiobhA0
	QfVBJS8KIwtOITPeZJVCmVr5czuzLHDHusV2UltVZGNa7a9CweN5KcXG+G6b+wNh9kvdCmBIM3q1O
	XFjaF4PpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzIYZ-0004hE-Th; Tue, 12 Jan 2021 12:13:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzIYQ-0004e3-8O; Tue, 12 Jan 2021 12:13:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 176B023107;
 Tue, 12 Jan 2021 12:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610453621;
 bh=wuHLfnLcvy3yXSEFwBhGu8I1LDuCTdYPKyRsQjTlsO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qjtfzhShrvDe0ED02eEQv5pC4BI3TK5/dpHuhCJMdpPZfa2hRgQmM+N4/rTJ7h4r7
 c9fdJNYjbuFxzMSxuH5/uThWwcv44nI/Q6NNFSKw4g45J74L4NeIEjkCRPmCfolwvy
 xiD8Rir7HGNjZmJrGg1vX4udcUHSaI5/OiaZI28crpc/ctBZkpZ0EfqrC/VxRRvtws
 tYVYXhesWUj1u6OvpFcUrCyMZOb55fiNarVW+FmW07vMyArvI9NFZu+tqsV3DNQl52
 jspwlmKANMmx/bbI8EzZtCMHxwSQmrQyp9GqLfnedvSChFrrSWRuILFSpz39N5uaW+
 syiI35+B5IpDA==
Date: Tue, 12 Jan 2021 17:43:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v8 1/4] dt-bindings: dmaengine: Add MediaTek
 Command-Queue DMA controller bindings
Message-ID: <20210112121333.GQ2771@vkoul-mobl>
References: <1608715847-28956-1-git-send-email-EastL.Lee@mediatek.com>
 <1608715847-28956-2-git-send-email-EastL.Lee@mediatek.com>
 <20210103165842.GA4024251@robh.at.kernel.org>
 <1609925140.5373.5.camel@mtkswgap22>
 <CAL_JsqLjgJUNJiE8uri9MKqTdik=7BBGP9bZSkD1mF+Sk3YfmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLjgJUNJiE8uri9MKqTdik=7BBGP9bZSkD1mF+Sk3YfmQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_071342_477860_E07F46EA 
X-CRM114-Status: GOOD (  16.15  )
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
 EastL <EastL.Lee@mediatek.com>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06-01-21, 16:53, Rob Herring wrote:

> > > > +  dma-channel-mask:
> > > > +    description:
> > > > +       For DMA capability, We will know the addressing capability of
> > > > +       MediaTek Command-Queue DMA controller through dma-channel-mask.
> > > > +      minimum: 1
> > > > +      maximum: 63
> > >
> > > Indentation is wrong here so this has no effect.
> > I'll fix it
> > >
> > > A mask of 63 is 6 channels...
> > In my opinion, kernel dma mask if for 32/64 bit capability...
> > If I don't set dma mask I will get fail on DMATEST.
> 
> As in the kernel's 'dma_mask'? That's something entirely different.
> The driver should set the mask to the max the device supports.
> Typically this is a 32-bit or 64-bit mask. The default is 32-bit. If
> the SoC has limitations in its buses, then you need to use
> 'dma-ranges' in DT which will in turn set the bus_dma_limit.

Correct, dma_mask tells dmatest the capability of the device and should
be set accordingly

dma-channel-mask defines the 'Bitmask of available DMA channels' and is
deined in dma-common.yaml

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
