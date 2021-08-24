Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C133EC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 10:22:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 458F761357
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 10:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 458F761357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dNwJPdXTfkqibXYn6KTu1B1fsy+QgercD737FVpXIY=; b=xvC41+EWCY0c2S
	4ZBVC6Ixkcd2WMalAMEsmL3vh5+rRf4umzlf5aTwrrvVJDshfyPc3ILV9pIla0kizloQnyA9p9XZ0
	/oQ1PP6bMRTV45YpVm/0p/zadA0pjC7CbHLh4FU8f/dOdvmCkYSjZs5pQbFuypmPc5FHJcxG5q+L2
	i++RDMUHXj8+mld5OfaDd9ktD8/On0e6IfuszDYWVDXSQdvChsqmU58pEI4g6T0kkz4zpVw5H1A3d
	l3q64N3Elb7hj5WBbQ2rDDXCEC/7pZnzApy99wmwm8ME0171W+GmdaZWY2+bejhnEKJhseZo874F/
	8CSsQobRaNCdhLjRIOBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mITZC-002VHh-13; Tue, 24 Aug 2021 10:22:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mITZ6-002VE4-Gy; Tue, 24 Aug 2021 10:22:00 +0000
X-UUID: eb8b894a3bcf4f3fabcf2ff46ffcb1cc-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nSqLnW0/e7tRkrLPR2Yjtna5rd1Ta+Kd5fx61UGVvec=; 
 b=j22aTOy9N/JgZTRdCxAtprvv2u0qky1kAHkbTYA5puzPY0xGvETMeyMVXMr4dbvQRLyMojKvG9M52/4JkesCjvZ/Pim+ZpG2CreKO8uhfjXGtcRiA3jsGs76JAJH5tlG/4tgz0Sxjx3kJCK7f+351z5GOq9xPEANQZsHMSrq2Ks=;
X-UUID: eb8b894a3bcf4f3fabcf2ff46ffcb1cc-20210824
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1735018976; Tue, 24 Aug 2021 03:21:51 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 03:21:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 18:21:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 18:21:47 +0800
Message-ID: <6224223ec1ead769f281af54f93bd3142a8e212b.camel@mediatek.com>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC: Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Alexandre Courbot <acourbot@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, "Andrew-CT
 Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Irui Wang
 <irui.wang@mediatek.com>, linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, George Sun
 <george.sun@mediatek.com>
Date: Tue, 24 Aug 2021 18:21:48 +0800
In-Reply-To: <CAAEAJfCdvj4drV+YSbvyR30b0+50RpJcOYdEoNODTdrAoL6+vA@mail.gmail.com>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
 <1b79a67b703d2c894bc4d9458c760e082fc42958.camel@mediatek.com>
 <CAAEAJfCTrKj9AFExN-L-TKww4E=us1VVh8LHtZ8Q0j_eaCD4Eg@mail.gmail.com>
 <1629446378.18871.27.camel@mhfsdcap03>
 <CAAEAJfCdvj4drV+YSbvyR30b0+50RpJcOYdEoNODTdrAoL6+vA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_032156_624223_BE3D06B9 
X-CRM114-Status: GOOD (  60.44  )
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

Hi Ezequiel,

Thanks for your suggestion.

