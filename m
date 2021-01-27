Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AA0C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 09:41:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F15A820758
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 09:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F15A820758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Xk6p2aVe6aVjUvyfSFkfhymcu2g/1b5cM24hydwkaQ=; b=V/obb3fI2lFSayI3lp5lbr83e
	+yBW3jdahmDi8hNepmLiqtLwhdop+VzvkOpzmKbQ87gEC+9DrtEKoKP8ILlaVU2y7ajXDx0mr+/tx
	+xOYcWMTCtZ1F1ZLfnfe9m31FzR7ajlR9BAuRsBx9yGmtVx+ofBN68XKUkwGc+EkCdiJ4l0WTdREA
	+NTG21ls8zKWncyTmB8gamxa4p900RdpVd0ABN0T1Bz2lz+ADDOZBNH/3jdttSFSMDHdg1miwhOrm
	Shw3xib2+B5QVBYf3/yXGq9r5PCoY3xZsUd6mtuPC8mDcA0QjDVr+hqPx0xoltypkvd/oFcTzVRoQ
	vqOKKsusA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4hJx-0002Ph-BJ; Wed, 27 Jan 2021 09:41:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4hJu-0002N8-ND; Wed, 27 Jan 2021 09:41:03 +0000
X-UUID: cf6b5d1a475548fcb9f839047fc2e38f-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OBxOSBPDbNRIc9EIOyaVw0/Acj/J50gJQln+TyAJ4w4=; 
 b=hApI6whPYpGT5NzN4Ld0vUWxt+111+0gqd77J25q1V0hZ4FPxeuEmXlUMdw1eU6AkGOWiXPdAY7kPGAV7+PB2zusIhHMqz0Kn9jqx0uy61QSJ8JPgCwz60rpFVHFptmNYBBWzuWrqppd6WtxQDYx+zn2wVUm27wNdJpM3De5TA0=;
X-UUID: cf6b5d1a475548fcb9f839047fc2e38f-20210127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 203914139; Wed, 27 Jan 2021 01:40:51 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 01:39:20 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Jan 2021 17:39:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Jan 2021 17:39:16 +0800
Message-ID: <1611740356.5302.14.camel@mhfsdcap03>
Subject: Re: [PATCH v6 07/33] iommu: Avoid reallocate default domain for a
 group
From: Yong Wu <yong.wu@mediatek.com>
To: Will Deacon <will@kernel.org>
Date: Wed, 27 Jan 2021 17:39:16 +0800
In-Reply-To: <20210126222305.GB30460@willie-the-truck>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
 <20210111111914.22211-8-yong.wu@mediatek.com>
 <20210126222305.GB30460@willie-the-truck>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F36F529AFC96016349EB7092D40E98B771F9B02D82265433FE286BC98F51FFAC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_044102_980859_210CF470 
X-CRM114-Status: GOOD (  23.55  )
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

On Tue, 2021-01-26 at 22:23 +0000, Will Deacon wrote:
> On Mon, Jan 11, 2021 at 07:18:48PM +0800, Yong Wu wrote:
> > If group->default_domain exists, avoid reallocate it.
> > 
> > In some iommu drivers, there may be several devices share a group. Avoid
> > realloc the default domain for this case.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/iommu.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > index 3d099a31ddca..f4b87e6abe80 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -266,7 +266,8 @@ int iommu_probe_device(struct device *dev)
> >  	 * support default domains, so the return value is not yet
> >  	 * checked.
> >  	 */
> > -	iommu_alloc_default_domain(group, dev);
> > +	if (!group->default_domain)
> > +		iommu_alloc_default_domain(group, dev);
> 
> I don't really get what this achieves, since iommu_alloc_default_domain()
> looks like this:
> 
> static int iommu_alloc_default_domain(struct iommu_group *group,
> 				      struct device *dev)
> {
> 	unsigned int type;
> 
> 	if (group->default_domain)
> 		return 0;
> 
> 	...
> 
> in which case, it should be fine?

oh. sorry, I overlooked this. the current code is enough.
I will remove this patch. and send the next version in this week.
Thanks very much.

> 
> Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
