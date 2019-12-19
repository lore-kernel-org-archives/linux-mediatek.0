Return-Path: <SRS0=dCaZ=2J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCEDC2D0C0
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 03:56:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E780021582
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 03:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iHJZplI5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SjvfDYSr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E780021582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btVnzQ9gzmblTX4mKZ/zPnxITSAFRuoVdoW8385kZOk=; b=iHJZplI5kRLKmO
	n8FrXxC/8Dzrc+d+vOioeuVqAW0GhvTWThwtJ+8aORMA++ZMoDjYRAs7wGOriQwQY26yEmOjYri2t
	Da/BM7cGq+e4DdchnXYIOvBqZJToaS9AxyXadOP5p/Z/KtvVcsZagFuumyQECGq2B7Squ8H9UhngM
	E9mWAsAMe3s9CNbfOjxuYIWeIY55r3/dweXnjKpm08afsOOTf14kYNIqA0tKPQjTau3dlJvH6mFJX
	C9aJEh39i1epGlMYYFurbckxHq+nJZbsH2fKLiug11Yi72zUFfSShgbLxFwlEDvuU4IvYqfcmTSEj
	fC5J7yQurRbK+oi8cj4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihmvZ-0004lz-CT; Thu, 19 Dec 2019 03:56:41 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihmvN-0004bx-Iu
 for linux-mediatek@lists.infradead.org; Thu, 19 Dec 2019 03:56:31 +0000
Received: by mail-qk1-x742.google.com with SMTP id z14so2288442qkg.9
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Dec 2019 19:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fHnDeCTSpOncu/mxWBmOui8QwOBoNPyxepaSQcLW2SM=;
 b=SjvfDYSrkno4KLsQVZn7YE36zb/kYQUU6iSP+XAS1HHBzNv4K1039nuqhcgERE7Svg
 7VMouNrKJ11b/gyHGMfy13Hq964YAPxPV7zheFA5D5BQAjexgjFufM2NudTJVrUWdvuP
 XRMDWD0YPI7e9kRTMug6XBiteWovQWsoHvzlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fHnDeCTSpOncu/mxWBmOui8QwOBoNPyxepaSQcLW2SM=;
 b=BEAKBWibSzS8qj8JPqY570op/kov5PRIwH+MoCjqcUouOXJlB9jNHveiy0gKwysEWT
 OdVfruqS8RoVDBVBS+gvIfLL/v87uz6rWPycZNP5ivVqJ981JhmzUi+oiOODiNCfs06W
 HTWM7uC9QNS9lDB06U5wLghdl7q4uqTcpOoCHXW9w0iILxWpSkPWuuOXxZVw8oEZUWDS
 WGr9o5XRn2c582RAq5uFpV+ZNiZ9sK5qJU2jisAC0dd104i9EIILz9fyJBD+r8vmjQgq
 Hlpa+hO/vcziMiGGIb1ItOIHm8TJSbSCRUfhGXEHym4Y70k/e8J00RkIlZqkXXuDSxiY
 5E/A==
X-Gm-Message-State: APjAAAVN9kp+ahqX8GtHdcZeMomAGjaVT/5GROWOA65amS9OnBwE1Jtj
 ybAQyeOwFyAZ6jzJPpmU3UXPCvo/IgAWlpJ31SIpSA==
X-Google-Smtp-Source: APXvYqzDRLPuldNit7L4QrxNylEvmsH+Gp//KduZcHs9bl415QmYBGc+rcbAvLw6SBzozwRUW10u+uNhJRBTd0jH688=
X-Received: by 2002:a37:6551:: with SMTP id z78mr6478508qkb.144.1576727788462; 
 Wed, 18 Dec 2019 19:56:28 -0800 (PST)
MIME-Version: 1.0
References: <1576657848-14711-1-git-send-email-weiyi.lu@mediatek.com>
 <1576657848-14711-8-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1576657848-14711-8-git-send-email-weiyi.lu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 19 Dec 2019 11:56:17 +0800