On Sun, 2021-08-22 at 11:32 -0300, Ezequiel Garcia wrote:
> On Fri, 20 Aug 2021 at 04:59, yunfei.dong@mediatek.com
> <yunfei.dong@mediatek.com> wrote:
> > 
> > Hi Ezequiel,
> > 
> > Thanks for your detail feedback.
> > 
> > On Thu, 2021-08-19 at 11:10 -0300, Ezequiel Garcia wrote:
> > > On Thu, 19 Aug 2021 at 04:13, yunfei.dong@mediatek.com
> > > <yunfei.dong@mediatek.com> wrote:
> > > > 
> > > > Hi Ezequiel,
> > > > 
> > > > Thanks for your suggestion.
> > > > 
> > > > On Wed, 2021-08-18 at 11:11 -0300, Ezequiel Garcia wrote:
> > > > > +danvet
> > > > > 
> > > > > Hi,
> > > > > 
> > > > > On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <
> > > > > yunfei.dong@mediatek.com>
> > > > > wrote:
> > > > > > 
> > > > > > This series adds support for multi hardware decode into
> > > > > > mtk-vcodec,
> > > > > > by first
> > > > > > adding component framework to manage each hardware
> > > > > > information:
> > > > > > interrupt,
> > > > > > clock, register bases and power. Secondly add core thread
> > > > > > to deal
> > > > > > with core
> > > > > > hardware message, at the same time, add msg queue for
> > > > > > different
> > > > > > hardware
> > > > > > share messages. Lastly, the architecture of different specs
> > > > > > are not
> > > > > > the same,
> > > > > > using specs type to separate them.
> > > > > > 
> > > > > 
> > > > > I don't think it's a good idea to introduce the component API
> > > > > in the
> > > > > media subsystem. It doesn't seem to be maintained, IRC
> > > > > there's not
> > > > > even
> > > > > a maintainer for it, and it has some issues that were never
> > > > > addressed.
> > > > > 
> > > > > It would be really important to avoid it. Is it really needed
> > > > > in the
> > > > > first place?
> > > > > 
> > > > > Thanks,
> > > > > Ezequiel
> > > > 
> > > > For there are many hardware need to use, mt8192 is three and
> > > > mt8195 is
> > > > five. Maybe need more to be used in the feature.
> > > > 
> > > > Each hardware has independent clk/power/iommu port/irq.
> > > > Use component interface in prob to get each component's
> > > > information.
> > > > Just enable the hardware when need to use it, very convenient
> > > > and
> > > > simple.
> > > > 
> > > > I found that there are many modules use component to manage
> > > > hardware
> > > > information, such as iommu and drm etc.
> > > > 
> > > 
> > > Many drivers support multiple hardware variants, where each
> > > variant
> > > has a different number of clocks or interrupts, see for instance
> > > struct hantro_variant which allows to expose different codec
> > > cores,
> > > some having both decoder/encoder, and some having just a decoder.
> > > 
> > > The component API is mostly used by DRM to aggregate independent
> > > subdevices (called components) into an aggregated driver.
> > > 
> > > For instance, a DRM driver needs to glue together the HDMI, MIPI,
> > > and plany controller, or any other hardware arrangement where
> > > devices can be described independently.
> > > 
> > 
> > The usage scenario is very similar with drm and iommu, So decide to
> > use
> > component framework.
> > Decode has three/five or more hardwares, these hardware are
> > independent.
> > For mt8183 just need core hardware to decode, but mt8192 has
> > lat,soc and
> > core hardware to decode. When lat need to use, just enable lat
> > hardware,
> > core is the same.And mt8195 will has two cores, each core can work
> > well
> > independent.
> > 
> > For each component device just used to open their power/clk/iommu
> > port/irq when master need to enable it. The main logic is in master
> > device.
> > 
> > > The component API may look simple but has some issues, it's not
> > > easy
> > > to debug, and can cause troubles if not used as expected [1].
> > > It's worth making sure you actually need a framework
> > > to glue different devices together.
> > > 
> > 
> > Each hardware has its index, master can get hardware information
> > according these index, looks not complex. What do you mean about
> > not
> > easy to debug?
> > 
> > > > Do you have any other suggestion for this architecture?
> > > > 
> > > 
> > > Looking at the different patchsets that are posted, it's not
> > > clear
> > > to me what exactly are the different architectures that you
> > > intend
> > > to support, can you some documentation which clarifies that?
> > > 
> > 
> > Have five hardwares lat,soc,core0,core1 and main. Lat thread can
> > use lat
> > soc and main, core thread can use soc,lat, core0 and core1. Core
> > thread
> > can be used or not for different project.
> 
> Can you explain what are these lat,soc and core threads for?
> 
You can regards lat,soc and core as hardware, each hardware can work
independent. Lat and core threads used to control hardware to decode.
> > Also Need to use these
> > hardware dynamic at the same time. So I use component framework,
> > just
> > need to know the used  hardware index according to different
> > project.Need not to do complex logic to manage these hardwares.
> > 
> 
> I am not thrilled to see the component framework introduced to the
> media subsystem. Like I said, it has no clear maintainer, and it's
> not
> easy to use.
> 
How do you think about Deniel Vetter's mail ? It looks that there are
maintainer for it.
> The media subsystem has some support which AFAIK does the same thing,
> see v4l2-async, which is maintained by media people.
> 
If component can be used, I prefer to use it. At the other hand, I will
try to use these method as compared.
> Please push a branch based on media/master containing these changes.
> I see there are other patch series for this device, but it's hard to
> track
> which goes first, etc.
> 
I need time to push a branch, or you can get the latest kernel and git
am these patches, maybe much quicker.
> Thanks,
> Ezequiel

Thanks,
Yunfei Dong
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
