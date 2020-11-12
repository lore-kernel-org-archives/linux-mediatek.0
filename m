Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA70FC388F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 01:11:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78C6A20678
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 01:11:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pLmln7I4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kDnlXe7t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78C6A20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wXN+brPWNKalAD/drLW1Ymzpw23i410tjtoLErBy50Q=; b=pLmln7I4Hpj0Bt+uUhNqOQP2j
	aIGCVhnCGHRqtuDdwQxffUxnSOwEYAw1hjo64s5QgaFfCZ7H4tZBqKluFJ+jx7aMHGnTwsdl4il7Q
	lvrC7B6o+Yfm//6BxZpv5J2RNGdO99WEYKmorZgTEV5Vu6SlGlRkBZlCmCE6JaqWMkPnt2DQ3Nltd
	A5G4pN1hZo6u7I3j2vUorOeeYWQiBPrpWErxq93LEb8mIq+a9c7uWJeKIIY9nOfZCxwguGmLAqagG
	GKMizPiguvevyLGjb/4xU0DF7PNhRdrnxuCJtQvYJNtG5Xsi2pda/zxIi13xiALUlDVCaiiSpYmyU
	tpFaTGZyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd18k-0006UY-5V; Thu, 12 Nov 2020 01:11:06 +0000
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd18g-0006TJ-G1
 for linux-mediatek@lists.infradead.org; Thu, 12 Nov 2020 01:11:03 +0000
Received: by mail-vk1-xa44.google.com with SMTP id s135so949048vkh.6
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2020 17:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jz5kAZbrArqI0Wtmw+vtyP3p8jdhel21wmv2CFUUROo=;
 b=kDnlXe7tyEixWf+480/PTLTVkBUYGbtBisgVqL6qcQgy4sPKvzTV6/tSw83j47RD7q
 Rf9VAXW9kIm4P+pX/HXhGKwX9LVFIVmcuHv/6Jag9gPlQcBFdbxZcRC33/54CUyQozsU
 NIphtyIs1Otvd9bO8oM70co0kkF3ZZXDKONwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jz5kAZbrArqI0Wtmw+vtyP3p8jdhel21wmv2CFUUROo=;
 b=ZmkgVRTecna0dz2Jeb+snc2jXwxv8eqTyvsdD6FooKZODuxpxsMtsqggOqtnLvqKj/
 3jswxllwOltj1fBwniT7i1dobJJ5QWqkLCZtL+Sc55zUnBIQ03S9sG450vmViDIEMKds
 1oR7hGq6F6U4UW5IIYchzeR3/+se1+9Ap8XdWZleNID7WUuRPf30xfq2q42fxAQdsHG7
 eJA8A4KrP/EUsYJ/YhBEul07tiFTiduuxqBOB8/31rJ8fYDQ0GDnbaI+mx0wjHcxo5Vk
 Orp7bSeD3LBi2Vq6jJ/wWi3WzfXrUDuCbeVEu6/2EAl6MBxDO5JSobi8vhLh5Nt7F3Kg
 +lOQ==
X-Gm-Message-State: AOAM533TENAAgj+8KcZYxW+tQ5O4Ddsq8WxCX4suhJkDh63b5XsIIZlr
 ppROUuWsG1k5aP/VRwfJ+CA1jLP/cN2Oq4BPSwYoqA==
X-Google-Smtp-Source: ABdhPJw+9rZ4nbhsdwX6zx9uimjIrtTve1brVMfTJF95tCZp/3u+DvsL8qx0usBjUpgCHUXOc17+xjTd7E+Sg/oGTEc=
X-Received: by 2002:a1f:cd07:: with SMTP id d7mr16387452vkg.10.1605143459607; 
 Wed, 11 Nov 2020 17:10:59 -0800 (PST)
MIME-Version: 1.0
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-14-yong.wu@mediatek.com>
In-Reply-To: <20201111123838.15682-14-yong.wu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 12 Nov 2020 09:10:49 +0800
Message-ID: <CANMq1KBrnhAbGdKbsSmFJWONe-mkG6TJsN_jp2xuJ=4MiPyapQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/24] iommu/mediatek: Add device link for smi-common
 and m4u
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_201102_644256_8F68FC76 
X-CRM114-Status: GOOD (  24.75  )
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
 Greg Kroah-Hartman <gregkh@google.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, chao.hao@mediatek.com,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 lkml <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Evan Green <evgreen@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel-team@android.com, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 11, 2020 at 8:40 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> In the lastest SoC, M4U has its special power domain. thus, If the engine
