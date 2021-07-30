Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCD3C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 09:34:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59266603E9
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 09:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59266603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fYpUAdkwyonB4z6XJOfcrbmX0bmXLc7Qc9Hi3gm4es=; b=azp4GtOOhfl8SM
	3L4mY7WT0hBXpNNwOtYW8hLpKuNqjiKZA5gzC/k0gpgrxtvJ8XJoDzKFF1LfSXKBwPwQMD7JLHXTl
	Jq3vbGcVCHnZVRALjIEZwr5EzA74jGsjV6tBIApaN79TF6/yoRX/jRyywd6KTyI4yjgcXlV1lN2f5
	hISPrkJSwLm4qS9g4SrFQAlbkipL+WbtStjzu6oVD38RBrJP1pPdqi3NQKzq5uVBKnnj/nyfQr4Gf
	tQa0/mHSNaEL+P7sPTto8lzkMGoic+AzIaB+8euZLd3XsM/BMHkIKXgskseEyaUw7S0pso3NoGT9e
	vPp+/prMjZFQMmvTcMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Oto-007uR8-A9; Fri, 30 Jul 2021 09:33:48 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Osn-007u1Z-DO
 for linux-mediatek@lists.infradead.org; Fri, 30 Jul 2021 09:32:49 +0000
Received: by mail-io1-xd30.google.com with SMTP id f6so4834161ioc.6
 for <linux-mediatek@lists.infradead.org>; Fri, 30 Jul 2021 02:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z+HszHCjicRVinPAkgiPIP+xtCEpWxlQtRPDlzMA4dw=;
 b=hLiDZgqoc2mqGGzVG0XTePpocnHV5/Z4F12ZRFN7cXNXdnjWsaT3BppF5NYmsP61BN
 5d+/gi6MNMKsOHODssMMcZ4pF+lW11ffAaNCAIdPEehKBxQvLdcTl9VsSrQtzOfzVE1M
 p5EaGNxH1nS0dqgTTROg+3uV58szbOKz3szTpdZNW2XObFCScHoZ5nC26Ujb7kl1vHE7
 CCSZk+ytoZkAwuS+Dn5UD3NpA57UX6bIVGuaENP30GfUiBky6k3Mh1xxgHLa1I7zU8Ws
 al9oa5bIxQoBTlVXnMrGT5QG0O6gsLI+VncLRSbJi6vF6q5YqguXzYN1XfhmrZE/90/h
 v68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+HszHCjicRVinPAkgiPIP+xtCEpWxlQtRPDlzMA4dw=;
 b=XVABy4//twNG+0zGtFLMmhkgdtWM/3QxBGYA4dNQk01AXOBoLc+D2AZUSDNynCTWp4
 CnRruObId8QYOqRw8TGg9Q59Gjzt7sE2N/863Xq4EVSYfsTkOek5y631CYzojYCIEVnC
 EPCrOiTGi38o8FH38hKjUB4Mbfsr0c3tKmErgsh+g44IFkaby3OkpjjxEkM/54l/om+H
 6Cv4dKQX4CUE07PNzVZZViUsnDTty+moEe+WOUx181BF1e1V3o0s2DyeP7yGkVcE/1GS
 jVP8mYOY0lsxGbJGhEPoj9IoWbQ7Z4EKWGUEzxbtIQ6hFTiD6wEQY1kTVXvn1AxPq7Mb
 R3VQ==
X-Gm-Message-State: AOAM533L9Sd6voF2XQW8d2E9Y7TJ1pEIMlqqlAuTPufbZep/4QB2e/O/
 3KS2Q/gHmPedwKfKvCChzlO5vze0u3ZaFtDT2GHWPQ==
X-Google-Smtp-Source: ABdhPJwn4Oqi0vXmNn+fAS1CTHv+7Tuqimbyvgc4WZbbOxn28bIgGdkzLLvNTRihvLcZdK06Wgtc8JhqRshJ5S/Y98Q=
X-Received: by 2002:a02:cf2e:: with SMTP id s14mr1483427jar.74.1627637564075; 
 Fri, 30 Jul 2021 02:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210727101051.24418-1-yunfei.dong@mediatek.com>
 <20210727101051.24418-5-yunfei.dong@mediatek.com>
In-Reply-To: <20210727101051.24418-5-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 30 Jul 2021 17:32:33 +0800
Message-ID: <CA+Px+wXNRw6aNgpfA8qRd1tw0Tx+0jSj-dG-9_wjmxNOsji7_w@mail.gmail.com>
Subject: Re: [PATCH v3, 04/15] media: mtk-vcodec: Use component framework to
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
X-CRM114-CacheID: sfid-20210730_023245_552881_9428C6E0 
X-CRM114-Status: GOOD (  26.61  )
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

