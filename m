Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C2DC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 07:49:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A40B222EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 07:49:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tQ+OpROW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="u+fN7kJl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A40B222EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OBmNQjYV+eXNoBEMuqEn8x14j5FRZmIwSWw0b97/vlg=; b=tQ+OpROWKPlT/gFFQLSKd5FFS
	rEAd5GUx4s23sOKecvrxLgnLa+EBA6tFfmvy1PGKI6SjUChAwBvPTlczd40+FV9LNIZ27sTxn4THn
	CW0baIF5lg3BXottCyWviUvUs3uWn4XX79NcVA6IjoSXLIkNSy6DtGt8Ytdhcltq6dH+BvRm3G8ae
	l5nlZgjSbkwp7Mes2F0b0ol9b/DCZYQHUZjFzuYdWxh1CnY+S6glUm03D6zIkw2hftNVZBjIn0wNo
	5i8NoWJ2rad8mBO2by6FyS+FpMLmnZwAfWFbksiPMtWmQ+UanGhcrH0m8MV+ZuFKn4JAsDs8sTZve
	BGL9WZ6LQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWxFz-0001aU-9V; Mon, 26 Oct 2020 07:49:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWxFw-0001Z8-Da; Mon, 26 Oct 2020 07:49:29 +0000
X-UUID: bfacdd3ac4a04ba0b200aaa86bc6b4b3-20201025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SfAVNttk78qRQKKemA7Ud33MHHCmqu34nhu5o0stHqY=; 
 b=u+fN7kJlDgpXkW2VyRhnBLoYkwrtZD/IKv0DltJ4yn/yUhJ6/XAcoxgJ1ymkA6l94fhp982U8WIBhhdG185QV79GLcNnvBRM8FuBARjRYMUvhsN+kfSMcHaochbt3/boH8Ks/otCXQkqbjTb+F6GgQhdwMYjiBqI1fEuHhkMfXE=;
X-UUID: bfacdd3ac4a04ba0b200aaa86bc6b4b3-20201025
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1811044683; Sun, 25 Oct 2020 23:49:25 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Oct 2020 00:49:23 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 26 Oct 2020 15:49:07 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Oct 2020 15:49:06 +0800
Message-ID: <1603698546.26323.89.camel@mhfsdcap03>
Subject: Re: [PATCH v3 08/24] iommu/io-pgtable-arm-v7s: Use ias to check the
 valid iova in unmap
From: Yong Wu <yong.wu@mediatek.com>
To: Will Deacon <will@kernel.org>
Date: Mon, 26 Oct 2020 15:49:06 +0800
In-Reply-To: <20201023111740.GA20933@willie-the-truck>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-9-yong.wu@mediatek.com>
 <20201023111740.GA20933@willie-the-truck>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8750D7412EF4047F0F7D427B7CA7C541119F84D3827A3506E3419C88D3EFEC702000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_034928_634946_B695E3B2 
X-CRM114-Status: GOOD (  22.41  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, Nicolas
 Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-23 at 12:17 +0100, Will Deacon wrote:
> On Wed, Sep 30, 2020 at 03:06:31PM +0800, Yong Wu wrote:
> > Use the ias for the valid iova checking in arm_v7s_unmap. This is a
> > preparing patch for supporting iova 34bit for MediaTek.
> > BTW, change the ias/oas checking format in arm_v7s_map.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/io-pgtable-arm-v7s.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> > index a688f22cbe3b..4c9d8dccfc5a 100644
> > --- a/drivers/iommu/io-pgtable-arm-v7s.c
> > +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> > @@ -526,8 +526,7 @@ static int arm_v7s_map(struct io_pgtable_ops *ops, unsigned long iova,
> >  	if (!(prot & (IOMMU_READ | IOMMU_WRITE)))
> >  		return 0;
> >  
> > -	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias) ||
> > -		    paddr >= (1ULL << data->iop.cfg.oas)))
> > +	if (WARN_ON(iova >> data->iop.cfg.ias || paddr >> data->iop.cfg.oas))
> >  		return -ERANGE;
> 
> As discussed when reviewing these for Android, please leave this code as-is.
> 
> >  
> >  	ret = __arm_v7s_map(data, iova, paddr, size, prot, 1, data->pgd, gfp);
> > @@ -717,7 +716,7 @@ static size_t arm_v7s_unmap(struct io_pgtable_ops *ops, unsigned long iova,
> >  {
> >  	struct arm_v7s_io_pgtable *data = io_pgtable_ops_to_data(ops);
> >  
> > -	if (WARN_ON(upper_32_bits(iova)))
> > +	if (WARN_ON(iova >> data->iop.cfg.ias))
> >  		return 0;
> 
> And avoid the UB here for 32-bit machines by comparing with 1ULL <<
> iop.cfg.ias instead.

Thanks. I will fix it in next version.

> 
> Thanks,
> 
> Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
