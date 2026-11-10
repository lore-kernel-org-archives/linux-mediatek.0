Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3E060A2635
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 14:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AbUUMB5l;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GY8Dlqsx;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZGM98/oZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5lBnGw323nAZPFcKAE7f2MC4rO4RnvcfKystGSLQS/o=; b=AbUUMB5ldrGrnczL17ozZkfC/q
	nNNUGJs3f/K3CzTToqmI5+ldY8CKRE0J1gnQ6uuybxuDHOrJdEYwDBdCiaafzIk/7OlWUPOpbRyhe
	I0Hkn686WWiZDqtjldVrmJXg8w8Zr7FdK/nKoxwfc5fmyABJFiWoMFk49afpL0/MZKQMdZtCKATeD
	JNtb1MRvw/MlwDJPHUAvc/on0jAwWlj20/CD9uu5BIocSvVYFVBst/kZ2juQngdiAx3LybKsuwOpl
	DJIPvKTBD/CSNxJ/KQE8oxR+rMGipUBKBn4tqMwXdviV8bcbDhdA7weKhwVsz/0JZvUq0+Hl9QeWe
	HG5VigcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmzn-00000004EVX-3zMh;
	Tue, 10 Nov 2026 14:38:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmzm-00000004EUA-1erz;
	Tue, 10 Nov 2026 14:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5lBnGw323nAZPFcKAE7f2MC4rO4RnvcfKystGSLQS/o=; b=GY8DlqsxmAaijKduqQT7KbljiF
	kWez1D5vtY0SlmapqyEqBFJ5EB3TkiKOocw9lja3BEkLjSD7CCXppnvcvNj0xEXezdkm7+/hNyPBj
	nNPTEnY3SPbBu64am0y3Q1Rdw/FcuT0fkHt3oOzLugJwtId7HsClH3cjRHMlWWzv99QTYkazpnYmn
	rLKYHgKbYY48ofUPCdy/C4EAFPpOGxhhLPnDMBwNQ2IYQzxIcDYDrac61ktqalsr3Ybi5ykyEfHuv
	sU8eKLbN/pRhR9KHW2Yus8aulNhs1fqoyUD6j1Y8RmLpqASwNOZ4RW2IxiSK1R+S7S4e+lDTBgG4g
	TIsOzuRg==;
Received: from mgamail.intel.com ([198.175.65.18])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmzU-000000084rQ-0zyw;
	Tue, 10 Nov 2026 14:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794321508; x=1825857508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LUB0SAz/HO+Q2s5dKRUfbVOv0PKX7CcPXZfgiRpkBMo=;
  b=ZGM98/oZUNrw3pG1MoGjxbRuaUmzXLfxhDkCk9gK/aP/Xk3nQ9aCOpK3
   mscmSsXDU1rF8UJ19TQAn2IHwuzgIRZ7zJ0xfFS8ke4NvQIBazP3vvgti
   dJ0qvcNV5BhYbDvGedvg2HyelOEADQnMb+G3gOJ5VHDqQcipdhN1svhF0
   WPGrh+Wr361wLUjNnFzH9DGA7T+cPU8l623bJe2Wy0RJYrM2wJPlDIDs4
   SHlkzfzqgGWuyU2vSZdz0ypUM5KIP4uVt7dHtJtu/+TeyBmDKu9tn+8Dz
   5hMUJO3yDqI76ivSxLeyAPc8y4jhqzuMVpRiZHM4WI6k3yCyFreV8apKH
   w==;
X-CSE-ConnectionGUID: 4qTnewj2RSqLvgbe6sfk+w==
X-CSE-MsgGUID: uIaFoKjJQ1CVQKXGopI7qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3085220"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3085220"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:38:22 -0800
X-CSE-ConnectionGUID: 6mJiu9m+RQSI1D+JhS403A==
X-CSE-MsgGUID: uvAvjTj9R4qZlPcChftrtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8491558"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 10 Nov 2026 06:38:00 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C171799; Tue, 10 Nov 2026 15:37:58 +0100 (CET)
Date: Tue, 10 Nov 2026 15:37:58 +0100
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
Subject: Re: [PATCH v2 4/7] thunderbolt: add platform NHI driver
Message-ID: <20261110143758.GC259790@black.igk.intel.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-5-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110114925.722014-5-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_143829_071162_CA04CE3E 
X-CRM114-Status: GOOD (  51.52  )
X-Spam-Score: -2.3 (--)
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

