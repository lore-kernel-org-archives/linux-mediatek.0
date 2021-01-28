Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC73AC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 21:15:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D65064DE9
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 21:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D65064DE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NXGs3RzKcMlKcTRXBUdEwizFucNMFB+kSghpU2yDnN0=; b=z/7NCWOezNSll/hxgU/aeUMbb
	mWAGVT7lyeqj31GCDHJM5ETr603wDyzjB+6mW/shzNBn46VwGWreAibpHXJruwiDZ8TMRyTlSjcvu
	mIRgA1adFn6I+e7XchRXko04Xgg84HskE8GwVg8tQbgzmItKBtJKsEE0YhUGhjYBfPr8oRa06VH7S
	Xh7si2sJ7nM3wmdBaaSWlmfMh+xb2bQ2h/ERcRQ7ssSDOstBicddqrCOZuhLMEoO06nX9R6fwqc+7
	BXP61jwMHBsknMl8mRy16J6pZHYCKZWRLe1LQc6LDeTnlnFHBTbfJwX6k+OH1oYm9ysPq8iJanUEL
	T9pxoBS0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Ed3-0008GD-3z; Thu, 28 Jan 2021 21:15:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Ecy-0008FH-HT; Thu, 28 Jan 2021 21:14:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85E5F64DE8;
 Thu, 28 Jan 2021 21:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611868495;
 bh=XgWvSGSpVv18LahQizgkshnTyUbmYEWq3r/XkahHRII=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LziO4BAXRIFn2iS8fwmhSyVoCaoZPy2kSoOBMhp5cYxstDcu5D/J9i7i79+DGGP5o
 48GGfpcm8R9i6X1zxfcGxMKA8ANVE7WymoLs4PDD9xxSjJzrh4Tl6jDYc+QC0UfKqd
 SecnHXT0DqaP6PwKB0nUcfE9nowxuUNBCNX4389tC4oSZJu3YOdXbEUQSK16fYPCqJ
 FyFomm+RDf3zpSa0Ik7u1XjSL0Tl0dWI5kdEww1S8bOgAn6WhrSgw8LpIIRLdIHmq9
 dSGyqCjORMZ4heDOlrzHyC30DWFM06QEs2JGhtUf3gm9jWn+cWeCSrk2tYTjd1Mqmu
 k2mSU9CnqXFpw==
Date: Thu, 28 Jan 2021 21:14:42 +0000
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v6 07/33] iommu: Avoid reallocate default domain for a
 group
Message-ID: <20210128211442.GB3531@willie-the-truck>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
 <20210111111914.22211-8-yong.wu@mediatek.com>
 <20210126222305.GB30460@willie-the-truck>
 <1611740356.5302.14.camel@mhfsdcap03>
 <20210128211020.GA3531@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128211020.GA3531@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_161456_709065_A43C844D 
X-CRM114-Status: GOOD (  29.43  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 28, 2021 at 09:10:20PM +0000, Will Deacon wrote:
> On Wed, Jan 27, 2021 at 05:39:16PM +0800, Yong Wu wrote:
> > On Tue, 2021-01-26 at 22:23 +0000, Will Deacon wrote:
> > > On Mon, Jan 11, 2021 at 07:18:48PM +0800, Yong Wu wrote:
> > > > If group->default_domain exists, avoid reallocate it.
> > > > 
> > > > In some iommu drivers, there may be several devices share a group. Avoid
> > > > realloc the default domain for this case.
> > > > 
> > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > ---
> > > >  drivers/iommu/iommu.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > > > index 3d099a31ddca..f4b87e6abe80 100644
> > > > --- a/drivers/iommu/iommu.c
> > > > +++ b/drivers/iommu/iommu.c
> > > > @@ -266,7 +266,8 @@ int iommu_probe_device(struct device *dev)
> > > >  	 * support default domains, so the return value is not yet
> > > >  	 * checked.
> > > >  	 */
> > > > -	iommu_alloc_default_domain(group, dev);
> > > > +	if (!group->default_domain)
> > > > +		iommu_alloc_default_domain(group, dev);
> > > 
> > > I don't really get what this achieves, since iommu_alloc_default_domain()
> > > looks like this:
> > > 
> > > static int iommu_alloc_default_domain(struct iommu_group *group,
> > > 				      struct device *dev)
> > > {
> > > 	unsigned int type;
> > > 
> > > 	if (group->default_domain)
> > > 		return 0;
> > > 
> > > 	...
> > > 
> > > in which case, it should be fine?
> > 
> > oh. sorry, I overlooked this. the current code is enough.
> > I will remove this patch. and send the next version in this week.
> > Thanks very much.
> 
> Actually, looking at this again, if we're dropping this patch and patch 6
> just needs the kfree() moving about, then there's no need to repost. The
> issue that Robin and Paul are discussing can be handled separately.

Argh, except that this version of the patches doesn't apply :)

So after all that, please go ahead and post a v7 ASAP based on this branch:

https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/mtk

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
