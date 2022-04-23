Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6E6C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Apr 2022 17:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ns4xf/EGC14dzZLXlHWPfLjEeGakainTJlK1RQNUF+Q=; b=AoX76gbGRXsgIa
	W6BeT7wI5AkRKTVNYfylxkZ1Jdwm9Rr7HGFUTHtVlkZPMhqNZiq5tO3wAmdoymV+qzXF0/56UmhT0
	BGeYIux30Dw5ZHwa0u7+5r+64zICpSKDOvR9g1gH885cbUug2dafcelVJnKx4tH8Oicf9+2tAiFkj
	g27Peh0AFOO+Jr0cNVa5YiM9dx8Ep2lhARbL6zZxbO+3ZfZCG6g8YbTkc9kAaXISUBOTBfCxrApkm
	HSA5bgNL5RWyeU+BF0E6yK+LxYjq23yqrz0TNnO48ckzgyerbsJHJ3xwbk6ASThf5g6XVBzAEmYOS
	rTAIW/H9nUEoBVDTn6bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niJqd-004mCX-T6; Sat, 23 Apr 2022 17:47:07 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niJqT-004m83-Ts; Sat, 23 Apr 2022 17:46:59 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0A68C68B05; Sat, 23 Apr 2022 19:46:50 +0200 (CEST)
Date: Sat, 23 Apr 2022 19:46:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 robin.murphy@arm.com, hch@lst.de, m.szyprowski@samsung.com,
 matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com
Subject: Re: [PATCH 0/2] dma-mapping, remoteproc: Fix dma_mem leak after
 rproc_shutdown
Message-ID: <20220423174650.GA29219@lst.de>
References: <20220422062436.14384-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422062436.14384-1-mark-pk.tsai@mediatek.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_104658_146369_4197E575 
X-CRM114-Status: UNSURE (   7.27  )
X-CRM114-Notice: Please train this message.
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

Sigh.  In theory drivers should never declare coherent memory like
this, and there has been some work to fix remoteproc in that regard.

But I guess until that is merged we'll need somthing like this fix.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