> begin to work, it should help enable the power for M4U firstly.
> Currently if the engine work, it always enable the power/clocks for
> smi-larbs/smi-common. This patch adds device_link for smi-common and M4U.
> then, if smi-common power is enabled, the M4U power also is powered on
> automatically.
>
> Normally M4U connect with several smi-larbs and their smi-common always
> are the same, In this patch it get smi-common dev from the first smi-larb
> device(i==0), then add the device_link only while m4u has power-domain.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 36 +++++++++++++++++++++++++++++++++---
>  drivers/iommu/mtk_iommu.h |  1 +
>  2 files changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index cfdf5ce696fd..4ce7e0883e4d 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -20,6 +20,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> @@ -705,7 +706,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>                 return larb_nr;
>
>         for (i = 0; i < larb_nr; i++) {
> -               struct device_node *larbnode;
> +               struct device_node *larbnode, *smicomm_node;
>                 struct platform_device *plarbdev;
>                 u32 id;
>
> @@ -731,6 +732,26 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>
>                 component_match_add_release(dev, &match, release_of,
>                                             compare_of, larbnode);
> +               if (!i) {

Maybe more of a style preference, but since you are actually comparing
an integer, I prefer seeing i == 0.

Also, might be nicer to do

if (i != 0)
   continue;

And de-indent the rest.

> +                       smicomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
> +                       if (!smicomm_node)
> +                               return -EINVAL;
> +
> +                       plarbdev = of_find_device_by_node(smicomm_node);
> +                       of_node_put(smicomm_node);
> +                       data->smicomm_dev = &plarbdev->dev;
> +               }
> +       }
> +
> +       if (dev->pm_domain) {
> +               struct device_link *link;
> +
> +               link = device_link_add(data->smicomm_dev, dev,
> +                                      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> +               if (!link) {
> +                       dev_err(dev, "Unable link %s.\n", dev_name(data->smicomm_dev));
> +                       return -EINVAL;
> +               }
>         }
>
>         platform_set_drvdata(pdev, data);
> @@ -738,14 +759,14 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>         ret = iommu_device_sysfs_add(&data->iommu, dev, NULL,
>                                      "mtk-iommu.%pa", &ioaddr);
>         if (ret)
> -               return ret;
> +               goto out_link_remove;
>
>         iommu_device_set_ops(&data->iommu, &mtk_iommu_ops);
>         iommu_device_set_fwnode(&data->iommu, &pdev->dev.of_node->fwnode);
>
>         ret = iommu_device_register(&data->iommu);
>         if (ret)
> -               return ret;
> +               goto out_sysfs_remove;

Technically, this change is unrelated.

>
>         spin_lock_init(&data->tlb_lock);
>         list_add_tail(&data->list, &m4ulist);
> @@ -754,6 +775,13 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>                 bus_set_iommu(&platform_bus_type, &mtk_iommu_ops);
>
>         return component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
> +
> +out_sysfs_remove:
> +       iommu_device_sysfs_remove(&data->iommu);
> +out_link_remove:
> +       if (dev->pm_domain)
> +               device_link_remove(data->smicomm_dev, dev);
> +       return ret;
>  }
>
>  static int mtk_iommu_remove(struct platform_device *pdev)
> @@ -767,6 +795,8 @@ static int mtk_iommu_remove(struct platform_device *pdev)
>                 bus_set_iommu(&platform_bus_type, NULL);
>
>         clk_disable_unprepare(data->bclk);
> +       if (pdev->dev.pm_domain)
> +               device_link_remove(data->smicomm_dev, &pdev->dev);
>         devm_free_irq(&pdev->dev, data->irq, data);
>         component_master_del(&pdev->dev, &mtk_iommu_com_ops);
>         return 0;
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index d0c93652bdbe..5e03a029c4dc 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -68,6 +68,7 @@ struct mtk_iommu_data {
>
>         struct iommu_device             iommu;
>         const struct mtk_iommu_plat_data *plat_data;
> +       struct device                   *smicomm_dev;
>
>         struct dma_iommu_mapping        *mapping; /* For mtk_iommu_v1.c */
>
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
