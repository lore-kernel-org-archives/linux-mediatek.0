Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EC3C369CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 01:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2rSncuWJmG5TRj0ydDHEcM9iT/ZWLPSphWRD7EqlEs=; b=dOt/1RkH4EX0YxWQjJGpydq4ac
	cYmtwV8GvyJW6Dp9kRnOeCasNeu3WkcvxLzDkaKYd4jdl/3Sz30H/5AZXiG3BP2EotJJTSUYLIIxQ
	i8OJqV6mrbw2UjG3vySmbVBjrYgLkVcr/vme7XVkWTGAZIwsq+mlZ22rHeECJ6u+wXNIKJLDjx/K5
	t3zU6QdjBqWdAAC/GEk5nRyKEbbMmkYtS9BZUaq7WWoXb9G6Oi5+DWSJfToyCIlqIk87npz+PI17E
	H3B3/y4eomvHglutOVzW2M59PJsWIGx3H/YQOXjxYBrr4zBJPh6Ul3q8hLPOr0T3SltuQi/jA6coI
	PnR7oBtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lks-0000000CZWq-3OW4;
	Thu, 24 Apr 2025 01:51:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lip-0000000CZ78-2oDg;
	Thu, 24 Apr 2025 01:49:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C03125C593C;
	Thu, 24 Apr 2025 01:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A68C4CEEA;
	Thu, 24 Apr 2025 01:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745459390;
	bh=okAdnUMdkt77fPNOGoNov2VzUCP19KzZkGl46/1y+w8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YIPvj4BLeYeqMXk0isir7s8Yu2WBUBo1eModjU8uNIXQn3QFOw5gaLqgkwZBTN/dd
	 OHkZKKCrB/7v0p4xQqGqKLyN8zfNfjDG/0xwxY2ODJ8eQY5fRHyhrkdEE8qa/dAK1R
	 YWPRKbovTAsm3hJkSnMwsuu6y09Ocn+F9HPZUl7J628Sx/MhnsNxEJiolbu7eVV3ZK
	 vvGDISucdRKhKXodmfxj2iH1uGOoVrmAxL7mKuTfQplKieAhtmBnxDaK8Qri5mSkQe
	 lBVqaIGkFCnkmxTDElagKq45fTO4uIlYyo1gHFNmUrJ9Gx0JnVGTmFhX08FSNXSHM9
	 Q8ckLFRJ4tMLg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B77380CED9;
	Thu, 24 Apr 2025 01:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: dsa: mt7530: sync driver-specific behavior of
 MT7531 variants
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174545942875.2829412.8607382949348037647.git-patchwork-notify@kernel.org>
Date: Thu, 24 Apr 2025 01:50:28 +0000
References: <89ed7ec6d4fa0395ac53ad2809742bb1ce61ed12.1745290867.git.daniel@makrotopia.org>
In-Reply-To: <89ed7ec6d4fa0395ac53ad2809742bb1ce61ed12.1745290867.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: chester.a.unal@arinc9.com, dqfext@gmail.com, neal.yen@mediatek.com,
 sean.wang@mediatek.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_184951_753080_B9EAB0F3 
X-CRM114-Status: UNSURE (   8.62  )
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

On Tue, 22 Apr 2025 04:10:20 +0100 you wrote:
> MT7531 standalone and MMIO variants found in MT7988 and EN7581 share
> most basic properties. Despite that, assisted_learning_on_cpu_port and
> mtu_enforcement_ingress were only applied for MT7531 but not for MT7988
> or EN7581, causing the expected issues on MMIO devices.
> 
> Apply both settings equally also for MT7988 and EN7581 by moving both
> assignments form mt7531_setup() to mt7531_setup_common().
> 
> [...]

Here is the summary with links:
  - [net] net: dsa: mt7530: sync driver-specific behavior of MT7531 variants
    https://git.kernel.org/netdev/net/c/497041d76301

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



