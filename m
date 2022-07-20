Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46234C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 00:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DymvObXYV3LcxcQgD3ktsO1zlUqyayhsyYH4z6SLaQg=; b=VRz5o+SxcZ1cIw8ofqQ2uvjKLA
	o4d8JmIi1U8tuSVo78toOLNgyW8zzG1LnRfgQOF+u7eCjYBOzoduYWhvtF7LXi5cdRT23KfGX3PMT
	rWTimVnE97WFxxmgQfS4s6GSihWyd7pWqVdXk3t12yUxkXsJNpdADuqu6KKKzu9dOXHzPOoHY1Igi
	hWKYIzjudWTFFzHytyJD8m1uDF/11yrKJ91oUoN6ZyFPr5kfQmFFhK8Mn/y1wY2lUgCRr/jwcgWN7
	lTlZkLxc4qw0x9MHyx2l+t39HVtDlsgjnTVoU7OohNCQqRfPmxbouASPMGW2f3TDKX/5tmvT6X46q
	DddoC3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDxlE-00F5Bo-Be; Wed, 20 Jul 2022 00:40:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDxlB-00F58C-A0
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 00:40:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A219616DC;
	Wed, 20 Jul 2022 00:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C80CBC341CE;
	Wed, 20 Jul 2022 00:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658277613;
	bh=rKl6+n8U0dNHbTkWDeG4PWDZcTMCHPPupA9tyCjbTOg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Cc14G45xNTO1HvktI9I7MQEwB6JQW2ATKXy91DZDt77xDfQe1YHucDTUcYonRhtJH
	 dDbzWTk3wxO7VUs6YLMxbOCOPgGknRjwtmVcJg3UK5akqUeE6jjvE/dOQqNxMapx6k
	 XgaBKNo14jjUKpYNrBgdQE8rJGX9hes3uhAHHJn9yvLoVWlyXUPtACOT0jDVuULIEf
	 UWZ53iDfX1VvjWUBfiEidsqhgW0a2bYNgu6lIf48TsCvBTEKOQwVvT0tXSVq1U0cS8
	 oqySyUwdQt2dSs4NRkhblbDoAPxOrulSzhuT5nw/yvCCmUddhhRySmU0PUoDCfIPmA
	 eCyllgHsrqJ6A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9A6B9D9DDDB;
	Wed, 20 Jul 2022 00:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_ppe: fix possible NULL pointer
 dereference in mtk_flow_get_wdma_info
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165827761362.10063.15701613419779196006.git-patchwork-notify@kernel.org>
Date: Wed, 20 Jul 2022 00:40:13 +0000
References: <4e1685bc4976e21e364055f6bee86261f8f9ee93.1658137753.git.lorenzo@kernel.org>
In-Reply-To: <4e1685bc4976e21e364055f6bee86261f8f9ee93.1658137753.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_174017_427833_CD112A47 
X-CRM114-Status: UNSURE (   8.65  )
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

On Mon, 18 Jul 2022 11:51:53 +0200 you wrote:
> odev pointer can be NULL in mtk_flow_offload_replace routine according
> to the flower action rules. Fix possible NULL pointer dereference in
> mtk_flow_get_wdma_info.
> 
> Fixes: a333215e10cb5 ("net: ethernet: mtk_eth_soc: implement flow offloading to WED devices")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_ppe: fix possible NULL pointer dereference in mtk_flow_get_wdma_info
    https://git.kernel.org/netdev/net/c/53eb9b04560c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



