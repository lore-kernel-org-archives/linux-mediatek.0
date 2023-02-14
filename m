Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA2CC61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 10:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeFnNluKXQZy4ysWBy6p2jxnaeN7AYg8wfSX1uQs2QM=; b=F+Vh/f8m+Vhj1C9VinmkrswZAf
	7Wcqv0lPJBVYLqS9oPcpzugSxhL0cf9OJXjIsJEOoVt53R5Kh2RVKLPYRlGNDX2BqWPHX92nk4RZe
	riIkkppd+iKKQszgEFshFD2mBr/B0/GDzOXDDW3dXz7H9lHHg9AhlollINqr2OzIlzFww7V1lJz/m
	pq0Mcj4EnA/RolXPpktYL4mXY1MfVFOaUGZQUbVNluzP+4kKRlhTzSUqwvZ1H3QM6JLNJUxjNTuYB
	Kl8+tlNUEUVbsRjQiqZWuBmJf2ewGVjP3RK/0R150qDD8pit3+Oxibk7NYX9nTLsQ50sUZ57pXm+n
	aOpVyLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRs6y-000r6Y-Ud; Tue, 14 Feb 2023 10:00:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRs6l-000r0q-9m; Tue, 14 Feb 2023 10:00:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF58661500;
	Tue, 14 Feb 2023 10:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69716C433D2;
	Tue, 14 Feb 2023 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676368817;
	bh=lTvtUBadmlpWwQeOZ6L7kfaww5BbsQR2JxusDsIOyjI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jSv6f5pm9a1xkeLXlqsvG8dlShizzQYLUiomQE8DpKvWMhBTuipNd3qOi0dVsx9pp
	 h7exnarB8oA433Ak0wLYvBxRgl/xPJvQQVzCrUwctwec03aCTV7wUMGYCcet0apMde
	 O7rawfNHakV5gPcVGiJUFO4zUbA3hXfSFEuG48cST6BIY+LCYtGFcFwXdnnes6GgCi
	 9fJ4BnZrNa4vKOrrrT+6tmdYbLf4++Y3uZfVpViCE/3EWvj76ipucvMyh4v+GIpHaF
	 Hmp3pu7QWdjNOXjT85xCDrOHzDsqON+NtSYleMp2mcGEHis5UVsNUgjjULvPv3ETyB
	 gSYH2sIoWwIfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44FAFE68D39;
	Tue, 14 Feb 2023 10:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: net: dsa: mediatek,mt7530: improve binding
 description
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167636881727.16047.7374583953083530603.git-patchwork-notify@kernel.org>
Date: Tue, 14 Feb 2023 10:00:17 +0000
References: <20230212131258.47551-1-arinc.unal@arinc9.com>
In-Reply-To: <20230212131258.47551-1-arinc.unal@arinc9.com>
To: Willem-Jan de Hoog <arinc9.unal@gmail.com>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
 arinc.unal@arinc9.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_020019_414168_CCD1E26C 
X-CRM114-Status: UNSURE (   8.40  )
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

This patch was applied to netdev/net-next.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Sun, 12 Feb 2023 16:12:58 +0300 you wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Fix inaccurate information about PHY muxing, and merge standalone and
> multi-chip module MT7530 configuration methods.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> [...]

Here is the summary with links:
  - dt-bindings: net: dsa: mediatek,mt7530: improve binding description
    https://git.kernel.org/netdev/net-next/c/a71fad0fd893

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



