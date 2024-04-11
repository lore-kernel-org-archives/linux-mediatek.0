Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A9ECD1292
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 07:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWRgSH0+xiShCW4OY1cPSDkVq5l6C7zn8gT/1IIRTWI=; b=FfynoIxuzVpKkX5FrpYlPWSR7M
	kjqvWrmOw9nRd3oILQXQ7Fhf2fwWMgTdHGm7yDxjs0NUGbklAcDidKFhC9I+K+2lpOjbuQuEMUCdS
	2bRcYqApFYudyJAuSSf3/vSi4C+a/OoR9hrZoIc7mbs7lwQ8I88UhmXvtFzUbfMUT6tqo+A3VLqLP
	lXUmAgwQcRX4XgN1yeyAe0QpuiSD2QxZNbQDrYYUUd10BdHpl2xBzEOwCA9YernRQUUBzcj6EdL3R
	8HOQet6fKAkejTLV5iGGwhH3gAO2hvsQMSlOOZOroTH7JenSBrXjzfAyTlsfOTG4LwgCoi2QuZOKK
	lRVzmtMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rup30-0000000AuGO-19Jz;
	Thu, 11 Apr 2024 07:40:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rup2t-0000000AuBo-2tnk;
	Thu, 11 Apr 2024 07:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DFCE0CE2F4B;
	Thu, 11 Apr 2024 07:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2096BC43394;
	Thu, 11 Apr 2024 07:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712821229;
	bh=WN6WaVVKPVzN1O+fWKy4FYDq59aud5xZF7mOkpu11LI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gFIkAYs2EkWX00Vj7c5JkqiwbPeTMCFZ6Z6iMTmRFtFyNNvl90bDkuH8Cgxtnmf37
	 dDlpoJeQG4kpVZQWhmKrDmlhFAJsUzk4CDzuIAmehrfSpSls5xXZHOj+KymRlB4BtM
	 Gm5/mFJRxCg+AYEtkhA2oKmBXI0Wr7IAshtnH2ykLVI05LePqGzmE6F5WJhFoOV0T9
	 CnuYEkvbUUfo9MLwLxRDwBbz+m+YTE7F/w6UAbh95RVlVzTffARNDXnneM/yvVOBJ9
	 V+WGg3IDpPGMS4Ne1w7te9BdiO+kNLyo4tGXf1a24VFXxcGln3ZV+UTbK5u0TRIhJM
	 mCebcBNdZ8XrA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0C764C54BD0;
	Thu, 11 Apr 2024 07:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: dsa: mt7530: trap link-local frames regardless
 of ST Port State
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171282122904.27809.12270334252049024856.git-patchwork-notify@kernel.org>
Date: Thu, 11 Apr 2024 07:40:29 +0000
References: <20240409-b4-for-net-mt7530-fix-link-local-when-stp-discarding-v2-1-07b1150164ac@arinc9.com>
In-Reply-To: <20240409-b4-for-net-mt7530-fix-link-local-when-stp-discarding-v2-1-07b1150164ac@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCB2aWEgQjQgUmVsYXkgPGRldm51bGwrYXJpbmMudW5hbC5h?=@ci.codeaurora.org,
	=?utf-8?b?cmluYzkuY29tQGtlcm5lbC5vcmc+?=@ci.codeaurora.org
Cc: daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 bartel.eerdekens@constell8.be, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_004032_004307_76698135 
X-CRM114-Status: UNSURE (   7.04  )
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 09 Apr 2024 18:01:14 +0300 you wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> In Clause 5 of IEEE Std 802-2014, two sublayers of the data link layer
> (DLL) of the Open Systems Interconnection basic reference model (OSI/RM)
> are described; the medium access control (MAC) and logical link control
> (LLC) sublayers. The MAC sublayer is the one facing the physical layer.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: dsa: mt7530: trap link-local frames regardless of ST Port State
    https://git.kernel.org/netdev/net/c/17c560113231

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



