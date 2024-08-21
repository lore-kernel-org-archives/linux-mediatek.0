Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84939C52D6F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUkr6o+OC9enXEW9rEhCv0bmHAbyhQBm4qzEPwuNa2Y=; b=kXmpO59c2DV0Sol2hK2F0vOG41
	l7tXgbzK4qqrvDTa5zKwgB9iibnrWDXheWi2FxXi/OTa0jfAV4EqvF6XHJotuf34sGcw8oRys2sPl
	xKtJNvOjJE8f3XpKidno0OLTKWCY6AKkuBp0C8iYm36BCZhRKKpUGcviMljvWLD3x8PxFjA5ejca5
	fdgtqg7iFcCdKyyIJn8ofoz4G39U2EYqQeHbCIxgs7007DauTD8Y+6FCrhqd15y3x2CiIH+nvjdWV
	CNz7l/F5Yn8IBs0bN7p+wAzbvh9h4ChPf6+4v7q1CzdGGxxw7jCH6XuezhqKORqulydbUPKo6MCj9
	2iNY7VhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgk1g-00000008pIR-2RgJ;
	Wed, 21 Aug 2024 12:01:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgk0w-00000008p81-0ujZ;
	Wed, 21 Aug 2024 12:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 80EA861011;
	Wed, 21 Aug 2024 12:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C38C32782;
	Wed, 21 Aug 2024 12:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724241633;
	bh=IPSEdjvoIX5rdMbRTM7WwdPlptvwR8o4WpwCojpwIFw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=I/XSPwKyIdIrIO4d2LVXa70dwyybys8EijgLbXMhyICZ3jBluQBBREVk04froteb+
	 DDXXvmrSNMO7NUKUzp0p2PgAO9ZfJ8P/LQiuDZ2KLfTAVZmCOiqhRy2kmO9whiXKy7
	 lD5+O32w0ITA8EJpqkMtn8Few9R7SVFvyeGCQgBqAW+029PK09SNFqEg1yiy3fGEZK
	 dddATFPS16Qsy44EgVaXHvk8EejoE16ykqlyt21C70ZXHcyIpIWQrtlduV1J+mTyon
	 tfuk4+buy1N/3zQuHCOkPVSG/B9x/snO6zCrv8FuUSaq5dLPpuLUtrbJEKJpB2DJQb
	 PdSeCCCGDsoHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB5E03809ABF;
	Wed, 21 Aug 2024 12:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next v3] net: wwan: t7xx: PCIe reset rescan
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172424163277.1699659.13229153782791615531.git-patchwork-notify@kernel.org>
Date: Wed, 21 Aug 2024 12:00:32 +0000
References: <20240817083355.29811-1-jinjian.song@fibocom.com>
In-Reply-To: <20240817083355.29811-1-jinjian.song@fibocom.com>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, corbet@lwn.net,
 linux-mediatek@lists.infradead.org, helgaas@kernel.org,
 danielwinkler@google.com, korneld@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_050034_321691_A871117B 
X-CRM114-Status: UNSURE (   8.41  )
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
by David S. Miller <davem@davemloft.net>:

On Sat, 17 Aug 2024 16:33:55 +0800 you wrote:
> WWAN device is programmed to boot in normal mode or fastboot mode,
> when triggering a device reset through ACPI call or fastboot switch
> command. Maintain state machine synchronization and reprobe logic
> after a device reset.
> 
> The PCIe device reset triggered by several ways.
> E.g.:
>  - fastboot: echo "fastboot_switching" > /sys/bus/pci/devices/${bdf}/t7xx_mode.
>  - reset: echo "reset" > /sys/bus/pci/devices/${bdf}/t7xx_mode.
>  - IRQ: PCIe device request driver to reset itself by an interrupt request.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: wwan: t7xx: PCIe reset rescan
    https://git.kernel.org/netdev/net-next/c/d785ed945de6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



