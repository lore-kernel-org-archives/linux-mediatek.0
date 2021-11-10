Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF7CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 10:31:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A5126115A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 10:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A5126115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLVnJQOkAFDgs4MhaCoM+JlvX1ujIk3MqdVVbXcElHU=; b=H4LxABBTyCfAou
	RgLrrzYnDXrBn/w12QbiofnIME4Vs/URYjMTuX9XdAR3E3CXI/lwucJ/Ioq4mOIDJgu7cjvNZvPYI
	fDEO+6u4axQ+GQJUnrfOtIzyLEiTq2Je8er2S6fSxtgoQRatjbbTVaNr7CHTK/7I6ytAwrJ9AkKtB
	rnLvZIOn8AzT9HzVxYxMZO2EEkm06+JiK0tVGpaW5PJYkGQqAVssnolYzOFSG/6TOTTgT5Lpe5xfZ
	Zn09z+ca0UDUkSWy/4dk/VAEjB2NVYI5nWI8mX9pC/+7dbegxUSL1RhsiHavMdjlcO05uShhA5OjX
	tIuImh5xb8mv7040zC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkkt4-0057eX-UR; Wed, 10 Nov 2021 10:31:26 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkksJ-0057FS-1I
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 10:30:40 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 188so1863815pgb.7
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 02:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r5DQX2VbHiiinpBFvGUn9gkRcEjjrEuvSqSjaWfXcDI=;
 b=cy/1KPVoDrOt4yjIxt1Buip+V8mWgNg6UYmtGHHJ08/DKQEPhwaYkgH2lsyQyAln8/
 R8GzPx7X8b2yG5twg9UIjYkDsDTwEQEEADIN1kg/Ah5oK+dFzF3R9/S2UAdl7RbbyFDU
 6MERQjvvntRYiXZoMQDWLQPPCf4BU+6LB2Cp61t9N7538FW3qkal5Dm+9kF681JbqjU+
 JWhcuXUT8RXNemHk5gN/Op5Lm0JoIL2A418gG3D3qUH250dSGLbCF/rVRFZ1XUmKVmrt
 LLoi8vFEeipVLd3+GIwBPfDiMw9XNbfJ/vkKCvkgqpmCnYjC7hbqgA6gqXJ7Qr2og0DJ
 PEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r5DQX2VbHiiinpBFvGUn9gkRcEjjrEuvSqSjaWfXcDI=;
 b=ME8TJsissqtUNHHuxOmR8RmB7/LutNsJePYMe/WXc2j4fNW9isMooH+tjKyYHxK/2Z
 tFas5B6nn+6eCd7GVHSZWzyshmPiiuWzGSiwdEsna2fwF25SlyXG0p1WbBOudSNWhwEL
 maCJXNiy/JWAYLpgjbazFwRb+W5glnxVBA8XFG/YElL1WmnCsvpYD8/mhSHfctP7i3Xp
 Veq4EortOomFBeVCeX/6BgFYx2QiDXl3VkRIAtDVAzsKHUSr7PSCjuv2UVQfz9lagsuR
 9E5sg1HgG0Zk0Z8u0wwHXcwIT5/ebDU8oNt8yD+5uGX6TX7ORBPF6RlSoRw6FeS1O3EA
 yNgA==
X-Gm-Message-State: AOAM5310mg4/yCA0KaORKhfgjibSQYUaC8lkCfnaGcoW6eSsDsUa8bBZ
 u0pfKmFMIUs1Szeigk3TvC8aFfHqqsamJEoqMTRjnA==
X-Google-Smtp-Source: ABdhPJykmPLJ6N71IANWCRh+gpwVTmAkjoBw+f7+zlBkb5XKdRfh/Qb9D78+HxTdnDoFhcUKj8MzfOQAbs+Oli9R2pw=
X-Received: by 2002:a05:6a00:2387:b0:49f:af00:d5d0 with SMTP id
 f7-20020a056a00238700b0049faf00d5d0mr14945380pfc.1.1636540237554; Wed, 10 Nov
 2021 02:30:37 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com>
 <20211109125030.26299-7-yunfei.dong@mediatek.com>
