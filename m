Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC11C7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 07:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emx/RJjaR1hs1UYy32zmxSP+ECdHy0/KF1r71g8WDsM=; b=rk/6LFAoE3Oo5KF5ss/IDyFjQ1
	WOCtNCkEpiIRammuNS5MIFU2iDa6Gd5clmH6NX33xi/d461miFNsotY/o4b+KYuVARfXQquUAMMn5
	78k10EwbedqT1jZCvaxur+7WXFg0jOcWwiCxe5TK6XD5X3rcB7yANpqQVWhetClVhrRa+QiGtfPuJ
	71tw3YfT+14e/wzRZFUDt1NJpC4ZEFsgnqnTkmCKXMTaTagpAHWd9Skaf7zVj0mtIR1Ck+cSG5t5X
	M/v/jEyxR+Jz6BQTtSFWI6tSa85WQvegQBty+Py9UmNhWGSHGhx6Dx5qtUJna7BjQx0oLjTZL2RHc
	Xi0knmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1idd-00CZVY-1w;
	Wed, 24 May 2023 07:10:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ida-00CZUb-0S;
	Wed, 24 May 2023 07:10:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4249463972;
	Wed, 24 May 2023 07:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4EB8C4339B;
	Wed, 24 May 2023 07:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684912220;
	bh=5Edlffa6wzk6Sb6/TX+84tNyag5aI6qgOyHYRihIjTg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LOd3xsjDHca39yjO67fAnLUs6lBSMz3Nc/tEtRv1nNonCS5gRg+zwcnx2La/qoNHN
	 xe32v+vhrbt+pCWZsfC8tl7zOfZ49zL4SuONWWzQr/b/M/OOgZKXQUlpSwJbTLCTvW
	 6HZmFSpdWho40KZs99wgkyw+I8brQMprT95WFsdMF6Jpnb097EA3h0L3juwMLkkBqw
	 bJWJi4mhj/enWt3qGX03yosqMNa7k/dplBdlW8aKytqySMkZEjjbmmCbVzAin5XhAQ
	 fegmZLYJVvrLmhDFl7G7rHkiHm/DBeKrdblTK0tyOdsDXZbOGbUZUA3pUfpHs5yqIH
	 0nARRU7qrozsg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 887A2E21ECD;
	Wed, 24 May 2023 07:10:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix QoS on DSA MAC on non
 MTK_NETSYS_V2 SoCs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168491222055.16342.9541453168146805082.git-patchwork-notify@kernel.org>
Date: Wed, 24 May 2023 07:10:20 +0000
References: <20230522105744.37227-1-arinc.unal@arinc9.com>
In-Reply-To: <20230522105744.37227-1-arinc.unal@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCA8YXJpbmM5LnVuYWxAZ21haWwuY29tPg==?=@ci.codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_001022_220482_F7E0DBD7 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: erkin.bozoglu@xeront.com, angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com, mithat.guner@xeront.com, sean.wang@mediatek.com, linux-kernel@vger.kernel.org, Mark-MC.Lee@mediatek.com, edumazet@google.com, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, bartel.eerdekens@constell8.be, john@phrozen.org, matthias.bgg@gmail.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, nbd@nbd.name
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 22 May 2023 13:57:43 +0300 you wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The commit c6d96df9fa2c ("net: ethernet: mtk_eth_soc: drop generic vlan rx
> offload, only use DSA untagging") makes VLAN RX offloading to be only used
> on the SoCs without the MTK_NETSYS_V2 ability (which are not just MT7621
> and MT7622). The commit disables the proper handling of special tagged
> (DSA) frames, added with commit 87e3df4961f4 ("net-next: ethernet:
> mediatek: add CDM able to recognize the tag for DSA"), for non
> MTK_NETSYS_V2 SoCs when it finds a MAC that does not use DSA. So if the
> other MAC uses DSA, the CDMQ component transmits DSA tagged frames to the
> CPU improperly. This issue can be observed on frames with TCP, for example,
> a TCP speed test using iperf3 won't work.
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: fix QoS on DSA MAC on non MTK_NETSYS_V2 SoCs
    https://git.kernel.org/netdev/net/c/04910d8cbfed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



