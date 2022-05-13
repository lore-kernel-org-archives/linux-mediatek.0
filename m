Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25766C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 13:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3y/kdusIAx4urk17DLfy3/19N46w9avX4rp61K4pTU=; b=M6fbLhEOU6jd5M
	h8v5FJLQbyDYV9cpwkAEJey94QX5AlUMYloaZAJUKln390Ly5wpWCJJiEe+rDyewlnZRlhTvtZbhI
	JBj4vNT3k8xZTJiw5zMjEVBXDjwS3eAqzATFvjiL0Kwt0Aw0X4Lm0ynFqG8V9KbnNmSN0Fh0ZJA7P
	surX2WB13Fv/+xFof9fat9MVycYyhrPt5I7QFi3SNk8DbYSys81p4NJzTVbNdaR66bbfqE5w9YH0A
	M4BQLpGvSY1lpIdpei4Bik04Gkm697eue1AdP7hXhOIQw23vhcXki1JO74gBzZqXBYTEKMlaGAFUD
	/c4PMniv3+R0mXPqIHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npUvp-00GA1y-LE; Fri, 13 May 2022 13:02:09 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npUve-00G9yr-IB; Fri, 13 May 2022 13:01:59 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 23E6F4D2; Fri, 13 May 2022 15:01:57 +0200 (CEST)
Date: Fri, 13 May 2022 15:01:55 +0200
From: Joerg Roedel <joro@8bytes.org>
To: yf.wang@mediatek.com
Cc: Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 wsd_upstream@mediatek.com, Libo Kang <Libo.Kang@mediatek.com>,
 Yong Wu <yong.wu@mediatek.com>, Ning Li <Ning.Li@mediatek.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] iommu/dma: Fix iova map result check bug
Message-ID: <Yn5Ww0xCuH+y4h+Y@8bytes.org>
References: <20220507085204.16914-1-yf.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220507085204.16914-1-yf.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_060158_795746_7F6C0CD0 
X-CRM114-Status: UNSURE (   7.49  )
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

On Sat, May 07, 2022 at 04:52:03PM +0800, yf.wang@mediatek.com wrote:
>  drivers/iommu/dma-iommu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
