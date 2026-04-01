Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96F910F9318
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2026 02:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Stq5PUCpdAv/LJBgiwUgdDzIj2dFhHSZ+EfCK/OxO9M=; b=31bQArDj6gEelWiTc3VfdWjpEa
	v6wAiXV6oGOX81EKYZInos0ZqHNmKtXmI6TeI2v6bRXCRSkeNA4VVF8p2XkT7Zx6hBUBrV755hh5U
	zMSbrzpJqwStqSQOSsrO0PFtPdYq+HBu6wpHzekEhF72ecEHgvUYF2B+NzWcwMdiC6D3CGvk8J/FY
	2/MGwl7PN2Ukr3jZXLNJGQkyb5sOczGufs84wsNBk2160d3iUEqvQvHuBl2Y/AXBeoDxVMPnmdEfu
	YrE50cHT3FwOTb701SkT6/p985EoUkS3Th7iQYYOItofNDOfVi+deJ6KvELwGLTTaIPtZxzyR8Eei
	dbWjHHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lVO-0000000Dr7S-1BkG;
	Wed, 01 Apr 2026 02:40:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lVM-0000000Dr7F-13fg;
	Wed, 01 Apr 2026 02:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8784C60120;
	Wed,  1 Apr 2026 02:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E28EC19423;
	Wed,  1 Apr 2026 02:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775011227;
	bh=F77V0qacPu1vsT0FF1/qkJ4lDD4ex7Tvwh26H0RDfT0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hnDQpZyUmF5pzivLNcBWW/aekszVoClHVqiREtpV4lnfq4i87xhLVMYTx1iKb/g3Z
	 4uDhC7DLQhaYkR3HRPy+TntSKakePRTJGutqWr30q8zaVGRoQzwJ19+gLteE90qHj/
	 GLB+F3WSL2znt9OIf1pERFatXlA1m/V3qa8GvIcBzLCVZnP7l+8XEY4K8h+swxRe7N
	 RjY4VK4sxHIWtYC5VXF8Fcu1+L4bMb1bz+RVzV70yPX2xS8hL6N7wi8eoNnT0Go5jf
	 M3Pe2M65I2LR0ff10Sj+WlhbitGBVsRaFCGFzkJkygdxv1cBTv2eb312hYJhdsa4za
	 KDc4zFeSXY8aQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0453808203;
	Wed,  1 Apr 2026 02:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Fix typo in
 airoha_set_gdm2_loopback
 routine name
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177501121053.3042140.8960610979272112652.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 02:40:10 +0000
References: <20260330-airoha_set_gdm2_loopback-fix-typo-v1-1-a1320ff6b6cc@kernel.org>
In-Reply-To: <20260330-airoha_set_gdm2_loopback-fix-typo-v1-1-a1320ff6b6cc@kernel.org>
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

On Mon, 30 Mar 2026 00:03:49 +0200 you wrote:
> Rename airhoha_set_gdm2_loopback() in airoha_set_gdm2_loopback()
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Fix typo in airoha_set_gdm2_loopback routine name
    https://git.kernel.org/netdev/net-next/c/a94ddc191f19

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



