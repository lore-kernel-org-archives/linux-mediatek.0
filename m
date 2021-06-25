Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF29C49EAF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:14:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F08B6142D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F08B6142D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oVazZwtBs1W6U1a8Br0LyHHbDpUVtvHSxaQ/OHxp7GY=; b=DlgQ5dbfs9IQ5X
	kQK27vCToaF9q5oO6Vb6JFYstJja1ubakjBC4WToYJRWJJUpO+VtPHE7DksR1d+Voh46phj7X18+4
	SXdaFJOmVXC7lBNrLP7K5LsS2ymN154I/67iJTSQXTsD1Bxv8sYfrX5Ai9ST/rFmBG4+HbX382Sez
	ZNoAmMFKVd9cM995CBFyS3HGHIlH/xW1Wm1b2Vo1cLHTDILuqviSkUToiBn5MpGsUbhDd29HoEJQr
	f2zbZpNYnSB7VWpjG4jUo0/zEAT09vs6Pe9PVg/agRpojKHKw1f8mayvRtOpWIb1pF1bJb2QajSMN
	voRU4w2x51bW+nuHpTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwirI-000tGn-MW; Fri, 25 Jun 2021 10:14:48 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwhz0-000cRl-Pk
 for linux-mediatek@lists.infradead.org; Fri, 25 Jun 2021 09:18:45 +0000
Received: by mail-io1-xd31.google.com with SMTP id g22so11823602iom.1
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Jun 2021 02:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LBMCAr9OKqALolsPvG/hgiqJf+IHkCzRrkHtVCzFpxE=;
 b=ob50Ex0HjQCoOkMNVmluHAgAaQH9NhdOoxgXaIDEsZdgEj7hY/1X11UkiuHjGffdxk
 UP13uAbtMSWwmFK1P0n0L4uXFzeez19ofKRm0p6d5YI7/wV/Whk8PZPQFO8d5eZYu14C
 9SAox7Kb/sy+kEsApd65BjGP5Ib6vlXhRsgLNTCM+ifOxdmWgSWujpy9laQRpODdbQSD
 SXOiAl3qc674P5MV4pgtxMnkl3p1q0B/uQukjrX0EEJHWS9O6TWx1LYPR/g/aIh4UId9
 HA9LGwivz2oJZoXaRmNJF8oLWjdfhmVkM0c7n9IlSSMppDE2IJvr6KNq2ZiZ+Bf3O1AM
 P3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LBMCAr9OKqALolsPvG/hgiqJf+IHkCzRrkHtVCzFpxE=;
 b=HFN3cWm1QMXZVeFmMa8Oi2ON48fuHxMKAjC5vp9fQ9a/324DyAXpcvbGzUK62xRYta
 4baEff4paeKOc11rRu+E1v7gygt7ywUSV6wTpPF+rXL8PLdr/7c3rxjoPomRPm2lEa/9
 7yxEvjFc5FjmdxgzdA9sQR8L4GKncHYOwsNhJRXWfCnVzNY2kVZ7N4Ocnug2fowTHVpN
 lIbPPVBcJlQgSduHEj4GoMMmTmV0WUyJ4zU/oM4MDe+sr1CRWU2hStrIS+3xsSlRrP5o
 L8lfV19Os2vflE/xxc0pcNOtvYXxLExLw9inR1fC7gyuOjHhcqHpHKkI+KPyfofVd+dl
 EfRQ==
X-Gm-Message-State: AOAM532vkHvLrUY38TJkMPKgO/PXX0Q9FCHqL+QpWd70S23Txe8YjYMx
 fo+kQ5IPMdbi1ICh/0ioxSrUUmar0TfWpRy5XgiR7Q==
X-Google-Smtp-Source: ABdhPJzXQKU1EzX4BFVg8dVoXcM3fiNW3KrSUfOxXlDn19TSDuB4Lacx66wn42utjbq8sAVkmPvRuUGazUTUoMbdXsg=
X-Received: by 2002:a6b:6209:: with SMTP id f9mr7971317iog.109.1624612721478; 
 Fri, 25 Jun 2021 02:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <1624428350-1424-1-git-send-email-kyrie.wu@mediatek.com>
 <1624428350-1424-3-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1624428350-1424-3-git-send-email-kyrie.wu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 25 Jun 2021 17:18:30 +0800
