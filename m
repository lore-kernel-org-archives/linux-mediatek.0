Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4399EC6FA89
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 15:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuJFQ04/WJDow/vS47wtaF4O2eAOgIANBOhqiB4H2YQ=; b=UhCGQsVvNio8CT4FHmLc7b6fR3
	BJOEvLUUIhTEJlOqRMiRqmeOBgo2V3XyyC4bKenyK9tRmUDkfaLFs3397inojRhXvKG1Go39C0X7A
	193We0DnKblivKb69dANjqPmID2PLRx70E9Jtg8rnKDEyttxm6RDJdvMVnqa6fHd9chHOCFNi8pkS
	NPQVfYNOp2Lrrl+6AvxH/i7xsOi9CvQqkdfQ7RCVRLMpX0aSNVVQNUz8pZIcOLrGEl3FfEWWVtqh+
	NfUoKFAJUwjewPdYIkYxcp/EwE8yfA//hnO3E/dLxLSFrB0aSZbLIebZCSiYskTGGts4yU/mEx9Yu
	yi6QEDmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVwXy-007ACX-FJ; Wed, 07 Sep 2022 15:00:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVwXQ-0079hd-I9
	for linux-mediatek@lists.infradead.org; Wed, 07 Sep 2022 15:00:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id DCBFDCE1C68;
	Wed,  7 Sep 2022 15:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2775AC43140;
	Wed,  7 Sep 2022 15:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662562816;
	bh=R+OzuMU4jQ7Us9uToXClvGaNk03wy3tvRbJr386DNxA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YNloUyzoHaYTonq6z89AaxoYtU84Ud5uypXCMYBqv62SIye2/9d4wwAaz8HMIGlZ3
	 8J+U1XYXFsRU3KaLhNSvt6Y4kqthVDKdh7VjIBYo09PIeGW8UUvqVHDDz46UJ2IpF3
	 SF8Oal0TpVrR94qdz7WiD/Be4EVui2OfEUm5cqeQxsJn+casuxcpAICR5HmlFf2TID
	 ucMQGTklJy+o/+sWQz/HfLHFnDq9mpJHRbHvPOmktazEQHDJ/yWEykY8fY1zRqISpw
	 prJkNaqfxmm/XekEw6dRDDLnV7mRWITRfOthQGQSQDJloArS0noDzKTlmgPsw9Yk3S
	 rFRLj3LQFtSmQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 08054E1CABE;
	Wed,  7 Sep 2022 15:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: check max allowed hash in
 mtk_ppe_check_skb
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166256281600.26447.686694241748240905.git-patchwork-notify@kernel.org>
Date: Wed, 07 Sep 2022 15:00:16 +0000
References: <b9f18ec4dd40d53b401a1b9935999bf025f3357d.1662381450.git.lorenzo@kernel.org>
In-Reply-To: <b9f18ec4dd40d53b401a1b9935999bf025f3357d.1662381450.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_080024_813462_7A9F7235 
X-CRM114-Status: UNSURE (   8.95  )
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
by David S. Miller <davem@davemloft.net>:

On Mon,  5 Sep 2022 14:41:28 +0200 you wrote:
> Even if max hash configured in hw in mtk_ppe_hash_entry is
> MTK_PPE_ENTRIES - 1, check theoretical OOB accesses in
> mtk_ppe_check_skb routine
> 
> Fixes: c4f033d9e03e9 ("net: ethernet: mtk_eth_soc: rework hardware flow table management")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: check max allowed hash in mtk_ppe_check_skb
    https://git.kernel.org/netdev/net/c/f27b405ef433

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



