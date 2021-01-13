Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40695C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 06:53:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC19F23132
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 06:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC19F23132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iOvCp8hGhE7Q4Q+oEE5u5v35MMihyNoj/E3l5Z8PTso=; b=W0h0qhdixi80iwhY3Sk/Jn1HM
	EC8Frg478gciR+7Z0WW8gIGaF+E2/NAY8IWYqzxBIfoN6lW+kNykRZd3/KpuY3xcHShUBxJdfbcLm
	o/MjZKwMtpTPsWfij3/oB6eUWVR2ML2G+xjA6m/q8z19txUSIvI9LSGinuQFkW6of3Hiy/Xv7CpC7
	xzCnvjIVejzv3A8S4HiHB/hi178AzjIgEQ34ZvHiElXj/4Jp5/hMwZ/n5dJnsxwJdI4EPRPiMQkFZ
	AeYwb4qAMwDQuZgyHQUmSD1sjxToC0+imIcsvwjD7+N9Vm+JPivHqfh4kd2vg69OEzQzAStFNW3Rr
	SSBXWJqqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kza1u-0001VU-1n; Wed, 13 Jan 2021 06:53:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kza1o-0001U9-Bb; Wed, 13 Jan 2021 06:53:14 +0000
X-UUID: 3b4a8d3fe26c419abd5912047eec0e2a-20210112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XzZvJXXejeb6vuCxcQ/ZYBYhWXSlgg5if1eYN0e4A+w=; 
 b=W1hGBIY9oFs+oXLjHCMyj9x0racvFR3UFoVUPfnJ32ySrSytxdGEJ0eJAuVffdCXVDMfqXspnKRCfwNprzUUcA83Igbkurt1VrdjddFgB8lItVVDRMLEItaaZ6+RBA+tpKxOxnC6hSi1Nh6UYM63quc3na95mn5uZuwpjJcOHJs=;
X-UUID: 3b4a8d3fe26c419abd5912047eec0e2a-20210112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 651684953; Tue, 12 Jan 2021 22:53:07 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Jan 2021 22:45:07 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 13 Jan 2021 14:45:02 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Jan 2021 14:45:01 +0800
Message-ID: <1610520301.31716.27.camel@mhfsdcap03>
Subject: Re: [PATCH v5 06/27] dt-bindings: mediatek: Add binding for mt8192
 IOMMU
From: Yong Wu <yong.wu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 13 Jan 2021 14:45:01 +0800
In-Reply-To: <CAAFQd5CCJv=0q=V45Z7mtq7FSq1c5TcH6vyqfp3MWxaA=ZexJQ@mail.gmail.com>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-7-yong.wu@mediatek.com>
 <X+L9XpkoII7tw/tX@chromium.org> <1608809713.26323.262.camel@mhfsdcap03>
 <CAAFQd5CCJv=0q=V45Z7mtq7FSq1c5TcH6vyqfp3MWxaA=ZexJQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F266EF73A8C9243F1CE89A1C9FC11853CFFC4FF9CB30643997D3F962D9E21E3A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_015313_238325_09362A99 
