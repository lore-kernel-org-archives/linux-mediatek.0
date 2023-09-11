Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C18EE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 09:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94kiPKddWyn6mEWB8Bec5OKdqR7Ec0MQYE44GJwpk8o=; b=UgJEHjVE8K1dC91R8LgyACNfPT
	LG2hhMyYOcT0mqqca0m9iLpjpPWTf+nA24yQhEr7ByQhdqB9k3zuyt9CnAxhGJqXcX0FHoPY0fXfA
	u8gdsHModlHLos5CpmWMJH1KpLowuqMk88PFtU7IzsbdmnRVPYRjbyxOXIrcLkvgiQjDogJwQOsiR
	OObtMARKjgLln0eEp5KCuj4pMUFqoPG1tR+whzJorBMrKGvF0Of/KA6nJA8/3gyNSErsGZ5Hxh9A2
	h1kMv+U+ek22Xz8w5VNL5y8d4tbwlomBVtHCzgEQUYyxmASKz8l0nqIY6BnZH4Sl76MesNjAYqvmS
	sevLiykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdPD-0002DM-22;
	Mon, 11 Sep 2023 09:40:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdPB-0002CW-03;
	Mon, 11 Sep 2023 09:40:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 43066B80ED6;
	Mon, 11 Sep 2023 09:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2922C433C9;
	Mon, 11 Sep 2023 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694425226;
	bh=VexeRoFIErq8J/8XR03dPblD5jykwUeFBd2AKAgeJqM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iD8Gs+/zUl7AJMEAIqzv4fLwwsC/hjuq+KuN7Yjv3QLFuQmkjZLawgQUGB/P6UAnC
	 GlsV01t+ReHoEO5R23c4od0MQA4mS58cI7Mio6nU++NieWhV3xKLAMHUN2hfgQbDBM
	 5fM8ghU0AMeSNGQcvkkCfjo56KwB994dDDJXRoLrzIEy9Fa2Z42+7svf+CT/5cV5bV
	 PsEtAOqX8+5elt/qZxW/PTIxSG2zNL4UZy/b1tG/W6fakeDbh9UYCRl42oaZ3r624z
	 63oNifE/zTko5AqRQIPfAJyXDluxsx6KYcn/lsNKRZQ2GybM0oA2h1ygKVnbJBtcLD
	 zGsGnsAj4DIsA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D6F1BC00446;
	Mon, 11 Sep 2023 09:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: ethernet: mtk_eth_soc: fix uninitialized variable
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169442522587.29871.12263337568524186830.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 09:40:25 +0000
References: <30044cf16ff83f73e5ef852c25682e9fde63af51.1694376191.git.daniel@makrotopia.org>
In-Reply-To: <30044cf16ff83f73e5ef852c25682e9fde63af51.1694376191.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: dan.carpenter@linaro.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_024029_204876_925A59EA 
X-CRM114-Status: GOOD (  12.88  )
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

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Sun, 10 Sep 2023 22:40:30 +0100 you wrote:
> Variable dma_addr in function mtk_poll_rx can be uninitialized on
> some of the error paths. In practise this doesn't matter, even random
> data present in uninitialized stack memory can safely be used in the
> way it happens in the error path.
> 
> However, in order to make Smatch happy make sure the variable is
> always initialized.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ethernet: mtk_eth_soc: fix uninitialized variable
    https://git.kernel.org/netdev/net/c/e10a35abb3da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



