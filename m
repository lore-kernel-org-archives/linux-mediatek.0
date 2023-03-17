Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5BEC74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 12:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thMf+lug8NwzjJ8UrWmYkebi5ayFtZtj8+KQizln9XY=; b=nTRZLMJANXPMA8ydX0hYhwbhLo
	qC9SIQ+K4Ibos3EA3qohWOGKYPbs9OSMgNkXM7O3NIj/Ko2O7JHtkVFpx4W59j1HeuU0KQj1vyii9
	MruvWJwIqnC2jBMAcXqWStNel+Avt5w3Vb+HYAJGxhHbaM0Lbd8hboEmzQaea9rgYpIP1c96uWSQa
	hXLyOsShNvHsUJTm6Jo3PRhXLy9FLQ08lMSUv7RfuMFwn0NKHvgMdPaI6sZHzOSo3K9sRxYR4aEId
	+t6XgNGJaESeAoxxNAh3DSALwdjRuDk93rlWFj0Bbj1WnQRzs+gafJ6B0BRbzbDY6QYa892pM3wHX
	2IibB5IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd9Ii-002DRo-1M;
	Fri, 17 Mar 2023 12:35:16 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd9If-002DQS-0D
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Mar 2023 12:35:14 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-17ac5ee3f9cso5522122fac.12
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Mar 2023 05:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679056509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=thMf+lug8NwzjJ8UrWmYkebi5ayFtZtj8+KQizln9XY=;
        b=xmfw8yR+09QFjq8j8pD21JCCAbazLOrVVwkXx1uQOnrsMhQ56LaTqz7iofglA+G4YA
         XfVcmSQjfkaPKV5kiDToJk0K/tAg2frbid7zBizW7wmcCWRFpXBx7RCmGUcZlGk7oZb/
         b3EX6cdBQgxMYrL6vJY0bJ0UgFa1ER0tTx7yhA5xvFDZLerC/J2V9cbX5OhDhsT74mUR
         bDsTNr4cyQkk7Fib1uj1jTU797Ij9r+Yyf2xSgja8yc4Hz4ziuufP5/2b7z1Jv7sDBpQ
         IOoZUV3r3H+0KD+js1JmHQM0z97//loglRePmJYZ0aObiGUVpXR5SIay1ZGSgOxkHFYZ
         +iJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679056509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thMf+lug8NwzjJ8UrWmYkebi5ayFtZtj8+KQizln9XY=;
        b=Fmq4u6KifrXnLKmNKYRXEZEX4f9jATNBHl0iYlVnZSiLUvpRWkuJjZ/N8j92vG5+PW
         n18ryw5bGHIkEWbZQrA5eEXReoPc2xHhuiGVYcOFT37D+xoCTgryUNumv4qNczVvi2n2
         wKPKyoOcapdjbD+VbvALvR+EiT/QqezUwvaJAFsoaVt6anFjafQrr6TSA8YAY9cpWiJo
         WjnBewh+5UJNdJbOCBSIXmlG0ozpQvZJ67ejTqi4iLjzvnap9JH/1PocP92e4xZiP25E
         cufCoGFRbgmEPMzqV373kMGVSSvFJ67bjjWB9VQiiwd7rzI9XE3gAkgxw/sAxMFBp8xW
         Up0w==
X-Gm-Message-State: AO0yUKW8J3HO1LvKYCjRAm+yL1kVhyy2zt38tPGe98j/wA2RJ0NXEbvJ
	M/6Evc+KPPC/XDbcHh+ZDjfIMxsLx7cv+qVmzddB0Q==
X-Google-Smtp-Source: AK7set/Ipwo0vFR/sCF+tDORfKSTUbgHqFFe4H0pGWPJ3eeNy9t52Zo2aJ2GyN3NAEbtCN4lI2/IPaKVe6oKYMf2UTE=
X-Received: by 2002:a05:6870:be99:b0:17a:ac8f:57fb with SMTP id
 nx25-20020a056870be9900b0017aac8f57fbmr6036066oab.6.1679056508771; Fri, 17
 Mar 2023 05:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230317080942.183514-1-yanchao.yang@mediatek.com> <20230317080942.183514-2-yanchao.yang@mediatek.com>
