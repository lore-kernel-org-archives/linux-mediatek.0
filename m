Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BF1606A321
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 10:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LlgA7FtT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PNpKxx95
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v1Af1P1P1zbev8CYQkts6hQ+hHJRvEA7sX0TkjFdZnw=; b=LlgA7FtTeZTOuw
	dqg5bTHT83ZlbtbSZh07U7G6DNTB1uNWsNiZtgJgts0Af5VLIeHhhzqrrqpOfiO6fNWnSJ5tIZHqf
	yFkFElVW8WK4I0/4yjHkTKgGKkxvTWW//Bbs6wE2jeJvfo0h+bCg+Y1tieFa0kAvKWee3wrtgLVB5
	miDsrq3zkiSjrHKEKs9JzJ4LC0OFsuPGkKkhGgB49Bl28YXoGrZ5BhioJUFTrddFR+Xe4oOfONB40
	MSJAKHnq1n36gSR+hY9zwcN2pUzrECyGhMp8YHB9QRR3L0teaktiVgvfCcBiHqHW1Hkok3VzJF1cL
	ulJbRWmwnjlWF0gGDGew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ05w-0000000FxwD-2EOm;
	Sun, 08 Nov 2026 10:25:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ05u-0000000FxvO-1zD5;
	Sun, 08 Nov 2026 10:25:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F3A6402D5;
	Sun,  8 Nov 2026 10:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028201F0089F;
	Sun,  8 Nov 2026 10:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794133550;
	bh=v1Af1P1P1zbev8CYQkts6hQ+hHJRvEA7sX0TkjFdZnw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PNpKxx95tQplb5JM4+uP1TWChj9AbUwLPfociXRfICTLjmxCZsejaOIwW3ME4ie8R
	 HmFXofTZWu8JpP2MW43DM3+pDXHvi6hiHE17B7I/TUzxhh+fQSFDtDXxMreH/NWSsf
	 8cyq8mBKLjCB7wDMu2KOl38Yo9G8k7b6ZgzLer+FnR/iTPIzqX1Z+Xk2WojQCfGufD
	 OhfJx3Z+C4C0m1RWkFRA6otBVj/6VmSmnoH+K1jsr/xbUyatur17pMbrlWXNnaxLqf
	 kt7iny3qW7m7ps+H9EYZMM7+TR57qqGMlkwl9ookoNI6pROi4I6zbnHf0wMz3GF8FK
	 WyrbCqg68nmEA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 8509A2BDF03E;
	Sun, 08 Nov 2026 10:25:48 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
 linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v7 0/8] arm64: mediatek: Chromebook trackpad
 supply fixes
Message-Id: <179406980914.3424803.6201831446824678583.b4-ty@b4>
Date: Sat, 07 Nov 2026 16:43:29 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YiAPZOAOOLU5YOLoZTNzrcCrnz944fe3k/TYLXO5sfw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI++OmIHPW+E3fsCTvnHlePnZLv27l4DoQUyWulREY6x
 286EMfYUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgImoXGb4X8KwJZIzezXroi7x
 WYeFpnm4m6/L3b/AvFr18r6k/sLE8wz/M/1VJh02W1fszLh1RtSWKfKXivZ3yAftjY+w65/y++Y
 2ZgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 03 Nov 2026 12:37:24 +0800, Chen-Yu Tsai wrote:
> arm64: mediatek: Chromebook trackpad supply fixes
> 
> Hi everyone,
> 
> This is v7 of my Chromebook trackpad supply fixes and optimization
> series.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.5

Thanks!

[1/8] regulator: core: Add "enable and wait" functions
      https://git.kernel.org/broonie/regulator/c/9f9bcca6adc3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


