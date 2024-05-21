Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F163C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 16:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtllaMRJfGnVHwCm6walKh4WuYIDKssYdMI6QD/2XGA=; b=AEfWfA8sDbRgb76cjUnQf+FRJb
	1msR+66juiCkfcrzkY0u1jRsBcepslRZielkY88lIT5jwhADwlE3jMW+hWr5k9jAAP8hi1K1CqxHJ
	VBfHi92w3vMJr4XvLoyHJpFTt/ZdSqw7RTP9JmVQO6g7jdlfgGF5Lfbl0opBC9+9FArWfnWHLzUmP
	kiS1FyB9MeDMzQGdht8sKZwZjeDOJ1XBmBaeuW2EV2E+x87rb0mdhICA47fx4uCKgdmTsxbd1yF/i
	pnxXrGntCuMcKjQPn+0ixqZepwAqfQpQlBIvHBfKxBRwJacIwvWsIOJWVHK0unQYxTkmfnFjxqiS/
	VEmmSaDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9STu-00000000WZW-2PE5;
	Tue, 21 May 2024 16:36:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9STq-00000000WWv-0c8K;
	Tue, 21 May 2024 16:36:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1B847CE1054;
	Tue, 21 May 2024 16:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D4DC4AF09;
	Tue, 21 May 2024 16:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716309405;
	bh=lYt216ymFJHBZ77aQufJ3Q3bw6WnfSXmHT40ibI+voI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R125lnd/GrW8NgD1Z4m0tbheWzZqVzXgZ+EsSDoel2OsjLM3dXYDHKxiV8i7szfBL
	 nGYAuwPC6KixOq3bAkHAX4scDgOhC3h8U/zPhYkYa6ZiuwRyNv3bivkKE+v4FnT/p6
	 Vo3xKNFwHnJ/ehFdJY6W8RoHOuybIgv5kirLnk5lBZgZYrqQdxg3K1TftWnvM1mvkU
	 c3Ezvo6WAXWP5zdlPdBfp64eNQc1D4WPuJZcpbZLDt6UJguBNGDi2fXI0Y9RD8tp/l
	 u2A2FoQlZkmXmHnBosKB+rJA9kAJDm1xN0JjCstmU+1sa8SJi0yiTbdVtA7bS3H1M7
	 xnPG0srtngn2w==
Date: Tue, 21 May 2024 17:36:39 +0100
From: Simon Horman <horms@kernel.org>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
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
Subject: Re: [PATCH net-next v4 1/5] net: phy: mediatek: Re-organize MediaTek
 ethernet phy drivers
Message-ID: <20240521163639.GB839490@kernel.org>
References: <20240521101548.9286-1-SkyLake.Huang@mediatek.com>
 <20240521101548.9286-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521101548.9286-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_093650_847402_B18F1D42 
X-CRM114-Status: GOOD (  19.44  )
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

On Tue, May 21, 2024 at 06:15:44PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> Re-organize MediaTek ethernet phy driver files and get ready to integrate
> some common functions and add new 2.5G phy driver.
> mtk-ge.c: MT7530 Gphy on MT7621 & MT7531 Gphy
> mtk-ge-soc.c: Built-in Gphy on MT7981 & Built-in switch Gphy on MT7988
> mtk-2p5ge.c: Planned for built-in 2.5G phy on MT7988
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>

...

> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index 1df0595..e0e4b5e 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
> @@ -251,22 +251,7 @@ config MAXLINEAR_GPHY
>  	  Support for the Maxlinear GPY115, GPY211, GPY212, GPY215,
>  	  GPY241, GPY245 PHYs.
>  
> -config MEDIATEK_GE_PHY
> -	tristate "MediaTek Gigabit Ethernet PHYs"
> -	help
> -	  Supports the MediaTek Gigabit Ethernet PHYs.
> -
> -config MEDIATEK_GE_SOC_PHY
> -	tristate "MediaTek SoC Ethernet PHYs"
> -	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
> -	depends on NVMEM_MTK_EFUSE
> -	help
> -	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.
> -
> -	  Include support for built-in Ethernet PHYs which are present in
> -	  the MT7981 and MT7988 SoCs. These PHYs need calibration data
> -	  present in the SoCs efuse and will dynamically calibrate VCM
> -	  (common-mode voltage) during startup.
> +source "drivers/net/phy/mediatek/Kconfig"
>  
>  config MICREL_PHY
>  	tristate "Micrel PHYs"

...

> diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
> new file mode 100644
> index 0000000..2fa3a78
> --- /dev/null
> +++ b/drivers/net/phy/mediatek/Kconfig
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config MEDIATEK_GE_PHY
> +	tristate "MediaTek Gigabit Ethernet PHYs"
> +	help
> +	  Supports the MediaTek non-built-in Gigabit Ethernet PHYs.
> +
> +	  Non-built-in Gigabit Ethernet PHYs include mt7530/mt7531.
> +	  You may find mt7530 inside mt7621. This driver shares some
> +	  common operations with MediaTek SoC built-in Gigabit
> +	  Ethernet PHYs.
> +
> +config MEDIATEK_GE_SOC_PHY
> +	bool "MediaTek SoC Ethernet PHYs"

Hi,

This patch changes this kconfig option from tristate to bool.

This seems to break allmodconfig builds.

I think that is because MEDIATEK_GE_SOC_PHY is builtin while
PHYLIB is a module, and this driver uses symbols from PHYLIB.

> +	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
> +	select NVMEM_MTK_EFUSE
> +	help
> +	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.
> +
> +	  Include support for built-in Ethernet PHYs which are present in
> +	  the MT7981 and MT7988 SoCs. These PHYs need calibration data
> +	  present in the SoCs efuse and will dynamically calibrate VCM
> +	  (common-mode voltage) during startup.

...

-- 
pw-bot: changes-requested

