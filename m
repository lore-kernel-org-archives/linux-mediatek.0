Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5982C61DD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2026 17:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpEqtD2PxFTkpfP6/JkpSRSjFHyw6Xfi6IrNt7fMuac=; b=zpiviq8oKqs8U4nE8r82CiLPNi
	HsskFHbCYmjPbmdZQD94XoSWZxNcVcCK3PDD63UZ6ZrBR2fbB6EuX5dMwngS4beWOZ0NhN3+PiAoT
	uhkZzZ/jBvM3swuwSKgAdacEK6ktw7u/FPX4vV6QfXrvWJfWCev+FZ8wB3iHRPZT59A4xrJV8CwSH
	ZhUk7B/IEJ+YziVHr25x8DPUUSREb2pbBhjnVAOmSsf3Nk1fRptD6lPWsNdz0Q3WRIrzo11HhOJgi
	brXdSXeVxkmYYjY9e+keSVPoRxGD4U/bE02bZREsMYwIhZchAryxYDPbIuRr83UmXk+OHlE7muFIf
	/h4b6BEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15h0-0000000AA5o-1vci;
	Mon, 31 Aug 2026 17:21:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15gz-0000000AA5c-44l8
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Aug 2026 17:21:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A969400FC;
	Mon, 31 Aug 2026 17:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E57B1F000E9;
	Mon, 31 Aug 2026 17:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788196869;
	bh=VpEqtD2PxFTkpfP6/JkpSRSjFHyw6Xfi6IrNt7fMuac=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=j2Y/ar5GiQysvn6C6GMcBv5rynyKA/lfK32/zYjbwmmqx6rPTWYIcYQcuuAO6m2Cd
	 DP3lTsymk0wR1yF4+OuQ28PHtbiaiAwM/ydD9rjtoj8fCT+aZBPmM/uZxBQ3qtwg7I
	 anVWj1p/INELvsPYjV4kmZZbesj5AjeKqULNCPMVh/cwHWT4aPAaDAO6irq3abiznN
	 IfPFgi1NRZGwwqs9YDNlmMjN4g0eD6HehDqhlsK7m8ZbTKLcbJmxWVT0TWCj2O5rFn
	 q9PJUX7OQ0fWa2DMVi3iMv+s+IAhick9R5YsxS27cHhii1W0sJCWrUR2SaiKm6sgyV
	 9nt5rLFafYZxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939323924458;
	Mon, 31 Aug 2026 17:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] Bluetooth: btmtksdio: Stop discarding the hardware
 device
 id
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178819681225.671757.15863608623551543473.git-patchwork-notify@kernel.org>
Date: Mon, 31 Aug 2026 17:20:12 +0000
References: <20260825033634.499118-1-chris.lu@mediatek.com>
In-Reply-To: <20260825033634.499118-1-chris.lu@mediatek.com>
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

On Tue, 25 Aug 2026 11:36:32 +0800 you wrote:
> btmtksdio_setup() reads the device id from register 0x70010200 and then
> throws it away twice: an snprintf() overwrites the filename that
> btmtk_fw_get_filename() derived from it, and mt79xx_setup() passes a
> hardcoded 0 on to btmtk_setup_firmware_79xx().
> 
> Neither matters on supported hardware, since the device ids that would
> make a difference - 0x6639, 0x7925 and a flavored 0x7961 - all belong to
> parts with no SDIO interface. So this targets bluetooth-next with no
> Fixes: tags. What it buys is that the two functions stop silently ignoring
> their input, which is a trap for the next chip added to this driver.
> 
> [...]

Here is the summary with links:
  - [1/2] Bluetooth: btmtksdio: Remove redundant firmware filename override
    https://git.kernel.org/bluetooth/bluetooth-next/c/4988456a75ea
  - [2/2] Bluetooth: btmtksdio: Pass the hardware device id to mt79xx_setup()
    https://git.kernel.org/bluetooth/bluetooth-next/c/afe439f35546

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



