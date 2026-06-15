Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E67CD98DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 18:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHFBupYw9MSOmbiWNWLr3UIfqnNc0hADHqZxevGE38s=; b=lAoHlDJdAX8iDD0pk/LgV0iSPr
	lkwCUecFA2QnEy11QHSIKGEwo7DxNjez4PF8UcoFcrFyy9hc/wChyAoJ/hqxmXKRzO693n4wvsVjg
	GmLUQ2hJi3cVEojGjgH9S+Ch8aWvXEU1mafPQjaOQn+y/xseX8PYRxvhJGoaD1AJFV+leUPgxKNBe
	35VMUTdg6uG6OsAsBAepTHfdz8uEjzvgzmLo3xRJSYnelnPgFZhi1iL4mb0WLEE8zVsHFAg3WU6IF
	486U5XwPjEXE7YhJ48HOVL5G/jSbC/Fr3xoCaguabo3zLmHbOGg0XOFPMDLmDmHDHul9oMENS8c/s
	AtJ2EtqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBlF-0000000EiDp-2Uy1;
	Mon, 15 Jun 2026 18:10:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBlE-0000000EiDj-3jUP
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 18:10:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BC036008A;
	Mon, 15 Jun 2026 18:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D221F000E9;
	Mon, 15 Jun 2026 18:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781547011;
	bh=vHFBupYw9MSOmbiWNWLr3UIfqnNc0hADHqZxevGE38s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=iBug0rsuvM0DiIQYdjY6bkNmLE0tabqG22Lqv7zbk7nIRxiAqHisYslSP+SgBPCbn
	 3Y2cBPPJBKGjIkVs60lP89ams2f2UNwAYGrhXPl7kXI9Bpjt50+BVmpBZCZPL21rVy
	 WAIgs/3CReBXsQOd5sS3jqmsN2+hfFd7lSbas/MtpUx6lj4xNUqaAUbXscYKdFA+qn
	 OCZH80kJVzNvLpo7yD8CMMnDoJMNQgPSLL/VzwQW14mtn0NpiSh3+eFaEvnfA4jTjv
	 jx/NDLqNybJCwasuoXyxInwe97earXxvJb/a/TnYjYrV7+xrD5xDWogQ81fdxeu4cG
	 A4Wv4plMm2iwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198543839A06;
	Mon, 15 Jun 2026 18:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND] Bluetooth: btusb: Add new VID/PID 0x0489/0xe156
 for
 MT7902
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178154700663.231677.10761395159710291118.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 18:10:06 +0000
References: <20260614141258.1011-1-kirill.kz.902@gmail.com>
In-Reply-To: <20260614141258.1011-1-kirill.kz.902@gmail.com>
To: Kirill Shubin <kirill.kz.902@gmail.com>
Cc: luiz.dentz@gmail.com, marcel@holtmann.org,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 sean.wang@mediatek.com, sean.wang@kernel.org
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

On Sun, 14 Jun 2026 17:12:58 +0300 you wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add VID 0489 & PID e156 for MediaTek MT7902 USB Bluetooth chip.
> 
> The information in /sys/kernel/debug/usb/devices about the Bluetooth
> device is listed as the below.
> 
> [...]

Here is the summary with links:
  - [RESEND] Bluetooth: btusb: Add new VID/PID 0x0489/0xe156 for MT7902
    https://git.kernel.org/bluetooth/bluetooth-next/c/5d31430fc208

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



