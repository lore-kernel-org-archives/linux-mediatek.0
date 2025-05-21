Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3FDC2D0CD
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 May 2025 03:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnP9090xrlib+Yn7hkl6Cgl01zf+cLiiOfsn9BCxvJg=; b=g/+k5MNjFRle3gtp7gVuGpDw6+
	VjXge4RH0YkaIDblf19YEfX2e2Yu+BHUOZJ6Fa0GlZXJqW9bqB9cyhW6G5nBnNVH2PZ6aKr008+Pv
	XZsjJ4cSBx3Bnqaz0yTAo1Wgd4plkFKS1KmltLpfFfTCGZ159o6PU/jmowyP5IFiTWFPw95vfRb0O
	zSkjg0ifRJZ87VxXhw2BdTyDrZHtkOeXuYiFUVzQ4zo5d+iaX+Kl9dvGycpmaHCl9KCKIzWrIa4Q9
	lAfnYmigCYt1OYgj4TdH55/iOn7MQVjWbXXD3MoPSbDCVNu5ZUtr7xB2NFCHmpksB4irv7m/40e8N
	oK6VN8Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHZuA-0000000Ees9-1yOu;
	Wed, 21 May 2025 03:14:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHZqQ-0000000EeZc-0mfc;
	Wed, 21 May 2025 03:10:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69A545C3FBB;
	Wed, 21 May 2025 03:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B7AC4CEED;
	Wed, 21 May 2025 03:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747797013;
	bh=mYCeKj/h9aqZRfQODr/Jf6KORjUNey+07JyzmQoYe04=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cEEKNSg50kKzC0Wjgu2BSkgq2kF9AiUexsiOvxG5UVZ+2eFXaNuiM5aCOvaGSwzFi
	 76JHYgTVT/1egl0JCMKuehDIcoj0rSn1fEVOdQ2An5lTSMosK/fghzskP2jzP5mf48
	 t4bHFaYSopbNH4Q1Anobd/eTjvFAC3fYXRTKp0fbDVl6v4nDvyk3NFt8ukP9Dt7wss
	 0seO9quZ8iccQYbHrU5KRqVlxNVM20dcuhrxV9fJ8s7h3or+QHViu9iGXxn85eGtCM
	 ojWWgWbv+6V4C7mc07RgkJZ5r1wNQbtpnpyXJkPVKMiIVZaCiQ0AM2p7CYXtRy+VF9
	 +XTFs0u2ek7DQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B7E380CEEF;
	Wed, 21 May 2025 03:10:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/3] net: airoha: Add per-flow stats support to
 hw flowtable offloading
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174779704873.1552321.963690772773932988.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 03:10:48 +0000
References: <20250516-airoha-en7581-flowstats-v2-0-06d5fbf28984@kernel.org>
In-Reply-To: <20250516-airoha-en7581-flowstats-v2-0-06d5fbf28984@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_201014_267055_65953B5C 
X-CRM114-Status: GOOD (  10.03  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 16 May 2025 09:59:58 +0200 you wrote:
> Introduce per-flow stats accounting to the flowtable hw offload in the
> airoha_eth driver. Flow stats are split in the PPE and NPU modules:
> - PPE: accounts for high 32bit of per-flow stats
> - NPU: accounts for low 32bit of per-flow stats
> 
> ---
> Changes in v2:
> - fix memory leaks in airoha_npu_stats_setup() and in
>   airoha_npu_foe_commit_entry()
> - disable hw keepalive
> - fix sparse warnings
> - Link to v1: https://lore.kernel.org/r/20250514-airoha-en7581-flowstats-v1-0-c00ede12a2ca@kernel.org
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] net: airoha: npu: Move memory allocation in airoha_npu_send_msg() caller
    https://git.kernel.org/netdev/net-next/c/c52918744ee1
  - [net-next,v2,2/3] net: airoha: Add FLOW_CLS_STATS callback support
    https://git.kernel.org/netdev/net-next/c/b81e0f2b58be
  - [net-next,v2,3/3] net: airoha: ppe: Disable packet keepalive
    https://git.kernel.org/netdev/net-next/c/a98326c151ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



