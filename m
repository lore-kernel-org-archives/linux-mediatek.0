Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59ABACAC5B8
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Oct 2025 21:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnvAclhyzfACP6neTwyQIp7fd3As2v01TdBA7OWPz7U=; b=elqluyNvJy5kJo55QMwAB3cCif
	f2QlGTAzJt5Cr9G3kYkahlzh6u4KJdYhEoMqiJHpdd5h5lVGuvGBPp7AoDvWhBOGpkAm9UGUYwyyd
	zkWLRQqLRc3g8hGGPpcZmmzHDF3ywpoBgI0PkXzBEC4wKZNmgysszUFcqY8jEKRg7vPrijPpGHl+g
	qsfDTNNpKrg5tIHQXZJedn/JR0fOYQAtu9QJZ2hp2FWR9uyD5mJ+xB3IIkJUQrk0ZVx9p6Mum+AwE
	1VxoqRBioRb2WaapaFjXIYbgab7mSnH5VIXqhTGQRRx5NKXMmuJd0Ztesbiu7+gRYKtFEx1r9cMeX
	0/Estjsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QZ9-0000000BI3T-3qcU;
	Thu, 02 Oct 2025 21:10:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QZ7-0000000BI2t-2SRo
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Oct 2025 21:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AD6244589;
	Thu,  2 Oct 2025 21:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD90C4CEF9;
	Thu,  2 Oct 2025 21:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759439416;
	bh=XBTBW5MbShLeNjyaGGxGiTwkBDscL9c+6tNM1Fn8R5s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AizsWIlrydvVxmamxrw4Pt8EBxsjt6mpndovqRAb7jQJE+1vu8hJKtvXP0rJGKHDl
	 NDyepjxOIZfDrRDwX6hKdgs6l3+4Ztnx91+BvvpjqW8alGC6qt6qI748KW1kIJRVGE
	 L22rNWZBcRLwr2cxovd8LQg/enSmsAXYzDeB16at2iyjLQJvMDB7UtES77fVrE5+7y
	 ddxc6cBb4GfZiWfjFmgcw/caHuxlfuqZOJ0wr8hgFpb5Gv+ELMmWGUEu7Hn7Fua9wn
	 bUok2OcfGh9IYZMLqskvd1r16vFR6zd0lN6EO9wqxyax4wQUAwtqlFqnLL1/5Fk04s
	 74yqi/D3KdXaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C2539D0C1A;
	Thu,  2 Oct 2025 21:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] Bluetooth: btmtksdio: Add pmctrl handling for BT
 closed
 state during reset
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <175943940824.3462061.7052492300555223526.git-patchwork-notify@kernel.org>
Date: Thu, 02 Oct 2025 21:10:08 +0000
References: <20250930053933.1685847-1-chris.lu@mediatek.com>
In-Reply-To: <20250930053933.1685847-1-chris.lu@mediatek.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, will-cy.Lee@mediatek.com, ss.wu@mediatek.com,
 steve.lee@mediatek.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_141017_650118_A6987F94 
X-CRM114-Status: UNSURE (   9.33  )
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

On Tue, 30 Sep 2025 13:39:33 +0800 you wrote:
> This patch adds logic to handle power management control when the
> Bluetooth function is closed during the SDIO reset sequence.
> 
> Specifically, if BT is closed before reset, the driver enables the
> SDIO function and sets driver pmctrl. After reset, if BT remains
> closed, the driver sets firmware pmctrl and disables the SDIO function.
> 
> [...]

Here is the summary with links:
  - [v1] Bluetooth: btmtksdio: Add pmctrl handling for BT closed state during reset
    https://git.kernel.org/bluetooth/bluetooth-next/c/739892687cf5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