On Tue, Jul 27, 2021 at 06:10:40PM +0800, Yunfei Dong wrote:
> +static struct component_match *mtk_vcodec_match_add(
> +     struct mtk_vcodec_dev *vdec_dev)
> + {
Remove the extra space before {.

> +     struct platform_device *pdev = vdec_dev->plat_dev;
> +     struct component_match *match = NULL;
> +     int i;
> +
> +     for (i = 0; i < ARRAY_SIZE(mtk_vdec_drv_ids); i++) {
> +             struct device_node *comp_node;
> +             enum mtk_vdec_hw_id comp_idx;
> +             const struct of_device_id *of_id;
Failed to see benifits to declare here in the case.  To be neat, move
the variable declaration to the beginning of function.

> +
> +             comp_node = of_find_compatible_node(NULL, NULL,
> +                     mtk_vdec_drv_ids[i].compatible);
> +             if (!comp_node)
> +                     continue;
If moving of_id assignment to the beginning of for-loop, use of_id->compatible.

> +
> +             if (!of_device_is_available(comp_node)) {
> +                     of_node_put(comp_node);
> +                     dev_err(&pdev->dev, "Fail to get MMSYS node\n");
> +                     continue;
> +             }
> +
> +             of_id = &mtk_vdec_drv_ids[i];
> +             if (!of_id) {
> +                     dev_err(&pdev->dev, "Failed to get match node\n");
> +                     return ERR_PTR(-EINVAL);
> +             }
Move the block to the beginning of for-loop.  Looking to other blocks
around, does it make more sense to use `continue` instead of `return`?

> +
> +             comp_idx = (enum mtk_vdec_hw_id)of_id->data;
> +             mtk_v4l2_debug(4, "Get component:hw_id(%d),vdec_dev(0x%p),comp_node(0x%p)\n",
> +                     comp_idx, vdec_dev, comp_node);
> +             vdec_dev->component_node[comp_idx] = comp_node;
> +
> +             component_match_add_release(&pdev->dev, &match, mtk_vdec_release_of,
> +                     mtk_vdec_compare_of, comp_node);
> +             of_node_put(comp_node);
I thought it shouldn't call of_node_put(...) which is already
delegated to component framework (mtk_vdec_release_of).

> +     }
> +
> +   return match;
Fix the indent.

> +static int mtk_vcodec_init_dec_params(struct mtk_vcodec_dev *dev)
> +{
> +     struct platform_device *pdev = dev->plat_dev;
> +     int ret;
> +
> +     ret = mtk_vcodec_get_reg_bases(dev);
> +     if (ret)
> +             return ret;
> +
> +     if (!dev->is_comp_supported) {
> +             dev->dec_irq = platform_get_irq(pdev, 0);
> +             if (dev->dec_irq < 0) {
> +                     dev_err(&pdev->dev, "failed to get irq number");
> +                     return dev->dec_irq;
> +             }
> +
> +             irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
> +             ret = devm_request_irq(&pdev->dev, dev->dec_irq,
> +                             mtk_vcodec_dec_irq_handler, 0, pdev->name, dev);
> +             if (ret) {
> +                     dev_err(&pdev->dev, "failed to install dev->dec_irq %d (%d)",
> +                             dev->dec_irq, ret);
> +                     return ret;
> +             }
> +
> +             ret = mtk_vcodec_init_dec_pm(pdev, &dev->pm);
> +             if (ret < 0) {
> +                     dev_err(&pdev->dev, "failed to get mt vcodec clock source");
> +                     return ret;
> +             }
> +     }
> +
> +     return ret;
To be concise, return 0.

> +     comp_node =
> +             of_find_compatible_node(NULL, NULL, "mediatek,mtk-vcodec-core");
> +     if (!comp_node)
> +             dev->is_comp_supported = false;
> +     else
> +             dev->is_comp_supported = true;
> +     of_node_put(comp_node);
Looking up "mediatek,mtk-vcodec-core" to determine if it uses
component framework sounds like a sub-optimal method.

> @@ -311,7 +429,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>               MTK_VCODEC_DEC_NAME);
>       video_set_drvdata(vfd_dec, dev);
>       dev->vfd_dec = vfd_dec;
> -     platform_set_drvdata(pdev, dev);
>
>       dev->m2m_dev_dec = v4l2_m2m_init(&mtk_vdec_m2m_ops);
>       if (IS_ERR((__force void *)dev->m2m_dev_dec)) {
> @@ -362,8 +479,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>       mtk_v4l2_debug(0, "decoder registered as /dev/video%d",
>               vfd_dec->num);
>
> -     return 0;
> +     if (dev->is_comp_supported) {
> +             ret = mtk_vcodec_init_master(dev);
> +             if (ret < 0)
> +                     goto err_component_match;
> +     } else {
> +             platform_set_drvdata(pdev, dev);
> +     }
Has asked the same question in [1].  Why it removes the
platform_set_drvdata() above?  mtk_vcodec_init_master() also calls
platform_set_drvdata().

[1]: https://patchwork.linuxtv.org/project/linux-media/patch/20210707062157.21176-4-yunfei.dong@mediatek.com/

> +     return 0;
> +err_component_match:
> +     video_unregister_device(vfd_dec);
Why video_unregister_device()?  It is already called [2].

[2]: https://elixir.bootlin.com/linux/v5.14-rc3/source/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c#L344

> @@ -379,9 +505,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  err_dec_alloc:
>       v4l2_device_unregister(&dev->v4l2_dev);
>  err_res:
> -     mtk_vcodec_release_dec_pm(&dev->pm);
Shouldn't remove it.  mtk_vcodec_init_dec_params() also needs to undo
in the path.

Refactoring them to mtk_vcodec_init_dec_params() makes the error
handling more complicated.

> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 973b0b3649c6..d6bb723db106 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -17,6 +17,11 @@
>  #include <media/videobuf2-core.h>
>  #include "mtk_vcodec_util.h"
>
> +#define VDEC_HW_ACTIVE       0x10
> +#define VDEC_IRQ_CFG 0x11
> +#define VDEC_IRQ_CLR 0x10
> +#define VDEC_IRQ_CFG_REG     0xa4
If moving to mtk_vcodec_dec_hw.h or mtk_vcodec_dec_hw.c makes more sense?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
