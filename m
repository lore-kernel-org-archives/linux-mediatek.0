Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FA3ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0eTPVadXGssxVYswhOjaMnJlJKv7lr0MMrhoz5Exl8=; b=1XaYwIMUirSGN9S0tRUrtgBJ7X
	FVffIIvrfWFxlSkJJbBdJPlgw0HjBfJjLHq/FDFlfIc24f865XWHH097BLY631zastmx0L9MRjE77
	PbknYouEWdDpoUmY9ie4eJTbnxKi7ACz6eCOCJKIYytO0cekXmlRzJIODxdAWO0QSfYQDhddUn+kJ
	0jcrQbV9IA+hWgB+Q1/He11Kf3z6oVF44JCJjaZgGkqbPB9zWpwjG0eg4gFt54bvhynohy8rmrMOM
	uEJ4NJps0iTIco4LCJyRdjFy8sQXRerJGTrwGck1msREPByDnqb56nrM/9sJ4AnJ18R97b35XOsJ3
	PIzPlqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1objOA-004ZiI-IC; Fri, 23 Sep 2022 14:10:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1objNh-004ZWn-D9; Fri, 23 Sep 2022 14:10:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 986C1625BA;
	Fri, 23 Sep 2022 14:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BCD3C433C1;
	Fri, 23 Sep 2022 14:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663942215;
	bh=RCxptDXU8HCZ1mcOVvAGrWiCCf/8eHMkemxHICWAP+0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MncRIXGX/S3mGugKtrw+VfBQ++LLqMd5c7ULiZqmYgOsqTy7b2ro1LeNlGo+00mt4
	 YGcRDSTsFEU1B7HhpbO6RbsOGvISk9JwpP4HI60XxfxvcSyjWOZVw7c+dbAUy8z0Bi
	 2rFlhyYxdCC0tOZCUWinsuY1yCIDb8hbIcIQup1dkE0vSsC4q7ckr7hh1EKokl0oeg
	 GPyTPknxb06QLEFvGR1F6/7/U1YB9u1CAG3NS1RtIQQa1iLL4aOuG6LA2+6uEOpWx6
	 sJuxMOZq5TX4jLanespQmYaxqVTUnuDGWW5UNXzoYTPePFJPPA9c7hq8y/DEMUmdIf
	 YsAqQMSJ3NwBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 08381E4D03A;
	Fri, 23 Sep 2022 14:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] net: mt7531: pll & reset fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166394221502.18573.7555903251873086373.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 14:10:15 +0000
References: <20220917000734.520253-1-lynxis@fe80.eu>
In-Reply-To: <20220917000734.520253-1-lynxis@fe80.eu>
To: Alexander 'lynxis' Couzens <lynxis@fe80.eu>
Cc: sean.wang@mediatek.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com, landen.chao@mediatek.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_071017_512161_56C11390 
X-CRM114-Status: UNSURE (   9.21  )
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

This series was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 17 Sep 2022 02:07:32 +0200 you wrote:
> v1 -> v2:
>  - commit message: add Fixes: tag
>  - add missing target branch in subject
> 
> Alexander Couzens (2):
>   net: mt7531: only do PLL once after the reset
>   net: mt7531: ensure all MACs are powered down before reset
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: mt7531: only do PLL once after the reset
    https://git.kernel.org/netdev/net/c/42bc4fafe359
  - [net,v2,2/2] net: mt7531: ensure all MACs are powered down before reset
    https://git.kernel.org/netdev/net/c/728c2af6ad8c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



