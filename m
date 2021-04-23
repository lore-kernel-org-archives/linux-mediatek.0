Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19FFC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 21:00:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33C9D61450
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 21:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33C9D61450
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MAuoBuCfJNvlRuqKa/2jwtbQmyrFlxHEV+6ZLKMKb40=; b=qinHh/QCBZ8kjxDW/rtx/dVKX
	B6O6m1xR3Gf5bz4TwkDTAZ9ZPSypMYJmTg2RFhTc+VYMH027MkHx6fZudY+4tpPLf7iFRgxjaT6Ne
	ZLFE8dMqnAqCsrn2Jgoc7D+nU1VZrAHKqHZIPPK9gyHPpZHpPmRSsNKcEABeTgBANVW4h0+bmh1f+
	By20+PvNV4aLeA6BchP9EHJ9CyqPSF6vEtOfucsrIDlAhmvQXq4dxiDHLB8QDTEtfpgE0csyrzBrD
	R56XQLmxTwZQjn7vDP7dmYk6z5iOCA7R7oF7loQDrqpcofF/gPUp4BtxXcZCDe7Cic23MANvPJ085
	hUvsOMCxg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la2uc-002MDb-Gw; Fri, 23 Apr 2021 21:00:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la2uP-002MB7-Jn; Fri, 23 Apr 2021 21:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:To:In-Reply-To:References:Date:
 Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=8ARxZoc8cT8DwCdxIz/ZVcZYt2PRclYruF5Crog+Rwk=; b=AI30ngHFKfv1U+Z10AD9gHuJwA
 EQcyq8DsGj2NYotjEZ42iN2u9pgynzoI/bYVLwucZnOq7SiBzqgW/nfcz/h8MX8e50WX2bVBX1F+N
 ID12agi7WKD/04N+kGFCiT9dUS3fo+etI8lvPfHRgSxPVd5pz3CarpkykEMnzan+px6hpBoPS9eH4
 UIApnrKkg1FJzl3WRPHunlqeve1WFJ4m9A1jKXH9pe7KVewUd4E7ckZcDZzY5aS+UEwa4pmtWgMYY
 iLWjjCw5x1P35fcN7uxMOuqPZ5HdQVCTNuOIlH2hZPa+jW7pARxchrPs/KvKlh/JdDxvhA6PEtHND
 r+cSyqEQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la2uM-00EhKA-GL; Fri, 23 Apr 2021 21:00:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 321E66144E;
 Fri, 23 Apr 2021 21:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619211613;
 bh=qcnWhsG+IuHq4y2rRfmfmfF8Z9Aj2JAVCwOhPjy8g14=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=EFT8Wyk/V1LL6Z7jEhG8NHusjEBjeFvkxQGuJHGHLlRaSWp23pSpzYsC5Ioi8jG+y
 R+iW/2pxr4eFtEg6BpE8d/M/fHgRfoF5kneann+UGytYAPMD/MMqjVetzjdwg53hxU
 2wJz7VnhgAC6UQXyr9f522tdiDf3ek/E3c8In2PNXqV9r6L+H+/23kUxp70piq78vs
 xUEOhZSsBK7+6dgS/LNy/oVFzHD5I4YwnDWd4jaz9246F5G+tXO6t8lOPhPl667Oae
 fUgMtstFXIv3PAlgkSBOlnz4vfE6PXxGCXCtoXq2jjij3u/YIk1pPPTxmCINyXpGG4
 Hho8zOG/uLglQ==
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 00/15] mtk_eth_soc: fixes and performance
 improvements
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161921161314.19917.14237701035571279323.git-patchwork-notify@kernel.org>
Date: Fri, 23 Apr 2021 21:00:13 +0000
References: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
In-Reply-To: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_140014_609037_0FBFF38B 
X-CRM114-Status: UNSURE (   9.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (refs/heads/master):

On Thu, 22 Apr 2021 22:20:53 -0700 you wrote:
> Most of these changes come from OpenWrt where they have been present and
> tested for months.
> 
> First three patches are bug fixes. The rest are performance
> improvements. The last patch is a cleanup to use the iopoll.h macro for
> busy-waiting instead of a custom loop.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/15] net: ethernet: mtk_eth_soc: fix RX VLAN offload
    https://git.kernel.org/netdev/net-next/c/3f57d8c40fea
  - [net-next,v2,02/15] net: ethernet: mtk_eth_soc: unmap RX data before calling build_skb
    https://git.kernel.org/netdev/net-next/c/5196c4178549
  - [net-next,v2,03/15] net: ethernet: mtk_eth_soc: fix build_skb cleanup
    https://git.kernel.org/netdev/net-next/c/787082ab9f7b
  - [net-next,v2,04/15] net: ethernet: mtk_eth_soc: use napi_consume_skb
    https://git.kernel.org/netdev/net-next/c/c30c4a827390
  - [net-next,v2,05/15] net: ethernet: mtk_eth_soc: reduce MDIO bus access latency
    https://git.kernel.org/netdev/net-next/c/3630d519d7c3
  - [net-next,v2,06/15] net: ethernet: mtk_eth_soc: remove unnecessary TX queue stops
    https://git.kernel.org/netdev/net-next/c/16ef670789b2
  - [net-next,v2,07/15] net: ethernet: mtk_eth_soc: use larger burst size for QDMA TX
    https://git.kernel.org/netdev/net-next/c/59555a8d0dd3
  - [net-next,v2,08/15] net: ethernet: mtk_eth_soc: increase DMA ring sizes
    https://git.kernel.org/netdev/net-next/c/6b4423b258b9
  - [net-next,v2,09/15] net: ethernet: mtk_eth_soc: implement dynamic interrupt moderation
    https://git.kernel.org/netdev/net-next/c/e9229ffd550b
  - [net-next,v2,10/15] net: ethernet: mtk_eth_soc: cache HW pointer of last freed TX descriptor
    https://git.kernel.org/netdev/net-next/c/4e6bf609569c
  - [net-next,v2,11/15] net: ethernet: mtk_eth_soc: only read the full RX descriptor if DMA is done
    https://git.kernel.org/netdev/net-next/c/816ac3e6e67b
  - [net-next,v2,12/15] net: ethernet: mtk_eth_soc: reduce unnecessary interrupts
    https://git.kernel.org/netdev/net-next/c/16769a8923fa
  - [net-next,v2,13/15] net: ethernet: mtk_eth_soc: rework NAPI callbacks
    https://git.kernel.org/netdev/net-next/c/db2c7b353db3
  - [net-next,v2,14/15] net: ethernet: mtk_eth_soc: set PPE flow hash as skb hash if present
    https://git.kernel.org/netdev/net-next/c/fa817272c37e
  - [net-next,v2,15/15] net: ethernet: mtk_eth_soc: use iopoll.h macro for DMA init
    https://git.kernel.org/netdev/net-next/c/3bc8e0aff23b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
