Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93592C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 07:16:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B4EB6120D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 07:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B4EB6120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ho9G0oZgE0roWk53a9H0NZZjCp+RClsKKwX/kQgzX8M=; b=RH9RU8rxpU+zyl
	UTb9Up1PW3bKoXfZpe0R3HW9ejS2yk9+hd5RCVmhHLgExV/DJM3iXQjhDM6CYC1YTjy38UkCFoAGd
	Rk38lYrqUeXbnSfhg5FyyoV7bDafnXNjnPKAWWKSXCL4uTE9l4j45CH+k252mQkxM9Hi/e/kM025b
	Bp7nXDQj8YdEPt7wmiuyNHrkcrS/0oCv8o3w/YJocQ1vRSffKciXHotqbjYjzzNs1h3ZcbNHyKqMx
	UGIGwTMsjgNG55oWMacwO/TxACy6ZLKv/6yb6qo5odBCtEOfOAlGi9U+HPK462t7WDL4bjZHrafaY
	Q00nzg3SCv2NVYvwvimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVqIh-00DARy-5G; Thu, 30 Sep 2021 07:16:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVqIU-00DAQb-4P; Thu, 30 Sep 2021 07:16:03 +0000
X-UUID: a598c140764d4ea4ab7e897520b97048-20210930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=W+gAqULzOpfc/ivXZHGg1RcECraPP+WX8duBqllWiWg=; 
 b=q6efus+v6mX5SugaKB9oDbvpcDX3wweSD7qtPf2IR45WzvSCiPikm9UkP3QVbvTgTgLPZDSnAT7wHVIQ2xQIp7xdgzrJmimFYB9auLntLAhrici9R0V3DC6TqxrDFvuFZJtlP6xPLCacUIEC/WOzXMzfNySweY7gwtEkUXD715U=;
X-UUID: a598c140764d4ea4ab7e897520b97048-20210930
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 423571633; Thu, 30 Sep 2021 00:15:59 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Sep 2021 00:14:45 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 30 Sep 2021 15:14:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Sep 2021 15:14:42 +0800
Message-ID: <d3ed2bdef81ce1822b20da9570b5245cc0df6330.camel@mediatek.com>
Subject: Re: [PATCH v8 03/12] iommu/mediatek: Add probe_defer for smi-larb
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <youlin.pei@mediatek.com>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>, <acourbot@chromium.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 <anthony.huang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>
Date: Thu, 30 Sep 2021 15:14:45 +0800
In-Reply-To: <33a8b313-ad1b-d307-7e8c-2fdebdc6f1a7@collabora.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
 <20210929013719.25120-4-yong.wu@mediatek.com>
 <33a8b313-ad1b-d307-7e8c-2fdebdc6f1a7@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_001602_203831_66DEA7F1 
X-CRM114-Status: GOOD (  32.51  )
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

On Wed, 2021-09-29 at 18:33 +0200, Dafna Hirschfeld wrote:
> 
> On 29.09.21 03:37, Yong Wu wrote:
> > Prepare for adding device_link.
> > 
> > The iommu consumer should use device_link to connect with the
> > smi-larb(supplier). then the smi-larb should run before the iommu
> > consumer. Here we delay the iommu driver until the smi driver is
> > ready,
> > then all the iommu consumers always are after the smi driver.
> > 
> > When there is no this patch, if some consumer drivers run before
> > smi-larb, the supplier link_status is DL_DEV_NO_DRIVER(0) in the
> > device_link_add, then device_links_driver_bound will use WARN_ON
> > to complain that the link_status of supplier is not right.
> > 
> > device_is_bound may be more elegant here. but it is not allowed to
> > EXPORT from https://lore.kernel.org/patchwork/patch/1334670/.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-
> > R2/MT7623
> > ---
> >   drivers/iommu/mtk_iommu.c    | 2 +-
> >   drivers/iommu/mtk_iommu_v1.c | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index d837adfd1da5..d5848f78a677 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -844,7 +844,7 @@ static int mtk_iommu_probe(struct
> > platform_device *pdev)
> >   			id = i;
> >   
> >   		plarbdev = of_find_device_by_node(larbnode);
> > -		if (!plarbdev) {
> > +		if (!plarbdev || !plarbdev->dev.driver) {
> >   			of_node_put(larbnode);
> >   			return -EPROBE_DEFER;
> 
> if plarbdev is null doesn't that mean that the device does not exist?

This is probe function, Is it possible the platform device is not ready
at this time?

I checked the platform device should be created at:

of_platform_default_populate_init:  arch_initcall_sync
  ->of_platform_populate
      ->of_platform_device_create_pdata

Not sure if this may be delayed for some device. If not, it should be
ENODEV here.

> so we should return -ENODEV in that case?
> 
> thanks,
> Dafna
> 
> >   		}
> > diff --git a/drivers/iommu/mtk_iommu_v1.c
> > b/drivers/iommu/mtk_iommu_v1.c
> > index 1467ba1e4417..4d7809432239 100644
> > --- a/drivers/iommu/mtk_iommu_v1.c
> > +++ b/drivers/iommu/mtk_iommu_v1.c
> > @@ -602,7 +602,7 @@ static int mtk_iommu_probe(struct
> > platform_device *pdev)
> >   		}
> >   
> >   		plarbdev = of_find_device_by_node(larbnode);
> > -		if (!plarbdev) {
> > +		if (!plarbdev || !plarbdev->dev.driver) {
> >   			of_node_put(larbnode);
> >   			return -EPROBE_DEFER;
> >   		}
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
