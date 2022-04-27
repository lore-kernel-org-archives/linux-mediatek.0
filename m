Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051C9C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 00:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73xH/j1Z/Gk5ho7MhiSCE01i2Tr2Ggd9CZtqQ/hrniQ=; b=DrLqIdBnQYrQVd
	aRmaaHxwR8o5CdJVX9gPoBBxSFZDJbTaHfD8h07oiFlZn34me8kp3dUDy2uxb3tNnw0zPYrSiA3Qe
	anMQ/T5AyR0VL4wEqxc7mA3u1NDtITiWJdEyZrO/TPX2NnOqg2iuG0Uvn8hB+SGXx3DFSZKJ+uLaP
	39xNO/6ZKvK/D637uXqm+gIWExbBbJbLO/lvo60mdx5o6Ulvs/LKMWX5i4Vr6EBl2O2HX+YLLgiTh
	5ULZPHdqTn72hyTDi04kKNqujYIcaeEwnwg93kjyicbA+r+V7UJb08SJIYu/n8Mnqk6/7R4Zv4HMV
	Fv8Qhu6mou8dnY+qJXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njVsv-00Gpnc-RB; Wed, 27 Apr 2022 00:50:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njVsk-00Gpl7-L1; Wed, 27 Apr 2022 00:50:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D26761AF6;
 Wed, 27 Apr 2022 00:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 082C4C385AF;
 Wed, 27 Apr 2022 00:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651020612;
 bh=lrydYJjF8fl5pv7H7jwOfVqnpBXMFfGcvaZeDdva/Fg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MoZ1FVIDiB5o8z/s3NkMXhO/Xi8ksCvjfr1fdGZthOaGEMXyv1oy/gvJcrrLMuWkg
 pEPhr//c53V9o4fqWeV8OVN9FA+fx0hr+iQNt7vPdJOFg17bgn9UPu7cwrNvMnMktA
 o2Y1j0jrR0hxlE756del3m4OM9n37Bs88Dmmv+EDVg6vBCWyfseF/PYFKR/fpu2v/U
 aGgIfVLUlEQHY4ZvN8EVCUxeOSATI3pgseRdTi6blbU/i+DXPqWEQgeIw308AML4t1
 zJEKGX6VUDs5A1mrbZOpb52a6T7fDjGMLUpIFfyqXMNnv+K+5MFRI/cck63M/w0s9A
 FViFwR96nJcFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E06D2F03841; Wed, 27 Apr 2022 00:50:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: dsa: mt753x: fix pcs conversion regression
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165102061191.18100.15381630708714680923.git-patchwork-notify@kernel.org>
Date: Wed, 27 Apr 2022 00:50:11 +0000
References: <E1nj6FW-007WZB-5Y@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1nj6FW-007WZB-5Y@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
 daniel@makrotopia.org, andrew@lunn.ch, vivien.didelot@gmail.com,
 f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_175014_764984_5E1E919D 
X-CRM114-Status: GOOD (  11.18  )
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

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 25 Apr 2022 22:28:02 +0100 you wrote:
> Daniel Golle reports that the conversion of mt753x to phylink PCS caused
> an oops as below.
> 
> The problem is with the placement of the PCS initialisation, which
> occurs after mt7531_setup() has been called. However, burited in this
> function is a call to setup the CPU port, which requires the PCS
> structure to be already setup.
> 
> [...]

Here is the summary with links:
  - [net-next] net: dsa: mt753x: fix pcs conversion regression
    https://git.kernel.org/netdev/net-next/c/fae463084032

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
