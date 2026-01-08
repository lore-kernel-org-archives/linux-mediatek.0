Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2439D0D17B
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 10:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecrDo7sGH5OOitKCjgj6e4IEMBar3NGe3f5qUSGr9mQ=; b=VNeoC9g2Nd2+WVvPO0PHzp+Fcj
	HRTA2CP20bRFicorQvGNIKzm0OxTKIu7MP5fjJrYXLo2Qz2QV92e27cEJwOZqEaTfsvkRgxgNcb89
	TGeuo7Ib/W8U3pIAHYmDDmQCws3f+hsOSehkfsfqWdLwiNgU1RfljR/QCjr4wt5jCIGHtbRn456lL
	CY7C1J1bX9UWQ5lm7TAGfyt7gnR+ZUjAQx5X/PUcPclX7QUUShX3+wSiJl3LMv3/zhNTLgDZuARum
	UFh0gAHJdCABb/uvcRaDIC9EDORz/RagB4nxG2k2Gq123IP6T3MNr0sOBPMFyrhqTcyzm6SITC5bj
	8fFJlMkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnKi-0000000GdXn-1F1D;
	Thu, 08 Jan 2026 10:33:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnKh-0000000GdXE-1hOs;
	Thu, 08 Jan 2026 10:33:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 716DD60007;
	Thu,  8 Jan 2026 10:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BB5C116C6;
	Thu,  8 Jan 2026 10:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767868414;
	bh=bzS/PjfPcMpnrR8b0KVdxQk9x4TACwFE5DrS+QCDpOY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LlJHjlTXVCw6tCautdO/Ycp25Nni4NGrkiqTbdh/AhaHQrLJLy8o5Y9hCbN6jCGWY
	 JTf15UgnIsq3HizY1e7TU3qg0VKh2DxaMmx8Wq1wTtXxdybWojDAodU+2rgXL1kosA
	 ZbzQEaVK+Z0AqFok805xei6hRUEiGtC0ySWNABEUn5m5jCsDhJzLCMbp+rNpRktTUV
	 E43yp2oAAYsNX0P9k+jpwevqtLzBECulGBqnKvpcJRpW8FowE3NrlQHfMfawseeSb4
	 /N22bcGqi0qxzjWRZxQ4R217/N3Ga/OCCyTsWZgoHLQSuGfPJ+2+eY1sbPG8EAak48
	 3v9GWS2XDcXjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F28783A78A5F;
	Thu,  8 Jan 2026 10:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: Fix schedule while atomic in
 airoha_ppe_deinit()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176786821079.3573457.449577303139061207.git-patchwork-notify@kernel.org>
Date: Thu, 08 Jan 2026 10:30:10 +0000
References: <20260105-airoha-fw-ethtool-v2-1-3b32b158cc31@kernel.org>
In-Reply-To: <20260105-airoha-fw-ethtool-v2-1-3b32b158cc31@kernel.org>
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 05 Jan 2026 09:43:31 +0100 you wrote:
> airoha_ppe_deinit() runs airoha_npu_ppe_deinit() in atomic context.
> airoha_npu_ppe_deinit routine allocates ppe_data buffer with GFP_KERNEL
> flag. Rely on rcu_replace_pointer in airoha_ppe_deinit routine in order
> to fix schedule while atomic issue in airoha_npu_ppe_deinit() since we
> do not need atomic context there.
> 
> Fixes: 00a7678310fe3 ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: Fix schedule while atomic in airoha_ppe_deinit()
    https://git.kernel.org/netdev/net/c/6abcf751bc08

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



