Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD597C369AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Apr 2025 11:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4ZxXn9N7BVkWasocQAyjBn49uv3gVDKltvSRDAFPmg=; b=FiiD4xMECxh4wzXjIA8525GV49
	wAQF03hrxR5zIYQ1wiQaQm+0Z7WgftiLnz8J3jTzBo102dlPSt7rqxugK2TJem6ZGxvZ73LyzvMId
	CzcRZpc9bftW8oOyPiZ67EblsVxgmHdtNtuIjCjZrbdkYHJmP4R+q3R8RHSRbrwIARqo3578J9uR6
	sAo/jeHXm/i93y04KCocysoE3pnvfrE1XTYlhp9s4qkMS62rWza8ADcK/XdABjPBpmsPLXmiUzymk
	o71DnfCz4t+I21jXJzoWjSxESfxej88oE95eTM1BacTGIjSMHJtpoAIpwDHPPZCTtzMAAVARZ9yvv
	OoXWnaeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ehV-00000005bF2-3SRd;
	Tue, 15 Apr 2025 11:43:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4e1E-00000005Rb0-1RwX;
	Tue, 15 Apr 2025 10:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0D8249F2C;
	Tue, 15 Apr 2025 10:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D498C4CEDD;
	Tue, 15 Apr 2025 10:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744714795;
	bh=/SwxoZm7KffQwQcm64rmu15PgqiClZfE4G1P786RlWg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S+8TH31bbgYVT+o+w43u5OJE1Ev1z6n0jcqfKDrcz7QSnZZM781T08zwJSxECRc58
	 C/2MIXTZu7sxzHx1ZFtQKAApiUxh6J9y9UJnLD+cPPY+ZHmD8CgaTIAxRbO4OLCmd4
	 YxEARDQzKrVOcmRUXXchqttfgbFygQp8KR6GmpABkN7+BJC4OHsYvGD6hn4XbOBmci
	 KZngaaOQO4+8FkCOeIkpbvrgqaf5omF2ulENTVc4MNm0asafOYxnth623cmqZZUp4K
	 eaJcu/n0fp7NLZCpz+kNiwc4FBKXBeBe0IGXFcB1ZhSs5yB6BOlPlVxND726KnJKPO
	 hWe1hITDMb/Kw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE8A03822D55;
	Tue, 15 Apr 2025 11:00:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next PATCH 0/6] net: dsa: mt7530: modernize MIB handling + fix
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174471483350.2586745.804728746309953080.git-patchwork-notify@kernel.org>
Date: Tue, 15 Apr 2025 11:00:33 +0000
References: <20250410163022.3695-1-ansuelsmth@gmail.com>
In-Reply-To: <20250410163022.3695-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, dqfext@gmail.com,
 sean.wang@mediatek.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_035956_400107_556A8FB3 
X-CRM114-Status: UNSURE (   8.71  )
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 10 Apr 2025 18:30:08 +0200 you wrote:
> This small series modernize MIB handling for MT7530 and also
> implement .get_stats64.
> 
> It was reported that kernel and Switch MIB desync in scenario where
> a packet is forwarded from a port to another. In such case, the
> forwarding is offloaded and the kernel is not aware of the
> transmitted packet. To handle this, read the counter directly
> from Switch registers.
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] net: dsa: mt7530: generalize read port stats logic
    https://git.kernel.org/netdev/net-next/c/ee6a2db281a3
  - [net-next,2/6] net: dsa: mt7530: move pkt size and rx err MIB counter to rmon stats API
    https://git.kernel.org/netdev/net-next/c/33bc7af2b281
  - [net-next,3/6] net: dsa: mt7530: move pause MIB counter to eth_ctrl stats API
    https://git.kernel.org/netdev/net-next/c/e12989ab719c
  - [net-next,4/6] net: dsa: mt7530: move pkt stats and err MIB counter to eth_mac stats API
    https://git.kernel.org/netdev/net-next/c/dcf9eb6d33a2
  - [net-next,5/6] net: dsa: mt7530: move remaining MIB counter to define
    https://git.kernel.org/netdev/net-next/c/c3b904c6dd81
  - [net-next,6/6] net: dsa: mt7530: implement .get_stats64
    https://git.kernel.org/netdev/net-next/c/88c810f35ed5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



