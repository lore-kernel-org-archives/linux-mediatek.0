Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D913CC2BA1A
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 03:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIJo4PBmc0Pnz+TraTDlK9DZndlaymh4Bm3FKeaVtZU=; b=f7uwNPOj4Dh0zuM+jf2IF/XL8g
	xf4IbT+F7phoddwroEpPKa79Fm1y1cFmGlu1DFibd5x9mrqlWBh3hTq+VVzNfU44YBlMLu5oPzZTj
	OCHLBYXlQ+a0Jkzvx8E/k+uyPl1COBlRSnQG+xmHtGI8saJjwYZgxICcm8KS2pf6t9jYAuKbmU4bq
	lag70TRDgyBbO/L6y307yG8gumGV1rAV4UY/aWpDf7ZHm470xEPYtpW1hGJwyunxGMniBLWVNNtbL
	qvucWklCCn/ITez439g9UMoMdDzpfcAcjHDis/ufdkKVhDDUMwqCfaBTcZSB5DieQSk5ND+qQIket
	+70w5flw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKUz2-00000007YNx-2eCM;
	Fri, 21 Jun 2024 03:30:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKUyy-00000007YKm-2159;
	Fri, 21 Jun 2024 03:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52C6A623A4;
	Fri, 21 Jun 2024 03:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C499BC4AF0A;
	Fri, 21 Jun 2024 03:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718940628;
	bh=otEn1cv7oa8TtZVWWFCQE/YHru0IofZ41yc8h8GL4mQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qfB8uDXmmaMZSrnXfm2us2Mtlis0cZ1CNVVkbLPmY5Krk+KW/CdZx892kH8GE+lfu
	 /ZBrlKbOvfnlvmbtimZ7CbsW/h6TlfJ8kI4Uym0TjhdUFE7omZbvp3aWLKEfT7tbR+
	 Ut1AhsKBD0j/6IDfYgctWNF8eBfOGUr/ohEV9WhSyz4cyetrAZNpbs3IV84BUhS7v2
	 2BOM/2JYraHhYHGb0U4nokQ2w+uYvqfBgiEJag26MGDdGnJ6e9pb7HolZGC9UztGu7
	 1SEYllkjzHerb3fH7abSrmp5Hd59cDTFLvS1kukgJCzMzZSKLxPdVxNcXuU+ai/xiD
	 ipilL4iHdvJGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A9A01CF3B9B;
	Fri, 21 Jun 2024 03:30:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] wifi: mt76: un-embedd netdev from mt76_dev
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171894062869.32761.11202988972119969537.git-patchwork-notify@kernel.org>
Date: Fri, 21 Jun 2024 03:30:28 +0000
References: <20240619105311.3144908-1-leitao@debian.org>
In-Reply-To: <20240619105311.3144908-1-leitao@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: kvalo@kernel.org, linux-wireless@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, nbd@nbd.name, lorenzo@kernel.org,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, horms@kernel.org, kees@kernel.org,
 Bo.Jiao@mediatek.com, lynxis@fe80.eu, deren.wu@mediatek.com,
 mingyen.hsieh@mediatek.com, leon.yen@mediatek.com, quan.zhou@mediatek.com,
 lundril@gmx.de, sujuan.chen@mediatek.com, chui-hao.chiu@mediatek.com,
 StanleyYP.Wang@mediatek.com, benjamin-jw.lin@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_203036_590231_40A6B097 
X-CRM114-Status: UNSURE (   8.00  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 19 Jun 2024 03:52:36 -0700 you wrote:
> Embedding net_device into structures prohibits the usage of flexible
> arrays in the net_device structure. For more details, see the discussion
> at [1].
> 
> Un-embed the net_devices from struct mt76_dev by converting them
> into pointers, and allocating them dynamically. Use the leverage
> alloc_netdev_dummy() to allocate the net_device object at
> mt76_dma_init().
> 
> [...]

Here is the summary with links:
  - [net-next,v2] wifi: mt76: un-embedd netdev from mt76_dev
    https://git.kernel.org/netdev/net-next/c/08f116c9ea6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



