Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E5BC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 10:05:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9D4361955
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 10:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9D4361955
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lSrdCP9/WgUJwI43OqwtiEe1ak7peh/eJeaLAgJNRbw=; b=E3RxhW64O9jChX
	6DfmAlHhc/ekIPvfO2j9THfJWad7qRsKeywiHFlYSs3uWQwm9Ol+H8YJ/HVDAOYxvVgeMJ7ro974x
	0EOMsI8AhIExAQkXWOll+N0fNxOTbZrmuLE1Z15HT5Setwxv7uikxcnAGsWxt3ozcu8wbPo9P/FvU
	Otv3k0biRPRIcsBZAUvGx8KIJ19PZfGcOoifqI7ZDChFIgSgPbyNwdJMI4k5OweWmSZUQmaMtwoXB
	FiVevA5NP+3VoJ36GdWw0FQSMNivJvcC1wo1drB3pWbwjHYJU4UJYnbAL9JbrMwd1eeLLznqOEf5A
	t7ZIijoZlPRTKv183uPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1Qty-00GYJO-D6; Thu, 08 Jul 2021 10:05:02 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1Qtv-00GYHM-S5
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 10:05:01 +0000
Received: by mail-il1-x12f.google.com with SMTP id z1so6125669ils.0
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 03:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5IYDrTEMCDwnKyJ3pPqsfquwkNIQ3KZz5NeM09+NirQ=;
 b=WT0IEe21WXTnQTiqpmOB+Z7yiM37k35gUjaW8q23hwFIywW2R2O7AFYBYWpcVr/+Es
 YmKVFiMUfMAiwklQ2WYfEOX+1AzVmj9HIlAtY5tP3B/D370620P9O8uqI4w7idZcoJzb
 mFD6oAx2w9DekQ0F48e2kH5ZJzTFTxb41fXfnwqRcmracyx6S+h4KwMD8p/N1Qb7aOlr
 QM0+8o+Ciq5rgy6rSpW62cXas0FgzJvkZrwnmnyZkccPk8Z7zXjQl4SSv+4PEgROGeqW
 UULK4pSaFMwqw6SHGqyAPdwIusNrevhgnIybsjDnZmKlBwOvpBQMvDoGL7ssMgG/5joI
 iBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5IYDrTEMCDwnKyJ3pPqsfquwkNIQ3KZz5NeM09+NirQ=;
 b=mbPQIO7dOfbPl5W0jsqo61o1AzHEPlwDwqCKoh08uJ86v6bsOBWkCkY5l2QEXJ0j9p
 vxNeXs1ESf7B8mIogWqQ4JtpbnzDGeTM68KhS22/m+81WSaW9mVQnWXxBM51tDcHpQyg
 D9+wAAbh8nmK9v79b3RYk7LmDw+gzZS6uzpILCXL4/oz4LY7wlaruhOUDGDVEn2hfCwf
 nWRpwyXJE24Q+vmw1G8584ZFSP9F3KuSvLn5WrhU2cKT5T7tPeizTKvcqa/q1GwsPuMK
 NMhyKhwAL9dNG5OIi6THMv0uSXIe7Yn4+tp+cKFCiZ1azYOKQRmbxN6kcM+UZB8pbcyH
 +p5g==
X-Gm-Message-State: AOAM531/ttxSVnD3j92o06xY2J8DI+q9VRDmqaYBNtmqkWz6+aYKSIYY
 8oLdzehwPtDhLvTCrmc0NG98ttUjs/4vKjUWDtMUIA==
X-Google-Smtp-Source: ABdhPJykFqOjvbJ+tFHq+BR1iCn1BjA6c7p322S2tesr3rVOsU1F53n/ypS9lwQRgEvCQ2UtyFJ6k21/OShkUAaPpd8=
X-Received: by 2002:a92:de12:: with SMTP id x18mr21843666ilm.302.1625738697789; 
 Thu, 08 Jul 2021 03:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
 <20210707062157.21176-4-yunfei.dong@mediatek.com>
In-Reply-To: <20210707062157.21176-4-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 8 Jul 2021 18:04:46 +0800
Message-ID: <CA+Px+wX+mT5fzJegoPc=4RRowVQ9PSievqMn+-20vTvmy6Dq2A@mail.gmail.com>
Subject: Re: [PATCH v1, 03/14] media: mtk-vcodec: Use component framework to
 manage each hardware information
To: Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_030459_922104_8C3FEDCB 
X-CRM114-Status: GOOD (  27.65  )
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

On Wed, Jul 7, 2021 at 2:22 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> +#include "mtk_vcodec_util.h"
> +
>  #include <media/videobuf2-core.h>
> +#include <media/v4l2-ctrls.h>
>  #include <media/v4l2-mem2mem.h>
The changes look like independent ones.  If any .c files need the
headers, include them in the .c files instead of here.

