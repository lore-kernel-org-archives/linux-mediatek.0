Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7AAC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jan 2022 22:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2u4j0YiaF4pI7qascj1s2XaT6fYrPbOE7cjhUIAjXm0=; b=mLWaMNxhHFly97
	HFuNoApw8+3C57Sagp43quTx0D47FxJcORrYyvr9ovcUlz8751lqTirXo04ospP8BctN1XWh+zNAl
	QbL80KjNAb3zzrTTY8qrokc1BLnwtgS6sJ3QzwiWOTn2LxTj4mPdTok3mTQTsMN8W5xRNAGJCnTxJ
	28rVLN5pi16C+QEUWQpmMhtXN9NaRE2OWyVhRnVPPUD+mGsnLudACxui9UlAAF1MBzjg/ttfDugSM
	yhDAQQU4mMQGTaZoJeIOfhZBV+gLyW5Mv5QwIyAbYfZKny4EqMdNEC4h4Q9CktFDBOycKMqROvZY5
	ycxgBGhQPiwRw69Chw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8rio-00BcnQ-Og; Sat, 15 Jan 2022 22:40:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8rib-00Bckz-DV; Sat, 15 Jan 2022 22:40:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B0C760F93;
 Sat, 15 Jan 2022 22:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB962C36AEF;
 Sat, 15 Jan 2022 22:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642286409;
 bh=Qx7Mbou3OUJYVeFc8vcOaRUy+O0fyL6IWMuhV13wurM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=A4Odjf9MV0BIBOOj5Zkz4nD8JegwqQxr4d34G76MgNSSvSz/Krqfon68q21DEYiau
 jr0FR5Yu1MD4VFY8PT6w6UlmdNQktEVqeqT9mt0rTTi3I/cIvonTCl80wwvf4DjFZv
 Bew96mMAEfMK/0RNGRU296mssYSxeY8wyuq9N6R63pskBH4s3F5wDgOQ2l1eW4Pbs5
 09Hxi9mX0wyx59qvMvhuwfE9WH/oM87C3Wg8O9+Qv3INsgD4DDbFpPE50X2Ywo0XfJ
 KsD99Oei/agZ8hwUFqJbzNfLUVDb3cqNGrAIoxNTXM8qDFub37OOoARb/PiapfskVf
 TxZ4LKNnbXwJg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 980F3F6079F; Sat, 15 Jan 2022 22:40:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix error checking in
 mtk_mac_config()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164228640961.24744.3226248987693729352.git-patchwork-notify@kernel.org>
Date: Sat, 15 Jan 2022 22:40:09 +0000
References: <20220115174918.297002-1-trix@redhat.com>
In-Reply-To: <20220115174918.297002-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, nathan@kernel.org, ndesaulniers@google.com,
 opensource@vdorst.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_144017_567255_F9C342EC 
X-CRM114-Status: UNSURE (   9.75  )
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
by David S. Miller <davem@davemloft.net>:

On Sat, 15 Jan 2022 09:49:18 -0800 you wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this problem
> mtk_eth_soc.c:394:7: warning: Branch condition evaluates
>   to a garbage value
>                 if (err)
>                     ^~~
> 
> [...]

Here is the summary with links:
  - [v2] net: ethernet: mtk_eth_soc: fix error checking in mtk_mac_config()
    https://git.kernel.org/netdev/net/c/214b3369ab9b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
