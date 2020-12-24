Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BA8C433E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 11:38:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1D8221F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 11:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B1D8221F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z/RXmp8IM5N8F8rbxf68tCmB9mexrbYchbuh3+Kl0dw=; b=uJrjcPcNpOpCPENtn9cKkvURR
	OzAC+CsIsemKJJ2yKxPNHjwTO5g8IErcKVz6wQxwguxDAajhaf+D2X8HbiaP7s6kR6IYXX2GfEiPF
	UcDrcnMwclmIecSKliDMHmanFGebTKGpEpGfIiDaNApJZ/FAT1iEfBjjbGH8wcudsjfDvWFuPcspj
	8SnwbvsrUy9JtGpUyfJICGGfzBmWahKBqwei98qv3VDNdBz4Y1Ub7V0j0Jn5OB7eBYXfsWo+Hn992
	RQxLtpYJweCzU19asPBgfVKpXHtP6ypPczUDoP7MT/nustqTkVprW2Tg2PihO9GjIzLyV+VDg3L3L
	mqajcI6oA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksOwZ-0007y7-EV; Thu, 24 Dec 2020 11:38:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksOwW-0007x5-Un; Thu, 24 Dec 2020 11:38:05 +0000
X-UUID: 10c6bf301799490b8ef5eefb8ae7c38a-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DiOcFw9Kf9pbbQaIqyaauDc19jifokyiHRLy79w4/TI=; 
 b=iCMRVSy1mka6aL097U3NOWPMD8vGY1sP3cmVehyrFUQZHWDXuQLuS9M7RL8nrH0xqKbt2OJsvYTPL6TcQU8T56tv/pB0twAkX6Kwf2zT6AlZMZsoxuiDrgD+fsD0C+3OhlqaN9gtoZfYvzVmCvpJuR/+WukpAopxqRwjnnl443I=;
X-UUID: 10c6bf301799490b8ef5eefb8ae7c38a-20201224
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 674720263; Thu, 24 Dec 2020 03:27:42 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 03:27:40 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Dec 2020 19:27:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Dec 2020 19:27:36 +0800
Message-ID: <1608809257.26323.259.camel@mhfsdcap03>
Subject: Re: [PATCH v3 1/7] iommu: Move iotlb_sync_map out from __iommu_map
From: Yong Wu <yong.wu@mediatek.com>
To: Christoph Hellwig <hch@infradead.org>
Date: Thu, 24 Dec 2020 19:27:37 +0800
In-Reply-To: <20201223085153.GA30643@infradead.org>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
 <20201216103607.23050-2-yong.wu@mediatek.com>
 <20201223085153.GA30643@infradead.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FBCE9ED43BF43E3D7C20C416E2E03E98E6E841E4758068BCA32988C6FE2A5E212000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_063805_135418_248BA7AB 
X-CRM114-Status: GOOD (  16.30  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel-team@android.com,
 Greg Kroah-Hartman <gregkh@google.com>, Robin
 Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-23 at 08:51 +0000, Christoph Hellwig wrote:
> On Wed, Dec 16, 2020 at 06:36:01PM +0800, Yong Wu wrote:
> > In the end of __iommu_map, It alway call iotlb_sync_map.
> > This patch moves iotlb_sync_map out from __iommu_map since it is
> > unnecessary to call this for each sg segment especially iotlb_sync_map
> > is flush tlb all currently.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> 
> What about adding a little helper that does the NULL check and method
> call instead of duplicating it all over?

Thanks for the review. Of course OK.

Then the code like below. 
(If the helper name "_iommu_map" is not good, please tell me.)

+static int _iommu_map(struct iommu_domain *domain, unsigned long iova,
+		       phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
+{
+	const struct iommu_ops *ops = domain->ops;
+	int ret;
+
+	ret = __iommu_map(domain, iova, paddr, size, prot, gfp);
+	if (ret == 0 && ops->iotlb_sync_map)
+		ops->iotlb_sync_map(domain);
+	return ret;
+}
+
 int iommu_map(struct iommu_domain *domain, unsigned long iova,
 	      phys_addr_t paddr, size_t size, int prot)
 {
 	might_sleep();
-	return __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
+	return _iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
 }
 EXPORT_SYMBOL_GPL(iommu_map);
 
 int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
 	      phys_addr_t paddr, size_t size, int prot)
 {
-	return __iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
+	return _iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
 }
 EXPORT_SYMBOL_GPL(iommu_map_atomic);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