> +               comp_node = of_find_compatible_node(NULL, NULL,
> +                       mtk_vdec_drv_ids[i].compatible);
> +               if (!comp_node)
> +                       continue;
> +
> +               if (!of_device_is_available(comp_node)) {
> +                       of_node_put(comp_node);
> +                       dev_err(&pdev->dev, "Fail to get MMSYS node\n");
> +                       continue;
> +               }
> +
> +               of_id = of_match_node(mtk_vdec_drv_ids, comp_node);
> +               if (!of_id) {
Doesn't it need to call of_node_put(comp_node)?

> +static int mtk_vcodec_init_master(struct mtk_vcodec_dev *dev)
> +{
> +       struct platform_device *pdev = dev->plat_dev;
> +       struct component_match *match;
> +       int ret = 0;
ret doesn't need to be initialized.

> +       match = mtk_vcodec_match_add(dev);
> +       if (IS_ERR_OR_NULL(match))
> +               return -EINVAL;
> +
> +       platform_set_drvdata(pdev, dev);
Why does platform_set_drvdata() need to be here?  The function neither
creates pdev nor dev.

> +static int mtk_vcodec_init_dec_params(struct mtk_vcodec_dev *dev)
> +{
> +       struct platform_device *pdev = dev->plat_dev;
> +       struct resource *res;
> +       int ret = 0;
ret doesn't need to be initialized.

> +       if (!dev->is_support_comp) {
> +               res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +               if (res == NULL) {
!res, res is not used BTW.

> +               dev->dec_irq = platform_get_irq(dev->plat_dev, 0);
Check return value.

> +               irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
> +               ret = devm_request_irq(&pdev->dev, dev->dec_irq,
> +                               mtk_vcodec_dec_irq_handler, 0, pdev->name, dev);
> +               if (ret) {
> +                       dev_err(&pdev->dev, "failed to install dev->dec_irq %d (%d)",
> +                               dev->dec_irq,
> +                               ret);
Can join to previous line.

> +       if (!of_find_compatible_node(NULL, NULL, "mediatek,mtk-vcodec-core"))
> +               dev->is_support_comp = false;
> +       else
> +               dev->is_support_comp = true;
Need a DT binding document patch for the attribute.

Does it really need to call of_find_compatible_node() for parsing an
attribute?  If so, it needs to call of_node_put() afterward.

> @@ -319,7 +434,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>                 MTK_VCODEC_DEC_NAME);
>         video_set_drvdata(vfd_dec, dev);
>         dev->vfd_dec = vfd_dec;
> -       platform_set_drvdata(pdev, dev);
Why does it need to remove platform_set_drvdata()?

> @@ -370,8 +484,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>         mtk_v4l2_debug(0, "decoder registered as /dev/video%d",
>                 vfd_dec->num);
>
> -       return 0;
> +       if (dev->is_support_comp) {
> +               ret = mtk_vcodec_init_master(dev);
> +               if (ret < 0)
> +                       goto err_component_match;
> +       } else {
> +               platform_set_drvdata(pdev, dev);
> +       }
mtk_vcodec_init_master() also calls platform_set_drvdata().  What is
the difference?

> +       /* clear interrupt */
> +       writel((readl(vdec_misc_addr) | VDEC_IRQ_CFG), vdec_misc_addr);
> +       writel((readl(vdec_misc_addr) & ~VDEC_IRQ_CLR), vdec_misc_addr);
Can remove 1 parenthese pair.

> +static int mtk_vdec_comp_probe(struct platform_device *pdev)
> +{
> +       struct mtk_vdec_comp_dev *dev;
> +       int ret;
> +
> +       dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +       if (!dev)
> +               return -ENOMEM;
> +
> +       dev->plat_dev = pdev;
> +       spin_lock_init(&dev->irqlock);
> +
> +       ret = mtk_vcodec_init_dec_pm(dev->plat_dev, &dev->pm);
To be concise, use pdev.

> +       dev->reg_base[VDEC_COMP_MISC] =
> +               devm_platform_ioremap_resource(pdev, 0);
Confusing about the index 0, where:
VDEC_COMP_SYS = 0
VDEC_COMP_MISC = 1

> +#ifndef _MTK_VCODEC_DEC_HW_H_
> +#define _MTK_VCODEC_DEC_HW_H_
> +
> +#include <linux/component.h>
Does it really need to include component.h?

> +/**
> + * enum mtk_comp_hw_reg_idx - component register base index
> + */
> +enum mtk_comp_hw_reg_idx {
> +       VDEC_COMP_SYS,
> +       VDEC_COMP_MISC,
> +       NUM_MAX_COMP_VCODEC_REG_BASE
The name is suboptimal.  How about VDEC_COMP_MAX or VDEC_COMP_LAST?

> +#include <linux/component.h>
> +#include <linux/io.h>
>  #include <linux/platform_device.h>
>  #include <linux/videodev2.h>
>  #include <media/v4l2-ctrls.h>
The newly added code in the file doesn't look like it needs anything
from component.h and io.h.

> @@ -404,6 +422,7 @@ struct mtk_vcodec_enc_pdata {
>   *
>   * @fw_handler: used to communicate with the firmware.
>   * @id_counter: used to identify current opened instance
> + * @is_support_comp: 1: using compoent framework, 0: not support
is_support_comp is a boolean.  Use true and false instead of 1 and 0.

> @@ -422,6 +441,10 @@ struct mtk_vcodec_enc_pdata {
>   * @pm: power management control
>   * @dec_capability: used to identify decode capability, ex: 4k
>   * @enc_capability: used to identify encode capability
> + *
> + * comp_dev: component hardware device
> + * component_node: component node
> + * comp_idx: component index
To be neat, missing "@" before each symbol name.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
