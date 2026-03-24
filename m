Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A51F532C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 00:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Wi1e8pFKZQtE5ZobXRDfaYjf6ZMx2oDA5/pfPnLM9I=; b=CaV+iSYJIU93eHAoQ0Dixxdp6c
	t77fU+gYeHZa5fWv8WVyII/pNtiv5lRpTyEkKgIP+DK9p1bPpjV53xAU5vw54OwWfFTYtIeCBWg4o
	WbWF3tDjHa+YseqERWLHQaqb6/HFw9DJ9LnqHAxMrAIPd6eMhOcikBiRfVS4pJZ1+LAAi4Oibmmwq
	eCcPNB71Og2cwbepvpYuxzUF5Bzf3QPmkPGC3N4JvYiQWogq1IS0pYgR63tTGiTHe3D48j6MpSk7+
	K5IOeUyyIH6XUZGoP4+NRFemrVxCpJSQQYVmuJaZLCiR3YCrX47kn/VxfwASo4ehp/Hlc19QP3s24
	MarXbmZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pyS-00000000GNt-0uDb;
	Tue, 24 Mar 2026 00:50:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pyO-00000000GMn-3e0S;
	Tue, 24 Mar 2026 00:50:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 35FAE44504;
	Tue, 24 Mar 2026 00:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14178C2BCB3;
	Tue, 24 Mar 2026 00:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774313420;
	bh=JKi37m02ysGGaDX22rah6C5f382uv4n68JZXkVg1/pw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EA1lPRk7femanXt0GavT4f4tPdaMa2ueHPgOVGMETEsdhpOojt20I3hrOri+XQedb
	 4K3UB+rQ3tDaxkHAe7Rv5nY70rL+aPqNR2IpSr82CgVpKNd3NgjAoCpyoiBx+zHhFh
	 A7DEfb/50zGe8OdpPck6Cp8clL8q2WnVmc4ht4RZwtT5nhl3q1nti85kI7X+i6lPdm
	 LXSBBpAsurBm/L8aQueHdae8FRc0uYQOk3tnJ4qq8SfLz8IXouTAjPIrILjofv37uF
	 9JZNehWFeJF/ndP2kZK9XMf4c1Hqx56/dSw7egIV8ezieQKCjXFZWAiEWTjmnv44BX
	 GVVTHo79shKdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D04F3808200;
	Tue, 24 Mar 2026 00:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: add RCU lock around
 dev_fill_forward_path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177431340803.395707.9019086790298315376.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 00:50:08 +0000
References: <20260320094315.525126-1-dqfext@gmail.com>
In-Reply-To: <20260320094315.525126-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pablo@netfilter.org,
 horms@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_175020_933315_06CCC399 
X-CRM114-Status: UNSURE (   8.80  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 20 Mar 2026 17:43:15 +0800 you wrote:
> Since 0417adf367a0 ("ppp: fix race conditions in ppp_fill_forward_path")
> dev_fill_forward_path() should be called with RCU read lock held. This
> fix was applied to net, while the Airoha flowtable commit was applied to
> net-next, so it hadn't been an issue until net was merged into net-next.
> 
> Fixes: a8bdd935d1dd ("net: airoha: Add wlan flowtable TX offload")
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: add RCU lock around dev_fill_forward_path
    https://git.kernel.org/netdev/net/c/1065913dedfd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



