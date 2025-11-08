Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D2DCCF9F8
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Nov 2025 03:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sB2ioxHCNI5b6MHRv2+Us9SQhASeWWSYUz/U+g9J0Oc=; b=Ex187F+9hZMTT1hXDBbuthc23N
	2pselnUSiSA57LRmJocagkwreb2XCMFDyGPiridaKk5Wzj3KwRjsreJ7uQVL7Bd7ufeAnngK/odXi
	kkExUUDO55tuqgr1ENtQgJSb2U2NZQxf9KTqiohqBE1yfrGuzkRYckf6qvM8Jmpp+8o/EcYOj7mW3
	XlKa8Gc9e+IXAehe4PPjK2iof7lLdB1UG3azY42nLqO9dte8zlEuUQPowP/C525u/o2e+5f1pOHDz
	qJdqEMjE5dfz9T2Cszw4T6fAoYRcZWwf5dniVlAkbb1AVWgCBRfbh74NwU3kmxyt3XXZOai4iaSEp
	Z6Bghoog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHZCD-00000002EMS-3RlV;
	Sat, 08 Nov 2025 03:00:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHZCC-00000002ELZ-1gZB;
	Sat, 08 Nov 2025 03:00:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 894A0601CF;
	Sat,  8 Nov 2025 03:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FB7C116C6;
	Sat,  8 Nov 2025 03:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762570855;
	bh=00lq9mTgEdaXm1TiWcCpC7BbocJlckplKnaVhHwJplM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WrXYuzHz+2VPuTxZOOasO4YmKvVFeGcQqABRgyeUpsFxX6T9r8WvQHxpZmMS7CyQh
	 2TLiKu467MaK6QgEzctbpSOlWVBO6EGWdfkfFVlsBNaFACW8fbN4OlKeQi4ITKSlbn
	 xiZCDO0urPGyDRtNhiI5xB8Q24JdTflW12qzWzFyN4kO1bevBTJnTZMweSjLDDW0yR
	 zbpYtAyu/S3g5YteRfxNhk/dCry4xNSnJAxC1wCWzOndoo/SlaAGKESpUvKH8tdXyr
	 2108EsZJP+FW7HfytpBtcB3avviqe085krqJ4+BiqRlSQnIp2oi6eNZ9aEnD2FpPq9
	 6Gr7wTk2+DeJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCDC3A40FCA;
	Sat,  8 Nov 2025 03:00:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: airoha: Add the capability to consume
 out-of-order DMA tx descriptors
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176257082729.1232193.2974398557983419520.git-patchwork-notify@kernel.org>
Date: Sat, 08 Nov 2025 03:00:27 +0000
References: <20251106-airoha-tx-linked-list-v2-1-0706d4a322bd@kernel.org>
In-Reply-To: <20251106-airoha-tx-linked-list-v2-1-0706d4a322bd@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 xuegang.lu@airoha.com, jacob.e.keller@intel.com
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

On Thu, 06 Nov 2025 13:53:23 +0100 you wrote:
> EN7581 and AN7583 SoCs are capable of DMA mapping non-linear tx skbs on
> non-consecutive DMA descriptors. This feature is useful when multiple
> flows are queued on the same hw tx queue since it allows to fully utilize
> the available tx DMA descriptors and to avoid the starvation of
> high-priority flow we have in the current codebase due to head-of-line
> blocking introduced by low-priority flows.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: airoha: Add the capability to consume out-of-order DMA tx descriptors
    https://git.kernel.org/netdev/net-next/c/3f47e67dff1f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



