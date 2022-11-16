Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999B8C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 04:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kv19LEUF9b8fEkpFy+R6fotZyXrGOipvgJBrKjPOd1I=; b=GmbGNXhZ7MFxEt6tw2KZfvtOZz
	FcvDJWiFjCpWzzGhUJDpW7JpeOT/P45vSi1qVBnmMXhqX9iHTemjSHIc+ml1GCMiPVc9rTlsDge+o
	BOwIuqfFZEHYkWTzOroHhG4YhYI4Lsu4txxW8A/bmNjTwQ0bBuES/NXXrOfsrHz3Xbv+4XjcMSuAs
	Q/Q4r3RilcO6r96rdCwQz5f9z/ztPNX+NJDkoAxsui64v2Binb4alrcl3VEiw8D/HK68oDmH/f3/K
	hXTkKa5bQTnjouja/MGMgByezp/glSxmO4Q8U1lkQkHAFv6tcTU15E20uZgI+kFCnsAruinuy9HbR
	rYVvvUTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovA4D-00HAdz-Rj; Wed, 16 Nov 2022 04:30:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovA43-00HAbD-3G; Wed, 16 Nov 2022 04:30:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6F040B81BC2;
	Wed, 16 Nov 2022 04:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28435C433B5;
	Wed, 16 Nov 2022 04:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668573016;
	bh=EU1LfzRE1qzP88BXkl6vs7WBr5H5/7KAwJzENNpOsBs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m+sHUBCwhpSNhem3afAZHAamLoK1fFlRsibFke9LEpXHQ3XsXO+H8HX7uQBnztybr
	 29m1G1dFG69atnSazArrncF+s/ytyA7HjB9N6GOTDsqeNNgdO0/93uR6Tg7wseX2MD
	 TmUhEeH94FMcsI+7aKSrGZiUcQ/KTFL/PqQS5wGXGSi2sE6It4ZWXZcmSl3vPSkKy6
	 h90CY2XTDNsBod4oXMrtG4FbFPyoOhwr3ru2Fbt+cWtHsy2yEZ+tNgGP49Bn4Zoz8x
	 8w0ZgUtEVFuc9EOdSxF7KaAdsWHKkL1BR07wUydEIQxPINnxi+PolW3S1riS61dV00
	 fScFPa6Bv2Zng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0EC74C395F8;
	Wed, 16 Nov 2022 04:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/4] mtk_eth_soc rx vlan offload improvement + dsa
 hardware untag support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166857301605.26862.16492412273467465968.git-patchwork-notify@kernel.org>
Date: Wed, 16 Nov 2022 04:30:16 +0000
References: <20221114124214.58199-1-nbd@nbd.name>
In-Reply-To: <20221114124214.58199-1-nbd@nbd.name>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
 davem@davemloft.net, kuba@kernel.org, hawk@kernel.org,
 john.fastabend@gmail.com, matthias.bgg@gmail.com, olteanv@gmail.com,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_203019_304041_F23F68DB 
X-CRM114-Status: GOOD (  10.36  )
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

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 14 Nov 2022 13:42:10 +0100 you wrote:
> This series improves rx vlan offloading on mtk_eth_soc and extends it to
> support hardware DSA untagging where possible.
> This improves performance by avoiding calls into the DSA tag driver receive
> function, including mangling of skb->data.
> 
> This is split out of a previous series, which added other fixes and
> multiqueue support
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/4] net: dsa: add support for DSA rx offloading via metadata dst
    https://git.kernel.org/netdev/net-next/c/570d0a588dfb
  - [net-next,v4,2/4] net: ethernet: mtk_eth_soc: pass correct VLAN protocol ID to the network stack
    https://git.kernel.org/netdev/net-next/c/190487031584
  - [net-next,v4,3/4] net: ethernet: mtk_eth_soc: add support for configuring vlan rx offload
    https://git.kernel.org/netdev/net-next/c/08666cbb7dd5
  - [net-next,v4,4/4] net: ethernet: mtk_eth_soc: enable hardware DSA untagging
    https://git.kernel.org/netdev/net-next/c/2d7605a72906

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



