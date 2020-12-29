Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6F3C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 11:12:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40CC320795
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 11:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40CC320795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6PVCWurckzkq9pi6h78zTkFyzzvTIlbz0ypct65qfbk=; b=TcN9nDH+w31XbzO6UE+H/r1Eu
	Ay0Yv/M8TiZNhhZHC6ysRtK/3i4J5S7kGAkaJpUeW7wkUxZgFXLef2du2sJHyRHeERPyBBppXe0fk
	vzmGDHJ6jvi37flM6zuFdzUh0RmpMOpu2+YpuF1MYxqs7fWNNdjOGFB//KY76MBcD91y3iFPzWKde
	GPq/VN1WrGsA74C7uL5va+8hnZCbCCEnFlSXcbkwZ/jHASQWufp4DvvQPARTjnsW3IjbbJ7XYf/k4
	8wWAe75BIOX5kl+q0mQGP2gkQHojAOsnXrdNXCpbPgko9tItScZ+OQRzusRbMkbuMi3IvZP2VrJ6b
	V2EId73tQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuCv2-0008Ir-DH; Tue, 29 Dec 2020 11:12:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuCuy-0008IA-Kh; Tue, 29 Dec 2020 11:11:57 +0000
X-UUID: 9811d40b6e774555b57e6cc7b623b8db-20201229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+tQiRgFVs1ecSRTznh8zWZJajSaxb1w3A0hIkVSyae4=; 
 b=OTzRUD7ehHDGe1nZr0cAOpq7Q/xHv6qElYPu+JaHSLb4ZKdqClb4EhyJPtLtkmRe+mxQnwOG+lAvZQqYMBdgEFPBS2iql/RjFzoaTsby4mbCcwKO/gFopCOANAUuTcC/N9fFQOKEPY9WvjR+ZJ4ZYuScdEhsViDW3ToviaGYyLY=;
X-UUID: 9811d40b6e774555b57e6cc7b623b8db-20201229
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2094229290; Tue, 29 Dec 2020 03:11:52 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Dec 2020 03:02:40 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 29 Dec 2020 19:01:16 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Dec 2020 19:00:20 +0800
Message-ID: <1609239620.26323.288.camel@mhfsdcap03>
Subject: Re: [PATCH v5 15/27] iommu/mediatek: Add fail handle for sysfs_add
 and device_register
From: Yong Wu <yong.wu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 29 Dec 2020 19:00:20 +0800
In-Reply-To: <X+L+97OBxC6I5pUv@chromium.org>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-16-yong.wu@mediatek.com>
 <X+L+97OBxC6I5pUv@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9BAE3647D5E474D2917586CBBFB4911DB1B0897182843908B89A805325F57F062000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_061156_810034_41325D32 
X-CRM114-Status: GOOD (  21.84  )
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
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com, Tomasz
 Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-23 at 17:25 +0900, Tomasz Figa wrote:
> On Wed, Dec 09, 2020 at 04:00:50PM +0800, Yong Wu wrote:
> > Add fail handle for iommu_device_sysfs_add and iommu_device_register.
> > 
> > Fixes: b16c0170b53c ("iommu/mediatek: Make use of iommu_device_register interface")
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 39478cfbe0f1..09c8c58feb78 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -746,7 +746,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >  
> >  	ret = iommu_device_register(&data->iommu);
> >  	if (ret)
> > -		return ret;
> > +		goto out_sysfs_remove;
> >  
> >  	spin_lock_init(&data->tlb_lock);
> >  	list_add_tail(&data->list, &m4ulist);
> > @@ -754,7 +754,16 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >  	if (!iommu_present(&platform_bus_type))
> >  		bus_set_iommu(&platform_bus_type, &mtk_iommu_ops);
> >  
> > -	return component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
> > +	ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
> > +	if (ret)
> > +		goto out_dev_unreg;
> > +	return ret;
> > +
> > +out_dev_unreg:
> 
> Shouldn't other operations be undone as well? I can see that above
> bus_set_iommu() is set and an entry is added to m4ulist.

Oh. Yes. I will add them. and remove the fixes tag since they are not
introduced by it. these error handle are not added in the first version.

> 
> > +	iommu_device_unregister(&data->iommu);
> > +out_sysfs_remove:
> > +	iommu_device_sysfs_remove(&data->iommu);
> > +	return ret;
> >  }
> >  
> >  static int mtk_iommu_remove(struct platform_device *pdev)
> > -- 
> > 2.18.0
> > 
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
