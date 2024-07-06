Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E685EC3271E
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 00:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roX+X7/TxwiwLFnOPxzzBEkRTwALTzCzrG1XJYADpFQ=; b=2BVe2iP9gjtwPLkUVSY6o29Wki
	WOxM0gpbwNxrmrMpOA9YRna4gg/5i+EXop6JQVo8NQ2OqGM6pViueiDRVBxvMRYOiFxB6df/D3v2i
	qrj+NpNYAWZwAJYEEGBMW/moVGLTKSssGpEsLMyHoh28PlJgTN2DxYgSAc78Q992aJq7H5Z6fyMP0
	ACuCj528KKAbYUPMiP4DK4h92kg37/2R6FAyfZmEUb0zEZGQ1CAhkKtCTh5zBRf16y2hHmrzTci0v
	kyMfRPW60n0NvsN4QStlttRNmMGFBRShS3GhJaqcvv/xmDlBDwyyKbGd5PtLFFMCYjLbUH8TE89Ls
	S+HbYuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPsrA-0000000H1Qx-01YP;
	Sat, 06 Jul 2024 00:00:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPsqu-0000000H1OI-3qpc;
	Sat, 06 Jul 2024 00:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D91EC62C96;
	Sat,  6 Jul 2024 00:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 799C4C4AF0A;
	Sat,  6 Jul 2024 00:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720224031;
	bh=WhMcksiqGoZDH0KM2bnh5KtXmtQWYKWu4lTqKhd6JHY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iTp+PwrWdcFQ7z87SyPZ0O05b6n2/niJM5tt1ubEKT1f1iMrfb1hfcKk6bY8Akexu
	 fqWaqNH15R3nAWgx+r19RyacXf8bBk2aEFKKCAmbakSsHsKkRIlLfTDpR+Qz/Qb2XC
	 cs3QDye+1ZLKSqX+Sjh2wYgCIRkg4V42M3ds82KInjn1A1sPpHJW3e30Uxld8Qktrx
	 /driQAndvMa52c+00dB3sANciDkoBkqyD35VaeKGOlKgzKAElkF9KgAKqsC30055lV
	 Z90rcW287YEbTQLe4iCzGz3kusZWkNz2PJJdS2g16OpMTlCZuJltwDe+NkqInkKE+o
	 QwAfzYK/GpAUw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 630C0C43446;
	Sat,  6 Jul 2024 00:00:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: mediatek: Allow gaps in MAC
 allocation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172022403140.7894.3886257470983936157.git-patchwork-notify@kernel.org>
Date: Sat, 06 Jul 2024 00:00:31 +0000
References: <379ae584cea112db60f4ada79c7e5ba4f3364a64.1719862038.git.daniel@makrotopia.org>
In-Reply-To: <379ae584cea112db60f4ada79c7e5ba4f3364a64.1719862038.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, eladwf@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_170033_048588_8BAF1CFB 
X-CRM114-Status: GOOD (  10.64  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 1 Jul 2024 20:28:14 +0100 you wrote:
> Some devices with MediaTek SoCs don't use the first but only the second
> MAC in the chip. Especially with MT7981 which got a built-in 1GE PHY
> connected to the second MAC this is quite common.
> Make sure to reset and enable PSE also in those cases by skipping gaps
> using 'continue' instead of aborting the loop using 'break'.
> 
> Fixes: dee4dd10c79a ("net: ethernet: mtk_eth_soc: ppe: add support for multiple PPEs")
> Suggested-by: Elad Yifee <eladwf@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: mediatek: Allow gaps in MAC allocation
    https://git.kernel.org/netdev/net-next/c/3b2aef99221d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



