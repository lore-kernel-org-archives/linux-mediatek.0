Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1A5CD6E75
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2026 01:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weNg96zxEw0YQOLnRM6yhlBqLpFSoIZgsDdg6LWSa4E=; b=a0Ou2SNz+N26Qnr0j+m2E9FTId
	OT4gyp3UlXgfkt/7kZ20jFK2qgqkC2E/Dny4b612vA7SMralDVFUgwkDKeOElq3qSo7Hpm6LB4eUy
	BGPr3SLG1/eGGi/vd/19rz4kv2rk/Y+/a82wPqRLgUU1zJw+x2VoZ7NEfIshbokMvTIdcDWLC1cUJ
	+ivzF9NjFdDU/1LENHemjwLfbNzU+bQxRAlMd2VMDkuEJ488Iyf+yUPQOKeUjtCzmo2/WwykQPC7g
	u4pXA1rNpbm9LWWG3I/cquLa2BwrImlkvyJzIgE0OIZ/xTgvL5Y7SAcWdz2B2M3SIkHOFgd78UEvJ
	j/RnfJMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVJO5-0000000HW0F-2SyM;
	Fri, 05 Jun 2026 01:30:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVJO3-0000000HW00-0cQ6;
	Fri, 05 Jun 2026 01:30:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4338160103;
	Fri,  5 Jun 2026 01:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED28B1F00899;
	Fri,  5 Jun 2026 01:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780623014;
	bh=weNg96zxEw0YQOLnRM6yhlBqLpFSoIZgsDdg6LWSa4E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=DCFmOPDaH6XNj24ToBjQJOCu2J6zcZoRZ6/WA1oskRuKTU9HiobgVsYJOk+q2zeFS
	 gQLDtlTTZ8nI/T0p/K7X59cuTglFDyAmG6YQgPbRAanP3mNHUu0mgh2S/O20r8jsbL
	 jTnq8oZxr9QOPo6NcFpjjK3icE0LC4U1Ged+52VL6vQ4FUDKEMgj2cKyUgkkcsx2F2
	 CtxLesaj54PR1KdHOkf4C+2Cjk+QJl8G+iCxwh0Yfql/qWarr7y9dNhcOfvyoMIQAK
	 VcOSSHgkVDvt0fClGN/zlG31QrB5GWxfOaBMfrPIsVu3X57AD5BW9ze9bnOBOrHb3C
	 FtaV/n9CdHWxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D094E3930A8A;
	Fri,  5 Jun 2026 01:30:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Report extack error to the user if
 airoha_tc_htb_modify_queue() fails
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178062301439.3093327.853203913546216659.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jun 2026 01:30:14 +0000
References: <20260603-airoha_tc_htb_modify_queue-err-message-v1-1-33ec3ab997d9@kernel.org>
In-Reply-To: <20260603-airoha_tc_htb_modify_queue-err-message-v1-1-33ec3ab997d9@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

On Wed, 03 Jun 2026 12:30:01 +0200 you wrote:
> Report an extack error message in airoha_tc_htb_modify_queue routine if
> airoha_qdma_set_tx_rate_limit() fails.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Report extack error to the user if airoha_tc_htb_modify_queue() fails
    https://git.kernel.org/netdev/net-next/c/144969cd80c5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



