Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099F3C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 08:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RR+e0qY2HY+KMU9oSVTYG3CrBNjJrsLRP/dF0CM4tj0=; b=rjyH7644eUHv8JNRW0q1tkqLpt
	ZkZKO+UjilxmtefviZZ6HfMgRB3cE3BXXv+CkGJB+pLDzPx5wj3+uSEpiMlRdqsbYiFGU2HuRdh4M
	5Q+z0H+KcvlT3vNebDAggDnRvgNJ+fpLG9CQ8gVNioi33Bv2FmAvrBGbLKgMDQM45Eh2/k2Wu98y0
	1OWeHZVl2nEkU199tF0KlhK8j8Pk7n68ardCpncm0YqqvQWhdr76aS+VstOE3xhX/gzjfRNeldJsX
	PyOagkQIL6ULJuWp+h5NzIRd7awVp+kOjuzeX55ybYW6UCeKCZeJ/vbFt0fpDs/rQvLaUEPWr2HTj
	QbH0JB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0De-0000000F7U0-46QM;
	Wed, 17 Apr 2024 08:00:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0DX-0000000F7Rb-408e;
	Wed, 17 Apr 2024 08:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4EFA86128B;
	Wed, 17 Apr 2024 08:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3BC5C32781;
	Wed, 17 Apr 2024 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713340831;
	bh=oEQgw93Cov2umXAsjiuN9cm/AxuQU4zSu7ix8xBpZsQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=X8LTOOALhbI5/bnuhZXwxMGCrLlwBKcCPsU+v/n08hYKD7kbLilKLS5e41s9H+iQa
	 ZEHWI+BLCATu6S/F9HuHRtQKwyw5eybpRLXKNZ5bjK25CYJBCGNJg2PmqyR8zRgwWG
	 53wcjsj3OX4ktA/yuoOUdpY45guRAUG0nrmnhEMYVIaL2j9T/TqkE+92NUOGkTeyyA
	 HTOBx3n32eUL2dlCahLvzlyhzxwStDvCNb8W6EwC6IxQQWfOK9j39nOAAfkXVnN0Pn
	 sijcC3X4F49/9tJq1YvpOzhDKX/eYNIRYdeZYmDqfYuBkF3gMd00+r4Fdo0vUkPaoL
	 /xNPYb5/+ROnw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D5EE5D5B3FF;
	Wed, 17 Apr 2024 08:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] Fix port mirroring on MT7530 DSA subdriver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171334083086.1461.14636721457628814593.git-patchwork-notify@kernel.org>
Date: Wed, 17 Apr 2024 08:00:30 +0000
References: <20240413-b4-for-net-mt7530-fix-mirroring-to-local-port-and-mt7988-v1-0-476deff8cc06@arinc9.com>
In-Reply-To: <20240413-b4-for-net-mt7530-fix-mirroring-to-local-port-and-mt7988-v1-0-476deff8cc06@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCB2aWEgQjQgUmVsYXkgPGRldm51bGwrYXJpbmMudW5hbC5h?=@ci.codeaurora.org,
	=?utf-8?b?cmluYzkuY29tQGtlcm5lbC5vcmc+?=@ci.codeaurora.org
Cc: daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, hs@giax.de,
 bartel.eerdekens@constell8.be, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_010032_058173_9CBD9DB5 
X-CRM114-Status: UNSURE (   8.62  )
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

This series was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Sat, 13 Apr 2024 16:01:38 +0300 you wrote:
> Hi.
> 
> This patch series fixes the frames received on the local port (monitor
> port) not being mirrored, and port mirroring for the MT7988 SoC switch.
> 
> Arınç
> 
> [...]

Here is the summary with links:
  - [net,1/2] net: dsa: mt7530: fix mirroring frames received on local port
    https://git.kernel.org/netdev/net/c/d59cf049c837
  - [net,2/2] net: dsa: mt7530: fix port mirroring for MT7988 SoC switch
    https://git.kernel.org/netdev/net/c/2c606d138518

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



