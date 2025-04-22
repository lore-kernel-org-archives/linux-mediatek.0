Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36732C369D8
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Apr 2025 15:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTKf8+H3Th8cO9MLGzCdQobHATUhsx4CnQGDz8OIdU0=; b=ZjGnjc+qEf2Hk1IcccHQTJ5Oy1
	ZV1ZGczoweFgWSYi/jn0x/WctMlC4MtQvIjlv6z8afvlRO3FNwi2zhFdOx+ehRS6pcTEjw8g0ju/H
	KdCgnYkZcDGQ/00TEKz6715wsQRIU+vUxr1FwY9uEgx9mns9YHsUKt1L5JuLRPl6gTCOGGCrkXD4G
	pdf3C11e4UYugW9W5Vv4AFfLiLnfs/Cvn0Iew7srHIN/8tMpMaBQ6ipViLwIkB9fkIPDPORi3AAfX
	Ptq0JYL8YbPBARQjM/YEoH/JHp1mPuePN9fo58oqE88T7dbh2X2lAAhLtB1c1z6o8YDt3UaSeDIaE
	8M7H1AyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FB0-00000007clp-06eP;
	Tue, 22 Apr 2025 15:04:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DhG-00000007IwI-0EJd
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Apr 2025 13:29:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B30B5438D4;
	Tue, 22 Apr 2025 13:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12137C4CEE9;
	Tue, 22 Apr 2025 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745328597;
	bh=CL2ckKdWyQEF03LN3BXjBPax5VKKfrOO3/dC6q0A6Wc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qgVoomws5FoccIq04RK627QjiVSuWooOhRpAh4HGP9GEm7ab8JFMOtKPZ11j55qdV
	 zO7iYO69Hg1OLxv8oTf7+dxdDEZu7XVgspN1qSwi91elD9garjcQ0xfa9v0kBbSXEj
	 ceJxhYaO7L7CKXug1zS2xTads/zg6RtA/yZqrXfx4qYEhstwt/5imF6h1kRu9CzPsS
	 d0sLlmFPifC7Z+0u/w4x4za1zM5TMIRSpnEjJ4o0MYjnyvznvX/ew0ddnrkGzrQURJ
	 rAgwvcPN9OnC1nR0Y4Ts8QvMkdtBzlWZoqkvKD4E7K+Zbjm4kLk+8vu/gslanveD0f
	 0/qg8JeDG08GA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDB0380CEF4;
	Tue, 22 Apr 2025 13:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] Bluetooth: btmtksdio: ensure btmtksdio_close is
 executed before btmtksdio_remove
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <174532863556.1909182.13691276348024740432.git-patchwork-notify@kernel.org>
Date: Tue, 22 Apr 2025 13:30:35 +0000
References: <20250422012156.586600-1-chris.lu@mediatek.com>
In-Reply-To: <20250422012156.586600-1-chris.lu@mediatek.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, jiande.lu@mediatek.com, will-cy.lee@mediatek.com,
 ss.wu@mediatek.com, steve.lee@mediatek.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_062958_113962_B6B63CD2 
X-CRM114-Status: UNSURE (   8.68  )
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 22 Apr 2025 09:21:54 +0800 you wrote:
> If Bluetooth SDIO card is unexpectedly removed due to hardware removal
> or SDIO issue, it is possible for remove to be called before close.
> If an interrupt occurs during this process, it may cause kernel panic.
> Therefore, it is necessary to ensure that close is executed before
> remove to stop interrupts and cancel txrx workqueue.
> 
> Chris Lu (2):
>   Bluetooth: btmtksdio: Check function enabled before doing close
>   Bluetooth: btmtksdio: Do close if SDIO card removed without close
> 
> [...]

Here is the summary with links:
  - [v2,1/2] Bluetooth: btmtksdio: Check function enabled before doing close
    https://git.kernel.org/bluetooth/bluetooth-next/c/04c96a7ace25
  - [v2,2/2] Bluetooth: btmtksdio: Do close if SDIO card removed without close
    https://git.kernel.org/bluetooth/bluetooth-next/c/e0af21b30c82

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



