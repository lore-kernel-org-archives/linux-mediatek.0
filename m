Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0F0C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 18:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbnUpv4I9PrUxiufQ5bL8CsK4M0d9KOcf7lri2OATYo=; b=GIkaXNrZnbvdQpi5y7jH4Q2cb1
	m20JeiBn8XiTLyWeviC9Ho1FGKTnVcQCM6I+fg8zGyg3chHfGxAIeBYuYjETWQO7zIWJZeJx5uTAP
	sGSOPmPDb/4gp8p5F/l6ScS9WcLELClslqb4CJ7qDjm2hYxfz1Ik5EH+iYD2iv+D7JZSqIzVoTZER
	JD8CRUJKdDMm6b9eqMAUnxjReH6szdhuaZo/EqbZKWejaVDSa6y/RmWYIK9j75RADZEwOB47l4YJg
	YBrkJncnG8wpyhjz/HXS7A3ONDcv0PmFRiV61wO0CcZYIc/ZQuZjwVDlrT7l/oS53Tj9uZJpDhfw1
	USMkMsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH7xo-00D75C-4o; Thu, 28 Jul 2022 18:10:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH7xk-00D73t-Uj
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 18:10:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 056DAB824D8;
	Thu, 28 Jul 2022 18:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1C46C433B5;
	Thu, 28 Jul 2022 18:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659031814;
	bh=ppCmYlclJCNj1Oq4JCRie1DNfqM3IDoEheXuO58cvTg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eLM26ccgbZnNt0CUIvvwJbBC6poS7oR7/G7lozocJNnsWBDxawsTE6oPYLvcekSPN
	 ovhwHnCYigojA0lNzHgTrDin14WQ/SByLA2OVU7L2NpfhksLivH7MZNJH2J8xeFsfY
	 upCMg0rPvG+0n9X7WTX/mMT9xEfyqLAthPpDj6B+pjyDeG4ARdXrKwLsIMvAkusSjw
	 m+TfAmO8YGLPI68SUg9e5Dz+pdwTFTRUpG4dq/+gx+mL3O8uP1QYGhApfb7oEkBcC1
	 ze5Hje/u8jYLcuTh3tF+WaMTjKeNCb5lvS6x9mArIv0MifFmqvap/ThP+fuXo8Szs3
	 CIOAPxN00q3Qg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C93C6C43143;
	Thu, 28 Jul 2022 18:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] stmmac: dwmac-mediatek: fix resource leak in probe
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165903181382.2291.8863547537135721463.git-patchwork-notify@kernel.org>
Date: Thu, 28 Jul 2022 18:10:13 +0000
References: <YuJ4aZyMUlG6yGGa@kili>
In-Reply-To: <YuJ4aZyMUlG6yGGa@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: peppe.cavallaro@st.com, biao.huang@mediatek.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_111021_187829_42080E69 
X-CRM114-Status: UNSURE (   9.31  )
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

On Thu, 28 Jul 2022 14:52:09 +0300 you wrote:
> If mediatek_dwmac_clks_config() fails, then call stmmac_remove_config_dt()
> before returning.  Otherwise it is a resource leak.
> 
> Fixes: fa4b3ca60e80 ("stmmac: dwmac-mediatek: fix clock issue")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Here is the summary with links:
  - [net] stmmac: dwmac-mediatek: fix resource leak in probe
    https://git.kernel.org/netdev/net/c/4d3d3a1b244f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



