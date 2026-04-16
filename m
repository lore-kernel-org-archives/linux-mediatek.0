Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA02FF8D75F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2026 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kev8OfCOazUH+qIDTLa9ebYXK7y8rmISHnJHqZCKjhI=; b=4ze0BJZuvWJ3fQa4urVpmpQX8y
	ZU5E/zYhVC6n1FKh4Ht7Rahzy8OYE8ZK0qY8dOiVtdqAkYTFr9cuQcKTgmHPnlIpowUEqFG6zoLZL
	KiKUxzuh8664yxt5l2/DedTcEgKfp6B4GAGmeXedJ6RcsjAtfDX4TIeSC/hiXPUFW3N/hVxBbQij/
	5gtLKW2C+DAvNe7cyW6qvTDIuMsKdyji55tINS5lO0orlnCGGLWIhKU8jfQG/09hA1CsmmxZtDjY5
	JyMq/0CVhjjjhiA9TZ71QN2Wb+JDzE85ZUzOMQR7QYmXhLnJ48NR0ud0Q7dx3h7IaBZZn9r4EMQku
	x/mNo1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDPSL-00000002f4a-22yu;
	Thu, 16 Apr 2026 16:20:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDPSJ-00000002f4Q-1WOM
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Apr 2026 16:20:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53A5A60126;
	Thu, 16 Apr 2026 16:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F5EC2BCAF;
	Thu, 16 Apr 2026 16:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776356438;
	bh=i4QTJp6gfQ6MsI0r1QtFdih9ZbHFZKrzr7vv0eudWf0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ee4GYH1OcRa7DsyCxEmZUvA84gGsjvS+gM93qvXBSXBNzKeyI5DZItZJaza6eMtkx
	 1QzPknArtBWexvc17KVia73PeybCnuQY2FNvfXUEgocVhE4j11xa8PvGuUMelVlsiq
	 aFOAyB6kPrdmvMMs6Pc+Po4d07L03DzN0WXI3hcBddXh+ywtYJUWH03AvyRNQM3wjN
	 2pwcqW1v9Me6INg5ycjmpuBuFfnjFPgRfPmMHHrEmTFNNRmKMOnPJdEM7K2aO/jtzs
	 twu8OjDojoTyEIgywS2fLCS0g5gcw8ip5oAET5UlaC/ttXEzWHkOADcgyyBFwHyC8M
	 XUw6DML1ZN1Pw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EC4380AA67;
	Thu, 16 Apr 2026 16:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] Bluetooth: btmtk: add event filter to filter specific
 event
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <177635640655.3303094.2277821963642028002.git-patchwork-notify@kernel.org>
Date: Thu, 16 Apr 2026 16:20:06 +0000
References: <20260416111607.3161032-1-chris.lu@mediatek.com>
In-Reply-To: <20260416111607.3161032-1-chris.lu@mediatek.com>
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

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 16 Apr 2026 19:16:07 +0800 you wrote:
> Add an event filter to filter event with specific opcode to prevent BT
> stack from receiving unexpected event.
> 
> Event with opcode 0xfc5d is generated when MediaTek's Bluetooth enable
> firmware logs and is not expected to be sent to userspace.
> 
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> 
> [...]

Here is the summary with links:
  - [v4] Bluetooth: btmtk: add event filter to filter specific event
    https://git.kernel.org/bluetooth/bluetooth-next/c/b57b0f27cb05

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



