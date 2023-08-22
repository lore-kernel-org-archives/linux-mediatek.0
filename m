Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6504CEE49AA
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 02:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzUFvxPDlvp244ge7STeGWyfiymsXJ3ns3RhUH87ntk=; b=zePnq+UitVnoX/6BFP2yti8ozx
	ddsEPJg4NJcTzpwb7NZ108oAmv6m30GX2q5FeiMpcUuNDQWxHRD7PUL5YFaeWo8XE1p3tIwvpFWaR
	BQ6nTSvkwB1ZNeEx9M3T/Rjgc1+qePV/6N3HMFCfOmrVqpRlO8/DNBew9J2GHEA+FdzXluof/iqHY
	zF/aaefKubcVeRpAQyWY7tM2QmisnbqXZfumnw1NTcC4KdZI+hQ9O4fTN47Vy0x118BWC4upXeRv1
	CrI8g1ZcNVbwq3Z3FAef/ouSBWiMp39RK0BhgvnHsnu00i1k2W/J6xxGbZDHK7yzTcQYtV76wI2sZ
	BQ7+D+YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYH0Q-00EyyV-0S;
	Tue, 22 Aug 2023 02:20:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYH0M-00Eyy3-2c;
	Tue, 22 Aug 2023 02:20:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65EDA6169A;
	Tue, 22 Aug 2023 02:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF374C433C9;
	Tue, 22 Aug 2023 02:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692670824;
	bh=WiuutlKZGSfnMqcEk2Hi4ACANiW2639zyoroXwPM8rY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qWwXRsyzXz/KvxTnNXQ9LEanWGs786Wm+OXoPuh2fuCHLLhwhBE8yyKxOB0xk3Wvj
	 qDfNH2UoUt2j0sAFtlNTwJZwF/2DBvjBgyf+4wpsO+ex5Jc2laV4fuPavls02355Ki
	 MTg6o6ODcPUVQm2aYtF6GXCB2zp2O9IXm2CzInxd0WO39M7KaIwsJ6TAJhh1jsgoIJ
	 yu3HQat2zAsLmpM1pA7v1MEC9nfyT85wY1PuueulyBpaDQC5S3lAAFxKSd7hImXWak
	 O5ShNTCb+xbbCva0BjuzdEWmYhIuyITcTiWUYgDWSVLl2SUB7KtpcuVMhosMCNMY/x
	 S6noww69Hm7vg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A0B5BE4EAFB;
	Tue, 22 Aug 2023 02:20:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: pcs: lynxi: implement pcs_disable op
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169267082465.27540.3832216650125518638.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 02:20:24 +0000
References: <f23d1a60d2c9d2fb72e32dcb0eaa5f7e867a3d68.1692327891.git.daniel@makrotopia.org>
In-Reply-To: <f23d1a60d2c9d2fb72e32dcb0eaa5f7e867a3d68.1692327891.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: lynxis@fe80.eu, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_192026_913782_BDB3FD48 
X-CRM114-Status: GOOD (  11.54  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 18 Aug 2023 04:07:46 +0100 you wrote:
> When switching from 10GBase-R/5GBase-R/USXGMII to one of the interface
> modes provided by mtk-pcs-lynxi we need to make sure to always perform
> a full configuration of the PHYA.
> 
> Implement pcs_disable op which resets the stored interface mode to
> PHY_INTERFACE_MODE_NA to trigger a full reconfiguration once the LynxI
> PCS driver had previously been deselected in favor of another PCS
> driver such as the to-be-added driver for the USXGMII PCS found in
> MT7988.
> 
> [...]

Here is the summary with links:
  - [net-next] net: pcs: lynxi: implement pcs_disable op
    https://git.kernel.org/netdev/net-next/c/90308679c297

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



