Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DA3606A31A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2026 14:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x14GsKJ3;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O8bYH50x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jxiJPiS+FyVXqYg01CNFt26Q4gP0Sg2O88ZhesBKgJ0=; b=x14GsKJ3/EzCKG
	uN+6+onmVEQV36OqiLausGg7CWEVeI30v/+P7nf6I4uuyyCalH3Pythin8XjJ5AV5jKpRhtIDfLZS
	uRU7R/TduX98iH00Yv6Tpkt29HdHQvGfqHDKPihH4C3orYpsDEHvH+ModavtP/COUTLCDYHJb5V8R
	flkH5yoS3P2ubNXVqv8rA8sC/qTuDyE+VNYqVML6ZR6ZC/yOwvV+ljISgK3UJoaDLWb24zG8e5EGN
	/htvxBUNsfT3aroQVwMoLKNSJS6RNOMfAamxRdez00cQ7Wzi54igZG9O80dOV8jeEBw5cu6U5vavE
	jVBh5/2uMsnz4GcvQZWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMn9T-0000000BnzX-0Q1w;
	Fri, 30 Oct 2026 14:00:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMn9R-0000000Bnyx-11xU;
	Fri, 30 Oct 2026 14:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D53960617;
	Fri, 30 Oct 2026 14:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F731F00A16;
	Fri, 30 Oct 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793368811;
	bh=jxiJPiS+FyVXqYg01CNFt26Q4gP0Sg2O88ZhesBKgJ0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=O8bYH50x/wboQFr9ls0elqlKJM26sydSWdpoDJ5Efag8A5MZS1wK7DAHQyncSFLiL
	 wRKHuiSdS2Ue5vgjz1EmX2A777abhp6YJeSL9AlsPyJuMBcXtjKXIC9A7/cTyY3+tU
	 ycJu8SJGaH2bk6HoPVh3Ta0EQXoTmupugX6fVZR7p23DnQyHeP7kjWS+ScehQVqzU6
	 /s4SpjwYJRzea+avpLb/454NuvXzkK7UqCwPCvVfBbl/oIk5pFM5aNblysEDNDshhX
	 NjmXBpfnAyyRTYb6sb9TrDqcCXZgVu4wRtWOzLP3gl22kkYd2elg0q0m30E8y6wVID
	 ewcKwQ04K/ilQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA32A3800465;
	Fri, 30 Oct 2026 14:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtk: fix error handling in
 btmtk_usb_isointf_init()
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <179336881029.1091505.9199301543471972912.git-patchwork-notify@kernel.org>
Date: Fri, 30 Oct 2026 14:00:10 +0000
References: <20261029224022.1233751-1-ismailtarim7@gmail.com>
In-Reply-To: <20261029224022.1233751-1-ismailtarim7@gmail.com>
To: Ismail Tarim <ismailtarim7@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
 luiz.dentz@gmail.com, chris.lu@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 30 Oct 2026 01:40:15 +0300 you wrote:
> btmtk_usb_isointf_init() submits the ISO interrupt IN URB and then
> sends the vendor command 0xfd98. If that command fails, the function
> returns an error without killing the URB it has just submitted. The
> caller then leaves BTMTK_ISOPKT_RUNNING clear, so the driver treats the
> ISO path as inactive while its RX URB is still in flight, and
> btmtk_usb_suspend() skips killing it. Kill the anchored URBs on this
> path, as the URB submission failure path already does.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btmtk: fix error handling in btmtk_usb_isointf_init()
    https://git.kernel.org/bluetooth/bluetooth-next/c/215ef299184d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



