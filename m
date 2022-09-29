Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E54C07E9D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbRVIXOHBxlvJg+Er28VVHHhxPSazzJjsK7d0AmnWkU=; b=17ah1msN5v748eNr9qc9WT4dzE
	TKmhdqgpJC5rtOvyiEKuFAWjjEvifwodDa/zST6Pm1xBPrgCtjVprzg2YLAOJAI9USd++zfBqsuZc
	DXMKAUTm5NSxWflrpBnqFV62louAReAzN94SmRbGQWNWZBxXNknIWrIFwZnk0nCzwecPO0LSXAZDD
	TpehQ+etII3yNZFc2YxZdsrb3lXJSuLvTqFZtBdzCmqm4GUh96jLaR80iF1w+w5sVZIxShlvbbdOh
	SRTRo5PRnPf+jSIrloYisu/2tcTXD8LxogfjtW/Yj+sNLY/JG2lDJZBR8k/vlyd789nDAI8BZXjrT
	MOrj2Waw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odocv-001klg-S3; Thu, 29 Sep 2022 08:10:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odoca-001kec-S1; Thu, 29 Sep 2022 08:10:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1BAD962083;
	Thu, 29 Sep 2022 08:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A5B9C433D7;
	Thu, 29 Sep 2022 08:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664439015;
	bh=ky137os0hbVFN+1bPQnekE+YN/7mA238NtcGnLwxVQU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XpaKGWJlb9Qe5aXk9cZ4n6yDkY7mFBAn1meGIym3g16XTr1HNyh331/SrtaPGG9xU
	 aMvo/TZMZ7GzoZq3Ftk3nRo/Y0lKzBQlsoicKWluDcHI/E+tl1W9YbyvmC1L1sF0SA
	 pHmROj59//TpEemof4mCqaecUvBbYEuIGo74g3vXpElziN+C75DnNPoRrGBnUHUBT6
	 O/twkfNTTtsABPKOIuyLUljvLV2Vkm+5aLg0I/qA3S40n6X+1UcE1Oak1j6pCsIpMe
	 LMwKbGnf6GAmySfh/xWdhNTXQ09HhkWnKPnQfA9EYAudxY57rWWzMi6G3PLGkYA0mn
	 S6UoIIOABRDVQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59C39E4D01B;
	Thu, 29 Sep 2022 08:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: ethernet: mtk_eth_soc: use
 DEFINE_SHOW_ATTRIBUTE to simplify code
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166443901536.2321.13062051638346979105.git-patchwork-notify@kernel.org>
Date: Thu, 29 Sep 2022 08:10:15 +0000
References: <20220927111925.2424100-1-liushixin2@huawei.com>
In-Reply-To: <20220927111925.2424100-1-liushixin2@huawei.com>
To: Liu Shixin <liushixin2@huawei.com>
Cc: kuba@kernel.org, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_011016_959865_86129DAC 
X-CRM114-Status: GOOD (  10.11  )
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

This patch was applied to netdev/net-next.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 27 Sep 2022 19:19:25 +0800 you wrote:
> Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.
> No functional change.
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
> 
> v1->v2: Rebase on net-next.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: ethernet: mtk_eth_soc: use DEFINE_SHOW_ATTRIBUTE to simplify code
    https://git.kernel.org/netdev/net-next/c/1a0c667ea8e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



