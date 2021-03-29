Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8FEC433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 17:01:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 419786192F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 17:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 419786192F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vo2Nhf7y2TSmrJh7F3D6jbrAPLn6LQymMoWxtjKh7Dg=; b=O6ewyIh5H3iWuGRmE1qoCkB1N
	I8efQ+69ezcE1vtEyOjUvwqkLxCdZwqwK4lpOrY0V7g9E9UCrUIX0v3ggiJ03Ek1MYW2RDlIxbN4S
	S3velU+dQO9d0e0AoFiUM51aLN7+Gn58AD016GkdMPuMYy0pWapIHTtFOpuje0FF05g/SlpzSDP/s
	8+cl6cBXKRgzkR5o7ksb/V+StZ9VpArdVe3U9mGorgpVPcde3bXIsuuDp+dgRxR4MrT06TnLXlQdc
	HQ4Rb/KejBS8DdLm4XDRcHblw2mt2eK6G89K20nYBeW8dIsHh5gFhFoXflRHh0zcQRaPMc1OMusDm
	3e4ppcDRg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQvGf-000pAk-A0; Mon, 29 Mar 2021 17:01:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQokq-000Z0r-NM; Mon, 29 Mar 2021 10:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Date:
 Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=pm/pP6egShyX4/2rxxE2vsHvetQs3aN1NBtwxdtbLL0=; b=u1uBhcBXFI36SFoqONosvZcTs6
 3YglEQrEhWnfiwCiFYGWwoRnM7Z+RKcQg3dcqO9fHnx8vQlL2V5UAcESNBJ+4NFD+zXEpwS6xDmIq
 3VEpSbIoFYxBwCNQJ8+kUvQ1c2sENrpyfWIMz6MoTqkwfHoE3Exxulb5WzZ4peIlS87wswgcdDhfl
 /fGjLp4iZroldcALR4ciMsx5VVLgSXlQHWgfnJ8YlDv2AFihvBE+FK6r58J8DKxlxfBQDdBuQeZ/t
 OWQVHT/Ia65pMquD0GKEUC1IyHnFKEjQsPXn/Lrm+7LjAJJj8skEpfSx7AyKz7ylnFeNVDeJ7SHAd
 a3C9nquA==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQgQ7-000ohJ-3m; Mon, 29 Mar 2021 01:10:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id B544361878;
 Mon, 29 Mar 2021 01:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616980209;
 bh=7ZpGTszKHp/HTdmdSRY3sy5MYneNTgNrftTkGvrMlh0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=e8g2Tgs5GUYKG4u+HXmBRnNreEUAsZtIOydjHygAkt2UGkP6d8SFB/FGEi9gfhCIr
 jRSLPFhXZmZQ/Y8NCFWwHTEtk0SZ8GNfiJH1oymg/gng7VDPVZeGpq/Y2Z4Rlxfa8k
 Ld0hEx21DRFLs6UL//ZOpkva2EyeXhKWrYWMBeOX0H/H9K2l4QyOxU+Z+zKMBvcS3C
 SlD52tdRP2xT0wAHmczljWxvaIfysM68OdlWIqr/1s+jNd+gJ3K7h5mK+zXgGKMHMn
 /skOy/vFOQ34k5oR5p11V+LkOjFS7YesxNNGP5poVpEa1y6Nr80x04e4ABBUaDnix2
 fDPmbj7kuBlGg==
MIME-Version: 1.0
Subject: Re: [PATCH net-next] mt76: mt7615: remove redundant dev_err call in
 mt7622_wmac_probe()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161698020967.2631.17916389081654027279.git-patchwork-notify@kernel.org>
Date: Mon, 29 Mar 2021 01:10:09 +0000
References: <1616838978-6420-1-git-send-email-huangguobin4@huawei.com>
In-Reply-To: <1616838978-6420-1-git-send-email-huangguobin4@huawei.com>
To: Huang Guobin <huangguobin4@huawei.com>
Cc: nbd@nbd.name, lorenzo.bianconi83@gmail.com, kvalo@codeaurora.org,
 kuba@kernel.org, matthias.bgg@gmail.com, elfring@users.sourceforge.net,
 davem@davemloft.net, linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_021023_406781_AF9F7066 
X-CRM114-Status: UNSURE (   5.46  )
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

On Sat, 27 Mar 2021 17:56:18 +0800 you wrote:
> From: Guobin Huang <huangguobin4@huawei.com>
> 
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Guobin Huang <huangguobin4@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net-next] mt76: mt7615: remove redundant dev_err call in mt7622_wmac_probe()
    https://git.kernel.org/netdev/net-next/c/8e99ca3fdb31

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
