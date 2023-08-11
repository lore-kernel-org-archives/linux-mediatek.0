Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22F2C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Aug 2023 16:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJb1lPZss5n9QWVriHrKfiwlMHXSneZ9uZ4y2QLpuyM=; b=oy/E6VZml6jcm/WptzDx3AQjs6
	KZxSFC7QXJHfeMl03CpMTXGnsDgsoGgSFg+9KCx9qFvC/krhLv93be4If9TZzygaUm53bmyV2C4vi
	8VerQvaQ11uYejSCenVmaRlsJaSq4ixyGYxMUgIYGEPQ/Fb0MRgquCgjU94yg5ECMan1a6X7P3Pbg
	qCAd03ZOWK890uTDkOJ8QUDs16mIFa7UMzyBw333MjIEagAltuGY7u+hCZbM4SpucoxYk28i6RQzV
	qAKZ3GRg3V0ap/1VeuO3Tiqiaf3Cw6y7O8VzlXb7NrK1Qj34bqZRDwiHzL4jITNr6P4vu5Ym85pCD
	A3r5hpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUVND-00BA9l-2J;
	Fri, 11 Aug 2023 16:52:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUVNA-00BA6u-1J;
	Fri, 11 Aug 2023 16:52:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C6C82665C0;
	Fri, 11 Aug 2023 16:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF7EC433C8;
	Fri, 11 Aug 2023 16:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691772743;
	bh=vdQ+VbOk0WXAqkeu5hhMiFqWiP0BvXxpd1MCJU3hfYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b/BNsIRPuQtwLLYF4Dd+iwrfrqPmcNqllqq3xN06Uvfm0viioyARouTP43LNjeGB8
	 UhOuXInH4w/7nD/y/azYPSBVxxeOOHAp6w3kqJkeLZkGYko6s+OKGTq5OEZ4E8gmkk
	 31iWq0SLarEWFY4DX7jv8FYVXY+txo3p/7c0sRdL6/SYtlY5bvgswHwrLfVbGPtbKS
	 Y1uyWu8IQmEtry2UhEYAObF8fsZIl4sPDp4k/KJ+OFgVTbOSEdd3Wwpq75h8Xby6Wi
	 CrVyMT6oh39QKpTB1WqKnWoSdh+zJTozsRegdCFmnFqpUCKh4A/0KpDXz8JtvM5AwP
	 XABhDoVjvQoJQ==
Received: (nullmailer pid 3596930 invoked by uid 1000);
	Fri, 11 Aug 2023 16:52:19 -0000
Date: Fri, 11 Aug 2023 10:52:19 -0600
From: Rob Herring <robh@kernel.org>
To: Yi-De Wu <yi-de.wu@mediatek.com>
Cc: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang <ze-yu.wang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, linux-mediatek@lists.infradead.org, David Bradil <dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, Ivan Tseng <ivan.tseng@mediatek.com>, Jade Shih <jades.shih@mediatek.com>, My Chuang <my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>, PeiLun Suei <peilun.suei@mediatek.com>, Liju Chen <liju-clr.chen@mediatek.com>, Willix Yeh <chi-shen.yeh@mediatek.com>
Subject: Re: [PATCH v5 00/12] GenieZone hypervisor drivers
Message-ID: <20230811165219.GA3593414-robh@kernel.org>
References: <20230727080005.14474-1-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727080005.14474-1-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_095224_484893_3FECED2C 
X-CRM114-Status: GOOD (  13.46  )
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

On Thu, Jul 27, 2023 at 03:59:53PM +0800, Yi-De Wu wrote:
> This series is based on linux-next, tag: next-20230726.
> 
> GenieZone hypervisor(gzvm) is a type-1 hypervisor that supports various virtual
> machine types and provides security features such as TEE-like scenarios and
> secure boot. It can create guest VMs for security use cases and has
> virtualization capabilities for both platform and interrupt. Although the
> hypervisor can be booted independently, it requires the assistance of GenieZone
> hypervisor kernel driver(gzvm-ko) to leverage the ability of Linux kernel for
> vCPU scheduling, memory management, inter-VM communication and virtio backend
> support.
> 
> Changes in v5:
> - Add dt solution back for device initialization

Why? It's a software interface that you define and control. Make that 
interface discoverable.

Rob

