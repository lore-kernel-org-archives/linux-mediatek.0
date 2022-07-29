Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAB5C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 20:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hi5EbWXrbS55YvJFZB7fwB+MFFbIXBu7ugj3CU7onwM=; b=HfsaJn5IcvMlb728OhQutB6XOe
	7FG+O8ZbrYjGYRww7AqBelMuDnkbekOG1WMibmENYUmc+KUZeKy1myG4RWq7QjOfN+riSCfRIdPXz
	aZxqkbeKOPiDwydK3TL+qNImkovp67m/gHs8bgsb4MHC89njGUXNP1nJM7cHWfDm6a0BAN3sYtqpn
	CAL/OxXXxICiAoVElhQp6Ez8St4P+Z1NDE3mFlIx90agrBfY6/OM5+EFnNSoaN3peUzEUGvkfvhfd
	dkFJ6ZQU67dcnXbT7Twf5cpyP2zUrPtKdXkosu+h6wp2p8UWjFnMAcdA5EOH7UM4ut9z2qeGf4SmB
	IHBP1w7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHWdH-00C7OQ-TX; Fri, 29 Jul 2022 20:30:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHWd6-00C7G6-LJ; Fri, 29 Jul 2022 20:30:42 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 003A16601B8B;
	Fri, 29 Jul 2022 21:30:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659126636;
	bh=k1k8s7Za97TaDukHb1io/Pph036btg+/OCzVr3A+DLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5qxbh8llQDpysSkuzEFTSd//A+YhN8kKGDj8/zg7fh6Nixht1vZ3Wj4Yai8aPCAW
	 vXdULCcrjsoFSDnuqvXNrRGEYcvl6r8A7WifuB7//iLYZDBVT4xmc3QlUCRu8v6Prb
	 xtaMl8oo5e+9BL5FtEucFu5VfWT1dcXvnIf2OKHSVen4rKrYJMRZ8NVANfJyM2kHwA
	 XO0fOpyA2NYcYWmBhx3w7PEMki61C2LQE034mNgpJid2SjZwP44aUljIb/lLaeHB9Z
	 SUZigHRbser2iQUSFR7gn6KeUVuK9FqVLNM2Nf39R+za5Nwu+AzM3coMs1CFe4q8in
	 SSqWJYX0B4x1w==
Date: Fri, 29 Jul 2022 16:30:30 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
	amitk@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, khilman@baylibre.com,
	mka@chromium.org, robh+dt@kernel.org, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
	fan.chen@mediatek.com, louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com, abailon@baylibre.com
Subject: Re: [PATCH v8 3/6] thermal: mediatek: Add LVTS drivers for SoC
 theraml zones for mt8192
Message-ID: <20220729203030.p645ccnpa4bd6sdn@notapiano>
References: <20220726135506.485108-1-bchihi@baylibre.com>
 <20220726135506.485108-4-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220726135506.485108-4-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_133040_848156_9884C88B 
X-CRM114-Status: GOOD (  16.52  )
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

On Tue, Jul 26, 2022 at 03:55:03PM +0200, Balsam CHIHI wrote:
> Add a LVTS (Low voltage thermal sensor) driver to report junction
> temperatures in Mediatek SoC mt8192 and register the maximum temperature
> of sensors and each sensor as a thermal zone.
> 
> Signed-off-by: Yu-Chia Chang <ethan.chang@mediatek.com>
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  drivers/thermal/mediatek/Kconfig         |  27 +
>  drivers/thermal/mediatek/Makefile        |   2 +
>  drivers/thermal/mediatek/lvts_mt8192.c   | 241 ++++++
>  drivers/thermal/mediatek/soc_temp.c      |   2 +-
>  drivers/thermal/mediatek/soc_temp_lvts.c | 928 +++++++++++++++++++++++
>  drivers/thermal/mediatek/soc_temp_lvts.h | 365 +++++++++
>  6 files changed, 1564 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/thermal/mediatek/lvts_mt8192.c
>  create mode 100644 drivers/thermal/mediatek/soc_temp_lvts.c
>  create mode 100644 drivers/thermal/mediatek/soc_temp_lvts.h
> 
> diff --git a/drivers/thermal/mediatek/Kconfig b/drivers/thermal/mediatek/Kconfig
> index 9c41e9079fc3..7fc04237dd50 100644
> --- a/drivers/thermal/mediatek/Kconfig
> +++ b/drivers/thermal/mediatek/Kconfig
> @@ -20,4 +20,31 @@ config MTK_SOC_THERMAL
>  		configures thermal controllers to collect temperature
>  		via AUXADC interface.
>  
> +config MTK_SOC_THERMAL_LVTS
> +	tristate "LVTS (Low voltage thermal sensor) driver for Mediatek SoCs"
> +	depends on HAS_IOMEM
> +	depends on NVMEM
> +	depends on RESET_TI_SYSCON

Both mt8192 and mt8195 use the reset controller provided by infracfg [1], so
there's no need to depend on RESET_TI_SYSCON. (Same thing below)

[1] https://lore.kernel.org/all/20220523093346.28493-1-rex-bc.chen@mediatek.com/

Thanks,
Nícolas

> +	help
> +		Enable this option if you want to get SoC temperature
> +		information for MediaTek platforms. This driver
> +		configures LVTS thermal controllers to collect temperatures
> +		via Analog Serial Interface(ASIF).
> +
> +endif
> +
> +if MTK_SOC_THERMAL_LVTS
> +
> +config LVTS_MT8192
> +	tristate "LVTS driver for MediaTek MT8192 SoC"
> +	depends on HAS_IOMEM
> +	depends on NVMEM
> +	depends on RESET_TI_SYSCON
> +	depends on MTK_SOC_THERMAL_LVTS
> +	help
> +		Enable this option if you want to get SoC temperature
> +		information for MT8192. This driver
> +		configures LVTS thermal controllers to collect temperatures
> +		via ASIF.
> +
>  endif
[..]

