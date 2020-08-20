Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A5BC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 19:57:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E65207DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 19:57:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qPwfsnR3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11E65207DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EYHgKiBz6ebNzzTqH5voTXQrg3mUk9B9JmOX45K9h9o=; b=qPwfsnR3nMvM/mg5lO/8DLlrJ
	+RkoVOEomKpvgOUuZJX1cMMGz+pqyZaSkbF4SVIeHOUp39PzChqm49hypQlhFIKqFd7DqGzUpGueu
	1EV1zGDK75i274zhV2QBatvhgFIEx4MM3+BWwaYM5zEq03tFGmHp7DQ3hFyUohN3OXRnHV57/Ggh+
	oHwGQSwbMaSfFj1JTM8QHFrZWYk/fimIaFqanMZSxq7pOXL/eE7tQd64YUeg1JhRwaqJrnIWJlqoc
	iaADp/GAvpbSVwE48R+PH8sL8Xm7qDqlguBQJKKrDfYiOIaaGnkRFRwQLyJ4HwB8Ie/Sef4wak+yP
	jDQvDL+UQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8qgE-0004Nx-LT; Thu, 20 Aug 2020 19:56:58 +0000
Received: from retiisi.org.uk ([95.216.213.190]
 helo=hillosipuli.retiisi.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8qgA-0004MA-3y; Thu, 20 Aug 2020 19:56:54 +0000
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk
 [IPv6:2a01:4f9:c010:4572::80:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 914F6634C87;
 Thu, 20 Aug 2020 22:55:36 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
 (envelope-from <sakari.ailus@retiisi.org.uk>)
 id 1k8qeu-0002rH-B7; Thu, 20 Aug 2020 22:55:36 +0300
Date: Thu, 20 Aug 2020 22:55:36 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 17/18] media/omap3isp: Clean up IOMMU workaround
Message-ID: <20200820195536.GL7145@valkosipuli.retiisi.org.uk>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <11d8419744e4e744a9448180801b0c4683328afd.1597931876.git.robin.murphy@arm.com>
 <20200820165339.GK7145@valkosipuli.retiisi.org.uk>
 <be010209-4abc-ba48-4e31-185427776a13@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be010209-4abc-ba48-4e31-185427776a13@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_155654_340224_CD064F12 
X-CRM114-Status: GOOD (  20.03  )
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, digetx@gmail.com,
 s-anna@ti.com, will@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 linux-samsung-soc@vger.kernel.org, joro@8bytes.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, jonathanh@nvidia.com, agross@kernel.org,
 yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, inki.dae@samsung.com, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 t-kristo@ti.com, kyungmin.park@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 20, 2020 at 06:25:19PM +0100, Robin Murphy wrote:
> On 2020-08-20 17:53, Sakari Ailus wrote:
> > Hi Robin,
> > 
> > On Thu, Aug 20, 2020 at 04:08:36PM +0100, Robin Murphy wrote:
> > > Now that arch/arm is wired up for default domains and iommu-dma, devices
> > > behind IOMMUs will get mappings set up automatically as appropriate, so
> > > there is no need for drivers to do so manually.
> > > 
> > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > 
> > Thanks for the patch.
> 
> Many thanks for testing so quickly!
> 
> > I haven't looked at the details but it seems that this causes the buffer
> > memory allocation to be physically contiguous, which causes a failure to
> > allocate video buffers of entirely normal size. I guess that was not
> > intentional?
> 
> Hmm, it looks like the device ends up with the wrong DMA ops, which implies
> something didn't go as expected with the earlier IOMMU setup and default
> domain creation. Chances are that either I missed some subtlety in the
> omap_iommu change, or I've fundamentally misjudged how the ISP probing works
> and it never actually goes down the of_iommu_configure() path in the first
> place. Do you get any messages from the IOMMU layer earlier on during boot?

I do get these:

[    2.934936] iommu: Default domain type: Translated 
[    2.940917] omap-iommu 480bd400.mmu: 480bd400.mmu registered
[    2.946899] platform 480bc000.isp: Adding to iommu group 0

-- 
Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
