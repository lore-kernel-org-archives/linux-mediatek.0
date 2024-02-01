Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E034EC47DDB
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZDJ75sVzQ1kzj2Ubxy3agW5oK/vRaK2nSMjmXE4Qxk=; b=FTukz+LdPP4hO+wFD5nfRXXVik
	gG6x57rHCfxeUf5/A2EeFUGo8iRC6rFO80S+nwiJGmGdbIiEQa4JYZNAEFvNl/uQRbMuY1XZqsV6h
	gP/aorqgzdsOQLW8r0rzdLCCQABGyDwmoFHc56O31Jd6Ptih7DyqpFDLPyUeAyzLTGNxWnXLVXmyA
	/xgjCO9d2L+ccDPj/60YNo00Mx0M4EJWvr+SOX2w6IlRx09fW9kAEa04V430TGrH9VZ/r96Aieitm
	ruRQo+sDofyhN34rFFuWvcxHjk20Y4fyzvo9GfCMfvJ7+36kdScrbllV+MwXWHLfLdL0oCxJH0eo9
	+yI9uXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVUan-00000007VYB-1SlJ;
	Thu, 01 Feb 2024 10:46:49 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTcB-00000007K7W-0OAT;
	Thu, 01 Feb 2024 09:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706780648;
	bh=tgkduB+n8TnPBdHD34UzC0Y9amJQZ87VxYvXvbidh5s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=COkrPBTELEdgUUw1zxH8TCCZAhOECqgODg9ObmY/iHVrzT6zx+KGGFEnsIjwaFu3S
	 /cYBHOSaqyO/t4llcmdYV3BW/FPuWOENxtY1V7viRuGd/Hay2xM0hibmap6YeEK5H7
	 FJBltL1adkWbv9ZQj/YFD6Xl09evMBgNSWQR76/H1n66HGgO6ZVG2QDjInbZdgeWOn
	 Ui4qRfyqcvTmaGBEmoRHZjjSCGjCPuKguHN0idawSqXAf3zcbxMi43Wge5czY8xqPZ
	 UBaDOlWgv577avKafS5SqJ7OYlRYcp8Y0AkqavqQhyuDH+NtK/8fUkvETKrCasT7kZ
	 nYmco7T+TGoQg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0CAEB3782081;
	Thu,  1 Feb 2024 09:44:06 +0000 (UTC)
Message-ID: <c117f6a7-59ea-4291-aa70-7c363d928ff7@collabora.com>
Date: Thu, 1 Feb 2024 10:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/21] virt: geniezone: Add vcpu support
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
 <20240129083302.26044-10-yi-de.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240129083302.26044-10-yi-de.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_014411_357576_6645B25F 
