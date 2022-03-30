Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6C2C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6h4Q05g0S14O/NvJiWmH++4LHEzBza3F/N/pVWj64OQ=; b=Dt/hrsA0FOhC2K
	7s8sbWSl02eikcOQo0Fcg7E5X4Ik0lNPkG7F4R2L8/fmZW1l0WICRCwBFd/MQWK4Q0mdSkq9SrlPd
	Y+C9qz6kn4EoKc0WFMhspijPIodOpcd6BcQugkzEFcrKPyOHrx2FqaueSVPOJaPar16fa6yUf3dbe
	0lO+ew6pgJuFkI0xO018Iy1i4V7wVSov6TX+mBECWMK2Y8eKxZo2YBMnVIKDuQQZdqP+YlcvOAatU
	MyIZn4ZJ6YTPyruRO0ml+i89v+LZiQGvS8gxTzYNXSC6KxxVdtpiXNM3ax9GW1vQlA0ApS6oy+d0r
	XA8czsaW5LU4oU3uUoyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZUAT-00Etne-VF; Wed, 30 Mar 2022 08:59:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZUAQ-00EtmK-H9; Wed, 30 Mar 2022 08:59:04 +0000
X-UUID: 4b0e356effa24d0db1de40b7e282da81-20220330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hqioKoXfa8VcxcppJx6WbPfWRXvzNx9weeUizk2qL6E=; 
 b=t0O6XrwtA/F5+bmgaw5IQ9fVPNoa9p3+ksS6+m/tn1wkdHA/4NScQDInDTD17J7zMP95Naq7ZqOT+LEC1umO3nUI4ofkRWgs7h+mBhA01edtGHgEuCT9Cx3SybQkAB8KN/PUQxUAHMD/nVu59EjDJbF46wbBa/QMGgmipCBsWGw=;
X-UUID: 4b0e356effa24d0db1de40b7e282da81-20220330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 654511836; Wed, 30 Mar 2022 01:58:53 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 01:48:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 16:48:49 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Mar 2022 16:48:47 +0800
Message-ID: <8e87e98a0b261dcdca9beb41bd1cd5030a4690ab.camel@mediatek.com>
Subject: Re: [PATCH v3, 03/10] dt-bindings: media: mtk-vcodec: Adds encoder
 cores dt-bindings for mt8195
From: Irui Wang <irui.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 <angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Maoguang
 Meng" <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 30 Mar 2022 16:48:47 +0800
In-Reply-To: <YkMFGbgYq5DhLjt8@robh.at.kernel.org>
References: <20220317082230.23622-1-irui.wang@mediatek.com>
 <20220317082230.23622-4-irui.wang@mediatek.com>
 <Yj4s0zcHxz3U3wlc@robh.at.kernel.org>
 <ab2b24eeb51048227ad7b2ac659617a7da5b2e45.camel@mediatek.com>
 <YkG8ka1xY2k+HWi1@robh.at.kernel.org>
 <e41e909f85e3891edb6b66d7d5a810af103113c8.camel@mediatek.com>
 <YkMFGbgYq5DhLjt8@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_015902_600380_ABDB64F5 
X-CRM114-Status: GOOD (  38.76  )
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

Dear Rob,

