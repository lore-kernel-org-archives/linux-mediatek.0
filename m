Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA96C88E72
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 14:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaHc0J59bF80D7dByZ1yfmnClcBTs/ECAlg1lj6FjAk=; b=f8Vyg8TiPQL/U3bU7uj9BfHTBP
	okUYLnGdIbLFpxHlIyg6fgIO35wUXvhDd3PT0FOKdHox6hbQSnK1FR1ujwHEOWtIcPf38AcW2dKq4
	bIm9GS6kuu2DmgRxTsGkx/D/5SsLp2M8L61nt+aukS805ze6wSDR9cyY/8YauOA+6zomiAk/z73VM
	jxpodEkR/oTAF1ONYmNjrOxC9hDR/5d2pcnRWhepERzJXFTbTUWyfs6ufmk2dFVXOQiL6quIbhofo
	7PC5NjRoH2ALuZyXC4XkbXJg+n3+WhjLdlP0k66m3dJD/iMqtPDduGilXPr8hnJuIlqrIm/VC597+
	mGNR+eyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67iG-00000003zXD-0Jkp;
	Mon, 14 Sep 2026 14:31:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67iF-00000003zWV-03qC
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 14:31:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 36362601F9;
	Mon, 14 Sep 2026 14:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E346B1F000FF;
	Mon, 14 Sep 2026 14:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789396273;
	bh=BaHc0J59bF80D7dByZ1yfmnClcBTs/ECAlg1lj6FjAk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=frqLHkqgtc13XcgSLKxwboCB1DPHQFHgj8y39wPtucLiE3Sdrspm1AG+3lY2xN0+r
	 5MqaFpJHPlS60sUdPn4Nb516k56l6uQJ39x6BDsJevX4QpxEsvExDCtepPLseu1Sh7
	 Dlvgo2g1Tzv79b0ofKytgi0j+qWZXtY4u50T+0T5cfj1UxIwvJ13mBNEIM9TUYDL6X
	 XYHiQc3KMGv9byWFS7swTbz9W83VDYaiEi7WLVUEKPIoCj3rcsBY1LH+kaHOBTnWN4
	 Ys8Z7lt7giLia6NaRuSOn0DjxzfL0n8gPLZZ9yFQ7h0sJZAIwB8XVeKDtkbBl1NSJJ
	 v+pzaeLUs7d1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568D13924A67;
	Mon, 14 Sep 2026 14:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtksdio: Fix PM runtime reference leak in
 shutdown
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178939620898.604238.8055106732131583271.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 14:30:08 +0000
References: <20260914094729.3222624-1-tzungbi@kernel.org>
In-Reply-To: <20260914094729.3222624-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 sean.wang@mediatek.com
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 14 Sep 2026 09:47:29 +0000 you wrote:
> In btmtksdio_shutdown(), pm_runtime_get_sync() is called at the
> beginning of the function.  However, if sending the WMT function
> control command fails later, the driver returns early.
> 
> It bypasses the corresponding pm_runtime_put_noidle() and
> pm_runtime_disable() calls, leaking the PM usage counter and leaving PM
> runtime enabled indefinitely.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtksdio: Fix PM runtime reference leak in shutdown
    https://git.kernel.org/bluetooth/bluetooth-next/c/d8dd59bd6fd3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



