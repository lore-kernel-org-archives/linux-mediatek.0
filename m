Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EC2C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 09:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZztorIEVTo84OEoUefx4g8C2I76H2wuuPZNynJ9JPo=; b=aWLZP5PDw2mX085ceF62Ho3hKy
	3MayZNOy23Gs6Vyj5dDh0TWJA+xi0YBrUuMdQY6qFYYiBcKQP4EjQ/A6y+5eNzP8WKk09MWO+hkgJ
	lH9Q65cQ8/xGgW4wBuHAPPMv+SWLNGpg367Soezp1GFhdrL2CsSn7cvDriO9D6dAHci4VKEmPLcXg
	Pi91hrQv9hAX0y/RiQZmexTcwA04ESTgnvBgaYY8BsuPPlIN0oPYmPwQ6dM0eqhZyXwMx6Pz3MWCv
	bHpZuW43ImWx7h4fFgnKW75KVb091Dqrf9SWvDdzscgUaQb9ycrqBssc6seka8JshzxXP5xC1T0EF
	7zSWSf/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgeB-00EnRR-0t; Wed, 08 Feb 2023 09:21:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgcl-00Emno-46; Wed, 08 Feb 2023 09:20:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8741261583;
	Wed,  8 Feb 2023 09:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6E23C433D2;
	Wed,  8 Feb 2023 09:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675848018;
	bh=2TjSaonTghxRKNuPgBnNQG/ietR7NZYTH0JtktEO3B0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ouTkdaf1lKuKbqD2hmcJm4/cs2ayH05CAFsEeAgYXBeVQ/Kw8iovnCrnuoBfL2sGr
	 t0YdnvSzbZHjsCoWVwmvazIBEoGVmprlhLoaF1eYXm6RaNwzADowTvPWluUNnqRV6O
	 kO0L/8TL0jsUCkP46MPKTd0CezaYLFyn2a5GFhBYx7ViQCwszo1JHZ2CPsrohgQgwq
	 mfyVisu8k5TsqQhtWjuCubZkGXUbxCALYieX+cpwgwq64GHysFmYtT0ytN5o14o4Wk
	 UMKtQjUB4UeciJbxLHD3IGfcfKYcUIV54ji+JghIutWXBYpRL8RZydYlkMBsNXz/jl
	 krFxUp8Ys/zUg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C5EDDE4D032;
	Wed,  8 Feb 2023 09:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix DSA TX tag hwaccel for
 switch port 0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167584801780.16330.2115452134771424523.git-patchwork-notify@kernel.org>
Date: Wed, 08 Feb 2023 09:20:17 +0000
References: <20230207103027.1203344-1-vladimir.oltean@nxp.com>
In-Reply-To: <20230207103027.1203344-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_012019_237807_36B1DBAD 
X-CRM114-Status: GOOD (  12.11  )
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

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue,  7 Feb 2023 12:30:27 +0200 you wrote:
> Arınç reports that on his MT7621AT Unielec U7621-06 board and MT7623NI
> Bananapi BPI-R2, packets received by the CPU over mt7530 switch port 0
> (of which this driver acts as the DSA master) are not processed
> correctly by software. More precisely, they arrive without a DSA tag
> (in packet or in the hwaccel area - skb_metadata_dst()), so DSA cannot
> demux them towards the switch's interface for port 0. Traffic from other
> ports receives a skb_metadata_dst() with the correct port and is demuxed
> properly.
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: fix DSA TX tag hwaccel for switch port 0
    https://git.kernel.org/netdev/net/c/1a3245fe0cf8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



