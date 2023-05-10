Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720C1C7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 08:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HM2dNyfVg6eIvWTD0Q6RtEpb/hYLmR8nli54H4zXOqc=; b=QryPNdG9SO6XJfSsMAWqnsTvbL
	HR0Lwco5qVirsucBvoINa/eKOM7Qf+kwqXdPpRDsqtbMpLnNOIIZtlxAgr/N0rGlYnxDlpuyCuaUn
	tmRbq7kwMHzvxuHGwWHLTWUkOsG1Ou3E2bvf3zTBzCcUDD8Qcman37wBmw1Q7tkrymGcYtUbaJoZZ
	15taXss7zI1NxLV6mN5Fp+cXEqYEFgPStfiYKC5KzIwYTn46yIT1hYoYbBBMjVWnamYOwQr96TZdF
	fK9oNAl2+DYlE15rhDn5t3CbsUuQftP+KUo6enMXMOVN8Xr0wOk1cEv3hZGRzs+lWy3QDhe9E3jQu
	vFir5V5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwfDQ-005X2w-2p;
	Wed, 10 May 2023 08:30:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwfDN-005X28-1X;
	Wed, 10 May 2023 08:30:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 93B7E646D8;
	Wed, 10 May 2023 08:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22D93C4339C;
	Wed, 10 May 2023 08:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683707423;
	bh=AN+Eo+qzhyw47/MyXdApQCMAYN3iMem6tBDKDVm5ntE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=b8T6Nh8ELnyMMcbsAIKZbbujBuDPDMFknIFXWChTjwVxuS0RKXujkLgSeDxjMU6ty
	 PxcJ3hwdhG7odmGe7GH0SQ9w94dK8rLzFSR7WtLAsACrEcLlE/28y82NdQLtB1I+Of
	 LaJ7Za4bsQqd5u0z+sKOudyFD8NwJfBMsmBX3/qc1PLvElfL+bYUMsQAWuf3pOY7Gv
	 ISQvP7r45zA1pVvBP63ntWISnPJ8hkCIG0lfjFY0aqQaxnrKpBApCxyd99ZDvyBN5i
	 Kh5O4/NfgBlGznsyFyFsNv1BJKRLivINOERR4bHjYFD2vj0x5Z2F2QX0G/Kp0vfGOh
	 6avUcX/C1/rBQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 053A1E270C4;
	Wed, 10 May 2023 08:30:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix NULL pointer dereference
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168370742301.8895.5605086676316626500.git-patchwork-notify@kernel.org>
Date: Wed, 10 May 2023 08:30:23 +0000
References: <ZFmfxpsd8Fiqc7K_@pidgin.makrotopia.org>
In-Reply-To: <ZFmfxpsd8Fiqc7K_@pidgin.makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_013025_554714_379754CE 
X-CRM114-Status: GOOD (  11.52  )
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

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 9 May 2023 03:20:06 +0200 you wrote:
> Check for NULL pointer to avoid kernel crashing in case of missing WO
> firmware in case only a single WEDv2 device has been initialized, e.g. on
> MT7981 which can connect just one wireless frontend.
> 
> Fixes: 86ce0d09e424 ("net: ethernet: mtk_eth_soc: use WO firmware for MT7981")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: fix NULL pointer dereference
    https://git.kernel.org/netdev/net/c/7c83e28f1083

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



