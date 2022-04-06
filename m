Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D369C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11AVXNs18iTWK5ciKPaoGqB90ifEKO/QkpJR7wrkt/s=; b=5DIZIbFQM546+z
	n4y2YRdq5BZO6Q3UCc8YY0N6RYvi36WRncRGUaDyrTec1APvsHd3fkwEmwz5sEh+yZ2dB0ACxzfvr
	bb7aqIuzrCh9/K9Ok1ms8LVOPWllADt16OB8d+G6RQ4j91R+7AosSZf0oWUMSy9EPeQpcBfpMykxZ
	q74Dc15ralnZMtuZ9k0FHsmz1Ao7TTnrcYYVgT/bQRq/i3XuynV+IKQ29OhcJ9c38ztgNoo7R3sZF
	Mh0Jof78rnXQEsD5yfG8F0pAMZNJzcn2UaxQAbY9MNMUEKtB0xRSA/tAk7ZkWg6Yxc0/6P3uxDIyv
	Y2uDVoacEiXE9oR8QDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc5k3-006IRG-DM; Wed, 06 Apr 2022 13:30:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc5jm-006IJK-Nz; Wed, 06 Apr 2022 13:30:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 43FC0615E3;
 Wed,  6 Apr 2022 13:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5F86C385A1;
 Wed,  6 Apr 2022 13:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649251817;
 bh=1BqbXUrKDjAoRePm+i3fyyTSIHWxt+faLr5ErT+OoBM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=QoR+vUCOt+B8lIR8ZQNA3i9WN9y8yQX1lhRpCSgdgtR6Ba1IgH3zGK+wadzWwkZds
 lX1PhMlZl559xyp6FQ/5HkEDqIWmqjv0irCsHre/2BrtbBlJadrcSFiHAfR44yBUpL
 gy5MWClZk/0rxCM9tyOOn6jU9x/cOrLIRhnFPrQ3c5pC8O8Vd3WAj0HWOYMLV+xqVm
 C54smL74OI29p2tlRfxweVmCLzH+PXiKC+14wvRLSKQIqbyq/fF35r8BcCe6vAsZfb
 6twKnd3HhAYaWycY2KuRT9b3k+/+yy1fj0yR0a/tIokWZlWFi+U0Tla3ygvuF6Uxrr
 1Ig0kUxJQ9iWw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8850EE85BCB; Wed,  6 Apr 2022 13:30:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/14] MediaTek SoC flow offload improvements + wireless
 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164925181755.19554.1627872315624407424.git-patchwork-notify@kernel.org>
Date: Wed, 06 Apr 2022 13:30:17 +0000
References: <20220405195755.10817-1-nbd@nbd.name>
In-Reply-To: <20220405195755.10817-1-nbd@nbd.name>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_063018_905245_962433D6 
X-CRM114-Status: GOOD (  13.93  )
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

This series was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue,  5 Apr 2022 21:57:41 +0200 you wrote:
> This series contains the following improvements to mediatek ethernet flow
> offload support:
> 
> - support dma-coherent on ethernet to improve performance
> - add ipv6 offload support
> - rework hardware flow table entry handling to improve dealing with hash
>   collisions and competing flows
> - support creating offload entries from user space
> - support creating offload entries with just source/destination mac address,
>   vlan and output device information
> - add driver changes for supporting the Wireless Ethernet Dispatch core,
>   which can be used to offload flows from ethernet to MT7915 PCIe WLAN
>   devices
> 
> [...]

Here is the summary with links:
  - [v2,01/14] dt-bindings: net: mediatek: add optional properties for the SoC ethernet core
    https://git.kernel.org/netdev/net-next/c/1dafd0d60703
  - [v2,02/14] net: ethernet: mtk_eth_soc: add support for coherent DMA
    https://git.kernel.org/netdev/net-next/c/d776a57e4a28
  - [v2,03/14] arm64: dts: mediatek: mt7622: add support for coherent DMA
    https://git.kernel.org/netdev/net-next/c/3abd063019b6
  - [v2,04/14] dt-bindings: arm: mediatek: document WED binding for MT7622
    https://git.kernel.org/netdev/net-next/c/55c1c4e945fa
  - [v2,05/14] dt-bindings: arm: mediatek: document the pcie mirror node on MT7622
    https://git.kernel.org/netdev/net-next/c/f14ac41b785f
  - [v2,06/14] net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)
    https://git.kernel.org/netdev/net-next/c/804775dfc288
  - [v2,07/14] net: ethernet: mtk_eth_soc: implement flow offloading to WED devices
    https://git.kernel.org/netdev/net-next/c/a333215e10cb
  - [v2,08/14] arm64: dts: mediatek: mt7622: introduce nodes for Wireless Ethernet Dispatch
    https://git.kernel.org/netdev/net-next/c/e9b65ecb7c30
  - [v2,09/14] net: ethernet: mtk_eth_soc: add ipv6 flow offload support
    https://git.kernel.org/netdev/net-next/c/817b2fdf1667
  - [v2,10/14] net: ethernet: mtk_eth_soc: support TC_SETUP_BLOCK for PPE offload
    https://git.kernel.org/netdev/net-next/c/bb14c19122b7
  - [v2,11/14] net: ethernet: mtk_eth_soc: allocate struct mtk_ppe separately
    https://git.kernel.org/netdev/net-next/c/1ccc723b5829
  - [v2,12/14] net: ethernet: mtk_eth_soc: rework hardware flow table management
    https://git.kernel.org/netdev/net-next/c/c4f033d9e03e
  - [v2,13/14] net: ethernet: mtk_eth_soc: remove bridge flow offload type entry support
    https://git.kernel.org/netdev/net-next/c/8ff25d377445
  - [v2,14/14] net: ethernet: mtk_eth_soc: support creating mac address based offload entries
    https://git.kernel.org/netdev/net-next/c/33fc42de3327

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
