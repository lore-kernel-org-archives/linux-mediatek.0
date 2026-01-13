Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A581D2F325
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jan 2026 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0h60rz8OQX7AuPlePm8hFlmwbWRnjYTGvpuQy2DWfdo=; b=BRWF4m3BXCQJLpMsuia9iENrPH
	9ZcopQhftk60KcA3+XJabIzBeATO8rzzdq1/oLspLs7Hpvqiu0+o5R2PMAma7y3CfpDC3DArC0y6Z
	6MFoZkCsQ+uj4Cv0t//Yi5dL4X5laamF0tbt2KoilBZc+U9NAnL/grfryMftuZb8wTPv86L29Umj+
	A9/MbfI1WAdGNL+fiEwd/cKpSfYNURLOUUKxV+uj/q+uRxxmIcaY6vbiGKVIXYvFl/2snJaJoCcWL
	SH6i20kEKzaaHMfIR39MfUfmjnQwnY5hNMyJhBXF5sCPLji/uHf6uys0h9iy7aKA6eNCisFtyvDXn
	/ePB6hqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg5Q-00000007LGU-0vv4;
	Tue, 13 Jan 2026 15:13:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfg5O-00000007LFW-1qua;
	Tue, 13 Jan 2026 15:13:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B372E600B0;
	Tue, 13 Jan 2026 15:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491F2C2BC9E;
	Tue, 13 Jan 2026 15:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768317213;
	bh=ogyBPwEl2kLjnHwSzJ6tn0JU+Pl+B4TgKzZ7v+/NVtg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cHbf8sIAknuIkoIKXAZ9Kio4X2id1ByWBU/znd5GdRn2aqNQbu56gAnI6Qmwz40YI
	 ja8Po1/GTvBbc+z4LR/e+6t+ntHxbfzc7E4cYZKukCdAguZFzjQLHvQogVfIxjaAuD
	 jFyD392K0ta91S+3LZe8C3AOzsOTPIWlPNP09CQVRSfqejQ8uPfBEYKDwPXB8kQwpm
	 lfkOl+4VZbi49UzMTHDaZCfk11xCxfxtIObY/k7ksqYPEFhWDC7JKNZs3YvuQdR0y+
	 0Z1BU6zpBdEcHZ3VgY1nl9NX+e0SHpCVZkeFdXnvyofFAJQgSrePLveZWuWenndkYs
	 yxbXX1MMNsS5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B675D3808200;
	Tue, 13 Jan 2026 15:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: airoha: implement get_link_ksettings
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176831700647.2290468.15768850457756402576.git-patchwork-notify@kernel.org>
Date: Tue, 13 Jan 2026 15:10:06 +0000
References: <20260110170212.570793-1-olek2@wp.pl>
In-Reply-To: <20260110170212.570793-1-olek2@wp.pl>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Sat, 10 Jan 2026 18:02:05 +0100 you wrote:
> Implement the .get_link_ksettings to get the rate, duplex, and
> auto-negotiation status.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - net: airoha: implement get_link_ksettings
    https://git.kernel.org/netdev/net-next/c/50e194b6da72

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



