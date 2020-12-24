Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80546C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 11:38:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4008C221F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 11:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4008C221F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ovqRlfyYyijkCC5AfCTLyaXEfYbq+y3y3GFlWoNnf4E=; b=m8ZgGbtm7orYm5IY6qbmsDIsE
	092DY8xHyFWnOwM3gDl92nTfsqN2Bjp21/+hpDFx8j67Yg40cQyoREWiCuyhGY98U4z2Cy5A9Gl1i
	hlyehsxATOvMXKxvJ+2lf4D8l1gfoEhNSPy8Q4cuZX1D2OIfeuvjgDyCVtJS8XgIar7ENzpZPKCtM
	5WaAVQxNx+i48CfVf9FAnvWb1J+YNwzN5ITesybdIYT/2ErXPKoFIH2yVa/ZN60VFJzqgPxpb5J0R
	ucqxQ3PEfH8Y3FHmxDz6QhH9fSon9pF88+M5dnzdZIaDQ7Rcv6hOBUAPznGGgNYb8FZ0PmUhemoiX
	arjc14aJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksOwt-00083S-W3; Thu, 24 Dec 2020 11:38:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksOwr-00082F-0x; Thu, 24 Dec 2020 11:38:26 +0000
X-UUID: 5018a2e947364917884017feaba8b512-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SB6oEobDBkSXNK3qQS8llstfz4w4FiszNJyh08p/o70=; 
 b=rduz8VdBw7YcxQ5ZaLo9VzqJaTpF1vt9dN49RZsTIYzwDcNA4hrZtDAH1d2GOPB4FKFKwGhuI5/c4mbDyuAm8BFu8g0EEKtpWybO6AyXQ/Fu0tLBwZDp/VkTa6qpU3V/FmXaEpfYw5CDQfZzFV+9id8qzR3+QmltqioRtxD9Ayw=;
X-UUID: 5018a2e947364917884017feaba8b512-20201224
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 673404555; Thu, 24 Dec 2020 03:35:18 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 03:35:16 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Dec 2020 19:35:12 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Dec 2020 19:35:12 +0800
Message-ID: <1608809713.26323.262.camel@mhfsdcap03>
Subject: Re: [PATCH v5 06/27] dt-bindings: mediatek: Add binding for mt8192
 IOMMU
From: Yong Wu <yong.wu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 24 Dec 2020 19:35:13 +0800
In-Reply-To: <X+L9XpkoII7tw/tX@chromium.org>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-7-yong.wu@mediatek.com>
 <X+L9XpkoII7tw/tX@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 43E145A43742A33FB0F432294A8D8B05C5B400A4B9E3095EC85B6369A76296B42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_063825_278403_314D1F40 
X-CRM114-Status: GOOD (  23.53  )
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
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com, Tomasz
 Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-23 at 17:18 +0900, Tomasz Figa wrote:
> On Wed, Dec 09, 2020 at 04:00:41PM +0800, Yong Wu wrote:
> > This patch adds decriptions for mt8192 IOMMU and SMI.
> > 
> > mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
> > table format. The M4U-SMI HW diagram is as below:
> > 
> >                           EMI
> >                            |
> >                           M4U
> >                            |
> >                       ------------
> >                        SMI Common
> >                       ------------
> >                            |
> >   +-------+------+------+----------------------+-------+
> >   |       |      |      |       ......         |       |
> >   |       |      |      |                      |       |
> > larb0   larb1  larb2  larb4     ......      larb19   larb20
> > disp0   disp1   mdp    vdec                   IPE      IPE
> > 
> > All the connections are HW fixed, SW can NOT adjust it.
> > 
> > mt8192 M4U support 0~16GB iova range. we preassign different engines
> > into different iova ranges:
> > 
> > domain-id  module     iova-range                  larbs
> >    0       disp        0 ~ 4G                      larb0/1
> >    1       vcodec      4G ~ 8G                     larb4/5/7
> >    2       cam/mdp     8G ~ 12G             larb2/9/11/13/14/16/17/18/19/20
> 
> Why do we preassign these addresses in DT? Shouldn't it be a user's or
> integrator's decision to split the 16 GB address range into sub-ranges
> and define which larbs those sub-ranges are shared with?

The problem is that we can't split the 16GB range with the larb as unit.
The example is the below ccu0(larb13 port9/10) is a independent
range(domain), the others ports in larb13 is in another domain.

disp/vcodec/cam/mdp don't have special iova requirement, they could
access any range. vcodec also can locate 8G~12G. it don't care about
where its iova locate. here I preassign like this following with our
internal project setting.

Why set this in DT?, this is only for simplifying the code. Assume we
put it in the platform data. We have up to 32 larbs, each larb has up to
32 ports, each port may be in different iommu domains. we should have a
big array for this..however we only use a macro to get the domain in the
DT method.

When replying this mail, I happen to see there is a "dev->dev_range_map"
which has "dma-range" information, I think I could use this value to get
which domain the device belong to. then no need put domid in DT. I will
test this.

Thanks.
> 
> Best regards,
> Tomasz
> 
> >    3       CCU0    0x4000_0000 ~ 0x43ff_ffff     larb13: port 9/10
> >    4       CCU1    0x4400_0000 ~ 0x47ff_ffff     larb14: port 4/5
> > 
> > The iova range for CCU0/1(camera control unit) is HW requirement.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/iommu/mediatek,iommu.yaml        |  18 +-
> >  include/dt-bindings/memory/mt8192-larb-port.h | 240 ++++++++++++++++++
> >  2 files changed, 257 insertions(+), 1 deletion(-)
> >  create mode 100644 include/dt-bindings/memory/mt8192-larb-port.h
> > 
[snip]
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
