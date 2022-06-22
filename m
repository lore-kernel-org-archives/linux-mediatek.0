Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982BDC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67yISJeGbMBfRouD+iI161Nl4+FkiAWRitrUJKea00s=; b=lFlcJhfGwcAbmSjmFPAGONPXDr
	tUTVH1soX8U+4sPCwfk6cQKaumjaiZZj5P289ZxaKIHcnM+CG2a2ndTk+cw4bDySAHcGytK+2oDKW
	gGd7xQQZkgnmqLfBD2gcGd4dU2OTzhGvQ9wRKHmWNYJKNF7NlTT5o5PjNpMNlzAmmf1a3Oj/dQbaS
	12+2DpM/7Sy4Y/+5QzzFu+q+UzK0GG7KmWdFYgexTjugR1CKUB/38F4rQspiiGK6iA0SPDNmBWETt
	45YoK2DBbX9tgAGrYwZeRh+NV2L8h7jIAiMRmBtHISzu0scN8zdTykzY2YNJIAQOCv5fXUG4qOow/
	lx8B0OAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40dd-00AfEM-DB; Wed, 22 Jun 2022 13:43:21 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889] helo=theia.8bytes.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40cY-00Aeil-7m; Wed, 22 Jun 2022 13:42:15 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 314092D0; Wed, 22 Jun 2022 15:42:10 +0200 (CEST)
Date: Wed, 22 Jun 2022 15:42:08 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: yf.wang@mediatek.com, Miles Chen <miles.chen@mediatek.com>,
	wsd_upstream@mediatek.com, open list <linux-kernel@vger.kernel.org>,
	Libo Kang <Libo.Kang@mediatek.com>,
	"open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Ning Li <ning.li@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Will Deacon <will@kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] iommu/dma: Fix race condition during iova_domain
 initialization
Message-ID: <YrMcMOVSQtLqJ3kp@8bytes.org>
References: <20220530120748.31733-1-yf.wang@mediatek.com>
 <YrMPG4dIEnFkCbi9@8bytes.org>
 <a0f0d3da-6992-7033-5262-156ffa5316e7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0f0d3da-6992-7033-5262-156ffa5316e7@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_064214_485254_2EB404B8 
X-CRM114-Status: GOOD (  11.04  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jun 22, 2022 at 02:27:57PM +0100, Robin Murphy wrote:
> Apologies, I did spot this before, I've just been tied up with other things
> and dropping everything non-critical on the floor, so didn't get round to
> replying before it slipped my mind again.
> 
> In summary, I hate it, but mostly because the whole situation of calling
> iommu_probe_device off the back of driver probe is fundamentally broken. I'm
> still a few steps away from fixing that properly, at which point I can just
> as well rip all these little bodges out again. If it really does need
> mitigating in the meantime (i.e. this is real-world async probe, not just
> some contrived testcase), then I can't easily think of any cleaner hack, so,
> 
> Acked-by: Robin Murphy <robin.murphy@arm.com>

Alright, applied this now.

