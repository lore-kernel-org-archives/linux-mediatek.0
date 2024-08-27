Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B442C54731
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Aug 2024 21:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fr+3qWu+CHCAF/U9dZkOPk1TOcW+T2CbT3HvHDSqRa8=; b=X+zALtfEmGJibZs6y/s1dhOMQE
	1e/+S6QBBf3pjYeKiHlpQWewvIL1h7QC7ynBuWwNLCzkJIFNiE49WM/bw7/F6Dki9mZ6SwlElbf/x
	36jrR+mB1wQIf0IhioBtfXJz2+UePbfMHVkVpUCxic3gIHEL5LzZp727wOwvwdHBClLXkXSSqDaHS
	Xxrezjg6WIfR/PU2CIIIBC1KGJxpA1jpKSGEU1n7xzLzdeoTPdXcXEbhyJk3eOeVEhXC7y+4/u0Uz
	5wX65Oz5B6DIuv3CD7zImDo+FnWs4y88rjVDp4cEHPJMKy7Lp8y13i4eUKSwixfj+BwlSjLlk1BPs
	HsqqtGZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj3mm-0000000Cths-1vrr;
	Tue, 27 Aug 2024 21:31:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj3lw-0000000CtSg-15VS;
	Tue, 27 Aug 2024 21:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92EEDA43148;
	Tue, 27 Aug 2024 21:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D513C4AF16;
	Tue, 27 Aug 2024 21:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724794238;
	bh=UF5oNncSFvh5U+Vjqi3Hnl24mcbFhjSedPb+WcU/Gm8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=F1ZOdqDgh9eaByDkMTogAgtVkUPaLms3uPDn4TdjdAdZOh9rgT5jsKiOijCAWRQkA
	 Wbz4kCjX4Jql6YYuteW496b9Qk6T3VwJg2GdmeOwKEuN15G/mKVKMcicX/6DphU9ml
	 8pdx/H/pmYSBZ9YyFuorkvtuEMFQy4K0WngwyICuGiN705hepCO5SlRsZkbsXqMhZC
	 Mg9XDg2PB0juHMifWw0u0Sbj4bMc3a52mJWn5BP9NRuAb6paawIYZq3CuYRWjZ9jLl
	 R6Bn+jbdY5EPOeY6FFw9iXFpkqNk+ZabwjRPMAf3Kqtdw4cHtqvOWnpFozZND4BuDt
	 6xMqFxn8PatNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E5E3822D6D;
	Tue, 27 Aug 2024 21:30:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next 0/3] net: fix module autoloading
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172479423799.767553.16922286999565364785.git-patchwork-notify@kernel.org>
Date: Tue, 27 Aug 2024 21:30:37 +0000
References: <20240826091858.369910-1-liaochen4@huawei.com>
In-Reply-To: <20240826091858.369910-1-liaochen4@huawei.com>
To: Liao Chen <liaochen4@huawei.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 chris.snook@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, nbd@nbd.name,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_143040_389924_81A3E128 
X-CRM114-Status: UNSURE (   9.38  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 26 Aug 2024 09:18:55 +0000 you wrote:
> Hi all,
> 
> This patchset aims to enable autoloading of some net modules.
> By registering MDT, the kernel is allowed to automatically bind
> modules to devices that match the specified compatible strings.
> 
> Liao Chen (3):
>   net: dm9051: fix module autoloading
>   net: ag71xx: fix module autoloading
>   net: airoha: fix module autoloading
> 
> [...]

Here is the summary with links:
  - [-next,1/3] net: dm9051: fix module autoloading
    https://git.kernel.org/netdev/net-next/c/2e25147a6560
  - [-next,2/3] net: ag71xx: fix module autoloading
    https://git.kernel.org/netdev/net-next/c/c76afed1bace
  - [-next,3/3] net: airoha: fix module autoloading
    https://git.kernel.org/netdev/net-next/c/7d2bd8ac9d24

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



