Return-Path: <SRS0=Rw5Z=YR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C539CA9EAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 07:22:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CFB221655
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 07:22:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zfl6+MGC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CFB221655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Erx3VPEnCIk9WjTFd3iugf4jc/R6EeuoACvC84SuLOs=; b=Zfl6+MGCRZFSD8
	Qxryt9/mhwued8s7w6l7uDFnBStGzpbTLzyNw7pPJebxCB/nyWzlvMT0a4V+BkSlLisnCmmRmbfN/
	WR0gdkMQN3/ftdaNWdYKw3UsfGYOY6Rza+bDl96n6nfjPVArLFXo9HvPV/+11SxvB9EpxRcm20ScD
	5/0mmUg4Gr+U0yQ4dHLP/lqiMdgWspVwI3rR6vCrFTsAb26nbgus049k9On8t7eapPW9l9ozqvQqu
	Uve7ad2FgDiGQiQq983nhncb7QscUM/bpu/xdRibw4Baq6uHIUPR6i9Y9/O+CXd4KA0MOD4AAbPH/
	RGCFkCIAXEuYbqI7n0LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNXSF-000606-AF; Thu, 24 Oct 2019 07:22:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNXSC-0005z4-L2; Thu, 24 Oct 2019 07:22:41 +0000
X-UUID: 682f58f137c4424eb93220f5c5509338-20191023
X-UUID: 682f58f137c4424eb93220f5c5509338-20191023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1558509765; Wed, 23 Oct 2019 23:22:17 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 24 Oct 2019 00:22:31 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 24 Oct 2019 15:22:26 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 24 Oct 2019 15:22:25 +0800
Message-ID: <1571901746.19130.134.camel@mhfsdcap03>
Subject: Re: [PATCH v4 2/7] iommu/mediatek: Add a new tlb_lock for tlb_flush
From: Yong Wu <yong.wu@mediatek.com>
To: Will Deacon <will@kernel.org>
Date: Thu, 24 Oct 2019 15:22:26 +0800
In-Reply-To: <20191023165252.GA27471@willie-the-truck>
References: <1571196792-12382-1-git-send-email-yong.wu@mediatek.com>
 <1571196792-12382-3-git-send-email-yong.wu@mediatek.com>
 <20191023165252.GA27471@willie-the-truck>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A424D45C3762AE65D19C9E0D6AC3052D0F4FDCA255F395DA386AC98B86DDEC702000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_002240_693567_B7CF0827 
X-CRM114-Status: GOOD (  17.45  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com, Nicolas
 Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Joerg Roedel <joro@8bytes.org>, edison.hsieh@mediatek.com,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Robin
 Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2019-10-23 at 17:52 +0100, Will Deacon wrote:
> On Wed, Oct 16, 2019 at 11:33:07AM +0800, Yong Wu wrote:
> > The commit 4d689b619445 ("iommu/io-pgtable-arm-v7s: Convert to IOMMU API
> > TLB sync") help move the tlb_sync of unmap from v7s into the iommu
> > framework. It helps add a new function "mtk_iommu_iotlb_sync", But it
> > lacked the lock, then it will cause the variable "tlb_flush_active"
> > may be changed unexpectedly, we could see this warning log randomly:
> > 
> > mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to
> > full flush
> > 
> > The HW requires tlb_flush/tlb_sync in pairs strictly, this patch adds
> > a new tlb_lock for tlb operations to fix this issue.
> > 
> > Fixes: 4d689b619445 ("iommu/io-pgtable-arm-v7s: Convert to IOMMU API TLB
> > sync")
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 23 ++++++++++++++++++++++-
> >  drivers/iommu/mtk_iommu.h |  1 +
> >  2 files changed, 23 insertions(+), 1 deletion(-)
> 
> [...]
> 
> >  static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
> >  					    unsigned long iova, size_t granule,
> >  					    void *cookie)
> >  {
> > +	struct mtk_iommu_data *data = cookie;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&data->tlb_lock, flags);
> >  	mtk_iommu_tlb_add_flush_nosync(iova, granule, granule, true, cookie);
> > +	spin_unlock_irqrestore(&data->tlb_lock, flags);
> 
> Given that you release the lock here, what prevents another nosync()
> operation being issued before you've managed to do the sync()?

This patch can not guarantee each flush_nosync() always followed by a
sync().

The current mainline don't guarantee this too(Current v7s call
flush_nosync 16 times, then call tlb_sync 1 time in the
supersection/largepage case.). At this situation, it don't guarantee the
previous tlb_flushes are finished, But we never got the timeout
issue(Fortunately our HW always work well at that time. Maybe the HW
finish the previous tlb flush so quickly even though we don't polling
its finish flag).

We got the timeout issue only after this commit 4d689b619445. This patch
only fixes this issue via adding a new lock in iotlb_sync.(It don't
adjust the sequence of flush_nosync() and sync()).

> 
> Will



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
