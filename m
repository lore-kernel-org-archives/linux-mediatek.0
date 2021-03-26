Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02623C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 00:30:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 907A7619FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 00:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 907A7619FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4DZ84Gl1sExSyQ3SmhknKUes9l74caRYEu9/7kmlWuI=; b=AgJzZOTk4z23LFpk7ze7fSKTE
	HBHuuDJEwhJWsPcPSShMfVkY4OdPZM7ZrBfK+ZN7bazkyfZdjWZlUlUYKEv9JuutQHIs9gDpKEXUr
	rONsJxGt9ubP0u4buXymquCjIozumFtFj61tQ+OXArmMjkaNywJyq5p9AGm6vQdzacfGZRb6zdVea
	78QfOBMSNanZbifFTqyEGq9VFy+T6oR8SR45hTayBAjNkpf6iorfWXlmw6p/mv9ZHokp43DbWG52b
	QQFQzo5PkcaGbTXDT7erVvAT6UYKxqiFymwJCjcIBwF0tgVdORHWZ6Ur0JuVzK62ldfrbSBTPDg28
	9n/qygWBw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPaMy-002QG9-5w; Fri, 26 Mar 2021 00:30:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPaMh-002QCv-SK; Fri, 26 Mar 2021 00:30:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 32BB261A38;
 Fri, 26 Mar 2021 00:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616718612;
 bh=y4vnvRxAN5F3xsx1GVvdx4Qj5uxf5Mg6sp7x7FMmPQY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=JWCLavrcfSPwwi7J0XwmJ+avytStV4Zpqb52YNA9tDXPKhcxpTgWXGtrJQ32w2LxQ
 QDmuODEvLQryyUgzf4YayQR6MwwrnF8WExuwgn6mMYUAk/eejIL/5l8ocRA+uJO12u
 XsQwmNWCpCDh78xo28sTMpMWtngwNUYVGl8eqagmoSD8fHdngHMiwC+S/E8CuOZoUA
 n8we7oSa4ShMyMByZzYdZkh22qEktfBnK1xI1Heqkv39oLuKk7GCLjmyZVQECDU3gi
 u6n55c2tQpJIDfALtyL0u0OeUfGxQX5Pu4uqLaITPiR8md3NN/nsPxg9UrKUuIVCKu
 +4aBc3j7UdQpg==
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: remove unused
 variable 'count'
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161671861218.2256.13897972027932526674.git-patchwork-notify@kernel.org>
Date: Fri, 26 Mar 2021 00:30:12 +0000
References: <20210325093151.5913-1-linqiheng@huawei.com>
In-Reply-To: <20210325093151.5913-1-linqiheng@huawei.com>
To: 'Qiheng Lin <linqiheng@huawei.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, kuba@kernel.org, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org,
 hulkci@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_003016_315781_AC2D56DA 
X-CRM114-Status: UNSURE (   6.49  )
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

This patch was applied to netdev/net-next.git (refs/heads/master):

On Thu, 25 Mar 2021 17:31:51 +0800 you wrote:
> GCC reports the following warning with W=1:
> 
> drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c:80:9: warning:
>  variable 'count' set but not used [-Wunused-but-set-variable]
>    80 |  int i, count;
>       |         ^~~~~
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: mtk_eth_soc: remove unused variable 'count'
    https://git.kernel.org/netdev/net-next/c/ae8f5867d590

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
