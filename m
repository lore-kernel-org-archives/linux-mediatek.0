Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4F9C88E73
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 14:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qP7p6Lw9XBuNpZD4yTpL5ZkISx0ECNRa0OCciHWyqMM=; b=z/3LX7MAKcnl/qVjyf31eTSDTW
	yw5QJYC5O4ahysqSsaepRo5/zcXKVLB+sIlI0OdBXRRrgXmzfGPSarZNl460oxh2RTOWwZER0m/gy
	cr0NxtrOKyyYXCtEEZ6vaa42h83ONScJX8ldyuZmNYdPniKXH0Te54plYTHJrQnSsf6N1BNNODqNG
	6T5xbTe0pSm7MTWekMoxuAEYlYvZJy3VAfCKb3GmP7tR19cTdMmV/56JVPePyRM1ziARXMyiBsaQj
	5oTMvRyj5tpA5FuuvnYS0s/HCj06gVJMTEZFexl3521eNTvD5wthCtEX9Xk1MMHXTii9/AflD8lbR
	h/euZ8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67iD-00000003zVm-05Xq;
	Mon, 14 Sep 2026 14:31:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67iB-00000003zVP-1heX
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 14:31:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C479842A64;
	Mon, 14 Sep 2026 14:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A804E1F000FF;
	Mon, 14 Sep 2026 14:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789396270;
	bh=qP7p6Lw9XBuNpZD4yTpL5ZkISx0ECNRa0OCciHWyqMM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UnLeLUkyvfYtHAvBjvIbwR+jupgLARs6tT5nEzAbpyOWQ98xEpiD3ETaQ3iN37Rco
	 3QxFGGesbMhIRa09yJZ2WU5jB4ePnfEdnlnwOWnR0MCnMLcjpbrS3YDbP44E48jede
	 aw46t5yvJ43NSrhR6/ElGU8NVR1GQxlwsm6iqXN98aPNOf4ayezcN/2yICBx0s+GHk
	 0q25sRxFzkCdlHF9AOt2qFEIuQRgYjhmGuh6nPy2Waggonf4jUtDSUGmQ1sM8wV4xu
	 M+EKaB6s/JtoqUOq0POvZsfSrhA0soe5S4suz2elF3a5eyngdHV6cpIXOha2/eGqCK
	 wwU13wk06eTAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1996B3924A67;
	Mon, 14 Sep 2026 14:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/3] Bluetooth: btmtk: firmware debug event routing and
 WMT
 FUNC_CTRL status fixes
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178939620588.604238.15437504595416258002.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 14:30:05 +0000
References: <20260914065654.102916-1-chris.lu@mediatek.com>
In-Reply-To: <20260914065654.102916-1-chris.lu@mediatek.com>
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

On Mon, 14 Sep 2026 14:56:51 +0800 you wrote:
> This series bundles three independent MediaTek Bluetooth driver fixes:
> 
> Patch 1 is a resend of a fix submitted on 25 Aug 2026
> ("Bluetooth: btmtk: Route firmware debug event to the diag channel")
> that received no review feedback at the time.
> 
> Patches 2-3 fix how btmtk_usb_hci_wmt_sync() (and its btmtksdio.c /
> btmtkuart.c counterparts) interpret a WMT FUNC_CTRL event that carries
> only the WMT header and no trailing 2-byte status word. Such an event
> is a normal firmware ack for a plain enable/disable request, with the
> result carried in the header's own flag byte, not a failure as the
> current code assumes:
> 
> [...]

Here is the summary with links:
  - [v2,1/3] Bluetooth: btmtk: Route firmware debug event to the diag channel
    (no matching commit)
  - [v2,2/3] Bluetooth: btmtk: fix wrong status for short WMT FUNC_CTRL events
    https://git.kernel.org/bluetooth/bluetooth-next/c/8fcc7afecb81
  - [v2,3/3] Bluetooth: btmtksdio, btmtkuart: validate WMT event length before struct access
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



