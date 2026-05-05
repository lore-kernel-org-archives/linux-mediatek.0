Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684D8CD342C
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 02:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZ9C1cGKi3QolnoyKB7mQU4uVgu69LgZP4fkUy44Jp4=; b=ZMaGnEv+Obc/Kg2nh2hnqzpYni
	JjBrK1NZ/ExBsDLzQMepD3zeAl52U+T3ZfuZRxQ5wJGD9ASZbva9f8EVUvri9gIVTOP/1JZBDaopg
	4Yn6z0ijhPG6vhpppqQPvWaEAljtzVr7s7wU7+r4hRLknu82ldWRFP1rSDOzaZQ1C72RLcuvRsu9U
	GtpjXs4bQWsEIYv9GDo6Sbz8g+iQhuvoa8XSpxm71y3+E/4dzfaNvJGvwCXfZYJgwFwjWYfCYO9q9
	5iuQFFaGnOxfp4bpPAxoKIpVhfwIHH8Sk8jGF/kiSLuVYGqz1I8+zjf82KTG45kNJLV1ncBI5PzJm
	fpAPaT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK5ia-0000000Evr4-1ODo;
	Tue, 05 May 2026 02:41:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK5iY-0000000Evps-1oiA;
	Tue, 05 May 2026 02:41:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 584826012A;
	Tue,  5 May 2026 02:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06164C2BCB8;
	Tue,  5 May 2026 02:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777948861;
	bh=ddU8USgzjzQyVZN71U7F/arM8/K2SIdvmClFGkdxcMk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VQJeyo6k6QXy5XPxqDOOZW240PDY8mh5WHJ/6vKUobp8ijj4r2E1sp6EhiZd+2SFn
	 pDHsljLFMHZrIVN9af0K2seKULF8Rp9tPuDlVnIa8OTgG6JnbMEXnpW/vowQtc2YTU
	 RCQ6BbIp2r3UxOJ/jTIxn4g4cAS/NiBdw5m3Rmu6vRKuQcJmKJZNwC6agaoSwCvZao
	 juFbYlaJKSsxOBlB8skgAQ9IoT+SHLmVlwU7bN4pxGlx4AH8/o/tMrTU3CkFr+tWkM
	 QN8G07wjzqp231nBUYTtfsovTMCyWQpXX2X1M2NNAWwpRiNTaLyiLI0AiL+bWCCPsK
	 +rdyRFB26lSrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D3039301A2;
	Tue,  5 May 2026 02:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v6] net: dsa: mt7530: fix .get_stats64 sleeping in
 atomic
 context
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177794881154.1397274.8560598975981620800.git-patchwork-notify@kernel.org>
Date: Tue, 05 May 2026 02:40:11 +0000
References: <6940b913da2c29156f0feff74b678d3c526ee84c.1777719253.git.daniel@makrotopia.org>
In-Reply-To: <6940b913da2c29156f0feff74b678d3c526ee84c.1777719253.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: chester.a.unal@arinc9.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux@armlinux.org.uk, ansuelsmth@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
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

On Sat, 2 May 2026 11:55:02 +0100 you wrote:
> The .get_stats64 callback runs in atomic context, but on
> MDIO-connected switches every register read acquires the MDIO bus
> mutex, which can sleep:
> [   12.645973] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:609
> [   12.654442] in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 759, name: grep
> [   12.663377] preempt_count: 0, expected: 0
> [   12.667410] RCU nest depth: 1, expected: 0
> [   12.671511] INFO: lockdep is turned off.
> [   12.675441] CPU: 0 UID: 0 PID: 759 Comm: grep Tainted: G S      W           7.0.0+ #0 PREEMPT
> [   12.675453] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN
> [   12.675456] Hardware name: Bananapi BPI-R64 (DT)
> [   12.675459] Call trace:
> [   12.675462]  show_stack+0x14/0x1c (C)
> [   12.675477]  dump_stack_lvl+0x68/0x8c
> [   12.675487]  dump_stack+0x14/0x1c
> [   12.675495]  __might_resched+0x14c/0x220
> [   12.675504]  __might_sleep+0x44/0x80
> [   12.675511]  __mutex_lock+0x50/0xb10
> [   12.675523]  mutex_lock_nested+0x20/0x30
> [   12.675532]  mt7530_get_stats64+0x40/0x2ac
> [   12.675542]  dsa_user_get_stats64+0x2c/0x40
> [   12.675553]  dev_get_stats+0x44/0x1e0
> [   12.675564]  dev_seq_printf_stats+0x24/0xe0
> [   12.675575]  dev_seq_show+0x14/0x3c
> [   12.675583]  seq_read_iter+0x37c/0x480
> [   12.675595]  seq_read+0xd0/0xec
> [   12.675605]  proc_reg_read+0x94/0xe4
> [   12.675615]  vfs_read+0x98/0x29c
> [   12.675625]  ksys_read+0x54/0xdc
> [   12.675633]  __arm64_sys_read+0x18/0x20
> [   12.675642]  invoke_syscall.constprop.0+0x54/0xec
> [   12.675653]  do_el0_svc+0x3c/0xb4
> [   12.675662]  el0_svc+0x38/0x200
> [   12.675670]  el0t_64_sync_handler+0x98/0xdc
> [   12.675679]  el0t_64_sync+0x158/0x15c
> 
> [...]

Here is the summary with links:
  - [net,v6] net: dsa: mt7530: fix .get_stats64 sleeping in atomic context
    https://git.kernel.org/netdev/net/c/07d995873960

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



