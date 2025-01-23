Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B2BC02182
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jan 2025 04:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJjMt2avK2ejUdcL20POZw0MFpmeK2bodKGXA+6Z/Uo=; b=QdQi5uSAiTKQElgXy10sY++IcT
	EdG/ndkSUO1OA9rQtnoZT1HaUsTfdQ1QdnIUBoFpUOVH+Br2PcMVruFtX//QFCbk2UQcObIo+3kKr
	99VhZ5uSXL0tj5vRnJHXFxDwQh9iGSEgcY3SSYmzYhYDxKZPcrxawobJboGImsQafNygXbGTJK+e+
	hM69HH/CySX2kVoYyN/rIkYd0+oU+TDwCytUbmAO4PxWdCWWrkyiC8AfXovm5Pw+A7RYNHw19RJXb
	xyxm23xOCUnBKIPNKsZsa+q/j8PGzx6c+O7eTgK7s06QALk8208gHco2Wujn0WULRzAuL57wG+I3u
	yuPO1wlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taoZ1-0000000BfJd-3pyI;
	Thu, 23 Jan 2025 04:11:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taoXi-0000000Bf5j-0YKu;
	Thu, 23 Jan 2025 04:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3758CA41416;
	Thu, 23 Jan 2025 04:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC76C4CEE1;
	Thu, 23 Jan 2025 04:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737605408;
	bh=daqV2j5gKWoRRAkiUI749/S1FrgW6ntJamzuwaoxGxY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=arRBY/Z2wKPtTGv1SRBHhnMXAeqhkibD4Jd0pu89xYNvZvumeQ6x+Imy/AAiKMS6w
	 Xczt1+jJazdSEoD2Zm8+4RedyiSLZa4WRIS1yJOq3lPB6+XicSX2rrHCJcNASn/6gv
	 s1RrCkMdrE6RCN9PKjQfCPHTACPVa2y8yYRLJfPQ3imlYVjyeyuVCB4q+/tRmpkjyi
	 7mQhsWU4vfuSuA+MjdEkk494mwPVGx5taq85RePYsPGYg9GPZN7PVldV+VapJNytY3
	 wEM6QqHn9pTxEiKfAs0WthvSa4mPO64KuRQG3EANZlhHgMjkEt6aySqH3C9QR4sdX8
	 C3uXOpzfLfplw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 340B1380AA70;
	Thu, 23 Jan 2025 04:10:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net PATCH v2] net: airoha: Fix wrong GDM4 register definition
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173760543275.917319.6422811627993615173.git-patchwork-notify@kernel.org>
Date: Thu, 23 Jan 2025 04:10:32 +0000
References: <20250120154148.13424-1-ansuelsmth@gmail.com>
In-Reply-To: <20250120154148.13424-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: lorenzo@kernel.org, nbd@nbd.name, sean.wang@mediatek.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_201010_237043_B8AE67AE 
X-CRM114-Status: GOOD (  10.93  )
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

On Mon, 20 Jan 2025 16:41:40 +0100 you wrote:
> Fix wrong GDM4 register definition, in Airoha SDK GDM4 is defined at
> offset 0x2400 but this doesn't make sense as it does conflict with the
> CDM4 that is in the same location.
> 
> Following the pattern where each GDM base is at the FWD_CFG, currently
> GDM4 base offset is set to 0x2500. This is correct but REG_GDM4_FWD_CFG
> and REG_GDM4_SRC_PORT_SET are still using the SDK reference with the
> 0x2400 offset. Fix these 2 define by subtracting 0x100 to each register
> to reflect the real address location.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: Fix wrong GDM4 register definition
    https://git.kernel.org/netdev/net/c/d31a49d37cb1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



