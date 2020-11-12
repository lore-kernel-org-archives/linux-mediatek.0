Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35035C388F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 02:42:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F4A12074B
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 02:42:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MWMXZw4Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="t3aUQwDK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F4A12074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y7LvwPPdwruEaBFNZ6m5C935TipcUfDFqMlqy6Nx6rQ=; b=MWMXZw4Q9QK+sL9V6CMq9OPOW
	7qPt1w9/xLKjf9/0LYttRGLgEzAsBua1ipUJCYIiLI+jP1iMnwLcV20f6K2iAH1cPtrqz1WvCNrty
	Lj9mTxGmTFerSw3EXpwqu1t5+DSK3fw5EcTdzwMG+Sp/wkJocM8ZtxzZV3uKt90IrCEuU7fReJW29
	UhU0Uj71IZ8y/5KjJdhxPpzBRUrTjIHLrEFSHk9dtMvuRiSRlYEftkmtAEeP4gIl8UXyG2slGMO2q
	0EyYYITotdWk7h7WEXYTXnTq3LpTPpOzPkHzzrQWe0G4K5tP0ckWPxkqZPuU1TJWy/TsVwRyxZjOm
	elSy5DKTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd2ZJ-0005Nx-Ms; Thu, 12 Nov 2020 02:42:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd2ZB-0005Mn-OY; Thu, 12 Nov 2020 02:42:32 +0000
X-UUID: ae62663088a047c595a611b7f8fb7d99-20201111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2akmVV9MmjilHzebTF46wwbdEe3nnOXuaGxT3mDFxZs=; 
 b=t3aUQwDKGMat90RixAm1dLbb2W+cMm/tbIrsGUguqvmO/EF1OVmINQ0Ljf7tzMUyiT6khzRgclZB9AwgYWj/tfa6hJ0osLbYeTW2lK00oGkmLOU3gD/kMPeCAXeg4F6x0Psdq4kAmFLvMIj0Hl5jsj3gQE2mDqL2zMhzRtXm+4M=;
X-UUID: ae62663088a047c595a611b7f8fb7d99-20201111
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1288387812; Wed, 11 Nov 2020 18:42:23 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 18:42:22 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 12 Nov 2020 10:42:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 Nov 2020 10:42:19 +0800
Message-ID: <1605148938.26323.127.camel@mhfsdcap03>
Subject: Re: [PATCH v4 13/24] iommu/mediatek: Add device link for smi-common
 and m4u
From: Yong Wu <yong.wu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 12 Nov 2020 10:42:18 +0800
In-Reply-To: <CANMq1KBrnhAbGdKbsSmFJWONe-mkG6TJsN_jp2xuJ=4MiPyapQ@mail.gmail.com>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-14-yong.wu@mediatek.com>
 <CANMq1KBrnhAbGdKbsSmFJWONe-mkG6TJsN_jp2xuJ=4MiPyapQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9DD61C76332B6A687D16ACA0116BA587755327AA8BAE00AF0ECEE2DBB83A02B42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_214231_337169_9B9824AD 
X-CRM114-Status: GOOD (  33.00  )
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
Cc: youlin.pei@mediatek.com, Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Tomasz Figa <tfiga@google.com>,
 kernel-team@android.com, Joerg Roedel <joro@8bytes.org>,
 lkml <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Evan Green <evgreen@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 anan.sun@mediatek.com, Greg Kroah-Hartman <gregkh@google.com>,
 Will Deacon <will@kernel.org>, linux-arm
 Mailing List <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-11-12 at 09:10 +0800, Nicolas Boichat wrote:
