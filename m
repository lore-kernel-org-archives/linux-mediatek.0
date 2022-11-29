Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CA4C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 10:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P333UHY+O0jMJ1DqFLSjAomhGD9nGwYJsDScNHQ2400=; b=V9dgA49RU5ubjbcA9V6hZz4VJn
	j3IXg3M9yHgS/olPqBYI1yGiCKHi7YCw7Io5NREbs0QKfUfxM27aR7F9BpKMzZbcpCagVWuqIFUwe
	A4ETa2XRJ9vzRf6FolvDWvuyz2CRUrEjir0rt6J0+2JMLbq0CBA5f6CWfEVA9kE5VpGBt34TPE6rf
	YaPdxPWN6/EOoG4ty9jfRPztbFdjBJOFlpGVF5ubfRC3i7T0BJUh8DBWAwJqRFgCjLeg8GPEBMbTm
	oBJGmCKSjrFuQ5p002kvR0+6Wzqs0kfyMoMndleqBXkDhqWlZmOC/radnZElXBA2vWLLjLNbLf9M4
	CCf/nsOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozyBx-008MWI-Ek; Tue, 29 Nov 2022 10:50:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozyBu-008MVa-Jr
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 10:50:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 40E29B8125A;
	Tue, 29 Nov 2022 10:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03E0CC433B5;
	Tue, 29 Nov 2022 10:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669719016;
	bh=GG5Li7PCSZhVOrt8aMqLZLPn+/RbnpjPbWLk1rZ4jAw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AO3sQuYqQoRduMdJd0t+ZbjkVTUJC094zsK9+jGfgO0/fcSdoJmyClenvwrkTo+Zx
	 NlUat8MG1URon2sGIe7+w+EyAqror+Wgqu1lQrwnjwYimr13MG92ElAnagNQmAAWG2
	 xTqKb5umyxPd9KIs7HRobvl1F4gbZgDdqQm1mKUBQlQ5IgA5uE4amuE35UhpwBqR4r
	 iHAao2ltPSR1M5cefltnIkuXDhgQsEMGnrt2MVJuqKlLzMFCRzjOCEp0nQCVPxflFq
	 RmL66nqoVxrJCoIsK6MAXLyrb7LTGENSwHQKLDmDF37EMWch0+O4qs3fm2KuNr+jWl
	 UdaCLWHUM0n2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DA1D9E21EF5;
	Tue, 29 Nov 2022 10:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next 0/5] refactor mtk_wed code to introduce SER
 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166971901588.19778.10630700860391594929.git-patchwork-notify@kernel.org>
Date: Tue, 29 Nov 2022 10:50:15 +0000
References: <cover.1669303154.git.lorenzo@kernel.org>
In-Reply-To: <cover.1669303154.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 lorenzo.bianconi@redhat.com, sujuan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_025018_820676_144B10B8 
X-CRM114-Status: UNSURE (   9.93  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 24 Nov 2022 16:22:50 +0100 you wrote:
> Refactor mtk_wed support in order to introduce proper integration for hw reset
> between mtk_eth_soc/mtk_wed and mt76 drivers.
> 
> Changes since v1:
> - improve commit logs
> 
> Lorenzo Bianconi (5):
>   net: ethernet: mtk_wed: return status value in mtk_wdma_rx_reset
>   net: ethernet: mtk_wed: move MTK_WDMA_RESET_IDX_TX configuration in
>     mtk_wdma_tx_reset
>   net: ethernet: mtk_wed: update mtk_wed_stop
>   net: ethernet: mtk_wed: add mtk_wed_rx_reset routine
>   net: ethernet: mtk_wed: add reset to tx_ring_setup callback
> 
> [...]

Here is the summary with links:
  - [v2,net-next,1/5] net: ethernet: mtk_wed: return status value in mtk_wdma_rx_reset
    https://git.kernel.org/netdev/net-next/c/b0488c4598a5
  - [v2,net-next,2/5] net: ethernet: mtk_wed: move MTK_WDMA_RESET_IDX_TX configuration in mtk_wdma_tx_reset
    https://git.kernel.org/netdev/net-next/c/92b1169660eb
  - [v2,net-next,3/5] net: ethernet: mtk_wed: update mtk_wed_stop
    https://git.kernel.org/netdev/net-next/c/f78cd9c783e0
  - [v2,net-next,4/5] net: ethernet: mtk_wed: add mtk_wed_rx_reset routine
    https://git.kernel.org/netdev/net-next/c/b08134c6e109
  - [v2,net-next,5/5] net: ethernet: mtk_wed: add reset to tx_ring_setup callback
    https://git.kernel.org/netdev/net-next/c/23dca7a90017

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



