Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7ADFF8864
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2026 00:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7GaXehFBiQt93y2k7obbBhf1UA3eDA9G8SqRdljSX0=; b=aBN6wIwSKJuroOf5ssSchKFePu
	M2Ld2loujQHx7qAERIE8Fode6bsNNSs7shr0dvOnmD6evSSuK4JA8w3gDNoVxNTpCRx8EgFRhGN+C
	bX7wFJApRvTB1UdCMDY4H6w5kYq/iN1RXVtlvluSDOeqWxHHPTvzpYJW1RsyjQhQ9CmdjTWyhuNgw
	m4Cm/hYJhsWVG0v6SixBKpe789NZxHi/I8ik+ZZDGjz8Xb83M0w6p4JDf8zRE/vxvI3rYhGl08CPW
	cY5RI6xF2QKYc8AiRzh+WinHlvu9hR9Mc3G+SiI/KGA6WYW7/dDIP7ISfYWuYhtwT/i9XVv12wqlM
	MCkyyHXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWfF-00000000MAy-10Yz;
	Tue, 28 Apr 2026 00:51:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWfD-00000000MAO-1s9Q;
	Tue, 28 Apr 2026 00:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C2DC60121;
	Tue, 28 Apr 2026 00:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B81C19425;
	Tue, 28 Apr 2026 00:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777337458;
	bh=4u3fOBLkg7bwwRHn/jMjMp3yIXtsrAn3Pp1vO36pLtg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YN5CLtgK8FNnYdReLhkkdpjhySnXvwSBYBGBI/n45z8BnDJwe18rd6OEsCQAsT5Ce
	 ZnoqHNzwuYkZzNEs/208yFmj138ZMFA3194VEmfhqkuwBG4sL6xCnjFzg0Of2iWrWP
	 DPZQ+/s8lobpFMJ/onVu7p1AvdiSTegiAFdPrraDZFOrK+Q6jlxwReuPIFcFwpVQgr
	 8rILaZuRs0bCrW+Op1NNqM8bx879M/EM5So53N1obvTnrlMmoCJqKsAHTfNx+bdLy/
	 JcKWHIO4NQ0SW/sJm9Lv8kQwdjStdvrJl1gQLtiWXgsh4bkPZBl4ZKPeigrNxqnfr+
	 6I61tvo9dFS0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E5338119DB;
	Tue, 28 Apr 2026 00:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Do not read uninitialized fragment
 address in airoha_dev_xmit()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177733741530.177472.9248284506411567966.git-patchwork-notify@kernel.org>
Date: Tue, 28 Apr 2026 00:50:15 +0000
References: <20260424-airoha-xmit-fix-read-frag-v1-1-fdc0a83c79e8@kernel.org>
In-Reply-To: <20260424-airoha-xmit-fix-read-frag-v1-1-fdc0a83c79e8@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 24 Apr 2026 11:00:28 +0200 you wrote:
> The transmit loop in airoha_dev_xmit() reads fragment address and length
> during its final iteration, when the loop index equals
> skb_shinfo(skb)->nr_frags, at which point the fragment data is
> uninitialized. While these values are never consumed, the read itself is
> unsafe and may trigger a page fault. Fix this by avoiding the fragment
> read on the last iteration.
> Additionally, move the skb pointer from the first to the last used packet
> descriptor, so that airoha_qdma_tx_napi_poll() defers freeing the skb
> until the final descriptor is processed.
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Do not read uninitialized fragment address in airoha_dev_xmit()
    https://git.kernel.org/netdev/net/c/bde34e84edc8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



