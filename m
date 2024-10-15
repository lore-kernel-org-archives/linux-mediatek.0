Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2079CD1815E
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 01:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ravJTlOXu8ojJTQkL/Ob5BlmUv3r87cKAcT8CjYvcHA=; b=Mnw630tTEc+EYx1uJAlalrtNeq
	oawFp+1Pq03gUpW6oa0PURIUS68ob/NiEoI1CirqqHoBf6s0dQJwbxafXWKssiultjxlr5r7Pi4AU
	WvSt0qr7hwp+S9awzqoexEYCgc/XaN5B6qPxf+3WB9O+GkhZCkrnPkhBs6T+3qP7IqS+huLQOXpRS
	uWWWFquvdMe/I17ZWaxc3JZSb2G/OBaoZTcxPdwlm343D+IbNzq+3VDE6QXfJUS4Tz/JxcOOJoDoX
	DvGSE1F8f6dOD3n20gEuxSdqZDv4HyjZr+yV/yEsiFLOAr+IrgbgxR3duDy203RjT2KI5YfVOUVha
	UNjqkwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0W6V-00000006kXa-48Lz;
	Tue, 15 Oct 2024 01:12:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0W54-00000006kAt-2O3C;
	Tue, 15 Oct 2024 01:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 07486A40178;
	Tue, 15 Oct 2024 01:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BCAC4CEC6;
	Tue, 15 Oct 2024 01:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728954632;
	bh=UOJbWPQWmTdSA81rRftszQfoSPKSv3GWQ0BhskXRA1Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Hcqc9zXWMU9uInhPEYS18uZ18agL7FETCOaPCOiNIvw2HOxui9j/HJQXDlxgLyhvc
	 7P7YHkfk2qIe/vYDYq4JNKy/qpc2bk9LJgCobv/+idYbJdwS0brsGYZtF2/M+ag1x8
	 cLMNv+X7ueeSFXWrTKpv5sMWwrfrfOqcCpJViPYGKiE3XdIWaMhtQia7qUHl9Wc3Y1
	 WDBQuE/6nf8WpF+BCm953upU5QeW4QZCXVCPmCMl8h214KsupcF1e7ylGKn5Nk27EC
	 KwstXL5YPECB9NaHjgjJOZ0IFKareUYpP/Ak1CDpEcog4HH8TXjCCJWb/3Hj4FglXc
	 WjGVbjL7od4bQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF983822E4C;
	Tue, 15 Oct 2024 01:10:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: mtk_eth_soc: use ethtool_puts
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172895463776.686374.17879317591216862359.git-patchwork-notify@kernel.org>
Date: Tue, 15 Oct 2024 01:10:37 +0000
References: <20241011200225.7403-1-rosenp@gmail.com>
In-Reply-To: <20241011200225.7403-1-rosenp@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, nbd@nbd.name, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_181034_689805_F7A0CCD7 
X-CRM114-Status: UNSURE (   8.93  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 11 Oct 2024 13:02:25 -0700 you wrote:
> Allows simplifying get_strings and avoids manual pointer manipulation.
> 
> Tested on Belkin RT1800.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Here is the summary with links:
  - net: mtk_eth_soc: use ethtool_puts
    https://git.kernel.org/netdev/net-next/c/2a22bead433e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



