Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE29C19F2E
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2025 13:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4MoQ9cEAhkqGNwSMRKP2vAO1WBCM7nRNILdvnioR+M=; b=eLoTp+IXFJPZi3YCg8cParIL/H
	KECie345Os9X8yzFCCvdP8E0R25Ac3yRSwTtj/I0rFe9aMhwiemBRt2Q01nOuyW3yf9wVYWz18uDh
	pJ/Hswoo95P3yQGSsJzLzssSCcqykvQetiJTnfO6mz8sEbhmV6UByzUoqQMMVyNT3+vb6acFm0g5J
	0bbbHrUa38/0coAU+0Vn36tWFD8TRn2hG2SscxcGaZWP/QWLGMeliRFZh5fABDAiZ7Lu87TbOGWBY
	IHIONJPvCSKbdHOnRHOncqhSrHQfzT3NyiHoeEDsc7JfR/p0VTttN1jjsPlKoXUkq4w+vzNoUg1lE
	FngrV1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tneB9-00000007a5Z-470T;
	Thu, 27 Feb 2025 13:43:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tne7L-00000007Z4C-2D9i;
	Thu, 27 Feb 2025 13:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B69645C584A;
	Thu, 27 Feb 2025 13:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E04C4CEDD;
	Thu, 27 Feb 2025 13:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740663598;
	bh=cHUQXYpMECA1CrjD2oF3utlXd4IOvTws7zBps4QG/YU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IUdi2pHsnjtC3+oCFGu6yr3FYLbI3gp7NuuthL2YRkCo7aVzirJzZhkujCiXeQETp
	 9XTt5Rgej4zUn5LYmcH6/guD1uS4xm0ggMl0rwSO5v6ybcuf0hMgM/54K3NGl+EVRx
	 qmbKwkeclEETmkS5opO3f10HRN8zOd7RGgNHbgWAUx00KW78XxQXFIM5+VqIE4GSl6
	 R3/rrDP0JOZW51rh273W9yDcHM+uF2/gz3evgGulQP066tiHOCMPoqh/NQCv/Q1lZQ
	 HUP3/dt9ej9u0nKc1kRzz3nBMTIc82I+7XlRwpuPaBMkUL+bLHnKC7VvRGSA/Ajj4K
	 ts9cEsAGnJDJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C61380AA7F;
	Thu, 27 Feb 2025 13:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 net-next] net: ethernet: mtk_ppe_offload: Allow QinQ,
 double ETH_P_8021Q only
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174066363025.1432096.10317097850381047661.git-patchwork-notify@kernel.org>
Date: Thu, 27 Feb 2025 13:40:30 +0000
References: <20250225201509.20843-1-ericwouds@gmail.com>
In-Reply-To: <20250225201509.20843-1-ericwouds@gmail.com>
To: Eric Woudstra <ericwouds@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_053959_612797_6B05B388 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, sean.wang@mediatek.com, daniel@makrotopia.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, nbd@nbd.name
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 25 Feb 2025 21:15:09 +0100 you wrote:
> mtk_foe_entry_set_vlan() in mtk_ppe.c already supports double vlan
> tagging, but mtk_flow_offload_replace() in mtk_ppe_offload.c only allows
> for 1 vlan tag, optionally in combination with pppoe and dsa tags.
> 
> However, mtk_foe_entry_set_vlan() only allows for setting the vlan id.
> The protocol cannot be set, it is always ETH_P_8021Q, for inner and outer
> tag. This patch adds QinQ support to mtk_flow_offload_replace(), only in
> the case that both inner and outer tags are ETH_P_8021Q.
> 
> [...]

Here is the summary with links:
  - [v4,net-next] net: ethernet: mtk_ppe_offload: Allow QinQ, double ETH_P_8021Q only
    https://git.kernel.org/netdev/net-next/c/7fe0353606d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



