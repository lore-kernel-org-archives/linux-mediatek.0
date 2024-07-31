Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B42DC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 08:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQZx3HYYVNB5vITecawH5G+5vDqAKVo5qs6yg+kY8es=; b=u6r3ucyxTAZaLpj0QPQdJdFLBV
	uFXhvo3ou1SepKGMokkgsHMw43SlaVYwBEGqIJddMzHZxKGq7FxoIxnMKO29xsyGyGfEmKO7vR6mz
	aVgBD0F6jg3Er9iqYdaPeWkDPM+3okV2QpkIqpk6M+I7hXd1yN0Yj0fxFBaNrEw4JB6G76vARgeof
	nTMh1EZWR6UFJMIUJHaF9n3ZwVpw24LGKsEpnMlioBnqG+TS5DGG3pwuKo2kb7krfXrMgzA2h6/6F
	Ha6SCDexbTuWqquqB1WB0Ag+qSSpQf1koCcYkuP2EdS/NIOg0eGJ4+HGiFDDjnjWKqF9LlTUa2k3u
	K28OVJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ5A6-00000000P8J-1hri;
	Wed, 31 Jul 2024 08:58:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ59X-00000000OuD-0JLG;
	Wed, 31 Jul 2024 08:57:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B75762295;
	Wed, 31 Jul 2024 08:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC84C116B1;
	Wed, 31 Jul 2024 08:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722416266;
	bh=hopejYkFDlRXosQSrN9FNvd2qXYNt97CgMPgExHWjLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kgcv9F/j4hbv4sY33GK6d58MNdprg7Tk6x7Afte7Yvm+pO9ukFm6JSZHFhVrQctV8
	 HCJvnQ2SmAqj0sAQJBgaQF2tt0TOI5PcJu9v2fmRxV2XUWaFGKRqLMu52qnFc79kh9
	 OZIH/2SJJc8An60ZA3qB06AemJlpRn3qE0hIldQMIveR5FOpyQA8u8NtVxm3+jHQKb
	 ZIR6/5PDzOSoOQ9rfNdotTn6qFvjblvNuBAip+B091FmD2fG07ijLMGLRyGcJCwF7M
	 F0eioAeNeRBymaNwU7QnKVLzgg6Jy9Kkg6kC/bxm0G3R6V0OdCYTZd0D5ASDSWuS9d
	 gv5IYS+rqKdFw==
Date: Wed, 31 Jul 2024 09:57:39 +0100
From: Simon Horman <horms@kernel.org>
To: Liju-clr Chen <liju-clr.chen@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yingshiuan Pan <Yingshiuan.Pan@mediatek.com>,
	Ze-yu Wang <Ze-yu.Wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <PeiLun.Suei@mediatek.com>,
	Chi-shen Yeh <Chi-shen.Yeh@mediatek.com>,
	Kevenny Hsieh <Kevenny.Hsieh@mediatek.com>
Subject: Re: [PATCH v12 11/24] virt: geniezone: Add ioeventfd support
Message-ID: <20240731085739.GO1967603@kernel.org>
References: <20240730082436.9151-1-liju-clr.chen@mediatek.com>
 <20240730082436.9151-12-liju-clr.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730082436.9151-12-liju-clr.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_015747_206022_661687E7 
X-CRM114-Status: GOOD (  12.76  )
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

On Tue, Jul 30, 2024 at 04:24:23PM +0800, Liju-clr Chen wrote:
> From: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> 
> Ioeventfd leverages eventfd to provide asynchronous notification
> mechanism for VMM. VMM can register a mmio address and bind with an
> eventfd. Once a mmio trap occurs on this registered region, its
> corresponding eventfd will be notified.
> 
> Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
> Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>

...

> diff --git a/drivers/virt/geniezone/gzvm_ioeventfd.c b/drivers/virt/geniezone/gzvm_ioeventfd.c

...

> +/**
> + * ioeventfd_check_collision() - Check collison assumes gzvm->ioevent_lock held.

nit: collision

     Likewise elsewhere in this patch.

     Flagged by checkpatch.pl --codespell

> + * @gzvm: Pointer to gzvm.
> + * @p: Pointer to gzvm_ioevent.
> + *
> + * Return:
> + * * true			- collison found
> + * * false			- no collison
> + */

...

