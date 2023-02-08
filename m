Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC311C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 09:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iBnM0lJ7e5aY+aj/pRbIeW6xRXzmZbyRhzRCMbkgng=; b=hdFDb4iXcgN5UCVxgUug4oXO5W
	va2rPY8OtXHypqe+MXUXwRvVrQ8j909QIKO5dG2jPEbF2nzu+0Gn9cbrx6fnX7Ctk79yALwhGkSs0
	Gi9M56sPTgD4/fKW/JVE8fBux+bGpmbZMK4j5TvIqjupnB4Eq86zO78JMzPS8AVoQbwe+SoAom66e
	8mp3jSDnBv109fOQxXheuH3Wch7SInGF601cAgGUH6L6WhGURNTQoXvSSkI6n9ZMDl3DAmay6s7jP
	7reul0QZ4gvNJnrkhke1EmYSW9PrGqafSFZVNIDSN6l6QzFAgfEQ8dcMsBbtuL3kSBfpsqLWFUtnI
	xXOwCgqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgXe-00EkMb-Nj; Wed, 08 Feb 2023 09:15:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgT6-00EhvD-NW; Wed, 08 Feb 2023 09:10:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 48D09B81C85;
	Wed,  8 Feb 2023 09:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8189C4339E;
	Wed,  8 Feb 2023 09:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675847418;
	bh=mKwEQs3d8N9Hm762gYytf6a4lLL3QA+GmVUHPzSV9qU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nb6zrV++HT6PG2GKBzbE8QqCR1HTXfJQYgc+ye801aV0fRBp9eJQx5nkcXlvYw3RN
	 4M2cuQeAzQbloMoJc7msrhIA0g20NENe2CK67TQT9Lkq/eXwAWkTid8i8BVEhnAVPN
	 DcQSa5eUpoaoiIomK0pvyo3RmXrIpojH7e8IXiOlrSnC68B4UtXlE2GOmyqoJlGsOs
	 j38vzLv9v9LQeihm61U9NmYQ379SahsfdMjictDydeD03cMLFBtdn1TVtCwEaGtjUI
	 PcnH0yKJdOOVtG2UdhtMlv9+5N3igL1q9hMkxswENaHfqWli9W0WBLmJ8pD74GRloP
	 TE+TPAMLKkHoQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C8173E21ECB;
	Wed,  8 Feb 2023 09:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: enable special tag when any
 MAC uses DSA
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167584741781.9727.9581653304808207719.git-patchwork-notify@kernel.org>
Date: Wed, 08 Feb 2023 09:10:17 +0000
References: <20230205175331.511332-1-arinc.unal@arinc9.com>
In-Reply-To: <20230205175331.511332-1-arinc.unal@arinc9.com>
To: Willem-Jan de Hoog <arinc9.unal@gmail.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 arinc.unal@arinc9.com, richard@routerhints.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_011020_957579_E851D12B 
X-CRM114-Status: GOOD (  12.13  )
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

On Sun,  5 Feb 2023 20:53:31 +0300 you wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The special tag is only enabled when the first MAC uses DSA. However, it
> must be enabled when any MAC uses DSA. Change the check accordingly.
> 
> This fixes hardware DSA untagging not working on the second MAC of the
> MT7621 and MT7623 SoCs, and likely other SoCs too. Therefore, remove the
> check that disables hardware DSA untagging for the second MAC of the MT7621
> and MT7623 SoCs.
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: enable special tag when any MAC uses DSA
    https://git.kernel.org/netdev/net/c/21386e692613

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