Message-ID: <CA+Px+wW89v3micrkgNDvxGAad4P+JfRHKnLdPN__qVrV3i-j+w@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: mtk-jpegenc: use component framework to manage
 jpg HW
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Rick Chang <rick.chang@mediatek.com>, 
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>, 
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_021842_943743_492348E6 
X-CRM114-Status: GOOD (  29.48  )
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

On Wed, Jun 23, 2021 at 2:06 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> Mtk jpeg encoder has several hardware, one HW may register a device
> node; use component framework to manage jpg HW device node,
> in this case, one device node could represent all jpg HW.
Can roughly understand.  But could you rephrase your sentences?

>  #include <media/videobuf2-core.h>
>  #include <media/videobuf2-dma-contig.h>
>  #include <soc/mediatek/smi.h>
> +#include <linux/component.h>
Maintain the alphabetical order.

> +void mtk_jpeg_put_buf(struct mtk_jpeg_dev *jpeg)
> +{
> +       struct mtk_jpeg_ctx *ctx = NULL;
> +       struct vb2_v4l2_buffer *dst_buffer = NULL;
> +       struct list_head *temp_entry = NULL;
> +       struct list_head *pos = NULL;
> +       struct mtk_jpeg_src_buf *dst_done_buf = NULL, *tmp_dst_done_buf = NULL;
Remove the initialization if they don't need to.

> +       unsigned long flags;
> +
> +       ctx = jpeg->hw_param.curr_ctx;
> +       if (!ctx) {
> +               pr_err("%s : %d, comp_jpeg ctx fail !!!\n", __func__, __LINE__);
Use dev_err().

> +               return;
> +       }
> +
> +       dst_buffer = jpeg->hw_param.dst_buffer;
> +       if (!dst_buffer) {
> +               pr_err("%s : %d, comp_jpeg dst_buffer fail !!!\n",
> +                      __func__, __LINE__);
Use dev_err().

> +       if (!(irq_status & JPEG_ENC_INT_STATUS_DONE)) {
> +               pr_err("%s : %d, jpeg encode failed\n", __func__, __LINE__);
Use dev_err().

> +void mtk_jpegenc_timeout_work(struct work_struct *work)
> +{
> +       struct mtk_jpeg_dev *jpeg = container_of(work, struct mtk_jpeg_dev,
> +               job_timeout_work.work);
> +       struct mtk_jpeg_ctx *ctx = NULL;
It doesn't need to initialize.

> +static  const struct of_device_id mtk_jpegenc_drv_ids[] = {
Remove the extra space between "static" and "const".

> +       {
> +               .compatible = "mediatek,mt8195-jpgenc0",
> +               .data = (void *)MTK_JPEGENC_HW0,
> +       },
> +       {
> +               .compatible = "mediatek,mt8195-jpgenc1",
> +               .data = (void *)MTK_JPEGENC_HW1,
> +       },
Using compatible strings to separate them doesn't sound like a scalable method.

>  #include <linux/kernel.h>
>  #include <media/videobuf2-core.h>
>  #include <media/videobuf2-dma-contig.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/slab.h>
> +#include <linux/component.h>
> +#include <linux/clk.h>
> +#include <linux/pm_runtime.h>
Maintain the alphabetical order.

>  #include "mtk_jpeg_enc_hw.h"
> +#include "mtk_jpeg_core.h"
Maintain the alphabetical order.

> +int mtk_jpegenc_init_pm(struct mtk_jpeg_dev *mtkdev)
> +{
> +       struct platform_device *pdev;
> +       struct mtk_jpegenc_pm *pm;
> +       struct mtk_jpegenc_clk *jpegenc_clk;
> +       struct mtk_jpegenc_clk_info *clk_info;
> +       int i = 0, ret = 0;
They don't need to initialize.

> +       pdev = mtkdev->plat_dev;
> +       pm = &mtkdev->pm;
To be concise, can inline to above when declaring the variables.

> +       jpegenc_clk->clk_num =
> +               of_property_count_strings(pdev->dev.of_node, "clock-names");
> +       if (jpegenc_clk->clk_num > 0) {
> +               jpegenc_clk->clk_info = devm_kcalloc(&pdev->dev,
> +                                                    jpegenc_clk->clk_num,
> +                                                    sizeof(*clk_info),
> +                                                    GFP_KERNEL);
> +               if (!jpegenc_clk->clk_info)
> +                       return -ENOMEM;
> +       } else {
> +               pr_err("Failed to get jpegenc clock count\n");
Use dev_err().
> +               return -EINVAL;
> +       }
Would prefer the block turn to be:

if (... <= 0) {
    ...
    return -EINVAL;
}

... = devm_kcalloc(...);
if (!...)
    return -ENOMEM;

> +       for (i = 0; i < jpegenc_clk->clk_num; i++) {
> +               clk_info = &jpegenc_clk->clk_info[i];
> +               ret = of_property_read_string_index(pdev->dev.of_node,
> +                                                   "clock-names", i,
> +                                                   &clk_info->clk_name);
> +               if (ret) {
> +                       pr_err("Failed to get jpegenc clock name id = %d", i);
Use dev_err().

> +                       return ret;
> +               }
> +
> +               clk_info->jpegenc_clk = devm_clk_get(&pdev->dev,
> +                                                    clk_info->clk_name);
> +               if (IS_ERR(clk_info->jpegenc_clk)) {
> +                       pr_err("devm_clk_get (%d)%s fail",
> +                              i, clk_info->clk_name);
Use dev_err().

> +       pm_runtime_enable(&pdev->dev);
> +       return ret;
return 0;

> +void mtk_jpegenc_release_pm(struct mtk_jpeg_dev *dev)
> +{
> +       pm_runtime_disable(dev->pm.dev);
> +}
Would prefer this function to be more "symmetric" to mtk_jpegenc_init_pm().

For example:

void mtk_jpegenc_release_pm(struct mtk_jpeg_dev *mtkdev)
{
    struct platform_device *pdev = mtkdev->plat_dev;
    pm_runtime_disable(&pdev->dev);
}

That way, it doesn't rely on whether mtkdev->pm is set or not.

> +       ret = devm_request_irq(&pdev->dev, dev->jpegenc_irq,
> +                              irq_handler, 0, pdev->name, dev);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to install dev->jpegenc_irq %d (%d)",
> +                       dev->jpegenc_irq, ret);
> +
> +               return -ENOENT;
How about just returning ret?

> +       }
> +
> +       //disable_irq(dev->jpegenc_irq);
Remove it.

> +       ret = component_add(&pdev->dev, &mtk_jpegenc_hw_component_ops);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to component_add: %d\n", ret);
> +               goto err;
> +       }
How about just returning component_add(...)?

> +err:
> +       mtk_jpegenc_release_pm(dev);
Would expect the platform driver to have a .remove() callback and
invoke the mtk_jpegenc_release_pm() too.

> +static const struct of_device_id mtk_jpegenc_hw_ids[] = {
> +       {
> +               .compatible = "mediatek,mt8195-jpgenc0",
> +               .data = mtk_jpegenc_hw_irq_handler,
> +       },
> +       {       .compatible = "mediatek,mt8195-jpgenc1",
> +               .data = mtk_jpegenc_hw_irq_handler,
> +       },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_jpegenc_hw_ids);
Had the same concern in dt-bindings patch.  Does it really need
multiple compatible strings to separate?

Also, the block should guard by using CONFIG_OF.

> +struct platform_driver mtk_jpegenc_hw_driver = {
> +       .probe  = mtk_jpegenc_hw_probe,
> +       .driver = {
> +               .name   = "mtk-jpegenc-hw",
> +               .of_match_table = mtk_jpegenc_hw_ids,
Should guard by using of_match_ptr().


Hi, after reading the patch for a while, I realized it is way too big
to me so that I didn't go through too much detail (especially the
component framework part).  Could you further divide the series into
smaller pieces?  For example:
- part i. refactor to make modifying code easier
- part ii. leverage component framework
- part iii. add new code for MT8195
I would expect part i and ii don't change the original behavior.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
