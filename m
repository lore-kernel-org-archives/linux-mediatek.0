Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15B9C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 19:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjlR70NvkbGXMCBCuj0r4CjDZA/9qqDgOr9AFyyE8ck=; b=zUxbfFb9Mxx4vzdcs/Gyttf8Xt
	SmK8dWPZsGZ1OzVq5Y5/BbTuO2mz8+o85i69TCFLY/u85Kw750FOtEFkUHkN8Tm7OVO/LtRRYCdQP
	pD5Ytg4mJ65XfrA3iXlsJSCoeCpZU7J138HTzDOqvc7KqYBWeoY/h/ywQ6gh/QllwyiqS7FvjRsmK
	PHC/6id5v+HgWVF56nTZ59a95rNTFzqtthsJggqGPhXd70Jhjyctg6jAHO/KU+iKRzGT1qqP9LCbf
	X4Zo/xancI7GC/Z4ww08fpLfR0CChEHnpph8mVcGMdm3NZEvfo1MuKAww8a5mTUW5wMXkUt8vL1De
	j01ijU+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNfRg-00H533-D8; Thu, 02 Feb 2023 19:40:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNfRU-00H50E-K9; Thu, 02 Feb 2023 19:40:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 62EF861CC5;
	Thu,  2 Feb 2023 19:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BD07C4339E;
	Thu,  2 Feb 2023 19:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675366818;
	bh=RKhFRxkKw/oc1MHgIsGdTeY+HE5OfXv4GdCZPBtPHFc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CWjQW27d8ZOodn8t8hCYPfhIzr7DWRSeWLJSrYNvG/kc85m+oVH49B/BMG8qae5IB
	 ryD8wDM/siHuB7f/pJYvfE8r2/2taraKp9E/iP688zTr4kqGBcWAVgOqa11I0OzpPG
	 pFD3OxdYiiFEFXaNlWqsSDfCXZQPo5pds858biwK6wZ3HcmX4EY0vdgGO+EHrLZVj+
	 +qZqps9sdeh2M/Js1vOlU5EXibMF6RbxbaCdOyZBY92fJQRXn+1yiBFE+kgDElvy1G
	 Hm4yT4Bjuk3LET3gzHUtq1BcWLqxFDsVyDet2mK9a4hhfEIuElIrWu/Ur/9v1gp5zg
	 a+i+tIswm1eRA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 304FEE5254B;
	Thu,  2 Feb 2023 19:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: disable hardware DSA
 untagging for second MAC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167536681817.25016.12221190782721540650.git-patchwork-notify@kernel.org>
Date: Thu, 02 Feb 2023 19:40:18 +0000
References: <20230128094232.2451947-1-arinc.unal@arinc9.com>
In-Reply-To: <20230128094232.2451947-1-arinc.unal@arinc9.com>
To: None <arinc9.unal@gmail.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, arinc.unal@arinc9.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, erkin.bozoglu@xeront.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_114020_716850_2FF16DBB 
X-CRM114-Status: UNSURE (   9.62  )
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

On Sat, 28 Jan 2023 12:42:32 +0300 you wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> According to my tests on MT7621AT and MT7623NI SoCs, hardware DSA untagging
> won't work on the second MAC. Therefore, disable this feature when the
> second MAC of the MT7621 and MT7623 SoCs is being used.
> 
> Fixes: 2d7605a72906 ("net: ethernet: mtk_eth_soc: enable hardware DSA untagging")
> Link: https://lore.kernel.org/netdev/6249fc14-b38a-c770-36b4-5af6d41c21d3@arinc9.com/
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: disable hardware DSA untagging for second MAC
    https://git.kernel.org/netdev/net/c/a1f47752fd62

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



