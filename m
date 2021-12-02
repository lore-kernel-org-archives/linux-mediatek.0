Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E638DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 00:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/r7uopPWCl1PdINDS/cy9fYlM29yxvI1PUGckva5SOg=; b=n5HpStQt/2tOvx
	WE4s0VLsN8zCiTDpQ276rfeYfiyVgPZPByZSqv63xiutB7q5KJr6s65K1swiqZTMG1bP74vnePvFH
	nlYUXf1U8+VxdZZKO0xoe6qfTWUQEGDcqbrrzdeSsX58grfXhzhkk9DEkmw1u5isjyUyIao7PFO91
	S+Dg7ABRi8x3+NCfD7XkFdgbgvnweqJhLcMXt8yilSAsXqTZNch3PH5c4qAGopnCH9+eH9d+ifzkZ
	bi7Mg4GROtKVJpGwlMWhbkJKL3yiSJHs2rn1u06nKzJ7k/06htEmmwaGMVd9DrvPeHmeK7seDqctN
	BsXr9dlCQDqqmxCutJrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msZg4-00APEZ-O3; Thu, 02 Dec 2021 00:10:20 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msZg0-00APC2-VM
 for linux-mediatek@lists.infradead.org; Thu, 02 Dec 2021 00:10:19 +0000
Received: by mail-qk1-x72a.google.com with SMTP id p4so32964222qkm.7
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Dec 2021 16:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=55WStG4Y7XlDovmlmdz+wvG6EaacgKrZKMN/wNUPDPc=;
 b=NlFNrvHDX4WGr/52aCDlG+suYiNBw8eVzKVICQV7J8Elq1W5jJyjHPnT/rvgT6XOA7
 vgsZQTED1c0q5GR7VRRuSLlaLQdHFnWtrmapHOMPSz4DfK1FrLrATzaSOkKooY3aCHSV
 ZumUeV+X0TEDlVR72CWqMttnlvY9+YcNt6OMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=55WStG4Y7XlDovmlmdz+wvG6EaacgKrZKMN/wNUPDPc=;
 b=qMv1wJ9b7Yj8rMys6kgba5vEwmmoET359FZVj3VCGcf01+CX2UYVxkofGCNgn58scE
 JSCgQrhiZKt8BYrwlpHAxnj+IZs/NPlDWxbwRXVQAOi56KPJ+7tr3cLTaD5tVDsZye1x
 8C/s6GnzXSoWUg9bUiJruK2KsgaN/GX0A+Qf9KS0kFIfvnI/iS6PlIzls1KKjQ3Pvwcn
 uE4KjHThy2i21X/TFYFwHqNYYpJsYUzOIwwhoZpU00jnHFOm3G9ib5GtVBogGK41SGjb
 rB5SiPQefAklfTU37xGGEfPLqnWbW5VKL2VQNQwHzQz5Qy/aCBlyl6jPuve9vwzP2I5N
 dmYA==
X-Gm-Message-State: AOAM531w9wnyf1phhYVZebR3bsz5iQHyu5yy1B8bGSRGs/D/RzxRVmSh
 9Zg+ve7M1GX3ZJX1ah6lVw6jc1jc7SZDod5KVNVvSw==
X-Google-Smtp-Source: ABdhPJwnxcMhCHSmQbCaz9VZX6btqW3BmzytBcMVvCB83INeGr8SdIdEK+AnZ0JqT5Dl4lJC/zQNylftsh/c62mi930=
X-Received: by 2002:a37:e20d:: with SMTP id g13mr9677715qki.121.1638403810885; 
 Wed, 01 Dec 2021 16:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-4-yunfei.dong@mediatek.com>
In-Reply-To: <20211129034201.5767-4-yunfei.dong@mediatek.com>
From: Steve Cho <stevecho@chromium.org>
Date: Wed, 1 Dec 2021 16:10:00 -0800
Message-ID: <CAC-pXoNtM0CFp9iFtZLtgQ7ZG9VewXyk9wF66w6YcEE4skRghA@mail.gmail.com>
Subject: Re: [PATCH v11, 03/19] media: mtk-vcodec: Refactor vcodec pm interface
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_161017_028504_2960D561 
X-CRM114-Status: GOOD (  20.80  )
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

Reviewed-by: Steve Cho <stevecho@chromium.org>

On Sun, Nov 28, 2021 at 7:44 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Using the needed param for pm init/release function and remove unused
> param mtkdev in 'struct mtk_vcodec_pm'.

