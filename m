Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0F606A31B
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2026 21:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OkAoVomm;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5oY4WV/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nLEWUgkRbsF7oNEnaZx263StjYEEJjVyC65+Hp2uOs8=; b=OkAoVomm3XqUEK
	sMsFdH90aKt4GFWZvPqwJfUzcwpR/8FU9aTO66ERfQ5/trbFdqwWlDJy9vIlsoonC4RUEwATDOYvF
	EI9c+DZktWDu+T9GYSJ7TN2JqjcHCobXUd9G9o5f6nX+AVG0HYF+f4BLsEr5MggWsIJ69ddVwjOb2
	IMLjZJ4y4Xf4d6F5dvQw5SQiQ+sOLBgIwPOvP6XdRnioTcE3pFaQ4VffUOulelz9PrjmnBWzMlbnC
	nDd5yA7A2ca38arYYXWFZufY9ExIyWdFF5x75FkR98fxiBR4alFmpm8H7LiwL1F8VLySGnltMnsA5
	QUeczoe7vgWrJeHeMaEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMNU-0000000GxsG-3uXr;
	Fri, 23 Oct 2026 21:00:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMNT-0000000Gxs3-3vl0
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Oct 2026 21:00:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A709043E8E;
	Fri, 23 Oct 2026 21:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADE51F031E0;
	Fri, 23 Oct 2026 21:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792789239;
	bh=nLEWUgkRbsF7oNEnaZx263StjYEEJjVyC65+Hp2uOs8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=F5oY4WV/MYIoB8DtbutuGey1E5RkNlzPIm5bcj+iBd1b+Z1zmbFYMNxTgS4fd2m0H
	 vMyQyMvFGrofPZNglfZ7rz7GmCAHtKN6CADc4VwQnJLo00bpr3ItC6leJn+vRt2AM/
	 6DYBp/TndlvxgyrY7+CHOgDpPg491aEN1g00xAghyVqRcll8AKE1opEs8o8rnkYZ84
	 4mivA9G/amFDb5+2QmXFQ/0P6FwCOj4I3FAQ1QH2kw9MIiz5RIsEIz1Hf3GusBDLKl
	 lFmvAGoC1fk86gTBCoaIoiQrKK8zBNkJYU6Cxu7z/r+8fhEjD1auS633xfpCKItRlA
	 sG41VWLKO8EXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 815C7391B157;
	Fri, 23 Oct 2026 21:00:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: btmtk: remove redundant memory barrier with
 helper
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <179278923809.1268720.9672691636919611279.git-patchwork-notify@kernel.org>
Date: Fri, 23 Oct 2026 21:00:38 +0000
References: <20261023093645.4669-1-abo@medichon.fr>
In-Reply-To: <20261023093645.4669-1-abo@medichon.fr>
To: Arnaud Bonnet <abo@medichon.fr>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, skhan@linuxfoundation.org,
 jkoolstra@xs4all.nl
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 23 Oct 2026 11:36:45 +0200 you wrote:
> The test_and_clear_bit() call works as a full memory barrier, thus it is
> not required to emit a barrier using smp_mb__after_atomic() before
> wake_up_bit().
> 
> Replace the whole sequences with test_and_clear_wake_up_bit(), which was
> introduced later in commit 52d633def56c ("sched: Add
> test_and_clear_wake_up_bit() and atomic_dec_and_wake_up()") as a wrapper
> for the correct sequence.
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: btmtk: remove redundant memory barrier with helper
    https://git.kernel.org/bluetooth/bluetooth-next/c/ebb8ee296578

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