In-Reply-To: <20230317080942.183514-2-yanchao.yang@mediatek.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Fri, 17 Mar 2023 13:34:32 +0100
Message-ID: <CAMZdPi9_xYO_MQ0BpxcqDci761uu=ZoczGMg81qkEDeOsP6apw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 01/10] net: wwan: tmi: Add PCIe core
To: Yanchao Yang <yanchao.yang@mediatek.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev ML <netdev@vger.kernel.org>, 
	kernel ML <linux-kernel@vger.kernel.org>, Intel experts <linuxwwan@intel.com>, 
	Chetan <m.chetan.kumar@intel.com>, MTK ML <linux-mediatek@lists.infradead.org>, 
	Liang Lu <liang.lu@mediatek.com>, Haijun Liu <haijun.liu@mediatek.com>, 
	Hua Yang <hua.yang@mediatek.com>, Ting Wang <ting.wang@mediatek.com>, 
	Felix Chen <felix.chen@mediatek.com>, Mingliang Xu <mingliang.xu@mediatek.com>, 
	Min Dong <min.dong@mediatek.com>, Aiden Wang <aiden.wang@mediatek.com>, 
	Guohao Zhang <guohao.zhang@mediatek.com>, Chris Feng <chris.feng@mediatek.com>, 
	Lambert Wang <lambert.wang@mediatek.com>, Mingchuang Qiao <mingchuang.qiao@mediatek.com>, 
	Xiayu Zhang <xiayu.zhang@mediatek.com>, Haozhe Chang <haozhe.chang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_053513_115562_D2762A13 
X-CRM114-Status: GOOD (  26.41  )
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

Hi Yanchao,

On Fri, 17 Mar 2023 at 09:10, Yanchao Yang <yanchao.yang@mediatek.com> wrote:
>
> Registers the TMI device driver with the kernel. Set up all the fundamental
> configurations for the device: PCIe layer, Modem Host Cross Core Interface
> (MHCCIF), Reset Generation Unit (RGU), modem common control operations and
> build infrastructure.
>
> * PCIe layer code implements driver probe and removal, MSI-X interrupt
> initialization and de-initialization, and the way of resetting the device.
> * MHCCIF provides interrupt channels to communicate events such as handshake,
> PM and port enumeration.
> * RGU provides interrupt channels to generate notifications from the device
> so that the TMI driver could get the device reset.
> * Modem common control operations provide the basic read/write functions of
> the device's hardware registers, mask/unmask/get/clear functions of the
> device's interrupt registers and inquiry functions of the device's status.
>
> Signed-off-by: Yanchao Yang <yanchao.yang@mediatek.com>
> Signed-off-by: Ting Wang <ting.wang@mediatek.com>
> ---
>  drivers/net/wwan/Kconfig                 |  14 +
>  drivers/net/wwan/Makefile                |   1 +
>  drivers/net/wwan/mediatek/Makefile       |   8 +
>  drivers/net/wwan/mediatek/mtk_dev.h      | 203 ++++++
>  drivers/net/wwan/mediatek/pcie/mtk_pci.c | 887 +++++++++++++++++++++++
>  drivers/net/wwan/mediatek/pcie/mtk_pci.h | 144 ++++
>  drivers/net/wwan/mediatek/pcie/mtk_reg.h |  69 ++
>  7 files changed, 1326 insertions(+)
>  create mode 100644 drivers/net/wwan/mediatek/Makefile
>  create mode 100644 drivers/net/wwan/mediatek/mtk_dev.h
>  create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_pci.c
>  create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_pci.h
>  create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_reg.h
>

[...]

