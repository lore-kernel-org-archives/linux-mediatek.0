Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43480CD4F21
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 17:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0puXRgxCHW44tU/HT5nHt0z0oIojv2V4dLKQ9D4IbPU=; b=BqHAR/VX/CdISgUjpmjTY23cm4
	EJezmnCf8G7UCB+d9OGSs5SP85Pwpn3ARiIvDs/Tftw1zVeJrUlinb7x5dOVyMOCrJnRYvJ+hAlnu
	TOEgRogmFUPWfQx8b+wQeTrbOPeRiINYwJu6u4PoVS0pHMeI48v5uzd3kmTVfbT3fLCxw04OmUnvr
	ar/VCjGOM8+GOL9sJx93HWtzk4eXpaEUngKkPQ4UUtV15IIZiLF3avMfL2tbi/Ahwyif9R70cM5pe
	/3J7nMEsI8uxmrC2ctTpnKWvCCnpwViF3e8Ul9X4kAdGxgjD+ePjvUUjf8NFiCB9XbY8HoAG41Z3N
	XIb9F8dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDQH-00000003MLM-41FH;
	Wed, 13 May 2026 17:31:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDQG-00000003MKg-0HhW
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 17:31:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C0C760132;
	Wed, 13 May 2026 17:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A25C19425;
	Wed, 13 May 2026 17:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778693463;
	bh=fX1Z6P+oKoXAjVnhrkpbOAzk/HKql/6El7jCyQQTAlM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DNPJoJ7uuXIIdi/XJTn6IurJ7Q9YeCT8HUhmvoCooFRDSwBzfTup+pUMAyq84zf4o
	 Z37C+RT3YVElNFYuxJI75uN62cxEQiGeNkF5x1gUu5KBUD5bQRHG81W32kssrbCrd6
	 2+Pwhjxgc26gfdfHjmxLEOM2fQ+enz54ofDzF66wh3bQXRaDCrt+flaNx9zAamghQE
	 JYhvUY+HXpnyJ/o7m/4G7vCfM72rdSoRyv+SqIi/IT+MFI6GhtyLRW0Y8/gLHJAcYY
	 23F2x07X9cRxd9CGytJye8sRBOlLZMrOjeoIwMVrrtqHZv1WuP4GgYt6z3nvcWGDUA
	 G2mbq/sFQnn0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9DD1393023E;
	Wed, 13 May 2026 17:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: btusb: MT7925: Add VID/PID 13d3/3609
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <177869340829.3749256.4493884006374055340.git-patchwork-notify@kernel.org>
Date: Wed, 13 May 2026 17:30:08 +0000
References: <20260512060318.3288273-1-luke-yj.chen@mediatek.com>
In-Reply-To: <20260512060318.3288273-1-luke-yj.chen@mediatek.com>
To: Luke-yj Chen <luke-yj.chen@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, chris.lu@mediatek.com, will-cy.lee@mediatek.com,
 ss.wu@mediatek.com, steve.lee@mediatek.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
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

On Tue, 12 May 2026 14:03:18 +0800 you wrote:
> From: "luke-yj.chen" <luke-yj.chen@mediatek.com>
> 
> Add VID 13d3 & PID 3609 for MediaTek MT7925 USB Bluetooth chip.
> 
> The information in /sys/kernel/debug/usb/devices about the Bluetooth
> device is listed as the below.
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: btusb: MT7925: Add VID/PID 13d3/3609
    https://git.kernel.org/bluetooth/bluetooth-next/c/ae3ff17c6240

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



