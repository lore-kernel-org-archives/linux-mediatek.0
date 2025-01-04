Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A15E77188
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jan 2025 16:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFlIya5QEtcnCxxQFNC9LPxsZJLacyOY9qZH4dweysk=; b=KoxIpj/TFZwPdDBge9urYIMzLk
	Sx0Ij1jC9kpvtTl4jgvBIjb35cCIGxzqNkOQJIKwcdtwh6zHVHCwtv/dbAtk8aJCq6ft390zEryso
	Oo8c+0Xb94gF6Ca5AjFE8o/6+AStMx9bUl2fTMNvKcyExp2goTFqSFE9H6+NvgHyNF2tS2qp2QrdB
	4JtPzQD6Uc5D6uR5ExKfqRn6vY0sXQKJcWMnKvRzKMO8giEadWs+7GZTlY8gEd7ZoQd/bQCzVpcnk
	zjcN3AflPuFuvK7y9QUadWEzppdOfvWG1XXuTI9zCEQlyz6lf4sfMOzZUAoNG2DCNZFbsf0L5QkLL
	aLFb5fJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7ET-0000000FHp8-1BFC;
	Sat, 04 Jan 2025 16:42:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7CB-0000000FHXK-0ES1;
	Sat, 04 Jan 2025 16:40:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 443B55C575C;
	Sat,  4 Jan 2025 16:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417D4C4AF0B;
	Sat,  4 Jan 2025 16:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736008814;
	bh=9aLkpmmVf7SzNW23WKff/899vc2RZPaEX/C1AwTTjhc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B/BZJomLq8T6g/kbiUaMhUidDDsPvvrqay/EX9uUHoV7pUIJz/zzmF1A1twcdLlPZ
	 DFtjNK0sS/+uY9JnG3jBfdFxJj9jkMsPoaYPagEg2znZ0g5WSs6z0vdMo2cqXzScBi
	 zoajya8k0vGCMMb1SsB3MDZkxzBxXy0sOPgfs/MuyQ50ivPD+cpSyWFpC3rLiq2UK+
	 vdnHkBd2g5fRe0adRRFwhJJjzqxxmVlFFZxqp70Uy930y99rG9epMvqLqSmbxffz5e
	 IWr6Txc5+zqBMxXI4cAQuBRijO2K+vUZ++TY4pE3RdqPaxLUvRc43HS9MFvDzSh5R9
	 vs4wH7Ar2EV6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34D37380A96F;
	Sat,  4 Jan 2025 16:40:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: pcs: pcs-mtk-lynxi: correctly report in-band
 status capabilities
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173600883476.2467289.906250535981566950.git-patchwork-notify@kernel.org>
Date: Sat, 04 Jan 2025 16:40:34 +0000
References: <Z3aJccb1vW14aukg@pidgin.makrotopia.org>
In-Reply-To: <Z3aJccb1vW14aukg@pidgin.makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_084015_134110_2B68585D 
X-CRM114-Status: GOOD (  10.94  )
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
Cc: andrew@lunn.ch, netdev@vger.kernel.org, john@phrozen.org, linux-kernel@vger.kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk, lynxis@fe80.eu, edumazet@google.com, linux-mediatek@lists.infradead.org, ericwouds@gmail.com, matthias.bgg@gmail.com, kuba@kernel.org, pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 2 Jan 2025 12:41:21 +0000 you wrote:
> Neither does the LynxI PCS support QSGMII, nor is in-band-status supported
> in 2500Base-X mode. Fix the pcs_inband_caps() method accordingly.
> 
> Fixes: 520d29bdda86 ("net: pcs: pcs-mtk-lynxi: implement pcs_inband_caps() method")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> drivers/net/pcs/pcs-mtk-lynxi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [net-next] net: pcs: pcs-mtk-lynxi: correctly report in-band status capabilities
    https://git.kernel.org/netdev/net-next/c/a003c38d9bbb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



