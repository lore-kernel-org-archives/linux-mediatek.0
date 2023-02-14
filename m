Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AC8C61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 03:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8q4rxldcdXAg0pLDf/ySYLldRp1q06bmVs0yxNzKV84=; b=O7BfgoPL805T5Q0wVNcS1EvA6n
	soWc95GDY1JcdZOsB2ObvUWRWvVxbNq5OMarxH1KQzFWds43Qd6wVHVeL0Fg6ktGqQtD2qGgyBEQu
	v7A6EMzWxyQvdZUdaYyiVwTTP0fcBFHJoLYASfYLLofyDosDluXoYLtGgpBKHLfK+yAykRV5MHYdo
	5Mg73m7kTJW9c9QXbiOfhDAUj6cEezKNLtdxU6tvQTHparCJbxfzv1Sc3o63cChBXaNx5QbFWeOL+
	t94FiL+wFMEtkZtt0E96dL0YYplW643PgD5iziRIFLo4w9sTTIGbL+oFXNUVS13u6datuTger+TJQ
	W2oTJFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRmKt-00HLkA-OQ; Tue, 14 Feb 2023 03:50:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRmKj-00HLiK-Vl; Tue, 14 Feb 2023 03:50:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 90B536140F;
	Tue, 14 Feb 2023 03:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9000DC433A7;
	Tue, 14 Feb 2023 03:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676346619;
	bh=n9qOiH0RUbj9t+6MFTaBCd3iC12UZ0ekk/x0pMcHtYI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TqugRf9U4rSu/UzbqTgMaSG1wAW12A2epaYg4QgsZsL1sq7lgqWoZn4qLetVgEFtP
	 isoR51XuN5rFekVkxVeLXDb1m0Y7rQ3vCsvQH5c1Hf39LPOEIF1/094Uf1tPBJENao
	 sWVN6V0bHS/hDPxhVrwZ5RY+rCY9KZn60gXU4l4eJclCNZhDbDdHoiQajL19jjXLO+
	 fase24yUkPLmrFzvvD7Fowc3rNi4frTp3ITainCRsGtYGty784OivbqkaB2XHxKaAw
	 UdSL/z8xcy4pUpnFxcK1Qp24HaD4Tn/0nbAKeBj0PV5MdvwjnS4w+XMFV4vrZrixOG
	 yHVvlwe2H1jhA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 74403C41677;
	Tue, 14 Feb 2023 03:50:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: No need to clear memory
 after a dma_alloc_coherent() call
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167634661945.22468.7891071719271483314.git-patchwork-notify@kernel.org>
Date: Tue, 14 Feb 2023 03:50:19 +0000
References: <d5acce7dd108887832c9719f62c7201b4c83b3fb.1676184599.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <d5acce7dd108887832c9719f62c7201b4c83b3fb.1676184599.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_195022_104597_7C393227 
X-CRM114-Status: GOOD (  10.32  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 12 Feb 2023 07:51:51 +0100 you wrote:
> dma_alloc_coherent() already clears the allocated memory, there is no need
> to explicitly call memset().
> 
> Moreover, it is likely that the size in the memset() is incorrect and
> should be "size * sizeof(*ring->desc)".
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: mtk_wed: No need to clear memory after a dma_alloc_coherent() call
    https://git.kernel.org/netdev/net-next/c/511b88fedab4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