nit: How about s/needed param/needed params |pdev| and |pm|/ ?


> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  6 ++---
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 22 ++++++++-----------
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  5 +++--
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 -
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  1 -
>  5 files changed, 15 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 055d50e52720..3ac4c3935e4e 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -249,7 +249,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>         if (IS_ERR(dev->fw_handler))
>                 return PTR_ERR(dev->fw_handler);
>
> -       ret = mtk_vcodec_init_dec_pm(dev);
> +       ret = mtk_vcodec_init_dec_pm(dev->plat_dev, &dev->pm);
>         if (ret < 0) {
>                 dev_err(&pdev->dev, "Failed to get mt vcodec clock source");
>                 goto err_dec_pm;
> @@ -378,7 +378,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  err_dec_alloc:
>         v4l2_device_unregister(&dev->v4l2_dev);
>  err_res:
> -       mtk_vcodec_release_dec_pm(dev);
> +       mtk_vcodec_release_dec_pm(&dev->pm);
>  err_dec_pm:
>         mtk_vcodec_fw_release(dev->fw_handler);
>         return ret;
> @@ -418,7 +418,7 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
>                 video_unregister_device(dev->vfd_dec);
>
>         v4l2_device_unregister(&dev->v4l2_dev);
> -       mtk_vcodec_release_dec_pm(dev);
> +       mtk_vcodec_release_dec_pm(&dev->pm);
>         mtk_vcodec_fw_release(dev->fw_handler);
>         return 0;
>  }
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> index 6038db96f71c..20bd157a855c 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> @@ -13,18 +13,15 @@
>  #include "mtk_vcodec_dec_pm.h"
>  #include "mtk_vcodec_util.h"
>
> -int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
> +int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
> +       struct mtk_vcodec_pm *pm)
>  {
>         struct device_node *node;
> -       struct platform_device *pdev;
> -       struct mtk_vcodec_pm *pm;
> +       struct platform_device *larb_pdev;
>         struct mtk_vcodec_clk *dec_clk;
>         struct mtk_vcodec_clk_info *clk_info;
>         int i = 0, ret = 0;
>
> -       pdev = mtkdev->plat_dev;
> -       pm = &mtkdev->pm;
> -       pm->mtkdev = mtkdev;
>         dec_clk = &pm->vdec_clk;
>         node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
>         if (!node) {
> @@ -32,13 +29,12 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>                 return -1;
>         }
>
> -       pdev = of_find_device_by_node(node);
> +       larb_pdev = of_find_device_by_node(node);
>         of_node_put(node);
> -       if (WARN_ON(!pdev)) {
> +       if (WARN_ON(!larb_pdev)) {
>                 return -1;
>         }
> -       pm->larbvdec = &pdev->dev;
> -       pdev = mtkdev->plat_dev;
> +       pm->larbvdec = &larb_pdev->dev;
>         pm->dev = &pdev->dev;
>
>         dec_clk->clk_num =
> @@ -82,10 +78,10 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>         return ret;
>  }
>
> -void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
> +void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
>  {
> -       pm_runtime_disable(dev->pm.dev);
> -       put_device(dev->pm.larbvdec);
> +       pm_runtime_disable(pm->dev);
> +       put_device(pm->larbvdec);
>  }
>
>  int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> index 280aeaefdb65..a3df6aef6cb9 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> @@ -9,8 +9,9 @@
>
>  #include "mtk_vcodec_drv.h"
>
> -int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *dev);
> -void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev);
> +int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
> +       struct mtk_vcodec_pm *pm);
> +void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm);
>
>  int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
>  void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 1d2370608d0d..0fa9d85114b9 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -195,7 +195,6 @@ struct mtk_vcodec_pm {
>         struct mtk_vcodec_clk   venc_clk;
>         struct device   *larbvenc;
>         struct device   *dev;
> -       struct mtk_vcodec_dev   *mtkdev;
>  };
>
>  /**
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> index 1b2e4930ed27..0c8c8f86788c 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> @@ -26,7 +26,6 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>         pdev = mtkdev->plat_dev;
>         pm = &mtkdev->pm;
>         memset(pm, 0, sizeof(struct mtk_vcodec_pm));
> -       pm->mtkdev = mtkdev;
>         pm->dev = &pdev->dev;
>         dev = &pdev->dev;
>         enc_clk = &pm->venc_clk;
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