In-Reply-To: <20211109125030.26299-7-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 10 Nov 2021 18:30:26 +0800
Message-ID: <CA+Px+wXSFkK1o__7YWntGwFXtfWKH65VoSq=783fEPoEH-MwGw@mail.gmail.com>
Subject: Re: [PATCH v9,
 06/19] media: mtk-vcodec: Manage multi hardware information
To: Yunfei Dong <Yunfei.Dong@mediatek.com>
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
X-CRM114-CacheID: sfid-20211110_023039_132266_C81254DF 
X-CRM114-Status: GOOD (  35.60  )
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

On Tue, Nov 09, 2021 at 08:50:17PM +0800, Yunfei Dong wrote:
> Manage each hardware information which includes irq/power/clk.
> The hardware includes LAT0, LAT1 and CORE.

The commit message doesn't explain the code.  Could you provide some
explanations about how the async mechanism works?  (e.g. A bitmap for
all sub-devices' readiness ...)

> Reported-by: kernel test robot <lkp@intel.com>

Apparently wrong tag.

> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index b7a51e96d4ba..eb2af42aa102 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -18,19 +18,49 @@
>
>  #include "mtk_vcodec_drv.h"
>  #include "mtk_vcodec_dec.h"
> +#include "mtk_vcodec_dec_hw.h"
>  #include "mtk_vcodec_dec_pm.h"
>  #include "mtk_vcodec_intr.h"
> -#include "mtk_vcodec_util.h"

Why does mtk_vcodec_util.h need to remove?

> +static int mtk_vcodec_subdev_device_check(struct mtk_vcodec_ctx *ctx)
> + {

Remove the extra space.

> +     struct mtk_vcodec_dev *vdec_dev = ctx->dev;
> +     struct platform_device *pdev = vdec_dev->plat_dev;
> +     struct device_node *subdev_node;
> +     enum mtk_vdec_hw_id hw_idx;
> +     const struct of_device_id *of_id;
> +     int i;
> +
> +     for (i = 0; i < ARRAY_SIZE(mtk_vdec_hw_match); i++) {
> +             of_id = &mtk_vdec_hw_match[i];
> +             subdev_node = of_find_compatible_node(NULL, NULL,
> +                     of_id->compatible);
> +             if (!subdev_node)
> +                     continue;
> +
> +             if (!of_device_is_available(subdev_node)) {
> +                     of_node_put(subdev_node);
> +                     dev_err(&pdev->dev, "Fail to get MMSYS node\n");

I am not sure if the error message makes sense about mentioning MMSYS here.

> +                     continue;
> +             }
> +
> +             hw_idx = (enum mtk_vdec_hw_id)(uintptr_t)of_id->data;

Does it really need to cast twice?

> +             vdec_dev->subdev_node[hw_idx] = subdev_node;
> +
> +             if (!test_bit(hw_idx, vdec_dev->hardware_bitmap)) {
> +                     dev_err(&pdev->dev, "Vdec hw_idx is not ready %d.",
> +                             hw_idx);

I would prefer "Vdec %d is not ready\n".

> +                     return -EINVAL;

-EAGAIN makes more sense.

> +             }
> +     }
> +
> +     return 0;
> +}

Would it need to call of_node_put() in the error handling path?

> +static int mtk_vcodec_init_dec_params(struct mtk_vcodec_dev *dev)
> +{

I would rather not call them "params".  They are more like "resources".

> +     struct platform_device *pdev = dev->plat_dev;
> +     int ret;
> +
> +     ret = mtk_vcodec_get_reg_bases(dev);
> +     if (ret)
> +             return ret;
> +
> +     if (!dev->vdec_pdata->is_subdev_supported) {
> +             dev->dec_irq = platform_get_irq(pdev, 0);
> +             if (dev->dec_irq < 0) {
> +                     dev_err(&pdev->dev, "failed to get irq number");
> +                     return dev->dec_irq;
> +             }
> +
> +             irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
> +             ret = devm_request_irq(&pdev->dev, dev->dec_irq,
> +                     mtk_vcodec_dec_irq_handler, 0, pdev->name, dev);
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

I would prefer:

if (dev->vdec_pdata->is_subdev_supported)
    return 0;

And decrease the indent level by 1 for the following blocks.

> @@ -329,6 +377,13 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>               goto err_event_workq;
>       }
>
> +     ret = of_platform_populate(pdev->dev.of_node, NULL, NULL,
> +             &pdev->dev);
> +     if (ret) {
> +             mtk_v4l2_err("Master device of_platform_populate failed.");

s/Master/Main/

Doesn't it need to reference `is_subdev_supported` before populating?

> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> new file mode 100644
> index 000000000000..745be12548ef
[...]
> +const struct of_device_id mtk_vdec_hw_match[] = {
> +     {
> +             .compatible = "mediatek,mtk-vcodec-lat",
> +             .data = (void *)MTK_VDEC_LAT0,
> +     },
> +     {
> +             .compatible = "mediatek,mtk-vcodec-core",
> +             .data = (void *)MTK_VDEC_CORE,
> +     },
> +     {},
> +};
> +EXPORT_SYMBOL_GPL(mtk_vdec_hw_match);

Introducing new compatible strings.  Need a dt-bindings patch for them.

> +static int mtk_vdec_hw_probe(struct platform_device *pdev)
> +{
[...]
> +     subdev_dev->reg_base[VDEC_HW_MISC] =
> +             devm_platform_ioremap_resource_byname(pdev, "misc");
> +     if (IS_ERR((__force void *)subdev_dev->reg_base[VDEC_HW_MISC])) {
> +             ret = PTR_ERR((__force void *)subdev_dev->reg_base[VDEC_HW_MISC]);
> +             goto err;
> +     }

Resource "misc" needs a dt-bindings patch to explain how to use/specify it.

> +     hw_idx = (enum mtk_vdec_hw_id)(uintptr_t)of_id->data;

Does it really need to cast twice?

> +     if (hw_idx < MTK_VDEC_HW_MAX) {
> +             main_dev->subdev_dev[hw_idx] = subdev_dev;
> +             subdev_dev->hw_idx = hw_idx;
> +             subdev_dev->main_dev = main_dev;
> +             subdev_dev->reg_base[VDEC_HW_SYS] =
> +                     main_dev->reg_base[VDEC_HW_SYS];
> +             set_bit(subdev_dev->hw_idx, main_dev->hardware_bitmap);
> +     }

mtk_vcodec_subdev_device_check() doesn't check the value of
of_id->data.  Does it make more sense to align the implementation?  If
hw_idx is equal to or bigger than MTK_VDEC_HW_MAX, shall it print
warning messages for example.

> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
[...]
> +#define VDEC_HW_ACTIVE 0x10
> +#define VDEC_IRQ_CFG 0x11
> +#define VDEC_IRQ_CLR 0x10
> +#define VDEC_IRQ_CFG_REG 0xa4

If only mtk_vcodec_dec_hw.c uses them, could they move to the file?

> @@ -423,6 +436,11 @@ struct mtk_vcodec_enc_pdata {
>   * @pm: power management control
>   * @dec_capability: used to identify decode capability, ex: 4k
>   * @enc_capability: used to identify encode capability
> + *
> + * @subdev_dev: subdev hardware device
> + * @subdev_node: subdev node
> + *
> + * @hardware_bitmap: used to record hardware is ready or not
>   */
>  struct mtk_vcodec_dev {
>       struct v4l2_device v4l2_dev;
> @@ -460,6 +478,11 @@ struct mtk_vcodec_dev {
>       struct mtk_vcodec_pm pm;
>       unsigned int dec_capability;
>       unsigned int enc_capability;
> +
> +     void *subdev_dev[MTK_VDEC_HW_MAX];
> +     struct device_node *subdev_node[MTK_VDEC_HW_MAX];
> +
> +     DECLARE_BITMAP(hardware_bitmap, MTK_VDEC_HW_MAX);

I would prefer to use name `subdev_bitmap`.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
