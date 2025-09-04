Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3CACA1015
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Sep 2025 20:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rv6sJyqYaLxawlDxQF8WKA2KAKHCz6viPgD1O22Zu70=; b=t8gzFH8xCz9RddjO647RvCfBfg
	CYLrSMCessItNJ7uocmtWP31Ewxz8Gr+FK43E72pWW8a8wQtc0sCd/jljfckHiNGrqp0FQZ4quACf
	a/Orw9sk0PMwjZiwBenPpwnR2sdyyVvsmwcAofP7jw6DlQcrpvzCPNOyVlTYoW9cUKx2xHR0Doelb
	z3NXn1+jzs3n0rSQLa8QNjD0ZNphi2a8oe+jXX5R+xPu66ToK9+gsw067BmgbEpHS/k42xutLU04A
	xJocTkDpRJo4w7/iav6GNC7jQUDvUA6TvMxxcIi0sCKYidKZD5ghyC/5XHQEh2LBlyebBPSb01mP4
	bICbaPrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGzy-0000000EPaY-2I4g;
	Thu, 04 Sep 2025 20:56:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCqZ-0000000Cwmt-3n5H
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Sep 2025 16:30:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3794C448BC;
	Thu,  4 Sep 2025 16:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140D6C4CEF0;
	Thu,  4 Sep 2025 16:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757003403;
	bh=Zuvvt/kT0BpDisJoUGyAuUxPhBEm/+bVuMXkanyohao=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZS7Oi+gDz4ErMUUJMmlrAvyj+bj3iYWjwNzmcKBos/EMbHykQrfCe7tiLOOjAxnvz
	 V5m4aNZJxTfz5MDan+JWBm8FEyjwBzHpAXRm4WPrSPUPTMMAWxlCWtj93r5nSeZCER
	 qQSY7aZSMXUvBLZDeOIRWH78wgWcNasZrcTgLVRAJ0RklDR5RXNR9gmrXwMlmn5vPG
	 EEzmXvYTJEzEc7Uy9jNAhNds86OJ9ZXGenxMGehqe+MJAukblTiE+NIfn9FT36Fh+B
	 HwvsXXsCTy6oG+Y1jiES+VoZPeVCW0lxsaJSzFw9kQg6MTXs8eYId+wf4Kduq7ve2D
	 twNsMB43S3Jbw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CBE383BF69;
	Thu,  4 Sep 2025 16:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] Bluetooth: Fix build after header cleanup
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <175700340725.1874432.7709997190612844259.git-patchwork-notify@kernel.org>
Date: Thu, 04 Sep 2025 16:30:07 +0000
References: <aLhLTiIMRnjHfvOn@mozart.vkv.me>
In-Reply-To: <aLhLTiIMRnjHfvOn@mozart.vkv.me>
To: Calvin Owens <calvin@wbinvd.org>
Cc: luiz.dentz@gmail.com, pmenzel@molgen.mpg.de, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, luiz.von.dentz@intel.com,
 oe-kbuild-all@lists.linux.dev, marcel@holtmann.org, sean.wang@mediatek.com,
 linux-mediatek@lists.infradead.org, naresh.kamboju@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_093003_971240_9D77ACED 
X-CRM114-Status: UNSURE (   8.74  )
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

On Wed, 3 Sep 2025 07:06:06 -0700 you wrote:
> Some Kconfig dependencies are needed after my recent cleanup, since
> the core code has its own option.
> 
> Since btmtksdio does not actually call h4_recv_buf(), move the
> definitions it uses outside the BT_HCIUART_H4 gate in hci_uart.h to
> avoid adding a dependency for btmtksdio.
> 
> [...]

Here is the summary with links:
  - [v3] Bluetooth: Fix build after header cleanup
    https://git.kernel.org/bluetooth/bluetooth-next/c/006c974955d0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



