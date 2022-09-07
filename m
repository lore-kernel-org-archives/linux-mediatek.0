Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEE2C6FA8B
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohHtM9MhAKTn0RErXY8gnxKmiGRcwUT+3R5Ed3LfUg8=; b=cEgMt1A+bj5geTI5lJLJiHKA6O
	JGfQSxJeZ9c9BLrf/YED61LQ9F8b38Ev/wDtBRxQQmMxxUJEjF01snntyA0ZXQOyjDhzUbwW82kZp
	ogrwozOlqXPhEc9t7TkLu73pojlFy+dg5cNnpouF2mXqHBPOCFf+lM90ZOwxdbCrft11rHUIYvwaA
	HhwZx4XyhSZQLHL2aZsTqlheksLeN4P0qwbRExG+v0B95rwmA4oAYPc8aUSpjP+B57pl//8kRXvkx
	lAP9tr1repzPBsIHSKqNOlcEKSsM1QCoYI5uiY7r5plBEqGVzsvkizSEtzyO9Kxw8wBBHAAU2dq8L
	x6BWLm+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVwXt-007A9M-Gw; Wed, 07 Sep 2022 15:00:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVwXM-0079ga-Cj
	for linux-mediatek@lists.infradead.org; Wed, 07 Sep 2022 15:00:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C4B9261978;
	Wed,  7 Sep 2022 15:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05660C43144;
	Wed,  7 Sep 2022 15:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662562819;
	bh=eB7M5NbEB3N9/PUQtZ8MqWdvyG/Yra/aItVYNkz14MI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DwwdyH6v85sCT0HX0XFMTfuvaIjJptl1nwl3KccL3SyoQSxc73DmStY8W5dsvS2vc
	 k405xITuUBqtCpz/MexFB0kKb5cRbJjjpcHen55HGnG4VDaRRlhHbiahc006ziDK9F
	 JTuNKNE14TSpeWGFhgmTa4UO50A+k8c15iaAWoDCcN2FZcX0EXeXL/UzD3pFF1vmHD
	 MFB/dX5Un+E6qYrr93C026rnSnWzHUT3db/8SkPS3xSed7Cck5FMchMR1VSpdeEKlS
	 /blcBJVZAOSNiU+xz0X+uQz187AsREXktV8b2kJT37dSw7BPUADEljDra57xZfho61
	 SDRZvEgx6AkMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DC7E5C73FEB;
	Wed,  7 Sep 2022 15:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: remove
 mtk_foe_entry_timestamp
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166256281889.26447.7824368670296489846.git-patchwork-notify@kernel.org>
Date: Wed, 07 Sep 2022 15:00:18 +0000
References: <724dc466880787ae099ea037013cf5c9537128b6.1662380540.git.lorenzo@kernel.org>
In-Reply-To: <724dc466880787ae099ea037013cf5c9537128b6.1662380540.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_080020_514592_847073BB 
X-CRM114-Status: UNSURE (   9.84  )
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

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Mon,  5 Sep 2022 14:46:01 +0200 you wrote:
> Get rid of mtk_foe_entry_timestamp routine since it is no longer used.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_ppe.h | 11 -----------
>  1 file changed, 11 deletions(-)

Here is the summary with links:
  - [net-next] net: ethernet: mtk_eth_soc: remove mtk_foe_entry_timestamp
    https://git.kernel.org/netdev/net-next/c/c9daab322313

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



