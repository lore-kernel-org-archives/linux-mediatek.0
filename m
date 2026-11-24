Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C43F606A32D
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 16:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lMR2sIHz;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lEj4h/y6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+bJn/rVe34M62HCQtQL32PKc5v6Nz8H16aexelnaA7I=; b=lMR2sIHzAC8S8aUWUg/i3ZlH58
	dxlCSDoaEleHbc2fN5STox2+tDPbd0/bvvM8QqrIsCL5r++f2MIWVyKW3TeeaiLFyKHOGKF+CehLf
	VHCRAb6VXrp3GvbAy7g73Q4c4CtNo4E+Ynv6Bo8pzO6mUlbEVpbni9aM3JD9ttknz6gSaNBxrlqFC
	Y8cBD1IHPw7S5+s/GxGg7roYF0x1nT6Dr3p07bA1afnz3/0kZ8KD6ojHzPaiy+qgY6gkHA98yyVCX
	oFNRjp+q+7StkZ1tshvpulXqLbNWFvhVGhkNsLdB7eAsrNF07VjNBX5TetMoiASa6vrXkzEDk4j8y
	3j1HPD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtQE-000000077Ld-04P5;
	Tue, 24 Nov 2026 16:31:10 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtQ6-000000077KI-23j0;
	Tue, 24 Nov 2026 16:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795537862; x=1827073862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0XP5Vh+zLzYYHkYfvDQkd5XbCzGpeW4L1WH/p/viaag=;
  b=lEj4h/y6ndUcZTNKGLHg+n3xA7h2ft/xYOfpj8jewRRPsT1oe/gzN4jy
   I/Rv9PVPKklLvW5gaM0iMfGRvMVLuuljzuYgbSA40UffvLRjn0hM5S/2B
   Qbt4v4D/PGE+2wPQPN/miYWBGyaiK6F6+ozRJKXLzm4zezooYxSrus5uq
   W99YSUfGw2gWbiBC7f4UFaQvfgThjGfC1MpK0W1I6nePWtClyDjzjE2qZ
   h+Ci88A7e3WErSfyyw9LqkCOSxvypxoPkACZnhN+HQuPRnOZG6BV9Kkam
   dHBwHkuKAawlcuURC1DVFMdpSEkgqmd473b/CvUNMyLWqfXbqu9E2TTKF
   Q==;
