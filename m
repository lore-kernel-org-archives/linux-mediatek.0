Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9C3C7115D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jun 2025 19:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2yJIqbe/a2gRDDbhKhvWTaM933cv/HNrekpVoEZjAY=; b=ChJwAdcm7OgV45uW1bUVfuEpOB
	YZqSyeOBsD0AzSw9N/eeYvJ6WZSnHC+ZOBgQPODlGYIclOgZ0YK1gnDLiZM3yCEvw7gBiGylRV3du
	NuwurBdICHCEWAHsp5DOfqm4xq28cOpGCDxOLzciaRjJe1qBa39o9s+KtO4I72nWyRPB8JS9C2JIz
	hRGGxd62P4uFAUEL+uYdghPmXks8BJclKV5g7F4yIayTL5SOHQbmcJ+R+MWq9ZfhhJMGheuwVxMU1
	auwhdv01Kas42981RYYP0nT1h+gGDcNsf7oV5Dk1VwVKxuCJQWIkSvb8SG5+KUSekao9SiF/JBKKx
	Q90zVcuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLE5-0000000E7mz-2HAg;
	Thu, 19 Jun 2025 19:47:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHMo-0000000DQrz-0h0F;
	Thu, 19 Jun 2025 15:39:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BD191A54693;
	Thu, 19 Jun 2025 15:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62299C4CEEA;
	Thu, 19 Jun 2025 15:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750347592;
	bh=jV+OZCno1T5pQq8f29xXiDkJq9EOGCSTlU81ln72ilk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MI/CK0/YyCyldQ3UHxDwvcWh+gFyWAXDaWmski7hPotpFAvjr5eu/4gZ0f2rtJ46z
	 US4hxKotdPLGyGK60JVv0WswFpWgHuSexIQqCPDDdlLtkJ+UP8SS4IL8caNprXHFzi
	 pP9CNAS5+eeGfnHT5Xm94lIjWtWculPwTfhPiXimiuGF1mFV0BQzGWHzO0M1caH/Zz
	 W9M3Dv7rdqMDgaqMRad3PmDdJo1Uk+BMjwxxuuRUF5YhRyejh3uMNYYK2D/T2skAQZ
	 LTIBmMXZe/qKU/+86uuW3mZmae6WBesbFL/EcNiImkv9aYc8Ye5eQpdA7ZbEoXvLJq
	 YXfIWnMRBVvzg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE7A38111DD;
	Thu, 19 Jun 2025 15:40:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: Always check return value from
 airoha_ppe_foe_get_entry()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175034762024.906129.12155603666888344760.git-patchwork-notify@kernel.org>
Date: Thu, 19 Jun 2025 15:40:20 +0000
References: <20250618-check-ret-from-airoha_ppe_foe_get_entry-v2-1-068dcea3cc66@kernel.org>
In-Reply-To: <20250618-check-ret-from-airoha_ppe_foe_get_entry-v2-1-068dcea3cc66@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_083954_268521_CB2BA62F 
X-CRM114-Status: UNSURE (   8.61  )
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

On Wed, 18 Jun 2025 09:37:40 +0200 you wrote:
> airoha_ppe_foe_get_entry routine can return NULL, so check the returned
> pointer is not NULL in airoha_ppe_foe_flow_l2_entry_update()
> 
> Fixes: b81e0f2b58be3 ("net: airoha: Add FLOW_CLS_STATS callback support")
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: Always check return value from airoha_ppe_foe_get_entry()
    https://git.kernel.org/netdev/net/c/78bd03ee1f20

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



