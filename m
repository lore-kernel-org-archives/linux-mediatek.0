Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93DDC4828E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 10:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTYuUqAAa1asPPQu4iO8iN39YCdho88sr391TQj1cHQ=; b=G3/iZEBor4wiSX2wbxRUJT1ijJ
	cNXzCFed3jtHmzgPkriBqZCWQuNIOOqwtNAW3Y1ElftgVlgqTGluC8zuAHeCzMbHYvW9/EBFhlraj
	2LxuXsF6B5O+qReyzFDECj9KO5aAhMKgxJg2oOe2sWV9aX9JQgcIh24d75HnJ+n5eorWbcjLGVgZj
	ixSKwfM3JcHrY5qW6ClILayK67qQBrqj75eD34G4jVRWzkK39w2sWGvu5lhNB9oYKgnfaO3+iBgzX
	84ZUjjmRyYWb+cstHFGKm+MmPPPG+GXi6R3s5Jc+lyI4X3YebPlhHIUEa/jRaUXNHCvxVp5nace8N
	f9S/iBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVUap-00000007VZM-2b7H;
	Thu, 01 Feb 2024 10:46:51 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTcC-00000007K7g-3n37;
	Thu, 01 Feb 2024 09:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706780650;
	bh=v8UZHDHMivJNTKZkQiBRqCctvfGUTAovPj2Llh32tRA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B6cvJlvPjmX5CwyjO1L4ELu8292ViO1muHIlhHodeNj5ZNPqHxQAD5q9R0nn6jiIz
	 deXEdkM0ZfFrd0JcBqhjvDPfN8FVLGsh/rrdm0WIeJHs4dEJnazFvnw2yOTD52Ii6u
	 YX3jTq2SwBc0p5Jrwze1Q+5BZqJK/ggcFLkRmtsb2JJlrm2msineEqwmXsUz+TKJRa
	 Gz2cchQnHjKqr2oc/9+Bcncae6pJTnJPSUu2pmRjNj+XjQYWUtA8OBgUa6S2Us2T+2
	 2w85mhyqSJ3JPMVxOoILHuXPRCoMUoJEruN8JJ/9QjWQdTyYBVAo1iGee/CfF0X+eC
	 VXUPVGO7SZWCQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 89959378208D;
	Thu,  1 Feb 2024 09:44:08 +0000 (UTC)
Message-ID: <ea4c8128-d2cb-43fb-aebf-0f4733e1248b@collabora.com>
Date: Thu, 1 Feb 2024 10:44:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/21] virt: geniezone: Add GenieZone hypervisor driver
Content-Language: en-US
To: Yi-De Wu <yi-de.wu@mediatek.com>,
 Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
 Ze-Yu Wang <ze-yu.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 David Bradil <dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>,
 My Chuang <my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
 PeiLun Suei <peilun.suei@mediatek.com>,
 Liju Chen <liju-clr.chen@mediatek.com>,
 Willix Yeh <chi-shen.yeh@mediatek.com>,
 Kevenny Hsieh <kevenny.hsieh@mediatek.com>
References: <20240129083302.26044-1-yi-de.wu@mediatek.com>
 <20240129083302.26044-5-yi-de.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240129083302.26044-5-yi-de.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_014413_400987_47A477E6 
X-CRM114-Status: GOOD (  36.51  )
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