On Tue, Nov 10, 2026 at 07:48:52PM +0800, Chunfeng Yun wrote:
> Historically, the Thunderbolt/USB4 Native Host Interface (NHI)
> controller has been exposed as a PCI device handled by
> drivers/thunderbolt/pci.c. However, some SoCs (such as MediaTek
> mt8901/mt8992) integrate the NHI as a memory-mapped platform device
> described via Device Tree or ACPI.
> 
> To support platform-attached NHI controllers:
> 
> Introduce platform.c to register a platform driver matching
> "usb4-nhi-platform" (OF) and "ACPI0015" (ACPI);
> Implement platform tb_nhi_ops hooks for pm, interrupts related;
> 
> Support an optional dedicated wake interrupt: on integrated SoCs,
> the MAC/PHY reside in a power domain whose clocks and power can be
> gated during sleep, preventing the primary NHI interrupt from
> acting as a wakeup source; so add an optional dedicated wakeup
> interrupt which comes from the always-on power domain.
> 
> Clean up the unused nhi_enable_int_throttling() prototype.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2 changes:
> * Added CONFIG_USB4_PLATFORM to build the platform driver as a separate
>   module (thunderbolt_platform.ko), instead of statically embedding it
>   into thunderbolt.o.
> * Renamed plat.c to platform.c, renamed internal functions from nhi_plat_*
>   to nhi_platform_*, and updated the Device Tree compatible string from
>   "thunderbolt-platform" to "usb4-nhi-platform".
> * Removed domain lifecycle changes (domain.c) and PCI driver cleanups
>   (pci.c) from this patch, handled by previous patches.
> * Squashed the optional dedicated wake IRQ support (previously a separate
>   patch in v1) directly into this patch.
> * Replaced the custom local ISR with the shared tb_nhi_isr(), adopted
>   the renamed tb_nhi_probe() / tb_nhi_shutdown() / tb_nhi_pm_ops
>   interfaces, and added -EPROBE_DEFER handling for the wake IRQ.
> ---
>  drivers/thunderbolt/Kconfig    |   9 ++
>  drivers/thunderbolt/Makefile   |   3 +
>  drivers/thunderbolt/nhi.h      |   1 -
>  drivers/thunderbolt/pci.c      |   1 +
>  drivers/thunderbolt/platform.c | 172 +++++++++++++++++++++++++++++++++
>  include/linux/thunderbolt.h    |   4 +
>  6 files changed, 189 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/thunderbolt/platform.c
> 
> diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
> index 605af440457a..846ab51df7ab 100644
> --- a/drivers/thunderbolt/Kconfig
> +++ b/drivers/thunderbolt/Kconfig
> @@ -27,6 +27,15 @@ config USB4_PCI
>  	  To compile this driver a module, choose M here. The module will be
>  	  called thunderbolt_pci.
>  
> +config USB4_PLATFORM
> +	tristate "Support for platform USB4 and Thunderbolt controllers"
> +	help
> +	  Say Y here to add support the USB4 and Thunderbolt host routers
> +	  for a platform device on such as ARM64 SoCs.
> +
> +	  To compile this driver a module, choose M here. The module will be
> +	  called thunderbolt_platform.
> +
>  config USB4_CONFIGFS
>  	def_tristate USB4
>  	depends on CONFIGFS_FS && !(USB4=y && CONFIGFS_FS=m)
> diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
> index a563bf2b0345..334fa4ebdfc8 100644
> --- a/drivers/thunderbolt/Makefile
> +++ b/drivers/thunderbolt/Makefile
> @@ -8,6 +8,9 @@ thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
>  obj-${CONFIG_USB4_PCI} += thunderbolt_pci.o
>  thunderbolt_pci-y := pci.o icm.o
>  
> +obj-${CONFIG_USB4_PLATFORM} += thunderbolt_platform.o
> +thunderbolt_platform-y := platform.o
> +
>  thunderbolt-${CONFIG_ACPI} += acpi.o
>  thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
>  thunderbolt-$(CONFIG_USB4_CONFIGFS) += configfs.o
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index 65f9daf36068..ef5d24d81251 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -27,7 +27,6 @@ enum nhi_mailbox_cmd {
>  	NHI_MAILBOX_ALLOW_ALL_DEVS = 0x23,
>  };
>  
> -void nhi_enable_int_throttling(struct tb_nhi *nhi);
>  void nhi_disable_interrupts(struct tb_nhi *nhi);
>  irqreturn_t tb_nhi_isr(int irq, void *data);
>  irqreturn_t tb_ring_msix(int irq, void *data);
> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> index 9379c598a221..698f47ec63da 100644
> --- a/drivers/thunderbolt/pci.c
> +++ b/drivers/thunderbolt/pci.c
> @@ -736,4 +736,5 @@ static struct pci_driver nhi_driver = {
>  	.shutdown = nhi_pci_shutdown,
>  	.driver.pm = &tb_nhi_pm_ops,
>  };
> +

