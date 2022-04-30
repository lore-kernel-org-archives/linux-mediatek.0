Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D26C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Apr 2022 01:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vg42cqx3SuTOR4lTgkVR8wHiVITEaOJEC5Ub2Da0vUQ=; b=A2I36Mqrm/TV48
	uqVnYT+duttr1md2+PVsyV4OczaLLlM6YGlYZaVIzjJRAhdDu6oQYGyDm1HvYHMUCfPGVr9V9nKss
	cG1Jhz0HYVuI5A+0EGulo+t4WFTV+42hL6rF1agMpBMcyTXDbALrb6uvOUCrMY47z8ox2aRo4TeoU
	W0enpUrMwXP+t5VUC4eBHQXW3bh2HdYWw9UDoNbpZy4Wv/+Kivw4j1F17SwCZKd8o/78ukFeZe48r
	kx47euibCoNrb9RVe8d8AWNBTCNWm0Gelu/qDo1tH43ah2fuJ3tEP3GPPgaytJM+fj0h/L/4KDfaf
	aLstI/aQZzQF3+9+sk7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkcFW-00DNyC-Iu; Sat, 30 Apr 2022 01:50:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkcFU-00DNxm-6Q
 for linux-mediatek@lists.infradead.org; Sat, 30 Apr 2022 01:50:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B5E7624BF;
 Sat, 30 Apr 2022 01:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9C42C385B0;
 Sat, 30 Apr 2022 01:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651283411;
 bh=lwhjMBYIT1JRzTaq5z9qYblRXgqG3fiwN5yJPyj+BqE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OtyL6vVC+fRLY4/H8xn3melL87dEgNgQdfIo2sQILk/KTDszNIMkHUPVtCmDBpFqC
 nG2PD2uw+hR/J74a88vuFZX1/f/F76JbGVmeMDU9YxGjuuK1ktpkB8VirwJh2WLn2/
 j9BBiAsoXm9KYOijFhWQgj9MEyYiA6yaIP8hlhonhinfmSF6tF/i+npGbOU1z8wuUu
 5+9VfuzD09W84Ws9yPv4CuLHWnmLbv1aQabH6Pc1nvvOtoQbV8TL3MyLft1C58nxnw
 nM7UAXNp3+IGR4GDRgzzaAiwH/Dp7ZM6MTJOOCfKH1U+jo/wKK3msL6gbNO+s7XGdF
 EOwYfo6q9cxAw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B65CAF0383D; Sat, 30 Apr 2022 01:50:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] net: ethernet: mediatek: add missing of_node_put() in
 mtk_sgmii_init()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165128341174.13664.12317514377406720211.git-patchwork-notify@kernel.org>
Date: Sat, 30 Apr 2022 01:50:11 +0000
References: <20220428062543.64883-1-yangyingliang@huawei.com>
In-Reply-To: <20220428062543.64883-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, nbd@nbd.name, john@phrozen.org,
 kuba@kernel.org, davem@davemloft.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_185016_313851_0A83B424 
X-CRM114-Status: UNSURE (   9.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 28 Apr 2022 14:25:43 +0800 you wrote:
> The node pointer returned by of_parse_phandle() with refcount incremented,
> so add of_node_put() after using it in mtk_sgmii_init().
> 
> Fixes: 9ffee4a8276c ("net: ethernet: mediatek: Extend SGMII related functions")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_sgmii.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - net: ethernet: mediatek: add missing of_node_put() in mtk_sgmii_init()
    https://git.kernel.org/netdev/net/c/ff5265d45345

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