Il 29/01/24 09:32, Yi-De Wu ha scritto:
> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> 
> GenieZone hypervisor(gzvm) is a type-1 hypervisor that supports various
> virtual machine types and provides security features such as TEE-like
> scenarios and secure boot. It can create guest VMs for security use
> cases and has virtualization capabilities for both platform and
> interrupt. Although the hypervisor can be booted independently, it
> requires the assistance of GenieZone hypervisor kernel driver(gzvm-ko)
> to leverage the ability of Linux kernel for vCPU scheduling, memory
> management, inter-VM communication and virtio backend support.
> 
> Add the basic hypervisor driver. Subsequent patches will add more
> supported features to this driver.
> 
> Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
> Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
> ---
>   MAINTAINERS                             |  3 +
>   arch/arm64/Kbuild                       |  1 +
>   arch/arm64/geniezone/Makefile           |  9 +++
>   arch/arm64/geniezone/gzvm_arch_common.h | 44 ++++++++++++
>   arch/arm64/geniezone/vm.c               | 47 +++++++++++++
>   drivers/virt/Kconfig                    |  2 +
>   drivers/virt/geniezone/Kconfig          | 16 +++++
>   drivers/virt/geniezone/Makefile         | 10 +++
>   drivers/virt/geniezone/gzvm_main.c      | 89 +++++++++++++++++++++++++
>   include/linux/gzvm_drv.h                | 25 +++++++
>   10 files changed, 246 insertions(+)
>   create mode 100644 arch/arm64/geniezone/Makefile
>   create mode 100644 arch/arm64/geniezone/gzvm_arch_common.h
>   create mode 100644 arch/arm64/geniezone/vm.c
>   create mode 100644 drivers/virt/geniezone/Kconfig
>   create mode 100644 drivers/virt/geniezone/Makefile
>   create mode 100644 drivers/virt/geniezone/gzvm_main.c
>   create mode 100644 include/linux/gzvm_drv.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 17a8e20d2baa..0cb2d0599469 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9019,6 +9019,9 @@ M:	Ze-Yu Wang <ze-yu.wang@mediatek.com>
>   M:	Yi-De Wu <yi-de.wu@mediatek.com>
>   F:	Documentation/devicetree/bindings/hypervisor/mediatek,geniezone-hyp.yaml
>   F:	Documentation/virt/geniezone/
> +F:	arch/arm64/geniezone/
> +F:	drivers/virt/geniezone/
> +F:	include/linux/gzvm_drv.h
>   
>   GENWQE (IBM Generic Workqueue Card)
>   M:	Frank Haverkamp <haver@linux.ibm.com>
> diff --git a/arch/arm64/Kbuild b/arch/arm64/Kbuild
> index 5bfbf7d79c99..0c3cca572919 100644
> --- a/arch/arm64/Kbuild
> +++ b/arch/arm64/Kbuild
> @@ -4,6 +4,7 @@ obj-$(CONFIG_KVM)	+= kvm/
>   obj-$(CONFIG_XEN)	+= xen/
>   obj-$(subst m,y,$(CONFIG_HYPERV))	+= hyperv/
>   obj-$(CONFIG_CRYPTO)	+= crypto/
> +obj-$(CONFIG_MTK_GZVM)	+= geniezone/
>   
>   # for cleaning
>   subdir- += boot
> diff --git a/arch/arm64/geniezone/Makefile b/arch/arm64/geniezone/Makefile
> new file mode 100644
> index 000000000000..2957898cdd05
> --- /dev/null
> +++ b/arch/arm64/geniezone/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Main Makefile for gzvm, this one includes drivers/virt/geniezone/Makefile
> +#
> +include $(srctree)/drivers/virt/geniezone/Makefile
> +
> +gzvm-y += vm.o
> +
> +obj-$(CONFIG_MTK_GZVM) += gzvm.o
> diff --git a/arch/arm64/geniezone/gzvm_arch_common.h b/arch/arm64/geniezone/gzvm_arch_common.h
> new file mode 100644
> index 000000000000..f5bddcfe3a1f
> --- /dev/null
> +++ b/arch/arm64/geniezone/gzvm_arch_common.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + */
> +
> +#ifndef __GZVM_ARCH_COMMON_H__
> +#define __GZVM_ARCH_COMMON_H__
> +
> +#include <linux/arm-smccc.h>
> +
> +enum {
> +	GZVM_FUNC_PROBE = 12,
> +	NR_GZVM_FUNC,
> +};
> +
> +#define SMC_ENTITY_MTK			59
> +#define GZVM_FUNCID_START		(0x1000)
> +#define GZVM_HCALL_ID(func)						\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,	\
> +			   SMC_ENTITY_MTK, (GZVM_FUNCID_START + (func)))
> +
> +#define MT_HVC_GZVM_PROBE		GZVM_HCALL_ID(GZVM_FUNC_PROBE)
> +
> +/**
> + * gzvm_hypcall_wrapper() - the wrapper for hvc calls
> + * @a0: arguments passed in registers 0
> + * @a1: arguments passed in registers 1
> + * @a2: arguments passed in registers 2
> + * @a3: arguments passed in registers 3
> + * @a4: arguments passed in registers 4
> + * @a5: arguments passed in registers 5
> + * @a6: arguments passed in registers 6
> + * @a7: arguments passed in registers 7
> + * @res: result values from registers 0 to 3
> + *
> + * Return: The wrapper helps caller to convert geniezone errno to Linux errno.
> + */
> +int gzvm_hypcall_wrapper(unsigned long a0, unsigned long a1,
> +			 unsigned long a2, unsigned long a3,
> +			 unsigned long a4, unsigned long a5,
> +			 unsigned long a6, unsigned long a7,
> +			 struct arm_smccc_res *res);
> +
> +#endif /* __GZVM_ARCH_COMMON_H__ */
> diff --git a/arch/arm64/geniezone/vm.c b/arch/arm64/geniezone/vm.c
> new file mode 100644
> index 000000000000..e313aadec212
> --- /dev/null
> +++ b/arch/arm64/geniezone/vm.c
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/err.h>
> +#include <linux/uaccess.h>
> +
> +#include <linux/gzvm_drv.h>
> +#include "gzvm_arch_common.h"
> +
> +/**
> + * gzvm_hypcall_wrapper() - the wrapper for hvc calls
> + * @a0: arguments passed in registers 0

argument passed in register 0

> + * @a1: arguments passed in registers 1
> + * @a2: arguments passed in registers 2
> + * @a3: arguments passed in registers 3
> + * @a4: arguments passed in registers 4
> + * @a5: arguments passed in registers 5
> + * @a6: arguments passed in registers 6
> + * @a7: arguments passed in registers 7

...in registe7

> + * @res: result values from registers 0 to 3
> + *
> + * Return: The wrapper helps caller to convert geniezone errno to Linux errno.
> + */
> +int gzvm_hypcall_wrapper(unsigned long a0, unsigned long a1,
> +			 unsigned long a2, unsigned long a3,
> +			 unsigned long a4, unsigned long a5,
> +			 unsigned long a6, unsigned long a7,
> +			 struct arm_smccc_res *res)
> +{
> +	arm_smccc_hvc(a0, a1, a2, a3, a4, a5, a6, a7, res);
> +	return gzvm_err_to_errno(res->a0);
> +}
> +
> +int gzvm_arch_probe(void)
> +{
> +	struct arm_smccc_res res;
> +	int ret;
> +
> +	ret = gzvm_hypcall_wrapper(MT_HVC_GZVM_PROBE, 0, 0, 0, 0, 0, 0, 0, &res);
> +	if (ret)
> +		return -ENXIO;
> +
> +	return 0;
> +}
> diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
> index 40129b6f0eca..b4e9bddbcee7 100644
> --- a/drivers/virt/Kconfig
> +++ b/drivers/virt/Kconfig
> @@ -50,4 +50,6 @@ source "drivers/virt/acrn/Kconfig"
>   
>   source "drivers/virt/coco/Kconfig"
>   
> +source "drivers/virt/geniezone/Kconfig"
> +
>   endif
> diff --git a/drivers/virt/geniezone/Kconfig b/drivers/virt/geniezone/Kconfig
> new file mode 100644
> index 000000000000..b17c06c91074
> --- /dev/null
> +++ b/drivers/virt/geniezone/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config MTK_GZVM
> +	tristate "GenieZone Hypervisor driver for guest VM operation"
> +	depends on ARM64 && EVENTFD
> +	help
> +	  This driver, gzvm, enables to run guest VMs on MTK GenieZone
> +	  hypervisor. It exports kvm-like interfaces for VMM (e.g., crosvm) in
> +	  order to operate guest VMs on GenieZone hypervisor.
> +
> +	  GenieZone hypervisor now only supports MediaTek SoC and arm64
> +	  architecture.
> +
> +	  Select M if you want it be built as a module (gzvm.ko).
> +
> +	  If unsure, say N.
> diff --git a/drivers/virt/geniezone/Makefile b/drivers/virt/geniezone/Makefile
> new file mode 100644
> index 000000000000..8c1f0053e773
> --- /dev/null
> +++ b/drivers/virt/geniezone/Makefile
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Makefile for GenieZone driver, this file should be include in arch's
> +# to avoid two ko being generated.
> +#
> +
> +GZVM_DIR ?= ../../../drivers/virt/geniezone
> +
> +gzvm-y := $(GZVM_DIR)/gzvm_main.o
> +
> diff --git a/drivers/virt/geniezone/gzvm_main.c b/drivers/virt/geniezone/gzvm_main.c
> new file mode 100644
> index 000000000000..f7d4f0646d97
> --- /dev/null
> +++ b/drivers/virt/geniezone/gzvm_main.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kdev_t.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/gzvm_drv.h>
> +
> +/**
> + * gzvm_err_to_errno() - Convert geniezone return value to standard errno
> + *
> + * @err: Return value from geniezone function return
> + *
> + * Return: Standard errno
> + */
> +int gzvm_err_to_errno(unsigned long err)
> +{
> +	int gz_err = (int)err;
> +
> +	switch (gz_err) {
> +	case 0:
> +		return 0;
> +	case ERR_NO_MEMORY:
> +		return -ENOMEM;
> +	case ERR_NOT_SUPPORTED:

case ERR_NOT_SUPPORTED:
	fallthrough;
case ERR_NOT_IMPLEMENTED:
	return -EOPNOTSUPP;

> +		return -EOPNOTSUPP;
> +	case ERR_NOT_IMPLEMENTED:
> +		return -EOPNOTSUPP;
> +	case ERR_FAULT:
> +		return -EFAULT;
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static const struct file_operations gzvm_chardev_ops = {
> +	.llseek		= noop_llseek,
> +};
> +
> +static struct miscdevice gzvm_dev = {
> +	.minor = MISC_DYNAMIC_MINOR,
> +	.name = KBUILD_MODNAME,
> +	.fops = &gzvm_chardev_ops,
> +};
> +
> +static int gzvm_drv_probe(struct platform_device *pdev)
> +{
> +	if (gzvm_arch_probe() != 0) {
> +		dev_err(&pdev->dev, "Not found available conduit\n");
> +		return -ENODEV;
> +	}
> +
> +	return misc_register(&gzvm_dev);
> +}
> +
> +static int gzvm_drv_remove(struct platform_device *pdev)
> +{
> +	misc_deregister(&gzvm_dev);
> +	return 0;
> +}
> +
> +static const struct of_device_id gzvm_of_match[] = {
> +	{ .compatible = "mediatek,geniezone-hyp" },
> +	{/* sentinel */},
> +};
> +
> +static struct platform_driver gzvm_driver = {
> +	.probe = gzvm_drv_probe,
> +	.remove = gzvm_drv_remove,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.owner = THIS_MODULE,
> +		.of_match_table = gzvm_of_match,
> +	},
> +};
> +
> +module_platform_driver(gzvm_driver);
> +
> +MODULE_DEVICE_TABLE(of, gzvm_of_match);
> +MODULE_AUTHOR("MediaTek");
> +MODULE_DESCRIPTION("GenieZone interface for VMM");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/gzvm_drv.h b/include/linux/gzvm_drv.h

Why is this not `include/linux/soc/mediatek/gzvm_drv.h`?!

That's MediaTek specific, so it should go there.

Regards,
Angelo

> new file mode 100644
> index 000000000000..907f2f984de9
> --- /dev/null
> +++ b/include/linux/gzvm_drv.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + */
> +
> +#ifndef __GZVM_DRV_H__
> +#define __GZVM_DRV_H__
> +
> +/*
> + * These are the definitions of APIs between GenieZone hypervisor and driver,
> + * there's no need to be visible to uapi. Furthermore, we need GenieZone
> + * specific error code in order to map to Linux errno
> + */
> +#define NO_ERROR                (0)
> +#define ERR_NO_MEMORY           (-5)
> +#define ERR_NOT_SUPPORTED       (-24)
> +#define ERR_NOT_IMPLEMENTED     (-27)
> +#define ERR_FAULT               (-40)
> +
> +int gzvm_err_to_errno(unsigned long err);
> +
> +/* arch-dependant functions */
> +int gzvm_arch_probe(void);
> +
> +#endif /* __GZVM_DRV_H__ */



