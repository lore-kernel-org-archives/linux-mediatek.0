Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33279CEACDD
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9q/vzNGgvMmPgJtS5lzgPc6x4hPKXgniuab0tigVKQ=; b=bkAd0/1NUosWreSkgEPcQVBw5C
	DBfD//j60ly2VcpeYivLnqRY1g/xO51+awUyxD/fIann40pht4TWoXDVWfZbM6XvlLm7YUB+gnzRx
	9SFr9IdVlZX7wKt7w+hkJPW7HBO0N0N30uRnQzp4hzwSmOpbKx4HmTj2ITOWBb+rIHsZWO1Qd16It
	HLp4VcbEmUELCjHe+LAcIAXe6BtmE5THwo8PjtuDMpiZ2r2w4qkw6ObMd1hwsASXW5wn5u63xuoHr
	sIFBFfdB9iiM+T4EOCG4yPLJzZClXC3Xt3EcgVhLiamaKyptMliAyAauHvXazcVpYqjvbV+0OGhBL
	TG1LDE5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svehM-00000003JYn-0hXd;
	Tue, 01 Oct 2024 15:22:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svefz-00000003JLW-2Ekq
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 15:20:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73B055C4CEF;
	Tue,  1 Oct 2024 15:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55159C4CEC7;
	Tue,  1 Oct 2024 15:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727796034;
	bh=3Xt8ZMBN8uGFszYqs3BwrsgLbYA2lJefo5xw5NkbDuk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Roj+tqlqFjCPkWbL41BJ+uENSLu9L6ttK5aSHatkUADi/JmJYPTkjuS7ng0FlgzV/
	 Z9T3wgBLxJeNr8e6ci70WOENWfBSJXd3n8+2gghHoOO9XMVPLSEuL6nuq1RzSkGw3R
	 X4jvAzME3UmAj6C4gGqPT9ie4ICejt7ywEkG05DZ3uv7Q1qH50xkaAlWY8ZBo6d4QK
	 2XwTYQyDZ0Edca0DHHY1OiuAofRtgiAj/WQ7cjE6RPRlQ3uYWPiPcW6cLb0hdx3exe
	 4Dc52JJzPfLiAoaWpcMv03gu0OSd/NuetljznHnTPjWtyf6zW5N4kcyGdVj221LJRS
	 FUgz9oRrZja/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE69A380DBF7;
	Tue,  1 Oct 2024 15:20:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: btusb: Add USB HW IDs for MT7920/MT7925
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <172779603724.424883.14753095343709805465.git-patchwork-notify@kernel.org>
Date: Tue, 01 Oct 2024 15:20:37 +0000
References: <20240930104750.18872-1-jiande.lu@mediatek.com>
In-Reply-To: <20240930104750.18872-1-jiande.lu@mediatek.com>
To: Jiande Lu <jiande.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, chris.lu@mediatek.com, deren.Wu@mediatek.com,
 aaron.hou@mediatek.com, steve.lee@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_082035_661022_9871A8B6 
X-CRM114-Status: UNSURE (   8.81  )
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 30 Sep 2024 18:47:50 +0800 you wrote:
> Add HW IDs for wireless module. These HW IDs are extracted from
> Windows driver inf file and the test for card bring up successful.
> MT7920 HW IDs test with below patch.
> https://patchwork.kernel.org/project/bluetooth/
> patch/20240930081257.23975-1-chris.lu@mediatek.com/
> 
> Patch has been tested successfully and controller is recognized
> devices pair successfully.
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: btusb: Add USB HW IDs for MT7920/MT7925
    https://git.kernel.org/bluetooth/bluetooth-next/c/af0163688ab3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



