Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E41C54E71
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 May 2025 15:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRaBreLR+dK6/do/wQByNRnZO7WvwGa1eFT6TXrr81M=; b=krFlIN5D9ow7e1hciB0Z1HPQsv
	bn9r1EpydaKGSKWbes5fXaJBKDWweRpVy3c3dSoQcgt/rlNsi0Ul46xboj3f+YRe2QlOqaLZKTBt3
	lqIO9Lkcy2Zr9xG+rlTvnnBqRuBwftgNHSJfDRj1/mGPKlmYCUjfVNcpm6hsbzS8YRA91h/uYz7Og
	ai34OwvBscKaD4h+ibEcmnTtlojJwSYn6xJUeWJrqUD4AQo9yRyupWesbY05lHU7hvGf7cXjfSG4n
	jzgU7pQqCbjm9ITD21ODsBVZTxymIMGu3GfNp6dvjh6JSzABHZM4/I2oRYFf0lhzygM0HF0xqBzd3
	5tsf+7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlJ9-0000000GGir-1uJB;
	Wed, 21 May 2025 15:24:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlHU-0000000GGME-0SCS
	for linux-mediatek@lists.infradead.org;
	Wed, 21 May 2025 15:22:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28F14443E4;
	Wed, 21 May 2025 15:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07533C4CEE4;
	Wed, 21 May 2025 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747840975;
	bh=0YkU9yBX6AgOPZ0Q3G1oIsGva2J1rIZ+xv0Abib7XUE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LpSmW5PzppS0+oUOdkAxjwbHcHslytnqF7fAp2wxDBaSKWM+r/in36Mm2TAlWUpos
	 FxakUGCGY+8Ge42bQMEmNglcaiZ7UtHsuOrD4yzHsA5CuJ1D1626ghUtRIAh7YjSOn
	 UU2lOAdcMrMk/tSsLoknSm5MHdgkq7sxw0Mrlwbvu/g1OiCiL6/UyDwcKsmiMEYIdt
	 3UYDPKTUC2nV5iesVd0nKbzehKD1ut+lDAOmVu5+4gSxfhpI73uZGb9VgJ0YFzezM4
	 zk4bZgzJqyrE14FZu3qRsIj8OhHzkd2o32pNZSl3AiUGySAfvAwo+SywyS/KgP7ov9
	 SgGCguBOCi40g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB115380CEEF;
	Wed, 21 May 2025 15:23:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] Bluetooth: btmtksdio: ensure btmtksdio_close is
 executed before btmtksdio_remove
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <174784101076.2084440.12163879869679696734.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 15:23:30 +0000
References: <20250422012156.586600-1-chris.lu@mediatek.com>
In-Reply-To: <20250422012156.586600-1-chris.lu@mediatek.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, jiande.lu@mediatek.com, will-cy.lee@mediatek.com,
 ss.wu@mediatek.com, steve.lee@mediatek.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_082256_167340_094E7394 
X-CRM114-Status: UNSURE (   8.62  )
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 22 Apr 2025 09:21:54 +0800 you wrote:
> If Bluetooth SDIO card is unexpectedly removed due to hardware removal
> or SDIO issue, it is possible for remove to be called before close.
> If an interrupt occurs during this process, it may cause kernel panic.
> Therefore, it is necessary to ensure that close is executed before
> remove to stop interrupts and cancel txrx workqueue.
> 
> Chris Lu (2):
>   Bluetooth: btmtksdio: Check function enabled before doing close
>   Bluetooth: btmtksdio: Do close if SDIO card removed without close
> 
> [...]

Here is the summary with links:
  - [v2,1/2] Bluetooth: btmtksdio: Check function enabled before doing close
    https://git.kernel.org/bluetooth/bluetooth-next/c/07e90048e356
  - [v2,2/2] Bluetooth: btmtksdio: Do close if SDIO card removed without close
    https://git.kernel.org/bluetooth/bluetooth-next/c/0b6d58bc6ea8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



