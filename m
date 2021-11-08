Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD04C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 09:41:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85F6F61242
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 09:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85F6F61242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7KWqKsZ1JUokpzBMsNOAVbeqVMAQLcg6A3NrQoupxU=; b=iYfoMxxJh77rc5
	Ehf+8P1MV2Rj8o6KzaT597zarOaeT+ePvT66UhrCrT4NojNLXfrH5aYO7PTDcyYJxGY6Kng3AqRcM
	Vh3OBs6hFGIQxqbVwHWETs+VMWOJTveRLPSCz3Z1R5eKop/GTZS7bgc2B/8T2mpMAl8QyYAkTXG7v
	5YUcWZDt+sz+RxvAufe0RT7m0SIDSBSpAPnrLaRNkkOCm4t24nnsJKdoNRsPGxnyBJc/+GK5cxD06
	WucMA1K2kPwvZmPKBwiSfn2nCVthMPTszERnvHj4WI+8a/U4UIwuDaVmq86SHwqU3iUNvfEM2utPv
	aODjiuA7G2PCXRDjtWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk19L-00Fv7Y-W5; Mon, 08 Nov 2021 09:41:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk19C-00Fv4O-VW; Mon, 08 Nov 2021 09:41:09 +0000
X-UUID: 8be3ca8f9c18411399f0390ba585273c-20211108
X-UUID: 8be3ca8f9c18411399f0390ba585273c-20211108
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yc.hung@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 357901384; Mon, 08 Nov 2021 02:40:58 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Nov 2021 01:40:57 -0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 8 Nov 2021 17:40:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 8 Nov 2021 17:40:52 +0800
Message-ID: <4e876c89ee58cd1408511a34573005e3df359cd0.camel@mediatek.com>
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8195: separate the common code
 from machine driver
From: YC Hung <yc.hung@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
CC: Trevor Wu <trevor.wu@mediatek.com>, <devicetree@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <tiwai@suse.com>,
 <linux-kernel@vger.kernel.org>, <robh+dt@kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <daniel.baluta@nxp.com>, <linux-arm-kernel@lists.infradead.org>
Date: Mon, 8 Nov 2021 17:40:52 +0800
In-Reply-To: <YYVez/V9ocCXhYmg@sirena.org.uk>
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
 <20211103100040.11933-4-trevor.wu@mediatek.com>
 <YYP+l7tMofYoB+aC@sirena.org.uk>
 <b4360ea17c3045759e85ee13fa9c001afe73c93c.camel@mediatek.com>
 <YYVQC7KLZx8oxdXT@sirena.org.uk>
 <e404d241-0685-643b-4b9d-d85bb8783385@linux.intel.com>
 <YYVez/V9ocCXhYmg@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_014103_090204_2D490E96 
X-CRM114-Status: GOOD (  35.39  )
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

Hi Mark,

I am YC Hung from Mediatek. Let me show our block diagram as the link
below for the sound card which support SOF.

https://user-images.githubusercontent.com/62316/132476344-923dfe3a-5305-43e5-9fc8-c63d9ab2c58f.png
In this sound card, there are two components , one is SOF based
component and another is non-SOF based component(called Normal in the
block).
We want to reuse some BEs of Normal which can control Mediatek Audio
Front End hardware power, clock , and DAI module and still keep some
FEs(e.g. DPTX) then we can use it on the same sound card.
Therefore, we use late_probe callback function
"mt8195_mt6359_rt1019_rt5682_card_late_probe" to add route path from
SOF widget to non-SOF BEs.
For two patches https://github.com/thesofproject/linux/pull/3217 and 
https://github.com/thesofproject/linux/pull/3236, we want to keep FEs
of non-SOF components and can reuse them. Please let me know if I am
not clear enough.Thanks.

On Fri, 2021-11-05 at 16:41 +0000, Mark Brown wrote:
> On Fri, Nov 05, 2021 at 11:16:05AM -0500, Pierre-Louis Bossart wrote:
> > On 11/5/21 10:38 AM, Mark Brown wrote:
> > > We shouldn't be requiring people to load completely different
> > > drivers
> > > based on software configuration, what if a system wants to bypass
> > > the
> > > DSP in some but not all configurations?  Can we not just have
> > > controls
> > > allowing users to route round the DSP where appropriate?
> > It was my understanding the card relies on separate components
> > - a SOF-based component to provide support for DSP-managed
> > interfaces
> > - a 'non-SOF' component for 'regular' interfaces not handled by the
> > DSP.
> > this was the basis for the changes discussed in
> > https://github.com/thesofproject/linux/pull/3217 and
> > https://github.com/thesofproject/linux/pull/3236
> 
> So it's actually supposed to end up as two different cards which
> can't
> possibly be interlinked?  That doesn't seem to add up entirely given
> that there's stuff being moved out of the current card, and I thought
> these systems had a fairly comprehensive audio muxing capability.
> Trevor, could you be a bit more specific about what's actually going
> on
> here physically please?
> 
> > But indeed if the same interface can be managed by the DSP or not,
> > depending on software choices it's a different problem altogether.
> > We've looked into this recently, if the choice to involve the DSP
> > or not
> > is at the interface level, it might be better to have both
> > components
> > expose different DAIs for the same interface, with some sort of
> > run-time
> > mutual exclusion, so that all possible/allowed permutations are
> > allowed.
> 
> Yes, if the interface can optionally be completely hidden by the DSP
> that's adding another layer of complication.
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