I guess this is unintented change?

>  module_pci_driver(nhi_driver);
> diff --git a/drivers/thunderbolt/platform.c b/drivers/thunderbolt/platform.c
> new file mode 100644
> index 000000000000..3562b6c7ea7d
> --- /dev/null
> +++ b/drivers/thunderbolt/platform.c
> @@ -0,0 +1,172 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Thunderbolt driver - NHI driver (Platform bus specific implementation)
> + *
> + * Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/interrupt.h>
> +#include <linux/errno.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/slab.h>
> +
> +#include "nhi.h"
> +#include "tb.h"
> +
> +static int nhi_platform_init(struct tb_nhi *nhi)
> +{
> +	/* avoid device link fail for pcie tunnel */

Do you have the ACPI _DSD there in place? Then I don't think you need
these. And "pcie" -> "PCIe" everywhere (except in code).

> +	pm_runtime_set_active(nhi->dev);
> +	pm_runtime_get_noresume(nhi->dev);
> +	pm_runtime_enable(nhi->dev);
> +
> +	device_set_wakeup_capable(nhi->dev, true);
> +	device_enable_async_suspend(nhi->dev);

I also suggest not to enable all the fancy power management until you have
the basic stuff like tunneling fully functional.

> +
> +	return 0;
> +}
> +
> +static void nhi_platform_clear_wake_irq(void *dev)
> +{
> +	dev_pm_clear_wake_irq(dev);
> +}
> +
> +static int nhi_platform_init_irq(struct tb_nhi *nhi)
> +{
> +	struct device *dev = nhi->dev;
> +	int ret;
> +
> +	ret = devm_request_irq(dev, nhi->irq, tb_nhi_isr, IRQF_NO_SUSPEND,
> +			       dev_name(dev), nhi);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "request irq failed\n");

failed to request interrupt

Please be consistent with the rest of the driver.

> +
> +	if (nhi->wake_irq) {
> +		ret = dev_pm_set_dedicated_wake_irq(dev, nhi->wake_irq);
> +		if (ret) {
> +			return dev_err_probe(dev, ret, "set wake irq %d failed\n", nhi->wake_irq);

Split this into 2 lines.

> +		}
> +
> +		dev_info(dev, "wake irq %d\n", nhi->wake_irq);

Remove this. The driver should be silent when it works. You can add debug
but I don't think this is useful.

> +
> +		ret = devm_add_action_or_reset(dev, nhi_platform_clear_wake_irq, dev);

Can you pass dev_pm_clear_wake_irq directly here?

> +	}
> +
> +	return ret;
> +}
> +
> +static void nhi_platform_exit(struct tb_nhi *nhi)
> +{
> +	devm_free_irq(nhi->dev, nhi->irq, nhi);

Isn't it released automatically?

> +	flush_work(&nhi->interrupt_work);
> +
> +	pm_runtime_put_noidle(nhi->dev);
> +	pm_runtime_disable(nhi->dev);
> +	pm_runtime_set_suspended(nhi->dev);
> +}
> +
> +static const struct tb_nhi_ops nhi_platform_default_ops = {
> +	.init = nhi_platform_init,
> +	.shutdown = nhi_platform_exit,
> +	.init_interrupts = nhi_platform_init_irq,
> +};
> +
> +static int nhi_platform_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct tb_nhi *nhi;
> +
> +	nhi = devm_kzalloc(dev, sizeof(*nhi), GFP_KERNEL);

