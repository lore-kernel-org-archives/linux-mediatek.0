Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D016DC25B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 02:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8fm9PZXANvwgQIf6JWh5hVXfoW1qTvT2oubOVPcjGY=; b=c6pxZ5QmHT5NLp4xAfL6esNh3p
	vg0NrDnGmjYlHUlw8XKAslloJUhhs0KNPnvYMQl0M60QVYxTSCPz0IlxDtAMTPgMF/151sCPS7FIJ
	1+fqEctUs8DN3SMP000ZveJ+j2b4jrwzWcWtc4UxKTSVHEKGfZFwzZtBzF+7o7oegTiDH+JIjXCIa
	sUmG6AS09OhdddgoeNJYRmdG07FZLpXA8dGB781sfwLtjIC2NmU9u5S6RAoJZI4PEdmKTDr6sgp0q
	s/HAtVykjB6Qie8mADn4lji//k1oYW7Ppw40zy0A9qyqt/mcoF43Mt76eX2R9ERM9543+pPdq2YQo
	hfzhFVHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBQW7-0000000Dcoy-2Sm0;
	Mon, 27 May 2024 02:55:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBQW3-0000000Dcn5-2xFi;
	Mon, 27 May 2024 02:55:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1DABCCE0D55;
	Mon, 27 May 2024 02:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 297E9C32789;
	Mon, 27 May 2024 02:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778511;
	bh=39qO4ArV4WMkI/+MoaGYnazaqANez7q1UTHks9np4s8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q0dezIaZxlrFzGX+kwhj2Y2qgdgxgguKN499Jh6AowH8IHeJppEuw4g7xqZYAYgo4
	 G6jUAAyLWCEVkfsD1mDJANpVjyLnmRrtZ1eU3E9kpfsI0eX1WgAGhz3mESO/wstYxW
	 KlXPs9J3jsrQJzoXpOpH/QHieyH1dbeIGfY1v333StXkq31ugdlHGSzYvAQAkP4yg4
	 RFj9WNzlbshlmUt3F7cb2b24HyGrIagt7+DfXiVHUgmWb5CUxpW9qjgd4L1Gb/FQo6
	 z6/h2XYMLL8Ql4Xq45fK8WJpGmfFeZVXW/qU8OADaNbi7VhNG/thDKBeU77W2mZxyF
	 PJefczsOXHIPQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 13421CF21F9;
	Mon, 27 May 2024 02:55:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <171677851107.1901.3212994325646956148.git-patchwork-notify@kernel.org>
Date: Mon, 27 May 2024 02:55:11 +0000
References: <20240417103819.990512-1-wmacek@chromium.org>
In-Reply-To: <20240417103819.990512-1-wmacek@chromium.org>
To: Wojciech Macek <wmacek@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_195515_966185_A60665D2 
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

This patch was applied to chrome-platform/linux.git (for-kernelci)
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