A sample encoder hardware block diagram attached.
On Tue, 2022-03-29 at 08:09 -0500, Rob Herring wrote:
> On Tue, Mar 29, 2022 at 09:26:37AM +0800, Irui Wang wrote:
> > Dear Rob,
> > 
> > Many thanks for your attention.
> > 
> > On Mon, 2022-03-28 at 08:48 -0500, Rob Herring wrote:
> > > On Sat, Mar 26, 2022 at 10:00:55AM +0800, Irui Wang wrote:
> > > > Dear Rob,
> > > > 
> > > > Thanks for your review and comments.
> > > > 
> > > > On Fri, 2022-03-25 at 15:57 -0500, Rob Herring wrote:
> > > > > On Thu, Mar 17, 2022 at 04:22:23PM +0800, Irui Wang wrote:
> > > > > > Adds encoder cores dt-bindings for mt8195.
> 
> [...]
> 
> > > > > > +      mediatek,core-id:
> > > > > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > +        description: |
> > > > > > +          Current encoder core id.
> > > > > 
> > > > > What is this for and what does its value correspond to in the
> > > > > h/w.
> > > > > We 
> > > > > generally don't do made up indices in DT.
> > > > 
> > > > It's for encoder core id, core@1a020000 must be core-0, 
> > > > core@1b020000
> > > > must be core-1, we add this property in each child node, so we
> > > > can 
> > > > get core-id in drivers. If it can't ref "uint32" types yaml,
> > > > would 
> > > > you mind giving some more suggestions ?
> > > 
> > > I still don't understand why it is needed. What is 'core-0'?
> > > 
> > > Is there some functional difference between the cores? If so,
> > > describe 
> > > that difference.
> > > 
> > > Rob
> > 
> > They are two different pieces of hardware, it's our encoder
> > hardware
> > design. There are two encoder hardware cores inside MT8195, named
> > core0
> > and core1(we can rename it, but core id should be declared),
> > for core0, its module base address is 0x1A02_0000, uses IOMMU
> > "vdo0_iommu" and power domain "POWER_DOMAIN_VENC",
> > for core1, its module base address is 0x1B02_0000, uses IOMMU
> > "vpp_iommu" and power domain "POWER_DOMAIN_VENC_CORE1".
> > So the two encoder cores have their own base, IRQ, clock, power,
> > etc.
> > Each core can encode independently, moreover, they can work
> > together
> > for higher performance. 
> > We will describe more details in YAML about it if it's OK for you.
> 
> All the resources you list are in the child nodes, so you don't need
> 0 
> and 1 numbering for those. 
> 
> Looking at the driver patches, the only thing I see distinguishing 
> core numbers is this:
> 
> "frame#0 uses core#0, frame#1 uses core#1, frame#2 uses core#0...,
> 
> Lock the device and enable the clock by used core, for sequence
> header encoding, it always uses core#0."
> 
> Is this a requirement in the h/w or just what the driver picked?
> IOW, 
> could frame#0 use core#1?
No, it's a requirement in the h/w, driver trigger core start encoding
is in order.
About the encoder hardware block diagram, please check below:
--------------------------------------------------------------
Input Buffer: 0     1     2     3     4     5     6
              |     |     |     |     |     |     |
              v     |     v     |     v     |     v
          +-------+ | +-------+ | +-------+ | +-------+
          | core0 | | | core0 | | | core0 | | | core0 |
          +-------+ | +-------+ | +-------+ | +-------+
              |     |     |     |     |     |     |
              |     v     |     v     |     v     |
              | +-------+ | +-------+ | +-------+ |
              | | core1 | | | core1 | | | core1 | |
              | +-------+ | +-------+ | +-------+ |
              |     |     |     |     |     |     |
              v     v     v     v     v     v     v    <parent>
--------------------------------------------------------------
                        core || index                  <child>
                             \/
       +-----------------------------------------------+
       |                  core0/core1                  |
       |          enable/disable power/clk/irq         |
       +-----------------------------------------------+
--------------------------------------------------------------
As above , there are parent and child devices, child mean each venc
core, the child device controls the information of each core
independent which inlcude power/clk/irq.
When start encoding, input buffer 0 will be encoded by core0, and input
buffer 1 can be encoded by core1 even if buffer 0 has not been encoded
done yet, after buffer 0 encoded done, buffer 2 will be encoded by
core0, and buffer 1 encoded done by core1. These two encoder cores will
encode each input in this overlapping manner.

We need manage each child device in parent device by core-id property.
And we also need record current encoding input buffer, encode done
output buffers and which one core is in used through core-id, because
the two cores are encoding at the same time under one parent driver.
> 
> Rob

Thanks
Best Regards
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