devm_kzalloc_obj()

> +	if (!nhi)
> +		return -ENOMEM;
> +
> +	nhi->dev = dev;
> +	nhi->ops = &nhi_platform_default_ops;
> +
> +	nhi->iobase = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(nhi->iobase))
> +		return PTR_ERR(nhi->iobase);
> +
> +	nhi->irq = platform_get_irq(pdev, 0);
> +	if (nhi->irq < 0)
> +		return nhi->irq;
> +
> +	/* ignore error */

This should explain why it's okay to ignore the error.

> +	nhi->wake_irq = platform_get_irq_optional(pdev, 1);
> +	if (nhi->wake_irq == -EPROBE_DEFER)
> +		return nhi->wake_irq;
> +	else if (nhi->wake_irq < 0)
> +		nhi->wake_irq = 0;
> +
> +	return tb_nhi_probe(nhi);
> +}
> +
> +static void nhi_platform_do_remove(struct platform_device *pdev, bool reset)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct tb *tb = platform_get_drvdata(pdev);
> +	struct tb_nhi *nhi = tb->nhi;

Reverse-christmas tree if possible:

	struct tb *tb = platform_get_drvdata(pdev);
	struct device *dev = &pdev->dev;
	struct tb_nhi *nhi = tb->nhi;

> +
> +	/*
> +	 * On system shutdown/reboot force a host router reset so the
> +	 * CM asserts DPR on connected tbt3 devices before the router tree

Thunderbolt 3

> +	 * is removed (see tb_stop()).
> +	 */
> +	if (reset)
> +		nhi->host_reset = true;
> +
> +	pm_runtime_get_sync(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +
> +	tb_domain_remove(tb);
> +	wait_for_completion(&nhi->domain_released);
> +	tb_nhi_shutdown(nhi);
> +}
> +
> +static void nhi_platform_remove(struct platform_device *pdev)
> +{
> +	nhi_platform_do_remove(pdev, false);
> +}
> +
> +static void nhi_platform_shutdown(struct platform_device *pdev)
> +{
> +	nhi_platform_do_remove(pdev, true);
> +}
> +
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id nhi_platform_of_match[] = {
> +	{ .compatible = "usb4-nhi-platform" },
> +	{ }
> +};

I think this was agreed to be dropped for now.

> +MODULE_DEVICE_TABLE(of, nhi_platform_of_match);
> +#endif
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id nhi_platform_acpi_match[] = {
> +	{ "ACPI0015", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, nhi_platform_acpi_match);
> +#endif
> +
> +static struct platform_driver nhi_platform_driver = {
> +	.probe = nhi_platform_probe,
> +	.remove = nhi_platform_remove,
> +	.shutdown = nhi_platform_shutdown,
> +	.driver = {
> +		.name = "thunderbolt",
> +		.of_match_table = of_match_ptr(nhi_platform_of_match),
> +		.acpi_match_table = ACPI_PTR(nhi_platform_acpi_match),
> +		.pm = &tb_nhi_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(nhi_platform_driver);
> +MODULE_ALIAS("platform:thunderbolt");
> +MODULE_DESCRIPTION("Thunderbolt/USB4 platform host interface driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
> index 57502da29080..72497acac254 100644
> --- a/include/linux/thunderbolt.h
> +++ b/include/linux/thunderbolt.h
> @@ -511,6 +511,8 @@ void tb_service_properties_changed(struct tb_service *svc);
>   * @going_away: The host controller device is about to disappear so when
>   *		this flag is set, avoid touching the hardware anymore.
>   * @iommu_dma_protection: An IOMMU will isolate external-facing ports.
> + * @irq: interrupt number of NHI.
> + * @wake_irq: optional dedicated wakeup interrupt.
>   * @interrupt_work: Work scheduled to handle ring interrupt when no
>   *		    MSI-X is used.
>   * @hop_count: Number of rings (end point hops) supported by NHI.
> @@ -532,6 +534,8 @@ struct tb_nhi {
>  	u32 *interrupt_mask;
>  	bool going_away;
>  	bool iommu_dma_protection;
> +	int irq;
> +	int wake_irq;
>  	struct work_struct interrupt_work;
>  	u32 hop_count;
>  	unsigned long quirks;
> -- 
> 2.45.2

