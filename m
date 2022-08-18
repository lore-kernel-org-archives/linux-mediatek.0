Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA93C00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 05:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTuHfbXs0QmE40Bc4Xwkur0YRS5PKibKM7Vb3fy2nFo=; b=iWwABm9vxHIeraEhmDImhvtohy
	XiLBLhOb+d6PpxzWDwtKnVq+BICLXThMe/hp2G8zKpuaz/wDOnkTxZo80PrYBwA60K1PO2yhdKMe+
	mXsJHy7U3a2/ooUERB1boFI8wtHTFTnAHAr0dQL60WSkvItsaDbYBkpEEIhKVivggKQrKYyQfaq6V
	AAaJ4rSbKYijJ7hqe9xreCyqBjU26StuKfM5mgv2aKcTpYeDWsp99Oa83j1SzkQwwilaTncyZJskM
	eRuz6Ua0ayT8RiEjnBapczNUtElUDi4I56s/QKzBSr9Cusq1wc4zQ3TJN4do+vMJfgI3V3FcpRnTY
	YfGKig8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOXxj-00FpBc-Ud; Thu, 18 Aug 2022 05:20:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOXx6-00Fnrv-51
	for linux-mediatek@lists.infradead.org; Thu, 18 Aug 2022 05:20:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF24661631;
	Thu, 18 Aug 2022 05:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD7A3C4347C;
	Thu, 18 Aug 2022 05:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660800017;
	bh=+pmM2m9DMl/C1daRqiT0Be24YlHAmpF9wtxIQnJ8N1w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RJMFjwbJgOOyL+cqtQo9NSEyu7o3Q1+HtXnTM4b4PEmBu8mgT2wcix4YN5OAQOx7C
	 onmhzgERUoK8IhUmBxtAXC6eUOfEgelY+EBjka+AUarZqzEnVj0lZwobqDTOmt5gqO
	 WWbzALawVG9aC0L5VdSl6Ka1yphCjpev4fSpvbOq/DyNKQ9NeDGPS21WMDPzVkDphs
	 Tmnh5O9IZhUh5qOjSbbbsN+4bHa5Qs9hlu+a6eXbvCOtWXTcyAakF6Y0na8N4RvPRf
	 itiqbMNr9N5WMm/KjO87LODOEOCfrJCLEmbVyn4Y9WYcb44p9AvQwpiK54cETH6WYA
	 GkRVipDlp5FIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C056E2A057;
	Thu, 18 Aug 2022 05:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix possible NULL pointer
 dereference in mtk_xdp_run
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166080001757.8479.14902193480615265805.git-patchwork-notify@kernel.org>
Date: Thu, 18 Aug 2022 05:20:17 +0000
References: <627a07d759020356b64473e09f0855960e02db28.1660659112.git.lorenzo@kernel.org>
In-Reply-To: <627a07d759020356b64473e09f0855960e02db28.1660659112.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 ilias.apalodimas@linaro.org, lorenzo.bianconi@redhat.com, jbrouer@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_222020_281043_1867E2A9 
X-CRM114-Status: UNSURE (   9.17  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 16 Aug 2022 16:16:15 +0200 you wrote:
> Fix possible NULL pointer dereference in mtk_xdp_run() if the
> ebpf program returns XDP_TX and xdp_convert_buff_to_frame routine fails
> returning NULL.
> 
> Fixes: 5886d26fd25bb ("net: ethernet: mtk_eth_soc: add xmit XDP support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: fix possible NULL pointer dereference in mtk_xdp_run
    https://git.kernel.org/netdev/net/c/a617ccc01608

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