X-CRM114-Status: GOOD (  32.44  )
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
> VMM use this interface to create vcpu instance which is a fd, and this
> fd will be for any vcpu operations, such as setting vcpu registers and
> accepts the most important ioctl GZVM_VCPU_RUN which requests GenieZone
> hypervisor to do context switch to execute VM's vcpu context.
> 
> Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
> Signed-off-by: kevenny hsieh <kevenny.hsieh@mediatek.com>
> Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
> ---
>   arch/arm64/geniezone/Makefile           |   2 +-
>   arch/arm64/geniezone/gzvm_arch_common.h |  30 +++
>   arch/arm64/geniezone/vcpu.c             |  80 ++++++++
>   arch/arm64/geniezone/vm.c               |  12 ++
>   drivers/virt/geniezone/Makefile         |   2 +-
>   drivers/virt/geniezone/gzvm_vcpu.c      | 251 ++++++++++++++++++++++++
>   drivers/virt/geniezone/gzvm_vm.c        |   5 +
>   include/linux/gzvm_drv.h                |  23 +++
>   include/uapi/linux/gzvm.h               | 163 +++++++++++++++
>   9 files changed, 566 insertions(+), 2 deletions(-)
>   create mode 100644 arch/arm64/geniezone/vcpu.c
>   create mode 100644 drivers/virt/geniezone/gzvm_vcpu.c
> 
> diff --git a/arch/arm64/geniezone/Makefile b/arch/arm64/geniezone/Makefile
> index 2957898cdd05..69b0a4abeab0 100644
> --- a/arch/arm64/geniezone/Makefile
> +++ b/arch/arm64/geniezone/Makefile
> @@ -4,6 +4,6 @@
>   #
>   include $(srctree)/drivers/virt/geniezone/Makefile
>   
> -gzvm-y += vm.o
> +gzvm-y += vm.o vcpu.o
>   
>   obj-$(CONFIG_MTK_GZVM) += gzvm.o
> diff --git a/arch/arm64/geniezone/gzvm_arch_common.h b/arch/arm64/geniezone/gzvm_arch_common.h
> index 383af0829f11..684c35e2d9bc 100644
> --- a/arch/arm64/geniezone/gzvm_arch_common.h
> +++ b/arch/arm64/geniezone/gzvm_arch_common.h
> @@ -11,9 +11,15 @@
>   enum {
>   	GZVM_FUNC_CREATE_VM = 0,
>   	GZVM_FUNC_DESTROY_VM = 1,
> +	GZVM_FUNC_CREATE_VCPU = 2,
> +	GZVM_FUNC_DESTROY_VCPU = 3,
>   	GZVM_FUNC_SET_MEMREGION = 4,
> +	GZVM_FUNC_RUN = 5,
> +	GZVM_FUNC_GET_ONE_REG = 8,
> +	GZVM_FUNC_SET_ONE_REG = 9,
>   	GZVM_FUNC_PROBE = 12,
>   	GZVM_FUNC_ENABLE_CAP = 13,
> +	GZVM_FUNC_INFORM_EXIT = 14,
>   	NR_GZVM_FUNC,
>   };
>   
> @@ -25,9 +31,15 @@ enum {
>   
>   #define MT_HVC_GZVM_CREATE_VM		GZVM_HCALL_ID(GZVM_FUNC_CREATE_VM)
>   #define MT_HVC_GZVM_DESTROY_VM		GZVM_HCALL_ID(GZVM_FUNC_DESTROY_VM)
> +#define MT_HVC_GZVM_CREATE_VCPU		GZVM_HCALL_ID(GZVM_FUNC_CREATE_VCPU)
> +#define MT_HVC_GZVM_DESTROY_VCPU	GZVM_HCALL_ID(GZVM_FUNC_DESTROY_VCPU)
>   #define MT_HVC_GZVM_SET_MEMREGION	GZVM_HCALL_ID(GZVM_FUNC_SET_MEMREGION)
> +#define MT_HVC_GZVM_RUN			GZVM_HCALL_ID(GZVM_FUNC_RUN)
> +#define MT_HVC_GZVM_GET_ONE_REG		GZVM_HCALL_ID(GZVM_FUNC_GET_ONE_REG)
> +#define MT_HVC_GZVM_SET_ONE_REG		GZVM_HCALL_ID(GZVM_FUNC_SET_ONE_REG)
>   #define MT_HVC_GZVM_PROBE		GZVM_HCALL_ID(GZVM_FUNC_PROBE)
>   #define MT_HVC_GZVM_ENABLE_CAP		GZVM_HCALL_ID(GZVM_FUNC_ENABLE_CAP)
> +#define MT_HVC_GZVM_INFORM_EXIT		GZVM_HCALL_ID(GZVM_FUNC_INFORM_EXIT)
>   
>   /**
>    * gzvm_hypcall_wrapper() - the wrapper for hvc calls
> @@ -54,4 +66,22 @@ static inline u16 get_vmid_from_tuple(unsigned int tuple)
>   	return (u16)(tuple >> 16);
>   }
>   
> +static inline u16 get_vcpuid_from_tuple(unsigned int tuple)
> +{
> +	return (u16)(tuple & 0xffff);
> +}
> +
> +static inline unsigned int
> +assemble_vm_vcpu_tuple(u16 vmid, u16 vcpuid)
> +{
> +	return ((unsigned int)vmid << 16 | vcpuid);

A union could be useful for this one too.

> +}
> +
> +static inline void
> +disassemble_vm_vcpu_tuple(unsigned int tuple, u16 *vmid, u16 *vcpuid)
> +{
> +	*vmid = get_vmid_from_tuple(tuple);
> +	*vcpuid = get_vcpuid_from_tuple(tuple);
> +}
> +
>   #endif /* __GZVM_ARCH_COMMON_H__ */
> diff --git a/arch/arm64/geniezone/vcpu.c b/arch/arm64/geniezone/vcpu.c
> new file mode 100644
> index 000000000000..f6670bd77ad6
> --- /dev/null
> +++ b/arch/arm64/geniezone/vcpu.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/err.h>
> +#include <linux/uaccess.h>
> +
> +#include <linux/gzvm.h>
> +#include <linux/gzvm_drv.h>
> +#include "gzvm_arch_common.h"
> +
> +int gzvm_arch_vcpu_update_one_reg(struct gzvm_vcpu *vcpu, __u64 reg_id,
> +				  bool is_write, __u64 *data)
> +{
> +	struct arm_smccc_res res;
> +	unsigned long a1;
> +	int ret;
> +
> +	a1 = assemble_vm_vcpu_tuple(vcpu->gzvm->vm_id, vcpu->vcpuid);

	if (is_write)
		return gzvm_hypcall_wrapper(MT_HVC_GZVM_GET_ONE_REG,
					   a1, reg_id, *data, 0, 0, 0, 0, &res);

	ret = gzvm_hypcall_wrapper(MT_HVC_GZVM_GET_ONE_REG,
					   a1, reg_id, 0, 0, 0, 0, 0, &res);
	if (ret)
		return ret;

	*data = res.a1;

	return 0;
}


> +	if (!is_write) {
> +		ret = gzvm_hypcall_wrapper(MT_HVC_GZVM_GET_ONE_REG,
> +					   a1, reg_id, 0, 0, 0, 0, 0, &res);

		if (ret)
			return ret;
		*data = res.a1;
	}

> +		if (ret == 0)
> +			*data = res.a1;
> +	} else {
> +		ret = gzvm_hypcall_wrapper(MT_HVC_GZVM_SET_ONE_REG,
> +					   a1, reg_id, *data, 0, 0, 0, 0, &res);
> +	}
> +
> +	return ret;
> +}
> +
> +int gzvm_arch_vcpu_run(struct gzvm_vcpu *vcpu, __u64 *exit_reason)
> +{
> +	struct arm_smccc_res res;
> +	unsigned long a1;
> +	int ret;
> +
> +	a1 = assemble_vm_vcpu_tuple(vcpu->gzvm->vm_id, vcpu->vcpuid);
> +	ret = gzvm_hypcall_wrapper(MT_HVC_GZVM_RUN, a1, 0, 0, 0, 0, 0,
> +				   0, &res);
> +	*exit_reason = res.a1;
> +	return ret;
> +}
> +
> +int gzvm_arch_destroy_vcpu(u16 vm_id, int vcpuid)
> +{
> +	struct arm_smccc_res res;
> +	unsigned long a1;
> +
> +	a1 = assemble_vm_vcpu_tuple(vm_id, vcpuid);
> +	gzvm_hypcall_wrapper(MT_HVC_GZVM_DESTROY_VCPU, a1, 0, 0, 0, 0, 0, 0,
> +			     &res);
> +
> +	return 0;
> +}
> +
> +/**
> + * gzvm_arch_create_vcpu() - Call smc to gz hypervisor to create vcpu
> + * @vm_id: vm id
> + * @vcpuid: vcpu id
> + * @run: Virtual address of vcpu->run
> + *
> + * Return: The wrapper helps caller to convert geniezone errno to Linux errno.
> + */
> +int gzvm_arch_create_vcpu(u16 vm_id, int vcpuid, void *run)
> +{
> +	struct arm_smccc_res res;
> +	unsigned long a1, a2;
> +	int ret;
> +
> +	a1 = assemble_vm_vcpu_tuple(vm_id, vcpuid);
> +	a2 = (__u64)virt_to_phys(run);
> +	ret = gzvm_hypcall_wrapper(MT_HVC_GZVM_CREATE_VCPU, a1, a2, 0, 0, 0, 0,
> +				   0, &res);
> +
> +	return ret;
> +}
> diff --git a/arch/arm64/geniezone/vm.c b/arch/arm64/geniezone/vm.c
> index b6a2bfa98b43..1fac10b98c11 100644
> --- a/arch/arm64/geniezone/vm.c
> +++ b/arch/arm64/geniezone/vm.c
> @@ -37,6 +37,18 @@ int gzvm_hypcall_wrapper(unsigned long a0, unsigned long a1,
>   	return gzvm_err_to_errno(res->a0);
>   }
>   
> +int gzvm_arch_inform_exit(u16 vm_id)
> +{
> +	struct arm_smccc_res res;
> +	int ret;
> +
> +	ret = gzvm_hypcall_wrapper(MT_HVC_GZVM_INFORM_EXIT, vm_id, 0, 0, 0, 0, 0, 0, &res);
> +	if (ret)
> +		return -ENXIO;
> +
> +	return 0;
> +}
> +
>   int gzvm_arch_probe(void)
>   {
>   	struct arm_smccc_res res;
> diff --git a/drivers/virt/geniezone/Makefile b/drivers/virt/geniezone/Makefile
> index 59fc4510a843..a630b919cda5 100644
> --- a/drivers/virt/geniezone/Makefile
> +++ b/drivers/virt/geniezone/Makefile
> @@ -7,4 +7,4 @@
>   GZVM_DIR ?= ../../../drivers/virt/geniezone
>   
>   gzvm-y := $(GZVM_DIR)/gzvm_main.o $(GZVM_DIR)/gzvm_vm.o \
> -	  $(GZVM_DIR)/gzvm_mmu.o
> +	  $(GZVM_DIR)/gzvm_mmu.o $(GZVM_DIR)/gzvm_vcpu.o
> diff --git a/drivers/virt/geniezone/gzvm_vcpu.c b/drivers/virt/geniezone/gzvm_vcpu.c
> new file mode 100644
> index 000000000000..39c471d0d257
> --- /dev/null
> +++ b/drivers/virt/geniezone/gzvm_vcpu.c
> @@ -0,0 +1,251 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + */
> +
> +#include <asm/sysreg.h>
> +#include <linux/anon_inodes.h>
> +#include <linux/device.h>
> +#include <linux/file.h>
> +#include <linux/mm.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/gzvm_drv.h>
> +
> +/* maximum size needed for holding an integer */
> +#define ITOA_MAX_LEN 12
> +
> +static long gzvm_vcpu_update_one_reg(struct gzvm_vcpu *vcpu,
> +				     void __user *argp,
> +				     bool is_write)
> +{
> +	struct gzvm_one_reg reg;
> +	void __user *reg_addr;
> +	u64 data = 0;
> +	u64 reg_size;
> +	long ret;
> +
> +	if (copy_from_user(&reg, argp, sizeof(reg)))
> +		return -EFAULT;
> +
> +	reg_addr = (void __user *)reg.addr;
> +	reg_size = (reg.id & GZVM_REG_SIZE_MASK) >> GZVM_REG_SIZE_SHIFT;
> +	reg_size = BIT(reg_size);
> +
> +	if (reg_size != 1 && reg_size != 2 && reg_size != 4 && reg_size != 8)
> +		return -EINVAL;
> +

	if (!is_write)
		return -EOPNOTSUPP;

	/* GZ hypervisor would filter out invalid vcpu register access */
	if (copy_from_user(&data, reg_addr, reg_size))
		return -EFAULT;

> +	if (is_write) {
> +		/* GZ hypervisor would filter out invalid vcpu register access */
> +		if (copy_from_user(&data, reg_addr, reg_size))
> +			return -EFAULT;
> +	} else {
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ret = gzvm_arch_vcpu_update_one_reg(vcpu, reg.id, is_write, &data);
> +
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * gzvm_vcpu_run() - Handle vcpu run ioctl, entry point to guest and exit
> + *		     point from guest
> + * @vcpu: Pointer to struct gzvm_vcpu
> + * @argp: Pointer to struct gzvm_vcpu_run in userspace
> + *
> + * Return:
> + * * 0			- Success.
> + * * Negative		- Failure.
> + */
> +static long gzvm_vcpu_run(struct gzvm_vcpu *vcpu, void __user *argp)
> +{
> +	bool need_userspace = false;
> +	u64 exit_reason = 0;
> +
> +	if (copy_from_user(vcpu->run, argp, sizeof(struct gzvm_vcpu_run)))
> +		return -EFAULT;
> +
> +	for (int i = 0; i < ARRAY_SIZE(vcpu->run->padding1); i++) {
> +		if (vcpu->run->padding1[i])
> +			return -EINVAL;
> +	}
> +
> +	if (vcpu->run->immediate_exit == 1)
> +		return -EINTR;
> +
> +	while (!need_userspace && !signal_pending(current)) {
> +		gzvm_arch_vcpu_run(vcpu, &exit_reason);
> +
> +		switch (exit_reason) {
> +		case GZVM_EXIT_MMIO:
> +			need_userspace = true;
> +			break;
> +		/**
> +		 * it's geniezone's responsibility to fill corresponding data
> +		 * structure
> +		 */
> +		case GZVM_EXIT_HYPERCALL:
> +			fallthrough;
> +		case GZVM_EXIT_EXCEPTION:
> +			fallthrough;
> +		case GZVM_EXIT_DEBUG:
> +			fallthrough;
> +		case GZVM_EXIT_FAIL_ENTRY:
> +			fallthrough;
> +		case GZVM_EXIT_INTERNAL_ERROR:
> +			fallthrough;
> +		case GZVM_EXIT_SYSTEM_EVENT:
> +			fallthrough;
> +		case GZVM_EXIT_SHUTDOWN:
> +			need_userspace = true;
> +			break;
> +		case GZVM_EXIT_IRQ:
> +			fallthrough;
> +		case GZVM_EXIT_GZ:
> +			break;
> +		case GZVM_EXIT_UNKNOWN:
> +			fallthrough;
> +		default:
> +			pr_err("vcpu unknown exit\n");
> +			need_userspace = true;
> +			goto out;
> +		}
> +	}
> +
> +out:
> +	if (copy_to_user(argp, vcpu->run, sizeof(struct gzvm_vcpu_run)))
> +		return -EFAULT;
> +	if (signal_pending(current)) {
> +		// invoke hvc to inform gz to map memory

/* invoke ... */

> +		gzvm_arch_inform_exit(vcpu->gzvm->vm_id);
> +		return -ERESTARTSYS;
> +	}
> +	return 0;
> +}

Regards,
Angelo



