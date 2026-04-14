Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA3AF531DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2026 00:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtaHijjT1rvbKzGQyz/wPXn7s/64Fj55XvuCDtLQSkE=; b=YM1vvDZwfp+WlEF7puSvG6C6da
	Vjxg+sNiyjjL6DPIFsp6npgqJmVGBWEjmWsmlIH1B7AuG1wqOOeId7m544uoKW1GCoSs7zlimSfRs
	QsDTa7Q0dAEhV1o99DR7Mw6OkzOgnWm/9cGIDj+aSFCT/aI+KCrqWMKzgTt9cGwuJ6fATzGgDEF4H
	20qvG5oaq5v+bwX9Wx6QGMEqAhJeEIhkxUfiprzKk8ySZer2qO8Vdp8sBH6M4U7dm2zYdZ4DvTdEu
	Ff0hfxhZndsYUPeqtndgLMGvpKmVQrlzE1eZqIwN3TKrxGCKKadPiW0njJfTF/jakK3WEZ35TE7Yl
	t9iqCa/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRW9-0000000GWdN-2Cfb;
	Tue, 14 Apr 2026 00:20:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRW6-0000000GWcw-2tKG;
	Tue, 14 Apr 2026 00:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BED744018;
	Tue, 14 Apr 2026 00:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C69C2BCAF;
	Tue, 14 Apr 2026 00:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776126033;
	bh=Onxb3IkXi1CkXKJYdmvYXkDz88SpNuG9G8aW4lomnb8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mLpdZ4F8MA8miCjtRlpTD2DspdpdcNAYpOyg9hV4h4LsxZuLRwtXFe0MnhmA5n9Ro
	 btkMtW/2gl4gvOslcKHeIryiylMT0QTo/LaiNTb4jX03OdaqPdg4oRpniTyW0x8I51
	 JjDQnjGUxCNNyyHiEZgnO//lIzIno1z8AI/SthCOQCe/BaEvEvJFEgvVQOajL1y51n
	 hSnyBKZXFsXczsMvmdd3E04Qpvra28rKoyHwb9589/yEnBMzluQxnwfaek7PVQjxHe
	 ebv3rEqj09Oqu1+Z0SSmwbQnDxAc4eGqCTqYbK2xwwp67HSewJZr2v1+1smvneNJNW
	 O4f0ZzLTtNqWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FCF23809A0B;
	Tue, 14 Apr 2026 00:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Remove PCE_MC_EN_MASK bit in
 REG_FE_PCE_CFG configuration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177612600505.611791.831863790646439804.git-patchwork-notify@kernel.org>
Date: Tue, 14 Apr 2026 00:20:05 +0000
References: <20260412-airoha_fe_init_remove_mc_en_bit-v1-1-7b6a5a25a74d@kernel.org>
In-Reply-To: <20260412-airoha_fe_init_remove_mc_en_bit-v1-1-7b6a5a25a74d@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_172034_749488_B58130C0 
X-CRM114-Status: UNSURE (   9.58  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 12 Apr 2026 11:56:25 +0200 you wrote:
> PCE_MC_EN_MASK bit in REG_FE_PCE_CFG configuration performed in
> airoha_fe_init() is used to duplicate multicast packets and send a copy
> to the CPU when the traffic is offloaded. This is necessary just if
> it is requested by the user. Disable multicast packets duplication by
> default.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Remove PCE_MC_EN_MASK bit in REG_FE_PCE_CFG configuration
    https://git.kernel.org/netdev/net-next/c/34e1a98ff2a8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



