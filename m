Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94589C07E9B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 10:30:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 662A5610D2
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 10:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 662A5610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyadTBVE8mMDZVh6jOh+Vi1Eyj3gzb1heJ3NRiEssm0=; b=Z7NM4v6EpYalj8
	/LNwFAKIlmL3vCReVsoukYefBqxfvPOm+b5QHpu6bNOaNJg/KHGoPYsXtsJ1Qw25E976FEqYsTPMK
	PVNrVvF7q8ZdJ0jSOaaLXzBXuV2obhe8vPhdRp5ePTuPXxdfBfpiWqesDMWmaRKA4skm9nse+6hX2
	KvPw4G9RBGzBh498Qh3STYu4l8J9lYMzLtXKbPDms0Hx7JKqZBLPFPEFr10nZUOBVYea41HcAUPRk
	tBhgw0K2zjg//4NdlcG5GueX/VTWl5+mbcxn+nwhbkTtGZrUgASKtbhRLh6Rvy/9pPS9Fm/ox1MR8
	01bO/szBlWc/uO4F79gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5n15-00CWNr-Pn; Tue, 20 Jul 2021 10:30:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5n0m-00CWKd-Ts; Tue, 20 Jul 2021 10:30:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 8D5486101E;
 Tue, 20 Jul 2021 10:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626777004;
 bh=BM5wkoPMjRKGoktEBVz+5Rr7FRFAatjsayz8taHQU8k=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=VMZY2aPV5hrCbtiYUS939t1TgLXAaXWyoAm5vR2wkmr+qLHuSjiRD1l0zEka6nUfQ
 D2fk/uVhnetZPPpEkYtuujS9drmp6M76fWyyessgtB3oJ//SqJwiVdTLEoqGauYw1X
 ovWi9unfnHI/KMCNtkCkLqlTbMqz2VB32tfNXVOVqNhfPBQD6ohUYPkQCWjqj/jIdd
 2bYqj9HdccOwOG0fKYoXHNogNnX0SxWluO3mb1wDRcjROdH3+rZIThEGNjfT7xTH1q
 S95LD24GlxrN2U/5Dg5+ycZuE2X5KwaDD2T8UlpXh5p/nrojMds/oGETp6sMrCD/Qa
 Gl640BdQJgJ8g==
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3] net: Update MAINTAINERS for MediaTek switch
 driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162677700451.29107.12570499893022239705.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jul 2021 10:30:04 +0000
References: <49e1aa8aac58dcbf1b5e036d09b3fa3bbb1d94d0.1626751861.git.landen.chao@mediatek.com>
In-Reply-To: <49e1aa8aac58dcbf1b5e036d09b3fa3bbb1d94d0.1626751861.git.landen.chao@mediatek.com>
To: Landen Chao <landen.chao@mediatek.com>
Cc: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 dqfext@gmail.com, sean.wang@mediatek.com, p.zabel@pengutronix.de,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 frank-w@public-files.de, steven.liu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_033005_031106_A3544F97 
X-CRM114-Status: UNSURE (   7.62  )
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

This patch was applied to netdev/net.git (refs/heads/master):

On Tue, 20 Jul 2021 11:50:07 +0800 you wrote:
> Update maintainers for MediaTek switch driver with Deng Qingfang who has
> contributed many high-quality patches (interrupt, VLAN, GPIO, and etc.)
> and will help maintenance.
> 
> Signed-off-by: Landen Chao <landen.chao@mediatek.com>
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Acked-by: Vladimir Oltean <olteanv@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: Update MAINTAINERS for MediaTek switch driver
    https://git.kernel.org/netdev/net/c/6c2d125823ae

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
