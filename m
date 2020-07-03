Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF65C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 02:48:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 846D72070C
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 02:48:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a/oNZJi1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WrBBTQc5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 846D72070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AipyRo6Yw2LZoZUFKlUrbewYcmVJjjGJ56e+aho4OYU=; b=a/oNZJi1QpK7aFXBBToFme77o
	9iFVFzwlqJLlyf0XfnH6Jc1+wzLBvkTIpdvS5qnYlI7BDe8YG+kN5wrCQ7UW1nStBQRXBkejlJ1bj
	FtXgMrs5Xa7WWM/LnMG2TgKd5uI4MhBVPgvSGVXLm3hFOpPaPv3ABUKh7XG53VfHE8dbngCfi+hDs
	rXttS81wzuBO9oQt9D5KCQA7L+zqzDNOcZzXDPQsLVawFj9r4B11PVOBL5FzbAvrr5NpIjmfocR3a
	e32U/qwhCouTQ2Iueou+Q9sznqtL/CqxSxOIlLOL1DQx+1AZAKejZsL6I7qBC1mBgWXRZF5mkkGhV
	vkCZRCM6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrBk0-0006oH-Cn; Fri, 03 Jul 2020 02:47:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrBjy-0006nZ-1X
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 02:47:51 +0000
X-UUID: c5eaae1813044ed299785415ab1327aa-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nfiF1q92PaTMd0SuXB3WAwRouzIiMHg7VW7edlego8Y=; 
 b=WrBBTQc56UrWQBbztWpifOQKmZLirDulavXIkZ0MP52Pm+X+Z30t9UK0PlHzdMOXQcqY3ySwD2XZXSwkgivvoJDH1swgcChoz7CP7wkM+WVRtsNj4aJm2TVBLq4lSi44L1PQe5l4B3WzQqFRQ+cbOWobnZDqKvF8sQvx59KZTQs=;
X-UUID: c5eaae1813044ed299785415ab1327aa-20200702
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 335759238; Thu, 02 Jul 2020 18:47:40 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 19:37:39 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Jul 2020 10:37:32 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Jul 2020 10:37:32 +0800
Message-ID: <1593743784.22738.0.camel@mbjsdccf07>
Subject: Re: [PATCH v5 02/10] iommu/mediatek: Rename the register
 STANDARD_AXI_MODE(0x48) to MISC_CTRL
From: chao hao <Chao.Hao@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>
Date: Fri, 3 Jul 2020 10:36:24 +0800
In-Reply-To: <1593569872.32037.6.camel@mhfsdcap03>
References: <20200629071310.1557-1-chao.hao@mediatek.com>
 <20200629071310.1557-3-chao.hao@mediatek.com>
 <1593569872.32037.6.camel@mhfsdcap03>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_224750_299469_2DFDCC17 
X-CRM114-Status: GOOD (  18.23  )
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
Cc: FY Yang <fy.yang@mediatek.com>, wsd_upstream@mediatek.com,
 Chao Hao <"chao hao"@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-01 at 10:17 +0800, Yong Wu wrote:
> On Mon, 2020-06-29 at 15:13 +0800, Chao Hao wrote:
> > For iommu offset=0x48 register, only the previous mt8173/mt8183 use the
> > name STANDARD_AXI_MODE, all the latest SoC extend the register more
> > feature by different bits, for example: axi_mode, in_order_en, coherent_en
> > and so on. So rename REG_MMU_MISC_CTRL may be more proper.
> > 
> > This patch only rename the register name, no functional change.
> > 
> > Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> > Reviewed-by: Yong Wu <yong.wu@mediatek.com>
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 14 +++++++-------
> >  drivers/iommu/mtk_iommu.h |  2 +-
> >  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> ...
> 
> > diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> > index ea949a324e33..1b6ea839b92c 100644
> > --- a/drivers/iommu/mtk_iommu.h
> > +++ b/drivers/iommu/mtk_iommu.h
> > @@ -18,7 +18,7 @@
> >  #include <soc/mediatek/smi.h>
> >  
> >  struct mtk_iommu_suspend_reg {
> > -	u32				standard_axi_mode;
> > +	u32				misc_ctrl;
> 
> Here will cause build fail for v1:
> 
> drivers/iommu/mtk_iommu_v1.c:675:20: error: 'struct
> mtk_iommu_suspend_reg' has no member named 'standard_axi_mode'
>   writel_relaxed(reg->standard_axi_mode,
>                     ^
> 
> We could change something like:
> 
> union {
> 	u32	standard_axi_mode; /* only for v1 */
> 	u32	misc_ctrl;         /* only for v2 */
> };
> 
> >  	u32				dcm_dis;
> >  	u32				ctrl_reg;
> >  	u32				int_control0;

ok, I will fix it in next version, thanks

> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