Message-ID: <CANMq1KDSVH0kb0YVf5iiVTs=Bpc742gJWjqk3t0KU5LMzVNJSg@mail.gmail.com>
Subject: Re: [PATCH v10 07/12] soc: mediatek: Remove infracfg misc driver
 support
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_195629_623065_A366C88D 
X-CRM114-Status: GOOD (  20.93  )
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
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Fan Chen <fan.chen@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 18, 2019 at 4:31 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> In previous patches, we introduce scpsys-ext driver that covers
> the functions which infracfg misc driver provided.
> And then replace bus_prot_mask with bp_table of all compatibles.
> Now, we're going to remove infracfg misc drvier which is no longer
> being used.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/soc/mediatek/Kconfig          | 10 -----
>  drivers/soc/mediatek/Makefile         |  3 +-
>  drivers/soc/mediatek/mtk-infracfg.c   | 79 -----------------------------------
>  include/linux/soc/mediatek/infracfg.h | 39 -----------------
>  4 files changed, 1 insertion(+), 130 deletions(-)
>  delete mode 100644 drivers/soc/mediatek/mtk-infracfg.c
>  delete mode 100644 include/linux/soc/mediatek/infracfg.h
>
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index 2114b56..f837b3c 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -10,21 +10,12 @@ config MTK_CMDQ
>         depends on ARCH_MEDIATEK || COMPILE_TEST
>         select MAILBOX
>         select MTK_CMDQ_MBOX
> -       select MTK_INFRACFG
>         help
>           Say yes here to add support for the MediaTek Command Queue (CMDQ)
>           driver. The CMDQ is used to help read/write registers with critical
>           time limitation, such as updating display configuration during the
>           vblank.
>
> -config MTK_INFRACFG
> -       bool "MediaTek INFRACFG Support"
> -       select REGMAP
> -       help
> -         Say yes here to add support for the MediaTek INFRACFG controller. The
> -         INFRACFG controller contains various infrastructure registers not
> -         directly associated to any device.
> -
>  config MTK_PMIC_WRAP
>         tristate "MediaTek PMIC Wrapper Support"
>         depends on RESET_CONTROLLER
> @@ -38,7 +29,6 @@ config MTK_SCPSYS
>         bool "MediaTek SCPSYS Support"
>         default ARCH_MEDIATEK
>         select REGMAP
> -       select MTK_INFRACFG
>         select PM_GENERIC_DOMAINS if PM
>         help
>           Say yes here to add support for the MediaTek SCPSYS power domain
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index b442be9..7bf7e88 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
> -obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o mtk-scpsys-ext.o
>  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
> -obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> +obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o mtk-scpsys-ext.o
> diff --git a/drivers/soc/mediatek/mtk-infracfg.c b/drivers/soc/mediatek/mtk-infracfg.c
> deleted file mode 100644
> index 341c7ac..0000000
> --- a/drivers/soc/mediatek/mtk-infracfg.c
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (c) 2015 Pengutronix, Sascha Hauer <kernel@pengutronix.de>
> - */
> -
> -#include <linux/export.h>
> -#include <linux/jiffies.h>
> -#include <linux/regmap.h>
> -#include <linux/soc/mediatek/infracfg.h>
> -#include <asm/processor.h>
> -
> -#define MTK_POLL_DELAY_US   10
> -#define MTK_POLL_TIMEOUT    (jiffies_to_usecs(HZ))
> -
> -#define INFRA_TOPAXI_PROTECTEN         0x0220
> -#define INFRA_TOPAXI_PROTECTSTA1       0x0228
> -#define INFRA_TOPAXI_PROTECTEN_SET     0x0260
> -#define INFRA_TOPAXI_PROTECTEN_CLR     0x0264
> -
> -/**
> - * mtk_infracfg_set_bus_protection - enable bus protection
> - * @regmap: The infracfg regmap
> - * @mask: The mask containing the protection bits to be enabled.
> - * @reg_update: The boolean flag determines to set the protection bits
> - *              by regmap_update_bits with enable register(PROTECTEN) or
> - *              by regmap_write with set register(PROTECTEN_SET).
> - *
> - * This function enables the bus protection bits for disabled power
> - * domains so that the system does not hang when some unit accesses the
> - * bus while in power down.
> - */
> -int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
> -               bool reg_update)
> -{
> -       u32 val;
> -       int ret;
> -
> -       if (reg_update)
> -               regmap_update_bits(infracfg, INFRA_TOPAXI_PROTECTEN, mask,
> -                               mask);
> -       else
> -               regmap_write(infracfg, INFRA_TOPAXI_PROTECTEN_SET, mask);
> -
> -       ret = regmap_read_poll_timeout(infracfg, INFRA_TOPAXI_PROTECTSTA1,
> -                                      val, (val & mask) == mask,
> -                                      MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> -
> -       return ret;
> -}
> -
> -/**
> - * mtk_infracfg_clear_bus_protection - disable bus protection
> - * @regmap: The infracfg regmap
> - * @mask: The mask containing the protection bits to be disabled.
> - * @reg_update: The boolean flag determines to clear the protection bits
> - *              by regmap_update_bits with enable register(PROTECTEN) or
> - *              by regmap_write with clear register(PROTECTEN_CLR).
> - *
> - * This function disables the bus protection bits previously enabled with
> - * mtk_infracfg_set_bus_protection.
> - */
> -
> -int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
> -               bool reg_update)
> -{
> -       int ret;
> -       u32 val;
> -
> -       if (reg_update)
> -               regmap_update_bits(infracfg, INFRA_TOPAXI_PROTECTEN, mask, 0);
> -       else
> -               regmap_write(infracfg, INFRA_TOPAXI_PROTECTEN_CLR, mask);
> -
> -       ret = regmap_read_poll_timeout(infracfg, INFRA_TOPAXI_PROTECTSTA1,
> -                                      val, !(val & mask),
> -                                      MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> -
> -       return ret;
> -}
> diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
> deleted file mode 100644
> index fd25f01..0000000
> --- a/include/linux/soc/mediatek/infracfg.h
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __SOC_MEDIATEK_INFRACFG_H
> -#define __SOC_MEDIATEK_INFRACFG_H
> -
> -#define MT8173_TOP_AXI_PROT_EN_MCI_M2          BIT(0)
> -#define MT8173_TOP_AXI_PROT_EN_MM_M0           BIT(1)
> -#define MT8173_TOP_AXI_PROT_EN_MM_M1           BIT(2)
> -#define MT8173_TOP_AXI_PROT_EN_MMAPB_S         BIT(6)
> -#define MT8173_TOP_AXI_PROT_EN_L2C_M2          BIT(9)
> -#define MT8173_TOP_AXI_PROT_EN_L2SS_SMI                BIT(11)
> -#define MT8173_TOP_AXI_PROT_EN_L2SS_ADD                BIT(12)
> -#define MT8173_TOP_AXI_PROT_EN_CCI_M2          BIT(13)
> -#define MT8173_TOP_AXI_PROT_EN_MFG_S           BIT(14)
> -#define MT8173_TOP_AXI_PROT_EN_PERI_M0         BIT(15)
> -#define MT8173_TOP_AXI_PROT_EN_PERI_M1         BIT(16)
> -#define MT8173_TOP_AXI_PROT_EN_DEBUGSYS                BIT(17)
> -#define MT8173_TOP_AXI_PROT_EN_CQ_DMA          BIT(18)
> -#define MT8173_TOP_AXI_PROT_EN_GCPU            BIT(19)
> -#define MT8173_TOP_AXI_PROT_EN_IOMMU           BIT(20)
> -#define MT8173_TOP_AXI_PROT_EN_MFG_M0          BIT(21)
> -#define MT8173_TOP_AXI_PROT_EN_MFG_M1          BIT(22)
> -#define MT8173_TOP_AXI_PROT_EN_MFG_SNOOP_OUT   BIT(23)
> -
> -#define MT2701_TOP_AXI_PROT_EN_MM_M0           BIT(1)
> -#define MT2701_TOP_AXI_PROT_EN_CONN_M          BIT(2)
> -#define MT2701_TOP_AXI_PROT_EN_CONN_S          BIT(8)
> -
> -#define MT7622_TOP_AXI_PROT_EN_ETHSYS          (BIT(3) | BIT(17))
> -#define MT7622_TOP_AXI_PROT_EN_HIF0            (BIT(24) | BIT(25))
> -#define MT7622_TOP_AXI_PROT_EN_HIF1            (BIT(26) | BIT(27) | \
> -                                                BIT(28))
> -#define MT7622_TOP_AXI_PROT_EN_WB              (BIT(2) | BIT(6) | \
> -                                                BIT(7) | BIT(8))

It was really nice to have these all defined, can we move those to
scpsys-ext.h? (and do the same for MT8183?)

> -int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
> -               bool reg_update);
> -int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
> -               bool reg_update);
> -#endif /* __SOC_MEDIATEK_INFRACFG_H */
> --
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
