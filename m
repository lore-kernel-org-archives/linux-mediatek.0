Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA059C5DF66
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 19:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKjj70wy++8B4OuPl3qmHY5wJCNNCbgrj5oNpTSYmOk=; b=y2tQ95QtvFEt8TqbAbnToaxjfM
	O/+/X8sCRyIgk/j1cBn2oobHTS8afrhXLhoQvSKNNtsbJYThYqky2TNTpMjq0pq56TLYQLb4J03VN
	hRNzeUbbaY9H/4nD69x4q+pSkCa7kZm8Vk3vySIMzOqb2hH8Crajkev+kHMWwWbX5I+gdXoWZEF7c
	QfpTW+VFb+ca+7W+PFZYKoMN6UFDojW0sZnE9TGhh7KXcinVEjm3Nv2ghJSQw0qP1T5YCByax0WEn
	Uyhfhpe+gfFh2m6aePXJmrHRVyY/umPW+DnQVO16iUi8xq5bzeVR/bsWJ3+ldVRsEbZ96Dbnq0c9z
	QC2c8fAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3II-00000006jmC-2xGp;
	Mon, 17 Aug 2026 19:46:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3IH-00000006jkh-1OcX
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 19:46:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BAAEE60A73;
	Mon, 17 Aug 2026 19:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721BB1F000E9;
	Mon, 17 Aug 2026 19:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786996008;
	bh=CKjj70wy++8B4OuPl3qmHY5wJCNNCbgrj5oNpTSYmOk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=eqDReBdm5AiwgrZIhHP/3S9LFHYP5yyJwIbUnaJmxOnHGF4Vxw16jJ0Uv/IITYH8H
	 /u3ns8Rzmvgn6S7s4A5I0bFMIoih7T/bwiR5tBP3cY413+lPFnq20c9ptfdxx4z+hy
	 e5MxASAokV+sO9SJ8MCocHIIZR6osP4P6Q1y3c1ZVKZAHh8Ila9z4K77neuNeir9Sc
	 z0RA0XlZEo7g3yXifH0YC4cjUnXyWkHIXRg30/PbGz6XiACKK9y/WeMWIm/jh+ZEOZ
	 p5ytKTtolJxFQAv9F6jWzE2AZGOlMSzZ5RK8U8rKr6ZisE8mzoloD3XiJLbE/SZAA5
	 kQLuohZ73qPfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09D13926262;
	Mon, 17 Aug 2026 19:46:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] Bluetooth: btmtk: fix subsystem reset error
 reporting
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178699596038.1691257.10089072145797162594.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2026 19:46:00 +0000
References: <20260815115624.8309-1-ismailtarim7@gmail.com>
In-Reply-To: <20260815115624.8309-1-ismailtarim7@gmail.com>
To: Ismail Tarim <ismailtarim7@gmail.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, jing.cai@mediatek.com,
 sean.wang@mediatek.com, chris.lu@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Sat, 15 Aug 2026 14:56:22 +0300 you wrote:
> Two bugs in btmtk_usb_subsys_reset() that make it report success to its
> caller when the subsystem reset has actually failed.
> 
> Patch 1 covers the case where the post-reset chip id reads back as zero:
> the function logs "subsys reset fail." and then returns 0.
> 
> Patch 2 restores propagation of the MTK_BT_RST_DONE poll timeout, which
> has been silently overwritten since commit 3dcb122b3064 ("Bluetooth:
> btusb: mediatek: return error for failed reg access") started assigning
> err at the chip id read.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] Bluetooth: btmtk: Do not report success when subsys reset fails
    https://git.kernel.org/bluetooth/bluetooth-next/c/771e812f94b3
  - [v2,2/2] Bluetooth: btmtk: Do not discard the subsystem reset timeout
    https://git.kernel.org/bluetooth/bluetooth-next/c/54c03e6bc718

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



