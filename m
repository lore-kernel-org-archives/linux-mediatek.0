Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D8EC47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 09:39:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD38B6124C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 09:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD38B6124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XISaMRLW1Z4AasugRExbbF2yHFD9ExAxNZlRVBsAd6E=; b=amscMXoXMES01k
	cX+j79uhnaxxYdZ4EbCo8pII/JLRnw7LQJQe8AsEq0rgE1625cjph4AVUF1yQefdmumpKnJz+aw2l
	MKUbNO7rYxS2soktXa/xV0vkoKb2VyJFlRLOQShZTAGz2p2Um4HaTpx/pcCxAnN/9QfozEHONJVm7
	SbweU9U1IKMK7Ls2rUULFWO0sLmxDUXQIhUUmkHqIwUGVZXz7MOcNwBIZskxGlC3OwC2tS+ZY4Smn
	4R70kDckcXcpVInwaUqdjb9BDraLh1tcmVD8mBGi6kbJL2JnIO9kVJy7gdfpxOf8hmIJzuwHjDXeV
	GfntjsHYhqekJN/kN5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqYCa-007TEa-D6; Tue, 08 Jun 2021 09:39:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqYCB-007T3y-A2; Tue, 08 Jun 2021 09:38:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD13861246;
 Tue,  8 Jun 2021 09:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623145130;
 bh=vxDRlETdFI2PxULKoexaolR76e6sEkGi4SwEVNAONko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q3vtJ+jhevpN9HMr0yO5HHI84E7BaAUQhqF0Is8p+TOQLEKDl1floYBhTkmAvtQM+
 ZdeXq1S9f6rO205DS6HunWGzB47PxBEoRKTuQirizr0lOj7HODwIlDrCXB8+BFfK/2
 Ra/9/vghohxzMzsnYoPcnmX2/q7Ed+iyeaK2ayM04oSLmiP9kj9ebRdfqgY+rabkfX
 qxT83QpM5F0jxJHzd2CF8aJbWdBXFAZcfOAVDU/cjNcKG9CsjJZk8KHCq1EwBIN+m+
 Hg28jb+pCFoeaWpwhkGlf7WqIQpcs/1fQDvkjDwh6+Ltr3tRM2v8EKhAJYaRXWakHJ
 fn39WWUD+sXvA==
Date: Tue, 8 Jun 2021 10:38:45 +0100
From: Will Deacon <will@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 iommu <iommu@lists.linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH v2 1/1] iommu: Clear a lot of spelling mistakes
Message-ID: <20210608093845.GC8935@willie-the-truck>
References: <20210510035425.3212-1-thunder.leizhen@huawei.com>
 <20210510035425.3212-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510035425.3212-2-thunder.leizhen@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_023851_407356_E612F55D 
X-CRM114-Status: GOOD (  14.61  )
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

On Mon, May 10, 2021 at 11:54:25AM +0800, Zhen Lei wrote:
> All spelling mistakes are in the comments, no functional change.

[...]

> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index e06b8a0e2b56bdd..b9e4be35c8dcad2 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -161,7 +161,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data);
>   * The Region 'A'(I/O) can NOT be mapped by M4U; For Region 'B'/'C'/'D', the
>   * bit32 of the CPU physical address always is needed to set, and for Region
>   * 'E', the CPU physical address keep as is.
> - * Additionally, The iommu consumers always use the CPU phyiscal address.
> + * Additionally, The iommu consumers always use the CPU physical address.

If we're fixing typos, then I think the 'T' in "The iommu" should be
lowercase here.

Anyway, all the other fixes look correct to me. I'll leave it up to Joerg as
to whether he wants to apply this or not, given the impact on git blame and
the potential for conflicts.

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
