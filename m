Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3C5C369C2
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Apr 2025 19:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyCGsoGFbS6axhS7x8rRMlOTuUfeewrUk2++hZS1E9c=; b=SadgrTW5UJYHY46xov429NY1nX
	os/gxW7uPaY9SDn2ix2dpMoVBsSvH7gByH19weP4UCfrQxS3+96BdU54jcUIg5A9VF41L0hE2VZ8X
	FMH7UrY0WQnn1nHFxjkwr7wxUaqgXaWIc+Mg8DIYoX993A6FiB6plF0tlTsxus4cmzt0bdQ6DFcEo
	x+FFcUvDTv9ADQVnDvdxiGZsrqeV0f1AeEjcy2JR8GgvAnwyxjeUlGdPsAfzzh+f32xXxZGn5Ul1k
	GD9vBupV9Psjr3p7pc/YNvqzUbFZXdAutpuZ+MCfn998MERmDAIm48Sm7JxX3nr9Q3VWaMQQk9EdP
	J/UK433w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OIX-00000000aoc-216l;
	Fri, 25 Apr 2025 19:01:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OIK-00000000als-2teU;
	Fri, 25 Apr 2025 19:01:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF7D243DD8;
	Fri, 25 Apr 2025 19:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5B0C4CEE4;
	Fri, 25 Apr 2025 19:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745607664;
	bh=+iGt+V5GHA1DlYPq1zz9QWmrWBPR93txyq3DdH2JeKU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=D4qDrxHwwT38UNKako63oG3V69TXGgDM0Qh6TgqyG5eR10bT9zL0Ho7lCSAy+0A7m
	 B73Ct/cIzDnRkpzfteFRna5iGTCwGGtctET6+ZrhYTJYYUBz0QIF0yswWTPvn3PCKi
	 seB4QgHAfgFrsUrbWbzawEdrTx6HXUS1BuukkTjB5A5drgnAo1SiiMxmPoILG49UVo
	 jHQr0PoWPzmXBxkNITM03Eg2X68B2ajNyDcIttq+bww733r7L5g3NRuBpa2lipd5No
	 AjqzM0IOuJpAcTkzodIFDFgXMJo0dzs3eIeDncYB90umf5iYT9utLHRIP5EPy+Tey0
	 G/KKN5HqHt1pQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E68380CFD7;
	Fri, 25 Apr 2025 19:01:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: annotate RCU release in
 attach()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174560770274.3803904.14574335432566097628.git-patchwork-notify@kernel.org>
Date: Fri, 25 Apr 2025 19:01:42 +0000
References: <20250423150811.456205-2-johannes@sipsolutions.net>
In-Reply-To: <20250423150811.456205-2-johannes@sipsolutions.net>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 johannes.berg@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_120104_744462_B161D703 
X-CRM114-Status: GOOD (  11.03  )
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

On Wed, 23 Apr 2025 17:08:08 +0200 you wrote:
> From: Johannes Berg <johannes.berg@intel.com>
> 
> There are some sparse warnings in wifi, and it seems that
> it's actually possible to annotate a function pointer with
> __releases(), making the sparse warnings go away. In a way
> that also serves as documentation that rcu_read_unlock()
> must be called in the attach method, so add that annotation.
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: mtk_wed: annotate RCU release in attach()
    https://git.kernel.org/netdev/net-next/c/d57ee99831e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



