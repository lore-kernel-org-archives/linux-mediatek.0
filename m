Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC50C5DF7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 19:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3mTxThq2eLy86xHYm2SOBoR5dU3codgK38xVj3ikbo=; b=jfAxJGbZ49HYSy6FNFd+woqj6U
	vWH7TQHCbdStELCGpczux2SAUW8bCl7WIwnp5S0aDZRMWxdk0a1Qsqxb94yHn18/Ebpyfrw0ve2Tf
	QY64fSxGLwQdPkNFg74tpoHCMtZUBx3JUmDOc97zwG95rkmm/5FQNfmK2qzr3WlsErnU2UL+POZMc
	hRWaCJPVl45DO2EQ84OTysnglx1w5NmVGQ07DEzDE7oT5EPM+JQxlXskrRe2ZTYk0PvbeMeu38V+z
	0xNcq81BM1k1WJr97zsNBY87JU4GfwUQXk4Vi/KTc11hfXOBVn/gxvYdVDeXj+GmofDzw28fwg7AT
	Ii+HgNJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3IG-00000006jkB-2gCW;
	Mon, 17 Aug 2026 19:46:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3ID-00000006jhU-3Lui
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 19:46:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D56041646;
	Mon, 17 Aug 2026 19:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DF91F000E9;
	Mon, 17 Aug 2026 19:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786996005;
	bh=q3mTxThq2eLy86xHYm2SOBoR5dU3codgK38xVj3ikbo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GQowfqHJhOQATrJ4wwy0mLfZVGkZwwxoYeddnwivFi9ZVTDK/5ElyY9VTx4maxfGs
	 6c8twxmqHe3FLXlLtmTbLp6G751vG/JBnCzQcAK5dXKl2BWYBB3kudDTs8mgWDzxUT
	 SBNsJ6+vtSate76IjRA2yCw7Ip4OjbqR9iNkbBaSnqbYP6/fb0E2LBJJAQdzI9vZsU
	 AEzDn5uflNILproFtD28idG/7QXGhNPGiaoSRtqlDODBTgdkg5At4Mdo0xzsuTAv01
	 ChLRS52nQRskpBnaiax1XA0RXG7/5L0Whpyf95mUK089m0bdC+QIkXuKbpc5CtUGUl
	 3AtUvHXLaqMxg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0CC13926262;
	Mon, 17 Aug 2026 19:45:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] Bluetooth: btmtksdio: Fix SKB handling in the TX path
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178699595738.1691257.9499694982738760170.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2026 19:45:57 +0000
References: <20260817095332.182994-1-chris.lu@mediatek.com>
In-Reply-To: <20260817095332.182994-1-chris.lu@mediatek.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, will-cy.Lee@mediatek.com, ss.wu@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 17 Aug 2026 17:53:30 +0800 you wrote:
> btmtksdio_tx_packet() rounds the SDIO transfer size up to the 256 byte
> block size, but never grows the SKB accordingly, so the host controller
> reads up to 255 bytes of uninitialised memory and sends it to the device,
> and can read past the end of the buffer as well.
> 
> Patch 2 fixes that by padding the SKB with zeros. The padding is written
> behind skb->tail, which is only safe once the driver owns the data
> buffer, so patch 1 replaces the open-coded headroom check with
> skb_cow_head() first. Patch 1 on its own changes no observable
> behaviour, but it is a hard prerequisite, so both patches carry the same
> Fixes: tag.
> 
> [...]

Here is the summary with links:
  - [1/2] Bluetooth: btmtksdio: Take exclusive ownership of the SKB before TX
    https://git.kernel.org/bluetooth/bluetooth-next/c/951d9f743029
  - [2/2] Bluetooth: btmtksdio: Fix out-of-bounds DMA read in the TX path
    https://git.kernel.org/bluetooth/bluetooth-next/c/262cb784c96c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



