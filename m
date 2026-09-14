Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCB1C88E72
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 14:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFD2D4SPUxeBlh2KahNZJGsfd6oAGLjB0oeZGtqFbpE=; b=RRPgDVuG6Rtzj7CKGxvacpVNt2
	PkbDHWAVXG8Dx+2Ok8sX6TPLmBhJUO7cmdVrJVPUKo9sZlC2+H04SQsHJiGBz2PvAl+jTIcc2nMHF
	81yOO2XyKMJcsYAQbbESGT9DtODDPc0EhLc4YBhY6dxW3xzR507BPatO+sIWseCs3irW77+bLzWvZ
	WTH5jccdfTNw7aynuPPJjXYQ87jrgfKHI6Vlr4MlftB1TYQOz8vlCaZO4rfMNK7+mDO58VuINFq1Y
	Vo7dhK2hljcMPjWlmGT0Ne624XU9K1lwjCSDiq5zEzWqEmlLFSXC8Ag7IOs/v+aDuVi/vNazzd/RT
	651dVqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67iM-00000003zZc-0Z88;
	Mon, 14 Sep 2026 14:31:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67iL-00000003zZ3-0VgB
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 14:31:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 38CF3601FB;
	Mon, 14 Sep 2026 14:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E593A1F000FF;
	Mon, 14 Sep 2026 14:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789396279;
	bh=EFD2D4SPUxeBlh2KahNZJGsfd6oAGLjB0oeZGtqFbpE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=G3nRC8BUmc6wcIVIgTfqQ38RRfmqa0aSZIrNF9zmIcvHrs9JXDVLHgSu+qrGgjsu2
	 OjNqa5WwRU/j8jsQbzh0y3kjhsMe5hf6hiVX+dg8rgq/0C3XcBtYF7vV1oC4iuyvH9
	 Cc9EEb+DnFG1keqZOVaMFnqV5AtZTwzPZ65RzZVAaJA1jmG3WKw3Ht/yIZDjEeePGt
	 yH3znpn7jL+Lp1ilrTG+6PEsaO6M6rlFyoOcQNrKKWYjujDewF7+eCjGk/7mXa56q0
	 EaBC1WtP0yKz8Q62gLC0tn9VOzErm3Bb25pLNoQF0WgSbhzCj/dixeMWG1DHPkpNi/
	 MLXtQGokG+HQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56BA23924A67;
	Mon, 14 Sep 2026 14:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtksdio: Fix spurious ownership error logs
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178939621487.604238.1920363248100368230.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 14:30:14 +0000
References: <20260914094631.3222026-1-tzungbi@kernel.org>
In-Reply-To: <20260914094631.3222026-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-bluetooth@vger.kernel.org,
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 14 Sep 2026 09:46:31 +0000 you wrote:
> In btmtksdio_fw_pmctrl(), if an early operation fails (like clearing
> the mailbox ACK), it jumps to the `out:` label and spuriously prints
> "Cannot return ownership to device".
> 
> Evaluate the ownership return errors locally to ensure the error log is
> only printed if the actual ownership transaction fails.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtksdio: Fix spurious ownership error logs
    https://git.kernel.org/bluetooth/bluetooth-next/c/382fe279b7de

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



