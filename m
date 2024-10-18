Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A342D3C544
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 02:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FInH6rmEGrI96heFWpKbOa008U589xCU7r9Fs7pLT7g=; b=PUMnrylDIFGUT/E3jIj9NAiIWz
	UzKazrVch6zGj49GoIuxb3wTKfYje9NHmVk0FwXw3FmAWsk7KY4MsDqa6Y7YE0om3Kvk8LDvb8B9U
	6VrJMFJ2MLpSSrCv7nPQSSbnIvAIni4jbcFQ8wSW9T1x84DQ8n73j2p8LsVJTEU7YRxb7pbkiydbS
	XzHoO8OhZvcZSZ+oIFQQ8Fz/ws9CyXHjC5O0mWRPEjyg7AwxZX+an1LKhBT/1/nAoZ8n+QqhEIRsV
	Q5MAcGi6Jp75dwkbDEe/64lp97IiOdbUI3WlF3m8HgMUebcirW7qwtn/fjom+rbYluMUJ12DWG+ou
	clupwUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1d5o-0000000Gim7-1XFE;
	Fri, 18 Oct 2024 02:51:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1d4L-0000000Gigu-3VdT;
	Fri, 18 Oct 2024 02:50:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0F90A4453F;
	Fri, 18 Oct 2024 02:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBD2C4CEC3;
	Fri, 18 Oct 2024 02:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729219824;
	bh=TV2vZOfHCYzI29IT082PlVZm8+DxBeGHheYHxpV28A8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=t82sFMykzQEpfZSeeZ4n5Y1mqB6qfrEIeJXvvgb6lbSlVKYd5rnZybsbO5QnltehT
	 ZWhy20eaCmRX8zoqo+W/xN0vRdF8W3X/FyI30DD7f7LpJOryIsLkinUO2biOl4vGFH
	 K219DWkcucAVMyR/dPnmPBD54aOiEt/TJXPb74Not+fcdsU/uaLZscyzmUMHQlOSJs
	 G+tyuS1fD8iny7GzrsF79V8vF7v3akUjzLcrZshtDNtBsKXT7ovrTXV6uw/+Wfi5Lk
	 8bq/Ij4IuLYbA+83Q35LMEAopVXgUIQmRSi8hqm2qPga2pnFMsLUnsckXw4kqPE0zR
	 5sao5WktngWXg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CBC3809A8A;
	Fri, 18 Oct 2024 02:50:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Fix typo in REG_CDM2_FWD_CFG
 configuration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172921983001.2667083.1676500266510353428.git-patchwork-notify@kernel.org>
Date: Fri, 18 Oct 2024 02:50:30 +0000
References: <20241015-airoha-eth-cdm2-fixes-v1-1-9dc6993286c3@kernel.org>
In-Reply-To: <20241015-airoha-eth-cdm2-fixes-v1-1-9dc6993286c3@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, chihwei.cheng@airoha.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_195025_957782_5513615B 
X-CRM114-Status: UNSURE (   9.26  )
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
by Andrew Lunn <andrew@lunn.ch>:

On Tue, 15 Oct 2024 09:58:09 +0200 you wrote:
> Fix typo in airoha_fe_init routine configuring CDM2_OAM_QSEL_MASK field
> of REG_CDM2_FWD_CFG register.
> This bug is not introducing any user visible problem since Frame Engine
> CDM2 port is used just by the second QDMA block and we currently enable
> just QDMA1 block connected to the MT7530 dsa switch via CDM1 port.
> 
> Introduced by commit 23020f049327 ("net: airoha: Introduce ethernet
> support for EN7581 SoC")
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Fix typo in REG_CDM2_FWD_CFG configuration
    https://git.kernel.org/netdev/net-next/c/30d9d8f6a2d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



