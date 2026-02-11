Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078CFECD6E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Feb 2026 19:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZ2v3CCUSuAb0OEd65VgHBtUCSyeLExUnG319DyHelE=; b=sh5dJ1lgQgCFwKgdlH8+YE5yRP
	dV0ACsKm83QcpMJGjjjDLiQmZz1TeUUWpfZA7hhFmEZa7qs4lK5wW/bv4C2g5MN18UxO357+LSlSk
	lkN3TWVtmpJG2rR3geYpqA+J/Z1EFEOvj/vhEvQ611TUYyYLCb1+PWOTAWlRz3ARY+naGwVbaPFQe
	NmMG3WMbsJsKcopm+1lDpi0U5oVlsPbYWK9fKjSWRZz0qRGTjfuT3/mXGLx7xZQsoqUxPAJCEKkY8
	RwUxA6icaonl5JAdnmaVtvBu0dNo8a3C4ND909W0BNg+ZcUlcOEuZGFZ/6xKqUqZYVZ7X9PlJy/BI
	Ej3jEkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqG4P-00000000zeP-12JB;
	Wed, 11 Feb 2026 19:40:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqG4O-00000000zeJ-1TP8
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Feb 2026 19:40:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0139F601D7;
	Wed, 11 Feb 2026 19:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F7BC4CEF7;
	Wed, 11 Feb 2026 19:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770838814;
	bh=PWur7uL4N7a7ELfHOH7WsEqTpF8FtMWr3QSD94+Xv+M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uG634CiO7qluuOW1wOjlBQOoG5mkj58FiYGnNByoVKXucYq50U93xEMrHZbjFf+0i
	 9Z47IJcHJ0FyI5ejl0nGX8MDqfMJt5NWHAxkY64TbNpbGmM8+V1ESKLyQWGY5JiniX
	 PLyEzrQyiAKTuE0/gtcYAzSSgSZ4mDsU7VZ7lskKHt2TIrpm1Z1+aX34z/Q5sp/Mwa
	 CKzSFDcf+IkRBcT4ngb2DuuyowF7IDSFot6xsEMdb0fSHO6p+FoBNSWqPKHgBOO2rK
	 w6T1l+UqOyZQikYyksyokypJI7+r5xAm1HiTcSFv6zpjmdd8KjGUbFCRTubYfYLoYS
	 avQ+PS5mDlZbw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C22C139EF964;
	Wed, 11 Feb 2026 19:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 0/3] Trigger reset if firmware status is abnormal when
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <177083880957.688115.17676708288116358310.git-patchwork-notify@kernel.org>
Date: Wed, 11 Feb 2026 19:40:09 +0000
References: <20260203062510.848761-1-chris.lu@mediatek.com>
In-Reply-To: <20260203062510.848761-1-chris.lu@mediatek.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, will-cy.Lee@mediatek.com, ss.wu@mediatek.com,
 steve.lee@mediatek.com, linux-bluetooth@vger.kernel.org,
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 3 Feb 2026 14:25:07 +0800 you wrote:
> When the device unexpectedly restarts during previous firmware
> download process, it can cause mt79xx firmware status to be
> abnormal in the next attempt. In this case, a reset should be
> performed to ensure everything starts afresh.
> 
> These changes include:
> 1. Optimizing the handling after the download function retry
>    is exhausted, a reset should be performed.
> 2. Another download firmware command also needs to check status
>    , and if an unexpected status occurs, trigger a reset.
> 3. Adding a flag "BTMTK_FIRMWARE_DL_RETRY": if download firmware
>    process enters the reset mechanism, this flag will be set.
>    After a successful setup, the flag will be cleared.
>    If the flag is already set, no further reset attempts will be
>    made to avoid endless reset retries.
> 
> [...]

Here is the summary with links:
  - [v1,1/3] Bluetooth: btmtk: improve mt79xx firmware setup retry flow
    https://git.kernel.org/bluetooth/bluetooth-next/c/9cc9fc9bff32
  - [v1,2/3] Bluetooth: btmtk: add status check in mt79xx firmware setup
    https://git.kernel.org/bluetooth/bluetooth-next/c/458b6d8b0108
  - [v1,3/3] Bluetooth: btmtk: Add reset mechanism if downloading firmware failed
    https://git.kernel.org/bluetooth/bluetooth-next/c/73130272a121

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



