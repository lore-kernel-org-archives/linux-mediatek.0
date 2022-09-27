Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7889DC07E9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJIm3MvMXuWT1kQS5e3XLmHW34SmVlZK5PxcQ0gr/DY=; b=KJpGLrwAyZLBxwUx97U8P1Dd1E
	JPTHwwCiBGqbHPNxb/eooPOFVEwJAj6QWqwSE3lFJzQzbpLHxnqUUuPAmFK9fa4V8A2Sq21wFMFO4
	sW4NQf9/Ak0ps9zH3WvrBQezQCotUNA2V8I+2wyDVaGhvO9oBugp1SMvE9hK6P/SbccDZc9vZ2oqm
	PUaDTjbHCRnHGexHHJMQ+3EF/07hNJndKz8bM8L2v7AwdjUD6FQVhQsr2nggELmwkiYk2BEliwWFy
	QveA2OrJ4AksJ+Th5AcRov7rHOvwzL39Jigf3qfa92RxUSSRV0STKhYv82oCtoPFwZF3q/IMWCogv
	LhSRHvUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odBui-00BL70-LS; Tue, 27 Sep 2022 14:50:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odBug-00BL5K-Bv
	for linux-mediatek@lists.infradead.org; Tue, 27 Sep 2022 14:50:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 675BEB81C24;
	Tue, 27 Sep 2022 14:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 876C2C433B5;
	Tue, 27 Sep 2022 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664290216;
	bh=ZlV6LPLiWVsIJiMf59cDqov1CVvefjDoNUUzrnkzvfQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LbiBBpj5/A1juKoGTxPMQCf5y2Ai7oF0RddTQ1BqpISYxP+Kl514IYpDoc7hArh32
	 V4rApstKg/upBhuHkIhiP9ONkZK/ALcS/7EmlqxJlLCHlxKuKpI22qZjivNztW0JqD
	 WFSL+Sbn2Bx+BRnTWk7trdptGQhqGlbNbpa5ZzZazFskVbhxNktAScR5vykuz3VUH4
	 /+sRyZGg2HEsQV7B6geGgFst9tvTisKXkDcWn6sWaLf+dw7JG5AVksYsAqkaZo9VDl
	 S87xvFZE08kIgVB8LkSEGuYGXbN2zsA4dHRzbHm5AaWXySIpQVFe0du9UmUsLpBHcn
	 RbwDl7MV/WjYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 71F5EE21EC1;
	Tue, 27 Sep 2022 14:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] net: ethernet: mtk_eth_soc: fix wrong use of new helper
 function
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166429021646.22749.6763418787282082138.git-patchwork-notify@kernel.org>
Date: Tue, 27 Sep 2022 14:50:16 +0000
References: <YzBp+Kk04CFDys4L@makrotopia.org>
In-Reply-To: <YzBp+Kk04CFDys4L@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 lorenzo@kernel.org, sujuan.chen@mediatek.com, Bo.Jiao@mediatek.com,
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, ptpt52@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_075022_574053_82FBBC89 
X-CRM114-Status: UNSURE (   9.97  )
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

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 25 Sep 2022 15:47:20 +0100 you wrote:
> In function mtk_foe_entry_set_vlan() the call to field accessor macro
> FIELD_GET(MTK_FOE_IB1_BIND_VLAN_LAYER, entry->ib1)
> has been wrongly replaced by
> mtk_prep_ib1_vlan_layer(eth, entry->ib1)
> 
> Use correct helper function mtk_get_ib1_vlan_layer instead.
> 
> [...]

Here is the summary with links:
  - [1/2] net: ethernet: mtk_eth_soc: fix wrong use of new helper function
    https://git.kernel.org/netdev/net-next/c/fb7da771bc43
  - [2/2] net: ethernet: mtk_eth_soc: fix usage of foe_entry_size
    https://git.kernel.org/netdev/net-next/c/454b20e19322

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



