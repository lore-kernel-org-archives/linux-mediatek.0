Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA466C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 18:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arBeCPo6gDtdDOXqBkzSf+4JcCaS3cv0F/CffNGCQuk=; b=C1NN3nd9+P+Ws/U0Eh2dulYGgN
	3Ntw0frHJ0atm2F17GSAF0h+oeOw3QAyy5QH3j117wD2AHtMI9zbWtcI429RC/8sOa/dEY1Eal6hC
	0pPlRegRJXA8DzfBEGVH3VQg6qWtBgzyv7uVT9UflIQEDs180Gqy0w6b6fO57meTIOWfrn4c/NONU
	Gzh2JKpPMu9HGJN0sxq5OBNQhVaq4j2NwL0HIy/5OzmopjFo8Ip+REtJG+pUDYxulpzgqcSHJnQLP
	va+sMXm34yfcikkalHVSsP930Suu8DBUK5J19IIiuQgoFh1m0FRefS1VyO/vStvbUSkRz0/PexlFJ
	pmgchFTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psTJW-00BZlQ-1P;
	Fri, 28 Apr 2023 18:59:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psTJS-00BZjj-2A;
	Fri, 28 Apr 2023 18:59:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C231D635A6;
	Fri, 28 Apr 2023 18:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272F6C433D2;
	Fri, 28 Apr 2023 18:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682708361;
	bh=43v0rS1a68oLAY9zCNF8YNoMJZ5s4pw7kzode4WufbU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p6f6cyvLinSytdCRb5DBqvUQZA7z4ZLu6tiME//ST2zZ0iIUjxqdF6VNc8bdEazQI
	 19jQw714m/ngf/wh90qa2nRhdk5rJ/tHHfSkeNZMJtjTnyZLsVTE01juNHG3LfgWAz
	 xrhqfSj9lHz7nhRKsTR76C2X6c9gosqLw1bePV2j1O6If35MGgHQf6ioa3Bred2Y3d
	 KoW4/oWaKGdyeBx9wUIHwXuhDyqOaiSKs67iTvzR+zCFLMXvP64vusWeIkr4uJXKbc
	 xdcmZ6qfNArAEt0yY1ciYzRW2jHeKHoiDGwzDFJnsY2e2oYUIVdjADvUppR1rSpwTA
	 JAmf0aMgAAKEA==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1psTJO-00BvAe-KO;
	Fri, 28 Apr 2023 19:59:18 +0100
MIME-Version: 1.0
Date: Fri, 28 Apr 2023 19:59:18 +0100
From: Marc Zyngier <maz@kernel.org>
To: Yi-De Wu <yi-de.wu@mediatek.com>
Cc: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang
 <ze-yu.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet
 <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-mediatek@lists.infradead.org, David Bradil <dbrazdil@google.com>,
 Trilok Soni <quic_tsoni@quicinc.com>, Jade Shih <jades.shih@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Ivan Tseng <ivan.tseng@mediatek.com>,
 My Chuang <my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
 PeiLun Suei <peilun.suei@mediatek.com>, Liju Chen
 <liju-clr.chen@mediatek.com>
Subject: Re: [PATCH v2 5/7] virt: geniezone: Add irqchip support for virtual
 interrupt injection
In-Reply-To: <20230428103622.18291-6-yi-de.wu@mediatek.com>
References: <20230428103622.18291-1-yi-de.wu@mediatek.com>
 <20230428103622.18291-6-yi-de.wu@mediatek.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f1c8c1c1c091be87dfbc27b9178fc3e6@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: yi-de.wu@mediatek.com, yingshiuan.pan@mediatek.com, ze-yu.wang@mediatek.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, linux-mediatek@lists.infradead.org, dbrazdil@google.com, quic_tsoni@quicinc.com, jades.shih@mediatek.com, miles.chen@mediatek.com, ivan.tseng@mediatek.com, my.chuang@mediatek.com, shawn.hsiao@mediatek.com, peilun.suei@mediatek.com, liju-clr.chen@mediatek.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_115922_808876_E61EDDFF 
X-CRM114-Status: GOOD (  22.71  )
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

On 2023-04-28 11:36, Yi-De Wu wrote:
> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> 
> Enable GenieZone to handle virtual interrupt injection request.
> 
> Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
> ---
>  arch/arm64/geniezone/Makefile       |  2 +-
>  arch/arm64/geniezone/gzvm_arch.c    | 24 ++++++--
>  arch/arm64/geniezone/gzvm_arch.h    | 11 ++++
>  arch/arm64/geniezone/gzvm_irqchip.c | 88 +++++++++++++++++++++++++++++
>  drivers/virt/geniezone/gzvm_vm.c    | 75 ++++++++++++++++++++++++
>  include/linux/gzvm_drv.h            |  4 ++
>  include/uapi/linux/gzvm.h           | 38 ++++++++++++-
>  7 files changed, 235 insertions(+), 7 deletions(-)
>  create mode 100644 arch/arm64/geniezone/gzvm_irqchip.c

[...]

> +++ b/arch/arm64/geniezone/gzvm_irqchip.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + */
> +
> +#include <linux/irqchip/arm-gic-v3.h>
> +#include <kvm/arm_vgic.h>

NAK.

There is no way you can rely on anything from KVM in
your own hypervisor code.

> +
> +#include <linux/gzvm.h>
> +#include <linux/gzvm_drv.h>
> +#include "gzvm_arch.h"
> +
> +/**
> + * gzvm_sync_vgic_state() - Check all LRs synced from gz hypervisor
> + *
> + * Traverse all LRs, see if any EOIed vint, notify_acked_irq if any.
> + * GZ does not fold/unfold everytime KVM_RUN, so we have to traverse 
> all saved
> + * LRs. It will not takes much more time comparing to fold/unfold 
> everytime
> + * GZVM_RUN, because there are only few LRs.
> + */
> +void gzvm_sync_vgic_state(struct gzvm_vcpu *vcpu)
> +{
> +}
> +
> +/* is_irq_valid() - Check the irq number and irq_type are matched */
> +static bool is_irq_valid(u32 irq, u32 irq_type)
> +{
> +	switch (irq_type) {
> +	case GZVM_IRQ_TYPE_CPU:
> +		/*  0 ~ 15: SGI */
> +		if (likely(irq <= GZVM_IRQ_CPU_FIQ))
> +			return true;
> +		break;
> +	case GZVM_IRQ_TYPE_PPI:
> +		/* 16 ~ 31: PPI */
> +		if (likely(irq >= VGIC_NR_SGIS && irq < VGIC_NR_PRIVATE_IRQS))

What happens if I redefine all these macros tomorrow? None of
this code should rely on anything that is *INTERNAL* to KVM.

         M.
-- 
Jazz is not dead. It just smells funny...

