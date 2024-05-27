Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B327C25B7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 03:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u61lcMOa0nVVKq4MRRFDkQPS9r964+b+hKnJgWxCljY=; b=Ygk2yxmPk8Z+kY59Xj1kmhncwW
	POOplF9pAzi40iXUdoA8YbYZzozqDm5n51ukiDpOrQMuCGpvzjoZAwnPtwYxoJiLdf5XhMwnzFS8P
	jZu3gxvzsHJ5EnTYx2PL1iAuE0b1uuu5J4jlLHyy7rlA1NAbI5ZQEkADJXE+x25SAMMVm1DYYGMom
	3BNW12SiDwiBIeW4gctP14CbomJiZ4YNVaQqF9WIBuRnaQSpMWzr7AJTm0OMxtVEPaQe6op5lsy/H
	/hWRWrjFZ9MxQjtn0ZsbJmEUbyKVMYBNLnVukZ8wL7XVKbHnfs+JvlVR0U4W3yaO1N69rWCBrJTcB
	Ys911YFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBQhc-0000000DeXK-3np6;
	Mon, 27 May 2024 03:07:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBQhZ-0000000DeVu-0SnE;
	Mon, 27 May 2024 03:07:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 515EBCE0DA0;
	Mon, 27 May 2024 03:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3F93C4AF08;
	Mon, 27 May 2024 03:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716779226;
	bh=V0pcoxiScDQe0zi5pcugxdyFa3kNMUT0YjglHWD7vvA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sTlhTC7OsK22UDnsIs9n0/tAU9EjpKKUDsg8PQl7qbEvR41N1JDkNDDxYEEcR2nJ0
	 BQveAiPLIg59AY9GnhoZy1Wdwgc8aEv+8BGhDv18l45JgLlySi2VgHp9pAr8CRqDBh
	 9mktd0xh8O4m/02wsj11btazwYnZCMkPdtTFjrXI75ocBslFULWD3D59vy5XTNrS4K
	 LVWI5xacBLKo7TkFc0wdSnaCcYac8N/SQFaiVZacJNohMkb2OchAU1J8l/wIDUmU2m
	 k7fVoEsdOpVnnfouWqnPEH/4WcQEcW93l5cyciuGGHti0vfBqwYy0huealRqI4L672
	 kL4iz1cyMR9vg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E35A3DE4000;
	Mon, 27 May 2024 03:07:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <171677922592.1901.1875168136657939730.git-patchwork-notify@kernel.org>
Date: Mon, 27 May 2024 03:07:05 +0000
References: <20240417103819.990512-1-wmacek@chromium.org>
In-Reply-To: <20240417103819.990512-1-wmacek@chromium.org>
To: Wojciech Macek <wmacek@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_200709_358538_5D284094 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Chun-Kuang Hu <chunkuang.hu@kernel.org>:

On Wed, 17 Apr 2024 10:38:19 +0000 you wrote:
> In case there is no DP device attached to the port the
> transfer function should return IO error, similar to what
> other drivers do.
> In case EAGAIN is returned then any read from /dev/drm_dp_aux
> device ends up in an infinite loop as the upper layers
> constantly repeats the transfer request.
> 
> [...]

Here is the summary with links:
  - [v2] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
    https://git.kernel.org/chrome-platform/c/8431fff9e0f3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



