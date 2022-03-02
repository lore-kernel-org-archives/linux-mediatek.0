Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847FEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 23:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90i2m2p8FLO/CJSlFwmnFpffMgek0J3LIDgilg/V0vU=; b=r90SLnNbGHQr5W
	UN6tul0FenVA1IF43S5pHJ9F7UcwDdnwTytq5Z0VfGZ3pH6oEM3wUbJ2ySt2sUSKZFgFPmV5gujOw
	MZTHDZf6ZPXjejzdTJ0BKMO8AQYPs3yZMU8cKp8kGNKtYz+MfXSIejJtw4eJFQi8KHBtYpE8j+eR7
	9R+o7lf0ObrL25kpUhHTVirzYPrVz8hoGA0Anf6DoWVtYeGCN9IKKubeqjo5TVdx8FULJeNwS5PuT
	yMEKG1T7zHe8hVfpbmqTdjZ7lOnyVf9HVPeSi6SAk+HERmMwghgT4IU6BCBxuc9PqsoZE8Ok10ell
	ogMTVQYdQL/qIVSNR32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPYnO-004npF-1a; Wed, 02 Mar 2022 23:54:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPYm6-004nQW-N8; Wed, 02 Mar 2022 23:52:57 +0000
X-UUID: 4eb3b3e98b8245dc96f926a03584b2c7-20220302
X-UUID: 4eb3b3e98b8245dc96f926a03584b2c7-20220302
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1048882562; Wed, 02 Mar 2022 16:52:47 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Mar 2022 15:52:45 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 3 Mar 2022 07:52:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 3 Mar 2022 07:52:43 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <robin.murphy@arm.com>
CC: <Libo.Kang@mediatek.com>, <Ning.Li@mediatek.com>,
 <iommu@lists.linux-foundation.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
 <stable@vger.kernel.org>, <will@kernel.org>, <wsd_upstream@mediatek.com>,
 <yf.wang@mediatek.com>
Subject: Re: [PATCH v2] iommu/iova: Reset max32_alloc_size after cleaning
Date: Thu, 3 Mar 2022 07:52:38 +0800
Message-ID: <20220302235238.13099-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <ca208635-449b-2c94-7317-09ed8eb86a2c@arm.com>
References: <ca208635-449b-2c94-7317-09ed8eb86a2c@arm.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_155254_809413_B5E312A2 
X-CRM114-Status: GOOD (  12.06  )
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

>> If no cached iova is freed, resetting max32_alloc_size before
>> the retry allocation only give us a retry. Is it possible that
>> other users free their iovas during the additional retry?
>
> No, it's not possible, since everyone's serialised by iova_rbtree_lock. 
> If the caches were already empty and the retry gets the lock first, it 
> will still fail again - forcing a reset of max32_alloc_size only means 
> it has to take the slow path to that failure. If another caller *did* 
> manage to get in and free something between free_global_cached_iovas() 
> dropping the lock and alloc_iova() re-taking it, then that would have 
> legitimately reset max32_alloc_size anyway.

Thanks for your explanation.

YF showed me some numbers yesterday and maybe we can have a further
discussion in that test case. (It looks like that some iovas are freed but
their pfn_lo(s) are less than cached_iova->pfn_lo, so max32_alloc_size is not
reset. So there are enought free iovas but the allocation still failed)

__cached_rbnode_delete_update(struct iova_domain *iovad, struct iova *free)
{
	struct iova *cached_iova;

	cached_iova = to_iova(iovad->cached32_node);
	if (free == cached_iova ||
		(free->pfn_hi < iovad->dma_32bit_pfn &&
		 free->pfn_lo >= cached_iova->pfn_lo)) {
		iovad->cached32_node = rb_next(&free->node);
		iovad->max32_alloc_size = iovad->dma_32bit_pfn;
	}
	...
}

Hi YF,
Could your share your observation of the iova allocation failure you hit?

Thanks,
Miles


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
