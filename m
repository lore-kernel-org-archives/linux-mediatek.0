Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3053C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 10:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZxTfbfMjUhMtAbOs56p3mk57c4NXK5qOb2SZLhEhus=; b=drvjLcSh4kZo9Y
	PPLCLJvxEEjA7G62pl2ODKYb5bRh8oz4WT7vBpOy3bwOBGILDXaOTfslxuFsBdpZp9/9UHTo/rshU
	+8uoSdNUDnfpcWwUfJt9oFhoJUL9Wnl2FpE6kbemFBUDPnw6x/Gfvt4vcpOG1bMT4MBBs3V+XsfSo
	ShCHEvll449WVQ9o9I/5li3w608Sml50/OO0dHxYtyLqmMXjsfgd/907PTew3YIw8+CPPPA1IFv5v
	Kj/sfIX4/C1L4+pkZSdHl4QEaFUqreNAtj/DRlwBfLtSptcH58AwOadIwgH44/na9YBoMxYBew8zE
	+mU0+s7HW0LsHI5yFHcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndr8n-008G6q-Sc; Mon, 11 Apr 2022 10:19:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndqga-0082tY-AQ; Mon, 11 Apr 2022 09:50:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1960ACE16CA;
 Mon, 11 Apr 2022 09:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8445DC385AD;
 Mon, 11 Apr 2022 09:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649670612;
 bh=TqRy/2gYy2v7KE9B1nAZrSGCHM8o3LIRywUfjnn7Sj8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OSN052LfKtOzHJDXQgMBgIdgGZat8s6rPKg2CK2+6ilbQVXQdSG/6F/b4JXcrcUho
 SVqmnX29JTxr9duRhlHU48DAId6/edEhU1FXblrQnYRQFwSX5GEwYIlTdamt+3h1h7
 saG2dwiHBXudE8DRSysZJHOi0+LwicGLaa6sIz8dQoXyELwG/fBGVLOv9yNuPI0+U6
 hU/V/7f4hpz/PO2Snv7fF2tbrq1l5CgbxdhIg7k+MJ7VlN0cg1pjuvTlQgrnG01VC2
 fa684sa8inyLQ/+ll1hbR33KNfj1nB/2yvV13DWOwdUEKlRd/xOw2IOmmIJD+Jk8DC
 aST0gOrF2McJw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 68CBBE7399B; Mon, 11 Apr 2022 09:50:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next] net: ethernet: mtk_eth_soc: fix return value check
 in mtk_wed_add_hw()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164967061242.14330.11429373282379564824.git-patchwork-notify@kernel.org>
Date: Mon, 11 Apr 2022 09:50:12 +0000
References: <20220408032246.3089403-1-yangyingliang@huawei.com>
In-Reply-To: <20220408032246.3089403-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nbd@nbd.name, davem@davemloft.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_025016_622870_F2DDF160 
X-CRM114-Status: GOOD (  10.69  )
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

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 8 Apr 2022 11:22:46 +0800 you wrote:
> If syscon_regmap_lookup_by_phandle() fails, it never return NULL pointer,
> change the check to IS_ERR().
> 
> Fixes: 804775dfc288 ("net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> 
> [...]

Here is the summary with links:
  - [-next] net: ethernet: mtk_eth_soc: fix return value check in mtk_wed_add_hw()
    https://git.kernel.org/netdev/net-next/c/b559edfaf3f3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
