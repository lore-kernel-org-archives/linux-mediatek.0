Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA55AC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 14:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hy+Z8rveBWKSc5kZLhoJ4cV0ufUTpc48xty9IHGizlk=; b=d1zo3hTWeWhHLX97slP0r6yWKn
	PrRfPKrqKPaqqvyoqni828qLKfyS5++jK/8pfIEMfz2350NquAT7Im7pThmoHjsxwhnp8b5vopCoF
	g25rMwinhkUiPH/KXmpyrmrDWkqGvvKikIvk0KsUaCO8bEA3/1OtR28T1MgTW1Om+qVTJatjhARvk
	EQK3jxFDWgYXDN4U3WAbwgjjDkSyqHZrJG+E8GDP1V7cV1BwcoRL1YWSwJP6dFBmUEK9hN2q+eW9O
	w2awRjB5UokOrB/0pDmdpJStglLxr/30Y+tEzwbzDTtz+ilzNq9iUFPNm6qiCwyn7SxSQ2ORyEIRe
	5dut2JBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwNhg-00000008lfS-1uRd;
	Mon, 15 Apr 2024 14:53:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwNhc-00000008leB-0nYS;
	Mon, 15 Apr 2024 14:53:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 38ACFCE0E0B;
	Mon, 15 Apr 2024 14:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267E2C113CC;
	Mon, 15 Apr 2024 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713192776;
	bh=NhbAtc6tAGccokWSTjoKOMtgLuAbLGDa8a3OfLwV230=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PWrs5fKIlnzoyDAUHDWP4Y/Pvl09ehPKzlzipssc5llEgsM4XodZX0woW/NTST5B0
	 B03GQhlkgJcyHjeYjkF3SyUa20g6XEuS8KiTh2nzLYc3Gze0gL4BErAp+FmCxJDLqi
	 bvUg4CwKXnhE2lYPOVePRzcbQQ8MsTc1venCKXnd1OzvhSY+Hnj1xlWlPSkFUF+Jvi
	 bUpSa71+FXCgHH2/wOsYHf8ByDStbIrmopHRqOwEf0qZSD6UPlNaOMa+5qLAXv2G6P
	 0KWdSBJRQ3odCtfC+CFjNz5OBy/p8Co9ZLQ0bETvoKnFjr2C56WASlvyOKZAExb91o
	 UjHI3ixedmu6Q==
Date: Mon, 15 Apr 2024 15:52:48 +0100
From: Simon Horman <horms@kernel.org>
To: Yi-De Wu <yi-de.wu@mediatek.com>
Cc: Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>,
	Willix Yeh <chi-shen.yeh@mediatek.com>,
	Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Subject: Re: [PATCH v10 15/21] virt: geniezone: Add demand paging support
Message-ID: <20240415145248.GD2320920@kernel.org>
References: <20240412065718.29105-1-yi-de.wu@mediatek.com>
 <20240412065718.29105-16-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412065718.29105-16-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_075300_619841_23FC8F60 
X-CRM114-Status: GOOD (  23.77  )
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

On Fri, Apr 12, 2024 at 02:57:12PM +0800, Yi-De Wu wrote:
> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> 
> This page fault handler helps GenieZone hypervisor to do demand paging.
> On a lower level translation fault, GenieZone hypervisor will first
> check the fault GPA (guest physical address or IPA in ARM) is valid
> e.g. within the registered memory region, then it will setup the
> vcpu_run->exit_reason with necessary information for returning to
> gzvm driver.
> 
> With the fault information, the gzvm driver looks up the physical
> address and call the MT_HVC_GZVM_MAP_GUEST to request the hypervisor
> maps the found PA to the fault GPA (IPA).
> 
> There is one exception, for protected vm, we will populate full VM's
> memory region in advance in order to improve performance.
> 
> Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
> Signed-off-by: kevenny hsieh <kevenny.hsieh@mediatek.com>
> Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>

...

> diff --git a/drivers/virt/geniezone/gzvm_exception.c b/drivers/virt/geniezone/gzvm_exception.c
> new file mode 100644
> index 000000000000..475bc15b0689
> --- /dev/null
> +++ b/drivers/virt/geniezone/gzvm_exception.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/soc/mediatek/gzvm_drv.h>
> +
> +/**
> + * gzvm_handle_guest_exception() - Handle guest exception
> + * @vcpu: Pointer to struct gzvm_vcpu_run in userspace
> + * Return:
> + * * true - This exception has been processed, no need to back to VMM.
> + * * false - This exception has not been processed, require userspace.
> + */
> +bool gzvm_handle_guest_exception(struct gzvm_vcpu *vcpu)

Hi Yi-De Wu,

The return type is bool, however the function actually
returns either a bool or signed int.

I think that either:

1. The return type should be changed to int,
   and returning true and false should be updated.

2. The function should always return true or false.

Flagged by Smatch.

> +{
> +	int ret;
> +
> +	for (int i = 0; i < ARRAY_SIZE(vcpu->run->exception.reserved); i++) {
> +		if (vcpu->run->exception.reserved[i])
> +			return -EINVAL;
> +	}
> +
> +	switch (vcpu->run->exception.exception) {
> +	case GZVM_EXCEPTION_PAGE_FAULT:
> +		ret = gzvm_handle_page_fault(vcpu);
> +		break;
> +	case GZVM_EXCEPTION_UNKNOWN:
> +		fallthrough;
> +	default:
> +		ret = -EFAULT;
> +	}
> +
> +	if (!ret)
> +		return true;
> +	else
> +		return false;
> +}

...

