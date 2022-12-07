Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AE1C4708D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 11:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4PC6F3TPqQ/9y14PTJkAUU2k1XYo1J/EdiIyqF7Rvc=; b=hqKIRaOyh2P5cJfr/SivyV2qPA
	rx3rahPtoapvnvMRUW9lM9ebBkxv/DW8X4t/pj95BwHDymc09Q4RpjKr4Jpxg8S2tmMu/FGJItEC2
	X5Nam5ta75c46rha3ZwFKf+wYQJkUzsJ8Cgxd0aMagrHGq6/hYLs7yMBPPdKRktgcKGEIau0Yebq7
	ajjcf4342WOmv3GOfBrRFNPZbePWj69WG5FEfXsIkCtYuC38SEgs/vSvxwGsgAW/nFEyKpsjS17Ge
	h6pt9SvkZvV9y60cnyhRtD3JELR/1/J6LsKBZmcM64krgjVOgqOTWn+vV9YZjYya4NX5hoZIY7pzT
	NQGH7V2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2sBO-000MBj-QQ; Wed, 07 Dec 2022 11:01:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2sA1-000KWh-Bo; Wed, 07 Dec 2022 11:00:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA7A36148B;
	Wed,  7 Dec 2022 11:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2899EC433D7;
	Wed,  7 Dec 2022 11:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670410816;
	bh=Mb5ZY9+Lp1JfyIe7OBAqVnpoZIAGDHdVud0v3NlHJ5g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Y2eSbZMzYRWzzfRgoLVq5nvHB+4kjOJGCzOPeEweFoV7tFaE87yMabSI5l29rlMPT
	 oU7Q3S2OTHSbBJIvG/JmnHnBk0CCNU7UsuUnQZEFSNgyNm0EDoNRjxEWQhgjvQRM1K
	 e1f4PdYjsKqMihr3jyCZmLzQqDCJRSkw/QKoEuzqEyRKekQ6wRgSLngDCwkzkcXN56
	 xEXVxned4ZQGSZrCZCRAImiwecIobDAsgxep1xPQlZjX7usiLrd6RuuJcjjAufEe+L
	 5tgmx3ik37p+L/IlQvRWnZ1WKGrMKUIz7pINftMy1WG/cFokM2qbIaX0d8WvMr3otu
	 DHvUrJqSzbqgg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 160EDE4D02D;
	Wed,  7 Dec 2022 11:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: ethernet: mtk_wed: Fix missing of_node_put()
 in mtk_wed_wo_hardware_init()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167041081608.7212.15407463858879760365.git-patchwork-notify@kernel.org>
Date: Wed, 07 Dec 2022 11:00:16 +0000
References: <20221205034339.112163-1-yuancan@huawei.com>
In-Reply-To: <20221205034339.112163-1-yuancan@huawei.com>
To: Yuan Can <yuancan@huawei.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, sujuan.chen@mediatek.com, leon@kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_030021_494492_19E2F5E7 
X-CRM114-Status: GOOD (  10.62  )
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

This patch was applied to netdev/net-next.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 5 Dec 2022 03:43:39 +0000 you wrote:
> The np needs to be released through of_node_put() in the error handling
> path of mtk_wed_wo_hardware_init().
> 
> Fixes: 799684448e3e ("net: ethernet: mtk_wed: introduce wed wo support")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
> Changes in v2:
> - Replace IS_ERR_OR_NULL() with IS_ERR() to check wo->mmio.regs.
> - Add net-next tag.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: ethernet: mtk_wed: Fix missing of_node_put() in mtk_wed_wo_hardware_init()
    https://git.kernel.org/netdev/net-next/c/e22dcbc9aa32

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