> +static int mtk_pci_get_virq_id(struct mtk_md_dev *mdev, int irq_id)
> +{
> +       struct pci_dev *pdev = to_pci_dev(mdev->dev);
> +       int nr = 0;
> +
> +       if (pdev->msix_enabled)
> +               nr = irq_id % mdev->msi_nvecs;
> +
> +       return pci_irq_vector(pdev, nr);
> +}
> +
> +static int mtk_pci_register_irq(struct mtk_md_dev *mdev, int irq_id,
> +                               int (*irq_cb)(int irq_id, void *data), void *data)
> +{
> +       struct mtk_pci_priv *priv = mdev->hw_priv;
> +
> +       if (unlikely((irq_id < 0 || irq_id >= MTK_IRQ_CNT_MAX) || !irq_cb))
> +               return -EINVAL;
> +
> +       if (priv->irq_cb_list[irq_id]) {
> +               dev_err(mdev->dev,
> +                       "Unable to register irq, irq_id=%d, it's already been register by %ps.\n",
> +                       irq_id, priv->irq_cb_list[irq_id]);
> +               return -EFAULT;
> +       }
> +       priv->irq_cb_list[irq_id] = irq_cb;
> +       priv->irq_cb_data[irq_id] = data;

So it looks like you re-implement your own irq chip internally. What
about creating a new irq-chip/domain for this (cf irq_domain_add_simple)?
That would allow the client code to use the regular irq interface and helpers
and it should simply code and improve its debuggability (/proc/irq...).

[...]

> +static int mtk_mhccif_register_evt(struct mtk_md_dev *mdev, u32 chs,
> +                                  int (*evt_cb)(u32 status, void *data), void *data)
> +{
> +       struct mtk_pci_priv *priv = mdev->hw_priv;
> +       struct mtk_mhccif_cb *cb;
> +       unsigned long flag;
> +       int ret = 0;
> +
> +       if (!chs || !evt_cb)
> +               return -EINVAL;
> +
> +       spin_lock_irqsave(&priv->mhccif_lock, flag);

Why spinlock here and not mutex. AFAIU, you always take this lock in a
non-atomic/process context.

> +       list_for_each_entry(cb, &priv->mhccif_cb_list, entry) {
> +               if (cb->chs & chs) {
> +                       ret = -EFAULT;
> +                       dev_err(mdev->dev,
> +                               "Unable to register evt, chs=0x%08X&0x%08X registered_cb=%ps\n",
> +                               chs, cb->chs, cb->evt_cb);
> +                       goto err;
> +               }
> +       }
> +       cb = devm_kzalloc(mdev->dev, sizeof(*cb), GFP_ATOMIC);
> +       if (!cb) {
> +               ret = -ENOMEM;
> +               goto err;
> +       }
> +       cb->evt_cb = evt_cb;
> +       cb->data = data;
> +       cb->chs = chs;
> +       list_add_tail(&cb->entry, &priv->mhccif_cb_list);
> +
> +err:
> +       spin_unlock_irqrestore(&priv->mhccif_lock, flag);
> +
> +       return ret;
> +}

[...]

> +
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/net/wwan/mediatek/pcie/mtk_pci.h b/drivers/net/wwan/mediatek/pcie/mtk_pci.h
> new file mode 100644
> index 000000000000..b487ca9b302e
> --- /dev/null
> +++ b/drivers/net/wwan/mediatek/pcie/mtk_pci.h

Why a separated header file, isn't the content (e.g. mtk_pci_priv)
used only from mtk_pci.c?

> @@ -0,0 +1,144 @@
> +/* SPDX-License-Identifier: BSD-3-Clause-Clear
> + *
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#ifndef __MTK_PCI_H__
> +#define __MTK_PCI_H__
> +
> +#include <linux/pci.h>
> +#include <linux/spinlock.h>
> +
> +#include "../mtk_dev.h"
> +
> +enum mtk_atr_type {
> +       ATR_PCI2AXI = 0,
> +       ATR_AXI2PCI
> +};

[...]

Regards,
Loic

