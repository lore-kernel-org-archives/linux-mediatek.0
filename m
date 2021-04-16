Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775C1C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 22:30:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D5B16137D
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 22:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D5B16137D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lL0dU1UukFLW0m5Ufn/vt3axqVx1ZPNL9jPp7gaXDxs=; b=igOn8LHJSuvAzq/xcJMaCyUy1
	m/vaILDxhithLToX4fUe5nHYsKhapVDl65sSKawQ8teSa121V88lrdgLJmAkc0IGKlxJlCAyvUx17
	HjBjKOU4Ofc4heIlmdpT87xVxKWIsDL0Daic3Pg7K8sgxsHCAHMHu6HkTStot8PbmnUxEaTIc7PPD
	pM8EW4OpSZPm3llIT+kEEjwbusr6UnwfhHxNCyLm8IDbBgiPzyPcJIeNnMlS0ixStXKbZUPy4pkn6
	6Do7KppoYgh3f3kWlbfhfQ+CEeSau8r47l61Z2m6k/IvL3oTYJ8RvMAd44DK8q9dyvmst3lWMuUAv
	0y/S3KsZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXWys-003bAp-KQ; Fri, 16 Apr 2021 22:30:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXWye-003b9W-4W; Fri, 16 Apr 2021 22:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:To:In-Reply-To:References:Date:
 Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=1+rIWsnyE8eIJLGMMMMZxkJvZstfvDIm+97SLeg+xWk=; b=S2Om64SJWnzsudDaf+xjkud7du
 FTuf/RKqtfofn6xeiiodMPjFphwigkyy/crGqzBSUevcLK0snTTvvEKmkP28sBVacD3iE222LoaJz
 np4e7JmxBVUOFscwvxUdI1s7qrOTOh8eAGVplOB2urXC9ZntiSDt4gsH9roYs4KKzudlWICqiT1q0
 0yDScfNZgRpzOux/GeeboHWb91xbX8eYPObYM+f3dR8tcdy1xGHnitCDkv72N+u3siwpCFe5k+Kl+
 apPlo6MdxXrPE+uxMKtVXRpC2hf3y3n4ZXCEwMXB9SECUQlkqk1atjuEHTR24sB7Z9H1hf/uaKhli
 AStVFSsg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXWyb-009ked-GC; Fri, 16 Apr 2021 22:30:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A59B613C7;
 Fri, 16 Apr 2021 22:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618612212;
 bh=+uvh7D0gOyH3/N9iSRwtAwQhn0xf12OhXPB9ehBF9ko=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=TgQz1NkIz83T+vluKDnQd+ZMT7QoKgV6cMeTq9Tb8MziESnbc98uKx3CqOzseifQC
 +uBfQ4UENr8YnxFdMpMEPlfDfvXmZH3uWO3ckaJB68/o1AW9g/3fLSAZy0V7n0zbbY
 fIOVjtdKh0nWOj8edj7FCRSv9CPGvIPrrI3bQ7RzZEHkEdKa9Zst2MB7h8D11AR+Hn
 KRYbs9KlS4ETabA6+KlvTg3Nd2rWeh1lSVMCicjJDkOLQ474f2yEsV9ktf1/xCbeTw
 99wYHqApCPm5GKVr03rt+GcwmMrCs24vSg5iGwyYNPvNbcASy2O0Ky8gCnj7hBpQia
 3sBuMUXnsp1Bg==
MIME-Version: 1.0
Subject: Re: [PATCH net-next,
 v3] net: ethernet: mediatek: ppe: fix busy wait loop
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161861221238.19916.9391393406931701740.git-patchwork-notify@kernel.org>
Date: Fri, 16 Apr 2021 22:30:12 +0000
References: <20210416003747.340041-1-ilya.lipnitskiy@gmail.com>
In-Reply-To: <20210416003747.340041-1-ilya.lipnitskiy@gmail.com>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, pablo@netfilter.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_153013_602285_66321C32 
X-CRM114-Status: UNSURE (   7.74  )
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

On Thu, 15 Apr 2021 17:37:48 -0700 you wrote:
> The intention is for the loop to timeout if the body does not succeed.
> The current logic calls time_is_before_jiffies(timeout) which is false
> until after the timeout, so the loop body never executes.
> 
> Fix by using readl_poll_timeout as a more standard and less error-prone
> solution.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: ethernet: mediatek: ppe: fix busy wait loop
    https://git.kernel.org/netdev/net-next/c/c5d66587b890

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
