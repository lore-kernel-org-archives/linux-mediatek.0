Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6840ACF8840
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 17:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rU5KwLhvPZA8qBujq310wPW4kCi9eHNxvXqMaCkC+3A=; b=cysxSgHXs0wjXZGpLjwc6d/59U
	GGXC7WFKMQOdz2B+Fl8X5lPljFMsml+FZhRL9mya3BjquFmvhJsv9bd/f0RucJRt+KrUDkGi6ye/A
	rS0GeXdF1GYJopgnMIblnPGbb1J1cxzRpDW9Re+w0rdct73sy7H0Sjd40Pnt830/+Z5YptpiA6ClS
	qOTRDdQRPoQo7TjDA0als/ZjuzXe+LkwuZOmuNjudL7Mq6afC5Y0gX2v4qatxrSo77rlzK3yAbqlo
	rYkEsRHsockDnpVMam2HDva7UCuw4qRl/L5MDT+aBEkxkkZBje7DqGdMh78asi2mJGZCxgv4w875L
	0/S8sqFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swm0i-0000000DV6b-29WA;
	Fri, 04 Oct 2024 17:22:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swlfJ-0000000DMm6-2TKg;
	Fri, 04 Oct 2024 17:00:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0A09A44BEE;
	Fri,  4 Oct 2024 17:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27D3C4CEC6;
	Fri,  4 Oct 2024 17:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728061227;
	bh=RFsARZ0zk68ctW4vdVH4KIUXSCfgAXntavNjMmvHP48=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ivZ8PcPcf6nMId2MrNs/qEqsQpiyMbusXcaW3K2yvjBA0vCHpNuRZHgPaIZQx/rhd
	 jd7GIOysi0++tfEC6wmoSOMmqFwUqhFhPYUl110jhJLebKwYUPegLKj7yHzZi8anCg
	 MWsytlW71p/GBvWnbwi6pm7UZR4luDh1Kdqd8urrFz3VibzYgDOgdHKqoJ1qLnDNJQ
	 mBY+SXTN31qs6gQWlU2brax8YUJaaNB0hZevKvCW6sq3PYUNCZ6AWC/iGiORY3zpRT
	 ttmwpjCakX6SHB1RLiSbPU7xeqHNOeXKijEGC46UdXNY4L6qd8oAOZvDJo9n4pDrPp
	 Z+r3pfPjJUfcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE08E39F76FF;
	Fri,  4 Oct 2024 17:00:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/2] net: airoha: Fix PSE memory configuration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172806123129.2661344.16262857869293942023.git-patchwork-notify@kernel.org>
Date: Fri, 04 Oct 2024 17:00:31 +0000
References: <20241001-airoha-eth-pse-fix-v2-0-9a56cdffd074@kernel.org>
In-Reply-To: <20241001-airoha-eth-pse-fix-v2-0-9a56cdffd074@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, horms@kernel.org, upstream@airoha.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_100029_711215_94D86E9A 
X-CRM114-Status: GOOD (  10.15  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 01 Oct 2024 12:10:23 +0200 you wrote:
> Align PSE memory configuration to vendor SDK.
> Increase initial value of PSE reserved memory in
> airoha_fe_pse_ports_init() by the value used for the second Packet
> Processor Engine (PPE2).
> Do not overwrite the default value for the number of PSE reserved pages
> in airoha_fe_set_pse_oq_rsv().
> Post this series to net-next since these are not issues visible to the
> user.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: airoha: read default PSE reserved pages value before updating
    https://git.kernel.org/netdev/net-next/c/1f3e7ff4f296
  - [net-next,v2,2/2] net: airoha: fix PSE memory configuration in airoha_fe_pse_ports_init()
    https://git.kernel.org/netdev/net-next/c/8e38e08f2c56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



