Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DD5D3C92A
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2024 16:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xk3cv0eOdnISfDPXATq8EPea6JNn0juO8Fujq5I8JL8=; b=2OxF485Fp9mLiUbynOyXJCjznR
	pYb/Of9/2Zq96YKCsoh0O8Y69VEqIMUIv66zSXCNjfpoPpXl/cLqMMbDME/sH4p2YUzgV597k/NiJ
	zY+vci15GzhPuuU+/J4GcqveZpaPI4oSOXWKSAdIp41zCrsDA8CLi/S/flHz7PUIFztUibK06Hwsa
	Ji56lxZ9+hvA8pHJ5+Vk9z2k7leHM2kQI0Xlkb7ddKdgS49enBVMmvRwqpIFYYiURVP2BZbz4LHPc
	WFgX2/MMPSioIiBMDYrCqrl6+Uy51E7deTn1gvv2jNREvuz7if+NMlxFW4h1425JAD2btk+Jk5E03
	2qZXTg8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2YYb-000000056HF-0Gzh;
	Sun, 20 Oct 2024 16:13:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2YVn-000000055rR-0Cbd;
	Sun, 20 Oct 2024 16:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 638D55C58E1;
	Sun, 20 Oct 2024 16:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DF0C4CEE5;
	Sun, 20 Oct 2024 16:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729440633;
	bh=UUabHuMBj6T5Mw4+gO7s2Bb8IsFaQraBLWnCpJUJ2bk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d5hxtTMNP+Sl0JKcs0vDqDEEtY2wPvgy+1OE6BNPOZCWVzY2iml4L0//pDJOPi/QR
	 S2WMmM226Z8ruDnUb90Ujk7l4JAEBMuH5tcZ6uHRVs1FiMoVAbskf7P45pMCP1gofm
	 c4w1YAj1UCBgmg/R1+bvOBj+RwBxXu1xR3pt+pfzFj1jGmi67/9qCYc9GgJ5/+SOzL
	 Vz5wAegMhp7JOnhxCN6vrS6LCN4c1RQd5TNTPejNRbhkUiw2ZJ/aKRb5RtKlbt9mYa
	 Rw82xy4ULmMa6JIqi0LTwg+7OPadgb8XMZVLyTRJ+sx1STKegvgNaFxNuigyr1JZW4
	 y8OxiYo+SC8gg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE01B3805CC0;
	Sun, 20 Oct 2024 16:10:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Reset BQL stopping the netdevice
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172944063949.3604255.311498943475544885.git-patchwork-notify@kernel.org>
Date: Sun, 20 Oct 2024 16:10:39 +0000
References: <20241017-airoha-en7581-reset-bql-v1-1-08c0c9888de5@kernel.org>
In-Reply-To: <20241017-airoha-en7581-reset-bql-v1-1-08c0c9888de5@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_091035_207333_D2BA06AB 
X-CRM114-Status: UNSURE (   9.00  )
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

This patch was applied to netdev/net-next.git (main)
by Andrew Lunn <andrew@lunn.ch>:

On Thu, 17 Oct 2024 16:01:41 +0200 you wrote:
> Run airoha_qdma_cleanup_tx_queue() in ndo_stop callback in order to
> unmap pending skbs. Moreover, reset BQL txq state stopping the netdevice,
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/airoha_eth.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Reset BQL stopping the netdevice
    https://git.kernel.org/netdev/net-next/c/c9f947769b77

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