X-CRM114-Status: GOOD (  39.57  )
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
Cc: youlin.pei@mediatek.com, linux-devicetree <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2021-01-13 at 14:30 +0900, Tomasz Figa wrote:
> On Thu, Dec 24, 2020 at 8:35 PM Yong Wu <yong.wu@mediatek.com> wrote:
> >
> > On Wed, 2020-12-23 at 17:18 +0900, Tomasz Figa wrote:
> > > On Wed, Dec 09, 2020 at 04:00:41PM +0800, Yong Wu wrote:
> > > > This patch adds decriptions for mt8192 IOMMU and SMI.
> > > >
> > > > mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
> > > > table format. The M4U-SMI HW diagram is as below:
> > > >
> > > >                           EMI
> > > >                            |
> > > >                           M4U
> > > >                            |
> > > >                       ------------
> > > >                        SMI Common
> > > >                       ------------
> > > >                            |
> > > >   +-------+------+------+----------------------+-------+
> > > >   |       |      |      |       ......         |       |
> > > >   |       |      |      |                      |       |
> > > > larb0   larb1  larb2  larb4     ......      larb19   larb20
> > > > disp0   disp1   mdp    vdec                   IPE      IPE
> > > >
> > > > All the connections are HW fixed, SW can NOT adjust it.
> > > >
> > > > mt8192 M4U support 0~16GB iova range. we preassign different engines
> > > > into different iova ranges:
> > > >
> > > > domain-id  module     iova-range                  larbs
> > > >    0       disp        0 ~ 4G                      larb0/1
> > > >    1       vcodec      4G ~ 8G                     larb4/5/7
> > > >    2       cam/mdp     8G ~ 12G             larb2/9/11/13/14/16/17/18/19/20
> > >
> > > Why do we preassign these addresses in DT? Shouldn't it be a user's or
> > > integrator's decision to split the 16 GB address range into sub-ranges
> > > and define which larbs those sub-ranges are shared with?
> >
> > The problem is that we can't split the 16GB range with the larb as unit.
> > The example is the below ccu0(larb13 port9/10) is a independent
> > range(domain), the others ports in larb13 is in another domain.
> >
> > disp/vcodec/cam/mdp don't have special iova requirement, they could
> > access any range. vcodec also can locate 8G~12G. it don't care about
> > where its iova locate. here I preassign like this following with our
> > internal project setting.
> 
> Let me try to understand this a bit more. Given the split you're
> proposing, is there actually any isolation enforced between particular
> domains? For example, if I program vcodec to with a DMA address from
> the 0-4G range, would the IOMMU actually generate a fault, even if
> disp had some memory mapped at that address?

In this case. we will get fault in current SW setting.

> 
> >
> > Why set this in DT?, this is only for simplifying the code. Assume we
> > put it in the platform data. We have up to 32 larbs, each larb has up to
> > 32 ports, each port may be in different iommu domains. we should have a
> > big array for this..however we only use a macro to get the domain in the
> > DT method.
> >
> > When replying this mail, I happen to see there is a "dev->dev_range_map"
> > which has "dma-range" information, I think I could use this value to get
> > which domain the device belong to. then no need put domid in DT. I will
> > test this.
> 
> My feeling is that the only part that needs to be enforced statically
> is the reserved IOVA range for CCUs. The other ranges should be
> determined dynamically, although I think I need to understand better
> how the hardware and your proposed design work to tell what would be
> likely the best choice here.

I have removed the domid patch in v6. and get the domain id in [27/33]
in v6..

About the other ranges should be dynamical, the commit message [30/33]
of v6 should be helpful. the problem is that we have a bank_sel setting
for the iova[32:33]. currently we preassign this value. thus, all the
ranges are fixed. If you adjust this setting, you can let vcodec access
0~4G.

Currently we have no interface to adjust this setting. Suppose we add a
new interface for this. It would be something like:

   int mtk_smi_larb_config_banksel(struct device *larb, int banksel)
  
   Then, all the MM drivers should call it before the HW works every
time, and its implement will be a bit complex since we aren't sure if
the larb has power at that time. the important thing is that the MM
devices have already not known which larb it connects with as we plan to
delete "mediatek,larb" in their dtsi nodes.

   In current design, the MM device don't need care about it and 4GB
range is enough for them.

> 
> Best regards,
> Tomasz
> 
> >
> > Thanks.
> > >
> > > Best regards,
> > > Tomasz
> > >
> > > >    3       CCU0    0x4000_0000 ~ 0x43ff_ffff     larb13: port 9/10
> > > >    4       CCU1    0x4400_0000 ~ 0x47ff_ffff     larb14: port 4/5
> > > >
> > > > The iova range for CCU0/1(camera control unit) is HW requirement.
> > > >
> > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > >  .../bindings/iommu/mediatek,iommu.yaml        |  18 +-
> > > >  include/dt-bindings/memory/mt8192-larb-port.h | 240 ++++++++++++++++++
> > > >  2 files changed, 257 insertions(+), 1 deletion(-)
> > > >  create mode 100644 include/dt-bindings/memory/mt8192-larb-port.h
> > > >
> > [snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
