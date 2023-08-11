Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D27EB64DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Aug 2023 17:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZ1Pp/AxMIei8gpVJQZ9B5qABDHFvr6KOwAo55sZhB8=; b=BVSyVO482BwVQuEvF0wQ7a3DpG
	JfdYtbpvxJ8TObhPpQZi/RiaBlTcQ0KWvSm9V6/rWxmtjuU0fooimvzAqVk5LdVE8/DNTFahn7+hL
	KuyAMl/2pGHyTm5sd6XvHcUzbiBO9UE29XYrwHntaG3t6V4p3+id+znnebivrZ8CWvA3SO4KSyShF
	3xOS2i0Gd/we9nMZuT2zUV73eLVgTCLBORg3xIlvNXmbgxkS0+m/+Nz/upSfcePdCLz1zhnG7Njhu
	0/liSSRec2DwPzHxZ25O0z7S005bVaUh4kEVB1YllGgj9fxz0Qbwc2kaRfYEgDYiqvA/EqHt+qI2z
	6pw3Xd3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUVVZ-00BBJE-00;
	Fri, 11 Aug 2023 17:01:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUVVS-00BBGD-1b;
	Fri, 11 Aug 2023 17:00:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 02451645D4;
	Fri, 11 Aug 2023 17:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691AFC433C9;
	Fri, 11 Aug 2023 17:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691773257;
	bh=l1aOISgHLyF1tS0E6wyiBR8uld1+gi5jofN8WS08bZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bIZh4+l26+bumdjG+bZVToiZ3djsVl+GVTghFsSnjne6ExjsxrYrltO5Q9rsFIMfd
	 YeEVvJjZ7VWTWcFvjz5ZWsXfWmyZwO9/S2Cos7G1qdSmXXfUXr4ezYXmclymHemksB
	 5RFlZYC17AaJ2AokgHCtO+4iWICrLv85UxAsiDY+VMnBlMn7JdtD8KyceES26UHWtB
	 3rycLa8T0et++fte67RueG4SLZA1Sy7pwfaRsRPopgKwSgl9vdhlKBP+mh+LoGmPNR
	 0Ng37vhFG53uXvjrDeO0XHuxojFC+5AOpF4IWCoOJU6YnkDHvmVCN7s8T4TeaCiaFz
	 UEc566dSW2TyQ==
Received: (nullmailer pid 3606791 invoked by uid 1000);
	Fri, 11 Aug 2023 17:00:54 -0000
Date: Fri, 11 Aug 2023 11:00:54 -0600
From: Rob Herring <robh@kernel.org>
To: Yi-De Wu <yi-de.wu@mediatek.com>
Cc: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang <ze-yu.wang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, linux-mediatek@lists.infradead.org, David Bradil <dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, Ivan Tseng <ivan.tseng@mediatek.com>, Jade Shih <jades.shih@mediatek.com>, My Chuang <my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>, PeiLun Suei <peilun.suei@mediatek.com>, Liju Chen <liju-clr.chen@mediatek.com>, Willix Yeh <chi-shen.yeh@mediatek.com>
Subject: Re: [PATCH v5 04/12] virt: geniezone: Add vcpu support
Message-ID: <20230811170054.GB3593414-robh@kernel.org>
References: <20230727080005.14474-1-yi-de.wu@mediatek.com>
 <20230727080005.14474-5-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727080005.14474-5-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_100058_616533_27A38C76 
X-CRM114-Status: GOOD (  16.03  )
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

On Thu, Jul 27, 2023 at 03:59:57PM +0800, Yi-De Wu wrote:
> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> 
> VMM use this interface to create vcpu instance which is a fd, and this
> fd will be for any vcpu operations, such as setting vcpu registers and
> accepts the most important ioctl GZVM_VCPU_RUN which requests GenieZone
> hypervisor to do context switch to execute VM's vcpu context.
> 
> Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
> Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
> ---
>  arch/arm64/geniezone/Makefile           |   2 +-
>  arch/arm64/geniezone/gzvm_arch_common.h |  20 ++
>  arch/arm64/geniezone/vcpu.c             |  88 +++++++++
>  arch/arm64/geniezone/vm.c               |  11 ++
>  arch/arm64/include/uapi/asm/gzvm_arch.h |  30 +++

I'm almost certain that the arm64 maintainers will reject putting this 
here. What is the purpose of the split with drivers/virt/? Do you plan 
to support another arch in the near future?

Yes, there's KVM stuff in arch/arm64, but that is multi-arch.

>  drivers/virt/geniezone/Makefile         |   3 +-
>  drivers/virt/geniezone/gzvm_vcpu.c      | 250 ++++++++++++++++++++++++
>  drivers/virt/geniezone/gzvm_vm.c        |   5 +
>  include/linux/gzvm_drv.h                |  21 ++
>  include/uapi/linux/gzvm.h               | 136 +++++++++++++
>  10 files changed, 564 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/geniezone/vcpu.c
>  create mode 100644 drivers/virt/geniezone/gzvm_vcpu.c

