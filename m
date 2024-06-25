Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53393C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 13:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XMlEJepQs8eWMc4W4SjmYiy4yUhWDaZbB4T/ecmghU=; b=zAts+rk6RxRxR0l3mM5a1ArPlv
	JxXWiBahATEf9Cief19Mw5V+Id5O76Y0Qb5dBUeElEyc8+lperoKIUEaks6DlxhiZAyUmNlFZ2vkD
	fiyf9mIi3l2P5ibTI1RHiIgtXa1ZEw426geDZ2NGw6ji03wYPnOGQPe+27tYqxXPfeD/lDNRqTUJg
	xCOjS7Qc5Ko4teurEhItmCOyzGeisrnaqsO/Z0UPnVU17GC1brZCy+aS196ejHyA1M+99smM0FXcR
	hGLxkMFj8wBWi2XbT/A6Fg3LT0NAq1pMhdv3mzMv1il/HuL4xGYxl+VLMs0EKkSTnq3aqNqdleVAF
	t7lpWHbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM6PX-000000031oE-3L9O;
	Tue, 25 Jun 2024 13:40:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM6PQ-000000031ms-3T6x;
	Tue, 25 Jun 2024 13:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E0F87CE1AF6;
	Tue, 25 Jun 2024 13:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DE51C4AF07;
	Tue, 25 Jun 2024 13:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719322829;
	bh=bGu3K0PSd3D4kR7zfKQqykYHOv/3l6O8xqGzMibxHfY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uUOUb7iMVtani2kfVm1cCQ2Qq9V37OchJFFAvqu5Qpci07799p/WeElNNjjvVrL0W
	 905vvoZ3XVA+DO2Arnlvo4ZGztz49f3dLgvhHXJfg03INp+GoDus59vXmikd+YFucN
	 8eswVH9npRe+sLZCe5JBT01O30W2TWXicH/eFVyzRmDw5HVDUeMeP+AYrnLw6bNbfu
	 3qhwP8flSRftfYRsjxe4lpOJAXSLYJJ2z62q2GTc/xjudLYWRDzawkcMa7P9GD5fgy
	 rTQHxNW/o6L5Pe3WTI8I7xWIhK0XMsjQxybsQg4/NfK8WYki50aK2PwiXsO7Rap2YY
	 IHMeXWTEWHgtQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 52339C54BD4;
	Tue, 25 Jun 2024 13:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: ppe: prevent ppe update
 for non-mtk devices
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171932282933.23951.10092690151381575278.git-patchwork-notify@kernel.org>
Date: Tue, 25 Jun 2024 13:40:29 +0000
References: <20240623175113.24437-1-eladwf@gmail.com>
In-Reply-To: <20240623175113.24437-1-eladwf@gmail.com>
To: Elad Yifee <eladwf@gmail.com>
Cc: daniel@makrotopia.org, nbd@nbd.name, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_064033_129646_C28ECE8D 
X-CRM114-Status: UNSURE (   8.84  )
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

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sun, 23 Jun 2024 20:51:09 +0300 you wrote:
> Introduce an additional validation to ensure that the PPE index
> is modified exclusively for mtk_eth ingress devices.
> This primarily addresses the issue related
> to WED operation with multiple PPEs.
> 
> Fixes: dee4dd10c79a ("net: ethernet: mtk_eth_soc: ppe: add support for multiple PPEs")
> Signed-off-by: Elad Yifee <eladwf@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: mtk_eth_soc: ppe: prevent ppe update for non-mtk devices
    https://git.kernel.org/netdev/net-next/c/73cfd947dbdb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



