Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F10BC47258
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 01:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8wzmmyUTFpl9UnELjaS2hlFiqL9KfRA5Cy9qiFP8k0=; b=f+LjICeG4/AXP4mv6D5a695O8J
	3xQhdnoo801E1rnTOfxQdO3YjTiJHOjPI/B5ea68dkp6C0s1Z1XsQMFkfzJsw/fvuswf4y1MQGomz
	wAAzBaKK70qsW9I589WN7WfglUigz2t30ruAwt8k+yaMbt4CX97iTJrJ4qBxgWjGUTPvH4cutUbz2
	ddCby10IDoKt9Lo9ltE92yx/eGJzRXSTsCrmsNuuqxcw46E7KJSMwNECUoR1A7yPdOLq4uS99nH44
	I2++7SH/Jl495rM7xB7JC1oiYF2xxvQxyZEjQG4DD1O5B5U9XexRK/u1URTsy+eiCqvk3us8ZiX8P
	iiqWn8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTBCq-00000002lsa-3LIo;
	Fri, 26 Jan 2024 01:40:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTBCm-00000002lrG-0QQO;
	Fri, 26 Jan 2024 01:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4F87DCE35D0;
	Fri, 26 Jan 2024 01:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CB89C433C7;
	Fri, 26 Jan 2024 01:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706233225;
	bh=wJvNS3eGItxJktKZUgWX28Xkf8EoVdyha55c9fq7F+4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q348R1ifm/PCzl/JiXEY/zN3JcP7xRDVrJWCCvpQBId2+KYob9+4+hn/KnCHzne9k
	 jXjAsaOzU74yOEgrOl04r0lyek9JedVU/dRQvteRH0I+tpfQwQIc5Q7AymYXEVX9T0
	 GOz3LvUaLD36DDhvv0ToQSW9TAtP4DqaDhUCVJJK5PyaVPtlm8fz6vQf6cReqeAVh4
	 AYaaGrGJDi/9LFj+treWgltvY+y1bQqwLj0xBuMIabC8l+oLX2IEu1TzapOq7aRwNY
	 jC9xBe4ZKY+Kyo66PgHX69jsECMbRGPHr9ech0FK0esEt+G+kSEVDtaPIFC8nvj81p
	 g22q5ZewA78Og==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 225C6DFF767;
	Fri, 26 Jan 2024 01:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: set DMA coherent mask to get
 PPE working
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170623322513.12449.11770533425186411622.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jan 2024 01:40:25 +0000
References: <97e90925368b405f0974b9b15f1b7377c4a329ad.1706113251.git.daniel@makrotopia.org>
In-Reply-To: <97e90925368b405f0974b9b15f1b7377c4a329ad.1706113251.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_174028_351350_7F590A79 
X-CRM114-Status: UNSURE (   8.23  )
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

On Wed, 24 Jan 2024 16:22:09 +0000 you wrote:
> Set DMA coherent mask to 32-bit which makes PPE offloading engine start
> working on BPi-R4 which got 4 GiB of RAM.
> 
> Fixes: 2d75891ebc09 ("net: ethernet: mtk_eth_soc: support 36-bit DMA addressing on MT7988")
> Suggested-by: Elad Yifee <eladwf@users.github.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: set DMA coherent mask to get PPE working
    https://git.kernel.org/netdev/net/c/cae1f1c36661

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



