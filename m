Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B1FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGvHGGAPDxe8HuQiY1L2nhVOwVWD7eKA+RtHbD/byHA=; b=AhV+0A61PhobFO
	IAz1r+t3Aph3ROdfwLZV80+WU2GZivnj6JXUGkdXipDzULtUuE6v3u08kaVc7l1rS64yzR/fCAv5d
	jzsfIODM+QeZ2iEITwuKAHB+llaTtQUhiNmUYYAiOhINES4hOXjWQPWtPZ3s584EbcEH9NGK3fR4i
	TrpvV42qnmllKyaSoLPCpwfFV+cVRhesIF8cZtAJ0tdfvEIFslrH9YRf+eBYYMAH8Lrseowgn0mWP
	hK0v1ki8IIn7NuacEOkMjkxXlH1T3w9KPHe0kOpEGhZGQ0nMPLaOrTqMtwLPHSpHColl7FIQ0Nrjl
	n2oS2lnLB+fpnvs5tJ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npUrS-00G991-Ts; Fri, 13 May 2022 12:57:38 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npUrH-00G95A-KS; Fri, 13 May 2022 12:57:28 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 439244D2; Fri, 13 May 2022 14:57:20 +0200 (CEST)
Date: Fri, 13 May 2022 14:57:19 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Miles Chen <miles.chen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <jroedel@suse.de>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iommu/mediatek: Fix NULL pointer dereference when
 printing dev_name
Message-ID: <Yn5VrzVrzDLmpmdr@8bytes.org>
References: <20220505132731.21628-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505132731.21628-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_055727_854315_524E4C73 
X-CRM114-Status: UNSURE (   7.42  )
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

On Thu, May 05, 2022 at 09:27:30PM +0800, Miles Chen wrote:
>  drivers/iommu/mtk_iommu.c    | 6 ++++++
>  drivers/iommu/mtk_iommu_v1.c | 7 +++++++
>  2 files changed, 13 insertions(+)

Applied, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
