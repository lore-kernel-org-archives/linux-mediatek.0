Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC83CD98F0
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jun 2026 22:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGhCX7nVBCzpVYU7WOdwE6u1flM0yS+pk70INf4ABPY=; b=A2i0rthJa+iGXwSXjB+ytc0FAN
	EoZJX+wuFOIrZIXoUYFJoE2ee6ptTlmc66luiU4F+fUdGM+POw+VCLmm9OqAoAiFNztPlgfIVAAJX
	hyE/5cyzOY6XmylyTVXqCoA/vQlFfSdgjTVbxwpVsX/YK21O25jZORW973yByV7DPbdqpt5ENyfaD
	NfbD52Uoupi79lOI6H9Unee8Kt9em5v9p3/F4UHBwkMAn3yHZfsvv1sKL45aP655Sme65H2bPaI9z
	CyDcUxlg0q73h6Y9lsPzl1kVCikElvlgsf3DUY4HI9D+vFQjJxRxOx3LG4qSxCymzUm1kc4huSem0
	I4SjQC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbQWl-00000004Cs7-19o1;
	Sun, 21 Jun 2026 22:20:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbQWj-00000004CrW-3lF5;
	Sun, 21 Jun 2026 22:20:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE27E431CE;
	Sun, 21 Jun 2026 22:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4F01F00A3A;
	Sun, 21 Jun 2026 22:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782080428;
	bh=iGhCX7nVBCzpVYU7WOdwE6u1flM0yS+pk70INf4ABPY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=fz7Jki9Wn4ZAVH2R9XkCLkF3gckwdHmzKWQVNXaHSn5qyAPQZKkX311tXXKU+SGE+
	 JPq5yKUsAbGSfLgP6tuk3AOgIwDOcJ0YW26RE3Gen6bS1lsqoVV+F8yAk0oV7Lh7Df
	 ACumfI67MmJveagpf2erbcBsuaJqw34jgMXdHi1S3WpZ/FnPzGOO9LEgvgbctFj7pq
	 UgAQBXkYsxtoUf5BWpJ9SjPg5nnmILQZzsOyQeq7g+71YAOeoKIAPJyPN37dku/sg5
	 xH5OSWwlk7UDVhdaDBbAk6C6ToO8p8ngWkTltrxsX/dKfGocqioWTkNev8X/Rdoxar
	 5G/wBmA3/LRwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568B93AAA6EA;
	Sun, 21 Jun 2026 22:20:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v5] net: airoha: Fix skb->priority underflow in
 airoha_dev_select_queue()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178208042004.521994.1468591358072405119.git-patchwork-notify@kernel.org>
Date: Sun, 21 Jun 2026 22:20:20 +0000
References: <178194366700.2485734.5368768965976693502@gmail.com>
In-Reply-To: <178194366700.2485734.5368768965976693502@gmail.com>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, joe@dama.to
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

On Sat, 20 Jun 2026 16:17:44 +0800 you wrote:
> In airoha_dev_select_queue(), the expression:
> 
>   queue = (skb->priority - 1) % AIROHA_NUM_QOS_QUEUES;
> 
> implicitly converts to unsigned arithmetic: when skb->priority is 0
> (the default for unclassified traffic), (0u - 1u) wraps to UINT_MAX,
> and UINT_MAX % 8 = 7, routing default best-effort packets to the
> highest-priority QoS queue. This causes QoS inversion where the
> majority of traffic on a PON gateway starves actual high-priority
> flows (VoIP, gaming, etc.).
> 
> [...]

Here is the summary with links:
  - [net,v5] net: airoha: Fix skb->priority underflow in airoha_dev_select_queue()
    https://git.kernel.org/netdev/net/c/86e51aa24686

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



