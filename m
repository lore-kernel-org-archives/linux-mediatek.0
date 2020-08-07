Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BD8C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 02:15:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6E07221E4
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 02:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1ZOT7pnI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="l+RBTv0D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6E07221E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hlYXDxB7hnosfe470YXc8GcxBEjX3UeYA1KK+qq4vUM=; b=1ZOT7pnI7M3nvRPVOnuv1w4iX
	V6VRY7s1rgX9EGdsIEa+chCLwxiJNA7U2Kqk0AaIQMXKHCm4JovWdrxCRZaeCS1Ub1SXt7dKOQmoO
	urU6on89pWu3HCkOwNBTWzNADQ1Bpnw9dw6wZYW8kxormdnfoltrXy6LTm0kQlUEoj4f7auhWG7yN
	sxEVFIWZN4KzkaOaL+JhrkQusSgjj7qfcFVlV8nKCW7PFLAXCZatpjkzeo0HiLgTC3UEGAEZ7Y8Bi
	ZBqAMYcbIHA/YVg1ACEUwBoTVDlSOK6/nKIjKYMqgfyzGdeJE9L4G7k5YXKIUKGQq/n9XJLws4CcJ
	sMEPatqaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3ruP-0006mo-Ag; Fri, 07 Aug 2020 02:15:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3ruL-0006lM-O7; Fri, 07 Aug 2020 02:14:59 +0000
X-UUID: 670f058df33a4e22aae4c82da28ba5d3-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JxLw+a2yeVjmglZikNxU8lr4nwwrSEYeYUL+KumKsqM=; 
 b=l+RBTv0DOOwABLyn0zkSWQ6GJ8dp+dHQh7jy9o88huP1ezHtZpswiLi4IS6t4vysNZ3WnZKAvzeNm7F802Tn6tFz46iVrVweOsEmPLJoiGwUNaSjp3nP/tDKZjsI5aWJLvV3pUwt8nCMcYo6yO6JDhwUjkc3ieKHgRLZceEKWfA=;
X-UUID: 670f058df33a4e22aae4c82da28ba5d3-20200806
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1862859217; Thu, 06 Aug 2020 18:14:47 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 19:14:46 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 7 Aug 2020 10:14:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 Aug 2020 10:14:41 +0800
Message-ID: <1596766438.18559.4.camel@mhfsdcap03>
Subject: Re: [PATCH 11/21] iommu/mediatek: Add power-domain operation
From: Yong Wu <yong.wu@mediatek.com>
To: chao hao <Chao.Hao@mediatek.com>
Date: Fri, 7 Aug 2020 10:13:58 +0800
In-Reply-To: <1595839778.2350.4.camel@mbjsdccf07>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-12-yong.wu@mediatek.com>
 <1595839778.2350.4.camel@mbjsdccf07>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1FA9D0F3014E9C59CFEAA84127CB84AF86104ADCF9CE47405B4B97E5C86E5DE82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_221457_918594_5404F3D5 
X-CRM114-Status: GOOD (  19.60  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, Nicolas
 Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 chao hao <"Chao. Hao"@mediatek.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will
 Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-27 at 16:49 +0800, chao hao wrote:
> On Sat, 2020-07-11 at 14:48 +0800, Yong Wu wrote:
> > In the previous SoC, the M4U HW is in the EMI power domain which is
> > always on. the latest M4U is in the display power domain which may be
> > turned on/off, thus we have to add pm_runtime interface for it.
> > 
> > we should enable its power before M4U hw initial. and disable it after HW
> > initialize.
> > 
> > When the engine work, the engine always enable the power and clocks for
> > smi-larb/smi-common, then the M4U's power will always be powered on
> > automatically via the device link with smi-common.
> > 
> > Note: we don't enable the M4U power in iommu_map/unmap for tlb flush.
> > If its power already is on, of course it is ok. if the power is off,
> > the main tlb will be reset while M4U power on, thus the tlb flush while
> > m4u power off is unnecessary, just skip it.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>

...

> >  
> >  	if (data->plat_data->m4u_plat == M4U_MT8173) {
> > @@ -728,7 +756,15 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, data);
> >  
> > +	if (dev->pm_domain)
> > +		pm_runtime_enable(dev);
> 
> hi yong,
> 
> If you put "pm_runtime_enable" here, it maybe not device_link with
> smi_common for previous patch: 
> if(i || !pm_runtime_enabled(dev))
>     continue;
> 
> Whether put it up front?

Thanks for review. My fault here. I will fix it.

> 
> best regards,
> chao

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
