Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6912D2C114
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2024 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvIYeSFCxY/3x3hewUHt9HGpdJeJf41GmvTvIB+PyOk=; b=mJXAdDkdERsfv4x3HKP0D0mdeN
	CDblj33to0+BXmtb79WsdrcWk6MeeLGPm6bfcQq6sZCZiAfkjNaff8NI+oCqVGXV2gGe9qOp/b0hx
	ta6vNIerkMoktJFd8ycS0ujRVfWV0NaRhBZc4CAtCAhPNMGRKFV2rbeJwczTLEv3NNIVawxaHGsu1
	O1rihj+ZkEta0yNywlGeTNYlTpAUYK/7pVxUhlYWXx61GPvTqcPaBS9OYluQSEXHhMzEAyQS8r/Gm
	JJq/okaD/hFYvkV9pGE4/RIPkcVrE8harwTZoDHsEDb2RGHpZ3MJZNc7ZFRmubiYi8+vWeASPRPuT
	nkBH+Zug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8L2j-0000000HMW8-1WIn;
	Tue, 05 Nov 2024 15:00:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8L2g-0000000HMVF-1OJH
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Nov 2024 15:00:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0B545C54D8;
	Tue,  5 Nov 2024 14:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0CAC4CED3;
	Tue,  5 Nov 2024 15:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730818825;
	bh=/9BD+CG6bSek+ioiWxHqTFIK5p/sQQ/tH1AmkfFf3ZE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Mt597LT9WCoUDcaiiiK4a+Zhxa+8KKaBnc07eS4+66f8j43BPV9rg6IE1hH9IjEvl
	 i919IF23/Lo5axnIsepR3qC8DmBTA4DtP3/JWzEDyeJdq7X1u8FZbl7vfgZvNV242l
	 hoWF7lbfMK778FYqEr0KiaJiH3vB11TfN7qkNNUkGHvUaU3yyR3AJr+TvtbGFQq+0d
	 VLgxrzFs2Y8RtkiK4AlDzU1nmlx58WYQPu9T50U6PuJe10zN2WWPXBxqn1KTiQvgMz
	 4dx11EAp54/r2Zz/0hqlwZH44T5vGMTXLvwZar2vYgQRaLfdtXzF0ZV8Tp/dbEtvcT
	 Kfn9uo2zhsg9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C8D3809A80;
	Tue,  5 Nov 2024 15:00:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: btusb: Add 3 HWIDs for MT7925
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <173081883399.584547.12555123272395386451.git-patchwork-notify@kernel.org>
Date: Tue, 05 Nov 2024 15:00:33 +0000
References: <20241104145931.5019-1-jiande.lu@mediatek.com>
In-Reply-To: <20241104145931.5019-1-jiande.lu@mediatek.com>
To: Jiande Lu <jiande.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, chris.lu@mediatek.com, deren.Wu@mediatek.com,
 aaron.hou@mediatek.com, steve.lee@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_070026_435001_6DD52427 
X-CRM114-Status: UNSURE (   7.53  )
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

On Mon, 4 Nov 2024 22:59:31 +0800 you wrote:
> Add below HWIDs for MediaTek MT7925 USB Bluetooth chip.
> VID 0x0489, PID 0xe14f
> VID 0x0489, PID 0xe150
> VID 0x0489, PID 0xe151
> 
> Patch has been tested successfully and controller is recognized
> device pair successfully.
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: btusb: Add 3 HWIDs for MT7925
    https://git.kernel.org/bluetooth/bluetooth-next/c/408ec48013da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



