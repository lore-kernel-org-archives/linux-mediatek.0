Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B3FECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 05:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwnrzwR/6QxgVVdnT9aGb3qP4UpdMUTu8tFp+icKCNo=; b=aUtmeifwTPjjxevx6Bn8u9K9fZ
	M3p3MT2UeB6EIbZsjcc1+neFB8KYkMcLsRqpaBM7VdkpLdls7bPOjhbX+hdcLeyvVXeYw43WbMhoo
	8LP7tOBhibEYHCGavgfKPZ7uijvudEZfsRjPIiQaJV/1mykPWivFbjQQe05KT0UB17t/r2jrRUAkT
	HY2GGJHUCBPvHUjsJxDLa0EwSU4fxGylI4/zLEHrAL3eb+lMJ+wuFeSFFPVZP45dXHyNP81a6w2p3
	GkqMwcVxpmr07zkET+/1ZTu10EsgC+tsnEZS1UKq5GWqM8jQfNwT9Q1+ORmRCRk+b9Cih5A2Kf0T4
	4yrhR5cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGcS-0045zL-Bl; Wed, 31 Aug 2022 05:50:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGcG-0045vm-7L; Wed, 31 Aug 2022 05:50:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 121CEB81EE8;
	Wed, 31 Aug 2022 05:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3531C433C1;
	Wed, 31 Aug 2022 05:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661925016;
	bh=YXHgBhq9uJm0uqwtTHVRBEYraMl30fFofoWLHmeqxMo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LFhTNNE1YWN8u9rMgxmkfyOF6/sKsiGJ62qH+Ves+Yvuwk6i5pdoPboh8lSrYtJLp
	 qrmQdL8j5yvoNOLa558CeZyWZC9PGj5Qi/zVs1T9AMb0xi1AVFzGOGdOadCLT3+yxh
	 uUPFOsdbyaXSl01Rj2bnbEKFtKOfM9otPbsyaI04bM68haYXxTuEh4TWxnIfaS5SFj
	 16FkhiDZyi6ulvg8+FUw8k7uUqvVhIq2sOQ7YkmoOnPzw+uFm9Z2zs5f/w8chiUv8x
	 mx0oG3FNcwdSXvR6DM5ZytD76zi9KYIpCCGqZ+Dz/CaMr6GMxU2UK172h81yV933fr
	 joC5ZvXRB4eiQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 99E4FC4166F;
	Wed, 31 Aug 2022 05:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/6] completely rework mediatek,mt7530 binding
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166192501662.15694.8114959783518377261.git-patchwork-notify@kernel.org>
Date: Wed, 31 Aug 2022 05:50:16 +0000
References: <20220825082301.409450-1-arinc.unal@arinc9.com>
In-Reply-To: <20220825082301.409450-1-arinc.unal@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPg==?=@ci.codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_225020_470665_07658B16 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: andrew@lunn.ch, sander@svanheule.net, linux-kernel@vger.kernel.org, edumazet@google.com, krzysztof.kozlowski+dt@linaro.org, erkin.bozoglu@xeront.com, f.fainelli@gmail.com, sergio.paracuellos@gmail.com, kuba@kernel.org, pabeni@redhat.com, vivien.didelot@gmail.com, devicetree@vger.kernel.org, Landen.Chao@mediatek.com, sean.wang@mediatek.com, luizluca@gmail.com, dqfext@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, daniel@makrotopia.org, olteanv@gmail.com, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 25 Aug 2022 11:22:55 +0300 you wrote:
> Hello.
> 
> This patch series brings complete rework of the mediatek,mt7530 binding.
> 
> The binding is checked with "make dt_binding_check
> DT_SCHEMA_FILES=mediatek,mt7530.yaml".
> 
> [...]

Here is the summary with links:
  - [v6,1/6] dt-bindings: net: dsa: mediatek,mt7530: make trivial changes
    https://git.kernel.org/netdev/net-next/c/214537cd8a17
  - [v6,2/6] dt-bindings: net: dsa: mediatek,mt7530: fix description of mediatek,mcm
    https://git.kernel.org/netdev/net-next/c/ba9476f72500
  - [v6,3/6] dt-bindings: net: dsa: mediatek,mt7530: fix reset lines
    https://git.kernel.org/netdev/net-next/c/f565c54e96b6
  - [v6,4/6] dt-bindings: net: dsa: mediatek,mt7530: update examples
    https://git.kernel.org/netdev/net-next/c/c9aece04e01c
  - [v6,5/6] dt-bindings: net: dsa: mediatek,mt7530: define phy-mode per switch
    https://git.kernel.org/netdev/net-next/c/79a16c3b162f
  - [v6,6/6] dt-bindings: net: dsa: mediatek,mt7530: update binding description
    https://git.kernel.org/netdev/net-next/c/cd7e2b97f6ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



