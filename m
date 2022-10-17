Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008EBC43219
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 08:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1qqUAlt8gGXRz93wXR8mv+QXd0D0Zf8/eg8c1tWXOE=; b=cig1ab20DgUs3pC3ACRl7mYsjZ
	rhQ3U3swHgeOzpSa3GF6r9MLc8zA0k9AFHOoDHqmaZ4eBf4seJ6dcbSyCLeo8Ce/z/H3erJxMuPZ9
	LNOuEXNkXsqvLNMO2yjBAR/cYVSPq25JBsn1I6LSt+8vQ3MDe2jEQaoMhnqJwPyJDd1QwGGttz5bJ
	2lokX8BvNgSK2EAQybZiO6LvvUn0wpvv4xUQHGMNIF18Z7I5tFTCLTlhtwmuUOg5WISq9m46cSv3h
	uJfBmM8Vm4KVzYFneASebU2IB8BO9gm5m+QbiMmCdGah5xQBAvOZQ9uR3qMLWbwPfBelG6wu2DUO2
	y2R9lO7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLfX-00999x-Ij; Mon, 17 Oct 2022 08:40:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLfV-00997I-GE
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 08:40:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3DAF860F3C;
	Mon, 17 Oct 2022 08:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EB9AC433B5;
	Mon, 17 Oct 2022 08:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665996015;
	bh=9xMMH3+lO0XQOoKqae/qjCXd9ADc3aVGICNZhctZVi0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bAuKy70Laxd/4iEBGZFtgZY1sbSsWhEtJ7ZRb8C2OI+wwxgC2eDUoIhLhyCUla/iV
	 3112gIbdDCsGhkLDbbJG2GBNpzLz+/TrPqmrT+mR5G/aVoP8ffWb8RRMrg/hAH2VcS
	 CjEPv3NVu3kUc0C9NewEv3/v+8YAix7fMQ04w2bNo5O13vjzzQsAdyj5GHW1tJwzpg
	 FbEdplJ4a8phF98SpecpvE0Xuf8D4rmhT8tuxfLys/Fu1jUXHKBbQb3BJ+vPf1C4fE
	 qfZYCqa5bsXKsMaH8Km5Unq/nk3ndfCeDgcHGxgCsXI7IMuFUJMJqwRLxh/nQhxt9h
	 ZHC8evbe2HiQA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7BC5AE270EB;
	Mon, 17 Oct 2022 08:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/3] net: ethernet: mtk_eth_wed: fixe some leaks
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166599601550.19223.16660356198196080947.git-patchwork-notify@kernel.org>
Date: Mon, 17 Oct 2022 08:40:15 +0000
References: <20221017035156.2497448-1-yangyingliang@huawei.com>
In-Reply-To: <20221017035156.2497448-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, nbd@nbd.name,
 davem@davemloft.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_014017_599362_260F49C3 
X-CRM114-Status: GOOD (  10.47  )
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

This series was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Mon, 17 Oct 2022 11:51:53 +0800 you wrote:
> I found some leaks in mtk_eth_soc.c/mtk_wed.c.
> 
>  patch#1 - I found mtk_wed_exit() is never called, I think mtk_wed_exit() need
>            be called in error path or module remove function to free the memory
>            allocated in mtk_wed_add_hw().
> 
>  patch#2 - The device is not put in error path in mtk_wed_add_hw().
> 
> [...]

Here is the summary with links:
  - [net,1/3] net: ethernet: mtk_eth_soc: fix possible memory leak in mtk_probe()
    https://git.kernel.org/netdev/net/c/b3d0d98179d6
  - [net,2/3] net: ethernet: mtk_eth_wed: add missing put_device() in mtk_wed_add_hw()
    https://git.kernel.org/netdev/net/c/9d4f20a476ca
  - [net,3/3] net: ethernet: mtk_eth_wed: add missing of_node_put()
    https://git.kernel.org/netdev/net/c/e0bb4659e235

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



