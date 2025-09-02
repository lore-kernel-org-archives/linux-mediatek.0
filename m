Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860F6CA1007
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Sep 2025 21:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYIh2nHyQUGTMpNdgvtSglDh9liQtH4ypop4ui4mmOs=; b=PLellwR2lFT437sUEc13XQ83/t
	UrwHEKhpO2lhiD1Dsi2csh5BIs++Su/azxxbjffwGCZEfWwLSEhH85iEoMx5WMFO2zb5RcEsIHYYf
	ygMQ5XP4RYCgAcO6ou4FXgN/wOAWgxmrtTXp0BkJzkajnGkgtzdzVfFs87GwZiUnVWGQEIvaaR3m4
	Q5qEUpR8ur+GSWhDKml4E3QA6Nwuy0SiVuJwMjFGfCPGIXrwHO2U4n/HNISZ1qSm6orRmt2HpWQCH
	RRoNTI1zL/HWpkj/NScxO7jvTNfI6qcmDR1cQGQJ7GQ2MieUNsRbb004jRYfv/0LWo3COW7ToD1k8
	97zTvpHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYnS-00000002CR5-40Pe;
	Tue, 02 Sep 2025 21:44:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTjm-00000000v9C-2kat
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Sep 2025 16:20:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF67943857;
	Tue,  2 Sep 2025 16:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856BDC4CEED;
	Tue,  2 Sep 2025 16:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756830001;
	bh=uR6ooEkTfiD1ML/5tcd68skbsYL3bPOW4q+hFyEKqcs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PQQibLyVN0V6e3yasdOYS0LVKnBGYlkSYi65+QPeCLXceZtyqZEjWD1RJeIDb2lLY
	 YaYUcXStaTbrFsfkeRhr8VOBF94d05H30JnklQhD820pev/0BSkeaUKktBG5VQs9wF
	 qTBICCh6D6l5Ul84+hYAzlVBVxmk2R7csjWgwLczNhGpQRq6QJac7yNxstlCRtM0RF
	 4Nkjej8yLIhXGidIPCk/tqwSS34cy6ARi/3J4ADoMvWuB7hYWLOpxD2vxHno6KHTR8
	 bJ//7Mj+CjaTGZXrkLIxQPYH8Zjxf7Q9ZG4RaNHVQqojX6wu7Y9f39hdGP0gbQphWo
	 yhadePuPvi6nA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34408383BF75;
	Tue,  2 Sep 2025 16:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: Fix build after header cleanup
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <175683000705.361492.473758022048124463.git-patchwork-notify@kernel.org>
Date: Tue, 02 Sep 2025 16:20:07 +0000
References: <aLcQsE3x9o4BzXxp@mozart.vkv.me>
In-Reply-To: <aLcQsE3x9o4BzXxp@mozart.vkv.me>
To: Calvin Owens <calvin@wbinvd.org>
Cc: luiz.dentz@gmail.com, pmenzel@molgen.mpg.de, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, luiz.von.dentz@intel.com,
 oe-kbuild-all@lists.linux.dev, marcel@holtmann.org, sean.wang@mediatek.com,
 linux-mediatek@lists.infradead.org, naresh.kamboju@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_092002_717781_074B9B69 
X-CRM114-Status: UNSURE (   9.05  )
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

On Tue, 2 Sep 2025 08:43:44 -0700 you wrote:
> Some Kconfig dependencies are needed after my recent cleanup, since
> the core code has its own option.
> 
> Since btmtksdio does not actually call h4_recv_buf(), move the
> definitions it uses outside the BT_HCIUART_H4 gate in hci_uart.h to
> avoid adding a dependency for btmtksdio.
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: Fix build after header cleanup
    https://git.kernel.org/bluetooth/bluetooth-next/c/16ebf6c26de5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



