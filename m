Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F93C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 11:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2080NOICDiU573ll3qXAF7kjRqA7UeECkoPru3IQ5qI=; b=dJkgnCe7Rdcp8R
	zKOq/3Isb6IYA7FiP+BuduWUknzlWjYOutmue3LlnQ90iErJeKeuEHnLR7146zJb5WxCuJO++zXbb
	Qx3q94kU0CkW8geHfcsSeXqIa/WUiCceV1r1Q9LAL7+NtsK0UtobAGFlysfi0onyXbDQBrufsyMng
	5glHEG1S7fgky2blIRnbIV5ptkZh0CJ/xpOdJi3OLKpN3YSzkOTbLC6aGiD1geIRmyDDC1tXXBb4Y
	PI5mwMf6aOrNhpk7QflyE6lNBhs6MZ+QnBFGABwMQpIgyYC65pvFpfxC8rXZry2VQK6jybIfHVSza
	HD4sksguDtX7iBHL0nlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nebCT-000lDa-5T; Wed, 13 Apr 2022 11:30:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nebCQ-000lDH-EN
 for linux-mediatek@lists.infradead.org; Wed, 13 Apr 2022 11:30:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 574FA61DC2;
 Wed, 13 Apr 2022 11:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3256C385B2;
 Wed, 13 Apr 2022 11:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649849412;
 bh=D90fTDZe7BfT4jc2+kLrsrUEFwd8YCdsX7EuK7RNUpk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nYT9KO1VTDak1yoZnt3zP9HYLMPe0rcMMmAwQpSrKus/MhOxwIRlwunzAonvayEFt
 9hnGNW9OYvgWl3og00dQhMjJl1KkHVPuKyGF637Hb1GLLagKQwbRZ/vOQwuZWSdIII
 VhEY7SAib00IoC7VhZ4vg4Vx90BCvJtK0iI0731WzDaCvrxbquSuZJnxL8wLa2/NMA
 n+upndbcHlKvpIAsR46+Ues1W06pqyNP1J1+6b4+Yun3+kXOXmpZnjJiw5Xjh4UWpv
 gGIs25/Z/cInvLq9ZwHb6MpEYGm2D/+EPDZk5kHeXYxMR6S+/9Kjj/iwwvicRzGchn
 uv2HuEv6lzU3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8526FE8DD69; Wed, 13 Apr 2022 11:30:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: use after free in
 __mtk_ppe_check_skb()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164984941253.14313.10362987652351620258.git-patchwork-notify@kernel.org>
Date: Wed, 13 Apr 2022 11:30:12 +0000
References: <20220412092419.GA3865@kili>
In-Reply-To: <20220412092419.GA3865@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_043014_557124_12E032EC 
X-CRM114-Status: UNSURE (   9.50  )
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

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue, 12 Apr 2022 12:24:19 +0300 you wrote:
> The __mtk_foe_entry_clear() function frees "entry" so we have to use
> the _safe() version of hlist_for_each_entry() to prevent a use after
> free.
> 
> Fixes: 33fc42de3327 ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: mtk_eth_soc: use after free in __mtk_ppe_check_skb()
    https://git.kernel.org/netdev/net-next/c/17a5f6a78dc7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
