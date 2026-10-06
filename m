Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844BECA5FF0
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 01:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmSHdEOjLyNe+GHx6L6yhQrxZwZE1u9619dhybyCLx8=; b=MOZqfqswDN1gat6tc6JR1Z63N5
	OBvV/dJ7xHf7mmcWpwbvcjv4o7ae3mGXONk6DjEek55DOllN4AHu7FzS1FxGxHfBlPNZNkDOEyoFi
	6M2oVU0KaOby8vY/K3Oqw49s59e+4iw3mW95ryP+vmAPfvC42C67KXEfSQuIoMZ5sP8KHrqu+DxKV
	RH12RMI5+SC3/8JvRJfrPEy96EbaP3AQXhDjPPXvaO4klTzjnKkZ+u60b91T7ZKCjSUKWIpglE5s/
	pnoJoYr/l8BQZpyS211YsGg7q/+XULCaNeGGgVgMOVyTfEKGgS7im8gK2As2lWaVYzkgkEiYjJSAd
	DTbE1c+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtXO-0000000HRIk-2D8y;
	Tue, 06 Oct 2026 01:00:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtXM-0000000HRIR-273E;
	Tue, 06 Oct 2026 01:00:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 185F7601F1;
	Tue,  6 Oct 2026 01:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8417C1F000FF;
	Tue,  6 Oct 2026 01:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791248406;
	bh=fmSHdEOjLyNe+GHx6L6yhQrxZwZE1u9619dhybyCLx8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=AZ4hZHttCyXm7ZE36P8yA6Hr+o+dgADV1/ZWhB8sAPBr2wTczj2cJ7F2hsNeAf5YX
	 RuvsdPE7lP9Uy+DxyR3JuC7kweFufqpJI7EcWnPm/hJdR2VDOsdke+IaUDeWyNC/e5
	 lhUdltCi4wZngBz1AcKPMNUniLR4V4bnOKhAS1BLdcV6UMJoZKxbzxG0zb+qnECT3Z
	 +1ErjRqIvmx1dHxd6s8X3EZheMZmOpUVIfSBgWbhX1y5saTR8ufp9rp/EUtEZ4eVdr
	 psM/lzeTKjgFU/aLhruA29ALhzTFwD15HNGDe1Vs25O6FijtYusrSZ/Oz/E3n/rhks
	 SiWbNHzhLinBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77382392667F;
	Tue,  6 Oct 2026 01:00:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v6] net: airoha: Add retry mechanism to
 airoha_qdma_set_trtcm_param()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179124840530.1963510.8749215756359738246.git-patchwork-notify@kernel.org>
Date: Tue, 06 Oct 2026 01:00:05 +0000
References: <20260930065855.46171-1-ansuelsmth@gmail.com>
In-Reply-To: <20260930065855.46171-1-ansuelsmth@gmail.com>
To: Christian Marangi (Ansuel) <ansuelsmth@gmail.com>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Leto.Liu@airoha.com
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

On Wed, 30 Sep 2026 08:58:48 +0200 you wrote:
> From: Leto Liu (刘涛) <Leto.Liu@airoha.com>
> 
> CPU accesses QDMA via the bus. When multiple modules are using the bus
> simultaneously, CPU access to QDMA may encounter bus timeouts and fails,
> resulting in QDMA configuration failures and potentially causing packet
> transmission issues. In order to mitigate the issue, introduce a retry
> mechanism to airoha_qdma_set_trtcm_param routine in order to ensure the
> configuration is correctly applied to the hardware.
> 
> [...]

Here is the summary with links:
  - [net,v6] net: airoha: Add retry mechanism to airoha_qdma_set_trtcm_param()
    https://git.kernel.org/netdev/net/c/7e170da2edec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



