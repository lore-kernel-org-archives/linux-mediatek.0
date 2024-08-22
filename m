Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A980C52D7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 11:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkFT/dQyTxNs9AOuqrF+LPbjOWc4GQtdXdxzets46qo=; b=w8lo50NC8sHuPJTZf72Ez7N2nF
	pXGL3dbqwPB2QNsRAjcJsyflLEJRatfvVWHbIaR9rHPNMCEs3Rz9eJQt6dIAQuCpDZyV/S6TtLPKg
	url2hR50xY44vBlB0Dk6NVCP5hkUz3rH65dKD4CwOIs/iieOvKZUMxKSkCQZHNQPZVzFuONXjrA5a
	eGgk8ZNaYuPBaMpgOUgpa7ZgLRHX6PnABeWPyamZu4jTt+ZVSvB/8EvDYlxIZn5TuzE8SnqHSipNy
	oxsRlFKhE6YvI6HxV+0rDKI56MXN46wgJAK9zlYHjEbp7K72KU9mUSuQni+N7PR5uMbNetSC0BapU
	k2XUkuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh62x-0000000CaN8-0uYL;
	Thu, 22 Aug 2024 11:32:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh61P-0000000CZyd-1NmD;
	Thu, 22 Aug 2024 11:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CBF5CA40161;
	Thu, 22 Aug 2024 11:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7CAC32782;
	Thu, 22 Aug 2024 11:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724326230;
	bh=732TUHJsVCkB+VsewfPuoLbr/UQnDzzjBPzT+7YBOvc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XOvG0IcWK2OLjQKhi7Akhp6uS93EqMf210IFl8tGyG3xXaMIQg+vQb+bkdlzp2VKi
	 J9mxVjRR1wcxeSNIBuoq7DXA8bYuLCTBa4ofNguztJ0+pspo66aud5l3YzyvFZKiTM
	 BNl+skEmVf4evFSLM6a2B0pZz90ugfhkvxf0CJuqDXPkfArS7IqnJ1bJlzACOqGQ56
	 if6zC0LeFKowOnvUhsYW1+yFzlrf0s/P4cKDd80QmoVeXPZ2NvwVSCCw6kbVx+vC6N
	 8tn88ETRHmCpO5Yb3jOITml0vqeYLVi7FlBeIw1lC7aHtKjVohI5fabl9v55w3V7Do
	 PzI+Fsc1avsuw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE3D3809A80;
	Thu, 22 Aug 2024 11:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: airoha: configure hw mac address
 according to the port id
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172432622976.2293429.5896662227992279102.git-patchwork-notify@kernel.org>
Date: Thu, 22 Aug 2024 11:30:29 +0000
References: <20240821-airoha-eth-wan-mac-addr-v2-1-8706d0cd6cd5@kernel.org>
In-Reply-To: <20240821-airoha-eth-wan-mac-addr-v2-1-8706d0cd6cd5@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, lorenzo.bianconi83@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_043031_455916_0F68A2C4 
X-CRM114-Status: GOOD (  10.38  )
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

On Wed, 21 Aug 2024 09:30:14 +0200 you wrote:
> GDM1 port on EN7581 SoC is connected to the lan dsa switch.
> GDM{2,3,4} can be used as wan port connected to an external
> phy module. Configure hw mac address registers according to the port id.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - improve code readability adding reg offset for {LAN,WAN}_LMIN and
>   {LAN,WAN}_LMAX regs
> - fix signed-off-by tag
> - Link to v1: https://lore.kernel.org/r/20240819-airoha-eth-wan-mac-addr-v1-1-e8d7c13b3182@kernel.org
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: airoha: configure hw mac address according to the port id
    https://git.kernel.org/netdev/net-next/c/812a2751e827

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



