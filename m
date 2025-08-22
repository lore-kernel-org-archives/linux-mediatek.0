Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A07CA0FED
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoZdK50/K/LczwYuf75UT/ft4tdjCZI9J4+8Ndo+nls=; b=04iwjLIOy58iaWH9r3xDN+jhgZ
	bwECPBvSL/TSChvZm1MtoNbqPHHGkIbYbznBMzU4VL7tblQ0MSK7nXwSgu0CB43f9fZt7IaWnmzEz
	w6pSHHTMPSSW+svI7Nuh+Q0W2W0uCun1wseU9aGbZb4IeBnYXCq0UHKs1rmjHAVQzCxzTiN4WgDe0
	Zd6Zc2ai0zMfB1ouxICsDgy7NJWxqoG19EhkrcdD2CxAI9SOIfyBFxJKgXVNug9JmzIBgwJcXtRxa
	bLheBybDIzcrVpNkyG8qwi2HPy1Lvklt6/c9IDQvKmOfr0yFxUy3XbJ1/fs8tMPiLgCE+NfvLj51X
	/ZmiKoXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSan-00000002kDr-2GRI;
	Fri, 22 Aug 2025 14:18:09 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKdo-00000001cWS-1gxv
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Aug 2025 05:48:46 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-55ce526ac04so1635833e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Aug 2025 22:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755841723; x=1756446523; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JoZdK50/K/LczwYuf75UT/ft4tdjCZI9J4+8Ndo+nls=;
        b=jtNKnAoAJHlzQ1ikIixAdXIAq8jHKpGkb3p9al2GjP1IPz4+8OcXKyjry2vn37R6tn
         RPrbiz3y4ahH6MVCd/mSQYcXjrJXRJOVy6jdeOChakoYxl7ZRMk29yVHpVet5b5JhtLk
         PmPwkYbedxZ2UsA1YGdFZMxCfKa+dmbxXx+vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755841723; x=1756446523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JoZdK50/K/LczwYuf75UT/ft4tdjCZI9J4+8Ndo+nls=;
        b=M8kIaVd+PTdNS6eVW9Qt4HdsX5jDeSU/7/kEWTiD6tLIAkneG6AUShgcyXT1LasNbi
         ju83PW5nw/EQsnE4oGyyiMtEK+N0saWRlrsdOMFBdSqP7PcALJo0+Bd0Ca6/a8xXQwya
         iAFJ1M+fODMlO2/1cGC1pXMnf73VKJkJ3/74Boo5uz1ikWIMzO+IjK8B7Vit2jUu5p8H
         HIjtrmE6e+jHPxmq0+IZ8tYkEdmhgXTt9yyo+Nsi1X7sbF4Wrwde3KFD33c1KTOVueIl
         VoK5ahqCsM7Ax7rZPYGpY5t4a3vHdeXWTw/zpEwMHBWLTwYXQqUi3z1orV2JAF0W/nI9
         Q9jg==
X-Forwarded-Encrypted: i=1; AJvYcCVDss3/0YhNzXP9cGYQ6Qadsb2FvBb85mwhU8670OLZCBafio2390C+XS5pUCDPe95YHsfghMmsD4ykOpQGkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVGrlulz+pYXEcxjL+Jv+qpxCYyIcJQLURTAGe9XVBHqKUV+GU
	fz5x8hxYWUX2VEdmkzQtreu3hjpLs7iPo9q6/LOerpbM1W2W5ODFuabzHuG8/5gtc54VnyUSNSP
	eY5hgS4jeEOtLluIDCGonRPDJdsn82sVPQ7LFkxiG
X-Gm-Gg: ASbGncsspBUf4PWFYoNdJIVpuOX2MDTC6Q6Nryhhd7Q1DKp4Lys2CeLrKbMVPIlwYr/
	WLrzd4NEFujyFNGl+hZJJfSE9g3WldyNiybZjLQHuRDDq05usbXlNUQa4UxEpfjwwhGCckBeJ8l
	Uhydb3yWwG6NEq7XmQSEeiWH6BzDoKRFP15ENJqqqnMsjF0zUe9ckGtQAyLPIUgeOTZbbPhC6HB
	QcDUUICIyKUdPWXzuqQdUHky9RM7smXN6M=
