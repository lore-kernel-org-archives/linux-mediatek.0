Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2A3C10F1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 09:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuLYS4mxTd0OL7RZj2taEABkBfLK6lkDLpvq2g8fn6w=; b=pD3t/nBdC774U/yVnZVoM4IjqC
	CsBhhPlAva3xqWwXAbdgW22CBQB5yTBPQWOwo1vpdOpUDny/olqYnUKBs4FeYoip3xnyETmAjR+7J
	PnzOYOYTULrW9EeBLFX8g3SvdWCsa7xR4PvJOQfPSotTI49D+AW+OipyR13k6MeEUnVhZDXEfFv5Z
	V4qvmtsTWJRqWyBicuF1QM3PxpD5m+BP0QlSJoDic1l+LSqiLiP4mQAJv/NzUIfEs6tASC26AfEIA
	mdvvAY2ph34By57FpzA8kW9NO9Iw9dPeVQc/o3BLSb4A3FquHzlwTqdCb8RUy1D/hZ2dq3x7oO5a6
	kPx2dS+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4HJb-0000000ALWw-0sOI;
	Tue, 07 May 2024 09:40:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4HJX-0000000ALTh-2yGH;
	Tue, 07 May 2024 09:40:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C2036163D;
	Tue,  7 May 2024 09:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C723CC4AF68;
	Tue,  7 May 2024 09:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715074841;
	bh=XYhvyyqBPbCPPManGWzSD8bIWNDcaeNrlref3PG2kY0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FTV37SJlOgl+6N1CNIdrbryReVPROt0XMJcJojUTOmJjEGL9WT8wrrxc07vwfnBac
	 COG9xisdc2rBkShWxq2LMlyrZJnjpvbATDBknzCOSNk1T2soXuMSDpB4qYq0nPyElG
	 9iJsQfEvXsQPtXWuZr1SKNsGxsGnsX7QmckHstUInp1hpKs3szqH9jI0hxspDq67QG
	 O+SaaILdl9NhOWUZXEvuYG6YSl36a3jHd9ohdqvaw5HZMZxuTSrFQNv9QNm2eLlhAT
	 3A4nXcSfFFSk4VS07D058WHV4mXImrEf2VS+hKs1MducGufgM/2VuuuEcFbgvIGNKM
	 zUc8lNwjBhlfA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B9480C3276B;
	Tue,  7 May 2024 09:40:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: detect PHY muxing when PHY
 is defined on switch MDIO bus
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171507484175.24942.8565731423432452647.git-patchwork-notify@kernel.org>
Date: Tue, 07 May 2024 09:40:41 +0000
References: <20240430-b4-for-netnext-mt7530-use-switch-mdio-bus-for-phy-muxing-v2-1-9104d886d0db@arinc9.com>
In-Reply-To: <20240430-b4-for-netnext-mt7530-use-switch-mdio-bus-for-phy-muxing-v2-1-9104d886d0db@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCB2aWEgQjQgUmVsYXkgPGRldm51bGwrYXJpbmMudW5hbC5h?=@ci.codeaurora.org,
	=?utf-8?b?cmluYzkuY29tQGtlcm5lbC5vcmc+?=@ci.codeaurora.org
Cc: daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 bartel.eerdekens@constell8.be, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_024047_830997_72306B38 
X-CRM114-Status: GOOD (  10.55  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 30 Apr 2024 08:01:33 +0300 you wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Currently, the MT7530 DSA subdriver configures the MT7530 switch to provide
> direct access to switch PHYs, meaning, the switch PHYs listen on the MDIO
> bus the switch listens on. The PHY muxing feature makes use of this.
> 
> This is problematic as the PHY may be attached before the switch is
> initialised, in which case, the PHY will fail to be attached.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: dsa: mt7530: detect PHY muxing when PHY is defined on switch MDIO bus
    https://git.kernel.org/netdev/net-next/c/d8dcf5bd6d0e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



