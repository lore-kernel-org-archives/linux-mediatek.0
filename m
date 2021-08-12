Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B01C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 10:00:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10BBC60FC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 10:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10BBC60FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0t20dXFU9jb/zFbd6LgSLnZGYWSX5c437r7YRmcwA0=; b=fx3Qy9UhrfKbGE
	+3Zimu/sfxE00SkF1m+7vAM8hQF82n7GqHsSAQN0ryeSJgRXJNNWSqMCquIl7s/kYyYxWWGZfaDY+
	L26BIqVE5drOIJfydEiHwIVCTrAAw6pj+IH5+BIa4HjO5MxSFZ0R8X3k9+KWPDFS4ia1tl+/2ACcV
	mTypvsS8HQY64XHUkPI6BgDNwYWcMgVNv6I9UpdHzc5u567+ybNpS6znQdjtvtTXB99YFvaerbnEO
	d4sMNOC0dwvbjwlTug4bqIL3XUO1RbT1Kco75QUsDnreaYqhpOf5iNE5fSuhIMe8SPT45sKZOpk1/
	BhsiT2rApH082GwWUFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE7Vf-009aY8-UX; Thu, 12 Aug 2021 10:00:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE7VQ-009aSY-MG; Thu, 12 Aug 2021 10:00:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id E3572610A8;
 Thu, 12 Aug 2021 10:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628762406;
 bh=g7liFI0w1AXCBy0RQJDInux6r5n7YoWxWULCoNMnGIw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nBZdm7g3X6RjWnit40kXze+1Wn0nfE9lYi6ifU+39Ft4ANZbY2Mk60YkzZv8BzHR2
 mpi1dVrYlojj48TeYqtKkIJzOMc2qwgPmt5XEY86PVnefeBRO9FTnn4fK1Ua4A9cZk
 pRd+KQTc9NWtlCLPfIuc4Aii7SWuvF889X7tD6NUe0gRngX5H6ex7fj/6COahnAQ03
 uw9f+ZoSrTbv/VXIGhZdPvEWVHA8yL4BesQLIPy81tWJs1ZeCKlwlRNP0bIygYcqgA
 CigfB04W3Y6GH1B/i1SZ7Pa04bGQpE65tdlaZFMN30rHkfBP4wix40/yqGjNManAvo
 enXMnHKM0RamA==
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: dsa: mt7530: fix VLAN traffic leaks again
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162876240687.6902.14605902617499288116.git-patchwork-notify@kernel.org>
Date: Thu, 12 Aug 2021 10:00:06 +0000
References: <20210811095043.1700061-1-dqfext@gmail.com>
In-Reply-To: <20210811095043.1700061-1-dqfext@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: sean.wang@mediatek.com, Landen.Chao@mediatek.com, andrew@lunn.ch,
 vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_030008_791888_EBD528D7 
X-CRM114-Status: GOOD (  10.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 11 Aug 2021 17:50:43 +0800 you wrote:
> When a port leaves a VLAN-aware bridge, the current code does not clear
> other ports' matrix field bit. If the bridge is later set to VLAN-unaware
> mode, traffic in the bridge may leak to that port.
> 
> Remove the VLAN filtering check in mt7530_port_bridge_leave.
> 
> Fixes: 474a2ddaa192 ("net: dsa: mt7530: fix VLAN traffic leaks")
> Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: dsa: mt7530: fix VLAN traffic leaks again
    https://git.kernel.org/netdev/net-next/c/7428022b50d0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