X-CSE-ConnectionGUID: R/1Bsjx3RpqJojSWlwmCyw==
X-CSE-MsgGUID: tTOEl6IBTyKCyB0zJF6RPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4375177"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4375177"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 08:06:23 -0800
X-CSE-ConnectionGUID: H3u+Mbq0QCeQs5UBjgpbbA==
X-CSE-MsgGUID: Y5lZgkRBRjO5FUCSAQ2QGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11597515"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 24 Nov 2026 08:06:15 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9900394; Tue, 24 Nov 2026 17:06:13 +0100 (CET)
Date: Tue, 24 Nov 2026 17:06:13 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sven Peter <sven@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 3/8] thunderbolt: Make PCIe NHI support opt-in
Message-ID: <20261124160613.GS229695@black.igk.intel.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-4-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123113705.2297329-4-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_083102_549382_33BEA502 
X-CRM114-Status: GOOD (  32.73  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 07:36:50PM +0800, Chunfeng Yun wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Currently, the USB4/Thunderbolt subsystem directly depends on PCI,
> tightly bundling the core framework with the PCIe-attached Native Host
> Interface (NHI) driver (pci.c) and the Intel Connection Manager (icm.c)
> into a single module (thunderbolt.o).
> 
> With support for platform/SoC-attached USB4 host controllers coming in
> (such as on ARM64 systems), the core USB4 framework should no longer
> have a hard dependency on PCI. Furthermore, embedded or SoC systems
> without PCIe-attached host routers should be able to omit PCIe NHI
> support to reduce kernel footprint.
> 
> Decouple the PCIe NHI and ICM drivers from the core framework:
> 
> 1. Kconfig & Makefile:
>    - Remove "depends on PCI" from CONFIG_USB4.
>    - Introduce CONFIG_USB4_PCI to build PCIe NHI and ICM support as
>      a separate module (thunderbolt_pci.ko).
> 
> 2. Driver Registration:
>    - Make the core thunderbolt module standalone by converting
>      tb_domain_init/exit() to postcore_initcall() and module_exit().
>    - Register the PCIe driver in thunderbolt_pci via module_pci_driver().
> 
> 3. Connection Manager Selection:
>    - Add an optional .select_cm() hook to struct tb_nhi_ops so that the
>      PCIe driver can invoke icm_probe() for legacy/firmware-CM controllers
>      without hardcoding ICM calls into the core nhi.c.
> 
> 4. Symbol Exports:
>    - Export necessary APIs required by pci and platform drivers.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3:
> Added 'default USB4' to CONFIG_USB4_PCI in Kconfig;
> Exported tb_xdomain_remove symbol immediately after its definition;
> 
> v2:
> cherry-pick the patch of Konrad to fix the issues of this series, and
> also do some changes:
> 
> * Renamed CONFIG_USB4_PCIE and thunderbolt_pcie.ko to CONFIG_USB4_PCI
>   and thunderbolt_pci.ko.
> * Updated exported NHI symbols to standard tb_ / tb_ring_ prefixes
>   (e.g., ring_msix → tb_ring_msix, nhi_msi → tb_nhi_isr).
> * Eliminated exports for nhi_mailbox_* and nhi_interrupt_work by
>   keeping them internal/static (handled by preparatory patches in v2).
> * Added missing trailing semicolon to module_pci_driver(nhi_driver);.
> * Expanded the commit message;
> * Fix cherry-pick conflict caused by .reset_interface();
> ---
>  drivers/thunderbolt/Kconfig   | 12 ++++++++++-
>  drivers/thunderbolt/Makefile  |  7 +++++--
>  drivers/thunderbolt/ctl.c     |  6 +++++-
>  drivers/thunderbolt/domain.c  | 14 +++++++++++--
>  drivers/thunderbolt/nhi.c     | 14 ++++++-------
>  drivers/thunderbolt/nhi.h     |  2 ++
>  drivers/thunderbolt/pci.c     | 39 +++++++++++++----------------------
>  drivers/thunderbolt/switch.c  |  9 ++++++++
>  drivers/thunderbolt/tb.h      |  2 --
>  drivers/thunderbolt/tunnel.c  |  1 +
>  drivers/thunderbolt/xdomain.c |  5 +++++
>  11 files changed, 71 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
> index 294b3227a545..80960555a364 100644
> --- a/drivers/thunderbolt/Kconfig
> +++ b/drivers/thunderbolt/Kconfig
> @@ -1,7 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  menuconfig USB4
>  	tristate "Unified support for USB4 and Thunderbolt"
> -	depends on PCI
>  	select APPLE_PROPERTIES if EFI_STUB && X86
>  	select CRC32
>  	select CRYPTO_LIB_SHA256
> @@ -18,6 +17,17 @@ menuconfig USB4
>  
>  if USB4
>  
> +config USB4_PCI
> +	tristate "Support for PCIe-attached USB4 and Thunderbolt controllers"
> +	depends on PCI
> +	default USB4
> +	help
> +	  Say Y here to add support for the USB4 and Thunderbolt host
> +	  routers attached over the PCIe bus, commonly found on x86 PCs.
> +
> +	  To compile this driver a module, choose M here. The module will be
> +	  called thunderbolt_pci.
> +
>  config USB4_CONFIGFS
>  	def_tristate USB4
>  	depends on CONFIGFS_FS && !(USB4=y && CONFIGFS_FS=m)
> diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
> index beb054c3126b..a563bf2b0345 100644
> --- a/drivers/thunderbolt/Makefile
> +++ b/drivers/thunderbolt/Makefile
> @@ -1,10 +1,13 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  ccflags-y := -I$(src)
>  obj-${CONFIG_USB4} := thunderbolt.o
> -thunderbolt-objs := nhi.o ctl.o tb.o switch.o cap.o pci.o path.o tunnel.o eeprom.o
> -thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
> +thunderbolt-objs := nhi.o ctl.o tb.o switch.o cap.o path.o tunnel.o eeprom.o
> +thunderbolt-objs += domain.o dma_port.o property.o xdomain.o lc.o tmu.o usb4.o
>  thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
>  
> +obj-${CONFIG_USB4_PCI} += thunderbolt_pci.o
> +thunderbolt_pci-y := pci.o icm.o
> +
>  thunderbolt-${CONFIG_ACPI} += acpi.o
>  thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
>  thunderbolt-$(CONFIG_USB4_CONFIGFS) += configfs.o
> diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
> index 965988b18608..96717a0a94b1 100644
> --- a/drivers/thunderbolt/ctl.c
> +++ b/drivers/thunderbolt/ctl.c
> @@ -9,7 +9,6 @@
>  #include <linux/crc32.h>
>  #include <linux/delay.h>
>  #include <linux/slab.h>
> -#include <linux/pci.h>
>  #include <linux/dmapool.h>
>  #include <linux/workqueue.h>
>  
> @@ -96,6 +95,7 @@ struct tb_cfg_request *tb_cfg_request_alloc(void)
>  
>  	return req;
>  }
> +EXPORT_SYMBOL_GPL(tb_cfg_request_alloc);

Why these need to be exported? All the config stuff happens inside USB4
fabric and that's not dependent on how the controller is connected to the
SoC.

Can we get the absolute minimum that is needed? The platform/PCI sides pretty
much need to get the resources/interrupts and then call the core driver.