> On Wed, Nov 11, 2020 at 8:40 PM Yong Wu <yong.wu@mediatek.com> wrote:
> >
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
> >  drivers/iommu/mtk_iommu.c | 36 +++++++++++++++++++++++++++++++++---
> >  drivers/iommu/mtk_iommu.h |  1 +
> >  2 files changed, 34 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index cfdf5ce696fd..4ce7e0883e4d 100644
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
> > @@ -705,7 +706,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >                 return larb_nr;
> >
> >         for (i = 0; i < larb_nr; i++) {
> > -               struct device_node *larbnode;
> > +               struct device_node *larbnode, *smicomm_node;
> >                 struct platform_device *plarbdev;
> >                 u32 id;
> >
> > @@ -731,6 +732,26 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >
> >                 component_match_add_release(dev, &match, release_of,
> >                                             compare_of, larbnode);
> > +               if (!i) {
> 
> Maybe more of a style preference, but since you are actually comparing
> an integer, I prefer seeing i == 0.
> 
> Also, might be nicer to do
> 
> if (i != 0)
>    continue;
> 
> And de-indent the rest.

Thanks. will fix.

> 
> > +                       smicomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
> > +                       if (!smicomm_node)
> > +                               return -EINVAL;
> > +
> > +                       plarbdev = of_find_device_by_node(smicomm_node);
> > +                       of_node_put(smicomm_node);
> > +                       data->smicomm_dev = &plarbdev->dev;
> > +               }
> > +       }
> > +
> > +       if (dev->pm_domain) {
> > +               struct device_link *link;
> > +
> > +               link = device_link_add(data->smicomm_dev, dev,
> > +                                      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> > +               if (!link) {
> > +                       dev_err(dev, "Unable link %s.\n", dev_name(data->smicomm_dev));
> > +                       return -EINVAL;
> > +               }
> >         }
> >
> >         platform_set_drvdata(pdev, data);
> > @@ -738,14 +759,14 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >         ret = iommu_device_sysfs_add(&data->iommu, dev, NULL,
> >                                      "mtk-iommu.%pa", &ioaddr);
> >         if (ret)
> > -               return ret;
> > +               goto out_link_remove;
> >
> >         iommu_device_set_ops(&data->iommu, &mtk_iommu_ops);
> >         iommu_device_set_fwnode(&data->iommu, &pdev->dev.of_node->fwnode);
> >
> >         ret = iommu_device_register(&data->iommu);
> >         if (ret)
> > -               return ret;
> > +               goto out_sysfs_remove;
> 
> Technically, this change is unrelated.

Sharp eye. Right. I thought it was small enough to squash here.

I will use a new patch to fix this(add fixes tag, and no need add
cc-stable I think.).

> 
> >
> >         spin_lock_init(&data->tlb_lock);
> >         list_add_tail(&data->list, &m4ulist);
> > @@ -754,6 +775,13 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >                 bus_set_iommu(&platform_bus_type, &mtk_iommu_ops);
> >
> >         return component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
> > +
> > +out_sysfs_remove:
> > +       iommu_device_sysfs_remove(&data->iommu);
> > +out_link_remove:
> > +       if (dev->pm_domain)
> > +               device_link_remove(data->smicomm_dev, dev);
> > +       return ret;
> >  }
> >
> >  static int mtk_iommu_remove(struct platform_device *pdev)
> > @@ -767,6 +795,8 @@ static int mtk_iommu_remove(struct platform_device *pdev)
> >                 bus_set_iommu(&platform_bus_type, NULL);
> >
> >         clk_disable_unprepare(data->bclk);
> > +       if (pdev->dev.pm_domain)
> > +               device_link_remove(data->smicomm_dev, &pdev->dev);
> >         devm_free_irq(&pdev->dev, data->irq, data);
> >         component_master_del(&pdev->dev, &mtk_iommu_com_ops);
> >         return 0;
> > diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> > index d0c93652bdbe..5e03a029c4dc 100644
> > --- a/drivers/iommu/mtk_iommu.h
> > +++ b/drivers/iommu/mtk_iommu.h
> > @@ -68,6 +68,7 @@ struct mtk_iommu_data {
> >
> >         struct iommu_device             iommu;
> >         const struct mtk_iommu_plat_data *plat_data;
> > +       struct device                   *smicomm_dev;
> >
> >         struct dma_iommu_mapping        *mapping; /* For mtk_iommu_v1.c */
> >
> > --
> > 2.18.0
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
