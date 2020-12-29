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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00069C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 11:25:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7818207B8
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 11:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7818207B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KMEUueYKYPcQXH9SVs6NGDz3dXv++ZutiW7+dQrspC4=; b=G32H0KMh1N2QgWlA5HbG/q4dC
	UhJf3COjAC3jtJywRoq3LXoAIcJ1lMwX4ak14wzhnXNDNGLMu1JdRHRvDo216AF9AdtduySe/zcaJ
	wzA8Bd9hA5az+pOHId9CLDoWgm0jGQdig/meCfMViIJv+cJiHwdWSuUxusNJROj4e3U9D4czzHy4I
	Me3CHB8KtvbdnN40sQJ+AJCK/4wP/Cj8FPuTVP95JSSkYDB1qfksEIWSxfyWnVhVxsTxlRS0q73E4
	oNDlc3gCZELE1f2JQi+SHkUHmgX3VrN4r6h5RbFq2w5B9FjUWFi4n+4HR5Y1QNi0qDrSRzqt5P4r/
	atYKVMTrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuD7y-0001ED-NR; Tue, 29 Dec 2020 11:25:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuD7w-0001DT-2p; Tue, 29 Dec 2020 11:25:21 +0000
X-UUID: f990dd2d4c6b4e8ca56960877fb2d6fe-20201229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ldY0xu4Bpq6j4mWxH+e0rb8pjBx8nAg1BnDNDsLOWX4=; 
 b=YGvhQ0Elu4AXwy1iTFoSTLSLWdRHx6x61oySoHRkWSjnsugI8RvateOFQqD3WJ85LDKGKJcJTROdfA0LBGEP8yajXResYzWhPrJ47h7iXhsVFZ7LtBEZfIm121vJpFsgG4gfulXymgWpHZjMJeRJGdAK8mJwCevQ09CuegDEhvc=;
X-UUID: f990dd2d4c6b4e8ca56960877fb2d6fe-20201229
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1052632249; Tue, 29 Dec 2020 03:25:17 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Dec 2020 03:25:15 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 29 Dec 2020 19:25:12 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Dec 2020 19:25:12 +0800
Message-ID: <1609241112.26323.299.camel@mhfsdcap03>
Subject: Re: [PATCH v5 16/27] iommu/mediatek: Add device link for smi-common
 and m4u
From: Yong Wu <yong.wu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 29 Dec 2020 19:25:12 +0800
In-Reply-To: <X+L/0E6p9t+a/l5w@chromium.org>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-17-yong.wu@mediatek.com>
 <X+L/0E6p9t+a/l5w@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B7DF2E6AB0CEF4F62DCE00F5D850EE1FFCC5768A5FB62BA86F6C9FE06CF202472000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_062520_316186_28BEC643 
X-CRM114-Status: GOOD (  23.94  )
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

On Wed, 2020-12-23 at 17:29 +0900, Tomasz Figa wrote:
> On Wed, Dec 09, 2020 at 04:00:51PM +0800, Yong Wu wrote:
> > In the lastest SoC, M4U has its special power domain. thus, If the engine
> > begin to work, it should help enable the power for M4U firstly.
> > Currently if the engine work, it always enable the power/clocks for
> > smi-larbs/smi-common. This patch adds device_link for smi-common and M4U.
> > then, if smi-common power is enabled, the M4U power also is powered on
> > automatically.
> > 
> > Normally M4U connect with several smi-larbs and their smi-common always
> > are the same, In this patch it get smi-common dev from the first smi-larb
> > device(i==0), then add the device_link only while m4u has power-domain.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/mtk_iommu.c | 30 ++++++++++++++++++++++++++++--
> >  drivers/iommu/mtk_iommu.h |  1 +
> >  2 files changed, 29 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 09c8c58feb78..5614015e5b96 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/of_irq.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
> >  #include <linux/slab.h>
> >  #include <linux/spinlock.h>
> > @@ -706,7 +707,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >  		return larb_nr;
> >  
> >  	for (i = 0; i < larb_nr; i++) {
> > -		struct device_node *larbnode;
> > +		struct device_node *larbnode, *smicomm_node;
> >  		struct platform_device *plarbdev;
> >  		u32 id;
> >  
> > @@ -732,6 +733,26 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >  
> >  		component_match_add_release(dev, &match, release_of,
> >  					    compare_of, larbnode);
> > +		if (i != 0)
> > +			continue;
> 
> How about using the last larb instead and moving the code below outside
> of the loop?

Of course OK. Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
