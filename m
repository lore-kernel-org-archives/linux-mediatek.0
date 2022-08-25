Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA0CC04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 11:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2ByL5+d6Xm938Zs5paMUvxYFihBGV/kgyBUTJzMrac=; b=vMML75xveNctK+hIoLgjRG7SQX
	HmDGjYNVDktmefbaodZEDTXkibNOpmDxi1dqpxBqz+3TUbraSAyut2C8Hd//rPE7w5leBbW7HcIPC
	muWY+8ZdhWro3TPGDxKMa9eMCG7cSHvAiwxrgdlSNNtddNfYOAc3Mg9NZhzvYLZsaWK+x6sF2Cgwo
	Q42i1ArRzmsB8bHKW+CgdKr9KV7tVIub/jjHIs2Qw5SaUsdg9/d3wbdn+cVBkf2PEMKUNKgHdW619
	Lwviu9q/vJaYDOcrrm6SSZNXksNL6LJ/5d5RAgfg4MfzraxrHe/RlRTvtIOYIibCOP9q1eGZxg3AM
	UuWfRSGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRBDg-00Co2K-Od; Thu, 25 Aug 2022 11:40:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRBDc-00CnxD-TF
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 11:40:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2394161AC9;
	Thu, 25 Aug 2022 11:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39911C43141;
	Thu, 25 Aug 2022 11:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661427615;
	bh=H+NOmaWZR86ntcxoWX0UShHEUJazXfL6KCc0YJjq2j8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E1u1IsT7u83jGEJGpS/mzcmB8k//ajrPR3JrqmKDYp2g3uSX4ySRdE2SmOyRFSd9W
	 aCF7YKWlsuI/6RGTIiAq6jfOTkNArCmRqvqo7vb7BckRc2+hraYcWVPPV9YBPtKsWh
	 +pBxlOYjUvLwd3xBuTymmbR8YMGviPkw8hzxYTP67mO3KWKzi8cjwOQn9JAw6OBlT2
	 BZygLDjInjuejlCWZsYj6n1PL+upi8e4XkB5eYiuOyjAQhylZT0AgzTEq+lYDwLDpd
	 B0z/GLeiI1qbPwaYCg7vzvXMYTtosIzuf339V356RWru7dsJ3Dk8MMC0iIG9GPXwi7
	 8i1hiFjF29iPw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 18498E1CF31;
	Thu, 25 Aug 2022 11:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net] net: ethernet: mtk_eth_soc: fix hw hash reporting for
 MTK_NETSYS_V2
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166142761509.23802.7187869473014741631.git-patchwork-notify@kernel.org>
Date: Thu, 25 Aug 2022 11:40:15 +0000
References: <091394ea4e705fbb35f828011d98d0ba33808f69.1661257293.git.lorenzo@kernel.org>
In-Reply-To: <091394ea4e705fbb35f828011d98d0ba33808f69.1661257293.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_044017_035493_C2FEB207 
X-CRM114-Status: GOOD (  10.39  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 23 Aug 2022 14:24:07 +0200 you wrote:
> Properly report hw rx hash for mt7986 chipset accroding to the new dma
> descriptor layout.
> 
> Fixes: 197c9e9b17b11 ("net: ethernet: mtk_eth_soc: introduce support for mt7986 chipset")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes since v1:
> - fix typo in a comment
> - target net tree instead of net-next
> 
> [...]

Here is the summary with links:
  - [v2,net] net: ethernet: mtk_eth_soc: fix hw hash reporting for MTK_NETSYS_V2
    https://git.kernel.org/netdev/net/c/0cf731f9ebb5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



