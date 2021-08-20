Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2434BC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 08:00:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9F45610D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 08:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9F45610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kiqmuQHcQcwVoJDcoqX2CG0gjDPw3cHpPhxej6Ga6E=; b=18GHMXNjToPeSS
	L2xPoms8EFkNv3bJ87A8YfwjK4Hk5MaWkxhIJ400mU8IxvHaTfuofYfSoOdamRxeQAbERRJpOVFIe
	hlB7BDji8y6xUkxcenmzgP4t5QY1tZI4iM/xcIBwbaoq9cc5CAdepvOcGsgAxukEvmvkw28+VqVDz
	e1PfW0ISVX6JIwoMT1FJGKOtbg/vxCwBLbjnbH4X0m1/gLC4mTeiKUL2ZKIY0ImfeVyisHJ/dv+h7
	zL1UhhjD53ererYhF31hgnFYV91r8rT4UQfV6Slvz0E8k7OanGvbcFE9dnjx+oYH8L7Ebv6Lt6bZo
	AVTUhCMJpv6vjWrbMWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGzRR-00AJCC-BO; Fri, 20 Aug 2021 07:59:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGzRL-00AJ9d-Ic; Fri, 20 Aug 2021 07:59:51 +0000
X-UUID: 50099b786e1e4e0897e857541368c2ae-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VluiAbKGQy/3Yr6UxPnDDXbjlygkyrql8mDiSJPOAdY=; 
 b=LPVMUZKIbzNmwh6UA7bElSNPEJjOfmB61Wl+xWz0BGBqWOAXm+Zs+ZsXxTE5jFvC9PGPdk/3VGu22whRwyzPuyeqMfRqwSV1pOsQrn6B8F8VJ1VDxFKifiF/0CccidC9v//FOs5K43vv63Ta5DqPMzDgBRD05qtYtpE1x4iD6aY=;
X-UUID: 50099b786e1e4e0897e857541368c2ae-20210820
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 924475716; Fri, 20 Aug 2021 00:59:44 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 00:59:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 15:59:40 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Aug 2021 15:59:38 +0800
Message-ID: <1629446378.18871.27.camel@mhfsdcap03>
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
Date: Fri, 20 Aug 2021 15:59:38 +0800
In-Reply-To: <CAAEAJfCTrKj9AFExN-L-TKww4E=us1VVh8LHtZ8Q0j_eaCD4Eg@mail.gmail.com>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
 <1b79a67b703d2c894bc4d9458c760e082fc42958.camel@mediatek.com>
 <CAAEAJfCTrKj9AFExN-L-TKww4E=us1VVh8LHtZ8Q0j_eaCD4Eg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_005947_669541_56BD9F3F 
X-CRM114-Status: GOOD (  43.55  )
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

Thanks for your detail feedback. 

On Thu, 2021-08-19 at 11:10 -0300, Ezequiel Garcia wrote:
> On Thu, 19 Aug 2021 at 04:13, yunfei.dong@mediatek.com
> <yunfei.dong@mediatek.com> wrote:
> >
> > Hi Ezequiel,
> >
> > Thanks for your suggestion.
> >
> > On Wed, 2021-08-18 at 11:11 -0300, Ezequiel Garcia wrote:
> > > +danvet
> > >
> > > Hi,
> > >
> > > On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <yunfei.dong@mediatek.com>
> > > wrote:
> > > >
> > > > This series adds support for multi hardware decode into mtk-vcodec,
> > > > by first
> > > > adding component framework to manage each hardware information:
> > > > interrupt,
> > > > clock, register bases and power. Secondly add core thread to deal
> > > > with core
> > > > hardware message, at the same time, add msg queue for different
> > > > hardware
> > > > share messages. Lastly, the architecture of different specs are not
> > > > the same,
> > > > using specs type to separate them.
> > > >
> > >
> > > I don't think it's a good idea to introduce the component API in the
> > > media subsystem. It doesn't seem to be maintained, IRC there's not
> > > even
> > > a maintainer for it, and it has some issues that were never
> > > addressed.
> > >
> > > It would be really important to avoid it. Is it really needed in the
> > > first place?
> > >
> > > Thanks,
> > > Ezequiel
> >
> > For there are many hardware need to use, mt8192 is three and mt8195 is
> > five. Maybe need more to be used in the feature.
> >
> > Each hardware has independent clk/power/iommu port/irq.
> > Use component interface in prob to get each component's information.
> > Just enable the hardware when need to use it, very convenient and
> > simple.
> >
> > I found that there are many modules use component to manage hardware
> > information, such as iommu and drm etc.
> >
> 
> Many drivers support multiple hardware variants, where each variant
> has a different number of clocks or interrupts, see for instance
> struct hantro_variant which allows to expose different codec cores,
> some having both decoder/encoder, and some having just a decoder.
> 
> The component API is mostly used by DRM to aggregate independent
> subdevices (called components) into an aggregated driver.
> 
> For instance, a DRM driver needs to glue together the HDMI, MIPI,
> and plany controller, or any other hardware arrangement where
> devices can be described independently.
> 
The usage scenario is very similar with drm and iommu, So decide to use
component framework.
Decode has three/five or more hardwares, these hardware are independent.
For mt8183 just need core hardware to decode, but mt8192 has lat,soc and
core hardware to decode. When lat need to use, just enable lat hardware,
core is the same.And mt8195 will has two cores, each core can work well
independent.

For each component device just used to open their power/clk/iommu
port/irq when master need to enable it. The main logic is in master
device.

> The component API may look simple but has some issues, it's not easy
> to debug, and can cause troubles if not used as expected [1].
> It's worth making sure you actually need a framework
> to glue different devices together.
> 
Each hardware has its index, master can get hardware information
according these index, looks not complex. What do you mean about not
easy to debug?

> > Do you have any other suggestion for this architecture?
> >
> 
> Looking at the different patchsets that are posted, it's not clear
> to me what exactly are the different architectures that you intend
> to support, can you some documentation which clarifies that?
> 
Have five hardwares lat,soc,core0,core1 and main. Lat thread can use lat
soc and main, core thread can use soc,lat, core0 and core1. Core thread
can be used or not for different project. Also Need to use these
hardware dynamic at the same time. So I use component framework, just
need to know the used  hardware index according to different
project.Need not to do complex logic to manage these hardwares.


> Thanks,
> Ezequiel
> 
> [1] https://patchwork.kernel.org/project/linux-rockchip/cover/20200120170602.3832-1-ezequiel@collabora.com/


Thanks,
Yunfei Dong




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
