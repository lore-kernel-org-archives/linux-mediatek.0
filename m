Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450C4C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 13:43:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F266D207D3
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 13:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TeDmf9hs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F266D207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xGVojYQvhhOgQCyAR+hUtWy1TmReq7kLX4aDCgUk2QU=; b=TeDmf9hs3S9rxS
	qOkyPX19KcMpoNE9CRTtp4/L5fFPrPqoAsXUH9f5MTQxJqt3YfprIQ89yit33z493C3CeCSSeiW3c
	6MbqMSnsJEi8XjpZIUu+8pQZiCDdMhQY1IzrSFZvPDdfioCny54fJVRllfgfNFKipqKGeVDnJnDeZ
	Bkcpq0baQA1j1aY53XrhV9cgNwuhBaFXLkW1Ubcz+UaCW/jxkTZq/Bm4NY2ObLQLHl3WHDEx3cXvF
	0stKhLGpQnS0HV7JqFOWTmrncfQOo6/pjUkl+77yuKY4BMa7t4gB0+PmVbok5iF9csF7mECwFKA30
	KgjP/9TbD1JORSm2brgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jag2d-0006iW-W8; Mon, 18 May 2020 13:42:52 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jag2T-0006Y1-Hg; Mon, 18 May 2020 13:42:43 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 336D3386; Mon, 18 May 2020 15:42:31 +0200 (CEST)
Date: Mon, 18 May 2020 15:42:29 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH] iommu/mediatek-v1: Add def_domain_type
Message-ID: <20200518134229.GD18353@8bytes.org>
References: <1589530123-30240-1-git-send-email-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589530123-30240-1-git-send-email-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_064241_730534_5050681F 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com, srv_heupstream@mediatek.com,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 15, 2020 at 04:08:43PM +0800, Yong Wu wrote:
> The MediaTek V1 IOMMU is arm32 whose default domain type is
> IOMMU_DOMAIN_UNMANAGED. Add this to satisfy the bus_iommu_probe to
> enter "probe_finalize".
> 
> The iommu framework will create a iommu domain for each a device.
> But all the devices share a iommu domain here, thus we skip all the
> other domains in the "attach_device" except the domain we create
> internally with arm_iommu_create_mapping.
> 
> Also a minor change: in the attach_device, "data" always is not null.
> Remove "if (!data) return".
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> a. rebase on linux-next.
> b. After this patch and fixed the mutex issue(locally I only move
>    mutex_unlock(&group->mutex) before __iommu_group_dma_attach(group)),
>    the mtk_iommu_v1.c could work normally.
> ---
>  drivers/iommu/mtk_iommu_v1.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Applied, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
