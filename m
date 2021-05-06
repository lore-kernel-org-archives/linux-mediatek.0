Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BADAC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 11:33:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCA4C613C5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 11:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCA4C613C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Q2lT/kS+krQR+V66FTaGCjM4iU2j8YQY9zw9j6FbOI=; b=o30v0p/Qzzv+jgBPjVh7HOeX7
	WKbDyV2M04TgiYcK7uAJtTrK24uhLgfe9XLqtXz5xnXi+VejQaBICsihO6Wj9XOEE9n6EEFHmmGzh
	1fj/RMTXFk0B7XDMY+DdAkfGB3PF5ZJS/5DSWWeS8dRQkfEbyAMFs/Ca8LK5ONuCinsAd/bIhWDRb
	XNH2VPnyIvf0nBkhE8v9c8rrGqOHMmSKgPXhaE5IvRtiILKKCbMRUbOKjLJpWQGVGRw4mbhApRC/j
	GzAqoyeNadLvCV5yY7jJme5o2m1LpQLZdiEkYmJhLBw7OK26ewtSMmWCHL3+PT2HekXucA/9kedBg
	snVrrr/Jg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lecGA-0048hE-No; Thu, 06 May 2021 11:33:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lecG5-0048gj-1c
 for linux-mediatek@desiato.infradead.org; Thu, 06 May 2021 11:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=u+7qdlluiqhLlsnV3gq9b/KX/0q/cP8G/iZNlQREXZE=; b=XBy9jjKz78LxeBbtRrSeVhppGq
 swJNUYC9m9ZKqdCvv/W0SvVp7PLq67i9nhWHjZRNLBi6wkSbWEt8UtPr6ZffqmG92O7+u8489D6Zr
 QC0pD2b64FujyuuRvcSQcj8RxfWIM8tzqD7IzkFFLizEBaxfyVL9sTnsrEw6EBImbfEIxp6LYxcE5
 zgleQ9hFEV/Sawho/02TjqAFmAi9R4q4hXA7kUGQhodRDZRURPgemZp6xcjJ/Q9wJw72u2r7TCCby
 zJU+QqygQoKOS0Hql5pBL+vVaoDoQigWg28gL0fIS6+tgwHdJ4Xj3lSCNfjRf+5yPDlIhE9Uh8l48
 cepfD6Cg==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lecG2-005zRo-Es
 for linux-mediatek@lists.infradead.org; Thu, 06 May 2021 11:33:31 +0000
Received: by mail-wr1-x42c.google.com with SMTP id s8so5228110wrw.10
 for <linux-mediatek@lists.infradead.org>; Thu, 06 May 2021 04:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u+7qdlluiqhLlsnV3gq9b/KX/0q/cP8G/iZNlQREXZE=;
 b=rUSjyB7C+t0snsq+9mLu7cnZ3YSX+XpYSLlPoTYk9tqUjMRIBGuz0zGz2bD2HsiEy8
 NhQpfeuhVg9QiTijfHfihy6SUZRhlnW0D5jHun3TK1RRi78W0xkpiGbyVUBkZQreZdX4
 OZ967E7r//pw2Yl4ZwPzgateP5SeijEyHTAQdlTntCxjdyupgqDVUMlGbaCSfVqnB1V/
 bcAE3G5Brz/ZS8yPjw1bfo7bOekK8wD6DFEl2pfrxGYRAyIyaTqyBl5zSryQheTu2xHc
 CHeCl7SvrLVUzqhDp5Oksu46M0otP8mGg2UcI9taw3RzV5iuBd4Mn0hzEI2dk7YaVx3t
 cHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u+7qdlluiqhLlsnV3gq9b/KX/0q/cP8G/iZNlQREXZE=;
 b=Qbuoho+BHcrPUiyxxqjnn2Rc8lfmd7e+enVpy46W3qvXjrWbE7vKHk4MXoMu9xwBrb
 Ychg8hqyqciq0xmEz+fs3rSfPh7V0PqZPrrn9C9Pc303Leou9SJF1WS8cupCWheqNiio
 gUE3eG8QgqZiTXvTuCRpRWrFojkEGEzzGRUM6wlZHgqAu72Pg4wFpiYGwus8e8do7yu0
 EZ8RudmSXjD1cRWRbA3f3ymTpVnxa9EhiqjOw8XOp0hwWYzTukUGdVaJyXKOyTlpJ6s0
 /XrpmNKpS2v5z62fGezRjcas2xRHLECTiR8lE8u4iXQuEgrGH03S/7Tp1XDYKVbKPxRV
 tfOw==
X-Gm-Message-State: AOAM530+NHq/jgbmttVwKgcjm4IG2AEeN13xrOUDwKQ0ZEA03WFVClDw
 CfnN8DE8SUw2H+p3mlLPAOE=
X-Google-Smtp-Source: ABdhPJwpbeHUdYneO0nNVFCeAH3zv1T+v19f4HhDDmSVCIyFhho0+q+jLy0AD7oP/7H7BxWpo8hksQ==
X-Received: by 2002:adf:fa4c:: with SMTP id y12mr4506051wrr.393.1620300808495; 
 Thu, 06 May 2021 04:33:28 -0700 (PDT)
