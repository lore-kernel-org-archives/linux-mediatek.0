Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C25C54E67
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 15:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbqvq+BA/vaA9/GEYHd73qogtaZufT5humKqhlfkAys=; b=cUyESXpE1e7Jg/wPKvIfU5TO7P
	N/Uo1Wd63ir3XWv99OZwaHXSELPA7KdFM0xaK1HWj9htVJl0TzAnn0mXFVDyzXPLWCkAupwHhlpqE
	kQmzVP/E6/WJvR5uJOVgvnteL1eqtm+uLkMtClcAIxR6psgcDopCdDrUx/k6tOq02vMiC0CaxIzKe
	+7bflmJb+heoGBeL8Fmxe7kXrocSCAYfo7BIGE7B+MpXxSqeE46IksIUvbpxQ56DPR4f2v7TJlZO1
	SAEcX5lO2dPNTYXHR/ABV8a38U7dgf7Atz/gttR0B5nO4eocbdwcq6lvwgbQYtSoi4mh1wsEg7y1k
	THigq9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpron-0000000EXXg-2PHY;
	Thu, 28 Mar 2024 15:37:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rproj-0000000EXVz-43rI;
	Thu, 28 Mar 2024 15:37:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7663C617A4;
	Thu, 28 Mar 2024 15:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE36FC433F1;
	Thu, 28 Mar 2024 15:37:20 +0000 (UTC)
Date: Thu, 28 Mar 2024 11:40:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Yi-De Wu <yi-de.wu@mediatek.com>
Cc: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang
 <ze-yu.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin Marinas
 <catalin.marinas@arm.com>, Wihl Deacon <will@kernel.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Richard Cochran
 <richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, David Bradil <dbrazdil@google.com>,
 Trilok Soni <quic_tsoni@quicinc.com>, Jade Shih <jades.shih@mediatek.com>,
 Ivan Tseng <ivan.tseng@mediatek.com>, My Chuang <my.chuang@mediatek.com>,
 Shawn Hsiao <shawn.hsiao@mediatek.com>, PeiLun Suei
 <peilun.suei@mediatek.com>, Liju Chen <liju-clr.chen@mediatek.com>, "Willix
 Yeh" <chi-shen.yeh@mediatek.com>, Kevenny Hsieh
 <kevenny.hsieh@mediatek.com>
Subject: Re: [PATCH v8 19/20] virt: geniezone: Add tracing support for hyp
 call and vcpu exit_reason
Message-ID: <20240328114004.5793230a@gandalf.local.home>
In-Reply-To: <20231228105147.13752-20-yi-de.wu@mediatek.com>
References: <20231228105147.13752-1-yi-de.wu@mediatek.com>
	<20231228105147.13752-20-yi-de.wu@mediatek.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_083726_318792_21C0C7A5 
X-CRM114-Status: GOOD (  23.47  )
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

On Thu, 28 Dec 2023 18:51:46 +0800
Yi-De Wu <yi-de.wu@mediatek.com> wrote:

> Add tracepoints for hypervisor calls and VCPU exit reasons in GenieZone
> driver. It aids performance debugging by providing more information
> about hypervisor operations and VCPU behavior.
> 
> Command Usage:
> echo geniezone:* >> /sys/kernel/tracing/set_event
> echo 1 > /sys/kernel/tracing/tracing_on
> echo 0 > /sys/kernel/tracing/tracing_on
> cat /sys/kernel/tracing/trace
> 
> For example:
> crosvm_vcpu0-4838 [004] ..... 76053.536034: mtk_hypcall_enter: id=0xbb001005
> crosvm_vcpu0-4838 [004] ..... 76053.540039: mtk_hypcall_leave: id=0xbb001005 invalid=0
> crosvm_vcpu0-4838 [004] ..... 76053.540040: mtk_vcpu_exit: vcpu exit_reason=0x92920003

Cleaning out patchwork, I noticed this patch.

You can make the above more informative by having it output:

 crosvm_vcpu0-4838 [004] ..... 76053.540040: mtk_vcpu_exit: vcpu exit_reason=IRQ


