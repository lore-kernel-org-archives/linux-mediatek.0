Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBA1C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 08:47:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3871C64E15
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 08:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3871C64E15
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JOiLrn1GYM/rQrmO8O9GKK4VSn8Vt0rYidnvNaTSFSw=; b=FcXvZXO9UUYGHGG2TJcimQekY
	K71ZUEZfIVg1WzWEAxvw83FjDFrcI+JpZ4SNuZKl31V6Lfihal6LAtJg+3BKnJ36wembfG1SOrtEL
	0Uz+2LzME0xhz6GELw3BAIKBTYB0X8zWTh9dzTQ6DsEJK6mquEt+hFzC9hQOInMehzxDxK4Fgt4kV
	CLpbaJ1/JdxlkfYXMJ9HSUyEMj+JIPwUwBMVssTZqXUJQ3U5fst9v5QzXTjoz7Ix5DVdG3PwHei0x
	GuBzCpVncRpLGimyc0sWAPphJuSElaHTzduz1Qj34DDRMWjhC3YwKAWM5Uf0fSraW1Xr1xyIVECx/
	qAX1jHgtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5PRO-0007VV-Pg; Fri, 29 Jan 2021 08:47:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5PRK-0007UL-VS; Fri, 29 Jan 2021 08:47:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D58F761492;
 Fri, 29 Jan 2021 08:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611910058;
 bh=2J8dyqGe56FVBKVAoj8OIvA0xFcY1qnYHpxqTDxTUeY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OqQPz3isVbHuFqDs7x5wPcvJLM9H7F81OcEkKFSAbfrk/Q1Cw8wv2VaIT2fgF2pHu
 NrxCc2cjWy3JRB3Drx0UcEmvEUlmjJ96NnIFGq7+dQ8XMdG5AqQJF7F541K+ZQ0aXa
 XMRqzdsMAmp1s1/lwfwFZHm81D1qqh274H3aRMIw/vy/0FkXzVduto0rPs1Q5umOLv
 INek5jTh1tR3YGF4WXQZ0zhpZ7ABx65Md9+zA7UNp/csBwfecR7cFpST71ZXrQi1vC
 vEtHSToOSX3G+jaoONbUPMqeGJlVkN6KFfIoSI8Te+yAIK3If6/BHIZshGqu8pyNBa
 7SNKqMza9MMFw==
Date: Fri, 29 Jan 2021 08:47:31 +0000
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v6 07/33] iommu: Avoid reallocate default domain for a
 group
Message-ID: <20210129084731.GA3998@willie-the-truck>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
 <20210111111914.22211-8-yong.wu@mediatek.com>
 <20210126222305.GB30460@willie-the-truck>
 <1611740356.5302.14.camel@mhfsdcap03>
 <20210128211020.GA3531@willie-the-truck>
 <20210128211442.GB3531@willie-the-truck>
 <1611885162.5302.19.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611885162.5302.19.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_034739_190203_7CE610F8 
X-CRM114-Status: GOOD (  35.27  )
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

On Fri, Jan 29, 2021 at 09:52:42AM +0800, Yong Wu wrote:
> On Thu, 2021-01-28 at 21:14 +0000, Will Deacon wrote:
> > On Thu, Jan 28, 2021 at 09:10:20PM +0000, Will Deacon wrote:
> > > On Wed, Jan 27, 2021 at 05:39:16PM +0800, Yong Wu wrote:
> > > > On Tue, 2021-01-26 at 22:23 +0000, Will Deacon wrote:
> > > > > On Mon, Jan 11, 2021 at 07:18:48PM +0800, Yong Wu wrote:
> > > > > > If group->default_domain exists, avoid reallocate it.
> > > > > > 
> > > > > > In some iommu drivers, there may be several devices share a group. Avoid
> > > > > > realloc the default domain for this case.
> > > > > > 
> > > > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > > > ---
> > > > > >  drivers/iommu/iommu.c | 3 ++-
> > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > > > > > index 3d099a31ddca..f4b87e6abe80 100644
> > > > > > --- a/drivers/iommu/iommu.c
> > > > > > +++ b/drivers/iommu/iommu.c
> > > > > > @@ -266,7 +266,8 @@ int iommu_probe_device(struct device *dev)
> > > > > >  	 * support default domains, so the return value is not yet
> > > > > >  	 * checked.
> > > > > >  	 */
> > > > > > -	iommu_alloc_default_domain(group, dev);
> > > > > > +	if (!group->default_domain)
> > > > > > +		iommu_alloc_default_domain(group, dev);
> > > > > 
> > > > > I don't really get what this achieves, since iommu_alloc_default_domain()
> > > > > looks like this:
> > > > > 
> > > > > static int iommu_alloc_default_domain(struct iommu_group *group,
> > > > > 				      struct device *dev)
> > > > > {
> > > > > 	unsigned int type;
> > > > > 
> > > > > 	if (group->default_domain)
> > > > > 		return 0;
> > > > > 
> > > > > 	...
> > > > > 
> > > > > in which case, it should be fine?
> > > > 
> > > > oh. sorry, I overlooked this. the current code is enough.
> > > > I will remove this patch. and send the next version in this week.
> > > > Thanks very much.
> > > 
> > > Actually, looking at this again, if we're dropping this patch and patch 6
> > > just needs the kfree() moving about, then there's no need to repost. The
> > > issue that Robin and Paul are discussing can be handled separately.
> > 
> > Argh, except that this version of the patches doesn't apply :)
> > 
> > So after all that, please go ahead and post a v7 ASAP based on this branch:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/mtk
> 
> After confirm with Tomasz, He still need some time to take a look at v6.
> 
> thus I need wait some time to send v7 after his feedback.
> 
> Thanks for your comment. and Thanks Tomasz for the review.

Ok, but please be aware that I'm planning to send my queue to Joerg on
Monday, so if it doesn't show up today then it will miss 5.12.

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
