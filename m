Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A6FCAC5AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 00:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rryC/AI9nusKq/kN9WmTaa06D8ROPEukwcmlQ7HNUY=; b=lBwlgcsJ4QZt0NgY35XsYh2xbY
	PnDwi1tfGSSUsw9JV4bROOGXezE6uQy9SJBKImHBC06mjLXJvNfWFcWY1K+BPS8uXGq7QgewhRAoM
	pz4wjsSjnQbhGizX000IodPEUaFaOXkMG7SshQ0NFYLkL45CU/aLeoJnIljvh8Tc2ZJICQfim5VDY
	+wgNZXxrfdfVKsbmQTZVgInh/iS1pXpqvZ5veqNC6zGzw9wixLoAk5g8CYAMOa0ejs7HKxAHF5W4C
	eWmFsTOtmEVGBrHbYRrET9trMzy7lSk1xDe3i4TQKWx6EMCsldhKm991/3EXS99Rgz1SRp79fkh2V
	6ACTsx1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Cw2-0000000FBay-0Ex0;
	Wed, 24 Sep 2025 00:00:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Cw0-0000000FBaW-3B2C;
	Wed, 24 Sep 2025 00:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3418760211;
	Wed, 24 Sep 2025 00:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D800DC4CEF5;
	Wed, 24 Sep 2025 00:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758672035;
	bh=XQ5387VeiqYIFOjg5vsVPE0sAGAoAH+TzEKOi3G8ozg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MECXLCPMCnMxpgLiTlcLvDpbfa0px1tjSHHTSFplWTRDBWeU3XsNU+1tF+K8mfjpq
	 C+bbjQ/6Ui6sHDgbF9BoZQLSeo/VWyapteTvT7tZRW4VqfFyKw+0N/v8TaRkAZD3va
	 DMHUfsP/3d36twR6tNdPWkt5nom+bnJZzZzyQHJJ4BQ084sGl/f+T074bpWv4DUSeP
	 uOebdP6LYrC1RidXi6rVw7ZL9aRMyDgDPwKWeU4yk+JHOixHw7QK9OitEPV0+vEvkK
	 PnEbiqpPOFDFl96zBshZtq+Fq3hYr6m81CEiwnN+l9CQvKGsDJsm7LGFGCR+nC9Qnj
	 czB9EeMXWLMnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB16839D0C20;
	Wed, 24 Sep 2025 00:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] net: airoha: Avoid -Wflex-array-member-not-at-end
 warning
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175867203251.1967235.16855989267443539182.git-patchwork-notify@kernel.org>
Date: Wed, 24 Sep 2025 00:00:32 +0000
References: <aNFYVYLXQDqm4yxb@kspp>
In-Reply-To: <aNFYVYLXQDqm4yxb@kspp>
To: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
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

On Mon, 22 Sep 2025 16:08:21 +0200 you wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Move the conflicting declaration to the end of the corresponding
> structure. Notice that `struct airoha_foe_entry` is a flexible
> structure, this is a structure that contains a flexible-array
> member.
> 
> [...]

Here is the summary with links:
  - [next] net: airoha: Avoid -Wflex-array-member-not-at-end warning
    https://git.kernel.org/netdev/net-next/c/09630ab91d84

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



