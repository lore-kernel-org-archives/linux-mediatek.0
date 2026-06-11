Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF337CD98CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 22:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyDtIwtvF041sYkQ4i3vJeqerIci+8sHT/aTtsYneJc=; b=PJXp5uhvpz96jbatyxgtunaAqm
	v8PLq+cEQMPXJ1hwy6p0Gx+oXc5x0EdqsZGwIthtn0vyr8rP7r06rl44/2P2x2TjdWvj/olg2cNh5
	fGXRAvBufJiAw6cDqE69V/t4Z39QtFGc0jALN8CNXsWUKUgaQ41k4sN63j1DqcH/xiq3MEEuP8KHl
	uvzP/6tKsBOAxaUMkbVj4+x/+8vcaP+b5QCahVyx4UYsovEf0wb9WwAwxLlF3PQTwXwyAz7P2Ui8S
	mrSDkFl0izG72nM80QdW1OmQreFsfkjMVx3zXm54xi8sGJTDDKwl1AXu9/VRQ3CgAMaXzoUNesbQC
	AQ5uLLug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoEO-0000000A9Ji-3l27;
	Thu, 11 Jun 2026 22:50:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoEN-0000000A9JU-0spr;
	Thu, 11 Jun 2026 22:50:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D47D60213;
	Thu, 11 Jun 2026 22:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E2B1F000E9;
	Thu, 11 Jun 2026 22:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781218233;
	bh=wyDtIwtvF041sYkQ4i3vJeqerIci+8sHT/aTtsYneJc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QztO8TxN7V82vPhm9Wqhx+LEs9/4ZId9uXRA2/MQHI4/hNWI5GxkctGkhfPA8eypf
	 7aYy8KxwQ8i7+52wEnwCd20nCET5DG+ouzh6141VN9P/05tZ7cazzQNpibiDBnFXxh
	 n3OsURb71UfO4/jS5R1Ee935CLNF2qFObJUzl0Yb3RmUEVfY0ElyuNgQhqXRC0HiuW
	 bLO/LwoSpDz6a0YwpvmKmnuc4UtF/R4BUVbhhbcdSbJvVW8OIYLjywQjKk8AH98nfy
	 YYgk56zcf2GqxngZ1l/c6n31HimdtkgDqao7S3Z0uSQeZPHdbl9MDEukgmRc7rsiV7
	 odUIGTktEDSOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569183930FB3;
	Thu, 11 Jun 2026 22:50:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: move get_sport() callback at the
 beginning of airoha_enable_gdm2_loopback()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178121823088.394849.13885828285639251256.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jun 2026 22:50:30 +0000
References: <20260608-airoha_enable_gdm2_loopback-minor-change-v1-1-1787a0f42b31@kernel.org>
In-Reply-To: <20260608-airoha_enable_gdm2_loopback-minor-change-v1-1-1787a0f42b31@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

On Mon, 08 Jun 2026 23:24:15 +0200 you wrote:
> Move the get_sport() callback invocation at the beginning of
> airoha_enable_gdm2_loopback() routine in order to avoid leaving the
> hardware in a partially configured state if get_sport() fails.
> Previously, get_sport() was called after GDM2 forwarding, loopback,
> channel, length, VIP and IFC registers had already been programmed.
> A failure at that point would return an error leaving GDM2 with
> loopback enabled but WAN port, PPE CPU port and flow control mappings
> not configured.
> Performing the get_sport() lookup before any register write guarantees
> the routine either completes the full configuration sequence or exits
> with no side effects on the hardware.
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: move get_sport() callback at the beginning of airoha_enable_gdm2_loopback()
    https://git.kernel.org/netdev/net-next/c/aeb62be4d3b1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



