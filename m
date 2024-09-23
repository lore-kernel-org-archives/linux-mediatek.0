Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD598CF9C6F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 17:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4izFMf8EAbiqnNsk6GRVVEZCMISraCSRUsn+f7TrOms=; b=fdhhg2GCZMVWxO5Nr3cAx56zFy
	TZCL3kUkC7edOURuQnBj+ERURBFgSpvo44hf+cZdJxGVLK2vUyCr2RLdaAzz8ycVlkygKLhjzSTbF
	/YKzw5gtHvdnizJlzRZCfm3AYwMWecWQot8FeW8Oe6DhVOyfeX2/yd4NB/UnKgDqRkYo70Z4zqJCW
	NVBx67WDnfkUsQvFMJ1k/qhPz5FuXpmtAssrIvpoOb07ADB/Z+NYz2FGhFO8j+5wTp+ZkZOZQQ/d5
	OAZl+OoKRpraTUiInQRrWwjSGmqz8+LSemO/JXjcNGfhFPQ6aWvGVFOKEedtiFEJ76T/6s6vDJWWr
	Ys3sFHaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssmQL-000000005fA-1roP;
	Mon, 23 Sep 2024 17:00:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssmQI-000000005eM-2SaC
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 17:00:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A5DD5C4570;
	Mon, 23 Sep 2024 17:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B360EC4CEC4;
	Mon, 23 Sep 2024 17:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727110828;
	bh=XbW0lreaNy1Fnb8lFlUXOsOSzfmJhY6bCaHFE3PTm1A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PkKXG4V0/F6m32pfSYBI2x1hCNdArsGC4QlO3U+jqkaCOIJtCoUkkuA/iaIGCIinb
	 GmU4eDztA9zaYS34t9sOsTCfkBUfEpEJ/+rgwEcNFbcwkWFAEIBhOtmZmRfJEJEH00
	 sdrdPikYitxDAmWYcSNkeHs2pF8z5haMNQRKjdwpKakRuvKqk8/WDdPxS1Oz7fF8cK
	 Gs6I79vaXUNaBKhFbivgTKLTlgYGhUYNhOJRxxdMWxOzGYOyvuI2168Ro1Q7mOxF2D
	 ia+EwiEKnE80Ll+W/5YkatAzcCtH7qs6RlgM45aJ1wk/ZEdtI9WsL+ehXgrD9uYPxn
	 2f/tL9W+C9aUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 340543809A80;
	Mon, 23 Sep 2024 17:00:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/4] Bluetooth: btusb: Mediatek ISO interface claim/release
 adjustment
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <172711083101.3420231.13056956178938775510.git-patchwork-notify@kernel.org>
Date: Mon, 23 Sep 2024 17:00:31 +0000
References: <20240923084705.14123-1-chris.lu@mediatek.com>
In-Reply-To: <20240923084705.14123-1-chris.lu@mediatek.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, aaron.hou@mediatek.com, steve.lee@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_100030_713537_B4603AF5 
X-CRM114-Status: GOOD (  11.64  )
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

On Mon, 23 Sep 2024 16:47:01 +0800 you wrote:
> MediaTek performs some test on the platform which can support LE audio and
> ISO data transmission with kernel driver. We found the additional interface
> claim and release flow issue need some adjustment.
> 
> These patches mainly add a callback function within the usb_disconnect
> function to prevent a kernel panic caused by interfaces not being released
> when the BT USB dongle is physically removed. Additionally, the condition
> for claiming/releasing ISO usb interface have also been adjusted to make
> driver works as expected.
> 
> [...]

Here is the summary with links:
  - [v3,1/4] Bluetooth: btusb: mediatek: move Bluetooth power off command position
    https://git.kernel.org/bluetooth/bluetooth-next/c/65e9c1bf2076
  - [v3,2/4] Bluetooth: btusb: mediatek: add callback function in btusb_disconnect
    https://git.kernel.org/bluetooth/bluetooth-next/c/bcfc09e8a15d
  - [v3,3/4] Bluetooth: btusb: mediatek: add intf release flow when usb disconnect
    https://git.kernel.org/bluetooth/bluetooth-next/c/6f3f7e941483
  - [v3,4/4] Bluetooth: btusb: mediatek: change the conditions for ISO interface
    https://git.kernel.org/bluetooth/bluetooth-next/c/667e8026261d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



