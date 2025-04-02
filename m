Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F2BC36018
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Apr 2025 00:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pcuoz9cq0+ysFNN4QX7NC6mNNA+zbEGV8p9m/naIi8=; b=s9XtMw2HZYlQs7ebSTP6Qg9EOq
	IPLdDYjK1rd4aJzHd9k05frN72OrJsxO9mHznXQbq2xUw/l0FkLyF5DIF3sJfq3L07+HSbTyk1cbq
	q71Zzv3Z+2o+P7Jz0MPB5itP8rfCVpXj3+7rAnSMY6qWsHofk9oF8OUmTqNVQx2DwbQ01Ot3Ri1os
	8LBVtnzfNPs49JvTbMPtTIas3tVPSXmEHhEKGBN56nA/M82hyL1ExzpiNfnMyiSl8uga0TN4V57dO
	QhOxWGimHnaLx+SQVMJLb1Ndtf9EWn1u6oGFTtnhRHZ7qbvDLG2KQGYQnxMrLRQ0vlkDp8JXpXNDK
	U3e2Cw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u08Bg-00000007TrM-0p0y;
	Thu, 03 Apr 2025 00:12:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07gj-00000007QvV-2Fnb;
	Wed, 02 Apr 2025 23:40:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF19B5C6B82;
	Wed,  2 Apr 2025 23:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975FAC4CEDD;
	Wed,  2 Apr 2025 23:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743637204;
	bh=zAmMwzFxqTlBJ1o+nbHozCL71L3PaWKgrvnw4T0F69U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DfSbx01PGBNPSaCHQYBr3LeJ4ooNG0XJ2EqhJjwNmOcYeBtSol1bkTIFHKwups+eV
	 g2E4zWuQ19NEAx+cvSC31D1q/CJhQTLTxQUNNMNM6yEpyrIuuDG4TMN0xYtwasrpRm
	 hsrhM5y/KDfv3/k3xRPN0evsyt64sMJkuAs1fbxdzJkGG/435l9N9vzfeJ8Didj6Bb
	 ifoz2Oitm6Zkv5fJJwn+4XfuGFRJUJz5gMaDeR7KHcWE0mbsKxcp2CESeaoXfPTO4N
	 zUU8Q0uYGr+e2RFPFeaDcQ31aE3SIqPKdKSD66I3i1RwreGAOy6jvzEQBmQ45D1I4T
	 FhT+FzC8vA8EA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD9B380CEE3;
	Wed,  2 Apr 2025 23:40:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Fix ETS priomap validation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174363724124.1716091.3922737593747248975.git-patchwork-notify@kernel.org>
Date: Wed, 02 Apr 2025 23:40:41 +0000
References: <20250331-airoha-ets-validate-priomap-v1-1-60a524488672@kernel.org>
In-Reply-To: <20250331-airoha-ets-validate-priomap-v1-1-60a524488672@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, dcaratti@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_164005_637490_2A76C480 
X-CRM114-Status: UNSURE (   8.53  )
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

On Mon, 31 Mar 2025 18:17:31 +0200 you wrote:
> ETS Qdisc schedules SP bands in a priority order assigning band-0 the
> highest priority (band-0 > band-1 > .. > band-n) while EN7581 arranges
> SP bands in a priority order assigning band-7 the highest priority
> (band-7 > band-6, .. > band-n).
> Fix priomap check in airoha_qdma_set_tx_ets_sched routine in order to
> align ETS Qdisc and airoha_eth driver SP priority ordering.
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Fix ETS priomap validation
    https://git.kernel.org/netdev/net/c/367579274f60

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



