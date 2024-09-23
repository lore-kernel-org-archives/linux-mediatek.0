Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86A3CF9C74
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 17:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNHYnR22Z7eTySpPt7IK1n3+2MXbDUkiTzuocqjCOnU=; b=tJ1IGJ1Oz/tjlPbclu3mNxnAOl
	jZIadTWzvY+m0F1BL4hfUaEH+AyPResicKsaORZjWbbRoPDzA27985reSXJX3HIJ1yuKe6gBdYCpn
	8uLyRyCsDDjZm06HGE/hVEr42n7d2JcwNJ3rSi/ZpFfwrK5h0A4xKZojzDvTicHhLecR0bbpzQosV
	GOwhVLNzsNPBFV6w9Bnezb0tN3TjP/tTyDpir1yT0q1fTab1CSUP4bTBHTaMI80e7MW4RVcRS68P1
	DL1jTugI/OgjTOcvIt14veFbtXICZExZjhXZdJJ7e9Ve2DorGjc0BvsUPYX1Cd7OyHaQzMX8VurEy
	btsD34LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssmQN-000000005fd-3RuF;
	Mon, 23 Sep 2024 17:00:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssmQJ-000000005eg-1oHd
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 17:00:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8BAB4A42600;
	Mon, 23 Sep 2024 17:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21206C4CECE;
	Mon, 23 Sep 2024 17:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727110830;
	bh=Le+8/4rHrktyxAGJVfNrJFueZA8IoxlwKWX6I3aB9fo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rISBagsL1XNMFvHAODmsaDAUUZqPPrzSZ5nHIQrvwCLsbpPEVxFUYs/XmHEUnRBho
	 LGaTxK40CEaAEa7F8M+5EHj1ornVMBQXCAKvubez1Pl6UMmUGXEPSTVb+48Be/tB5I
	 bGql7+laWqD//n7xVykKHsmEVHUUy4At1uI3BuD+WyBA7cgmYVAwd/SgkAeq59+IxQ
	 0tlqcypbqJ5G3UTYMi7BN6VzvdbYriYLQO5jCfl0qdYH0WCUqEIGO/M+H9QgCRCUVG
	 E3qMe7enDwhTg0ZQZbsj9x02qL+awYErfG+W4ITifoq01ynpc9U4fG9JeaDGG8StpJ
	 BClpOH1Wy/xBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD4A3809A80;
	Mon, 23 Sep 2024 17:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] Bluetooth: btusb: Mediatek ISO interface cliam/release
 adjustment
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <172711083224.3420231.16302017182425598923.git-patchwork-notify@kernel.org>
Date: Mon, 23 Sep 2024 17:00:32 +0000
References: <20240916113938.30285-1-chris.lu@mediatek.com>
In-Reply-To: <20240916113938.30285-1-chris.lu@mediatek.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, aaron.hou@mediatek.com, steve.lee@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_100031_552684_1CF2AC81 
X-CRM114-Status: GOOD (  11.41  )
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

On Mon, 16 Sep 2024 19:39:34 +0800 you wrote:
> MediaTek performs some test on the platform which can support LE audio and
> ISO data transmission with kernel driver. We found the additional interface
> claim and release flow issue need some adjustment.
> 
> These patches mainly add a callback function within the usb_disconnect function
> to prevent a kernel panic caused by interfaces not being released when the BT USB
> dongle is physically removed. Additionally, the condition for claiming/releasing
> ISO usb interface have also been adjusted to make driver works as expected.
> 
> [...]

Here is the summary with links:
  - [1/4] Bluetooth: btusb: mediatek: move Bluetooth power off in btusb_mtk_shutdown
    https://git.kernel.org/bluetooth/bluetooth-next/c/65e9c1bf2076
  - [2/4] Bluetooth: btusb: add callback function in btusb_disconnect
    https://git.kernel.org/bluetooth/bluetooth-next/c/bcfc09e8a15d
  - [3/4] Bluetooth: btusb: mediatek: add intf release flow in usb disconnect
    (no matching commit)
  - [4/4] Bluetooth: btusb: mediatek: change the conditions for claiming/releasing ISO interface
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



