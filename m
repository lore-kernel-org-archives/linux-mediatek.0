Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEF0C98304
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 02:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qc7d2EWlAB6vGwNe4e6/zzd/A8J1JEyXp8FOsKTS5o=; b=Qr4Fi8/pSyocHgB627Ss88P71y
	7Tdw9UCVEp6Tw5dVSsKb5fbDohoEdwf797DNLuxlb0DqWRBHgBLyKsrk23poR+hWP/PooulMLxHjs
	bIJ9vaEbsUn054A450mPeBzomCcWh9ch6d/NedA6gEGMUFTzq3Q4uDF6w82DvAHoBegJct6/U6MtW
	sSoTGjna2cY2IROjfE/8FVZxwrtY7tT1OGep+zeHZohyV/pTUJaFaPxjZj0U3zZyoDlGhUPq7eXDb
	oXNfc2GunxtmqwhAipL/lW5fjDiv83nx39xElASTH3n+kQxym+vCEG/FmhFa+HpTXuCNV5oK2w2h8
	q5Als7GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ZFG-00000009s2g-1SDO;
	Thu, 24 Sep 2026 02:31:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ZFE-00000009s1s-1aUD;
	Thu, 24 Sep 2026 02:31:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E2746021E;
	Thu, 24 Sep 2026 02:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85461F000FF;
	Thu, 24 Sep 2026 02:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790217090;
	bh=2qc7d2EWlAB6vGwNe4e6/zzd/A8J1JEyXp8FOsKTS5o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JC5xI6yMewNWhNsEmO7JHny5cUGcQ9hRjrTCOpGEA7hCuTOaO71iLRgCRIouRJuFL
	 qeQIZpHkVP8d9aNMCRDhC2i9B2eHQeLTeohmixvAQKQHP4e3DVjsP7NNIBmPJ9iy5V
	 SEIlkyAb9Q3dNW2JVdoItMt1Ip+5ZW042ZB2aGPSgJmuYQnxGISbIBveFxSpf0ua/S
	 k34VaEIlqR9t4pROBMgDFb1qLEikHLLRsdkEzFKiBPGGDaZ6sNUxJh6zTbcbn1Q052
	 qPvIhCwNc/XHsoZCUpnGPhdgzCyS4TRlL4T+zwRJeHD+ksrZ2BVuf1pyBv7+3d4kyj
	 tFmJ2lPOdXp/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A6939E9611;
	Thu, 24 Sep 2026 02:30:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: npu: cancel wdt_work after releasing the
 WDT
 IRQ
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179021702008.1285615.10214789929001458933.git-patchwork-notify@kernel.org>
Date: Thu, 24 Sep 2026 02:30:20 +0000
References: <20260922000914.542068-1-mhun512@gmail.com>
In-Reply-To: <20260922000914.542068-1-mhun512@gmail.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 ae878000@gmail.com
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
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 21 Sep 2026 20:09:14 -0400 you wrote:
> airoha_npu_remove() calls cancel_work_sync() on each core's wdt_work,
> but the watchdog IRQ that queues it is requested with devm_request_irq()
> and is freed only after .remove() returns.  airoha_npu_wdt_handler() can
> therefore schedule_work() again once the cancel has returned.  struct
> airoha_npu, which contains the work, is devm_kzalloc()'d and is freed in
> that same unwind, so the late work dereferences freed memory.
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: npu: cancel wdt_work after releasing the WDT IRQ
    https://git.kernel.org/netdev/net/c/4bdee8060d1e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



