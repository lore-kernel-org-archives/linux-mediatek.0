Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A9AC4453A
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 21:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqwN6GnLhIgG98t5IE9dAVJBJGSQc58h99VPxss3bww=; b=J3XwS6t/+PlwsOFBqzGnCqZQ1h
	H9t+Z7iFHHaGkgh93JwNmvTbGRMA8WQJjTw2Lolt9QHdGN9v3wQ9AKSkB6cuagLEcQkjryBC2uLjK
	q3CzakvjdvEiich9bmxutqdpuXBk4YI8tGHsomZPxxfTpetO5rVvtcDgOMZcSteGO5Ulf6E3DGwXS
	aMJhf2mLD5R9TDDVioGSyTeLIxvmSlYcd396alC6FehI/7T1NKAqfDelCkU5hwSmjBYeiHMhiHatV
	jjzCy/rNH4JHZ4CZ9UDpo1BI+afIFcMtge1vzxV5zCtw7VceUi7FpI03jDge3VvLijAgtdsUSnvv7
	sQcjG2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeDK-0000000CmqZ-23Id;
	Wed, 22 Jul 2026 21:10:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeDI-0000000Cmq6-2ybs;
	Wed, 22 Jul 2026 21:10:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1677B44DEB;
	Wed, 22 Jul 2026 21:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92311F00A3D;
	Wed, 22 Jul 2026 21:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784754648;
	bh=oqwN6GnLhIgG98t5IE9dAVJBJGSQc58h99VPxss3bww=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mR2D/xczyCbI2UrfuFEHRadzyhx7smT0S+PGxmdlh/nq4DWmVLHfJ3GpGfaFRk10b
	 Cd2nU/Rkl9+Sgk1GPmQQiN2fLsQPnng/vk4/owsbLgaS9kEfxQOeRj9afwVozck1Au
	 /yDp/KrT3/2kmnpB3IKMyU84c/967Gs2QY6TDbVBTVWQcdQssoGrWTyu7Md59EQwXu
	 AmHRNQeJqmhdD/xjoJhyezYZH55vITmkKIHxFBEYTfEUdILOAQuKNUI7a7/C57XjI7
	 tUMo8qQ5rXoVhgdCBkcYWbcsFZWfus3iaKiijYw2TrbSRN7ocN6gneAPWylvrfxQEH
	 ucHf/mjJgDh9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0E15380CED5;
	Wed, 22 Jul 2026 21:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/2] net: dsa: mt7530: add EcoNet EN7528
 built-in
 switch support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178475461638.2026851.7452354596103866220.git-patchwork-notify@kernel.org>
Date: Wed, 22 Jul 2026 21:10:16 +0000
References: <cover.1783770059.git.naseefkm@gmail.com>
In-Reply-To: <cover.1783770059.git.naseefkm@gmail.com>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: netdev@vger.kernel.org, arinc.unal@arinc9.com, chester.a.unal@arinc9.com,
 davem@davemloft.net, andrew@lunn.ch, angelogioacchino.delregno@collabora.com,
 conor+dt@kernel.org, dqfext@gmail.com, daniel@makrotopia.org,
 edumazet@google.com, kuba@kernel.org, krzk+dt@kernel.org,
 Landen.Chao@mediatek.com, matthias.bgg@gmail.com, pabeni@redhat.com,
 robh@kernel.org, linux@armlinux.org.uk, sean.wang@mediatek.com,
 olteanv@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 11 Jul 2026 15:40:59 +0400 you wrote:
> The EcoNet EN7528 is a MIPS SoC whose platform support is already
> upstream. It integrates an MT7530 switch, memory-mapped like the built-in
> switches of the MediaTek MT7988 and Airoha EN7581/AN7583 SoCs, but with a
> true MT7530 core, four Gigabit PHYs on ports 1-4 and a CPU port at a fixed
> 1000 Mbps full duplex link.
> 
> Patch 1 documents the compatible, patch 2 adds the driver support.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] dt-bindings: net: dsa: mediatek,mt7530: add econet,en7528-switch
    https://git.kernel.org/netdev/net-next/c/886f928a7849
  - [net-next,v2,2/2] net: dsa: mt7530: add EN7528 support
    https://git.kernel.org/netdev/net-next/c/cf23fcc9437e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



