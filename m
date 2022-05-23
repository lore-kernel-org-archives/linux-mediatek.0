Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1065C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5OImYFAOvIy0vkI5eBbgye09pR1z9yk23UG7bGuwdM=; b=weVB7P+k5DQGIr
	+dPS4m4hZhYzNYPrE02ko4h27XqMfwNX7IFxsNN+wKJZqMZeHaeccGyfhxPojNpXwZUb25RbMRhoS
	vvltIICDoe5Uk9vjo8PhhAB0/hxtu9QHFC7QhVXnwVak/P/tird9yFq5VDS2E1NsYPlGWXf1MNBbJ
	qrxXfzhU02DnCG0WZmppJNQXqYtucnk8IXywKhTZYrLUVr3qIRzPirzDotoQ8XGNglyBFhuQw5U0L
	1ghnDswoqhJjKPibfJYZUM+RV8MO29kpDMpofFypyymmCsR/ywPgC8f/GkmpHsw0WSp/vnkrbnqC5
	JcdcBTv5WZJbMjPMpu6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt684-003eWT-5J; Mon, 23 May 2022 11:21:40 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5ES-003DFy-CJ; Mon, 23 May 2022 10:24:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A15811FB;
 Mon, 23 May 2022 03:24:09 -0700 (PDT)
Received: from [10.57.82.55] (unknown [10.57.82.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CB9F3F73D;
 Mon, 23 May 2022 03:24:07 -0700 (PDT)
Message-ID: <6f1f48e2-a54d-58d6-8946-853cffeb55df@arm.com>
Date: Mon, 23 May 2022 11:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/2] dma-mapping, remoteproc: Fix dma_mem leak after
 rproc_shutdown
Content-Language: en-GB
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, hch@lst.de
Cc: bjorn.andersson@linaro.org, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 m.szyprowski@samsung.com, mathieu.poirier@linaro.org,
 matthias.bgg@gmail.com, yj.chiang@mediatek.com
References: <20220423174650.GA29219@lst.de>
 <20220523101516.29934-1-mark-pk.tsai@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220523101516.29934-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_032412_520841_4042C6F7 
X-CRM114-Status: GOOD (  11.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2022-05-23 11:15, Mark-PK Tsai wrote:
>> Sigh.  In theory drivers should never declare coherent memory like
>> this, and there has been some work to fix remoteproc in that regard.
>>
>> But I guess until that is merged we'll need somthing like this fix.
> 
> Hi,
> 
> Thanks for your comment.
> As I didn't see other fix of this issue, should we use this patch
> before the remoteproc work you mentioned is merged?

TBH I think it would be better "fixed" with a kmemleak_ignore() and a 
big comment, rather than adding API cruft for something that isn't a 
real problem. I'm quite sure that no real-world user is unbinding 
remoteproc drivers frequently enough that leaking a 48-byte allocation 
each time has any practical significance.

Thanks,
Robin.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
