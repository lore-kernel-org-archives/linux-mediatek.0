Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810B9C3ABAC
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 May 2025 14:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDuBSCjdxYHeICYss+lYs6yXcChSw9aZ8Ut5O3RpTdw=; b=rfCdtIgtH22sq/yvErGDd4mvmi
	TPSgALhnBBveuIHO3s1uHgstYztHpQ3I9EbMXtupck/fwsJ0ppnWEeXklKTf9buEUS8zXIA2eFWQu
	MyeqvNTBjTWHWkE9V9PsSt4MTIe4mwo1xjtLsrYSPvo60gxG54KLxteZGV9ixcBz0dTI02MXWnx5U
	bF69xHGKrbMo07mWFDMuTTugjO7TEYNJrPLIcT4u6mmZ0serj9IYEcSLgM1svnBAKFK8Z0fa87C4K
	UH2r815KVq6WhJoxi46E6DagFfoVf/uUfXUuPYC+H8r9Syer6XLgKpB/Gx8wYpc1r/KZJSqwIw1vd
	Fkf5qXnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJj9-0000000CPX6-2m4W;
	Tue, 06 May 2025 14:56:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGxo-0000000BpSZ-1iT9;
	Tue, 06 May 2025 11:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A18BAA4C729;
	Tue,  6 May 2025 11:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4C6C4CEE4;
	Tue,  6 May 2025 11:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746532795;
	bh=7Sg/XeS6j36e1f9i8iczSP4VRhrz2+oSrIEypk8cmQY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=p7L5EbSz9jf4lgXejuBDmiHsIB8vp2yrK00DAaLNIfQzP3YUtZLKpLTAaKBy1QoNL
	 DVzKr9nJsY+/7E9ibfhlKaXo/FRxqU6XQIPOnhY+gUdksQkRjw2hnyQZ10AleXI+LW
	 1hz5vBWeetFITqYFZaP8cz1q/1uynNJKPiSNzPaKVCLWjcQ569G1AyIGhSd4McjWWC
	 gNvgvWqAReYkUWfmZY8Lh2WrXIsNsG0GJJmgsHuPV24p0vf4Zt8WMsPlnYApSti+mK
	 zimRmcP5z+xAmwjiu2gckR9w/qYJ0J9/DZs3JojQrMn8wAYRTveWq5gZYuiMC0+8/L
	 LFkdteZ2LTMAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDB9380CFD7;
	Tue,  6 May 2025 12:00:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 1/2] net: ethernet: mtk_eth_soc: reset all TX queues
 on DMA free
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174653283451.1493761.12837257504091062082.git-patchwork-notify@kernel.org>
Date: Tue, 06 May 2025 12:00:34 +0000
References: <c9ff9adceac4f152239a0f65c397f13547639175.1746406763.git.daniel@makrotopia.org>
In-Reply-To: <c9ff9adceac4f152239a0f65c397f13547639175.1746406763.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, eladwf@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_045956_514485_202A73AE 
X-CRM114-Status: UNSURE (   9.83  )
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

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 5 May 2025 02:07:32 +0100 you wrote:
> The purpose of resetting the TX queue is to reset the byte and packet
> count as well as to clear the software flow control XOFF bit.
> 
> MediaTek developers pointed out that netdev_reset_queue would only
> resets queue 0 of the network device.
> 
> Queues that are not reset may cause unexpected issues.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: ethernet: mtk_eth_soc: reset all TX queues on DMA free
    https://git.kernel.org/netdev/net/c/4db6c75124d8
  - [net,v2,2/2] net: ethernet: mtk_eth_soc: do not reset PSE when setting FE
    https://git.kernel.org/netdev/net/c/e8716b5b0dff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



