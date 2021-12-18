Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA80BC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 03:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/RXdRTkU6/KpXw+ZTW7eG/aImfJJ7AiFyZbol70Pxk=; b=GvwJXVpFRUmx0s
	LNGEnGFB5GYJTdo2G7IqKLDNDSeMvuGrrzeOj7x+LRz22qzuWtIdvRASK0W2uGJcx4g6N4JrFZjia
	o/yYkM+X03n/fK8SH6ZV9PJxcYidlzy3otrYYL8I6TrNThrumIccNiI+nTBkw2nIBUclV8ilJju2+
	ZV9IRjsaqeKX0vwuEX9kEYbYcstokIWccAk5C0bcPN7oW8BWEFzPA17BlPiXqENk+3iTtYdtZsaoh
	jj0UzoYNNHSF+0qiBGsLIxSaiCeZZ0JTczoey+9LABe/siKMZxBlEPD37XRYbWVHRcW92vF+4+rVa
	AKuffCiT6oZCge+XHmBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myQQS-00Cupp-5A; Sat, 18 Dec 2021 03:30:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myQQN-00Cuo2-Ii
 for linux-mediatek@lists.infradead.org; Sat, 18 Dec 2021 03:30:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C4165B82B85;
 Sat, 18 Dec 2021 03:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 933C5C36AED;
 Sat, 18 Dec 2021 03:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639798216;
 bh=ZikG/15coMre1pXztLPrHk0ZpmcRbgYIZXdmNJXzSVM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=niXgulO1aqK9TB/yK5VZZ7Oztzpj7ZX22g8gegYBVbo1tXyn5G7v3ice6BpmRMqsg
 FTzmdUugxXVnGpc045cw/NwtTzeUFZ59GPYLnBIk69bN6nG2Ba9yINAl71gCejq2iz
 BEsY4wTt8xO2u1oRo7FsId65ltHmi6dx35d+uutJtA/pM7xWv3+Tapb0qWYf9vEcZI
 QusazQ5xBlvqirsukRrWFheRC8KNdVa4bSkztLQrMSDQurCDArnE+2dnj7fmF9m7Hy
 GVlKK6sG0UpY2GN88Su7DdFfsDjmEdFI/fF26q3otpWgD9Sk8BL9/v5RwPcdzq9Jyf
 hSVHVmj+gfQCw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 82F4D60A2F;
 Sat, 18 Dec 2021 03:30:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: delete some dead code
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163979821653.17814.5434717978147982554.git-patchwork-notify@kernel.org>
Date: Sat, 18 Dec 2021 03:30:16 +0000
References: <20211217071037.GE26548@kili>
In-Reply-To: <20211217071037.GE26548@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_193019_831470_577DDD3A 
X-CRM114-Status: GOOD (  10.21  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 17 Dec 2021 10:10:37 +0300 you wrote:
> The debugfs_create_dir() function never returns NULL.  It does return
> error pointers but in normal situations like this there is no need to
> check for errors.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c | 3 ---
>  1 file changed, 3 deletions(-)

Here is the summary with links:
  - [net-next] net: ethernet: mtk_eth_soc: delete some dead code
    https://git.kernel.org/netdev/net-next/c/ab9d0e2171be

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