> 
> This example tracks a hypervisor function call by an ID (`0xbb001005`)
> from initiation to termination, which is supported (invalid=0). A vCPU
> exit is triggered by an Interrupt Request (IRQ) (exit reason: 0x92920003).
> 
> /* VM exit reason */
> enum {
> 	GZVM_EXIT_UNKNOWN = 0x92920000,
> 	GZVM_EXIT_MMIO = 0x92920001,
> 	GZVM_EXIT_HYPERCALL = 0x92920002,
> 	GZVM_EXIT_IRQ = 0x92920003,
> 	GZVM_EXIT_EXCEPTION = 0x92920004,
> 	GZVM_EXIT_DEBUG = 0x92920005,
> 	GZVM_EXIT_FAIL_ENTRY = 0x92920006,
> 	GZVM_EXIT_INTERNAL_ERROR = 0x92920007,
> 	GZVM_EXIT_SYSTEM_EVENT = 0x92920008,
> 	GZVM_EXIT_SHUTDOWN = 0x92920009,
> 	GZVM_EXIT_GZ = 0x9292000a,
> };
> 
> Signed-off-by: Liju-clr Chen <liju-clr.chen@mediatek.com>
> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
> ---
>  arch/arm64/geniezone/vm.c          |  5 +++
>  drivers/virt/geniezone/gzvm_vcpu.c |  3 ++
>  include/trace/events/geniezone.h   | 54 ++++++++++++++++++++++++++++++
>  3 files changed, 62 insertions(+)
>  create mode 100644 include/trace/events/geniezone.h
> 
> diff --git a/arch/arm64/geniezone/vm.c b/arch/arm64/geniezone/vm.c
> index a9d264bbb3b1..5667643251b5 100644
> --- a/arch/arm64/geniezone/vm.c
> +++ b/arch/arm64/geniezone/vm.c
> @@ -7,6 +7,8 @@
>  #include <linux/err.h>
>  #include <linux/uaccess.h>
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/geniezone.h>
>  #include <linux/gzvm.h>
>  #include <linux/gzvm_drv.h>
>  #include "gzvm_arch_common.h"
> @@ -33,7 +35,10 @@ int gzvm_hypcall_wrapper(unsigned long a0, unsigned long a1,
>  			 unsigned long a6, unsigned long a7,
>  			 struct arm_smccc_res *res)
>  {
> +	trace_mtk_hypcall_enter(a0);
>  	arm_smccc_hvc(a0, a1, a2, a3, a4, a5, a6, a7, res);
> +	trace_mtk_hypcall_leave(a0, (res->a0 != ERR_NOT_SUPPORTED) ? 0 : 1);
> +
>  	return gzvm_err_to_errno(res->a0);
>  }
>  
> diff --git a/drivers/virt/geniezone/gzvm_vcpu.c b/drivers/virt/geniezone/gzvm_vcpu.c
> index 86c690749277..138ec064596b 100644
> --- a/drivers/virt/geniezone/gzvm_vcpu.c
> +++ b/drivers/virt/geniezone/gzvm_vcpu.c
> @@ -10,6 +10,8 @@
>  #include <linux/mm.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +
> +#include <trace/events/geniezone.h>
>  #include <linux/gzvm_drv.h>
>  
>  /* maximum size needed for holding an integer */
> @@ -103,6 +105,7 @@ static long gzvm_vcpu_run(struct gzvm_vcpu *vcpu, void __user *argp)
>  
>  	while (!need_userspace && !signal_pending(current)) {
>  		gzvm_arch_vcpu_run(vcpu, &exit_reason);
> +		trace_mtk_vcpu_exit(exit_reason);
>  
>  		switch (exit_reason) {
>  		case GZVM_EXIT_MMIO:
> diff --git a/include/trace/events/geniezone.h b/include/trace/events/geniezone.h
> new file mode 100644
> index 000000000000..1fa44f9c4b3c
> --- /dev/null
> +++ b/include/trace/events/geniezone.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM geniezone
> +
> +#define _TRACE_GENIEZONE_H
> +
> +#include <linux/tracepoint.h>

#define GZVM_EXIT_REASONS	\
	EM(UNKNOWN)		\
	EM(MMIO)		\
	EM(HYPERCALL)		\
	EM(IRQ)			\
	EM(EXCEPTION)		\
	EM(DEBUG)		\
	EM(FAIL_ENTRY)		\
	EM(INTERNAL_ERROR)	\
	EM(SYSTEM_EVENT)	\
	EM(SHUTDOWN)		\
	EMe(GZ)

#undef EM
#undef EMe
#define EM(a) TRACE_DEFINE_ENUM(GZVM_EXIT_##a);
#define EMe(a) TRACE_DEFINE_ENUM(GZVM_EXIT_##a);

GZVM_EXIT_REASONS

#undef EM
#undef EMe

#define EM(a)       { GZVM_EXIT_##a, #a },
#define EMe(a)      { GZVM_EXIT_##a, #a }

> +
> +TRACE_EVENT(mtk_hypcall_enter,
> +	    TP_PROTO(unsigned long id),
> +
> +	    TP_ARGS(id),
> +
> +	    TP_STRUCT__entry(__field(unsigned long, id)),
> +
> +	    TP_fast_assign(__entry->id = id;),
> +
> +	    TP_printk("id=0x%lx", __entry->id)
> +);
> +
> +TRACE_EVENT(mtk_hypcall_leave,
> +	    TP_PROTO(unsigned long id, unsigned long invalid),
> +
> +	    TP_ARGS(id, invalid),
> +
> +	    TP_STRUCT__entry(__field(unsigned long, id)
> +			     __field(unsigned long, invalid)
> +	    ),
> +
> +	    TP_fast_assign(__entry->id = id;
> +			   __entry->invalid = invalid;
> +	    ),
> +
> +	    TP_printk("id=0x%lx invalid=%lu", __entry->id, __entry->invalid)
> +);
> +
> +TRACE_EVENT(mtk_vcpu_exit,
> +	    TP_PROTO(unsigned long exit_reason),
> +
> +	    TP_ARGS(exit_reason),
> +
> +	    TP_STRUCT__entry(__field(unsigned long, exit_reason)),
> +
> +	    TP_fast_assign(__entry->exit_reason = exit_reason;),
> +
> +	    TP_printk("vcpu exit_reason=0x%lx", __entry->exit_reason)

	    TP_printk("vcpu exit_reason=0x%lx",
		__print_symbolic(__entry->exit_reason, GZVM_EXIT_REASONS))


And instead of having the cryptic enum values printed, you will have human
readable reasons.

-- Steve


> +);
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>


