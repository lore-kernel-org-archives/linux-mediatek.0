Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD0ACD6E69
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2026 17:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrzOVnS+X13tXKUjZu1rFaIumJnVPw+bRqGM+bZ2KoQ=; b=SunJuFi9DOm0rJtreyYgiY0u46
	E9jrUCgOR+R8qr1eKGb7WkOySy9u2+FKUiJyHdURXxxL/KDubDcJYr41U1bJlei3SbIYP+jFdITFD
	THZoCL0BgoKAfKAD16YrhpeR5eCyGR1RsRZg8gBelEnbjveboQUlvpWMP2JwxvJXuHfG8rtzGg2Rj
	Fk+Uh3QH7iTFxguxg6TGiF+LABg9qyWcAXNa6V/CwJ1XnAhN2VulOAG/o4qegkIWnt52ja0CGR/sY
	/lThEeBxjdInyjxRg0C3d6XpGNvWwEDXq8IJJoo9oJFchbIj7jcdV+8Ml180C4/+pMOwK+Xh/ajVE
	4rHDlWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpjK-0000000Fbgr-0bbR;
	Wed, 03 Jun 2026 17:50:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpjI-0000000FbgN-1UKx;
	Wed, 03 Jun 2026 17:50:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 881D660218;
	Wed,  3 Jun 2026 17:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1D81F00898;
	Wed,  3 Jun 2026 17:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780509011;
	bh=wrzOVnS+X13tXKUjZu1rFaIumJnVPw+bRqGM+bZ2KoQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gTzoTF7iyjzmSk19M+GJZPuzAL1JSSn9JqKteKp1sC4eqiBvds9gzoRkjBC20BMvC
	 75oAR0+yxzHdwTjPCzx342nc2t3OZ6YaYLPdhWnl9P5q1D1xY6fsIyATsKys7a3Qm6
	 du7qekO8L1KEc+Hnput9mhcTDCJZBEASDKtP75qPLtyqxfD9C+4RwwbLHTmWI0w18J
	 8DKg1GBn36T6b9hLmj3BKxPgLcekR/XrQNUTs31rcgjqeUEIrPelN4Lybs1Tb18P8q
	 nm///H8WsHu/T/F1VM2IByaaQ/sb4XXRotGHxu7fHQ7SuOKreb/n/sRsiaypO2zfzc
	 IBSfU3bkWsrRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B2239308BE;
	Wed,  3 Jun 2026 17:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtk: Disable remote wakeup for MT7922/MT7925
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178050901239.1520440.2026593395539384648.git-patchwork-notify@kernel.org>
Date: Wed, 03 Jun 2026 17:50:12 +0000
References: <20260603-btmtk-remote-wakeup-v1-1-5c1006442f36@rong.moe>
In-Reply-To: <20260603-btmtk-remote-wakeup-v1-1-5c1006442f36@rong.moe>
To: Rong Zhang <i@rong.moe>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 03 Jun 2026 02:38:10 +0800 you wrote:
> These NICs are often reported to lose their Bluetooth interfaces, i.e,
> their USB interfaces suddenly become completely unresponsive, causing
> the USB core to reset them, only to find that they are no longer
> accessible. A power cycle is required to make the Bluetooth interfaces
> recover.
> 
> After some investigations, I found that their USB autosuspend remote
> wakeup capabilities are so broken that they are precisely the culprit
> behind the issue:
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtk: Disable remote wakeup for MT7922/MT7925
    https://git.kernel.org/bluetooth/bluetooth-next/c/247570151789

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