X-Google-Smtp-Source: AGHT+IEOuz9T18C75t4W7tyeC9lnODFUjUpRpgTCCiVHNHFZ4PPPT3oCCCaMJRon2fKjlUHHOi/9WQ3aPKorH0u9spA=
X-Received: by 2002:a05:6512:3186:b0:55b:9796:5d5a with SMTP id
 2adb3069b0e04-55f0cd0ab86mr647597e87.26.1755841722615; Thu, 21 Aug 2025
 22:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250822021217.1598-1-jjian.zhou@mediatek.com> <20250822021217.1598-3-jjian.zhou@mediatek.com>
In-Reply-To: <20250822021217.1598-3-jjian.zhou@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 22 Aug 2025 13:48:31 +0800
X-Gm-Features: Ac12FXyAx8hC-gVdNoD4NtkuABbLquAi1UhZ0eVGRrEels7y4nJgdo90ksrJ3Zs
Message-ID: <CAGXv+5GHSinkMHhBxRekfCxFK8my8JqeeRBsGXGuWDqH=MjmTQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
To: Jjian Zhou <jjian.zhou@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_224844_468193_F4D5EE01 
X-CRM114-Status: GOOD (  33.24  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Aug 22, 2025 at 10:12=E2=80=AFAM Jjian Zhou <jjian.zhou@mediatek.co=
m> wrote:
>
> Add mtk-vcp-mailbox driver to support the communication with
> VCP remote microprocessor.
>
> Signed-off-by: Jjian Zhou <jjian.zhou@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

A couple minor comments below.

> ---
>  drivers/mailbox/Kconfig                 |   9 ++
>  drivers/mailbox/Makefile                |   2 +
>  drivers/mailbox/mtk-vcp-mailbox.c       | 174 ++++++++++++++++++++++++
>  include/linux/mailbox/mtk-vcp-mailbox.h |  32 +++++
>  4 files changed, 217 insertions(+)
>  create mode 100644 drivers/mailbox/mtk-vcp-mailbox.c
>  create mode 100644 include/linux/mailbox/mtk-vcp-mailbox.h
>
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 02432d4a5ccd..c28bdb855663 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -294,6 +294,15 @@ config MTK_CMDQ_MBOX
>           critical time limitation, such as updating display configuratio=
n
>           during the vblank.
>
> +config MTK_VCP_MBOX
> +       tristate "MediaTek VCP Mailbox Support"
> +       depends on ARCH_MEDIATEK || COMPILE_TEST
> +       help
> +         Say yes here to add support for the MediaTek VCP mailbox driver=
.
> +         The mailbox implementation provides access from the application
> +         processor to Video Companion Processor Unit.
> +         If unsure say N.
> +
>  config ZYNQMP_IPI_MBOX
>         tristate "Xilinx ZynqMP IPI Mailbox"
>         depends on ARCH_ZYNQMP && OF
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 98a68f838486..07278871d254 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -63,6 +63,8 @@ obj-$(CONFIG_MTK_ADSP_MBOX)   +=3D mtk-adsp-mailbox.o
>
>  obj-$(CONFIG_MTK_CMDQ_MBOX)    +=3D mtk-cmdq-mailbox.o
>
> +obj-$(CONFIG_MTK_VCP_MBOX)     +=3D mtk-vcp-mailbox.o
> +
>  obj-$(CONFIG_ZYNQMP_IPI_MBOX)  +=3D zynqmp-ipi-mailbox.o
>
>  obj-$(CONFIG_SUN6I_MSGBOX)     +=3D sun6i-msgbox.o
> diff --git a/drivers/mailbox/mtk-vcp-mailbox.c b/drivers/mailbox/mtk-vcp-=
mailbox.c
> new file mode 100644
> index 000000000000..6f48215896d2
> --- /dev/null
> +++ b/drivers/mailbox/mtk-vcp-mailbox.c
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 MediaTek Corporation. All rights reserved.
> + * Author: Jjian Zhou <jjian.zhou.@mediatek.com>
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/mailbox/mtk-vcp-mailbox.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +struct mtk_vcp_mbox_priv {
> +       void __iomem *base;
> +       struct device *dev;
> +       struct mbox_controller mbox;
> +       const struct mtk_vcp_mbox_cfg *cfg;
> +       struct mtk_ipi_info ipi_recv;
> +};
> +
> +struct mtk_vcp_mbox_cfg {
> +       u32 set_in;
> +       u32 clr_out;
> +};
> +
> +static inline struct mtk_vcp_mbox_priv *get_mtk_vcp_mbox_priv(struct mbo=
x_controller *mbox)
> +{
> +       return container_of(mbox, struct mtk_vcp_mbox_priv, mbox);
> +}
> +
> +static irqreturn_t mtk_vcp_mbox_irq_thread(int irq, void *data)
> +{
> +       struct mbox_chan *chan =3D data;
> +       struct mtk_vcp_mbox_priv *priv =3D get_mtk_vcp_mbox_priv(chan->mb=
ox);

Since there's only one mailbox, you can just pass the private data,
instead of passing the mbox_chan.

> +
> +       /* get irq status */
> +       priv->ipi_recv.irq_status =3D readl(priv->base + priv->cfg->clr_o=
ut);
> +
> +       __ioread32_copy(priv->ipi_recv.msg, priv->base, MBOX_SLOT_MAX_SIZ=
E / 4);
> +
> +       mbox_chan_received_data(chan, &priv->ipi_recv);
> +
> +       /* clear irq status */
> +       writel(priv->ipi_recv.irq_status, priv->base + priv->cfg->clr_out=
);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static struct mbox_chan *mtk_vcp_mbox_xlate(struct mbox_controller *mbox=
,
> +                                           const struct of_phandle_args =
*sp)
> +{
> +       if (sp->args_count)
> +               return NULL;
> +
> +       return mbox->chans;
> +}
> +
> +static int mtk_vcp_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +       struct mtk_vcp_mbox_priv *priv =3D get_mtk_vcp_mbox_priv(chan->mb=
ox);
> +       struct mtk_ipi_info *ipi_info =3D data;
> +       u32 status;
> +
> +       if (!ipi_info->msg) {
> +               dev_err(priv->dev, "msg buffer is NULL.\n");
> +               return -EINVAL;
> +       }
> +
> +       status =3D readl(priv->base + priv->cfg->set_in) & BIT(ipi_info->=
index);
> +       if (status) {
> +               dev_warn(priv->dev, "mailbox IPI %d is busy.\n", ipi_info=
->id);
> +               return -EBUSY;
> +       }
> +
> +       if (ipi_info->slot_ofs + ipi_info->len > MBOX_SLOT_MAX_SIZE)
> +               return -EINVAL;
> +       __iowrite32_copy(priv->base + ipi_info->slot_ofs, ipi_info->msg,
> +                        ipi_info->len);
> +
> +       writel(BIT(ipi_info->index), priv->base + priv->cfg->set_in);
> +
> +       return 0;
> +}
> +
> +static bool mtk_vcp_mbox_last_tx_done(struct mbox_chan *chan)
> +{
> +       struct mtk_ipi_info *ipi_info =3D chan->active_req;
> +       struct mtk_vcp_mbox_priv *priv =3D get_mtk_vcp_mbox_priv(chan->mb=
ox);
> +
> +       return !(readl(priv->base + priv->cfg->set_in) & BIT(ipi_info->in=
dex));
> +}
> +
> +static const struct mbox_chan_ops mtk_vcp_mbox_chan_ops =3D {
> +       .send_data      =3D mtk_vcp_mbox_send_data,
> +       .last_tx_done   =3D mtk_vcp_mbox_last_tx_done,
> +};
> +
> +static int mtk_vcp_mbox_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct mtk_vcp_mbox_priv *priv;
> +       struct mbox_controller *mbox;
> +       int ret, irq;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->dev =3D dev;
> +       mbox =3D &priv->mbox;
> +       mbox->dev =3D dev;
> +       mbox->ops =3D &mtk_vcp_mbox_chan_ops;
> +       mbox->txdone_irq =3D false;
> +       mbox->txdone_poll =3D true;
> +       mbox->of_xlate =3D mtk_vcp_mbox_xlate;
> +       mbox->num_chans =3D 1;
> +       mbox->chans =3D devm_kzalloc(dev, sizeof(*mbox->chans), GFP_KERNE=
L);
> +       if (!mbox->chans)
> +               return -ENOMEM;
> +
> +       priv->ipi_recv.msg =3D devm_kzalloc(dev, MBOX_SLOT_MAX_SIZE, GFP_=
KERNEL);
> +       if (!priv->ipi_recv.msg)
> +               return -ENOMEM;
> +
> +       priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(priv->base))
> +               return PTR_ERR(priv->base);
> +
> +       priv->cfg =3D of_device_get_match_data(dev);
> +       if (!priv->cfg)
> +               return -EINVAL;
> +
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return irq;
> +
> +       ret =3D devm_request_threaded_irq(dev, irq, NULL,
> +                                       mtk_vcp_mbox_irq_thread, IRQF_ONE=
SHOT,
> +                                       dev_name(dev), mbox->chans);
> +       if (ret < 0)
> +               return ret;
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       return devm_mbox_controller_register(dev, &priv->mbox);
> +}
> +
> +static const struct mtk_vcp_mbox_cfg mt8196_cfg =3D {
> +       .set_in         =3D 0x100,
> +       .clr_out        =3D 0x10C,

                                ^ use lowercase for hex numbers.

> +};
> +
> +static const struct of_device_id mtk_vcp_mbox_of_match[] =3D {
> +       { .compatible =3D "mediatek,mt8196-vcp-mbox", .data =3D &mt8196_c=
fg },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_vcp_mbox_of_match);
> +
> +static struct platform_driver mtk_vcp_mbox_driver =3D {
> +       .probe          =3D mtk_vcp_mbox_probe,
> +       .driver =3D {
> +               .name   =3D "mtk_vcp_mbox",
> +               .of_match_table =3D mtk_vcp_mbox_of_match,
> +       },
> +};
> +module_platform_driver(mtk_vcp_mbox_driver);
> +
> +MODULE_AUTHOR("Jjian Zhou <jjian.zhou@mediatek.com>");
> +MODULE_DESCRIPTION("MTK VCP Mailbox Controller");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mailbox/mtk-vcp-mailbox.h b/include/linux/mail=
box/mtk-vcp-mailbox.h
> new file mode 100644
> index 000000000000..143fb0d06e30
> --- /dev/null
> +++ b/include/linux/mailbox/mtk-vcp-mailbox.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_VCP_MAILBOX_H__
> +#define __MTK_VCP_MAILBOX_H__
> +
> +#define MBOX_SLOT_MAX_SIZE     0x100 /* mbox max slot size */
> +
> +/**
> + * struct mtk_ipi_info - mailbox message info for mtk-vcp-mailbox
> + * @msg: The share buffer between IPC and mailbox driver
> + * @len: Message length
> + * @id: This is for identification purposes and not actually used
> + *     by the mailbox hardware.
> + * @index: The signal number of the mailbox message.
> + * @slot_ofs: Data slot offset.
> + * @irq_status: Captures incoming signals for the RX path.
> + *
> + * It is used between IPC with mailbox driver.
> + */
> +struct mtk_ipi_info {
> +       void *msg;
> +       u32 len;
> +       u32 id;
> +       u32 index;
> +       u32 slot_ofs;
> +       u32 irq_status;
> +};
> +
> +#endif
> --
> 2.46.0
>

