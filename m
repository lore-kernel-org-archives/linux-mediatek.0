Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE9EC001B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Aug 2023 09:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPWKIi3cCAcUYZ79Tqrjq5RSyR+Am87+BzKT/5/LTjE=; b=J6aDZTYtmHfD7KE7uOQ8pnOFsb
	0jkJ4OjN1RByfFFOLbYI8FgQfJMKm9R7VWB73Mjns+WE15QpJlftO1Sqj7ut6WnE59YICwwEquQUQ
	UdTSEv3QSk8cooR+NvrNi9uLE3ElvWiGXmrJgazCqEodBiqLqPISMQTMadN+jGeQ7R43+e4jB/Ji0
	mSzVIlGIb03oI9OycdG5OagGKipF6eRmEwdpIU5s+ZyBYW9BEEteyCl2xLvAJKuTpJUCDR9q8PXEV
	EzpQrdOPLQTTLii/Bn9/Ev9qYx/nMm6egdFq2l/JBUTa86FBjqIfPN0NXrzV/kifS0wlAbx604VWX
	tRKuIJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVqkS-001FBQ-2O;
	Tue, 15 Aug 2023 09:54:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVqkQ-001FAd-03;
	Tue, 15 Aug 2023 09:53:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A9A00653E1;
	Tue, 15 Aug 2023 09:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6926DC433C8;
	Tue, 15 Aug 2023 09:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692093235;
	bh=kvaqJ2sBEkbN7oMgKvzp6aMeCbQ6lN6aEQjyWQJ5X6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uqw5AIwCq5p7sCinwmmp/Lqz+8nGO5myfGcZEaCsclPS+/Dq5OkqZIWvlAsVY8uxR
	 FL5dgh/XWOTklxmPq9FDZW5xT31bE/WIg6siTr5DLREiB2Zv7srizXhQIOcqQiDaS4
	 PCZjYG6f3/OWUWTxkKEwh7oAlcEAZU/xrZ/iMoTlKvu1SjYYeqP4Uf5CwHYCvOgzjK
	 rYulG/3FrqS9u8zCuJPbKQNYtQMWuPv1dS8t0eV05/iK8WzCJTpWThBQjtR4cOKgrU
	 qCM6KGWyF2pkR9NkX9uqoHqsfYuQ4rVzrshHKaBe0jrpTTYMdWS100Oykaz9q5eP8k
	 GMSfRQ3v6Nhuw==
Date: Tue, 15 Aug 2023 10:53:47 +0100
From: Will Deacon <will@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Yi-De Wu <yi-de.wu@mediatek.com>,
	Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mediatek@lists.infradead.org,
	David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Ivan Tseng <ivan.tseng@mediatek.com>,
	Jade Shih <jades.shih@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>,
	Willix Yeh <chi-shen.yeh@mediatek.com>
Subject: Re: [PATCH v5 04/12] virt: geniezone: Add vcpu support
Message-ID: <20230815095346.GA11083@willie-the-truck>
References: <20230727080005.14474-1-yi-de.wu@mediatek.com>
 <20230727080005.14474-5-yi-de.wu@mediatek.com>
 <20230811170054.GB3593414-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811170054.GB3593414-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_025358_118266_FB5DC0E2 
X-CRM114-Status: GOOD (  16.67  )
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

On Fri, Aug 11, 2023 at 11:00:54AM -0600, Rob Herring wrote:
> On Thu, Jul 27, 2023 at 03:59:57PM +0800, Yi-De Wu wrote:
> > From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> > 
> > VMM use this interface to create vcpu instance which is a fd, and this
> > fd will be for any vcpu operations, such as setting vcpu registers and
> > accepts the most important ioctl GZVM_VCPU_RUN which requests GenieZone
> > hypervisor to do context switch to execute VM's vcpu context.
> > 
> > Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> > Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
> > Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
> > Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
> > ---
> >  arch/arm64/geniezone/Makefile           |   2 +-
> >  arch/arm64/geniezone/gzvm_arch_common.h |  20 ++
> >  arch/arm64/geniezone/vcpu.c             |  88 +++++++++
> >  arch/arm64/geniezone/vm.c               |  11 ++
> >  arch/arm64/include/uapi/asm/gzvm_arch.h |  30 +++
> 
> I'm almost certain that the arm64 maintainers will reject putting this 
> here. What is the purpose of the split with drivers/virt/? Do you plan 
> to support another arch in the near future?

Thanks, Rob. You're absolutely right that this doesn't belong in the
architecture code.

Will

