Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ADDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 10:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snsMWHGsLyAMEs/4nFleBCuHtTvosj+CRPYDLLoj2v0=; b=dnN/tXe/t9HSme
	n2B+LV9vLE7kKWr+cvQOqDEsLK6W+0X9hFNuHC7kIQyQr5HiQ8v2v5jleMferYePt3XD62E5Nm0KG
	oBRpM9RfhlKgbtZpfFbHCXUjzqqq8Q8VcCEz/Nx8B+Ca0bQhQBXu4hOux+QTDSxjHWQ4HmWSljiNf
	Z0qdB5f8/wwWSdNqXTNztnuw0Xu4lvTzs/LfeGX+AkwbOBp/UG+gqRvGE1DrsOZ8WSaTBaRgvQDe2
	CvCR1bXP9tKNMVKoJW/PIJZf6EQHy/Gg1rrvX4rXPS7dI2kW1w01uuiJDKOxbowd5GWY44Su0a+Yc
	2RyFV0MbNGfLd7MWoP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ4od-009UJ6-Az; Fri, 04 Mar 2022 10:05:39 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ4o4-009U5D-Od; Fri, 04 Mar 2022 10:05:06 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id AD38F9BF; Fri,  4 Mar 2022 11:05:02 +0100 (CET)
Date: Fri, 4 Mar 2022 11:05:01 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: iommu@lists.linux-foundation.org, Yong Wu <yong.wu@mediatek.com>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, kernel@collabora.com,
 linux-media@vger.kernel.org, sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 0/5] iommu/mediatek: Fix tlb flush logic
Message-ID: <YiHkTU2AhHIbkDbb@8bytes.org>
References: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_020504_984331_96F7191B 
X-CRM114-Status: UNSURE (   9.01  )
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

On Wed, Dec 08, 2021 at 02:07:39PM +0200, Dafna Hirschfeld wrote:
> Sebastian Reichel (1):
>   iommu/mediatek: Always check runtime PM status in tlb flush range
>     callback
> 
> Yong Wu (4):
>   iommu/mediatek: Remove for_each_m4u in tlb_sync_all
>   iommu/mediatek: Remove the power status checking in tlb flush all
>   iommu/mediatek: Add tlb_lock in tlb_flush_all
>   iommu/mediatek: Always tlb_flush_all when each PM resume
> 
>  drivers/iommu/mtk_iommu.c | 42 ++++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 20 deletions(-)

Applied, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
