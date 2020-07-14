Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B80EC433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:36:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B042217A0
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:35:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hgRGcY3l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dDwo+0Xw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B042217A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tukNcI6saXT7Ex3AZpQDZog7qMEAVyg2+Wb7tGFClnY=; b=hgRGcY3lLySx9eRnDOss+kiwl
	K7PgDGmM5VnLK5xvemLAeMatoz8T31zE3t+rHzkpr/+V9xYoV/R7bebydthnML+1IodxnjdlDVKsO
	hi+S/ptNeKqhZdPKjRz+rMw1f3U7oJAokVrRPOS7jfBt8iCOTvflKVb9uK6F46Pb0y+oqyLoPiKtw
	9vqsgvfjDb5jzrUmAmViDyCyO1zpa/SqZNJ3DYGFTPXT7XhYKV49XHznQ32ooPqi2mBwDydR1g/gb
	pdBgL9hTdWml3oO0BjWElOBxtqB2bqw9b3qJwdXraBYCKkpwdogUP7Z8da3/x7PYqCNeVdnXkX10B
	n0OXtmbdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvHLZ-0004RE-JH; Tue, 14 Jul 2020 09:35:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvHK2-0003fj-Ne; Tue, 14 Jul 2020 09:34:08 +0000
X-UUID: 5c95b91544b44a64b8035483a94036c9-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=k1s7sjnnsRye1CFdb6q0XzdF7nQsqyfBB1IhxQ2urWM=; 
 b=dDwo+0XwYGeF2mw6SCeoJJnebbpDwWwoiWmEp7SRqsTDg31JXBSBhRSURbosxAoOY0xsqJApo4AlzvBcAzLFMBRI9iu71+9ta3LZ/ap+KnGeKtk/zF5wlnEqpn3iGu6uErx3TQVlmEPez1s5bleUOQ4vrXBNiLwk0dKFkuxsqow=;
X-UUID: 5c95b91544b44a64b8035483a94036c9-20200714
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 9690442; Tue, 14 Jul 2020 01:33:53 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 02:33:49 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 14 Jul 2020 17:33:47 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 17:33:45 +0800
Message-ID: <1594719177.16172.33.camel@mhfsdcap03>
Subject: Re: [PATCH 12/21] iommu/mediatek: Add iova reserved function
From: Yong Wu <yong.wu@mediatek.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Date: Tue, 14 Jul 2020 17:32:57 +0800
In-Reply-To: <CANdKZ0d8CSWQepCj9RFFxrvYq8K8G=oZCnskRiA3aY3gY-DD=w@mail.gmail.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-13-yong.wu@mediatek.com>
 <CANdKZ0d8CSWQepCj9RFFxrvYq8K8G=oZCnskRiA3aY3gY-DD=w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DEC085A44EA7D3545BF3F8F5EDD48DA486042A01F90A9595EFE295D355A786BF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_053358_958001_56EF4F79 
X-CRM114-Status: GOOD (  19.49  )
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
Cc: Youlin Pei =?UTF-8?Q?=28=E8=A3=B4=E5=8F=8B=E6=9E=97=29?=
 <youlin.pei@mediatek.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 cui.zhang@mediatek.com, Hao Chao <hao.chao@mediatek.com>,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 open list <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-13 at 15:33 +0800, Pi-Hsun Shih wrote:
> On Sat, Jul 11, 2020 at 2:51 PM Yong Wu <yong.wu@mediatek.com> wrote:
> >
> > For multiple iommu_domains, we need to reserve some iova regions, so we
> > will add mtk_iommu_iova_region structure. It includes the base address
> > and size of the range.
> > This is a preparing patch for supporting multi-domain.
> >
> > Signed-off-by: Anan sun<anan.sun@mediatek.com>
> > Signed-off-by: Hao Chao<hao.chao@mediatek.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 37 +++++++++++++++++++++++++++++++++++++
> >  drivers/iommu/mtk_iommu.h |  5 +++++
> >  2 files changed, 42 insertions(+)
> >
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 03a6d66f4bef..fdfdb75706e0 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -151,6 +151,11 @@ static LIST_HEAD(m4ulist); /* List all the M4U HWs */
> > ...
> > +
> > +static void mtk_iommu_put_resv_regions(struct device *dev,
> > +                                      struct list_head *head)
> > +{
> > +       struct iommu_resv_region *entry, *next;
> > +
> > +       list_for_each_entry_safe(entry, next, head, list)
> > +               kfree(entry);
> > +}
> > +
> 
> This is the same as generic_iommu_put_resv_regions, use that as the
> .put_resv_regions callback instead?

Thanks very much for the review.

Yes. I will fix it in next version.

> 
> > ...
> > --
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
