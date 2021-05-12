Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494CCC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 09:21:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94B3761166
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 09:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94B3761166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ic7SqVQ8Ye459EvsJjnEA2Yu/3bD19by59SxRKbVAYE=; b=pO6FWMUdeWX3kcdWqNnv0EvFD
	3LZns9kAgJMx634OdMmHUOyCBb6O1DhyA+58mRJmR5uxOBNc/+jxwHP1K951akyGJQ8wPIr4DiFmc
	BxH5zgRq6wOnBDuKXrxfmfR1U/n2CJX/BAO0FyILIi9L3EV9EO+yRfomAcMsWiFybJZjRgHo81Blw
	0KEgjHrqgTW0XltyiLJD4ddp1WCwpM/FaD82l0J6FuYtQwH7WibxA3MaZ3F+cO2Ivch06BcTIPZsc
	mhJALibdlvuKvxtLpZw+C41TnCPoHbBaXDrf/7Q/3sro24kgaGX34OxIG0ZvaztrXO/mbl/9SyA7v
	FWv8N/DMw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgl2s-002Q7u-9V; Wed, 12 May 2021 09:20:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgl2g-002Q5I-NH
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 09:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Rw5bi1SAPL1hZNfoVXmGUyA3xV1P1F1OYsNK09HU+a0=; b=RFcR4zDOgnU9VYC4rj8q3fSAAR
 jQ13CEAFC7w88t7rKwG8WEEWpvtT2yzj4zSSYLXjQMoymffW/4JdsKLZfNgAOAXWYIm3KceaGQWsT
 6p0nW3k7jTMXvI2gHP4oK4W3WiRGYaz0dLReLr1YupkBTNSBFR3Xcgz+IvvX+WKvE6pRSaYN6C48r
 B5x2acwGWV7YlrpRX0Mh31wGL1EVc4ANKqVdJCTaijJybI1GP2CPA0zCdiZ/QE6XDbchIay1Ye65J
 tFSuYA6e2N0haQgP+kAQRNRskFR59f97rEAqrV9r/HadQA3h+jumoQ/ru5dZ34Fi+oo0j1ObLnrsR
 ul0yaeSA==;
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgl2d-00AFK8-Jh
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 09:20:33 +0000
Received: by mail-io1-xd34.google.com with SMTP id n40so5185103ioz.4
 for <linux-mediatek@lists.infradead.org>; Wed, 12 May 2021 02:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rw5bi1SAPL1hZNfoVXmGUyA3xV1P1F1OYsNK09HU+a0=;
 b=gqYpnE/lrAatuhlH0xLuX+Ye+d+UxsP6NP14t+2gblbyF65xPmr1mYDmqPtUIsIL8Z
 NGqT2siml8zsT/+GjnMinVr2ht+4InfIycF46nZ481jEqCxSMP3FE3k8hVRTkZ2fA2Ih
 Zpp3c+EoX6nY//nNe6CT2pzwKdFA+JivEzM40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rw5bi1SAPL1hZNfoVXmGUyA3xV1P1F1OYsNK09HU+a0=;
 b=X9VTa25AYZ5ZoNwE9M2dSB4hHM1CpAS0lxknnGFCjyECGf13NNdi6TJ69rnFXysrqV
 wiJe7IRHvN+5lx6Z9FLu8eOO745dxu7zIef8YsUiObUdNzoZ2HgS2x83c4CUXMMnpxFH
 zErVLZ2yYzmv7dOPjEHSOHlB/TUzaoRdl1ER6pgRh8IUAsObloP5fPtmBoeMI6FXwHfy
 vdq1zNg8uSJQ2pMvBktg0uEEeTkS2HT7+LDdgNNRf19jRVrutfik8YtvziViIIusISeC
 V2cO96/02KEq9No48csbb7WXc1kHflGse9Vz9a/T7exvD/0lcSBu/tSyxJ9lwdlXDAzs
 oDAA==
X-Gm-Message-State: AOAM533HYx3vdMU3ut3xeUwjXqEfWZZVRsq1Ztp8RJt+mfe7RRG6Nu9h
 ApwqYRcZFVDL6PQNj1684LNXcaxBnZ12x0S2B2XOSg==
X-Google-Smtp-Source: ABdhPJz4D4taavm63iD2SKLxbMnILL72N/Np1EaOYKVanFw2BuKIj5CwmD6/ksD8F9i292URXw+KTxWjgrqcMFmbXfE=
X-Received: by 2002:a6b:f815:: with SMTP id o21mr24594979ioh.0.1620811229435; 
 Wed, 12 May 2021 02:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-14-yong.wu@mediatek.com>
