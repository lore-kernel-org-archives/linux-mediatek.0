Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB116C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kh2lAOzSIUX8YVPAldatrKMab7Qr41pdKDAEcJsqDl4=; b=c5W4PNP7EIRKFk
	rs+FWaKz9kJn1/fmo07U9xze8ltUF3taiQkbcJfT7vt52zxQqqDFEUjDL3tCyqaBqIa0Lh23xlry0
	Y9lpR8Azqmf/BDDpHGZUrDKaeJrRiK8vk0xyJJIRW/tjeBYONqrn2G/Sx9f2nCPCxlPcnVg5dDviP
	SruLL0NGieYHQZR9lk0CuI97hq50161PZ/eVbmhzwsoy89+6mUPdNS5REknfOzXkI6hqYzsjpPOe2
	n896x67vZ7ezoDXkZkSTBIp82hvOthm9xvG5C66Z8WUJA3wl510nIW4XpcrK3Q/gmsYVc2Cjc0E8v
	3pFWweasjH2xPOZGWNyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nivz1-0098HK-7a; Mon, 25 Apr 2022 10:30:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nivyy-0098GZ-An
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 10:30:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFBD860EBF;
 Mon, 25 Apr 2022 10:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A691C385B3;
 Mon, 25 Apr 2022 10:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650882612;
 bh=wWIX1apbskup/nLGSVf9nbG0MrqeHol19feA6EoDbOo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bL8s6lKWgd4xPZR+ZeyyVUakMCzBy/GnU8eLGFJctb3lEo0DbTuIP7LlwBRVAuGYn
 WiPL3yUeO3YQ/VO/zPrYnUPlbaIxoE/ErV8DOSTxO1c3nZ1WBHQZk2DJNH6vO6GN/p
 n2BqINkW3Z4XPxlZbLbQa+WNpH/DQ7kzu7YzAo8Vvv7VCtbvKnWJr4GdJDbxLLJtt8
 8iQpWiVjnmEC7matftaJXZD8GtZ9MuJsaBF9TSE4dBR/ZdLSV/d/QZtQZq/VY5RB6o
 vvYraZpgy70SeqSNNP7Xh5Pd2vLwdQk5GrVSbCEfS7cE1fRBISU+S4pUj7hSNJs/Rk
 RK4dqsxfbDphw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7D145F03841; Mon, 25 Apr 2022 10:30:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: add check for
 allocation failure
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165088261250.604.9330173633100783147.git-patchwork-notify@kernel.org>
Date: Mon, 25 Apr 2022 10:30:12 +0000
References: <YmF87nnzwiJC71k6@kili>
In-Reply-To: <YmF87nnzwiJC71k6@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_033016_450881_A80325A3 
X-CRM114-Status: GOOD (  10.05  )
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

On Thu, 21 Apr 2022 18:49:02 +0300 you wrote:
> Check if the kzalloc() failed.
> 
> Fixes: 804775dfc288 ("net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_wed.c | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - [net-next] net: ethernet: mtk_eth_soc: add check for allocation failure
    https://git.kernel.org/netdev/net-next/c/a00e41bf2f47

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
