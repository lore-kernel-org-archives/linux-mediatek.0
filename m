Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2763BC79FB7
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2026 20:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVBsQziOCe6FlhZ7FOhLXPVigWP9VPum8a09dM9B1yA=; b=fScHf1eML3OvBl6ALAb+/TNb+X
	laLSGCMbxmJBPwbCiOZmocUG/OAnKQ1XQWgfsadzx6sL8rAjggSf4jVZu1CEIZ696Lbw6h+Rf7cvk
	F8eUqXIY5qI4tLYKMb//NFRT0Mz0qrpyB0idJOOoYMLzOPH0RotlpgMEh0PFl+kL/Edb3eaTlMgzb
	VYQ1hyqaZpR9FRWVCdTKL9HLY8P+oYZO1jKlzlg/Ub2NK3hYiGsx6rBlhlOSnRazd3MYJeZkSz+SU
	M1tGiegb7jO7uFW0aJ9eqzfgWGrjBjulkMAMNeEo4afTdDs99PaAmuASr3HWn96QcVLx3sYZ3gP7E
	rjjqc1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OTo-0000000CmHh-1f6a;
	Wed, 09 Sep 2026 20:01:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OTn-0000000CmHa-1ibY
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Sep 2026 20:01:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B4452601F0;
	Wed,  9 Sep 2026 20:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C261F000FF;
	Wed,  9 Sep 2026 20:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788984070;
	bh=bVBsQziOCe6FlhZ7FOhLXPVigWP9VPum8a09dM9B1yA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=m4UeDj1B7G91HQS0eZdqF49gYa9L23JR9ZXcVGtJVNjYN5Jp8aMWME3NaiErkVxNz
	 um73vM1eQ8sDJHozb1LYD8YkxZTYl860ydUN0kJIFvNb42bkH/QFsPbZJehhvDvy6d
	 t4LK5bfl15QXBfya92kjm4YBgc9g3gzKf4xGdac5FxoNaB1B1PWLrv+FNm4yVED3+D
	 VPB2mK1jn3E37fLJf86/SfPCfqrrRMR7LGc+kM6LCCBWcUMlpH7MTGjtDvaeamEP9O
	 lO5RQ0SfSJOfrCYDle7I/dMU4KHoBFGgM1dQ+zrZW/yzX+y/rVzbKx3Dlm39DiwnZs
	 Wo40p4VPhO7LQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B39380AA74;
	Wed,  9 Sep 2026 20:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] Bluetooth: btmtk: Harden firmware parsing and improve
 logging
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178898400812.1032931.449738913453021907.git-patchwork-notify@kernel.org>
Date: Wed, 09 Sep 2026 20:00:08 +0000
References: <20260909120011.1198001-1-chris.lu@mediatek.com>
In-Reply-To: <20260909120011.1198001-1-chris.lu@mediatek.com>
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

On Wed, 9 Sep 2026 20:00:08 +0800 you wrote:
> Three changes to the shared btmtk firmware download path, all in
> preparation for MT7928 support but useful on their own.
> 
> Patch 1 bounds-checks the firmware image before the section map walk in
> btmtk_setup_firmware_79xx(). Today the section count, the section map
> array and each section's offset/length come straight out of the file and
> are never compared against fw->size, so a truncated or corrupted file
> makes the driver read past the end of request_firmware()'s buffer. The
> section count is a __le32 from the file, so on 32-bit builds multiplying
> it by the 64-byte map size wraps a size_t and a bound computed without an
> overflow check would come out small enough to accept the file; both
> helpers order their arithmetic so nothing can wrap. A section count of
> zero is rejected too, since it passes every size check but would leave
> the download loop with nothing to do and still report success.
> 
> [...]

Here is the summary with links:
  - [1/3] Bluetooth: btmtk: Validate the firmware layout before parsing it
    https://git.kernel.org/bluetooth/bluetooth-next/c/71147d59cb23
  - [2/3] Bluetooth: btmtk: Improve BT firmware logging
    https://git.kernel.org/bluetooth/bluetooth-next/c/4a7b93f08d13
  - [3/3] Bluetooth: btmtk: Replace magic numbers with WMT packet flag enum
    https://git.kernel.org/bluetooth/bluetooth-next/c/1b737f2ef168

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