In-Reply-To: <20210410091128.31823-14-yong.wu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 12 May 2021 17:20:03 +0800
Message-ID: <CAJMQK-iTrQRDDm_=LNqSpvXFd431LYRxXMasJHUpN+K8rJ=Qpg@mail.gmail.com>
Subject: Re: [PATCH v5 13/16] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
To: Yong Wu <yong.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Evan Green <evgreen@chromium.org>, 
 Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>, 
 Will Deacon <will.deacon@arm.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream@mediatek.com, Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, iommu@lists.linux-foundation.org, 
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, 
 Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 chao.hao@mediatek.com, 
 ming-fan.chen@mediatek.com, yi.kuo@mediatek.com, eizan@chromium.org, 
 Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_022031_677210_4048DF15 
X-CRM114-Status: GOOD (  24.09  )
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

On Sat, Apr 10, 2021 at 5:14 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> MediaTek IOMMU has already added the device_link between the consumer
> and smi-larb device. If the vcodec device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
>
> CC: Tiffany Lin <tiffany.lin@mediatek.com>
> CC: Irui Wang <irui.wang@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 ++-------------
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 46 ++-----------------
>  4 files changed, 10 insertions(+), 77 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> index 32e1858e9f1d..2b3562e47f4f 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> @@ -8,14 +8,12 @@
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
> -#include <soc/mediatek/smi.h>
>
>  #include "mtk_vcodec_dec_pm.h"
>  #include "mtk_vcodec_util.h"
>
>  int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>  {
> -       struct device_node *node;
>         struct platform_device *pdev;
>         struct mtk_vcodec_pm *pm;
>         struct mtk_vcodec_clk *dec_clk;
> @@ -26,18 +24,7 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>         pm = &mtkdev->pm;
>         pm->mtkdev = mtkdev;
>         dec_clk = &pm->vdec_clk;
> -       node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
> -       if (!node) {
> -               mtk_v4l2_err("of_parse_phandle mediatek,larb fail!");
> -               return -1;
> -       }
>
> -       pdev = of_find_device_by_node(node);
> -       of_node_put(node);
> -       if (WARN_ON(!pdev)) {
> -               return -1;
> -       }
> -       pm->larbvdec = &pdev->dev;
>         pdev = mtkdev->plat_dev;
>         pm->dev = &pdev->dev;
>
> @@ -47,14 +34,11 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>                 dec_clk->clk_info = devm_kcalloc(&pdev->dev,
>                         dec_clk->clk_num, sizeof(*clk_info),
>                         GFP_KERNEL);
> -               if (!dec_clk->clk_info) {
> -                       ret = -ENOMEM;
> -                       goto put_device;
> -               }
> +               if (!dec_clk->clk_info)
> +                       return -ENOMEM;
>         } else {
>                 mtk_v4l2_err("Failed to get vdec clock count");
> -               ret = -EINVAL;
> -               goto put_device;
> +               return -EINVAL;
>         }
>
>         for (i = 0; i < dec_clk->clk_num; i++) {
> @@ -63,29 +47,24 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>                         "clock-names", i, &clk_info->clk_name);
>                 if (ret) {
>                         mtk_v4l2_err("Failed to get clock name id = %d", i);
> -                       goto put_device;
> +                       return ret;
>                 }
>                 clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
>                         clk_info->clk_name);
>                 if (IS_ERR(clk_info->vcodec_clk)) {
>                         mtk_v4l2_err("devm_clk_get (%d)%s fail", i,
>                                 clk_info->clk_name);
> -                       ret = PTR_ERR(clk_info->vcodec_clk);
> -                       goto put_device;
> +                       return PTR_ERR(clk_info->vcodec_clk);
>                 }
>         }
>
>         pm_runtime_enable(&pdev->dev);
>         return 0;
> -put_device:
> -       put_device(pm->larbvdec);
> -       return ret;
>  }
>
>  void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
>  {
>         pm_runtime_disable(dev->pm.dev);
> -       put_device(dev->pm.larbvdec);
>  }
>
>  void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
> @@ -121,11 +100,6 @@ void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
>                 }
>         }
>
> -       ret = mtk_smi_larb_get(pm->larbvdec);
> -       if (ret) {
> -               mtk_v4l2_err("mtk_smi_larb_get larbvdec fail %d", ret);
> -               goto error;
> -       }
>         return;
>
>  error:
> @@ -138,7 +112,6 @@ void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
>         struct mtk_vcodec_clk *dec_clk = &pm->vdec_clk;
>         int i = 0;
>
> -       mtk_smi_larb_put(pm->larbvdec);
>         for (i = dec_clk->clk_num - 1; i >= 0; i--)
>                 clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
>  }
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 869d958d2b99..659790398809 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -189,10 +189,7 @@ struct mtk_vcodec_clk {
>   */
>  struct mtk_vcodec_pm {
>         struct mtk_vcodec_clk   vdec_clk;
> -       struct device   *larbvdec;
> -
>         struct mtk_vcodec_clk   venc_clk;
> -       struct device   *larbvenc;
>         struct device   *dev;
>         struct mtk_vcodec_dev   *mtkdev;
>  };
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 4831052f475d..59816981735b 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -8,7 +8,6 @@
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-dma-contig.h>
> -#include <soc/mediatek/smi.h>
>  #include <linux/pm_runtime.h>
>
>  #include "mtk_vcodec_drv.h"
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> index 1b2e4930ed27..78b99ff882ae 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> @@ -8,58 +8,36 @@
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
> -#include <soc/mediatek/smi.h>
>
>  #include "mtk_vcodec_enc_pm.h"
>  #include "mtk_vcodec_util.h"
>
>  int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>  {
> -       struct device_node *node;
>         struct platform_device *pdev;
>         struct mtk_vcodec_pm *pm;
>         struct mtk_vcodec_clk *enc_clk;
>         struct mtk_vcodec_clk_info *clk_info;
>         int ret = 0, i = 0;
> -       struct device *dev;
>
>         pdev = mtkdev->plat_dev;
>         pm = &mtkdev->pm;
>         memset(pm, 0, sizeof(struct mtk_vcodec_pm));
>         pm->mtkdev = mtkdev;
>         pm->dev = &pdev->dev;
> -       dev = &pdev->dev;
>         enc_clk = &pm->venc_clk;
>
> -       node = of_parse_phandle(dev->of_node, "mediatek,larb", 0);
> -       if (!node) {
> -               mtk_v4l2_err("no mediatek,larb found");
> -               return -ENODEV;
> -       }
> -       pdev = of_find_device_by_node(node);
> -       of_node_put(node);
> -       if (!pdev) {
> -               mtk_v4l2_err("no mediatek,larb device found");
> -               return -ENODEV;
> -       }
> -       pm->larbvenc = &pdev->dev;
> -       pdev = mtkdev->plat_dev;
> -       pm->dev = &pdev->dev;
> -
>         enc_clk->clk_num = of_property_count_strings(pdev->dev.of_node,
>                 "clock-names");
>         if (enc_clk->clk_num > 0) {
>                 enc_clk->clk_info = devm_kcalloc(&pdev->dev,
>                         enc_clk->clk_num, sizeof(*clk_info),
>                         GFP_KERNEL);
> -               if (!enc_clk->clk_info) {
> -                       ret = -ENOMEM;
> -                       goto put_larbvenc;
> -               }
> +               if (!enc_clk->clk_info)
> +                       return -ENOMEM;
>         } else {
>                 mtk_v4l2_err("Failed to get venc clock count");
> -               ret = -EINVAL;
> -               goto put_larbvenc;
> +               return -EINVAL;
>         }
>
>         for (i = 0; i < enc_clk->clk_num; i++) {
> @@ -68,29 +46,23 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>                         "clock-names", i, &clk_info->clk_name);
>                 if (ret) {
>                         mtk_v4l2_err("venc failed to get clk name %d", i);
> -                       goto put_larbvenc;
> +                       return ret;
>                 }
>                 clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
>                         clk_info->clk_name);
>                 if (IS_ERR(clk_info->vcodec_clk)) {
>                         mtk_v4l2_err("venc devm_clk_get (%d)%s fail", i,
>                                 clk_info->clk_name);
> -                       ret = PTR_ERR(clk_info->vcodec_clk);
> -                       goto put_larbvenc;
> +                       return PTR_ERR(clk_info->vcodec_clk);
>                 }
>         }
>
>         return 0;
> -
> -put_larbvenc:
> -       put_device(pm->larbvenc);
> -       return ret;
>  }
>
>  void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *mtkdev)
>  {
>         pm_runtime_disable(mtkdev->pm.dev);
> -       put_device(mtkdev->pm.larbvenc);
>  }
>
>
> @@ -108,13 +80,6 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
>                 }
>         }
>
> -       ret = mtk_smi_larb_get(pm->larbvenc);
> -       if (ret) {
> -               mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
> -               goto clkerr;
> -       }
> -       return;

You can't delete the return; here, otherwise vcodec_clk will be turned
off immediately after they are turned on.

> -
>  clkerr:
>         for (i -= 1; i >= 0; i--)
>                 clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
> @@ -125,7 +90,6 @@ void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
>         struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
>         int i = 0;
>
> -       mtk_smi_larb_put(pm->larbvenc);
>         for (i = enc_clk->clk_num - 1; i >= 0; i--)
>                 clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
>  }
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
