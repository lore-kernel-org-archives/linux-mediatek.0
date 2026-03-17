Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8909CFB5EA5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 03:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ags1508hqctTNeI4FaW9uaScRaN+GCxhdbWJtuo0FWs=; b=Jp6vKcyOHQUZyZCOfNrQEZatJg
	jIvKvLROar75vtE8M5Z+jYbICpzwY8aWZu4c7GmQMskakmjHuI6+Pr5kfIvh0xcj8jMYq0Gpw5fdC
	XolDI6BDaljjRxVKG6KVfABkpzIU5MWi1WYP1qOZUUlF0xioEK2bMmQa5WNGvqrs0WAn+8SUl4kHQ
	wy5C95ZMQfNb4pzLk/n8yVKUlXJe4tGWjlR8TFwTnZbDD/w+XMCyWB+C7h7eaGG/avgNKSFO+1Hj/
	u2VYDhTb2dMOscdrTO7I4DUxiuVx1Kr4XZKo8SVdQ5Ch6rvJZhiwGiaXpf8fDwzZXGkjMrpTGpFP1
	kU1hl+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Kyf-00000005IHR-0WGJ;
	Tue, 17 Mar 2026 03:20:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Kyb-00000005IGx-2pG9;
	Tue, 17 Mar 2026 03:20:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DEFB44480;
	Tue, 17 Mar 2026 03:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAF7C2BC9E;
	Tue, 17 Mar 2026 03:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773717612;
	bh=oqTNXqkviwDGTSDtH+rFg1gJ0FmxRCujky6kSluFiWI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JQXeArL52++LQT2S5te0nBz+LQzVymVPFdk6vU15fjRo1jJlSzLUPCJzBMWjyFwr9
	 w6b6JPlMUh9+36KujHNzLWtbOFrrfhBYznJJ94GjadjQrps0MSqwuLJxiIGtCCKKCK
	 NQVYCpJFhvEQ4YiRYl+Bp6ufIbCtQUutWrwKtpsJMf2DXBk4UDNeCuEcmGEWUfVWCu
	 wW07bpy3LrEA5NgDvzB0d9wuk/BB5lnCz7SBC//SUCVPQA+3vcK+tQEcfJzJcOwVLp
	 nNf3XcpxxB8e2xS33KKSa8Xyu9SVjQNiLX4dy/hJ4Xi92fm1lnRFZp3wm0A4sN8lO/
	 NStLhyqW6g98g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EF23808200;
	Tue, 17 Mar 2026 03:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: Remove airoha_dev_stop() in
 airoha_remove()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177371760554.3410412.10803597762901231446.git-patchwork-notify@kernel.org>
Date: Tue, 17 Mar 2026 03:20:05 +0000
References: <20260313-airoha-remove-ndo_stop-remove-net-v2-1-67542c3ceeca@kernel.org>
In-Reply-To: <20260313-airoha-remove-ndo_stop-remove-net-v2-1-67542c3ceeca@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_202013_761017_EAB7BDF1 
X-CRM114-Status: UNSURE (   8.77  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Mar 2026 12:27:00 +0100 you wrote:
> Do not run airoha_dev_stop routine explicitly in airoha_remove()
> since ndo_stop() callback is already executed by unregister_netdev() in
> __dev_close_many routine if necessary and, doing so, we will end up causing
> an underflow in the qdma users atomic counters. Rely on networking subsystem
> to stop the device removing the airoha_eth module.
> 
> Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: Remove airoha_dev_stop() in airoha_remove()
    https://git.kernel.org/netdev/net/c/d4a533ad249e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



