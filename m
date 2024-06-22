Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF3FC27C53
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jun 2024 17:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sho0YEtylyTdxRMAe/P6DP0zx9R/I3yEuyq+9GO9Z+w=; b=nXdAfsnryVfx6f9eqadj1MOjBw
	gnO7I1S69EG5arp2diA3BD4ZuhVCjyTTTKYrJVhuFRYaOtqDctzi1y3b6MMxwuQ4LjnKocF39QTAQ
	5O/IdPU7b5qGOA+1kI9ta5nkNQzuLE6Xu2IqBNsrXRqIim3zhaEoAYbPzPmhd7iewzoOxSE7BXwJf
	NxB0AHIM6tKU7OtFcoIva0a/VTNHCBxlRwh0ksSxW+T6D+M3/Alx9LX1cwrSlEUDJnyevVWytB/lg
	yJ8xrFqg0WTpZ/HLYsK7roCJ1ZtyqREBRkkF02Eof2VqjkegBHg4F85+pAswJdsCec39yGxZ1yMD7
	k2gOoapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL4zz-0000000CYQ6-2JIb;
	Sat, 22 Jun 2024 17:58:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL4zu-0000000CYPM-2T8t;
	Sat, 22 Jun 2024 17:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=sho0YEtylyTdxRMAe/P6DP0zx9R/I3yEuyq+9GO9Z+w=; b=jC/eivzCjUTarhfN4rS1OMJO7C
	DD55tiV9uU05Fd+pR8gHsAHW9dmXNdQ0ZbAgVK77KIf0H+pdEK/Ecpej5Ow4bBL5pIuoOMUvzieDC
	uVcZaO64jdDaHWe0KE8VRhCdjwfVFORWEtTGCdN0bRbFCGQQb/ppqjr9jMIKCMIv6Jns=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sL4zg-000k8W-1M; Sat, 22 Jun 2024 19:57:44 +0200
Date: Sat, 22 Jun 2024 19:57:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v8 11/13] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <86e5c28a-42dd-432b-8bd7-2ccc4567520f@lunn.ch>
References: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
 <20240621122045.30732-12-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621122045.30732-12-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_105759_069343_5A205717 
X-CRM114-Status: GOOD (  20.71  )
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

On Fri, Jun 21, 2024 at 08:20:43PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> Add support for internal 2.5Gphy on MT7988. This driver will load
> necessary firmware, add appropriate time delay and figure out LED.
> Also, certain control registers will be set to fix link-up issues.
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
> ---
> Changes in v8:
> - Replace tr_modify with mtk_tr_modify and fix alignment.
> - Remove unnecessary outer parens of "supported_triggers" var.
> - Align declarations in mtk_2p5gephy_driver[]. At first, some of them are
> ".foo<tab>= method_foo", and others are ".bar<space>= method_bar".
> Use space instead for all of them here.
> ---
>  MAINTAINERS                          |   1 +
>  drivers/net/phy/mediatek/Kconfig     |  11 +
>  drivers/net/phy/mediatek/Makefile    |   1 +
>  drivers/net/phy/mediatek/mtk-2p5ge.c | 435 +++++++++++++++++++++++++++
>  4 files changed, 448 insertions(+)
>  create mode 100644 drivers/net/phy/mediatek/mtk-2p5ge.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e58e05c..fe380f2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13793,6 +13793,7 @@ M:	Qingfang Deng <dqfext@gmail.com>
>  M:	SkyLake Huang <SkyLake.Huang@mediatek.com>
>  L:	netdev@vger.kernel.org
>  S:	Maintained
> +F:	drivers/net/phy/mediatek/mtk-2p5ge.c
>  F:	drivers/net/phy/mediatek/mtk-ge-soc.c
>  F:	drivers/net/phy/mediatek/mtk-phy-lib.c
>  F:	drivers/net/phy/mediatek/mtk-ge.c
> diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
> index 448bc20..1490352 100644
> --- a/drivers/net/phy/mediatek/Kconfig
> +++ b/drivers/net/phy/mediatek/Kconfig
> @@ -25,3 +25,14 @@ config MEDIATEK_GE_SOC_PHY
>  	  the MT7981 and MT7988 SoCs. These PHYs need calibration data
>  	  present in the SoCs efuse and will dynamically calibrate VCM
>  	  (common-mode voltage) during startup.
> +
> +config MEDIATEK_2P5GE_PHY
> +	tristate "MediaTek 2.5Gb Ethernet PHYs"
> +	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
> +	select MTK_NET_PHYLIB
> +	help
> +	  Supports MediaTek SoC built-in 2.5Gb Ethernet PHYs.
> +
> +	  This will load necessary firmware and add appropriate time delay.
> +	  Accelerate this procedure through internal pbus instead of MDIO
> +	  bus. Certain link-up issues will also be fixed here.
> diff --git a/drivers/net/phy/mediatek/Makefile b/drivers/net/phy/mediatek/Makefile
> index 814879d..c6db8ab 100644
> --- a/drivers/net/phy/mediatek/Makefile
> +++ b/drivers/net/phy/mediatek/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_MTK_NET_PHYLIB)		+= mtk-phy-lib.o
>  obj-$(CONFIG_MEDIATEK_GE_PHY)		+= mtk-ge.o
>  obj-$(CONFIG_MEDIATEK_GE_SOC_PHY)	+= mtk-ge-soc.o
> +obj-$(CONFIG_MEDIATEK_2P5GE_PHY)	+= mtk-2p5ge.o
> diff --git a/drivers/net/phy/mediatek/mtk-2p5ge.c b/drivers/net/phy/mediatek/mtk-2p5ge.c
> new file mode 100644
> index 0000000..f3efcc4
> --- /dev/null
> +++ b/drivers/net/phy/mediatek/mtk-2p5ge.c
> @@ -0,0 +1,435 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +#include <linux/bitfield.h>
> +#include <linux/firmware.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/phy.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "mtk.h"
> +
> +#define MTK_2P5GPHY_ID_MT7988	(0x00339c11)
> +
> +#define MT7988_2P5GE_PMB "mediatek/mt7988/i2p5ge-phy-pmb.bin"

You probably want a MODULE_FIRMWARE() so the firmware gets placed into
the initrd.

> +#define BASE100T_STATUS_EXTEND		(0x10)
> +#define BASE1000T_STATUS_EXTEND		(0x11)
> +#define EXTEND_CTRL_AND_STATUS		(0x16)

These don't appear to be used.

      Andrew

