Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC34C282DE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Mar 2025 03:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDMBwDxj97xV/nWAhZdgtNHpNQPvDCWSobWtw5JIoqs=; b=g9TNbA4ZpftAkJsUiUEz1NAU6r
	jXTwWQXm2a+H7jWakwe9QHw7FTyGpVqxBYLQbMQK3OjUiLRMywqCXpWfvUoYnCzP5oHNHYIpto7za
	xjm5VX6vMLJjUT5PmjQ6oqUD58uOkDYdePscqVl0KSnlSfssDuGL8XdsppH3TPxUJ5ah8RNI270by
	j86aZdrxMChxsLrKZw74Zfjaj4IxozArvsHH8HVnAtFfL8Aj7K38otvIl0OtApl1aJPvDXBcM5s38
	pMNOPOYoSf3sK/nhUzE6Blh7Vy5m1aHcowbnFAgW626TL2RhPQvWNNZb7v1kj5zKMaUFv027I6ZM+
	l0/lNzvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq1xU-00000009vjC-1Hl4;
	Thu, 06 Mar 2025 03:31:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq1vr-00000009vcq-1a5f;
	Thu, 06 Mar 2025 03:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BF2E0A45766;
	Thu,  6 Mar 2025 03:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17194C4CED1;
	Thu,  6 Mar 2025 03:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741231798;
	bh=DwjSgGJVgef0kI17Lci/NSOLJqNZW6lcGDA3JVs0eN4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iR2uE0+SfSnt77476JZXnJN680qkQ/cgSHA59A3DTlSi8ygN62IKie4hn9Kc2xf2t
	 wzZnWPedXan6eQAbf1y0Wb3pOYpjwdIiAgm4/BL87RPJjVx9WLYDGZNpK4HbkQ/zoR
	 VIv2ROKc2PxUfpfdrPaDaDsYr651G1ldqAi9pOW1Pr/Dlk9swxR2Fmcmn1Oepdiror
	 e9We/yar6Xn69T1B8NlA0isfyRyeZRJXHmMebxtOAjcJQznpHygSPxYaExy8WvSU3h
	 GKS773jmuClkSi0Xan0k+aSy/LYPN1UC1IF+bQxrk/xUhA12UjJaQEzehHLSh+rs6z
	 Gal35QdNkTK7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C5A380CFF3;
	Thu,  6 Mar 2025 03:30:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: dsa: mt7530: Fix traffic flooding for MMIO
 devices
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174123183127.1114452.4008171486418029850.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 03:30:31 +0000
References: <20250304-mt7988-flooding-fix-v1-1-905523ae83e9@kernel.org>
In-Reply-To: <20250304-mt7988-flooding-fix-v1-1-905523ae83e9@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, dqfext@gmail.com,
 sean.wang@mediatek.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_192959_502044_1B2F6220 
X-CRM114-Status: UNSURE (   9.50  )
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

On Tue, 04 Mar 2025 09:50:23 +0100 you wrote:
> On MMIO devices (e.g. MT7988 or EN7581) unicast traffic received on lanX
> port is flooded on all other user ports if the DSA switch is configured
> without VLAN support since PORT_MATRIX in PCR regs contains all user
> ports. Similar to MDIO devices (e.g. MT7530 and MT7531) fix the issue
> defining default VLAN-ID 0 for MT7530 MMIO devices.
> 
> Fixes: 110c18bfed414 ("net: dsa: mt7530: introduce driver for MT7988 built-in switch")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net] net: dsa: mt7530: Fix traffic flooding for MMIO devices
    https://git.kernel.org/netdev/net/c/ccc2f5a436fb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