Received: from skbuf ([86.127.41.210])
 by smtp.gmail.com with ESMTPSA id f8sm3078987wmc.8.2021.05.06.04.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 04:33:28 -0700 (PDT)
Date: Thu, 6 May 2021 14:33:25 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH net-next 1/4] net: phy: add MediaTek PHY driver
Message-ID: <20210506113325.b7kwybdgxkoj7rqp@skbuf>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429062130.29403-2-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429062130.29403-2-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_043330_525745_2D2996B6 
X-CRM114-Status: GOOD (  21.15  )
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

On Thu, Apr 29, 2021 at 02:21:27PM +0800, DENG Qingfang wrote:
> Add support for MediaTek PHYs found in MT7530 and MT7531 switches.
> The initialization procedure is from the vendor driver, but due to lack
> of documentation, the function of some register values remains unknown.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
> RFC v4 -> PATCH v1:
> - No changes.
> 
>  drivers/net/phy/Kconfig    |   5 ++
>  drivers/net/phy/Makefile   |   1 +
>  drivers/net/phy/mediatek.c | 112 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 118 insertions(+)
>  create mode 100644 drivers/net/phy/mediatek.c
> 
> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index 288bf405ebdb..9db39fb443e6 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
> @@ -207,6 +207,11 @@ config MARVELL_88X2222_PHY
>  	  Support for the Marvell 88X2222 Dual-port Multi-speed Ethernet
>  	  Transceiver.
>  
> +config MEDIATEK_PHY
> +	tristate "MediaTek PHYs"
> +	help
> +	  Supports the MediaTek switch integrated PHYs.
> +
>  config MICREL_PHY
>  	tristate "Micrel PHYs"
>  	help
> diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
> index bcda7ed2455d..ab512cb3592b 100644
> --- a/drivers/net/phy/Makefile
> +++ b/drivers/net/phy/Makefile
> @@ -64,6 +64,7 @@ obj-$(CONFIG_LXT_PHY)		+= lxt.o
>  obj-$(CONFIG_MARVELL_10G_PHY)	+= marvell10g.o
>  obj-$(CONFIG_MARVELL_PHY)	+= marvell.o
>  obj-$(CONFIG_MARVELL_88X2222_PHY)	+= marvell-88x2222.o
> +obj-$(CONFIG_MEDIATEK_PHY)	+= mediatek.o
>  obj-$(CONFIG_MESON_GXL_PHY)	+= meson-gxl.o
>  obj-$(CONFIG_MICREL_KS8995MA)	+= spi_ks8995.o
>  obj-$(CONFIG_MICREL_PHY)	+= micrel.o
> diff --git a/drivers/net/phy/mediatek.c b/drivers/net/phy/mediatek.c
> new file mode 100644
> index 000000000000..86e6c466b0e9
> --- /dev/null
> +++ b/drivers/net/phy/mediatek.c
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +#include <linux/bitfield.h>
> +#include <linux/module.h>
> +#include <linux/phy.h>
> +
> +#define MTK_EXT_PAGE_ACCESS		0x1f
> +#define MTK_PHY_PAGE_STANDARD		0x0000
> +#define MTK_PHY_PAGE_EXTENDED		0x0001
> +#define MTK_PHY_PAGE_EXTENDED_2		0x0002
> +#define MTK_PHY_PAGE_EXTENDED_3		0x0003
> +#define MTK_PHY_PAGE_EXTENDED_2A30	0x2a30
> +#define MTK_PHY_PAGE_EXTENDED_52B5	0x52b5
> +
> +static int mtk_phy_read_page(struct phy_device *phydev)
> +{
> +	return __phy_read(phydev, MTK_EXT_PAGE_ACCESS);
> +}
> +
> +static int mtk_phy_write_page(struct phy_device *phydev, int page)
> +{
> +	return __phy_write(phydev, MTK_EXT_PAGE_ACCESS, page);
> +}
> +
> +static void mtk_phy_config_init(struct phy_device *phydev)
> +{
> +	/* Disable EEE */
> +	phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);

Is there any ERR around this (i.e. is the feature universally broken or
just on your setup)? There is a function called of_set_phy_eee_broken,
you can let the PHY core disable EEE advertisement based on device tree.

> +
> +	/* Enable HW auto downshift */
> +	phy_modify_paged(phydev, MTK_PHY_PAGE_EXTENDED, 0x14, 0, BIT(4));
> +
> +	/* Increase SlvDPSready time */
> +	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_52B5);
> +	__phy_write(phydev, 0x10, 0xafae);
> +	__phy_write(phydev, 0x12, 0x2f);
> +	__phy_write(phydev, 0x10, 0x8fae);
> +	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
> +
> +	/* Adjust 100_mse_threshold */
> +	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x123, 0xffff);
> +
> +	/* Disable mcc */
> +	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0xa6, 0x300);
> +}

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
